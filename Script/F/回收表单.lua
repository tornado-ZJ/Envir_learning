lib996:include("Script/serialize.lua")

local filename = "回收表单"

local cfg_huishou = lib996:include("QuestDiary/cfgcsv/cfg_huishou_zhuangbei.lua")

local _cfg = {}

local _varflag_auto_equip   = "SSJ_recycle_isAuto"                  --自动回收装备标识变量名

local _var_name = "SSJ_recycle_"                                    --回收勾选变量名前缀

local _var_name_all_items = "SSJ_recycle_all_items"                 --当前勾选所有道具的idx表变量名

local _var_name_tab = {}                                            --回收勾选变量名表

local _var_check_info = {}                                          --回收勾选表

local _cfg_item_Idx = {}                                            --所有可以回收的道具idx

local _recycleAllItems = {}                                         --当前所有可以回收的道具idx

local _setDataType = {
    ["mainCheck"] = 1,              --主面板勾选
    ["secondaryCheck"] = 2,         --副面版勾选
    ["allCheck"] = 3,               --副面版全选/全不选
}

local _state = {
    not_check = 0,
    check = 1,
}

local itemid

for i,v in ipairs(cfg_huishou) do
    --初始化变量名表
    _var_name_tab[v.type] = _var_name_tab[v.type] or {}
    _var_name_tab[v.type][v.type2] = _var_name_tab[v.type][v.type2] or {}
    if #_var_name_tab[v.type][v.type2] == 0 then
        _var_name_tab[v.type][v.type2].ischoice = _var_name .."_ischoice_"..v.type.."_"..v.type2
    end
    _var_name_tab[v.type][v.type2][v.type3] = _var_name .."_"..v.type.."_"..v.type2.."_"..v.type3
    --记录回收的itemidx
    _cfg_item_Idx[v.itemid] = v

    --初始化勾选表
    _var_check_info[v.type] = _var_check_info[v.type] or {}
    _var_check_info[v.type][v.type2] = _var_check_info[v.type][v.type2] or {}
    if #_var_check_info[v.type][v.type2] == 0 then
        _var_check_info[v.type][v.type2].ischoice = 0
    end
    _var_check_info[v.type][v.type2][v.type3] = 0

    _cfg[v.type] = _cfg[v.type] or {}
    _cfg[v.type][v.type2] = _cfg[v.type][v.type2] or {}
    _cfg[v.type][v.type2][v.type3] = {gouxuan = v.gouxuan,itemid = v.itemid}
end
-------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
local function get_recycly_info(actor)
    _recycleAllItems = {}
    for i, value in ipairs(_var_name_tab) do
        for j, var in ipairs(value) do
            _var_check_info[i][j].ischoice = lib996:getint(0,actor,var.ischoice)
            for x, v in ipairs(var) do
                _var_check_info[i][j][x] = lib996:getint(0,actor,v)
                if _var_check_info[i][j].ischoice == _state.check and _var_check_info[i][j][x] == _state.check then
                    itemid = tostring(_cfg[i][j][x].itemid)
                    _recycleAllItems[itemid] = 1
                end
            end
        end
    end
    lib996:setstr(0,actor,_var_name_all_items,serialize(_recycleAllItems))
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步数据
local _login_data = {0,_var_check_info}
function SyncResponse(actor)
    _login_data[1] = lib996:getint(0,actor, _varflag_auto_equip)

    get_recycly_info(actor)

    lib996:showformwithcontent(actor,"F/回收面板", "Recycle#"..serialize(_login_data))
end

--勾选自动回收装备
function RequestAutoEquip(actor, auto_state)
    auto_state = tonumber(auto_state)
    lib996:setint(0,actor, _varflag_auto_equip,auto_state)
end

--装备回收
function RequestEquip(actor,itemidx)
    local t_take = {}
    if itemidx then
        local num = Bag.getItemNumByIdx(actor, itemidx)
        if num > 0 then table.insert(t_take, {itemidx, num}) end
    else
        local recycleAllItems = lib996:getstr(0,actor,_var_name_all_items)
        recycleAllItems = unserialize(recycleAllItems)

        for idx,_ in pairs(recycleAllItems) do
            local idx_num = tonumber(idx)
            local num = Bag.getItemNumByIdx(actor, idx_num)
            if num > 0 then
                table.insert(t_take, {idx_num, num})
            end
        end
    end

    if #t_take == 0 then return end

    --检查回收物品
    local _, name = Player.checkItemNumByTable(actor, t_take)
    if name then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>'..name..'数量不足!</font>","Type":9}')
        return
    end

    --拿走回收物品
    Player.takeItemByTable(actor, t_take, "装备回收")

    local Reuse = {}
    for _,v in pairs(t_take) do
        local take_idx,multiple = v[1],v[2]
        local cfg = _cfg_item_Idx[take_idx]
        local price = cfg.price1
        --给回收奖励的倍数,需要可以自行拓展
        local pro = 1
        -- if cfg_vip[viplevel] and cfg_vip[viplevel].Recycle then
        --     price = cfg.price
        --     pro = pro + cfg_vip[viplevel].Recycle / 10000 + xiuxian_pro
        -- end
        if cfg.ignore then
            pro = 1
        end
        for _,Reusecfg in ipairs(price) do
            local idx, num = Reusecfg[1], Reusecfg[2]
            Reuse[idx] = Reuse[idx] or 0
            Reuse[idx] = Reuse[idx] + num * multiple * pro
        end
    end

    local givedata = {}
    for idx,num in pairs(Reuse) do
        -- if idx == 2 then
            --未开启打金特权,获得的是绑定元宝
            -- if cfg_vip[viplevel] and cfg_vip[viplevel].dajin then
            --     if cfg_vip[viplevel].dajin ~= 1 then
            --         idx = 4
            --     end
            -- else
            --     idx = 4
            -- end
        -- end
        table.insert(givedata, {idx, num})
    end
    Player.giveItemByTable(actor, givedata, "装备回收所得", nil, false)
