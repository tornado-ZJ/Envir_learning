
lib996:include("Script/serialize.lua")
local cfg_sj = lib996:include("QuestDiary/cfgcsv/cfg_ɳ�Ǿ���.lua")

--function shachengjuanxian(actor)
--    lib996:showformwithcontent(actor, "A/ɳ�Ǿ���", "")
--end

function SyncResponse(actor)
    local DonateRank_List = lib996:sorthumvar("��Ҿ�����",0,1,10)
    --��ӡ����ǰʮ��ɳ�����ֺ;�����
    --print(lib996:tbl2json(DonateRank_List))
    if DonateRank_List == nil then
        DonateRank_List = {}
    end
    --��������
    local AllDonateNum = lib996:getsysstr("���׽��ص�����")
    AllDonateNum = AllDonateNum == "" and 0 or AllDonateNum
    --��Ҿ�����
    local DonateNum = lib996:getint(0,actor,"��Ҿ�����")
    --��Ҫ���͸�ǰ�˵�����
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
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>RMB�㲻�㣡</font>","Type":9}')
        return
    end

    local DonateNum = lib996:getint(0,actor,"��Ҿ�����")
    if D_num < 1000 then return end
    if DonateNum + D_num  > 2100000000 then return end
    lib996:setint(0,actor,"��Ҿ�����", DonateNum + D_num)

    local AllDonateNum = tonumber(lib996:getsysstr("���׽��ص�����"))
    AllDonateNum = AllDonateNum == nil and 0 or AllDonateNum
    lib996:setsysstr("���׽��ص�����", AllDonateNum + D_num )


    local rank = lib996:humvarrank(actor,"��Ҿ�����",0,1) --ȡ�Զ������ֱ�����λ��

    if rank ~= 0 and rank <= 10 then
        SetDonateAttr(actor)--������������
    end
    lib996:changemoney(actor, 7, "-", D_num, "", true)

    SyncResponse(actor)--ͬ����Ϣ
end


--������������
function SetDonateAttr(actor)
    local DonateRank_List = lib996:sorthumvar("��Ҿ�����",0,1,10) --����������
    if not DonateRank_List then return end
    local Dk_data = unserialize(lib996:getsysstr("ɳ�Ǿ��ױ�"))
    if not Dk_data then
        for i = 1,math.ceil(#DonateRank_List/2) do
            local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --���������
            QsQupdateSomeAddr(player, nil, cfg_sj[i].attribute1)
        end
    else
        for i = 1,math.ceil(#Dk_data/2) do
            local player = lib996:getplayerbyid(Dk_data[i * 2 - 1]) --�������Ψһid��ȡ����
            QsQupdateSomeAddr(player, cfg_sj[i].attribute1,nil)
            if player then
                QsQupdateSomeAddr(player, cfg_sj[i].attribute1,nil)
            end
        end
        for i = 1,math.ceil(#DonateRank_List/2) do
            local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --���������
            if player then
                QsQupdateSomeAddr(player, nil, cfg_sj[i].attribute1)
            end
        end
    end
    local save_data = {}
    for i = 1,math.ceil(#DonateRank_List/2) do
        local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --���������
        local userid = lib996:getbaseinfo(player,2)
        table.insert(save_data,userid)
        table.insert(save_data,DonateRank_List[i * 2])
    end
    lib996:setsysstr("ɳ�Ǿ��ױ�", serialize(save_data))
end
--���ò���
function Initparam()
    --lib996:clearhumcustvar("*","��Ҿ�����")
    -- lib996:setsysstr("���׽��ص�����", "")

    -- local DonateRank_List = lib996:sorthumvar("��Ҿ�����",0,1,10)
    -- if DonateRank_List == nil then return end
    -- for i = 1,math.ceil(#DonateRank_List/2) do
    --     local player = lib996:getplayerbyname(DonateRank_List[i * 2 - 1]) --���������
    --     lib996:setint(0,player,"��Ҿ�����", 0)
    -- end
    -- local AllDonateNum = lib996:getsysint("���׽��ص�����")
    -- lib996:setsysint("���׽��ص�����", 0)
    -- print("���ò���")
end

GameEvent.add(EventCfg.onLoginAttr, function (actor, loginattrs)
    local rank = lib996:humvarrank(actor,"��Ҿ�����",0,1) --ȡ�Զ������ֱ�����λ��
    if rank and cfg_sj[rank] then
        table.insert(loginattrs,cfg_sj[rank].attribute1)
    end
end, "ɳ�Ǿ���")

