lib996:include("Script/serialize.lua")
--local cfg_zhuansheng = require_ex("Envir/QuestDiary/cfgcsv/cfg_zhuansheng")

--0,1,2,3  --��4��Ϊ������ ���㵥������ ����

local type_tab = {0,1,2,3}  --���鶨��Ϊ ������

    --���� ����ֵ ������ֱ� ħ�� ħ����ֱ� ��������  ����������ֱ�
    --���� Ϊ����ʱ  ͬʱ�ӵȶ�����
    --1.����id 2.�����С���� 3.����������
local jd_tab = {
    {1,100,800},
    {2,100,800},
    {3,100,800},
    {4,100,800},
    {5,100,800},
    {7,100,800}
                }

function jdopen(actor,npcid)

    lib996:showformwithcontent(actor, "A/����", "QSQ_JianDing")
end


function identify(actor,btn)
    btn=tonumber(btn)


    -- if huoqu then
    --     lib996:delitemattr(actor,actname,8,0)
    -- end
    -- print("1111111111")


    local item =lib996:linkbodyitem(actor, btn)                     --��ȡλ��װ��
    if item ~= "0" then                                             --װ������ʱ
        local makeid = lib996:getiteminfo(actor,item,1)             --��ȡmakeindex��Ψһid��
        local type0_attr = lib996:getitemattr(actor,makeid,type_tab[1])    --���ݶ������ȡ ���� �����ж� ��װ���Ƿ񱻼�����
        if type0_attr ~= "" then
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>��װ���Ѿ�����������</font>","Type":9}')
            return
        end
        print("111111",type0_attr)
        -- -- -------------�˴�д ���Ĳ����ж�

        -- -- -------------�˴�д �۳�����

        -- local a = math.random(1,100)    --���ݸ��� �������������
        -- local tiao = 0
        -- if a <= 60 then
        --     tiao = 1
        -- elseif a >60 and a <=90 then
        --     tiao = 2
        -- elseif a >90 and a <=95 then
        --     tiao = 3
        -- elseif a >95 and a <=100 then
        --     tiao = 4
        -- end

        -- local att_tab = {}

        -- if tiao ~= 0 then   ---�����Ա��� ѭ�������ȡ����
        --     for i=1,tiao do

        --         local v = math.random(1,#jd_tab)    --�ڼ���
        --         local att_id = jd_tab[v][1]         --������������ȡ���� id

        --         local att_value = math.random(jd_tab[v][2],jd_tab[v][3]) --���������ֵ 
        --         att_tab[i] = att_tab[i] or {}
        --         att_tab[i][1] = att_tab[i][1] or {}
        --         att_tab[i][1][1] = att_id
        --         att_tab[i][1][2] = att_value

        --         if att_id == 5 or att_id == 7 then              --�����޵����� ͬʱ�ȶ����
        --             att_tab[i][2] = att_tab[i][2] or {}
        --             att_tab[i][2][1] = att_id + 1
        --             att_tab[i][2][2] = att_value
        --         end
        --     end
        -- end

        -- for i=1,#att_tab do
        --     local z = type_tab[i]
        --     local tab = att_tab[i]
        --     for k, v in ipairs(tab) do
        --         lib996:additemattr(actor, makeid, z, v[1], v[2])
        --     end
        -- end
        -- lib996:showformwithcontent(actor, "", "JianDing.updateUI("..btn..")")
    end
end












