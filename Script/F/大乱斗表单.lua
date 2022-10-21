lib996:include("Script/serialize.lua")

local filename = "���Ҷ���"

--�������Ϣ��
local cfg_duplicate = lib996:include("QuestDiary/cfgcsv/cfg_duplicate.lua")

--�ˢ�ֱ�
local cfg_fuben_gen = lib996:include("QuestDiary/cfgcsv/cfg_fuben_gen.lua")

--����н�����
local cfg_rewards = lib996:include("QuestDiary/cfgcsv/cfg_daluandou_rewards.lua")

local cfg_dld_jifen = lib996:include("QuestDiary/cfgcsv/cfg_daluandou_jifen.lua")

local cfg_mail = lib996:include("QuestDiary/cfgcsv/cfg_mail.lua")

local _activityid = 1                                           --�����id

local _cfg = cfg_duplicate[_activityid]

local _taskid = 4                                               --������չʾid����Ӧcfg_newtask.xls

local _timerid = 22                                             --ȫ�ֶ�ʱ��id

local _time = _cfg.totalTime                                    --�ʱ��

local _mapId = _cfg.mapId                                       --���ͼ

local _var_name_startTime   = "SSJ_dld_startTime"               --���ʼʱ���
local _var_name_endTime     = "SSJ_dld_endTime"                 --�����ʱ���

local _var_name_jifen       = "SSJ_dld_jifen"                   --�������
local _var_name_killNum     = "SSJ_dld_killNum"                 --�ɱ����
local _var_name_killTime    = "SSJ_dld_killTime"                --�ɱ�˼�ʱ

local _var_name_ranlList    = "SSJ_dld_ranlList"                --����б�

local cfg_monster = {}                                          --�ˢ�ֱ�

local cfg_jifen_gift = {}                                       --����ֽ�����

local cfg_killer_gift = {}                                      --�ɱ�˽�����

local shijian   --���(��)

for i,v in ipairs(cfg_fuben_gen) do
    if v.id == _activityid then
        table.insert(cfg_monster,v)
        if not shijian then
            shijian = v.shijian * 60
        end
    end
end

for i,v in ipairs(cfg_rewards) do
    if v.type == 1 then
        table.insert(cfg_jifen_gift,v)
    elseif v.type == 2 then
        table.insert(cfg_killer_gift,v)
    end
end
-------------------------------������ ���ط��� ������---------------------------------------

--��Ƿ����
local function _isEnded()
    local curtime = os.time()
    local endTime = lib996:getsysint(_var_name_endTime)
    if endTime == 0 then return true end
    return curtime > endTime
end

--�Ƿ��ڻ��ͼ
local function _isNotInMap(actor)
    local cur_mapId = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end

local function campare(a, b)
    if a[2] == b[2] then
        if a[3] and b[3] then
            return a[3] < b[3]
        else
            return true
        end
    else
        return a[2] > b[2]
    end
end

--��ȡ���ݱ�
local function getRankList(var_name,count,var2_name)
    count = count or 0
    local var = lib996:sorthumvar(var_name, 0, 1, count) or {}
    local rank = 1
    local rank_list = {}

    for i=1,#var,2 do
        rank_list[rank] = {var[i], var[i+1]}
        rank = rank + 1
    end

    if var2_name then
        local temp = lib996:sorthumvar(var2_name, 0, 1, 0) or {}
        local temp_list = {}
        for i=1,#temp,2 do
            temp_list[i] = temp[i+1]
        end
        for i, v in ipairs(rank_list) do
            v[3] = temp_list[ v[1] ] or 0
        end

        table.sort(rank_list, campare)
    end

    return rank_list
end

