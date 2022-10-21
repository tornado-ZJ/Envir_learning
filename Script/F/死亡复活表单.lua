lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_Fuhuo.lua")

local filename = "死亡复活表单"

local revive_type = {
    FREE = 0,               --免费复活
    PAY = 1,                --收费复活
}
-------------------------------↓↓↓ 网络消息 ↓↓↓---------------------------------------
--打开界面(死亡触发调用)
function OpenUI(actor, hiter)
    local hitername = lib996:getbaseinfo(hiter, ConstCfg.gbase.name)           --获取击杀者名字
    --发送
    lib996:showformwithcontent(actor,"F/死亡复活面板", "Die#"..hitername)
end

--请求复活
function RequestRevive(actor,realiveType)
    realiveType = tonumber(realiveType)
    --判断当前是否死亡状态
    if not lib996:getbaseinfo(actor, ConstCfg.gbase.isdie) then return end

    realiveType = realiveType or revive_type.FREE

    if realiveType == revive_type.FREE then
        --回城复活
        FBackZone(actor)
        lib996:realive(actor)
    elseif realiveType == revive_type.PAY then
        local name,num = Player.checkItemNumByTable(actor, _cfg[1].Pay)
        if name then
            lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>灵符不足!</font>","Type":9}')
        else
            Player.takeItemByTable(actor, _cfg[1].Pay)
            lib996:realive(actor)
        end
    end
    --回复
    lib996:showformwithcontent(actor,"", "CloseWnd()")
end
-- ----------------------------↓↓↓ 引擎事件 ↓↓↓---------------------------------------
-- --角色死亡触发
local function _onPostDie(actor,hiter)
    OpenUI(actor,hiter)
end
GameEvent.add(EventCfg.onPostDie, _onPostDie, filename)