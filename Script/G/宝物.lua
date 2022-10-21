lib996:include("Script/serialize.lua")

local Str_List = {"天煞芦等级", "青冥令等级", "炎火塔等级", "鬼灭印等级"}
local add_List = {0, 50, 100, 130}

local cfg_baowu = lib996:include("QuestDiary/cfgcsv/cfg_baowu.lua")
-- function openUI(actor)
--     lib996:showformwithcontent(actor,"G/宝物","")
-- end


--同步信息
function SyncResponse(actor)
    lib996:showformwithcontent(actor, "", "baowu.SyncResponse("..serialize(GetBaowuData(actor, 2))..")")
end

--升级
function Shengji(actor, param)
    local Choose_Index = 0 --升级对象 1天煞芦 2青冥令 3炎火塔 4鬼灭印
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
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>无法继续升级</font>","Type":9}')
        return
    end

    local idx1 = next_cfg.cost[1][1]--升级所需的材料id
    local num1 = next_cfg.cost[1][2]--升级所需的材料数量
    local name1 = lib996:getstditeminfo(idx1, 1)--升级所需的材料名称

    local idx2 = next_cfg.cost[2][1]--升级所需的货币 id
    local num2 = next_cfg.cost[2][2]--升级所需的货币 数量
    --local name2 = lib996:getstditeminfo(idx2, 1)--升级所需的货币名称
    if not QsQcheckItemNumByIdx(actor, idx1,num1) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>材料不足</font>","Type":9}')
        return
    end

    if not QsQcheckMoneyNum(actor, idx2,num2) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>货币不足</font>","Type":9}')
        return
    end

    --扣除材料
    lib996:takeitem(actor, name1, num1)
    --扣除货币
    lib996:changemoney(actor, idx2, "-", num2, "", true)

    --更新属性
    if not cfg then
        QsQupdateSomeAddr(actor, nil, next_cfg.attribute)
    else
        QsQupdateSomeAddr(actor, cfg.attribute, next_cfg.attribute)
    end

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>升级成功！</font>","Type":9}')

    --同步信息
    lib996:setint(0, actor, Str_List[Choose_Index], next_level)
    SyncResponse(actor)
end

--获取宝物参数
function GetBaowuData(actor, way, choose_index)
    local Baowu_List = {}
    for i, data in ipairs(Str_List) do
        local Baowu_Lv = lib996:getint(0, actor, data)
        table.insert(Baowu_List, Baowu_Lv)
    end
    if way == 1 and choose_index then--获取当前宝物等级
        return Baowu_List[choose_index]
    elseif way == 2 then--获取宝物等级列表
        return Baowu_List
    elseif way == 3 then--依次输出宝物等级
        return Baowu_List[1],Baowu_List[2], Baowu_List[3], Baowu_List[4]
    end

    return nil
end

