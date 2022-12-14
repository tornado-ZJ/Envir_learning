---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by 19838.
--- DateTime: 2022/10/12 17:33
---

lib996:include("Script/serialize.lua")
local cfg = {
    name = "沙城捐献",
    shuxing = {
        [1] = {
            [1] = 1,
            [2] = 1000,
        },
    },
    money = {
        [1] = {
            [1] = ConstCfg.money.beigong,
            [2] = 100,
        },
        [2] = {
            [1] = ConstCfg.money.baolv,
            [2] = 100,
        },
        [3] = {
            [1] = ConstCfg.money.ddqg,
            [2] = 100000,
        }
    },
    effectid = 30117,
    rank = {
        [1] = {
            chenghaoname = "第一富豪",
            effectid = 30118,
            shuxing = {
                [1] = {
                    [1] = 1,
                    [2] = 3000,
                },
            },
            money = {
                [1] = {
                    [1] = ConstCfg.money.beigong,
                    [2] = 100,
                },
                [2] = {
                    [1] = ConstCfg.money.baolv,
                    [2] = 100,
                },
                [3] = {
                    [1] = ConstCfg.money.ddqg,
                    [2] = 100000,
                }
            },
        },
        [2] = {
            chenghaoname = "第二富豪",
            effectid = 30119,
            shuxing = {
                [1] = {
                    [1] = 1,
                    [2] = 2000,
                },
            },
            money = {
                [1] = {
                    [1] = ConstCfg.money.beigong,
                    [2] = 100,
                },
                [2] = {
                    [1] = ConstCfg.money.baolv,
                    [2] = 100,
                },
                [3] = {
                    [1] = ConstCfg.money.ddqg,
                    [2] = 100000,
                }
            },
        },
        [3] = {
            chenghaoname = "第三富豪",
            effectid = 30120,
            shuxing = {
                [1] = {
                    [1] = 1,
                    [2] = 1000,
                },
            },
            money = {
                [1] = {
                    [1] = ConstCfg.money.beigong,
                    [2] = 100,
                },
                [2] = {
                    [1] = ConstCfg.money.baolv,
                    [2] = 100,
                },
                [3] = {
                    [1] = ConstCfg.money.ddqg,
                    [2] = 100000,
                }
            },
        }
    },
    msg = {
        rmbbuzu = '{"Msg":"<font color=\'#ff0000\'>RMB点不足！</font>","Type":9}',
        juanxianchenggong = '{"Msg":"<font color=\'#ff0000\'>捐献成功！</font>","Type":9}',
    },
    var = {
      juanxian_number = "个人捐献数量",
    },
    sysvar = {
        juanxian_zongshu = "捐献总数",
        rank = "捐献前三名",
    },
}

--[[
    个人变量：个人捐献数量int
    系统变量：捐献总数int
]]

function getcfg_shachengjuanxian()
    return cfg
end

function shachengjuanxian(actor)
    lib996:showformwithcontent(actor, "A/沙城捐献", "")
end

function SyncResponse(actor)
    --拿到前三名的捐献信息
    local juanxian_tab = lib996:sorthumvar(cfg.var.juanxian_number, 0, 1, 3)
    if juanxian_tab == nil then
        juanxian_tab = {}
    end
    --捐献总数
    local juanxian_zongshu = lib996:getsysint(cfg.sysvar.juanxian_zongshu)
    local juanxian_number = lib996:getint(0, actor, cfg.var.juanxian_number)
    --print(lib996:tbl2json(juanxian_tab))
    local sendList = {}
    table.insert(sendList, juanxian_tab)
    table.insert(sendList, juanxian_number)
    table.insert(sendList, juanxian_zongshu)
    --print(serialize(sendList))
    --lib996:showformwithcontent(actor, "", "CityDonate.SyncResponse("..serialize(SendList)..")")
    lib996:showformwithcontent(actor, "", "shachengjuanxian.SyncResponse("..serialize(sendList)..")")
end

