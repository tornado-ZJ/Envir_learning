lib996:include("Script/serialize.lua")

local filename = "押镖表单"

--活动基本信息表
local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_biaoche.lua")

local _activityid       = 3                                         --活动id

local guiguID           = 2                                         --cfg_guigufuben 表内对应的活动id

local _timer_id = 20002                                             --个人定时器id

local _activity_max_time = 60*60                                    --活动持续时间

local _npcidx           = _cfg[1].tonpc[1][1]                       --接镖Npc
local _endnpcidx        = _cfg[1].tonpc[1][2]                       --交镖Npc

local _mapId = _cfg[1].mapid[1][1]                                  --活动地图

local monidx_cfg = {}                                               --镖车怪的idx表
for i, v in ipairs(_cfg) do
    monidx_cfg[v.mid] = i
end

local _varg_starttime       = "SSJ_yabiao_startTime"                --活动开始时间戳
local _varg_endtime         = "SSJ_yabiao_endTime"                  --活动结束时间戳

local _var_yabiao           = VarCfg.SSJ_yabiao_num1                --今日押镖次数变量名
local _var_jiebiao          = VarCfg.SSJ_yabiao_num2                --今日劫镖次数变量名

local _var_car_killer       = "SSJ_car_killer"                      --劫镖对象

local _var_auto_flag        = "SSJ_yabiao_auto_flag"                --自动押镖标识
local _var_auto_temp        = "SSJ_yabiao_auto_temp"                --自动押镖临时标记

local auto_state = {
    closing         = 0,        --关闭中
    opening         = 1,        --进行中
}

local rich_text = {
    --押镖
    ["yabiao_repeat"]               = '{"Msg":"<font color=\'#ff0000\'>请勿重复接镖</font>","Type":9}',
    ["yabiao_not"]                  = '{"Msg":"<font color=\'#ff0000\'>未接镖，无法交付</font>","Type":9}',
    ["yabiao_range"]                = '{"Msg":"<font color=\'#ff0000\'>镖车距离过远，无法交付</font>","Type":9}',
    ["yabiao_count"]                = '{"Msg":"<font color=\'#ff0000\'>今日押镖次数已用光</font>","Type":9}',
    ["yabiao_autoOpening"]          = '{"Msg":"<font color=\'#ADFF2F\'>自动押镖已开启</font>","Type":9}',
    ["yabiao_autoClosing"]          = '{"Msg":"<font color=\'#ff0000\'>自动押镖已关闭</font>","Type":9}',
    ["yabiao_warning"]              = '{"Msg":"<font color=\'#ff0000\'>注意!与镖车距离过远</font>","Type":9}',
    ["yabiao_npcRange"]             = '{"Msg":"<font color=\'#ff0000\'>与镖师距离过远</font>","Type":9}',
    ["yabiao_click"]                = '{"Msg":"<font color=\'#FFFFFF\'>再次点击地面退出自动押镖状态</font>","Type":9}',
    ["yabiao_finish"]               = '{"Msg":"<font color=\'#00FF00\'>奖励已发送至邮箱,请注意查收!</font>","Type":9}',
    ["yabiao_giveup"]               = '{"Msg":"<font color=\'#00FF00\'>已放弃本次押镖任务</font>","Type":9}',
}
-------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
--是否已接镖
local function _getEscortObj(actor)
    local persnum = lib996:getbaseinfo(actor, ConstCfg.gbase.pets_num)
    for i = 0, persnum - 1 do
        local monobj = lib996:getslavebyindex(actor, i)
        local monidx = lib996:getbaseinfo(monobj, ConstCfg.gbase.idx)
        for _,cfg in ipairs(_cfg) do
            if cfg.mid == monidx then
                return monobj, cfg
            end
        end
    end
    return false
end

--是否不在活动地图
local function _isNotInMap(actor)
    local cur_mapId = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end
