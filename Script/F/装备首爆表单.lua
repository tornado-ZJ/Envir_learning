lib996:include("Script/serialize.lua")
lib996:include("3rd/log/Logger.lua")

local filename = "װ���ױ���"

local _var_name_system = "SSJ_ZBSB_GetNum_"     --ϵͳ��ȡ����ǰ׺
local _var_system_list = {}

local _var_name_role = "SSJ_ZBSB_ItemState_"    --�����ȡ����ǰ׺
local _var_role_list = {}

local _state = {
    not_receive     = 0,        --δ��ȡ
    yes_receive     = 1,        --����ȡ
    has_receive     = 2,        --����ȡ
}

local _sync_data_list = {}                    --���ȷ���ͬ���ڴ�����(itemIdx,db_var,role_var)

local _cfg_shoubao   = lib996:include("QuestDiary/cfgcsv/cfg_shoubao.lua")

local _cfg_items = {}                           --�ױ����߱�
for i, v in ipairs(_cfg_shoubao) do
    local itemIdx = v.item
    _cfg_items[itemIdx] = v
    _var_system_list[itemIdx] = _var_name_system..itemIdx
    _var_role_list[itemIdx] = _var_name_role..itemIdx
    _sync_data_list[i] = {0,0,0}
end
-------------------------------������ ������Ϣ ������---------------------------------------
--ͬ����Ϣ
function SyncResponse(actor)
    for i, v in ipairs(_cfg_shoubao) do
        _sync_data_list[i][1] = v.item
        _sync_data_list[i][2] = lib996:getint(0,actor,_var_role_list[v.item])
        _sync_data_list[i][3] = lib996:getsysint(_var_system_list[v.item])
        if _sync_data_list[i][2] == _state.yes_receive then
            if _cfg_items[v.item].num - _sync_data_list[i][3] <= 0 then
                _sync_data_list[i][2] = _state.has_receive
            end
        end
    end
    lib996:showformwithcontent(actor,"", "DropFirst.SyncResponse("..serialize(_sync_data_list)..")")
end

--��ȡ����
function RequestGetGift(actor,idx)
    idx = tonumber(idx)
    local cfg = _cfg_items[idx]
    if not cfg then return end

    local var_name = _var_role_list[idx]
    local var_db_name = _var_system_list[idx]

    --����Ƿ����ȡ
    local state = lib996:getint(0,actor,_var_role_list[idx])
    if state ~= _state.yes_receive then return end

    --���ȫ������ȡ����
    local gnum = lib996:getsysint(var_db_name) + 1
    if gnum > cfg.num then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>����ʣ����������!</font>","Type":9}')
        return
    end

    --д���ݿ�
    lib996:setint(0,actor,var_name, _state.has_receive)
    lib996:setsysint(var_db_name,gnum)

    --������
    Player.giveItemByTable(actor, cfg.gift, filename)

    --�ظ�
    lib996:showformwithcontent(actor,"", "DropFirst.updataUI("..serialize({idx, _state.has_receive, gnum})..")")
end
-------------------------------������ �ɷ��¼� ������---------------------------------------
--��Ʒ������
local function _onAddBag(actor,itemobj)
    local idx = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    if not _cfg_items[idx] then return end
    local itemflag = lib996:getitemaddvalue(actor, itemobj, 2, 19)
    if itemflag == _state.yes_receive then return end
    lib996:setitemaddvalue(actor, itemobj, 2, 19, _state.yes_receive)
    lib996:setint(0,actor,_var_role_list[idx], _state.yes_receive)
end
GameEvent.add(EventCfg.onAddBag, _onAddBag, filename)