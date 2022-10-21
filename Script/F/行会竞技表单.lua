lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_hanghuijingji.lua")  --�лᾺ����

local filename = "�лᾺ����"

local _var_name_gifts = "SSJ_familyGifts_gifts_"                        --�����ȡ����ǰ׺

local _var_name_bossNum = "SSJ_familyGifts_bossNum_"                    --�л�᳤�����ȡ����������ǰ׺

local _var_name_bossIsGet = "SSJ_familyGifts_isGet_"                    --�л�᳤����Ƿ���ȡ������ǰ׺[�л����,ÿ���л�ֻ����ȡһ�λ᳤���]

local _gifts_var_name = {}

local _gifts_bossNum_var_name = {}

local _gifts_bossIsGet_var_name = {}

local gifts_info = {}                                                   --�����ȡ���

local gifts_bossNum_info = {}                                           --�᳤���������ȡ���

for i, v in ipairs(_cfg) do
    _gifts_var_name[i] = _var_name_gifts .. i
    _gifts_bossNum_var_name[i] = _var_name_bossNum .. i
    _gifts_bossIsGet_var_name[i] = _var_name_bossIsGet .. i

    gifts_info[i] = 0
    gifts_bossNum_info[i] = 0
end

local playersNum = 0                                                    --�л��������

local _state = {
    not_receive     = 0,        --δ��ȡ
    yes_receive     = 1,        --����ȡ
    has_receive     = 2,        --����ȡ
}

local testNum
-- local testNum = 999              --�лά����������

-- -------------------------------������ ������Ϣ ������---------------------------------------
local _login_data = {playersNum,gifts_info}
--ͬ������
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

    if guild == '0' or guild == 0 then  --�л��ж�
        lib996:sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>�㻹δ�����л�</font>","Type":9}')
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
        lib996:sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>�������ȡ</font>","Type":9}')
        return
    end

    if playersNum < cfg.goal then
        lib996:sendmsg(actor,1,'{"Msg":"<font color=\'#ff0000\'>�л��Ա����</font>","Type":9}')
        return
    end

    if not Bag.checkBagEmptyNum(actor, needBag) then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>�����ռ䲻��,�����������</font>","Type":9}')
        return
    end

    local msg = "������ȡ�ɹ�"

    lib996:setint(0,actor,varName,_state.has_receive)

    if isboss then
        lib996:setint(1,guild,varName_bossIsGet,_state.has_receive)
        lib996:setsysint(varName_bossNum,bossCount)
        Player.giveItemByTable(actor, cfg.bossReward, filename)

        msg = msg ..",�����û᳤����"
    end

    Player.giveItemByTable(actor, cfg.reward, filename)

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#EEEE00\'>'..msg..'</font>","Type":9}')
    SyncResponse(actor)
end