-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
function countdown(actor)
    --检查有镖车
    local cartobj = _getEscortObj(actor)
    if cartobj then
        local x,y = lib996:getbaseinfo(cartobj, ConstCfg.gbase.x),lib996:getbaseinfo(cartobj, ConstCfg.gbase.y)
        local info = {}
        info[1] = lib996:getbaseinfo(cartobj, ConstCfg.gbase.curhp)
        info[2] = lib996:getbaseinfo(cartobj, ConstCfg.gbase.maxhp)
        info[3] = x
        info[4] = y
        info[5] = lib996:getbaseinfo(cartobj, ConstCfg.gbase.name)
        lib996:showformwithcontent(actor,"", "TaskWnd.CreatYabiaoBtn("..serialize(info)..")")

        local flag = lib996:getint(0,actor,_var_auto_flag)
        print("countdown",flag,tostring(flag == auto_state.opening))

        if flag == auto_state.opening then
            local range = 2
            if not FCheckRange(actor, x, y, range) then
                lib996:gotonow(actor,x,y)
            end
        else
            local range = _cfg[1].Xunlu
            if not FCheckRange(actor, x, y, range) then
                lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_warning))
                lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_warning))
            end
        end
    else
        lib996:setint(0,actor,_var_auto_flag,auto_state.closing)
        lib996:setofftimer(actor, _timer_id)
        lib996:showformwithcontent(actor,"", "TaskWnd.DeletYabiaoBtn()")
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--进入地图/前往押镖
function RequestEnter(actor)
    lib996:mapmove(actor, _mapId,70,124,5)
end

--接镖
function RequestEscort(actor, _type)
    _type = tonumber(_type)
    --检查与npc的距离
    if not FCheckNPCRange(actor, _npcidx) then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_npcRange))
        return
    end
    --检查次数
    local count = lib996:getint(0,actor, _var_yabiao) - 1
    if count < 0 then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_count))
        return
    end

    --获取配置
    local cfg = _cfg[_type]
    if not cfg then return end

    --检查已接镖
    if _getEscortObj(actor) then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_repeat))
        return
    end
    --检查货币
    if cfg.cost then
        local name, num = Player.checkItemNumByTable(actor, cfg.cost)
        if name then
            lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.not_item, name))
            return
        end
    end
    --召唤镖车
    local monName = lib996:getmonbaseinfo(cfg.mid, ConstCfg.stdmoninfo.name)
    local mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    local x = lib996:getbaseinfo(actor, ConstCfg.gbase.x)
    local y = lib996:getbaseinfo(actor, ConstCfg.gbase.y)
    local mons = lib996:genmon(mapid, x, y, monName, 3, 1)
    if not mons then return end
    local mon = mons[1]
    lib996:setmonmaster(mon, actor)
    lib996:darttime(actor, _cfg[1].Time, _cfg[1].Xiaoshi)
    lib996:dartmap(actor, _cfg[1].End[1], _cfg[1].End[2], _cfg[1].Xunlu)

    --接镖自动押镖
    lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_autoOpening))
    lib996:setint(0,actor,_var_auto_flag,auto_state.opening)

    --写数据库
    lib996:setint(0,actor, _var_yabiao, count)

    --扣货币
    if cfg.cost then
        Player.takeItemByTable(actor, cfg.cost, "接镖")
    end

    lib996:setontimer(actor, _timer_id, 1, 0)

    countdown(actor)
end

--交镖
function RequestFinish(actor)
    --检查与npc的距离
    if not FCheckNPCRange(actor, _endnpcidx) then return end
    --检查有镖车
    local cartobj, cartcfg = _getEscortObj(actor)
    if not cartobj then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_not))
        return
    end
    --检查镖车是否在指定区域
    local end_x, end_y, end_range = _cfg[1].End[1], _cfg[1].End[2], _cfg[1].End[3]
    if not FCheckRange(end_x, end_y, end_range, cartobj) then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_range))
        return
    end
    local carName = lib996:getbaseinfo(cartobj,ConstCfg.gbase.name)

    --清理镖车
    lib996:killmonbyobj(actor,cartobj, false,false,false)

    --给奖励
    local name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)
    _Fsendmail(name,_cfg[1].mailId_1,cartcfg and cartcfg.reward or nil,carName)

    --回复
    lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_finish))

    countdown(actor)
