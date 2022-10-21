lib996:include("Script/serialize.lua")

--�������Ϣ��
local cfg_duplicate = lib996:include("QuestDiary/cfgcsv/cfg_duplicate.lua")

local filename = "ħ���ս��"

local _activityid = 2                                           --�����id

local _taskid = 5                                               --������չʾid����Ӧcfg_newtask.xls

local _timerid = 21                                             --ȫ�ֶ�ʱ��id

local _shichang = cfg_duplicate[_activityid].totalTime          --�ʱ��

local _mapId = cfg_duplicate[_activityid].mapId                 --���ͼ

local _varg_starttime       = "SSJ_ycmy_startTime"              --���ʼʱ���
local _varg_endtime         = "SSJ_ycmy_endTime"                --�����ʱ���

-------------------------------������ ���ط��� ������---------------------------------------
--��Ƿ����
local function _isEnded()
    local curtime = os.time()
    local endtime = lib996:getsysint(_varg_endtime)
    if endtime == 0 then return true end
    return curtime > endtime
end

--�Ƿ��ڻ��ͼ
local function _isNotInMap(actor)
    local cur_mapId = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end
-------------------------------������ �߼����� ������---------------------------------------
--�����
function open()
    local endtime = os.time() + _shichang
    lib996:setsysint(_varg_endtime, endtime)
    lib996:setsysint(_varg_starttime, os.time())
    lib996:setontimerex(_timerid, 1)

    local _msg = "�´�ħ��������"
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
end

--������չʾ��Ϣÿ��ˢ��(����ʱ/����/����)
local function _changetask(actor)
    if _isEnded() then lib996:newdeletetask(actor,_taskid) return end
    local down_time = lib996:getsysint(_varg_endtime) - os.time()
    local down_time_str = ssrSecToHMS(down_time)
    lib996:newpicktask(actor,_taskid,down_time_str)
end

--�����ʱ
function countdown()
    --�޸Ļ����ʱ
    local curtime = os.time()
    local starttime = lib996:getsysint(_varg_starttime)
    local endtime = lib996:getsysint(_varg_endtime)
    --�����
    if curtime >= endtime then
        close()
        return
    else
        local _time = curtime - starttime
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
    lib996:setofftimerex(_timerid)             --�رջ��ʱ��
    lib996:setsysint(_varg_endtime, 0)         --��������ʱ��

    --��ͼ����һس�
    local map_actors = lib996:getobjectinmap(_mapId, 0, 0, 1000, 1)
    if map_actors then
        for _,actor in ipairs(map_actors) do
            if lib996:getbaseinfo(actor, ConstCfg.gbase.isdie) then
                realive(actor)              --����
            end
            FBackZone(actor)
        end
    end

    local _msg = "�´�ħ���ѽ�����"
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
end

-------------------------------������ �ⲿ���� ������---------------------------------------
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
--����
function RequestEnter(actor)
    --�δ����
    if _isEnded() then
        custom_open(actor)
        return
    end

    if not _isNotInMap(actor) then return end

    --�ظ�
    local endtime = lib996:getsysint(_varg_endtime)

    lib996:map(actor,_mapId)
end

--�뿪
function RequestExit(actor)
    --�ڵ�ͼ�лس�
    if _isNotInMap(actor) then return end
    FBackZone(actor)
    -- Message.se1ndmsg(actor, ssrNetMsgCfg.Playggzj_ExitResponse)
end

--����س�
function RequestBack(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end

-------------------------------������ �ⲿ���� ������---------------------------------------
--���󸴻�
function revive(actor)
    if _isNotInMap(actor) then return end
    lib996:map(actor,_mapId)
    lib996:realive(actor)
end
-- ----------------------------������ �����¼� ������---------------------------------------
--�˳���Ϸ
local function _onExitGame(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
GameEvent.add(EventCfg.onExitGame, _onExitGame, filename)

--����/�л���ͼ
local function _goSwitchMap(actor,cur_mapid, former_mapid)
    if cur_mapid == _mapId then
        lib996:showformwithcontent(actor,"", "TaskWnd.DeletycmyBtn()")
    end
    if former_mapid == _mapId then
        lib996:newdeletetask(actor,_taskid)
        lib996:showformwithcontent(actor,"", "TaskWnd.DeletycmyBtn()")
    end
end
GameEvent.add(EventCfg.goSwitchMap, _goSwitchMap, filename)
-- -------------------------------������ �Զ���������ƻ ������---------------------------------------