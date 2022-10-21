lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_compound.lua")

local ratio = 10000 --万分比

function main(actor,idx)
    idx = tonumber(idx)

    local cfg = _cfg[idx]

    if not cfg then return end

    if not Bag.checkBagEmptyNum(actor, 1) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足!</font>","Type":9}')
        return
    end

    local name = Player.checkItemNumByTable(actor, cfg.itemid1)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料['..name..']不足</font>","Type":9}')
        return
    end

    Player.takeItemByTable(actor, cfg.itemid1, "道具合成")

    if FProbabilityHit(cfg.probability, ratio) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>道具合成失败!</font>","Type":9}')
        lib996:showformwithcontent(actor, "", "Hecheng.updateText()")
        return
    end

    Player.giveItemByTable(actor, cfg.product, "物品合成")
    lib996:showformwithcontent(actor, "", "Hecheng.updateText()")
end

--NPC点击触发
local function _onClicknpc(actor,npcid)
    if npcid == 312 then
        lib996:showformwithcontent(actor,"F/合成面板", "Hecheng")
    end
end
GameEvent.add(EventCfg.onClicknpc, _onClicknpc, filename)