end

--存入勾选数据
function SetUserData(actor,_type,page1,page2,page3,ischoice)
    -- print("进入",_type,page1,page2,page3,ischoice)
    local recycleAllItems = lib996:getstr(0,actor,_var_name_all_items)
    if recycleAllItems == "" then
        get_recycly_info(actor)
        recycleAllItems = lib996:getstr(0,actor,_var_name_all_items)
    end
    recycleAllItems = unserialize(recycleAllItems)

    _type,page1,page2,page3,ischoice = tonumber(_type),tonumber(page1),tonumber(page2),tonumber(page3),tonumber(ischoice)

    local bool = ischoice == _state.check and true or nil

    if _setDataType.mainCheck == _type then
        --主面板勾选
        if not _var_name_tab[page1] or not _var_name_tab[page1][page2] then return end
        lib996:setint(0,actor,_var_name_tab[page1][page2].ischoice,ischoice)

        for _page3, var in ipairs(_cfg[page1][page2]) do
            itemid = tostring(var.itemid)

            --副面板不勾选则不加入itemidx
            if lib996:getint(0,actor,_var_name_tab[page1][page2][_page3]) == _state.not_check then
                bool = nil
            end
            -- local name = lib996:getstditeminfo(itemid, 1)
            recycleAllItems[itemid] = bool
        end
    elseif _setDataType.secondaryCheck == _type then
        --副面版单个勾选
        if not _var_name_tab[page1] or not _var_name_tab[page1][page2] or not _var_name_tab[page1][page2][page3] then return end
        lib996:setint(0,actor,_var_name_tab[page1][page2][page3],ischoice)

        --主面板不勾选则不加入itemidx
        if lib996:getint(0,actor,_var_name_tab[page1][page2].ischoice) == _state.not_check then
            bool = nil
        end

        itemid = tostring(_cfg[page1][page2][page3].itemid)
        recycleAllItems[itemid] = bool
    elseif _setDataType.allCheck == _type then
        --副面版全选/全不选
        if not _var_name_tab[page1] or not _var_name_tab[page1][page2] then return end

        --主面板不勾选则不加入itemidx
        if lib996:getint(0,actor,_var_name_tab[page1][page2].ischoice) == _state.not_check then
            bool = nil
        end

        for _page3, v in ipairs(_var_name_tab[page1][page2]) do
            lib996:setint(0,actor,v,ischoice)

            itemid = tostring(_cfg[page1][page2][_page3].itemid)
            recycleAllItems[itemid] = bool
        end
    end

    lib996:setstr(actor,_var_name_all_items,serialize(recycleAllItems))
end
-- ----------------------------↓↓↓ 游戏事件 ↓↓↓---------------------------------------
--新人首次登陆,设置默认勾选
local function _onNewHuman(actor)
    for i,v in ipairs(_cfg) do
        for j,var in ipairs(v) do
            for n,value in ipairs(var) do
                if n == 1 then
                    local ischoice = value.gouxuan and _state.check or _state.not_check
                    lib996:setint(0,actor,_var_name_tab[i][j].ischoice,ischoice)
                end
                lib996:setint(0,actor,_var_name_tab[i][j][n],_state.check)
            end
        end
    end
end
GameEvent.add(EventCfg.onNewHuman, _onNewHuman, filename)

-- GameEvent.add(EventCfg.onLoginEnd, _onNewHuman, filename)

--物品进背包
local function _onAddBag(actor,itemobj)
    local idx = lib996:getiteminfo(actor, itemobj, ConstCfg.iteminfo.idx)
    if not _cfg_item_Idx[idx] then return end
    local isAuto = lib996:getint(0,actor, _varflag_auto_equip)
    if isAuto == _state.not_check then return end
    local recycleAllItems = lib996:getstr(0,actor,_var_name_all_items)
    if recycleAllItems == "" then return end
    recycleAllItems = unserialize(recycleAllItems)
    local idx_str = tostring(idx)
    if recycleAllItems[idx_str] then
        RequestEquip(actor,idx)
    end
end
GameEvent.add(EventCfg.onAddBag, _onAddBag, filename)