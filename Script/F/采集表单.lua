lib996:include("Script/serialize.lua")

local filename = "�ɼ���"

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_caiji.lua")

local _mapId = _cfg[1].mapid[1][1]                                  --���ͼ

local _cfg_monidx = {}

for i, v in ipairs(_cfg) do
    _cfg_monidx[v.id] = v
end

_var_caiji_num        = VarCfg.SSJ_caiji_num              --���ղɼ�����������

_var_caiji_icon       = "SSJ_caiji_isShowIcon"            --�ɼ����,���ڱ���Ƿ���չʾ�ɼ���ť

_var_caiji_mon        = "SSJ_caiji_monObj"               --�ɼ����,���ڱ�ǵ�ǰ�ɼ���Ŀ��obj��idx

icon_state = {
    hide         = 0,        --������
    show         = 1,        --չʾ��
}

local caiji_range = 3                                               --�ɼ�������

local rich_text = {
    ["hasnot"]  = '{"Msg":"<font color=\'#ff0000\'>������һ��,����Ѿ��տ���Ҳ</font>","Type":9}',
    ["count"]   = '{"Msg":"<font color=\'#ff0000\'>���ղɼ������Ѵ�����</font>","Type":9}',
    ["range"]   = '{"Msg":"<font color=\'#ff0000\'>�����Զ���޷��ɼ�[%s]</font>","Type":9}',
}
-------------------------------������ ���ط��� ������---------------------------------------
--�Ƿ��ڻ��ͼ
local function _isNotInMap(actor)
    local cur_mapId = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end

local function campare(a, b)
    if a[2] == b[2] then
        if a[3] and b[3] then
            return a[3] < b[3]
        else
            return true
        end
    else
        return a[2] > b[2]
    end
end

local function getMapRangeMons(actor,monidx)
    if not _isNotInMap then return {} end
    local x,y = lib996:getbaseinfo(actor,ConstCfg.gbase.x),lib996:getbaseinfo(actor,ConstCfg.gbase.y)
    local mons = lib996:getobjectinmap(_mapId,x,y,caiji_range,2)
    if not mons then return false end

    local gift_mons = {}
    for i, monobj in ipairs(mons) do
        local idx = lib996:getbaseinfo(monobj,ConstCfg.gbase.idx)
        if monidx then
            --��ָ������idx����
            if monidx == idx then
                local range = math.abs(x - lib996:getbclickmonaseinfo(monobj,ConstCfg.gbase.x)) + math.abs(y - lib996:getbaseinfo(monobj,ConstCfg.gbase.y))
                table.insert(gift_mons,{monobj,_cfg_monidx[idx].pro,range,lib996:getbaseinfo(monobj,ConstCfg.gbase.name)})
            end
        else
            --�������пɲɼ��Ĺ���idx
            if _cfg_monidx[idx] then
                local range = math.abs(x - lib996:getbaseinfo(monobj,ConstCfg.gbase.x)) + math.abs(y - lib996:getbaseinfo(monobj,ConstCfg.gbase.y))
                table.insert(gift_mons,{monobj,range,_cfg_monidx[idx].pro,lib996:getbaseinfo(monobj,ConstCfg.gbase.name)})
            end
        end
    end
    if table.nums(gift_mons) < 2 then return gift_mons[1] end
    table.sort(gift_mons, campare)
    return gift_mons[1]
end
-------------------------------������ ������Ϣ ������---------------------------------------
--��ͼ��ת
function RequestEnter(actor)
    local _cfg_pos = {
        --��ˢ�µ�
        {45,74},{104,129},{15,125},{77,46},{17,26},
    }
    local pos = GenRandom(1,#_cfg_pos)
    local cfg_pos = _cfg_pos[pos]
    lib996:mapmove(actor, _mapId,cfg_pos[1],cfg_pos[2],5)
end

--�ɼ�
function RequestStart(actor,monobj)
    local count = lib996:getint(0,actor, _var_caiji_num) - 1
    if count < 0 then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.count))
        return
    end

    if monobj then
        --��ǰ����ѡ��Ŀ�걦����ɼ�Ŀ�걦��
        monobj = lib996:getmonbyuserid(_mapId,monobj)
        if lib996:getbaseinfo(actor,ConstCfg.gbase.isdie) then
            monobj = nil
        else
            if not FCheckRange(actor, lib996:getbaseinfo(monobj, ConstCfg.gbase.x), lib996:getbaseinfo(monobj, ConstCfg.gbase.y),caiji_range) then
                local name = lib996:getbaseinfo(monobj, ConstCfg.gbase.name)
                lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.range,name))
                return
            end
        end
    end
    if not monobj then
        local montemp = getMapRangeMons(actor)
        if montemp then
            monobj = montemp[1]
        end
    end
    if not monobj or #monobj == 0 then return end

    lib996:setstr(0,actor,_var_caiji_mon,monobj)

    lib996:showformwithcontent(actor,"", "TaskWnd.StartResponse("..monobj..")")
