lib996:include("Script/serialize.lua")

local filename = "采集表单"

local _int_var_name = {
    VarCfg.SSJ_caiji_num,               --今日采集次数变量名
    VarCfg.SSJ_yabiao_num1,             --今日押镖次数变量名
    VarCfg.SSJ_yabiao_num2,             --今日劫镖次数变量名
}

--打开活动面板
local _login_data = {0,0,0}
function RequestOpenWnd(actor)
    print("打开活动面板")
    for i, varName in ipairs(_int_var_name) do
        _login_data[i] = lib996:getint(0,actor, varName)
    end
    lib996:showformwithcontent(actor,"F/活动面板", "ActivitySystem#"..serialize(_login_data))
end