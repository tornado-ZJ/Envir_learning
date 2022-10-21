-- -------------------------------------------------------------------------------------
-- -------------------------------↓↓↓ 31类物品触发 ↓↓↓----------------------------------
-- -------------------------------------------------------------------------------------
--itemUse使用规则:cfg_item.xls StdMode类为31,stdmodefunc函数名后跟Anicount栏参数 
--例如:  背包扩充令:StdMode = 31,Anicount = 10000,调用函数 stdmodefunc10000

local cfg_map_xz = require_ex("Envir/QuestDiary/cfgcsv/cfg_map_xz")
local cfg_huichengshi = require_ex("Envir/QuestDiary/cfgcsv/cfg_huichengshi")

--随机传送石
function stdmodefunc99(actor,item)
    local mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    for i, v in ipairs(cfg_map_xz) do
        if mapid == v.suiji then  --禁止使用随机
            lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>禁止使用随机</font>","Type":9}')
            lib996:stop(actor)
            return
        end
    end
    lib996:map(actor,mapid)
end

--传送石
function stdmodefunc1(actor,item)
    local mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    for i, v in ipairs(cfg_map_xz) do
        if mapid == v.huicheng then  --禁止使用回城石
            lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>禁止使用回城</font>","Type":9}')
            lib996:stop(actor)
            return
        end
    end
    local cfg_back = cfg_huichengshi[mapid]
    if cfg_back then
        lib996:mapmove(actor,cfg_back.Id,cfg_back.npc,cfg_back.npcidx)
    else
        lib996:mapmove(actor,"xtc3",342,278)
    end
end