end

--放弃押镖
function RequestGiveup(actor)
    local cartobj,cartcfg = _getEscortObj(actor)
    if cartobj then
        --清理镖车
        local carName = lib996:getbaseinfo(cartobj,ConstCfg.gbase.name)
        local name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)
        _Fsendmail(name,_cfg[1].mailId_4,cartcfg and cartcfg.renounceReward,carName)

        lib996:killmonbyobj(actor,cartobj, false,false,false)
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_giveup))

        countdown(actor)
    end
end

--请求开启/关闭自动押镖
function RequestAuto(actor)
    local cartobj = _getEscortObj(actor)
    if not cartobj then return end
    local flag = lib996:getint(0,actor,_var_auto_flag)
    if flag ~= auto_state.opening then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_autoOpening))
        lib996:setint(0,actor,_var_auto_flag,auto_state.opening)
    else
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_autoClosing))
        lib996:setint(0,actor,_var_auto_flag,auto_state.closing)
    end
end
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
--每日凌晨 与 每日第一次登录 调用
local function _goDailyUpdate(actor)
    lib996:setint(0,actor,_var_yabiao,_cfg[1].cishu)
    lib996:setint(0,actor,_var_jiebiao,_cfg[1].cishu2)
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, filename)

--登陆触发
local function _onLoginEnd(actor,logindatas)
    -- _goDailyUpdate(actor)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, filename)

--击杀镖车触发
local function _onKillCar(actor, monster,monsteridx)
    if _isNotInMap(actor) then return end

    if not lib996:getbaseinfo(actor, ConstCfg.gbase.isplayer) then return end

    local index = monidx_cfg[monsteridx]

    if not index then return end

    local cfg = _cfg[index]
    if not cfg then return end

    local name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)
    local role = lib996:getbaseinfo(monster, ConstCfg.gbase.userobj)

    lib996:setint(0,role,_var_car_killer,name)

    local hasNum = lib996:getint(0,actor,_var_jiebiao) - 1

    if hasNum < 0 then return end

    lib996:setint(0,actor,_var_jiebiao,hasNum)

    local roleName = lib996:getbaseinfo(role,ConstCfg.gbase.name)

    local carName = lib996:getbaseinfo(monster,ConstCfg.gbase.name)

    _Fsendmail(name,_cfg[1].mailId_3,cfg.robreward,roleName,carName,hasNum)
end
GameEvent.add(EventCfg.onKillCar, _onKillCar, filename)

--丢失镖车触发
local function _onLoserCar(actor, monster,monsteridx)
    if _isNotInMap(actor) then return end

    if not lib996:getbaseinfo(actor, ConstCfg.gbase.isplayer) then return end

    local index = monidx_cfg[monsteridx]

    if not index then return end

    local cfg = _cfg[index]
    if not cfg then return end

    local name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)

    local carName = lib996:getbaseinfo(monster,ConstCfg.gbase.name)
    local killer = lib996:getint(0,actor,_var_car_killer)

    _Fsendmail(name,_cfg[1].mailId_2,cfg.failreward,carName,killer)
end
GameEvent.add(EventCfg.onLoserCar, _onLoserCar, filename)

--NPC点击触发
local function _onClicknpc(actor,npcid)
    if npcid == _npcidx then
        --镖师
        local var_yabiao = lib996:getint(0,actor, _var_yabiao)          --剩余押镖次数
        local var_jiebiao = lib996:getint(0,actor, _var_jiebiao)        --剩余劫镖次数
        lib996:showformwithcontent(actor,"F/押镖面板", "Yabiao#"..var_yabiao.."#"..var_jiebiao)
    elseif npcid == _endnpcidx then
        --钱庄老板
        local _,cartcfg = _getEscortObj(actor)
        local idx = cartcfg and cartcfg.idx or 0
        lib996:showformwithcontent(actor,"F/交镖面板", "Yabiao#"..idx)
    end
end
GameEvent.add(EventCfg.onClicknpc, _onClicknpc, filename)