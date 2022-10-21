lib996:include("Script/serialize.lua")

local Str_List = {"��ɷ«�ȼ�", "��ڤ��ȼ�", "�׻����ȼ�", "����ӡ�ȼ�"}
local add_List = {0, 50, 100, 130}

local cfg_baowu = lib996:include("QuestDiary/cfgcsv/cfg_baowu.lua")
-- function openUI(actor)
--     lib996:showformwithcontent(actor,"G/����","")
-- end


--ͬ����Ϣ
function SyncResponse(actor)
    lib996:showformwithcontent(actor, "", "baowu.SyncResponse("..serialize(GetBaowuData(actor, 2))..")")
end

--����
function Shengji(actor, param)
    local Choose_Index = 0 --�������� 1��ɷ« 2��ڤ�� 3�׻��� 4����ӡ
    if param then
        Choose_Index = tonumber(param) or 1
    end

    local level = GetBaowuData(actor, 1, Choose_Index)
    local next_level =level + 1

    local cfg = cfg_baowu[level + add_List[Choose_Index]]
    local next_cfg = cfg_baowu[next_level + add_List[Choose_Index]]
    print("add_List[Choose_Index]:"..add_List[Choose_Index])
    print("next_level:"..next_level)

    if not next_cfg or next_cfg.type ~= Choose_Index then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�޷���������</font>","Type":9}')
        return
    end

    local idx1 = next_cfg.cost[1][1]--��������Ĳ���id
    local num1 = next_cfg.cost[1][2]--��������Ĳ�������
    local name1 = lib996:getstditeminfo(idx1, 1)--��������Ĳ�������

    local idx2 = next_cfg.cost[2][1]--��������Ļ��� id
    local num2 = next_cfg.cost[2][2]--��������Ļ��� ����
    --local name2 = lib996:getstditeminfo(idx2, 1)--��������Ļ�������
    if not QsQcheckItemNumByIdx(actor, idx1,num1) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>���ϲ���</font>","Type":9}')
        return
    end

    if not QsQcheckMoneyNum(actor, idx2,num2) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>���Ҳ���</font>","Type":9}')
        return
    end

    --�۳�����
    lib996:takeitem(actor, name1, num1)
    --�۳�����
    lib996:changemoney(actor, idx2, "-", num2, "", true)

    --��������
    if not cfg then
        QsQupdateSomeAddr(actor, nil, next_cfg.attribute)
    else
        QsQupdateSomeAddr(actor, cfg.attribute, next_cfg.attribute)
    end

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�����ɹ���</font>","Type":9}')

    --ͬ����Ϣ
    lib996:setint(0, actor, Str_List[Choose_Index], next_level)
    SyncResponse(actor)
end

--��ȡ�������
function GetBaowuData(actor, way, choose_index)
    local Baowu_List = {}
    for i, data in ipairs(Str_List) do
        local Baowu_Lv = lib996:getint(0, actor, data)
        table.insert(Baowu_List, Baowu_Lv)
    end
    if way == 1 and choose_index then--��ȡ��ǰ����ȼ�
        return Baowu_List[choose_index]
    elseif way == 2 then--��ȡ����ȼ��б�
        return Baowu_List
    elseif way == 3 then--�����������ȼ�
        return Baowu_List[1],Baowu_List[2], Baowu_List[3], Baowu_List[4]
    end

    return nil
end

