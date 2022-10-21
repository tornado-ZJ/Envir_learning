lib996:include("Script/serialize.lua")

local cfg = {
    msg = {
        rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMB点不足！</font>","Type":9}',
    },
    [1] = {
        name = "初入江湖",
        level = 85,
        effectid = 30101,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 5000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 0,
            },
            [2] = {
                [1] = 3,
                [2] = 0,
            },
            [3] = {
                [1] = 4,
                [2] = 0,
            },
            [4] = {
                [1] = 56,
                [2] = 0,
            },
        },
    },
    [2] = {
        name = "名动江湖",
        level = 90,
        effectid = 30102,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 10000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 300,
            },
        },
    },
    [3] = {
        name = "威震八方",
        level = 95,
        effectid = 30103,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 20000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 600,
            },
        },
    },
    [4] = {
        name = "剑雨风行",
        level = 100,
        effectid = 30104,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 30000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 900,
            },
        },
    },
    [5] = {
        name = "武林至尊",
        level = 110,
        effectid = 30105,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 80000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 1200,
            },
        },
    },
    [6] = {
        name = "我就是神",
        level = 120,
        effectid = 30106,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 140000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 1500,
            },
        },
    },
    [7] = {
        name = "破天轩辕",
        level = 130,
        effectid = 30107,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 210000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 1800,
            },
        },
    },
    [8] = {
        name = "烽火杀戮",
        level = 140,
        effectid = 30108,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 290000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 2100,
            },
        },
    },
    [9] = {
        name = "玄灵驭世",
        level = 150,
        effectid = 30109,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 380000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 2400,
            },
        },
    },
    [10] = {
        name = "众生俯仰",
        level = 160,
        effectid = 30110,
        cost = {
            [1] = {
                [1] = ConstCfg.money.rmb,
                [2] = 480000,
            },
        },
        shuxing = {
            [1] = {
                [1] = 1,
                [2] = 400,
            },
            [2] = {
                [1] = 3,
                [2] = 80,
            },
            [3] = {
                [1] = 56,
                [2] = 2700,
            },
        },
    },

}

function getcfg_chenghao()
    return cfg
end

--
function chenghaoshengji(actor)
    lib996:showformwithcontent(actor, "A/称号升级", "")
end

function SyncResponse(actor)
    local cur_chenghao = 1
    for i, v in ipairs(cfg) do
        if lib996:checktitle(actor, v.name) then
            cur_chenghao = i
            break
        end
    end
    sendList = {}
    table.insert(sendList, cur_chenghao)
    lib996:showformwithcontent(actor, "", "chenghaoshengji.SyncResponse(" .. serialize(sendList) .. ")")
end

function chenghao(actor, cur_chenghao)
    if not cur_chenghao then
        return
    end
    cur_chenghao = tonumber(cur_chenghao)
    local cur_tbl = cfg[cur_chenghao]
    local next_tbl = cfg[cur_chenghao + 1]
    --local cur_chenghao = {}
    --print(cur_chenghao)
    --    称号升级
    --    1.检测货币够不够
    if QsQIsItemNumByTable(actor, next_tbl.cost) then
        lib996:sendmsg(actor, 1, cfg.msg.rmbbuzu)
        return
    end
    --    2.扣除货币
    lib996:changemoney(actor, next_tbl.cost[1][1], "-", next_tbl.cost[1][2], "", true)
    --    3.去除称号
    lib996:deprivetitle(actor, cur_tbl.name)
    --    4.去除特效
    lib996:clearplayeffect(actor, cur_tbl.effectid)
    --    5.添加称号
    lib996:confertitle(actor, next_tbl.name)
    --    6.添加特效
    lib996:playeffect(actor, next_tbl.effectid,0,0,0,0,0)
    --    7.更新属性
    QsQupdateSomeAddr(actor, cur_tbl.shuxing, next_tbl.shuxing)
    --    8。更新money属性
    QsQupdateSomeMoney(actor, cur_tbl.money, next_tbl.money)
    --    9.刷新界面
    SyncResponse(actor)
end

GameEvent.add(EventCfg.onLoginAttr, function(actor, loginattrs)
    for i, v in ipairs(cfg) do
        if lib996:checktitle(actor, v.name) then
            lib996:playeffect(actor, v.effectid, 0,0,0,0,0);
            table.insert(loginattrs, v.shuxing)
            break
        end
    end
end)