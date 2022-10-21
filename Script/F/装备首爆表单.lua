lib996:include("Script/serialize.lua")
lib996:include("3rd/log/Logger.lua")

local filename = "装备首爆表单"

local _var_name_system = "SSJ_ZBSB_GetNum_"     --系统领取变量前缀
local _var_system_list = {}

local _var_name_role = "SSJ_ZBSB_ItemState_"    --玩家领取变量前缀
local _var_role_list = {}

local _state = {
    not_receive     = 0,        --未领取
    yes_receive     = 1,        --可领取
    has_receive     = 2,        --已领取
}

local _sync_data_list = {}                    --优先分配同步内存数据(itemIdx,db_var,role_var)

local _cfg_shoubao   = lib996:include("QuestDiary/cfgcsv/cfg_shoubao.lua")

local _cfg_items = {}                           --首爆道具表
for i, v in ipairs(_cfg_shoubao) do
    local itemIdx = v.item
    _cfg_items[itemIdx] = v
    _var_system_list[itemIdx] = _var_name_system..itemIdx
    _var_role_list[itemIdx] = _var_name_role..itemIdx
    _sync_data_list[i] = {0,0,0}
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步信息
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

--领取奖励
function RequestGetGift(actor,idx)
    idx = tonumber(idx)
    local cfg = _cfg_items[idx]
    if not cfg then return end

    local var_name = _var_role_list[idx]
    local var_db_name = _var_system_list[idx]

    --检查是否可领取
    local state = lib996:getint(0,actor,_var_role_list[idx])
    if state ~= _state.yes_receive then return end

    --检查全服可领取数量
    local gnum = lib996:getsysint(var_db_name) + 1
    if gnum > cfg.num then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>奖励剩余数量不足!</font>","Type":9}')
        return
    end

    --写数据库
    lib996:setint(0,actor,var_name, _state.has_receive)
    lib996:setsysint(var_db_name,gnum)

    --给奖励
    Player.giveItemByTable(actor, cfg.gift, filename)

    --回复
    lib996:showformwithcontent(actor,"", "DropFirst.updataUI("..serialize({idx, _state.has_receive, gnum})..")")
end
-------------------------------↓↓↓ 派发事件 ↓↓↓---------------------------------------
--物品进背包
local function _onAddBag(actor,itemobj)
    local idx = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    if not _cfg_items[idx] then return end
    local itemflag = lib996:getitemaddvalue(actor, itemobj, 2, 19)
    if itemflag == _state.yes_receive then return end
    lib996:setitemaddvalue(actor, itemobj, 2, 19, _state.yes_receive)
    lib996:setint(0,actor,_var_role_list[idx], _state.yes_receive)
end
GameEvent.add(EventCfg.onAddBag, _onAddBag, filename)