lib996:include("Script/serialize.lua")

local cfg_shouchong = lib996:include("QuestDiary/cfgcsv/cfg_shouchong.lua")

local _var_getInfo = {}                -- 首充领取情况

for i, v in ipairs(cfg_shouchong) do
    table.insert(_var_getInfo,"首充变量名"..i)
end

local _state = {
    no_receive      = 0,       -- 未到时间/不可领取
    yes_receive     = 1,       -- 可以领取
    has_receive     = 2,       -- 已领取
}

local _day_table = {}

for i, v in ipairs(cfg_shouchong) do
    _day_table[i] = "YAoLX_bian" .. i
end


-------------------------------↓↓↓网络消息↓↓↓---------------------------------------
-- 同步信息
function SyncResponse(actor)
    local autoindex = 1
    for i,varname in ipairs(_day_table) do
        _var_getInfo[i] = lib996:getint(0,actor,varName)
        
        local state = lib996:getint(0, actor, varname)
        print("state="..state)
        if state == _state.has_receive then 
            autoindex = autoindex + 1
        end  -- 奖励已领取
        print("=="..i)
    end
    autoindex = math.min(autoindex, 3)

    print("首充, 同步信息")
    lib996:showformwithcontent(actor, "B/首充豪礼面板", "QSQ_shouchong#" .. serialize(_var_getInfo))
end

    -- 领取物品
function LingQu(actor, num)
    num = tonumber(num)
    local cfg = cfg_shouchong [num]
    if not cfg then return end
    
    local varName = _day_table[num]
    print(varName,"varName")

    local state = lib996:getint(0, actor, varName)
    print(state,"领取状态")

    if state == _state.has_receive then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>奖励已领取</font>","Type":10}')
        return
    end
    -- 给物品
    
    for key,var in ipairs(cfg.reward) do
        -- print("key", type(key), key)
        -- print("var", type(var), serialize(var))

        local name =  lib996:getstditeminfo(var[1], 1)
        lib996:giveitem(actor, name, var[2], "首充奖励")

    end

    -- 写数据
    lib996:setint(0,actor,varName, _state.has_receive)

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>领取成功</font>","Type":10}')

    -- 回复
    SyncResponse(actor)
end

    -- 充值成功时
local function _playerrecharge(actor)
    -- 充值并且是第一次充值，标记可以领取状态
    local state = lib996:getint(0, actor, "是否首充")
    if nil == state or state == _state.no_receive then
        lib996:setint(0, actor, "是否首充", _state.yes_receive)
        lib996:setint(0, actor, _var_getInfo[1], _state.yes_receive)
    end
end

GameEvent.add(EventCfg.onRecharge,  _playerrecharge, "首充福利")  --充值

-- 每日凌晨 与 每日第一次登录 调用
local function _goDailyUpdate(actor)
    local state = lib996:getint(0, actor, "是否首充")
    if state == _state.yes_receive then
        for _, varName in ipairs(_var_getInfo) do
            local temp = lib996:getint(0,actor,varName)
            if temp == _state.no_receive then
                lib996:setint(0, actor,varName, _state.yes_receive)
                break
            end
        end
    end
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate,"首充福利") 






--     -- 判断是否可以领取(时间到了)
--     -- 领取时间戳判断，当前时间戳与上次时间戳天数不同，才能领取
--     if state == _state.yes_receive then
--     -- 领取
--     -- 领取逻辑


--     -- 记录已经领取了
--     -- 每日凌晨 与 每日第一次登录 调用
--     local function _goDailyUpdate(actor)
--         for _, varName in ipairs(_var_name_cfg) do
--             lib996:setint(0, actor, varname, _state.has_receive)
--         end
--     end
--     GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, cfg)

--     -- 让客户端刷新界面

--     -- 记录领取的时间戳，为下次领取判断
--     end
-- end
