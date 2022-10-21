lib996:include("Script/serialize.lua")

local filename = "免费会员表单"

local _var_name_Lv = "SSJ_freeVip_level"                                    --等级变量名

local _var_name_task = "SSJ_freeVip_task_"                                  --任务变量前缀

local _var_name_gifts = "SSJ_freeVip_gifts_"                                --礼包购买变量前缀

local _var_name_temp_info = "SSJ_freeVip_tempInfo"                          --临时信息表(json,登陆时初始化)

--目标任务类型 cfg_goals 表 type 字段
local _target_types = {
    levelup         = 105,      --达到角色等级
    takeonequip     = 340,	    --穿戴指定数量指定等级的装备
    killmon         = 335,	    --打到指定等级指定数量的怪物
    zhuansheng      = 119,	    --达到转生等级
    shenshou        = 552,      --神兽之力
    baowu           = 550,      --宝物大师
}

--常规装备位,检索身上装备时用到
local common_equip_pos = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 55}

local _gifts_var_name = {}                                                  --礼包变量名表

local gifts_info = {}                                                       --礼包领取情况

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_xiuxian.lua")            --免费会员表

for i,var in ipairs(_cfg) do
    table.insert(_gifts_var_name,_var_name_gifts..i)
    table.insert(gifts_info,0)
end

local _killMonNum_var_name = _var_name_task.._target_types.killmon

local _takeonEquips_var_name = _var_name_task.._target_types.takeonequip

local cfg_goals = lib996:include("QuestDiary/cfgcsv/cfg_goals.lua")         --免费会员任务表

local _cfg_goals = {}

for key, val in pairs(cfg_goals) do
    _cfg_goals[key] = {
        type = val.type,count = val.count,goInfo = val.goInfo,
        parentType = val.parentType,link = val.link,
    }
    if type(val.param) == "table" then
        _cfg_goals[key].param = {}
        for _, value in pairs(val.param[1]) do
            _cfg_goals[key].param[value] = 1
        end
    else
        _cfg_goals[key].param = val.param
    end
end

local freeVip_Lv = 0                                                        --角色当前免费会员等级

local task_info = {}                                                        --任务完成详情

local state = false

-- -------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
--判断是否满足任务条件
local function _checkTargetFreeVip(targettype, actor, arg1)
    task_info = {}

    local temp = lib996:getstr(0,actor,_var_name_temp_info)
    if temp ~= "" then
        task_info = unserialize(temp)
        if type(task_info) ~= "table" then
            task_info = {}
        end
    end

    freeVip_Lv = lib996:getint(0,actor, _var_name_Lv)

    local cfg = _cfg[freeVip_Lv + 1]
    if cfg then
        for i, v in ipairs(cfg.goal[1]) do
            if cfg_goals[v].type == targettype then

                if task_info[i] == 1 then return end --已完成

                if targettype == _target_types.takeonequip then
                    -- print("穿戴装备判断,_itemOBJ:"..arg1)
                    --穿戴装备判断
                    local _itemidx = lib996:getiteminfo(actor, arg1, ConstCfg.iteminfo.idx)

                    -- print("穿戴装备判断,_itemidx:".._itemidx)

                    temp = lib996:getstr(0,actor, _takeonEquips_var_name)

                    -- print("temp:"..temp..";")

                    local takeonequips = temp ~= "" and unserialize(temp) or {}

                    --LOGDump(takeonequips,"takeonequips")

                    if type(takeonequips) ~= "table" then takeonequips = {} end

                    for _, itemobj in ipairs(takeonequips) do
                        if itemobj == arg1 then return end
                    end
                    if _cfg_goals[v].param[_itemidx] then
                        --print("穿戴装备判断2,_itemidx:".._itemidx)
                        table.insert(takeonequips,arg1)
                        lib996:setstr(0,actor, _takeonEquips_var_name,serialize(takeonequips))
                        SyncResponse(actor)
                    end
                elseif targettype == _target_types.killmon then
                    --怪物击杀判断
                    if _cfg_goals[v].param[arg1] then
                        --print("怪物击杀判断,monidx:"..arg1)
                        local killNum = lib996:getint(0,actor, _killMonNum_var_name)
                        lib996:setint(0,actor,_killMonNum_var_name, killNum + 1)
                        --print("进入计数,当前击杀数:"..lib996:getint(0,actor,_killMonNum_var_name))
                        SyncResponse(actor)
                    end
                elseif targettype == _target_types.zhuansheng then
                    --角色转生判断
                    local count = lib996:getint(0,actor, ConstCfg.gbase.renew_level)
                    if count >= _cfg_goals[v].count then
                        SyncResponse(actor)
                    end
                elseif targettype == _target_types.baowu then
                    --宝物升级判断
                    local count = 0
                    for j = 1, 4 do
                        count = count + lib996:getint(0,actor,"NB_Baowu"..j)
                    end
                    --print("宝物进阶判断,count:"..count)
                    if count >= _cfg_goals[v].count then
                        SyncResponse(actor)
                    end
                elseif targettype == _target_types.shenshou then
                    --神兽之力判断
                    local varName = "C_QsQshenshouzhili"
                    local count = 0
                    for j = 1, 4 do
                        count = count + lib996:getint(0,actor,varName..j)
                    end
                    if count >= _cfg_goals[v].count then
                        SyncResponse(actor)
                    end
                elseif targettype == _target_types.levelup then
                    --角色升级
                    local count = lib996:getbaseinfo(actor,ConstCfg.gbase.level)
                    if count >= _cfg_goals[v].count then
                        SyncResponse(actor)
                    end
                end
                return
            end
        end
    end
