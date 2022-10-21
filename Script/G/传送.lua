lib996:include("Script/serialize.lua")

local cfg_deliver = lib996:include("QuestDiary/cfgcsv/cfg_deliver.lua")
local cfg_map_npc = lib996:include("QuestDiary/cfgcsv/cfg_map_npc.lua")

function SyncResponse(actor,npcid)
    -- lib996:showformwithcontent(actor, "", "Deliver.config("..npcid..")")

    for _, v in ipairs(cfg_map_npc) do
        if v.npcidx == npcid then
            lib996:showformwithcontent(actor, "G/传送面板", "deliver#"..npcid)
        end
    end
    
    print("npcid"..npcid)
end

function MapMove(actor,id)
    local Id =tonumber(id)
    --local mapName = cfg_deliver[Id].beizhu
    local mapId = cfg_deliver[Id].toMapId
    local posX = 0
    local posY = 0
    print("mapId"..mapId)

    if cfg_deliver[Id].cost ~= nil then
        local cost_id = cfg_deliver[Id].cost[1][1]
        local cost_num = cfg_deliver[Id].cost[1][2]
        if not QsQcheckMoneyNum(actor, cost_id, cost_num) then
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>货币不足，无法传送</font>","Type":9}')
            return
        end

        --扣除货币数量
        lib996:changemoney(actor, cost_id, "-", cost_num, "地图传送扣除货币", true)



        if cfg_deliver[Id].x ~= nil then
            posX = cfg_deliver[Id].x
        end

        if cfg_deliver[Id].y ~= nil then
            posY = cfg_deliver[Id].y
        end
    end
    if mapId then
        lib996:mapmove(actor, mapId, posX, posY, 1)
    end
end

GameEvent.add(EventCfg.onClicknpc, SyncResponse, "传送")