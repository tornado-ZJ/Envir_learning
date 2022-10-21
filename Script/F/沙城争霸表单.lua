lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_sbk.lua")

local filename = "沙城争霸表单"

local _var_name_castlewarPlayers = "C_QsQcastlewarPlayers"

local _mail_title = "沙城争霸"

local _gifts_table = {
    --胜利者会长邮件消息,奖励
    {"您在沙城争霸活动中，成为了沙巴克老大，您获得了会长专属奖励，请查收。",""},
    --胜利者成员邮件消息,奖励
    {"您的行会沙城争霸活动中，成功占领沙巴克，您获得了胜利者奖励，请查收。",""},
    --失败参与者邮件消息,奖励
    {"您的行会沙城争霸活动中，虽未占领沙巴克，但您的努力我们看在眼中，您的获得了激励者奖励，请查收。",""},
}
local itemName,role_name,role_guid
-------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
local function table2KeyValue(winner_roles)
    local temp = {}
    for k,v in ipairs(winner_roles) do
        temp[v] = 1
    end
    return temp
end

--胜利者会长奖励
for j, var in ipairs(_cfg[1].reward) do
    itemName = lib996:getstditeminfo(var[1],1)
    _gifts_table[1][2] = _gifts_table[1][2]..itemName.."#"..var[2].."&"
end
--胜利者成员奖励
for j, var in ipairs(_cfg[1].rewardt) do
    itemName = lib996:getstditeminfo(var[1],1)
    _gifts_table[2][2] = _gifts_table[2][2]..itemName.."#"..var[2].."&"
end
--失败参与者奖励
for j, var in ipairs(_cfg[2].rewardt) do
    itemName = lib996:getstditeminfo(var[1],1)
    _gifts_table[3][2] = _gifts_table[3][2]..itemName.."#"..var[2].."&"
end

-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--请求进入地图
function RequestEnter(actor)
    local state = lib996:castleinfo(ConstCfg.castle.info.state)
    if state then
        -- local base_x,base_y = 180,160
        -- lib996:mapmove(actor, "nhjsbk", math.random(base_x - 3, base_x + 3), math.random(base_y - 3, base_y + 3))
    else
        lib996:addattacksabakall()
        lib996:gmexecute(actor,"ForcedWallconquestWar")
        lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#EEEE00\'>演示版本启动攻城战,请重新传送参与活动</font>","Type":9}')
    end
    local base_x,base_y = 180,160
    lib996:mapmove(actor, "nhjsbk", math.random(base_x - 3, base_x + 3), math.random(base_y - 3, base_y + 3))
end
-------------------------------↓↓↓ 派发事件 ↓↓↓---------------------------------------
local function _goCastlewarend()
    local guildmgr = lib996:castleinfo(ConstCfg.castle.info.guildmgr)
    if guildmgr ~= "管理员" then
        local winner_name = lib996:castleinfo(2)                    --胜利者行会名字
        local winner_guild = lib996:findguild(1,winner_name)        --获取行会guid
        local winner_roles = lib996:getguildinfo(winner_guild,3)    --根据行会guid获取行会成员 name包括会长

        winner_roles = table2KeyValue(winner_roles)

        --参与者名单
        local players_tab = lib996:getsysstr(_var_name_castlewarPlayers)

        if players_tab == "" then return end
        players_tab = unserialize(players_tab)
        if type(players_tab) ~= "table" then return end

        for _role_guid, _role_name in pairs(players_tab) do

            if _role_name == guildmgr then
                --胜利者会长奖励
                lib996:sendmail("#".._role_name,1,_mail_title,_gifts_table[1][1],_gifts_table[1][2])
            else
                if winner_roles[_role_guid] then
                    --胜利者成员奖励
                    lib996:sendmail("#".._role_name,1,_mail_title,_gifts_table[2][1],_gifts_table[3][2])
                else
                    --失败参与者奖励
                    lib996:sendmail("#".._role_name,1,_mail_title,_gifts_table[3][1],_gifts_table[3][2])
                end
            end
            local actor = lib996:getplayerbyname(_role_name)
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#EEEE00\'>[沙城争霸]奖励已发送,请注意查看邮件</font>","Type":9}')
        end
    end
    lib996:setsysstr(_var_name_castlewarPlayers,"")
end

local function _onMove(actor,moveType)
    local bool = lib996:castleinfo(5)
    if not bool then return end
    bool = lib996:getbaseinfo(actor,ConstCfg.gbase.siegearea)
    if not lib996:getbaseinfo(actor,ConstCfg.gbase.siegearea) then return end

    local guild = lib996:getbaseinfo(actor,ConstCfg.gbase.guild)   --没有行会 返回 ""  而不是 nil
    if guild == "" then return end

    role_guid = lib996:getbaseinfo(actor,ConstCfg.gbase.id)
    role_name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)
    -- print("沙巴克攻城战移动触发",role_name.."在移动")

    local castlewarPlayers = {}

    local temp = lib996:getsysstr(_var_name_castlewarPlayers)
    if temp ~= "" then
        temp = unserialize(temp)
        if type(temp) == "table" then
            castlewarPlayers = temp
        end
    end

    if castlewarPlayers[role_guid] then
        if castlewarPlayers[role_guid] ~= role_name then
            castlewarPlayers[role_guid] = role_name
        end
        return
    end

    castlewarPlayers[role_guid] = role_name
    lib996:setsysstr(_var_name_castlewarPlayers,serialize(castlewarPlayers))
end

--活动开启时
--进入区域的行会成员==参与活动
--胜利方会长 和胜利方参与人员  发送邮件 胜利邮件奖励
--参与人员  发送邮件 失败邮件 奖励
--@Allcastwar
--@ForcedWallconquestWar 开始/停止攻城
GameEvent.add(EventCfg.goCastlewarend, _goCastlewarend,filename)
GameEvent.add(EventCfg.onMove, _onMove,filename)