end

--检索角色当前阶段任务完成情况
local function selectRoleVar(actor)
    task_info = {}

    local role_task = {}
    local temp = lib996:getstr(0,actor,_var_name_temp_info)
    if temp ~= "" then
        role_task = unserialize(temp)
    end

    freeVip_Lv = lib996:getint(0,actor, _var_name_Lv)

    state = true

    local cfg = _cfg[freeVip_Lv + 1]

    if cfg then
        local killNum = lib996:getint(0,actor, _killMonNum_var_name)

        local takeonnum = 0

        local takeonequips = lib996:getstr(0,actor, _takeonEquips_var_name)
        if takeonequips ~= nil and takeonequips ~= "" then
            takeonequips = unserialize(takeonequips)
            if type(takeonequips) == "table" then
                takeonnum = #takeonequips
            end
        end

        --转生等级
        local zslevel = lib996:getbaseinfo(actor, ConstCfg.gbase.renew_level)

        --角色等级
        local level = lib996:getbaseinfo(actor, ConstCfg.gbase.level)


        for i,v in ipairs(cfg.goal[1]) do
            local goaltab = _cfg_goals[v]
            if goaltab then
                if role_task[i] and role_task[i] == 1 then
                    task_info[i] = role_task[i]
                else
                    if goaltab.type == _target_types.takeonequip then
                        --print("装备穿戴判断2,穿戴:"..goaltab.count..",当前穿戴数:"..takeonnum..",是否达成:"..tostring(takeonnum >= goaltab.count))
                        task_info[i] = takeonnum >= goaltab.count and 1 or 0
                        if state and takeonnum < goaltab.count then state = false end
                    elseif goaltab.type == _target_types.killmon then
                        --print("怪物击杀判断2,需要击杀:"..goaltab.count..",当前击杀:"..killNum..",是否达成:"..tostring(killNum >= goaltab.count))
                        task_info[i] = killNum >= goaltab.count and 1 or 0
                        if state and killNum < goaltab.count then state = false end
                    elseif goaltab.type == _target_types.levelup then
                        -- print("角色等级判断2,需要等级:"..goaltab.count..",当前:"..level.."级,是否达成:"..tostring(level >= goaltab.count))
                        task_info[i] = level >= goaltab.count and 1 or 0
                        if state and level < goaltab.count then state = false end
                    elseif goaltab.type == _target_types.zhuansheng then
                        --print("角色转生判断2,需要击杀:"..goaltab.count..",当前:"..zslevel.."转,是否达成:"..tostring(zslevel >= goaltab.count))
                        task_info[i] = zslevel >= goaltab.count and 1 or 0
                        if state and zslevel < goaltab.count then state = false end
                    elseif goaltab.type == _target_types.shenshou then
                        local varName = "神兽之力变量名[待确认]"
                        local lv = 0
                        for j = 1, 4 do
                            lv = lv + lib996:getint(0,actor,varName..j)
                        end
                        --print("神兽之力判断2,需要总等级:"..goaltab.count..",当前:"..lv.."级,是否达成:"..tostring(lv >= goaltab.count))
                        task_info[i] = lv >= goaltab.count and 1 or 0
                        if state and lv < goaltab.count then state = false end
                    elseif goaltab.type == _target_types.baowu then
                        local varName = "法宝变量名[待确认]"
                        local lv = 0
                        for j = 1, 4 do
                            lv = lv + lib996:getint(0,actor,varName..j)
                        end
                        --print("宝物大师判断2,需要总等级:"..goaltab.count.."级,当前:"..lv.."级,是否达成:"..tostring(lv >= goaltab.count))
                        task_info[i] = lv >= goaltab.count and 1 or 0
                        if state and lv < goaltab.count then state = false end
                    end
                end
            end
        end
    end

    return task_info,freeVip_Lv,state
