lib996:include("Script/serialize.lua")


local cfg_zhuansheng = lib996:include("QuestDiary/cfgcsv/cfg_转生.lua")


function ZhuanShenggok(actor)
    local zslevel = lib996:getbaseinfo(actor, 39)
    local next_zslevel = zslevel + 1
    local cfg = cfg_zhuansheng[zslevel]
    local next_cfg = cfg_zhuansheng[next_zslevel]


    if not next_cfg then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>无法继续转生</font>","Type":9}')
        return
    end

    local level = lib996:getbaseinfo(actor, 6)
    if level < cfg.Level then       --判断人物等级是否满足条件
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>当前等级不足</font>","Type":9}')
        return
    end

    local name = QsQIsItemNumByTable(actor, cfg.Consume)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料不足</font>","Type":9}')
        return
    end

    QsQtakeItemByTable(actor, cfg.Consume)
    lib996:changelevel(actor, "-", cfg.DelLv)
    lib996:setbaseinfo(actor, 39, next_zslevel)
    QsQupdateSomeAddr(actor, cfg.Attribute0, next_cfg.Attribute0)

    --lib996:showformwithcontent(actor, "", "ZhuanSheng.updateUI("..next_zslevel..")")
end


GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local zslevel = lib996:getbaseinfo(actor, 39)
    if zslevel <= 0 then return end
    local cfg = cfg_zhuansheng[zslevel]
    if not cfg then return end
    table.insert(loginattrs, cfg.Attribute0)
end, "转生")
