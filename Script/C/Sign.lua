lib996:include("Script/serialize.lua")

local cfg_qiandao = lib996:include("QuestDiary/cfgcsv/cfg_qiandao.lua")

local _state = {
    no_receive = 0, -- 不可领取
    can_receive = 1, --可领取
    has_receive = 2 --已领取
}

local _receive_day = "LZY_Sign_day" --累计签到天数



local _day_table = {}
local _state_table = {}

for i, v in ipairs(cfg_qiandao) do
    _day_table[i] = "LZY_bian" .. i
end

--同步
function SyncResponse(actor)
    for i, varname in ipairs(_day_table) do
        _state_table[i] = lib996:getint(0, actor, varname)
    end

    --lib996:showformwithcontent(actor, "C/Sign", "LZY_qiandao#2#2#1#0#0#0#0")
    lib996:showformwithcontent(actor, "C/Sign", "LZY_qiandao#" .. serialize(_state_table))
end

-- 领取
function receive(actor, param1)
    param1 = tonumber(param1)
    local cfg = cfg_qiandao[param1]
    if not cfg then
        return
    end

    local varname = _day_table[param1]
    local state = lib996:getint(0, actor, varname)

    if state ~= _state.can_receive then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>不可领取</font>","Type":9}')
        return
    end
    Player.giveItemByTable(actor, cfg.pet, "Sign")

    local a = lib996:setint(0, actor, varname, _state.has_receive)
    SyncResponse(actor)

end


-- local function _goDailyUpdate(actor)
--     local week = lib996:getint(0, actor, "LZY_Sign_week")
--     local day = lib996:gettime().Day
--     local month = lib996:gettime().Month
--     local time_tab = lib996:getint(0, actor, "LZY_Sign_time")
--     if time_tab[1] ~= month and time_tab[2] ~= day then
--         lib996:setint(0, actor, "LZY_Sign_week", week + 1)
--         local now_time_tab = {}
--         now_time_tab[1] = month
--         now_time_tab[2] = day
--         lib996:setint(0, actor, "LZY_Sign_time", serialize(now_time_tab))
--     end
-- end
-- GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, "Sign")

local function _goDailyUpdate(actor)
    local day = lib996:getint(0, actor, _receive_day) + 1
    if day > 7 then
        day = 7
    end
    lib996:release_print("sss", day)
    lib996:setint(0, actor, _receive_day, day)
    if _day_table[day] then
        lib996:setint(0, actor, _day_table[day], _state.can_receive)
    end


end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, "Sign")