end

-- -------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
local _login_data = {freeVip_Lv,task_info,gifts_info}
function SyncResponse(actor)
    task_info,freeVip_Lv,state = selectRoleVar(actor)


    lib996:setstr(0,actor, _var_name_temp_info, serialize(task_info))

    for i, v in ipairs(_gifts_var_name) do
        gifts_info[i] = lib996:getint(0,actor, v)
    end

    _login_data[1] = freeVip_Lv
    _login_data[2] = task_info
    _login_data[3] = gifts_info

    lib996:showformwithcontent(actor,"", "freeVip.SyncResponse("..serialize(_login_data)..")")
end

--打开免费会员面板
function RequestOpenWnd(actor)
    task_info,freeVip_Lv,state = selectRoleVar(actor)


    for i, v in ipairs(_gifts_var_name) do
        gifts_info[i] = lib996:getint(0,actor, v)
    end

    _login_data[1] = freeVip_Lv
    _login_data[2] = task_info
    _login_data[3] = gifts_info

    lib996:showformwithcontent(actor,"F/免费会员面板", "freeVip#"..serialize(_login_data))
end


--免费会员提升
function RequestUpgrade(actor,test)
    task_info,freeVip_Lv,state = selectRoleVar(actor)

    local cfg = _cfg[freeVip_Lv + 1]
    if not cfg then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>当前已无法继续提升!</font>","Type":9}')
        return
    end
    if not state then
        if test == 1 and ConstCfg.DEBUG then
            --gm测试
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>gm测试提升免费会员等级</font>","Type":9}')
        else
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>当前不满足提升条件!</font>","Type":9}')
            return
        end
    end

    lib996:setint(0,actor, _var_name_Lv,freeVip_Lv + 1)

    lib996:setint(0,actor, _killMonNum_var_name,0)

    lib996:setstr(0,actor, _takeonEquips_var_name,"")

    lib996:setstr(0,actor, _var_name_temp_info,"")

    local name = lib996:getbaseinfo(actor,1)


    _Fsendmail(name,cfg.mailId,cfg.prefix,cfg.name)
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#EEEE00\'>奖励已发送,请注意查收邮箱!</font>","Type":9}')

    --刷新属性
    -- local cur_attr = _cfg[freeVip_Lv] and _cfg[freeVip_Lv].attribute or nil
    -- local next_attr = _cfg[freeVip_Lv + 1] and _cfg[freeVip_Lv + 1].attribute or nil

    -- Player.updateSomeAddr(actor, cur_attr, next_attr)

    for _, pos in ipairs(common_equip_pos) do
        local itemobj = lib996:linkbodyitem(actor,pos)
        if itemobj ~= "0" then
            _checkTargetFreeVip(_target_types.takeonequip, actor, itemobj)
        end
    end

    SyncResponse(actor)
