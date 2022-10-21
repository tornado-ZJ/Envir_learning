lib996:include("Script/serialize.lua")

local filename = "Ѻ�ڱ�"

--�������Ϣ��
local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_biaoche.lua")

local _activityid       = 3                                         --�id

local guiguID           = 2                                         --cfg_guigufuben ���ڶ�Ӧ�Ļid

local _timer_id = 20002                                             --���˶�ʱ��id

local _activity_max_time = 60*60                                    --�����ʱ��

local _npcidx           = _cfg[1].tonpc[1][1]                       --����Npc
local _endnpcidx        = _cfg[1].tonpc[1][2]                       --����Npc

local _mapId = _cfg[1].mapid[1][1]                                  --���ͼ

local monidx_cfg = {}                                               --�ڳ��ֵ�idx��
for i, v in ipairs(_cfg) do
    monidx_cfg[v.mid] = i
end

local _varg_starttime       = "SSJ_yabiao_startTime"                --���ʼʱ���
local _varg_endtime         = "SSJ_yabiao_endTime"                  --�����ʱ���

local _var_yabiao           = VarCfg.SSJ_yabiao_num1                --����Ѻ�ڴ���������
local _var_jiebiao          = VarCfg.SSJ_yabiao_num2                --���ս��ڴ���������

local _var_car_killer       = "SSJ_car_killer"                      --���ڶ���

local _var_auto_flag        = "SSJ_yabiao_auto_flag"                --�Զ�Ѻ�ڱ�ʶ
local _var_auto_temp        = "SSJ_yabiao_auto_temp"                --�Զ�Ѻ����ʱ���

local auto_state = {
    closing         = 0,        --�ر���
    opening         = 1,        --������
}

local rich_text = {
    --Ѻ��
    ["yabiao_repeat"]               = '{"Msg":"<font color=\'#ff0000\'>�����ظ�����</font>","Type":9}',
    ["yabiao_not"]                  = '{"Msg":"<font color=\'#ff0000\'>δ���ڣ��޷�����</font>","Type":9}',
    ["yabiao_range"]                = '{"Msg":"<font color=\'#ff0000\'>�ڳ������Զ���޷�����</font>","Type":9}',
    ["yabiao_count"]                = '{"Msg":"<font color=\'#ff0000\'>����Ѻ�ڴ������ù�</font>","Type":9}',
    ["yabiao_autoOpening"]          = '{"Msg":"<font color=\'#ADFF2F\'>�Զ�Ѻ���ѿ���</font>","Type":9}',
    ["yabiao_autoClosing"]          = '{"Msg":"<font color=\'#ff0000\'>�Զ�Ѻ���ѹر�</font>","Type":9}',
    ["yabiao_warning"]              = '{"Msg":"<font color=\'#ff0000\'>ע��!���ڳ������Զ</font>","Type":9}',
    ["yabiao_npcRange"]             = '{"Msg":"<font color=\'#ff0000\'>����ʦ�����Զ</font>","Type":9}',
    ["yabiao_click"]                = '{"Msg":"<font color=\'#FFFFFF\'>�ٴε�������˳��Զ�Ѻ��״̬</font>","Type":9}',
    ["yabiao_finish"]               = '{"Msg":"<font color=\'#00FF00\'>�����ѷ���������,��ע�����!</font>","Type":9}',
    ["yabiao_giveup"]               = '{"Msg":"<font color=\'#00FF00\'>�ѷ�������Ѻ������</font>","Type":9}',
}
-------------------------------������ ���ط��� ������---------------------------------------
--�Ƿ��ѽ���
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

--�Ƿ��ڻ��ͼ
local function _isNotInMap(actor)
    local cur_mapId = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end
-------------------------------������ �ⲿ���� ������---------------------------------------
function countdown(actor)
    --������ڳ�
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
-------------------------------������ ������Ϣ ������---------------------------------------
--�����ͼ/ǰ��Ѻ��
function RequestEnter(actor)
    lib996:mapmove(actor, _mapId,70,124,5)
end

