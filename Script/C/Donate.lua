lib996:include("Script/serialize.lua")

local cfg_sj = lib996:include("QuestDiary/cfgcsv/cfg_sj.lua")

--local cfg_zhuansheng = require("Envir/QuestDiary/cfgcsv/cfg_zhuansheng")


function DonateCount(actor, param1)

    local num = tonumber(param1)
    lib996:release_print('aa', num)
    lib996:release_print("3333333333")

    local count = lib996:querymoney(actor,7)
    if count < num then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>灵符不足</font>","Type":9}')
        return
    end
    lib996:changemoney(actor,7,"-",num,"沙城捐献",true)

    lib996:inisysvar("integer","LZYfucur_juanxian")
    local cur_juan = lib996:getsysvarex("LZYfucur_juanxian",996,1)
    local cur_juan = lib996:setsysvarex("LZYfucur_juanxian",cur_juan + num,1)
    lib996:release_print(cur_juan)
    


end

-- function clickenter()
--     -- GUI:addOnClickEvent(widget, value)
-- end
