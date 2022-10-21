lib996:include("Script/serialize.lua")
lib996:include("3rd/log/Logger.lua")

local filename = "ÿ���޹���"

local _var_name_system = "SSJ_MRXG_Group"       --ÿ���޹�ϵͳ��������

local _var_name_role = "SSJ_MRXG_BuyState_"     --ÿ���޹��������������ǰ׺
local _var_name_cfg = {}
local _sync_data_list = {}

local _state = {
    not_buy     = 0,        --δ����
    has_buy     = 1,        --�ѹ���
}

local temp   = lib996:include("QuestDiary/cfgcsv/cfg_mystery_store.lua")
local _cfg_store = {}                           --ÿ���޹���
for i, v in ipairs(temp) do
    _cfg_store[v.group] = _cfg_store[v.group] or {}
    _cfg_store[v.group][v.index] = {
        idx = i,sellId = v.sellId,itemId = v.itemId,group = v.group,index = v.index,price = v.price,
    }
    _var_name_cfg[v.index] = _var_name_role .. v.index
    _sync_data_list[v.index] = 0
end
-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ����Ϣ
function SyncResponse(actor)
    local group = lib996:getsysint(_var_name_system)
    for i, varName in ipairs(_var_name_cfg) do
        _sync_data_list[i] = lib996:getint(0,actor,varName)
    end
    lib996:showformwithcontent(actor,"", "DailyStore.SyncResponse("..group..","..serialize(_sync_data_list)..")")
end

--�������
function RequestBuyGift(actor,idx)
    idx = tonumber(idx)
    local varName = _var_name_cfg[idx]
    if not varName then return end

    local group = lib996:getsysint(_var_name_system)

    local cfg = _cfg_store[group] and _cfg_store[group][idx] or nil
    if not cfg then return end

    local state = lib996:getint(0,actor,varName)
    if state == _state.has_buy then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>��������ѹ���</font>","Type":9}')
        return
    end

    --���߲���,���ز������ name 
    local name = Player.checkItemNumByTable(actor,cfg.price)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>����['..name..']����</font>","Type":9}')
        return
    end

    --�۲���
    Player.takeItemByTable(actor, cfg.price)

    --����Ʒ
    Player.giveItemByTable(actor, cfg.itemId, filename)

    --д����
    lib996:setint(0,actor,varName, _state.has_buy)

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>����ɹ�</font>","Type":9}')

    --�ظ�
    SyncResponse(actor)
end
-------------------------------������ �ɷ��¼� ������---------------------------------------
--ÿ���ֻ����
local function _roBeforedawn()
    local group = lib996:getsysint(_var_name_system) + 1
    if not _cfg_store[group] then
        group = 1
    end
    lib996:setsysint(_var_name_system,group)
end
GameEvent.add(EventCfg.roBeforedawn,  _roBeforedawn, filename)  --ÿ���賿����ϵͳ����

local function _goDeclareVar()
    local group = lib996:getsysint(_var_name_system)
    if not _cfg_store[group] then
        lib996:setsysint(_var_name_system,1)
    end
end
GameEvent.add(EventCfg.goDeclareVar,  _goDeclareVar, filename)  --��������������ȫ�ֱ���

-- --ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
local function _goDailyUpdate(actor)
    for _, varName in ipairs(_var_name_cfg) do
        lib996:setint(0,actor,varName, _state.no_receive)
    end
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, filename)