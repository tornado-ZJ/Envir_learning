lib996:include("Script/serialize.lua")


local cfg = require_ex("Envir/QuestDiary/cfgcsv/cfg_hunqi")
local hun_tab = {}
for k, v in ipairs(cfg) do
    hun_tab[v.type] = hun_tab[v.type] or {}
    hun_tab[v.type][v.level] = hun_tab[v.type][v.level] or {}
    hun_tab[v.type][v.level] = {name=v.name,cost=v.cost}

end
local cfg_hunqi = hun_tab

local site = {
    [1] = 71,   --name=昆仑镜[1星]   id=602001
    [2] = 74,   --name=琉璃瓶[1星]   id=605001
    [3] = 75,   --name=伏羲琴[1星]   id=606001
    [4] = 76,   --name=功德笔[1星]   id=607001
}

function btnup(actor,pag)
    pag = tonumber(pag)

    local item = lib996:linkbodyitem(actor,site[pag])
    if item == "0" then return end
    local id = lib996:getiteminfo(actor,item,2)
    local index = lib996:getiteminfo(actor,item,1)
    local lv = 1
    for i=1, #cfg_hunqi[pag] do
        if id == cfg_hunqi[pag][i]["name"] then
            lv = i
            break
        end
    end

    if lv == #cfg_hunqi[pag] then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>已满级</font>","Type":9}')
        return
    end

    local cfg = cfg_hunqi[pag][lv]

    local name = QsQIsItemNumByTable(actor, cfg.cost)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料不足</font>","Type":9}')
        return
    end

    QsQtakeItemByTable(actor, cfg.cost)
    lib996:delitembymakeindex(actor,index) --销毁身上装备

    local idx = cfg_hunqi[pag][lv+1]["name"]
    local name = lib996:getstditeminfo(idx, 1)
    LOGPrint("name="..name)
    LOGPrint("site[pag]="..site[pag])


    if lib996:giveonitem(actor,site[pag],name, 1) then --直接装备
        LOGPrint("111111111111")
    end
    lib996:showformwithcontent(actor, "", "tejie.shuxing("..pag..")")
end



