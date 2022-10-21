lib996:include("Script/serialize.lua")

local cfg_fenjie = lib996:include("QuestDiary/cfgcsv/cfg_fenjie.lua")

local _cfg = {} --���

local _varflag_auto_equip = "LZY_furnace_isAuto"                  --�Զ���¯װ����ʶ������
local _var_name = "LZY_recycle_"                                  --��ҳ��¯��ѡ������ǰ׺
local _var_name_fu = "LZY_recycle_fu_"                            --��ҳ��¯��ѡ������ǰ׺

local _var_name_tab = {}                                          --��ҳ��¯��ѡ��������
local _var_fu_tab = {}                                            --��ҳ��¯��ѡ��������
local _var_check_tab = {}                                         --��ҳ��¯��ѡ��
local _var_fu_check_tab = {}                                      --��ҳ��¯��ѡ��

local equip_recive = {} --����¯��װ����
local coin_give = {} --harvest��

local _state = {
    not_check = 0,
    check = 1
}

local state_circle = {
    not_circle = 0,
    circle = 1
}

for i, v in ipairs(cfg_fenjie) do
    --��ҳ��
    _var_name_tab[v.leixing] = _var_name_tab[v.leixing] or {}
    _var_name_tab[v.leixing] = _var_name .. "_" .. v.leixing

    --��ҳ��
    _var_fu_tab[v.leixing] = _var_fu_tab[v.leixing] or {}
    _var_fu_check_tab[v.leixing] = _var_fu_check_tab[v.leixing] or {}
    table.insert(_var_fu_tab[v.leixing], _var_name_fu .. "_" .. v.leixing .. "_" .. i)

    --���
    _cfg[v.leixing] = _cfg[v.leixing] or {}
    table.insert(_cfg[v.leixing], {
        harvest = v.harvest, equipid = v.equipid
    })
end


--ͬ������
function SyncResponse(actor)

    local a = lib996:getint(0, actor, _varflag_auto_equip)
    for i, varname in ipairs(_var_name_tab) do
        _var_check_tab[i] = lib996:getint(0, actor, varname)
    end
    for i, leixing in ipairs(_var_fu_tab) do
        for j, var in ipairs(leixing) do
            _var_fu_check_tab[i][j] = lib996:getint(0, actor, var)
        end
    end

    lib996:showformwithcontent(actor, "C/��¯���", "LZY_ronglu#" .. a .. "#" .. serialize(_var_check_tab) .. "#" .. serialize(_var_fu_check_tab))
end

--��ѡ�Զ���¯����
function RequestAutoEquip(actor, auto_state)
    auto_state = tonumber(auto_state)
    lib996:setint(0, actor, _varflag_auto_equip, auto_state)
end

--����年ѡ����
function SetUserData(actor, idx, zhu_state)
    idx = tonumber(idx)
    zhu_state = tonumber(zhu_state)
    lib996:setint(0, actor, _var_name_tab[idx], zhu_state)
    SyncResponse(actor)
end

--����年ѡ����
function SetUserData2(actor, idx, idx2, fu_state)
    idx = tonumber(idx)
    idx2 = tonumber(idx2)
    fu_state = tonumber(fu_state)
    lib996:setint(0, actor, _var_fu_tab[idx][idx2], fu_state)
    --SyncResponse(actor)
end

--�Զ���¯
function EquipFurnace(actor, itemidx, idx1, idx2)
    _var_check_tab[idx1] = lib996:getint(0, actor, _var_check_tab[idx1])
    if _var_check_tab[idx1] == _state.check then
        _var_fu_check_tab[idx1][idx2] = lib996:getint(0, actor, _var_fu_check_tab[idx1][idx2])
        if _var_fu_check_tab[idx1][idx2] == _state.check then
            local num = Bag.getItemNumByIdx(actor, itemidx)
            if num > 0 then
                table.insert(equip_recive, { itemidx, num })
                table.insert(coin_give, { _cfg[idx1][idx2].harvest[1][1] * _cfg[idx1][idx2].harvest[1][2], num })
            end
        end
    end

    for a, value in ipairs(_var_name_tab) do
        _var_check_tab[a] = lib996:getint(0, actor, value)
        if _var_check_tab[a] == _state.check then
            for i, leixing in ipairs(_var_fu_tab) do
                for j, var in ipairs(leixing) do
                    _var_fu_check_tab[i][j] = lib996:getint(0, actor, var)
                    if _var_fu_check_tab[i][j] == _state.check then
                        local idx_num = tonumber(_cfg[i][j].equipid)
                        local num = Bag.getItemNumByIdx(actor, idx_num)
                        if num > 0 then
                            table.insert(equip_recive, { _cfg[i][j].equipid, num })
                            table.insert(coin_give, { _cfg[i][j].harvest[1][1] * _cfg[i][j].harvest[1][2], num })
                            -- table.insert(equip_recivee, { _cfg[i][j].equipid, num })
                            -- table.insert(coin_givee, { _cfg[i][j].harvest[1][1] * _cfg[i][j].harvest[1][2], num })
                        end
                    end
                end
            end
        end
    end
    Player.takeItemByTable(actor, equip_recive, "װ����¯")
    Player.giveItemByTable(actor, coin_give, "װ����¯����", nil, false)
end

function RongEquip(actor, has_equip)
    local equip_give = {}
    local equip_take = {}
    local equip_take2 = {}
    local has_take = unserialize(has_equip)
    dump(has_take)
    for i, v in ipairs(has_take) do
        if v[2] == 1 then
            table.insert(equip_take, { v[1], 1 })
            table.insert(equip_take2, v[1])
        end
    end
    dump(equip_take)
    if #equip_take == 0 then return end

    for i, v in ipairs(cfg_fenjie) do
        local idx_num = tonumber(v.equipid)
        for j, u in ipairs(equip_take2) do
            local aaa = tonumber(u)
            if aaa == idx_num then
                local a = tonumber(cfg_fenjie[i].harvest[1][1])
                local b = tonumber(cfg_fenjie[i].harvest[1][2])
                table.insert(equip_give, { a, b })
            end
        end
    end

    dump(equip_give)

    Player.takeItemByTable(actor, equip_take, "װ����¯")
    Player.giveItemByTable(actor, equip_give, "װ����¯����", nil, false)
end

--��Ʒ������
local function _onAddBag(actor, itemobj)
    local idx = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    local isAuto = lib996:getint(0, actor, _varflag_auto_equip)
    if isAuto == _state.not_check then return end
    for i, value in ipairs(_cfg) do
        for j, v in ipairs(value) do
            local idx_num = tonumber(v.equipid)
            if idx == idx_num then
                EquipFurnace(actor, idx, i, j)
            end
        end
    end

end
GameEvent.add(EventCfg.onAddBag, _onAddBag, "��¯��")