end

--�ɼ�
function RequestFinish(actor)
    --������
    local count = lib996:getint(0,actor, _var_caiji_num) - 1
    if count < 0 then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.count))
        return
    end
    local monobj = lib996:getstr(0,actor,_var_caiji_mon)
    if monobj == "" then return end

    local monidx = lib996:getbaseinfo(monobj, ConstCfg.gbase.idx)

    if lib996:getbaseinfo(actor,ConstCfg.gbase.isdie) then
        monobj = getMapRangeMons(actor,monidx)
    end

    if not _cfg_monidx[monidx] then
        return
    end
    if not monobj then
        lib996:sendmsg(actor, ConstCfg.notice.own, ResponseCfgGet(rich_text.hasnot))
        return
    end
    --������
    lib996:killmonbyobj(actor,monobj, false,false,false)

    lib996:setstr(0,actor,_var_caiji_mon,"")

    lib996:delaygoto(actor,300,"clickmon")

    --������
    lib996:setint(0,actor, _var_caiji_num, count)

    --������
    Player.giveItemByTable(actor, _cfg_monidx[monidx].jiangli, "����", 1)
end

function clickmon(actor)
    local monobj = getMapRangeMons(actor)
    local flag = monobj and icon_state.show or icon_state.hide
    if flag ~= lib996:getint(0,actor, _var_caiji_icon) then
        lib996:setint(0,actor, _var_caiji_icon,flag)

        lib996:showformwithcontent(actor,"", "TaskWnd.IconSetVisible("..flag..")")
    end
end

-- ----------------------------������ �����¼� ������---------------------------------------
--ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
local function _goDailyUpdate(actor)
    lib996:setint(0,actor,_var_caiji_num,_cfg[1].items)
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, filename)

--��½����
local function _onLoginEnd(actor,logindatas)
    -- _goDailyUpdate(actor)
end
GameEvent.add(EventCfg.onLoginEnd, _onLoginEnd, filename)

--����/�л���ͼ
local function _goSwitchMap(actor,cur_mapid, former_mapid)
    if former_mapid == _mapId then
        --�뿪���ͼ
        if lib996:getint(0,actor, _var_caiji_icon) ~= icon_state.hide then
            lib996:setint(0,actor, _var_caiji_icon,icon_state.hide)
        end
    end
end
GameEvent.add(EventCfg.goSwitchMap, _goSwitchMap, filename)

--�ƶ�����(������actor, 0��/1��)
local function _onMove(actor,_type)
    if _isNotInMap(actor) then return end
    local monobj = getMapRangeMons(actor)
    local flag = monobj and icon_state.show or icon_state.hide

    if flag ~= lib996:getint(0,actor, _var_caiji_icon) then
        lib996:setint(0,actor, _var_caiji_icon,flag)
        lib996:showformwithcontent(actor,"", "TaskWnd.IconSetVisible("..flag..")")
    end
    local mon = lib996:getstr(0,actor,_var_caiji_mon)
    if mon ~= "" then
        lib996:setstr(0,actor,_var_caiji_mon,"")
        lib996:showformwithcontent(actor,"", "TaskWnd.StopProgress()")
    end
end
GameEvent.add(EventCfg.onMove, _onMove, filename)

--�ܵ��˺�����(������actor, ��Ѫ)
local function _onProHarm(actor,ihp)
    if _isNotInMap(actor) then return end
    local mon = lib996:getstr(0,actor,_var_caiji_mon)
    if mon ~= "" then
        lib996:setstr(0,actor,_var_caiji_mon,"")
        lib996:showformwithcontent(actor,"", "TaskWnd.StopProgress()")
    end
end
GameEvent.add(EventCfg.onProHarm, _onProHarm, filename)