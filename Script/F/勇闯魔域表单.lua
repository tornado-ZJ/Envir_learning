lib996:include("Script/serialize.lua")

--活动基本信息表
local cfg_duplicate = lib996:include("QuestDiary/cfgcsv/cfg_duplicate.lua")

local filename = "魔域大战表单"

local _activityid = 2                                           --活动副本id

local _taskid = 5                                               --任务栏展示id，对应cfg_newtask.xls

local _timerid = 21                                             --全局定时器id

local _shichang = cfg_duplicate[_activityid].totalTime          --活动时长

local _mapId = cfg_duplicate[_activityid].mapId                 --活动地图

local _varg_starttime       = "SSJ_ycmy_startTime"              --活动开始时间戳
local _varg_endtime         = "SSJ_ycmy_endTime"                --活动结束时间戳

-------------------------------↓↓↓ 本地方法 ↓↓↓---------------------------------------
--活动是否结束
local function _isEnded()
    local curtime = os.time()
    local endtime = lib996:getsysint(_varg_endtime)
    if endtime == 0 then return true end
    return curtime > endtime
end

--是否不在活动地图
local function _isNotInMap(actor)
    local cur_mapId = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    return cur_mapId ~= _mapId
end
-------------------------------↓↓↓ 逻辑处理 ↓↓↓---------------------------------------
--活动开启
function open()
    local endtime = os.time() + _shichang
    lib996:setsysint(_varg_endtime, endtime)
    lib996:setsysint(_varg_starttime, os.time())
    lib996:setontimerex(_timerid, 1)

    local _msg = "勇闯魔域活动开启！"
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
end

--任务栏展示信息每秒刷新(倒计时/名次/积分)
local function _changetask(actor)
    if _isEnded() then lib996:newdeletetask(actor,_taskid) return end
    local down_time = lib996:getsysint(_varg_endtime) - os.time()
    local down_time_str = ssrSecToHMS(down_time)
    lib996:newpicktask(actor,_taskid,down_time_str)
end

--活动倒计时
function countdown()
    --修改活动倒计时
    local curtime = os.time()
    local starttime = lib996:getsysint(_varg_starttime)
    local endtime = lib996:getsysint(_varg_endtime)
    --活动结束
    if curtime >= endtime then
        close()
        return
    else
        local _time = curtime - starttime
        --刷新地图内玩家的任务栏
        local map_actors = lib996:getobjectinmap(_mapId, 0, 0, 1000, 1)
        if map_actors then
            for _,actor in ipairs(map_actors) do
                _changetask(actor)
            end
        end
    end
end

--活动结束
function close()
    lib996:setofftimerex(_timerid)             --关闭活动定时器
    lib996:setsysint(_varg_endtime, 0)         --清理活动结束时间

    --地图内玩家回城
    local map_actors = lib996:getobjectinmap(_mapId, 0, 0, 1000, 1)
    if map_actors then
        for _,actor in ipairs(map_actors) do
            if lib996:getbaseinfo(actor, ConstCfg.gbase.isdie) then
                realive(actor)              --复活
            end
            FBackZone(actor)
        end
    end

    local _msg = "勇闯魔域活动已结束！"
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"'.._msg..'","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
end

-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
function custom_open(actor)
    if not _isEnded() then
        lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>活动进行中..</font>","Type":9}')
        return
    end
    lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#EEEE00\'>演示版本启动活动,请重新传送参与活动</font>","Type":9}')
    open()
end

function custom_close(actor)
    if _isEnded() then
        lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>活动未开启</font>","Type":9}')
        return
    end
    close()
end
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--进入
function RequestEnter(actor)
    --活动未开启
    if _isEnded() then
        custom_open(actor)
        return
    end

    if not _isNotInMap(actor) then return end

    --回复
    local endtime = lib996:getsysint(_varg_endtime)

    lib996:map(actor,_mapId)
end

--离开
function RequestExit(actor)
    --在地图中回城
    if _isNotInMap(actor) then return end
    FBackZone(actor)
    -- Message.se1ndmsg(actor, ssrNetMsgCfg.Playggzj_ExitResponse)
end

--请求回城
function RequestBack(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end

-------------------------------↓↓↓ 外部调用 ↓↓↓---------------------------------------
--请求复活
function revive(actor)
    if _isNotInMap(actor) then return end
    lib996:map(actor,_mapId)
    lib996:realive(actor)
end
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
--退出游戏
local function _onExitGame(actor)
    if _isNotInMap(actor) then return end
    FBackZone(actor)
end
GameEvent.add(EventCfg.onExitGame, _onExitGame, filename)

--进入/切换地图
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
-- -------------------------------↓↓↓ 自定义命令控制活动 ↓↓↓---------------------------------------