end

--免费会员特惠礼包购买
function RequestBuyGifts(actor,page)
    page = tonumber(page)

    local varName = _gifts_var_name[page]
    if not varName then return end

    local cfg = _cfg[page]

    freeVip_Lv = lib996:getint(0,actor, _var_name_Lv)
    if freeVip_Lv < page then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>请先继续提升!</font>","Type":9}')
        return
    end
    local isget = lib996:getint(0,actor, varName)
    if isget ~= 0 then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>无法重复购买礼包!</font>","Type":9}')
        return
    end

    local moneyname = Item.getNameByIdx(ConstCfg.money.lf)
    if not Player.checkMoneyNum(actor, ConstCfg.money.lf,cfg.jiage) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>'..moneyname..'数量不足!</font>","Type":9}')
        return
    end

    --扣货币
    Player.takeMoney(actor, ConstCfg.money.lf,cfg.jiage, "免费会员特惠礼包")
    lib996:setint(0,actor, varName,1)

    local name = getbaseinfo(actor,1)
    _Fsendmail(name,cfg.mailId2,cfg.pet,cfg.name)
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#EEEE00\'>礼包已发送,请注意查收邮箱!</font>","Type":9}')

    SyncResponse(actor)
end
-- ----------------------------↓↓↓ GM 命令 ↓↓↓---------------------------------------
function RequestGmBox_1(actor,param)
    param = tonumber(param)
    task_info = {0,0,0,0,0}

    local temp = lib996:getstr(0,actor,_var_name_temp_info)
    if temp ~= "" then
        task_info = unserialize(temp)
    end

    task_info[param] = 1

    lib996:setstr(0,actor, _var_name_temp_info, serialize(task_info))

    SyncResponse(actor)
end
-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--登陆触发,演示版本登陆清空所有变量
local function _onLoginEnd(actor)
    freeVip_Lv = lib996:getint(0,actor, _var_name_Lv)
    if freeVip_Lv ~= 0 then

        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#EEEE00\'>演示版本登陆清空免费VIP变量!</font>","Type":9}')

        lib996:setint(0,actor, _var_name_Lv,0)

        lib996:setint(0,actor, _killMonNum_var_name,0)

        lib996:setstr(0,actor, _takeonEquips_var_name,"")

        lib996:setstr(0,actor, _var_name_temp_info,"")

        for i, v in ipairs(_gifts_var_name) do
            lib996:setint(0,actor, v, 0)
        end
    end
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, filename)

GameEvent.add(EventCfg.onPlayLevelUp, function (actor, cur_level) _checkTargetFreeVip(_target_types.levelup, actor, cur_level) end, filename)
GameEvent.add(EventCfg.onTakeOnEx, function (actor, itemobj) _checkTargetFreeVip(_target_types.takeonequip, actor, itemobj) end, filename)
GameEvent.add(EventCfg.onKillMon, function (actor, monobj, monidx) _checkTargetFreeVip(_target_types.killmon, actor, monidx) end, filename)
GameEvent.add(EventCfg.goZSLevelChange, function (actor) _checkTargetFreeVip(_target_types.zhuansheng, actor) end, filename)
GameEvent.add(EventCfg.goShenShou, function (actor) _checkTargetFreeVip(_target_types.shenshou, actor) end, filename)
GameEvent.add(EventCfg.goBaoWu, function (actor) _checkTargetFreeVip(_target_types.baowu, actor) end, filename)