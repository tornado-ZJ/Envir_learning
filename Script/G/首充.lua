lib996:include("Script/serialize.lua")

local cfg_shouchong = lib996:include("QuestDiary/cfgcsv/cfg_shouchong.lua")

--充值状态
local _state = {
    no_receive       = 0, --未充值
    can_receive      = 1, --首次充值
    has_receive      = 1, --不是首次充值
}

function SyncResponse(actor, idx)
    idx = tonumber(idx)
    print("同步首充按钮状态")
    local state = lib996:getint(0, actor, "can_receive")
    if state ~= _state.can_receive then return end --不是首次充值


    local actDay = lib996:getint(0, actor, "actDay") --激活时间
    local nowDay = lib996:getint(0, actor, "nowDay") --当前点击时间 每触发一次每日+1
    if not nowDay then
        nowDay = os.date("*t").day
        lib996:setint(0, actor, "nowDay", nowDay)
    end
    if actDay then
        local days = nowDay - actDay
        print("现在：",nowDay)
        print("激活时间",actDay)
        local xxx = lib996:getint(0, actor, "领取状态"..idx)
        print("领取状态",xxx)
        lib996:showformwithcontent(actor, "","Shouchong.updateBtn("..days..","..state..","..idx..")")
    end

end

--首充后每天更新领取状态
function DailyUpdate(actor)
    local state = lib996:getint(0, actor, "can_receive")
    if not state or state ~= _state.can_receive then return end

    local nowDay = lib996:getint(0, actor, "nowDay")
    nowDay = nowDay + 1
    print("nowDay",nowDay)
    lib996:setint(0, actor, "nowDay", nowDay)

end
function GetData(idx) --获取首充奖励物品列表
    local reward_list = {}
    if idx then
        for i, data in ipairs(cfg_shouchong[idx].reward) do
            table.insert(reward_list, data)
        end
        return reward_list
    end
end

--领取奖励
function Lingqv(actor,idx)
    idx = tonumber(idx)
    local reward_list = cfg_shouchong[idx].reward
    if not reward_list then return end

    local param = lib996:getint(0, actor, "领取状态"..idx)
    print("领取状态",param)
    print(type(param))
    if param == 0 then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>已领取</font>","Type":9}')
        return
    end
    --领取奖励
    for i, reward in ipairs(reward_list) do
        local name = lib996:getstditeminfo(reward[1], 1)
        lib996:giveitem(actor, name, reward[2], "首充奖励")
    end
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>领取成功</font>","Type":9}')
    lib996:setint(0, actor, "领取状态"..idx, 0)


end
--充值成功后
function PlayerRecharge(actor)
    --重置充值状态
    lib996:setint(0, actor, "can_receive", _state.no_receive)
    --重置可领取时间
    lib996:setint(0, actor, "nowDay", os.date("*t").day)

    local state = lib996:getint(0, actor, "can_receive")
    if not state or state == _state.no_receive then
        --print("首充")
        lib996:setint(0, actor, "can_receive", _state.can_receive)
        for i =1, #cfg_shouchong do
            lib996:setint(0, actor, "领取状态"..i, 1)
        end
    else
        print("不是首充")
        lib996:setint(0, actor, "can_receive", _state.has_receive)
    end

    local actDay = os.date("*t").day
    lib996:setint(0, actor, "actDay", actDay)
    lib996:sendmsg(actor, 1, '{"Msg":" <font color=\'#ff0000\'>充值成功</font>","Type":9}')
end


GameEvent.add(EventCfg.onRecharge, PlayerRecharge, "充值")
GameEvent.add(EventCfg.goDailyUpdate, DailyUpdate, "每日更新")