--����
function RequestEscort(actor, _type)
    _type = tonumber(_type)
    --�����npc�ľ���
    if not FCheckNPCRange(actor, _npcidx) then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_npcRange))
        return
    end
    --������
    local count = lib996:getint(0,actor, _var_yabiao) - 1
    if count < 0 then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_count))
        return
    end

    --��ȡ����
    local cfg = _cfg[_type]
    if not cfg then return end

    --����ѽ���
    if _getEscortObj(actor) then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_repeat))
        return
    end
    --������
    if cfg.cost then
        local name, num = Player.checkItemNumByTable(actor, cfg.cost)
        if name then
            lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.not_item, name))
            return
        end
    end
    --�ٻ��ڳ�
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

    --�����Զ�Ѻ��
    lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_autoOpening))
    lib996:setint(0,actor,_var_auto_flag,auto_state.opening)

    --д���ݿ�
    lib996:setint(0,actor, _var_yabiao, count)

    --�ۻ���
    if cfg.cost then
        Player.takeItemByTable(actor, cfg.cost, "����")
    end

    lib996:setontimer(actor, _timer_id, 1, 0)

    countdown(actor)
end

--����
function RequestFinish(actor)
    --�����npc�ľ���
    if not FCheckNPCRange(actor, _endnpcidx) then return end
    --������ڳ�
    local cartobj, cartcfg = _getEscortObj(actor)
    if not cartobj then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_not))
        return
    end
    --����ڳ��Ƿ���ָ������
    local end_x, end_y, end_range = _cfg[1].End[1], _cfg[1].End[2], _cfg[1].End[3]
    if not FCheckRange(end_x, end_y, end_range, cartobj) then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_range))
        return
    end
    local carName = lib996:getbaseinfo(cartobj,ConstCfg.gbase.name)

    --�����ڳ�
    lib996:killmonbyobj(actor,cartobj, false,false,false)

    --������
    local name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)
    _Fsendmail(name,_cfg[1].mailId_1,cartcfg and cartcfg.reward or nil,carName)

    --�ظ�
    lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_finish))

    countdown(actor)
end

--����Ѻ��
function RequestGiveup(actor)
    local cartobj,cartcfg = _getEscortObj(actor)
    if cartobj then
        --�����ڳ�
        local carName = lib996:getbaseinfo(cartobj,ConstCfg.gbase.name)
        local name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)
        _Fsendmail(name,_cfg[1].mailId_4,cartcfg and cartcfg.renounceReward,carName)

        lib996:killmonbyobj(actor,cartobj, false,false,false)
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.yabiao_giveup))

        countdown(actor)
    end
end

--������/�ر��Զ�Ѻ��
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
-- ----------------------------������ �����¼� ������---------------------------------------
--ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
local function _goDailyUpdate(actor)
    lib996:setint(0,actor,_var_yabiao,_cfg[1].cishu)
    lib996:setint(0,actor,_var_jiebiao,_cfg[1].cishu2)
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, filename)

--��½����
local function _onLoginEnd(actor,logindatas)
    -- _goDailyUpdate(actor)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, filename)

--��ɱ�ڳ�����
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

--��ʧ�ڳ�����
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

--NPC�������
local function _onClicknpc(actor,npcid)
    if npcid == _npcidx then
        --��ʦ
        local var_yabiao = lib996:getint(0,actor, _var_yabiao)          --ʣ��Ѻ�ڴ���
        local var_jiebiao = lib996:getint(0,actor, _var_jiebiao)        --ʣ����ڴ���
        lib996:showformwithcontent(actor,"F/Ѻ�����", "Yabiao#"..var_yabiao.."#"..var_jiebiao)
    elseif npcid == _endnpcidx then
        --Ǯׯ�ϰ�
        local _,cartcfg = _getEscortObj(actor)
        local idx = cartcfg and cartcfg.idx or 0
        lib996:showformwithcontent(actor,"F/�������", "Yabiao#"..idx)
    end
end
GameEvent.add(EventCfg.onClicknpc, _onClicknpc, filename)