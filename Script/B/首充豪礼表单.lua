lib996:include("Script/serialize.lua")

local cfg_shouchong = lib996:include("QuestDiary/cfgcsv/cfg_shouchong.lua")

local _var_getInfo = {}                -- �׳���ȡ���

for i, v in ipairs(cfg_shouchong) do
    table.insert(_var_getInfo,"�׳������"..i)
end

local _state = {
    no_receive      = 0,       -- δ��ʱ��/������ȡ
    yes_receive     = 1,       -- ������ȡ
    has_receive     = 2,       -- ����ȡ
}

local _day_table = {}

for i, v in ipairs(cfg_shouchong) do
    _day_table[i] = "YAoLX_bian" .. i
end


-------------------------------������������Ϣ������---------------------------------------
-- ͬ����Ϣ
function SyncResponse(actor)
    local autoindex = 1
    for i,varname in ipairs(_day_table) do
        _var_getInfo[i] = lib996:getint(0,actor,varName)
        
        local state = lib996:getint(0, actor, varname)
        print("state="..state)
        if state == _state.has_receive then 
            autoindex = autoindex + 1
        end  -- ��������ȡ
        print("=="..i)
    end
    autoindex = math.min(autoindex, 3)

    print("�׳�, ͬ����Ϣ")
    lib996:showformwithcontent(actor, "B/�׳�������", "QSQ_shouchong#" .. serialize(_var_getInfo))
end

    -- ��ȡ��Ʒ
function LingQu(actor, num)
    num = tonumber(num)
    local cfg = cfg_shouchong [num]
    if not cfg then return end
    
    local varName = _day_table[num]
    print(varName,"varName")

    local state = lib996:getint(0, actor, varName)
    print(state,"��ȡ״̬")

    if state == _state.has_receive then
        lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>��������ȡ</font>","Type":10}')
        return
    end
    -- ����Ʒ
    
    for key,var in ipairs(cfg.reward) do
        -- print("key", type(key), key)
        -- print("var", type(var), serialize(var))

        local name =  lib996:getstditeminfo(var[1], 1)
        lib996:giveitem(actor, name, var[2], "�׳佱��")

    end

    -- д����
    lib996:setint(0,actor,varName, _state.has_receive)

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>��ȡ�ɹ�</font>","Type":10}')

    -- �ظ�
    SyncResponse(actor)
end

    -- ��ֵ�ɹ�ʱ
local function _playerrecharge(actor)
    -- ��ֵ�����ǵ�һ�γ�ֵ����ǿ�����ȡ״̬
    local state = lib996:getint(0, actor, "�Ƿ��׳�")
    if nil == state or state == _state.no_receive then
        lib996:setint(0, actor, "�Ƿ��׳�", _state.yes_receive)
        lib996:setint(0, actor, _var_getInfo[1], _state.yes_receive)
    end
end

GameEvent.add(EventCfg.onRecharge,  _playerrecharge, "�׳丣��")  --��ֵ

-- ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
local function _goDailyUpdate(actor)
    local state = lib996:getint(0, actor, "�Ƿ��׳�")
    if state == _state.yes_receive then
        for _, varName in ipairs(_var_getInfo) do
            local temp = lib996:getint(0,actor,varName)
            if temp == _state.no_receive then
                lib996:setint(0, actor,varName, _state.yes_receive)
                break
            end
        end
    end
end
GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate,"�׳丣��") 






--     -- �ж��Ƿ������ȡ(ʱ�䵽��)
--     -- ��ȡʱ����жϣ���ǰʱ������ϴ�ʱ���������ͬ��������ȡ
--     if state == _state.yes_receive then
--     -- ��ȡ
--     -- ��ȡ�߼�


--     -- ��¼�Ѿ���ȡ��
--     -- ÿ���賿 �� ÿ�յ�һ�ε�¼ ����
--     local function _goDailyUpdate(actor)
--         for _, varName in ipairs(_var_name_cfg) do
--             lib996:setint(0, actor, varname, _state.has_receive)
--         end
--     end
--     GameEvent.add(EventCfg.goDailyUpdate, _goDailyUpdate, cfg)

--     -- �ÿͻ���ˢ�½���

--     -- ��¼��ȡ��ʱ�����Ϊ�´���ȡ�ж�
--     end
-- end