local function _KillRankBySort()
    local var = lib996:sorthumvar(_var_name_killNum, 0, 1, 0) or {}
    local rank = 1
    local rank_list = {}
    for i=1,#var,2 do
        rank_list[rank] = {var[i], var[i+1]}
        rank = rank + 1
    end

    local var2 = lib996:sorthumvar(_var_name_killTime, 0, 1, 0) or {}

    for i=1,#var2,2 do
        for j, v in ipairs(rank_list) do
            if v[1] == var2[i] then
                v[3] = var2[i+1]
                v[4] = os.date("%Y-%m-%d %H:%M:%S", v[3])   --���Թ۲�
                break
            end
        end
    end

    table.sort(rank_list, campare)

    local max = 10
    while #rank_list > max do
        table.remove(rank_list,#rank_list)
    end

    lib996:setsysstr(_var_name_ranlList, serialize(rank_list), 1)
end

--������չʾ��Ϣÿ��ˢ��(����ʱ/����/����)
local function _changetask(actor)
    if _isEnded() then lib996:newdeletetask(actor,_taskid) return end

    local data = unserialize(lib996:getsysstr(_var_name_ranlList))

    local ownrank = 0
    local roleName = lib996:getbaseinfo(actor,1)
    for i, v in ipairs(data) do
        if v[1] == roleName then
            ownrank = i
            break
        end
    end
    --local ownrank = humvarrank(actor, _var_name_killNum, 0, 1) or 0
    local down_time = lib996:getsysint(_var_name_endTime) - os.time()
    local down_time_str = ssrSecToHMS(down_time)

    local jifen = lib996:getint(0,actor, _var_name_jifen)
    local killNum = lib996:getint(0,actor, _var_name_killNum)

    lib996:newchangetask(actor,_taskid,jifen,killNum,ownrank,down_time_str)
end

local function _Fsendmail(name,mail,reward)
    local stritem
    --�ʼ���Ʒ
    if reward then
        if type(reward) == "table" then
            local items
            for _,item in ipairs(reward) do
                if type(item) == "table" then
                    items = items or {}
                    if item[3] == 1 then item[3] = ConstCfg.binding end
                    table.insert(items, table.concat(item, "#"))
                else
                    stritem = table.concat(reward, "&")
                    break
                end
            end

            if items then stritem = table.concat(items, "&") end
        else
            stritem = reward.."#1"
        end
    end
    lib996:sendmail("#"..name, 1, mail.title, mail.content, stritem)
end

--ˢ��
local function _selectMonsters()
    for i,var in pairs(cfg_monster) do
        local monname = lib996:getmonbaseinfo(var.mid, ConstCfg.stdmoninfo.name)

        local count = lib996:checkrangemoncount(_mapId, monname, 0, 0, 10000)

        local num = var.count - count

        if num > 0 then
            lib996:genmon(_mapId,var.position[1],var.position[2], monname, var.fanwei, num)
        end
    end
end
-------------------------------������ �߼����� ������---------------------------------------
--�����
function open()
    lib996:setsysint(_var_name_startTime, os.time())
    local endTime = os.time() + _time
    lib996:setsysint(_var_name_endTime, endTime)
    lib996:setontimerex(_timerid, 1)

    local now = os.time()

    local _msg = "��ս�Ͻ�֮�ۻ������"
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')

    --�������
    lib996:clearhumcustvar(nil, _var_name_killTime)
    lib996:clearhumcustvar(nil, _var_name_killNum)
    lib996:clearhumcustvar(nil, _var_name_jifen)
    lib996:setsysstr(_var_name_ranlList, serialize({}), 1)

    _selectMonsters()
end

--���ʱ��
function countdown()
    --�޸Ļ����ʱ
    local curtime = os.time()
    local startTime = lib996:getsysint(_var_name_startTime)
    local endTime = lib996:getsysint(_var_name_endTime)
    --�����
    if curtime >= endTime then
        close()
        return
    else
        local _time = curtime - startTime
        if _time % shijian == 0 then
            _selectMonsters()
        end

        --ˢ�µ�ͼ����ҵ�������
        local map_actors = lib996:getobjectinmap(_mapId, 0, 0, 1000, 1)
        if map_actors then
            for _,actor in ipairs(map_actors) do
                _changetask(actor)
            end
        end
    end
end

--�����
function close()
    lib996:setofftimerex(_timerid)                  --�رջ��ʱ��
    lib996:setsysint(_var_name_endTime, 0)          --��������ʱ��

    --��ͼ����һس�
    local map_actors = lib996:getobjectinmap(_mapId, 0, 0, 1000, 1)
    if map_actors then
        for _,actor in ipairs(map_actors) do
            if lib996:getbaseinfo(actor, ConstCfg.gbase.isdie) then
                --����
                lib996:realive(actor)
            end
            FBackZone(actor)
        end
    end

    --�����ͼ����
    lib996:killmonsters(_mapId, "*", 0)

    --����
    local _msg = "��ս�Ͻ�֮�ۻ�ѽ�����"
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')

    --���ͽ���
    local killer_rank = unserialize(lib996:getsysstr(_var_name_ranlList))

    --local killer_rank = getRankList(_var_name_killNum,cfg_killer_gift[#cfg_killer_gift].ranking[1][2],_var_name_killTime)
    for i,v in ipairs(killer_rank) do
        local name,killNum = v[1],v[2]
        local gift
        for j,var in ipairs(cfg_killer_gift) do
            if i >= var.ranking[1][1] and i <= var.ranking[1][2] then
                gift = var
                break
            end
        end
        if gift and cfg_mail[gift.mailId] then
            _Fsendmail(name,cfg_mail[gift.mailId],gift.reward)
        end
    end
    local jifen_rank = getRankList(_var_name_jifen)
    for i,v in ipairs(jifen_rank) do
        local name,jifen = v[1],v[2]
        local gift
        for j,var in ipairs(cfg_jifen_gift) do
            if jifen >= var.needPoints then
                gift = var
            end
        end
        if gift and cfg_mail[gift.mailId] then
            _Fsendmail(name,cfg_mail[gift.mailId],gift.reward)
        end
    end
end

-------------------------------������ �ⲿ���� ������---------------------------------------
--���󸴻�
function revive(actor)
    if _isNotInMap(actor) then return end
    map(actor,_mapId)
    lib996:realive(actor)
end
function custom_open(actor)
    if not _isEnded() then
        lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�������..</font>","Type":9}')
        return
    end
    lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#EEEE00\'>��ʾ�汾�����,�����´��Ͳ���</font>","Type":9}')
    open()
end

function custom_close(actor)
    if _isEnded() then
        lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�δ����</font>","Type":9}')
        return
    end
    close()
end
-------------------------------������ ������Ϣ ������---------------------------------------
--��������ͼ
function RequestEnter(actor)
    --�δ����
    if _isEnded() then
        custom_open(actor)
        return
    end
    --�ڵ�ͼ��
    if not _isNotInMap(actor) then return end
    lib996:mapmove(actor, _mapId)
end

--����򿪻���/�������
local _sync_data_memory = {}
function RequestOpenRankWnd(actor,page)
    --ͬ����Ϣ
    local myNum,myRank = 0,0
    if page == 1 then   --���ֽ������
        myNum = lib996:getint(0,actor, _var_name_jifen) or 0
        _sync_data_memory = {}
    elseif page == 2 then   --�����������
        myNum = lib996:getint(0,actor, _var_name_killNum) or 0
        myRank = lib996:humvarrank(actor, _var_name_killNum, 0, 1) or 0
        _sync_data_memory = {}
    elseif page == 3 then   --��ɱ�������
        local killer_rank = unserialize(lib996:getsysstr(_var_name_ranlList))
        local roleName = lib996:getbaseinfo(actor,1)
        for i, v in ipairs(killer_rank) do
            if v[1] == roleName then
                myRank = i
                break
            end
        end
        myNum = lib996:getint(0,actor, _var_name_killNum) or 0
        _sync_data_memory = killer_rank
    elseif page == 100 then   --ɳ���������
        myNum = 100
    end
    lib996:showformwithcontent(actor,"", "TaskWnd.OpenRankWnd("..serialize({page,myNum,myRank,_sync_data_memory})..")")
end

--����س�
function RequestBack(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
-- ----------------------------������ �����¼� ������---------------------------------------

-- ----------------------------������ ��Ϸ�¼� ������---------------------------------------
--�˳���Ϸ
local function _onExitGame(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
GameEvent.add(EventCfg.onExitGame, _onExitGame, filename)

--����/�л���ͼ
local function _goSwitchMap(actor,cur_mapid, former_mapid)
    if cur_mapid == _mapId then
        lib996:showformwithcontent(actor,"", "TaskWnd.CreatdldBtn()")
    end
    if former_mapid == _mapId then
        lib996:newdeletetask(actor,_taskid)
        lib996:showformwithcontent(actor,"", "TaskWnd.DeletdldBtn()")
    end
end
GameEvent.add(EventCfg.goSwitchMap, _goSwitchMap, filename)

--��ɱ���ﴥ��
local function _onKillMon(actor, monster,monsteridx)
    if _isEnded() then return end
    if _isNotInMap(actor) then return end
    if not lib996:getbaseinfo(actor, ConstCfg.gbase.isplayer) then return end

    local iskillrole = lib996:getbaseinfo(monster, ConstCfg.gbase.isplayer)
    local addJifen = 0
    if not iskillrole then
        for i,v in ipairs(cfg_dld_jifen) do
            if v.guaiwu == monsteridx then
                addJifen = v.count
                break
            end
        end
    end
    if addJifen ~= 0 then
        lib996:setint(0,actor, _var_name_jifen, lib996:getint(0,actor, _var_name_jifen) + addJifen)
        _changetask(actor)
    end
end
GameEvent.add(EventCfg.onKillMon, _onKillMon, filename)

--��ɱ��Ҵ���
local function _onkillplay(actor, role)
    if _isEnded() then return end
    if _isNotInMap(actor) then return end

    local addJifen = cfg_dld_jifen[1].count
    lib996:setint(0,actor, _var_name_jifen, lib996:getint(0,actor, _var_name_jifen) + addJifen)

    lib996:setint(0,actor, _var_name_killNum, lib996:getint(0,actor, _var_name_killNum) + 1)

    lib996:setint(0,actor, _var_name_killTime, os.time())

    _KillRankBySort()   --��������

    _changetask(actor)
end
GameEvent.add(EventCfg.onkillplay, _onkillplay, filename)
