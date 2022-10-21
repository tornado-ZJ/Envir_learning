lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_sbk.lua")

local filename = "ɳ�����Ա�"

local _var_name_castlewarPlayers = "C_QsQcastlewarPlayers"

local _mail_title = "ɳ������"

local _gifts_table = {
    --ʤ���߻᳤�ʼ���Ϣ,����
    {"����ɳ�����Ի�У���Ϊ��ɳ�Ϳ��ϴ�������˻᳤ר������������ա�",""},
    --ʤ���߳�Ա�ʼ���Ϣ,����
    {"�����л�ɳ�����Ի�У��ɹ�ռ��ɳ�Ϳˣ��������ʤ���߽���������ա�",""},
    --ʧ�ܲ������ʼ���Ϣ,����
    {"�����л�ɳ�����Ի�У���δռ��ɳ�Ϳˣ�������Ŭ�����ǿ������У����Ļ���˼����߽���������ա�",""},
}
local itemName,role_name,role_guid
-------------------------------������ ���ط��� ������---------------------------------------
local function table2KeyValue(winner_roles)
    local temp = {}
    for k,v in ipairs(winner_roles) do
        temp[v] = 1
    end
    return temp
end

--ʤ���߻᳤����
for j, var in ipairs(_cfg[1].reward) do
    itemName = lib996:getstditeminfo(var[1],1)
    _gifts_table[1][2] = _gifts_table[1][2]..itemName.."#"..var[2].."&"
end
--ʤ���߳�Ա����
for j, var in ipairs(_cfg[1].rewardt) do
    itemName = lib996:getstditeminfo(var[1],1)
    _gifts_table[2][2] = _gifts_table[2][2]..itemName.."#"..var[2].."&"
end
--ʧ�ܲ����߽���
for j, var in ipairs(_cfg[2].rewardt) do
    itemName = lib996:getstditeminfo(var[1],1)
    _gifts_table[3][2] = _gifts_table[3][2]..itemName.."#"..var[2].."&"
end

-------------------------------������ ������Ϣ ������---------------------------------------
--��������ͼ
function RequestEnter(actor)
    local state = lib996:castleinfo(ConstCfg.castle.info.state)
    if state then
        -- local base_x,base_y = 180,160
        -- lib996:mapmove(actor, "nhjsbk", math.random(base_x - 3, base_x + 3), math.random(base_y - 3, base_y + 3))
    else
        lib996:addattacksabakall()
        lib996:gmexecute(actor,"ForcedWallconquestWar")
        lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#EEEE00\'>��ʾ�汾��������ս,�����´��Ͳ���</font>","Type":9}')
    end
    local base_x,base_y = 180,160
    lib996:mapmove(actor, "nhjsbk", math.random(base_x - 3, base_x + 3), math.random(base_y - 3, base_y + 3))
end
-------------------------------������ �ɷ��¼� ������---------------------------------------
local function _goCastlewarend()
    local guildmgr = lib996:castleinfo(ConstCfg.castle.info.guildmgr)
    if guildmgr ~= "����Ա" then
        local winner_name = lib996:castleinfo(2)                    --ʤ�����л�����
        local winner_guild = lib996:findguild(1,winner_name)        --��ȡ�л�guid
        local winner_roles = lib996:getguildinfo(winner_guild,3)    --�����л�guid��ȡ�л��Ա name�����᳤

        winner_roles = table2KeyValue(winner_roles)

        --����������
        local players_tab = lib996:getsysstr(_var_name_castlewarPlayers)

        if players_tab == "" then return end
        players_tab = unserialize(players_tab)
        if type(players_tab) ~= "table" then return end

        for _role_guid, _role_name in pairs(players_tab) do

            if _role_name == guildmgr then
                --ʤ���߻᳤����
                lib996:sendmail("#".._role_name,1,_mail_title,_gifts_table[1][1],_gifts_table[1][2])
            else
                if winner_roles[_role_guid] then
                    --ʤ���߳�Ա����
                    lib996:sendmail("#".._role_name,1,_mail_title,_gifts_table[2][1],_gifts_table[3][2])
                else
                    --ʧ�ܲ����߽���
                    lib996:sendmail("#".._role_name,1,_mail_title,_gifts_table[3][1],_gifts_table[3][2])
                end
            end
            local actor = lib996:getplayerbyname(_role_name)
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#EEEE00\'>[ɳ������]�����ѷ���,��ע��鿴�ʼ�</font>","Type":9}')
        end
    end
    lib996:setsysstr(_var_name_castlewarPlayers,"")
end

local function _onMove(actor,moveType)
    local bool = lib996:castleinfo(5)
    if not bool then return end
    bool = lib996:getbaseinfo(actor,ConstCfg.gbase.siegearea)
    if not lib996:getbaseinfo(actor,ConstCfg.gbase.siegearea) then return end

    local guild = lib996:getbaseinfo(actor,ConstCfg.gbase.guild)   --û���л� ���� ""  ������ nil
    if guild == "" then return end

    role_guid = lib996:getbaseinfo(actor,ConstCfg.gbase.id)
    role_name = lib996:getbaseinfo(actor,ConstCfg.gbase.name)
    -- print("ɳ�Ϳ˹���ս�ƶ�����",role_name.."���ƶ�")

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

--�����ʱ
--����������л��Ա==����
--ʤ�����᳤ ��ʤ����������Ա  �����ʼ� ʤ���ʼ�����
--������Ա  �����ʼ� ʧ���ʼ� ����
--@Allcastwar
--@ForcedWallconquestWar ��ʼ/ֹͣ����
GameEvent.add(EventCfg.goCastlewarend, _goCastlewarend,filename)
GameEvent.add(EventCfg.onMove, _onMove,filename)