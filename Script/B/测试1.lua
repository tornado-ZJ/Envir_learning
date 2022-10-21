lib996:include("Script/serialize.lua")



-- function test(actor,npcid)

--     LOGPrint("ceshiltalk")


    
-- end

-- function blaobing(actor,npcid)

--     if npcid == ceshiltalk then
--         lib996:showformwithcontent(actor,"ceshiltalk","QSQ_ceshiltalk#"..npcid)
--         lib996:release_print(npcid) 
--     end
    
-- end



-- function ceshiltalk(actor,btn)

--     local b = ceshiltalk
--     local a = serialize(b)
--     lib996:showformwithcontent(actor, "", "ceshiltalk.ceshiltalk("..a..")")
--  -- lib996:release_print(a)
-- end


-- GameEvent.add(EventCfg.onClicknpc ,blaobingok,"blaobing")

function blaobingok111(actor,npcid)

  
        --lib996:showformwithcontent(actor, "ceshiltalk", "Jzy_ceshiltalk#"..npcid)
        --lib996:release_print(npcid)
        --lib996:release_print("777777777777777777")
    
end

GameEvent.add(EventCfg.onClicknpc ,blaobingok111,"blaobingok111")
