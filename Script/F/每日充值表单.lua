lib996:include("Script/serialize.lua")
lib996:include("3rd/log/Logger.lua")

local _cfg_lj   = lib996:include("QuestDiary/cfgcsv/cfg_leichong_tsleic.lua")
local _cfg_mr   = lib996:include("QuestDiary/cfgcsv/cfg_leichong_mr.lua")

local filename = "ÿ�ճ�ֵ��"

local _LJ_receive_day = "SSJ_FLDT1_LJ_day"               --�ۼ���ȡ����
local _LJ_var_name = "SSJ_FLDT1_LJ"                      --�ۼ���ȡ�Զ��������ǰ׺
local _LJ_var_tab = {}

local _LJ_Reset_Day = 1                                 --�ۼ���ȡ��������

local _MR_Min_BillNum = 28                              --ÿ�ճ�ֵ���������ۼ���������С��ֵ���
local _Mr_var_name = "SSJ_FLDT1_Mr"                      --ÿ����ȡ�Զ��������ǰ׺
local _Mr_var_name_isFirst = "SSJ_FLDT1_Mr_isFirst"      --�����Ƿ��һ�δ���ճ佱��(������ۼ�����+1)
local _MR_var_tab = {}


local _sync_data_list = {
    MR_tab = {},    --ÿ�����
    LJ_tab = {},    --�ۼ����
}

local _state = {
    no_receive      = 0,        --������ȡ
    yes_receive     = 1,        --������ȡ
    has_receive     = 2,        --����ȡ
}

for i, v in ipairs(_cfg_lj) do
    if v.tianshu then
        _LJ_var_tab[v.tianshu] = _LJ_var_name.."_"..v.tianshu
        if v.tianshu > _LJ_Reset_Day then
            _LJ_Reset_Day = v.tianshu
        end
    end
end
for i, v in ipairs(_cfg_mr) do
    if v.money then
        _MR_var_tab[v.money] = _Mr_var_name.."_"..v.money

        if v.money < _MR_Min_BillNum and v.money ~= 0 then
            _MR_Min_BillNum = v.money
        end
    end
end
-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ����Ϣ
local _login_data = {0,0,_LJ_Reset_Day,_sync_data_list}   --���ȷ���ͬ���ڴ�����
function SyncResponse(actor)
    _sync_data_list.LJ_tab = {}


    local day_bill = Player.getTodayBillNum(actor)

    local get_lj_day = lib996:getint(0,actor, _LJ_receive_day)

    local isfirst = lib996:getint(0,actor,_Mr_var_name_isFirst)

    if isfirst == _state.no_receive and day_bill >= _MR_Min_BillNum then
        get_lj_day = get_lj_day + 1
        lib996:setint(0,actor,_Mr_var_name_isFirst, _state.yes_receive)
        lib996:setint(0,actor,_LJ_receive_day, get_lj_day)
    end

    local state = 0
    local str = ""
    --�ۼ���ȡ���״̬
    for day,varname in pairs(_LJ_var_tab) do
        str = tostring(day)
        state = lib996:getint(0,actor,varname)
        if state == _state.no_receive and day <= get_lj_day then
            state = _state.yes_receive
        end
        _sync_data_list.LJ_tab[str] = state
    end

    --�ճ������ȡ״̬
    _sync_data_list.MR_tab = {}
    for money,varname in pairs(_MR_var_tab) do
        str = tostring(money)
        state = lib996:getint(0,actor,varname)
        if state == _state.no_receive and money <= day_bill then
            state = _state.yes_receive
        end
        _sync_data_list.MR_tab[str] = state
    end

    _login_data[1] = get_lj_day         --�ۼ���ȡ��
    _login_data[2] = day_bill           --�ճ���
    _login_data[4] = _sync_data_list
    lib996:showformwithcontent(actor,"", "DailyRecharge.SyncResponse("..serialize(_login_data)..")")
end

--��ȡ�ۼ����
function RequestGetLJGift(actor,index)
    index = tonumber(index)
    local cfg = _cfg_lj[index]

    if not cfg then return end
    local var_name = _LJ_var_tab[cfg.tianshu]
    if not var_name then return end

    local state = lib996:getint(0,actor, var_name)
    if state == _state.has_receive then return end  --��������ȡ

    local cur_day = lib996:getint(0,actor, _LJ_receive_day)      --�ۼ�����δ���
    if cur_day < index then return end

    if not Bag.checkBagEmptyNum(actor, #cfg.reward) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�����ռ䲻��!</font>","Type":9}')
        return
    end

    --д����
    lib996:setint(0,actor,var_name,_state.has_receive)

    --����Ʒ
    Player.giveItemByTable(actor, cfg.reward, "�ۼƳ�ֵ����")

    --�ظ�
    SyncResponse(actor)
end

--��ȡ�ճ佱��
function RequestGetMRGift(actor,index)
    index = tonumber(index)
    local cfg = _cfg_mr[index]
    if not cfg then return end

    local var_name = _MR_var_tab[cfg.money]
    if not var_name then return end

    local state = lib996:getint(0,actor, var_name)
    if state == _state.has_receive then return end  --��������ȡ

    if not Bag.checkBagEmptyNum(actor, #cfg.reward) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�����ռ䲻��!</font>","Type":9}')
        return
    end

    --��ֵδ���
    local day_bill = Player.getTodayBillNum(actor)
    if day_bill < cfg.money then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>��ֵ����!</font>","Type":9}')
        return
    end

    --д����
    lib996:setint(0,actor,var_name, _state.has_receive)

    --����Ʒ
    Player.giveItemByTable(actor, cfg.reward, "ÿ�ճ�ֵ����")

    --�ظ�
    SyncResponse(actor)
end
-------------------------------������ �ɷ��¼� ������---------------------------------------
--ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
local function _goDailyUpdate(actor)
    for _, key in pairs(_MR_var_tab) do
        lib996:setint(0,actor,key, _state.no_receive)
    end

    lib996:setint(0,actor,_Mr_var_name_isFirst, _state.no_receive)

    local cur_day = lib996:getint(0,actor, _LJ_receive_day)
    if cur_day >= _LJ_Reset_Day then
        for _,varname in pairs(_LJ_var_tab) do
            lib996:setint(0,actor,varname, _state.no_receive)
        end
        lib996:setint(0,actor,_LJ_receive_day, _state.no_receive)
    end
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, filename)
-------------------------------������ �ⲿ���� ������---------------------------------------
--��������
function GmClear(actor)
    for _,varname in pairs(_LJ_var_tab) do
        lib996:setint(0,actor,varname, _state.has_receive)
    end
    for _,varname in pairs(_MR_var_tab) do
        lib996:setint(0,actor,varname, _state.has_receive)
    end
    lib996:setint(0,actor,_Mr_var_name_isFirst, _state.has_receive)
    lib996:setint(0,actor,_LJ_receive_day, _state.has_receive)
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#7FFF00\'>�������óɹ�!</font>","Type":9}')
end