function Juanxian(actor, number)
    if not number then
        return
    end
    number = tonumber(number)

    --检查rmb点是否充足
    if not QsQcheckMoneyNum(actor, ConstCfg.money.rmb, number) then
        lib996:sendmsg(actor, 1, cfg.msg.rmbbuzu)
        return
    end
    --获取捐献前捐献榜排行
    local rank_1 = unserialize(lib996:getsysstr(cfg.sysvar.rank))
    --print(type(rank_1))
    --扣除rmb点
    lib996:changemoney(actor,ConstCfg.money.rmb,"-",number,"",true)
    --修改个人变量和系统变量
    local juanxian_number = lib996:getint(0, actor, cfg.var.juanxian_number)
    lib996:setint(0, actor, cfg.var.juanxian_number, juanxian_number + number)
    local juanxian_zongshu = lib996:getsysint(cfg.sysvar.juanxian_zongshu)
    lib996:setsysint(cfg.sysvar.juanxian_zongshu, juanxian_zongshu + number)
    lib996:sendmsg(actor, 1, cfg.msg.juanxianchenggong)
    --给沙捐称号
    if not lib996:checktitle(actor, cfg.name) then
        lib996:playeffect(actor, cfg.effectid,0,0,0,0,0)
        lib996:confertitle(actor, cfg.name)
        --更新属性
        QsQupdateSomeAddr(actor, {}, cfg.shuxing)
    --    更新money属性
        QsQupdateSomeMoney(actor, {}, cfg.money)
    end
    --获取捐献后排行前三的人
    local rank3 = lib996:sorthumvar(cfg.var.juanxian_number, 0, 1, 3)
    --遍历排行前三
    --for i, v in pairs(rank3) do
    --    print(i,v)
    --end
    rank_2 = {}
    rank_2[1] = rank3[1]
    rank_2[2] = rank3[3]
    rank_2[3] = rank3[5]

    ----print(lib996:tbl2json(rank_1))
    ----print(lib996:tbl2json(rank_2))
    if not table.arrequal(rank_1, rank_2) then
        print(222)
        --更新排行榜变量
        lib996:setsysstr(cfg.sysvar.rank,serialize(rank_2))
    --    更新前三名属性
        for i, v in ipairs(rank_1) do
            --先将属性清空
            QsQupdateSomeAddr(lib996:getplayerbyname(v), cfg.rank[i].shuxing, {})
            --将money清空
            QsQupdateSomeMoney(lib996:getplayerbyname(v), cfg.rank[i].money, {})
            lib996:deprivetitle(lib996:getplayerbyname(v),cfg.rank[i].chenghaoname)
            lib996:clearplayeffect(lib996:getplayerbyname(v),cfg.rank[i].effectid)
            lib996:playeffect(lib996:getplayerbyname(v), cfg.effectid)
        end
        for i, v in ipairs(rank_2) do
            --更新属性
            QsQupdateSomeAddr(lib996:getplayerbyname(v), {}, cfg.rank[i].shuxing)
            --更新money
            QsQupdateSomeMoney(lib996:getplayerbyname(v), {}, cfg.rank[i].money)
            --特效
            lib996:confertitle(lib996:getplayerbyname(v),cfg.rank[i].chenghaoname)
            lib996:clearplayeffect(lib996:getplayerbyname(v), cfg.effectid)
            lib996:playeffect(lib996:getplayerbyname(v), cfg.rank[i].effectid, 0,0,0,0,0)
        end
    end
    SyncResponse(actor)
end

GameEvent.add(EventCfg.onLoginAttr, function(actor, loginattrs)
    --
    if lib996:checktitle(actor, cfg.name) then
        table.insert(loginattrs, cfg.shuxing)
        lib996:playeffect(actor, cfg.effectid,0,0,0,0,0)
    end

    local rank = lib996:humvarrank(actor,cfg.var.juanxian_number,0,1)
    if rank <= 3 and rank > 0 then
        lib996:clearplayeffect(actor, cfg.effectid)
        lib996:playeffect(actor, cfg.rank[rank].effectid,0,0,0,0,0)
        table.insert(loginattrs, cfg.rank[rank].shuxing)
    end
end, "沙城捐献")
