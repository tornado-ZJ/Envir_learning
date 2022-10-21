lib996:include("Script/serialize.lua")

local cfg_shouchong = lib996:include("QuestDiary/cfgcsv/cfg_shouchong.lua")

--��ֵ״̬
local _state = {
    no_receive       = 0, --δ��ֵ
    can_receive      = 1, --�״γ�ֵ
    has_receive      = 1, --�����״γ�ֵ
}

function SyncResponse(actor, idx)
    idx = tonumber(idx)
    print("ͬ���׳䰴ť״̬")
    local state = lib996:getint(0, actor, "can_receive")
    if state ~= _state.can_receive then return end --�����״γ�ֵ


    local actDay = lib996:getint(0, actor, "actDay") --����ʱ��
    local nowDay = lib996:getint(0, actor, "nowDay") --��ǰ���ʱ�� ÿ����һ��ÿ��+1
    if not nowDay then
        nowDay = os.date("*t").day
        lib996:setint(0, actor, "nowDay", nowDay)
    end
    if actDay then
        local days = nowDay - actDay
        print("���ڣ�",nowDay)
        print("����ʱ��",actDay)
        local xxx = lib996:getint(0, actor, "��ȡ״̬"..idx)
        print("��ȡ״̬",xxx)
        lib996:showformwithcontent(actor, "","Shouchong.updateBtn("..days..","..state..","..idx..")")
    end

end

--�׳��ÿ�������ȡ״̬
function DailyUpdate(actor)
    local state = lib996:getint(0, actor, "can_receive")
    if not state or state ~= _state.can_receive then return end

    local nowDay = lib996:getint(0, actor, "nowDay")
    nowDay = nowDay + 1
    print("nowDay",nowDay)
    lib996:setint(0, actor, "nowDay", nowDay)

end
function GetData(idx) --��ȡ�׳佱����Ʒ�б�
    local reward_list = {}
    if idx then
        for i, data in ipairs(cfg_shouchong[idx].reward) do
            table.insert(reward_list, data)
        end
        return reward_list
    end
end

--��ȡ����
function Lingqv(actor,idx)
    idx = tonumber(idx)
    local reward_list = cfg_shouchong[idx].reward
    if not reward_list then return end

    local param = lib996:getint(0, actor, "��ȡ״̬"..idx)
    print("��ȡ״̬",param)
    print(type(param))
    if param == 0 then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>����ȡ</font>","Type":9}')
        return
    end
    --��ȡ����
    for i, reward in ipairs(reward_list) do
        local name = lib996:getstditeminfo(reward[1], 1)
        lib996:giveitem(actor, name, reward[2], "�׳佱��")
    end
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>��ȡ�ɹ�</font>","Type":9}')
    lib996:setint(0, actor, "��ȡ״̬"..idx, 0)


end
--��ֵ�ɹ���
function PlayerRecharge(actor)
    --���ó�ֵ״̬
    lib996:setint(0, actor, "can_receive", _state.no_receive)
    --���ÿ���ȡʱ��
    lib996:setint(0, actor, "nowDay", os.date("*t").day)

    local state = lib996:getint(0, actor, "can_receive")
    if not state or state == _state.no_receive then
        --print("�׳�")
        lib996:setint(0, actor, "can_receive", _state.can_receive)
        for i =1, #cfg_shouchong do
            lib996:setint(0, actor, "��ȡ״̬"..i, 1)
        end
    else
        print("�����׳�")
        lib996:setint(0, actor, "can_receive", _state.has_receive)
    end

    local actDay = os.date("*t").day
    lib996:setint(0, actor, "actDay", actDay)
    lib996:sendmsg(actor, 1, '{"Msg":" <font color=\'#ff0000\'>��ֵ�ɹ�</font>","Type":9}')
end


GameEvent.add(EventCfg.onRecharge, PlayerRecharge, "��ֵ")
GameEvent.add(EventCfg.goDailyUpdate, DailyUpdate, "ÿ�ո���")