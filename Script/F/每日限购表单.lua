lib996:include("Script/serialize.lua")
lib996:include("3rd/log/Logger.lua")

local filename = "每日限购表单"

local _var_name_system = "SSJ_MRXG_Group"       --每日限购系统组别变量名

local _var_name_role = "SSJ_MRXG_BuyState_"     --每日限购购买情况变量名前缀
local _var_name_cfg = {}
local _sync_data_list = {}

local _state = {
    not_buy     = 0,        --未购买
    has_buy     = 1,        --已购买
}

local temp   = lib996:include("QuestDiary/cfgcsv/cfg_mystery_store.lua")
local _cfg_store = {}                           --每日限购表
for i, v in ipairs(temp) do
    _cfg_store[v.group] = _cfg_store[v.group] or {}
    _cfg_store[v.group][v.index] = {
        idx = i,sellId = v.sellId,itemId = v.itemId,group = v.group,index = v.index,price = v.price,
    }
    _var_name_cfg[v.index] = _var_name_role .. v.index
    _sync_data_list[v.index] = 0
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步信息
function SyncResponse(actor)
    local group = lib996:getsysint(_var_name_system)
    for i, varName in ipairs(_var_name_cfg) do
        _sync_data_list[i] = lib996:getint(0,actor,varName)
    end
    lib996:showformwithcontent(actor,"", "DailyStore.SyncResponse("..group..","..serialize(_sync_data_list)..")")
end

--购买道具
function RequestBuyGift(actor,idx)
    idx = tonumber(idx)
    local varName = _var_name_cfg[idx]
    if not varName then return end

    local group = lib996:getsysint(_var_name_system)

    local cfg = _cfg_store[group] and _cfg_store[group][idx] or nil
    if not cfg then return end

    local state = lib996:getint(0,actor,varName)
    if state == _state.has_buy then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>今日礼包已购买</font>","Type":9}')
        return
    end

    --道具不足,返回不足材料 name 
    local name = Player.checkItemNumByTable(actor,cfg.price)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料['..name..']不足</font>","Type":9}')
        return
    end

    --扣材料
    Player.takeItemByTable(actor, cfg.price)

    --给物品
    Player.giveItemByTable(actor, cfg.itemId, filename)

    --写数据
    lib996:setint(0,actor,varName, _state.has_buy)

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>购买成功</font>","Type":9}')

    --回复
    SyncResponse(actor)
end
-------------------------------↓↓↓ 派发事件 ↓↓↓---------------------------------------
--每日轮换组别
local function _roBeforedawn()
    local group = lib996:getsysint(_var_name_system) + 1
    if not _cfg_store[group] then
        group = 1
    end
    lib996:setsysint(_var_name_system,group)
end
GameEvent.add(EventCfg.roBeforedawn,  _roBeforedawn, filename)  --每日凌晨触发系统变量

local function _goDeclareVar()
    local group = lib996:getsysint(_var_name_system)
    if not _cfg_store[group] then
        lib996:setsysint(_var_name_system,1)
    end
end
GameEvent.add(EventCfg.goDeclareVar,  _goDeclareVar, filename)  --服务器启动声明全局变量

-- --每日凌晨 与 每日第一次登录 调用
local function _goDailyUpdate(actor)
    for _, varName in ipairs(_var_name_cfg) do
        lib996:setint(0,actor,varName, _state.no_receive)
    end
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, filename)