lib996:include("Script/serialize.lua")

local cfg = {
    name = "ת��֮��",
    cost = {
        [1] = 10014, --ת��֤��
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
        zhuanshengyiman = '{"Msg":"<font color=\'#ff0000\'>ת������</font>","Type":9}',
        buzu = '{"Msg":"<font color=\'#ff0000\'>ת��֤������</font>","Type":9}',
    },
}

function getcfg_zhuanshengzhili()
    return cfg
end

--
function zhuanshengzhili(actor)
    lib996:showformwithcontent(actor, "A/ת��֮��", "")
end

function SyncResponse(actor)
    sendList = {}
    lib996:showformwithcontent(actor, "", "zhuanshengzhili.SyncResponse(" .. serialize(sendList) .. ")")
end

function zhuansheng(actor, reinlv)
    if not reinlv then
        return
    end
    --    ת��
    --    1.��������Ƿ����
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
    --    2.�۳�����
    QsQtakeItemByTable(actor, cost, "")
    --    3.ת����һ
    lib996:setrelevel(actor, reinlv + 1)
    --    4.���Ը���
    QsQupdateSomeMoney(actor, {}, cfg.money)
    --    5.ˢ�½���
    --lib996:showformwithcontent(actor, "", "zhuanshengzhili.updateUI()")
    --lib996:showformwithcontent(actor, "A/ת��֮��", "")

end