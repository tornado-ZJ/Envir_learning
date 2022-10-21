lib996:include("Script/serialize.lua")
lib996:include("3rd/log/Logger.lua")

local _cfg_lj   = lib996:include("QuestDiary/cfgcsv/cfg_leichong_tsleic.lua")
local _cfg_mr   = lib996:include("QuestDiary/cfgcsv/cfg_leichong_mr.lua")

local filename = "每日充值表单"

local _LJ_receive_day = "SSJ_FLDT1_LJ_day"               --累计领取天数
local _LJ_var_name = "SSJ_FLDT1_LJ"                      --累计领取自定义变量名前缀
local _LJ_var_tab = {}

local _LJ_Reset_Day = 1                                 --累计领取重置天数

local _MR_Min_BillNum = 28                              --每日充值可以增加累计天数的最小充值金额
local _Mr_var_name = "SSJ_FLDT1_Mr"                      --每日领取自定义变量名前缀
local _Mr_var_name_isFirst = "SSJ_FLDT1_Mr_isFirst"      --今日是否第一次达成日充奖励(达成则累计天数+1)
local _MR_var_tab = {}


local _sync_data_list = {
    MR_tab = {},    --每日礼包
    LJ_tab = {},    --累计礼包
}

local _state = {
    no_receive      = 0,        --不可领取
    yes_receive     = 1,        --可以领取
    has_receive     = 2,        --已领取
}

for i, v in ipairs(_cfg_lj) do
    if v.tianshu then
        _LJ_var_tab[v.tianshu] = _LJ_var_name.."_"..v.tianshu
        if v.tianshu > _LJ_Reset_Day then
            _LJ_Reset_Day = v.tianshu
        end
    end
end
for i, v in ipairs(_cfg_mr) do
    if v.money then
        _MR_var_tab[v.money] = _Mr_var_name.."_"..v.money

        if v.money < _MR_Min_BillNum and v.money ~= 0 then
            _MR_Min_BillNum = v.money
        end
    end
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--同步信息
local _login_data = {0,0,_LJ_Reset_Day,_sync_data_list}   --优先分配同步内存数据
function SyncResponse(actor)
    _sync_data_list.LJ_tab = {}


    local day_bill = Player.getTodayBillNum(actor)

    local get_lj_day = lib996:getint(0,actor, _LJ_receive_day)

    local isfirst = lib996:getint(0,actor,_Mr_var_name_isFirst)

    if isfirst == _state.no_receive and day_bill >= _MR_Min_BillNum then
        get_lj_day = get_lj_day + 1
        lib996:setint(0,actor,_Mr_var_name_isFirst, _state.yes_receive)
        lib996:setint(0,actor,_LJ_receive_day, get_lj_day)
    end

    local state = 0
    local str = ""
    --累计领取礼包状态
    for day,varname in pairs(_LJ_var_tab) do
        str = tostring(day)
        state = lib996:getint(0,actor,varname)
        if state == _state.no_receive and day <= get_lj_day then
            state = _state.yes_receive
        end
        _sync_data_list.LJ_tab[str] = state
    end

    --日充礼包领取状态
    _sync_data_list.MR_tab = {}
    for money,varname in pairs(_MR_var_tab) do
        str = tostring(money)
        state = lib996:getint(0,actor,varname)
        if state == _state.no_receive and money <= day_bill then
            state = _state.yes_receive
        end
        _sync_data_list.MR_tab[str] = state
    end

    _login_data[1] = get_lj_day         --累计领取天
    _login_data[2] = day_bill           --日充金额
    _login_data[4] = _sync_data_list
    lib996:showformwithcontent(actor,"", "DailyRecharge.SyncResponse("..serialize(_login_data)..")")
end

--领取累计礼包
function RequestGetLJGift(actor,index)
    index = tonumber(index)
    local cfg = _cfg_lj[index]

    if not cfg then return end
    local var_name = _LJ_var_tab[cfg.tianshu]
    if not var_name then return end

    local state = lib996:getint(0,actor, var_name)
    if state == _state.has_receive then return end  --奖励已领取

    local cur_day = lib996:getint(0,actor, _LJ_receive_day)      --累计天数未达标
    if cur_day < index then return end

    if not Bag.checkBagEmptyNum(actor, #cfg.reward) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足!</font>","Type":9}')
        return
    end

    --写数据
    lib996:setint(0,actor,var_name,_state.has_receive)

    --给物品
    Player.giveItemByTable(actor, cfg.reward, "累计充值奖励")

    --回复
    SyncResponse(actor)
end

--领取日充奖励
function RequestGetMRGift(actor,index)
    index = tonumber(index)
    local cfg = _cfg_mr[index]
    if not cfg then return end

    local var_name = _MR_var_tab[cfg.money]
    if not var_name then return end

    local state = lib996:getint(0,actor, var_name)
    if state == _state.has_receive then return end  --今日已领取

    if not Bag.checkBagEmptyNum(actor, #cfg.reward) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>背包空间不足!</font>","Type":9}')
        return
    end

    --充值未达标
    local day_bill = Player.getTodayBillNum(actor)
    if day_bill < cfg.money then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>充值金额不足!</font>","Type":9}')
        return
    end

    --写数据
    lib996:setint(0,actor,var_name, _state.has_receive)

    --给物品
    Player.giveItemByTable(actor, cfg.reward, "每日充值奖励")

    --回复
    SyncResponse(actor)
end
-------------------------------↓↓↓ 派发事件 ↓↓↓---------------------------------------
--每日凌晨 与 每日第一次登录 调用
local function _goDailyUpdate(actor)
    for _, key in pairs(_MR_var_tab) do
        lib996:setint(0,actor,key, _state.no_receive)
    end

    lib996:setint(0,actor,_Mr_var_name_isFirst, _state.no_receive)

    local cur_day = lib996:getint(0,actor, _LJ_receive_day)
    if cur_day >= _LJ_Reset_Day then
        for _,varname in pairs(_LJ_var_tab) do
            lib996:setint(0,actor,varname, _state.no_receive)
        end
        lib996:setint(0,actor,_LJ_receive_day, _state.no_receive)
    end
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, filename)
-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--变量重置
function GmClear(actor)
    for _,varname in pairs(_LJ_var_tab) do
        lib996:setint(0,actor,varname, _state.has_receive)
    end
    for _,varname in pairs(_MR_var_tab) do
        lib996:setint(0,actor,varname, _state.has_receive)
    end
    lib996:setint(0,actor,_Mr_var_name_isFirst, _state.has_receive)
    lib996:setint(0,actor,_LJ_receive_day, _state.has_receive)
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#7FFF00\'>变量重置成功!</font>","Type":9}')
end