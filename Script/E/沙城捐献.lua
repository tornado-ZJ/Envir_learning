
lib996:include("Script/serialize.lua")
local cfg_sj = lib996:include("QuestDiary/cfgcsv/cfg_沙城捐献.lua")

--function shachengjuanxian(actor)
--    lib996:showformwithcontent(actor, "A/沙城捐献", "")
--end

function SyncResponse(actor)
    local DonateRank_List = lib996:sorthumvar("玩家捐献数",0,1,10)
    --打印排行前十的沙捐名字和捐献数
    --print(lib996:tbl2json(DonateRank_List))
    if DonateRank_List == nil then
        DonateRank_List = {}
    end
    --捐献总数
    local AllDonateNum = lib996:getsysstr("捐献奖池的数量")
    AllDonateNum = AllDonateNum == "" and 0 or AllDonateNum
    --玩家捐献数
    local DonateNum = lib996:getint(0,actor,"玩家捐献数")
    --需要发送给前端的数据
    local SendList = {}
    table.insert(SendList,DonateRank_List)
    table.insert(SendList,AllDonateNum)
    table.insert(SendList,DonateNum)
    print(lib996:tbl2json(SendList))
    -- print(lib996:gethumnewvalue(actor,2))
    -- print(lib996:gethumnewvalue(actor,7))
    -- print(lib996:gethumnewvalue(actor,8))
    -- print(lib996:gethumnewvalue(actor,58))

    lib996:showformwithcontent(actor, "", "CityDonate.SyncResponse("..serialize(SendList)..")")
end
function Donate(actor,param)
    if not param then return end
    local D_num = tonumber(param)

    if not QsQcheckMoneyNum(actor, ConstCfg.money.rmb, D_num) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>RMB点不足！</font>","Type":9}')
        return
    end

    local DonateNum = lib996:getint(0,actor,"玩家捐献数")
    if D_num < 1000 then return end
    if DonateNum + D_num  > 2100000000 then return end
    lib996:setint(0,actor,"玩家捐献数", DonateNum + D_num)

    local AllDonateNum = tonumber(lib996:getsysstr("捐献奖池的数量"))
    AllDonateNum = AllDonateNum == nil and 0 or AllDonateNum
    lib996:setsysstr("捐献奖池的数量", AllDonateNum + D_num )


    local rank = lib996:humvarrank(actor,"玩家捐献数",0,1) --取自定义数字变量名位置

    if rank ~= 0 and rank <= 10 then
        SetDonateAttr(actor)--更新排名属性
    end
    lib996:changemoney(actor, 7, "-", D_num, "", true)

    SyncResponse(actor)--同步信息
end


--更新排名属性
function SetDonateAttr(actor)
    local DonateRank_List = lib996:sorthumvar("玩家捐献数",0,1,10) --最新排名表
    if not DonateRank_List then return end
    local Dk_data = unserialize(lib996:getsysstr("沙城捐献表"))
    if not Dk_data then
        for i = 1,math.ceil(#DonateRank_List/2) do
            local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --根据玩家名
            QsQupdateSomeAddr(player, nil, cfg_sj[i].attribute1)
        end
    else
        for i = 1,math.ceil(#Dk_data/2) do
            local player = lib996:getplayerbyid(Dk_data[i * 2 - 1]) --根据玩家唯一id获取对象
            QsQupdateSomeAddr(player, cfg_sj[i].attribute1,nil)
            if player then
                QsQupdateSomeAddr(player, cfg_sj[i].attribute1,nil)
            end
        end
        for i = 1,math.ceil(#DonateRank_List/2) do
            local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --根据玩家名
            if player then
                QsQupdateSomeAddr(player, nil, cfg_sj[i].attribute1)
            end
        end
    end
    local save_data = {}
    for i = 1,math.ceil(#DonateRank_List/2) do
        local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --根据玩家名
        local userid = lib996:getbaseinfo(player,2)
        table.insert(save_data,userid)
        table.insert(save_data,DonateRank_List[i * 2])
    end
    lib996:setsysstr("沙城捐献表", serialize(save_data))
end
--重置参数
function Initparam()
    --lib996:clearhumcustvar("*","玩家捐献数")
    -- lib996:setsysstr("捐献奖池的数量", "")

    -- local DonateRank_List = lib996:sorthumvar("玩家捐献数",0,1,10)
    -- if DonateRank_List == nil then return end
    -- for i = 1,math.ceil(#DonateRank_List/2) do
    --     local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --根据玩家名
    --     lib996:setint(0,player,"玩家捐献数", 0)
    -- end
    -- local AllDonateNum = lib996:getsysint("捐献奖池的数量")
    -- lib996:setsysint("捐献奖池的数量", 0)
    -- print("重置参数")
end

GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local rank = lib996:humvarrank(actor,"玩家捐献数",0,1) --取自定义数字变量名位置
    if rank and cfg_sj[rank] then
        table.insert(loginattrs,cfg_sj[rank].attribute1)
    end
end, "沙城捐献")

