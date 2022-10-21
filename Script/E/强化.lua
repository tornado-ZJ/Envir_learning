
lib996:include("Script/serialize.lua")

local cfg_qianghuadz = require_ex("Envir/QuestDiary/cfgcsv/cfg_qianghuadz")
local qh_tab = {}
for k, v in ipairs(cfg_qianghuadz) do  --适配强化表
    qh_tab[v.type] = qh_tab[v.type] or {}
    qh_tab[v.type][v.level] = qh_tab[v.type][v.level] or {}
    qh_tab[v.type][v.level] = {name=v.name,cost=v.cost,cgjl=v.cgjl,jiacheng=v.jiacheng,attribute=v.attribute,itemid=v.itemid}
end
cfg_qianghuadz = qh_tab


local qh = "C_QsQqianghua"  --强化变量名

function qianghua(actor)
    --print(强化)
    local qhvar_tab = lib996:getplayvar(actor,qh)
    if qhvar_tab == nil or qhvar_tab == "" then
        qhvar_tab={}
        for i=1,#cfg_qianghuadz do
            qhvar_tab[i] = {}
            qhvar_tab[i][1] = 0
            qhvar_tab[i][2] = 0
        end
        qhvar_tab = serialize(qhvar_tab)
        lib996:setplayvar(actor, "HUMAN",qh,qhvar_tab,1)
    end
    lib996:showformwithcontent(actor, "A/强化", "QSQ_Qianghua#"..qhvar_tab)
end

function qianghuaok(actor,equip)
    equip = tonumber(equip)
    local cfg = cfg_qianghuadz[equip]

    local qhvar_tab = lib996:getplayvar(actor,qh)
    qhvar_tab = unserialize(qhvar_tab)
    if qhvar_tab == nil or qhvar_tab == "" then
        qhvar_tab={}
        for i=1,#cfg_qianghuadz do
            qhvar_tab[i] = {}
            qhvar_tab[i][1] = 0
            qhvar_tab[i][2] = 0
        end
    end


    local tab = qhvar_tab[equip] or {} --存储 强化等级与失败次数
    local lv,cg = tab[1] or 0,tab[2] or 0

    local cfglv = cfg[lv+1]
    local ncfglv = cfg[lv+2]
    qhvar_tab[equip] = {}
    if not ncfglv then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFFF00\'>已满阶</font>","Type":9}')
        return
    end

    local name = QsQIsItemNumByTable(actor, cfglv.cost)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFFF00\'>材料不足</font>","Type":9}')
        return
    end

    QsQtakeItemByTable(actor, cfglv.cost)

    local random = math.random(1, 10000) 
    local jilv = cfglv.cgjl + cfglv.jiacheng * cg
    if random >= jilv then  --失败进入
        local fail = cg + 1
        qhvar_tab[equip][1] = lv
        qhvar_tab[equip][2] = fail

        lib996:setplayvar(actor, "HUMAN",qh,serialize(qhvar_tab),1)
        lib996:showformwithcontent(actor, "", "Qianghua.shuaxing("..equip..","..serialize(qhvar_tab)..")")
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFFF00\'>强化失败</font>","Type":9}')
        return
    end
    qhvar_tab[equip][1] = lv + 1
    qhvar_tab[equip][2] = 0
    lib996:setplayvar(actor, "HUMAN",qh,serialize(qhvar_tab),1)
    local att_tab = cfglv.attribute
    if att_tab == 0 then
        att_tab = nil
    end
    local att_ntab = ncfglv.attribute

    QsQupdateSomeAddr(actor, att_tab, att_ntab)

    lib996:showformwithcontent(actor, "", "Qianghua.shuaxing("..equip..","..serialize(qhvar_tab)..")")
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFFF00\'>强化成功</font>","Type":9}')

end





function playerVar(actor)
    lib996:iniplayvar(actor, "string", "HUMAN", qh)
end

GameEvent.add(EventCfg.goPlayerVar, playerVar, "强化")

GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local qhvar_tab = lib996:getplayvar(actor,qh)
    qhvar_tab = unserialize(qhvar_tab)

    if qhvar_tab == nil or qhvar_tab == "" then
        qhvar_tab={}
        for i=1,#cfg_qianghuadz do
            qhvar_tab[i] = {}
            qhvar_tab[i][1] = 0
            qhvar_tab[i][2] = 0
        end
        qhvar_tab = serialize(qhvar_tab)
        lib996:setplayvar(actor, "HUMAN",qh,qhvar_tab,1)
        return
    end
    --dump(qhvar_tab)
    for i=1,#qhvar_tab do
        local lv = qhvar_tab[i][1] + 1
        local att_tab = cfg_qianghuadz[i][lv].attribute
        if att_tab ~= 0 then
            if att_tab then
                table.insert(loginattrs, att_tab)
            end
        end
    end
end, "强化")


