lib996:include("Script/serialize.lua")

local cfg = {
    name = "转生之力",
    cost = {
        [1] = 10014, --转生证明
        [2] = 1
    },
    shuxing = {

    },
    money = {
        [1] = {
            [1] = ConstCfg.money.beigong,
            [2] = 10,
        }
    },
    effectid = "",
    msg = {
        zhuanshengyiman = '{"Msg":"<font color=\'#ff0000\'>转生已满</font>","Type":9}',
        buzu = '{"Msg":"<font color=\'#ff0000\'>转生证明不足</font>","Type":9}',
    },
}

function getcfg_zhuanshengzhili()
    return cfg
end

--
function zhuanshengzhili(actor)
    lib996:showformwithcontent(actor, "A/转生之力", "")
end

function SyncResponse(actor)
    sendList = {}
    lib996:showformwithcontent(actor, "", "zhuanshengzhili.SyncResponse(" .. serialize(sendList) .. ")")
end

function zhuansheng(actor, reinlv)
    if not reinlv then
        return
    end
    --    转生
    --    1.检查消耗是否充足
    --    print(cfg.cost[2] * reinlv)
    local cost = {
        [1] = {
            [1] = cfg.cost[1],
            [2] = cfg.cost[2] + reinlv
        }
    }
    if QsQIsItemNumByTable(actor, cost) then
        lib996:sendmsg(actor, 1, cfg.msg.buzu)
        return
    end
    --    2.扣除消耗
    QsQtakeItemByTable(actor, cost, "")
    --    3.转生加一
    lib996:setrelevel(actor, reinlv + 1)
    --    4.属性更新
    QsQupdateSomeMoney(actor, {}, cfg.money)
    --    5.刷新界面
    --lib996:showformwithcontent(actor, "", "zhuanshengzhili.updateUI()")
    --lib996:showformwithcontent(actor, "A/转生之力", "")

end