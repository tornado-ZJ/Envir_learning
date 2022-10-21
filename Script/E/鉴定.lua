lib996:include("Script/serialize.lua")
--local cfg_zhuansheng = require_ex("Envir/QuestDiary/cfgcsv/cfg_zhuansheng")

--0,1,2,3  --这4组为鉴定组 方便单条属性 操作

local type_tab = {0,1,2,3}  --该组定义为 鉴定组

    --属性 生命值 生命万分比 魔法 魔法万分比 攻击下限  攻击下限万分比
    --属性 为下限时  同时加等额上限
    --1.属性id 2.随机最小属性 3.随机最大属性
local jd_tab = {
    {1,100,800},
    {2,100,800},
    {3,100,800},
    {4,100,800},
    {5,100,800},
    {7,100,800}
                }

function jdopen(actor,npcid)

    lib996:showformwithcontent(actor, "A/鉴定", "QSQ_JianDing")
end


function identify(actor,btn)
    btn=tonumber(btn)


    -- if huoqu then
    --     lib996:delitemattr(actor,actname,8,0)
    -- end
    -- print("1111111111")


    local item =lib996:linkbodyitem(actor, btn)                     --获取位置装备
    if item ~= "0" then                                             --装备存在时
        local makeid = lib996:getiteminfo(actor,item,1)             --获取makeindex（唯一id）
        local type0_attr = lib996:getitemattr(actor,makeid,type_tab[1])    --根据定义组获取 属性 用于判断 该装备是否被鉴定过
        if type0_attr ~= "" then
            lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#ff0000\'>该装备已经被鉴定过了</font>","Type":9}')
            return
        end
        print("111111",type0_attr)
        -- -- -------------此处写 消耗材料判断

        -- -- -------------此处写 扣除材料

        -- local a = math.random(1,100)    --根据概率 随机多少条属性
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

        -- if tiao ~= 0 then   ---在属性表中 循环随机抽取属性
        --     for i=1,tiao do

        --         local v = math.random(1,#jd_tab)    --第几条
        --         local att_id = jd_tab[v][1]         --从属性条中提取属性 id

        --         local att_value = math.random(jd_tab[v][2],jd_tab[v][3]) --随机出属性值 
        --         att_tab[i] = att_tab[i] or {}
        --         att_tab[i][1] = att_tab[i][1] or {}
        --         att_tab[i][1][1] = att_id
        --         att_tab[i][1][2] = att_value

        --         if att_id == 5 or att_id == 7 then              --有上限的属性 同时等额加上
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












