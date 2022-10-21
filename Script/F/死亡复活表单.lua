lib996:include("Script/serialize.lua")

local _cfg = lib996:include("QuestDiary/cfgcsv/cfg_Fuhuo.lua")

local filename = "���������"

local revive_type = {
    FREE = 0,               --��Ѹ���
    PAY = 1,                --�շѸ���
}
-------------------------------������ ������Ϣ ������---------------------------------------
--�򿪽���(������������)
function OpenUI(actor, hiter)
    local hitername = lib996:getbaseinfo(hiter, ConstCfg.gbase.name)           --��ȡ��ɱ������
    --����
    lib996:showformwithcontent(actor,"F/�����������", "Die#"..hitername)
end

--���󸴻�
function RequestRevive(actor,realiveType)
    realiveType = tonumber(realiveType)
    --�жϵ�ǰ�Ƿ�����״̬
    if not lib996:getbaseinfo(actor, ConstCfg.gbase.isdie) then return end

    realiveType = realiveType or revive_type.FREE

    if realiveType == revive_type.FREE then
        --�سǸ���
        FBackZone(actor)
        lib996:realive(actor)
    elseif realiveType == revive_type.PAY then
        local name,num = Player.checkItemNumByTable(actor, _cfg[1].Pay)
        if name then
            lib996:sendmsg(actor, ConstCfg.notice.own, '{"Msg":"<font color=\'#ff0000\'>�������!</font>","Type":9}')
        else
            Player.takeItemByTable(actor, _cfg[1].Pay)
            lib996:realive(actor)
        end
    end
    --�ظ�
    lib996:showformwithcontent(actor,"", "CloseWnd()")
end
-- ----------------------------������ �����¼� ������---------------------------------------
-- --��ɫ��������
local function _onPostDie(actor,hiter)
    OpenUI(actor,hiter)
end
GameEvent.add(EventCfg.onPostDie, _onPostDie, filename)