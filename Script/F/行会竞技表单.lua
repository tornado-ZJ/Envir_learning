lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_hanghuijingji.lua")  --行会竞技表单

local filename = "行会竞技表单"

local _var_name_gifts = "SSJ_familyGifts_gifts_"                        --礼包领取变量前缀

local _var_name_bossNum = "SSJ_familyGifts_bossNum_"                    --行会会长礼包领取数量变量名前缀

local _var_name_bossIsGet = "SSJ_familyGifts_isGet_"                    --行会会长礼包是否领取变量名前缀[行会变量,每个行会只能领取一次会长礼包]

local _gifts_var_name = {}

local _gifts_bossNum_var_name = {}

local _gifts_bossIsGet_var_name = {}

local gifts_info = {}                                                   --礼包领取情况

local gifts_bossNum_info = {}                                           --会长额外礼包领取情况

for i, v in ipairs(_cfg) do
    _gifts_var_name[i] = _var_name_gifts .. i
    _gifts_bossNum_var_name[i] = _var_name_bossNum .. i
    _gifts_bossIsGet_var_name[i] = _var_name_bossIsGet .. i

    gifts_info[i] = 0
    gifts_bossNum_info[i] = 0
end

local playersNum = 0                                                    --行会玩家人数

local _state = {
    not_receive     = 0,        --未领取
    yes_receive     = 1,        --可领取
    has_receive     = 2,        --已领取
}

local testNum
-- local testNum = 999              --行会奖励测试人数

-- -------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
local _login_data = {playersNum,gifts_info}
--同步数据
function SyncResponse(actor)
    playersNum = lib996:getguildmembercount(actor)

    if testNum then playersNum = testNum end

    for i, varName in ipairs(_gifts_var_name) do
        gifts_info[i] = lib996:getint(0,actor, varName)
        if gifts_info[i] == _state.not_receive then
            if playersNum >= _cfg[i].goal then
                gifts_info[i] = _state.yes_receive
            end
        end

        gifts_bossNum_info[i] = _cfg[i].bossCount - lib996:getsysint(_gifts_bossNum_var_name[i])
        gifts_bossNum_info[i] = gifts_bossNum_info[i] > 0 and gifts_bossNum_info[i] or 0
    end

    _login_data[1] = playersNum
    _login_data[2] = gifts_info
    _login_data[3] = gifts_bossNum_info
    lib996:showformwithcontent(actor,"", "familyGifts.SyncResponse("..serialize(_login_data)..")")
end

function RequestGetGift(actor,param)
    param = tonumber(param)

    local cfg = _cfg[param]

    if not cfg then return end

    local varName = _gifts_var_name[param]
    local varName_bossNum = _gifts_bossNum_var_name[param]
    local varName_bossIsGet = _gifts_bossIsGet_var_name[param]

    local guild = lib996:getmyguild(actor)

    if guild == '0' or guild == 0 then  --行会判断
        lib996:sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>你还未加入行会</font>","Type":9}')
        return
    end

    playersNum = lib996:getguildmembercount(actor)

    if testNum then playersNum = testNum end

    local isboss = lib996:getbaseinfo(actor,ConstCfg.gbase.isboss)

    local bossCount = lib996:getsysint(varName_bossNum) + 1

    local needBag = #cfg.reward
    if isboss then
        if lib996:getint(1,guild,varName_bossIsGet) ~= _state.has_receive and bossCount <= cfg.bossCount then
            isboss = true
            needBag = needBag + #cfg.bossReward
        else
            isboss = false
        end
    end

    if lib996:getint(0,actor,varName) == _state.has_receive then
        lib996:sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>礼包已领取</font>","Type":9}')
        return
    end

    if playersNum < cfg.goal then
        lib996:sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>行会成员不足</font>","Type":9}')
        return
    end

    if not Bag.checkBagEmptyNum(actor, needBag) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>包裹空间不足,请整理后重试</font>","Type":9}')
        return
    end

    local msg = "奖励领取成功"

    lib996:setint(0,actor,varName,_state.has_receive)

    if isboss then
        lib996:setint(1,guild,varName_bossIsGet,_state.has_receive)
        lib996:setsysint(varName_bossNum,bossCount)
        Player.giveItemByTable(actor, cfg.bossReward, filename)

        msg = msg ..",额外获得会长奖励"
    end

    Player.giveItemByTable(actor, cfg.reward, filename)

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#EEEE00\'>'..msg..'</font>","Type":9}')
    SyncResponse(actor)
end