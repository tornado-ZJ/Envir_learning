lib996:include("Script/serialize.lua")

local filename = "�ɼ���"

local _int_var_name = {
    VarCfg.SSJ_caiji_num,               --���ղɼ�����������
    VarCfg.SSJ_yabiao_num1,             --����Ѻ�ڴ���������
    VarCfg.SSJ_yabiao_num2,             --���ս��ڴ���������
}

--�򿪻���
local _login_data = {0,0,0}
function RequestOpenWnd(actor)
    print("�򿪻���")
    for i, varName in ipairs(_int_var_name) do
        _login_data[i] = lib996:getint(0,actor, varName)
    end
    lib996:showformwithcontent(actor,"F/����", "ActivitySystem#"..serialize(_login_data))
end