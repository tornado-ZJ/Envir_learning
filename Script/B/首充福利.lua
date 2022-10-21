local _cfg_lj = lib996:include("Script/serialize.lua")
local _cfg_mr = lib996:include("3rd/log/Logger.lua")

local cfg_shouchong = lib996:include("QuestDiary/cfgcsv/cfg_shouchong.lua")

local _var_name_getInfo = {}                --�׳���ȡ���

local cfg = cfg_shouchong

for i, v in ipairs(cfg) do
    table.insert(_var_name_getInfo,"C_QsQgetInfo_"..i)
end


local _state = {
    no_receive      = 0,        --- δ��ʱ��/������ȡ
    yes_receive     = 1,        --- ������ȡ
    has_receive     = 2,        --- ����ȡ
}

local _sync_data_memory = {     --- ���ȷ���ͬ���ڴ�����{{��ȡ���}}
    1,1,1,
}

-------------------------------������ ������Ϣ ������---------------------------------------
--- ͬ����Ϣ
function SyncResponse(actor)
    for i,varname in ipairs(_var_name_getInfo) do
        lib996:setint(0,actor,varname, 1)
        _sync_data_memory[i] = lib996:getint(0,actor,varname)
    end

    print("�׳䣬ͬ����Ϣ")
    -- lib996:showformwithcontent(actor,"", "DailyRecharge.SyncResponse()")
    lib996:showformwithcontent(actor, "B/shouchong", "QSQ_shouchong#"..serialize(_sync_data_memory))
end

--��ֵ�ɹ�ʱ
local function _playerrecharge(actor)--��ֵ

end
GameEvent.add(EventCfg.onRecharge,  _playerrecharge, "�׳丣��")  --��ֵ

function LingQu(actor,num)
    num = tonumber(num)
    local cfg = cfg_shouchong[num]
    Player.giveItemByTable(actor, cfg.reward)
end
--��ȡ����

    