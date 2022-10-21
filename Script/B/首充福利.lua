local _cfg_lj = lib996:include("Script/serialize.lua")
local _cfg_mr = lib996:include("3rd/log/Logger.lua")

local cfg_shouchong = lib996:include("QuestDiary/cfgcsv/cfg_shouchong.lua")

local _var_name_getInfo = {}                --首充领取情况

local cfg = cfg_shouchong

for i, v in ipairs(cfg) do
    table.insert(_var_name_getInfo,"C_QsQgetInfo_"..i)
end


local _state = {
    no_receive      = 0,        --- 未到时间/不可领取
    yes_receive     = 1,        --- 可以领取
    has_receive     = 2,        --- 已领取
}

local _sync_data_memory = {     --- 优先分配同步内存数据{{领取情况}}
    1,1,1,
}

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--- 同步信息
function SyncResponse(actor)
    for i,varname in ipairs(_var_name_getInfo) do
        lib996:setint(0,actor,varname, 1)
        _sync_data_memory[i] = lib996:getint(0,actor,varname)
    end

    print("首充，同步信息")
    -- lib996:showformwithcontent(actor,"", "DailyRecharge.SyncResponse()")
    lib996:showformwithcontent(actor, "B/shouchong", "QSQ_shouchong#"..serialize(_sync_data_memory))
end

--充值成功时
local function _playerrecharge(actor)--充值

end
GameEvent.add(EventCfg.onRecharge,  _playerrecharge, "首充福利")  --充值

function LingQu(actor,num)
    num = tonumber(num)
    local cfg = cfg_shouchong[num]
    Player.giveItemByTable(actor, cfg.reward)
end
--领取道具

    