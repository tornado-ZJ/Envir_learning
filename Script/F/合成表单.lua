lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_compound.lua")

local ratio = 10000 --��ֱ�

function main(actor,idx)
    idx = tonumber(idx)

    local cfg = _cfg[idx]

    if not cfg then return end

    if not Bag.checkBagEmptyNum(actor, 1) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�����ռ䲻��!</font>","Type":9}')
        return
    end

    local name = Player.checkItemNumByTable(actor, cfg.itemid1)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>����['..name..']����</font>","Type":9}')
        return
    end

    Player.takeItemByTable(actor, cfg.itemid1, "���ߺϳ�")

    if FProbabilityHit(cfg.probability, ratio) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>���ߺϳ�ʧ��!</font>","Type":9}')
        lib996:showformwithcontent(actor, "", "Hecheng.updateText()")
        return
    end

    Player.giveItemByTable(actor, cfg.product, "��Ʒ�ϳ�")
    lib996:showformwithcontent(actor, "", "Hecheng.updateText()")
end

--NPC�������
local function _onClicknpc(actor,npcid)
    if npcid == 312 then
        lib996:showformwithcontent(actor,"F/�ϳ����", "Hecheng")
    end
end
GameEvent.add(EventCfg.onClicknpc, _onClicknpc, filename)