lib996:include("Script/serialize.lua")



local cfg_shouchong = lib996:include("QuestDiary/cfgcsv/cfg_shouchong.lua")


function shouchongok(actor) ---点击按钮
    local sclevel = lib996:getbaseinfo(actor, 39)
    local next_sclevel = sclevel + 1
    local cfg = cfg_shouchong[sclevel]
    local next_cfg = cfg_shouchong[next_sclevel]
end



---充值成功时
local function _playerrecharge(actor)--充值
    -- local billNum = getplayvar(actor, VarCfg.U_real_recharge_cent)
    -- local int = getplayvar(actor, _var_name)
    -- if int == ConstCfg.flag.no and billNum ~= 0 then
    --     FSetPlayVar(actor,_var_name,os.time())
    -- end
    local a = 1
    lib996:showformwithcontent(actor, "", "shouchong.updateUI("..a..")")
end
GameEvent.add(EventCfg.onRecharge,  _playerrecharge, ShouChong)  --充值

