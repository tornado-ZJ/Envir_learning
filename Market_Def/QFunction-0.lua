
-- QF入口文件 当m2启动时候就会加载
math.randomseed(tostring(os.time()):reverse():sub(1, 7))

function require_ex(module)
    if package.loaded[module] then
        return package.loaded[module]
    end

    for pattern in string.gmatch(package.path, '[^;]+%?[^;]+') do
        local path = string.gsub(pattern, '%?', module)
        local fp = loadfile(path)
        if fp then
            local ret = fp()
            if ret ~= nil then
                package.loaded[module] = ret
            else
                package.loaded[module] = true
            end
            return package.loaded[module]
        end
    end
end

local _,errinfo = pcall(function ()
    require_ex("Envir/Extension/LuaLibrary/string")
    require_ex("Envir/Extension/LuaLibrary/table")

    require_ex("Envir/QuestDiary/config/VarCfg")
    require_ex("Envir/QuestDiary/config/EventCfg")

    require_ex("Envir/QuestDiary/util/GameEvent")
    require_ex("Envir/QuestDiary/game/Global")
    require_ex("Envir/QuestDiary/game/GM")
    require_ex("Envir/QuestDiary/game/ItemUse")

    require_ex("Envir/Script/serialize")
    require_ex("Envir/Script/A/init")
    require_ex("Envir/Script/B/init")
    require_ex("Envir/Script/C/init")
    require_ex("Envir/Script/D/init")
    require_ex("Envir/Script/E/init")
    require_ex("Envir/Script/F/init")
    require_ex("Envir/Script/G/init")
end)
if errinfo then lib996:release_print("初始化QFunction-0.lua", errinfo) end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---------------------------------QManage.lua------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--引擎启动
function startup()
    lib996:release_print("startup")
    GameEvent.push(EventCfg.goDeclareVar, "")
end

--登录
function login(actor)

    local isnewhuman = lib996:getbaseinfo(actor, 47)

    local level = lib996:getbaseinfo(actor, 6)
    lib996:setint(0,actor, VarCfg.N_cur_level, level)
    --个人变量声明
    GameEvent.push(EventCfg.goPlayerVar, actor)
    --liangong(actor)   --练功师测试变量
    --第一次登录
    if isnewhuman then GameEvent.push(EventCfg.onNewHuman, actor) end
    --登录
    GameEvent.push(EventCfg.onLogin, actor)
    --登录附加属性
    local loginattrs = {}
    GameEvent.push(EventCfg.onLoginAttr, actor, loginattrs)
    QsQupdateAddr(actor, loginattrs)
    --登录完成
    local logindatas = {}
    -- print("进入派发前",#logindatas)
    GameEvent.push(EventCfg.onLoginEnd, actor, logindatas)
    -- print("进入派发后",#logindatas)
end

--行会初始化
function loadguild(actor) --玩家actor
end

function liangong(actor)
    lib996:iniplayvar(actor, "string", "HUMAN", "C_QsQliangong")
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---------------------------------QFunction.lua----------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


--跑步
function run(actor)
    GameEvent.push(EventCfg.onMove, actor, 0)
end

--走路
function walk(actor)
    GameEvent.push(EventCfg.onMove, actor, 0)
end

--属性变化
function sendability(actor)

end


--NPC点击触发
function clicknpc(actor, npcid)
    GameEvent.push(EventCfg.onClicknpc, actor, npcid)
end

--每天第一次登录
function setday(actor)

end


--聊天
--sMsg      聊天内容
--chat      聊天频道（1;系统 2;喊话 3;私聊 4;行会 5;组队 6;附近 7;世界）
--返回 true 发送聊天信息失败
function triggerchat(actor, sMsg, chat)
    GameEvent.push(EventCfg.onTriggerChat, actor, sMsg, chat)
end


--监听
function handlerequest(actor, msgid, arg1, arg2, arg3, sMsg)
end

--升级
function playlevelup(actor)

end


--人物死亡之前
function nextdie(actor)
end


--人物死亡
--hiter     杀人者对象
function playdie(actor, hiter)
    GameEvent.push(EventCfg.onPostDie, actor, hiter)
end


--杀死人物时触发
--actor		触发对象
--play		被杀玩家
function killplay(actor, play)
    GameEvent.push(EventCfg.onkillplay, actor, play)
end


--人物复活
function revival(actor)

end


--人物小退触发
function playreconnection(actor)
    GameEvent.push(EventCfg.onExitGame, actor)
end

--人物大退与关闭客户端触发
function playoffline(actor)
    FBackZone(actor)--回城
    GameEvent.push(EventCfg.onExitGame, actor)
end

--物品进背包
function addbag(actor, itemobj)
    if not actor then return end
    GameEvent.push(EventCfg.onAddBag, actor, itemobj)
end

--充值
--gold  充值rmb金额
--productid  商品ID(前端调起充值时候传递的参数) --无用参数可忽略
--moneyid  充值获得货币ID
function recharge(actor, gold, productid, moneyid)
    --累计充值
    local bill_num = lib996:getint(0,actor, VarCfg.U_real_recharge)
    lib996:setint(0,actor, VarCfg.U_real_recharge, bill_num + gold)

    --今日充值
    local day_bill_num = lib996:getint(0,actor, VarCfg.U_today_real_recharge)
    lib996:setint(0,actor, VarCfg.U_today_real_recharge, day_bill_num + gold)

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFFF00\'>充值'..bill_num..'元,累计充值'..lib996:getint(0,actor, VarCfg.U_real_recharge)..'元</font>","Type":9}')

    GameEvent.push(EventCfg.onRecharge, actor, gold, productid, moneyid)
end

--攻击前
--Target	object	受击对象
--Hiter	    object	攻击对象
--MagicId	int	    技能ID
--Damage	int	    伤害
--result	int	    返回值，修改后的伤害
function attackdamage(actor, Target, Hiter, MagicId, Damage)
    -- LOGPrint("SH="..Damage)
    -- LOGWrite("SH="..Damage)

    return Damage
end

--攻击后
--self	    object	玩家对象
--Target	object	受击对象
--Hiter	    object	攻击对象
--MagicId	int	   	技能ID
function attack(self, Target, Hiter, MagicId)

end

--受击前
--self	    object  玩家对象
--Hiter	    object	攻击对象
--Target	object	受击对象
--MagicId	int	    技能ID
--Damage
function struckdamage(self, Hiter, Target, MagicId, Damage)
    return Damage
end

--受击后
--self	    object	玩家对象
--Target	object	受击对象
--Hiter	    object	攻击对象
--MagicId	int	   	技能ID
function struck(self, Target, Hiter, MagicId)

end

--爆身上装备触发
function dropuseitemsbefore(actor)

end

--爆背包装备触发
function dropbagitemsbefore(actor)
    
end

--攻城开始触发
function castlewarstart()
    lib996:sendmsg(nil, 2, '{"Msg":"沙城争霸活动已开启！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"30"}')
    lib996:sendmsg(nil, 2, '{"Msg":"沙城争霸活动已开启！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"60"}')
    lib996:sendmsg(nil, 2, '{"Msg":"沙城争霸活动已开启！！！","FColor":249,"BColor":0,"Type":5,"Time":3,"SendName":"xxx","SendId":"123","Y":"90"}')
    GameEvent.push(EventCfg.gocastlewarstart)
end

--攻城结束触发
function castlewarend()
    lib996:setontimerex(24, 2)
end

--占领沙巴克触发
function getcastle0()
    print("占领沙巴克触发")
end

--玩家改名后
function changehumnameok(actor)

end

--刷怪通知
function makemonnotice(mon)

end

--人物脱装备---
function takeoffex(actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onProTakeOff, actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onTakeOffEx, actor, itemobj, where, itemname, makeid)
end
--人物穿装备----
function takeonex(actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onProTakeOn, actor, itemobj, where, itemname, makeid)
    GameEvent.push(EventCfg.onTakeOnEx, actor, itemobj, where, itemname, makeid)
end

--任意地图杀死怪物
function killmon(actor, monobj)
    local monidx = lib996:getbaseinfo(monobj, ConstCfg.gbase.idx)
    GameEvent.push(EventCfg.onKillMon, actor, monobj, monidx)
end

--切换地图
function entermap(actor)
    local former_mapid = lib996:getstr(0,actor, VarCfg.S_cur_mapid)
    local cur_mapid = lib996:getbaseinfo(actor, ConstCfg.gbase.mapid)
    cur_mapid = tostring(cur_mapid)
    if cur_mapid ~= former_mapid then       --切换了地图
        lib996:setstr(0,actor, VarCfg.S_cur_mapid,cur_mapid)
        GameEvent.push(EventCfg.goSwitchMap, actor, cur_mapid, former_mapid)
    else
        GameEvent.push(EventCfg.goEnterMap, actor, cur_mapid)
    end
end

--离开地图
function leavemap(actor)

end

function getexp()

end

function picktask()

end
function changetask()

end

function deletetask()

end

function findpathend()
    
end




local money = {
    gold                = 1,    --金币
    yb                  = 2,    --元宝
    bdgold              = 3,    --绑定金币
    bdyb                = 4,    --绑定元宝
    mzb                 = 5,    --名著币
    jingyan             = 6,    --经验
    lf                  = 7,    --灵符
    paodian             = 8,     --泡点
    ryz                 = 9,     --荣誉值
    cent                = 11,   --充值点 1rmb = 1充值点
    rmb                 = 12,   --rmb
    czje                = 20,   --充值金额
    zscz                = 21,   --真实充值
    mrcz                = 22,   --每日充值
    baolv               = 23,   --爆率
    beigong             = 24,   --倍攻
    ddqg                = 25,   --刀刀切割
}

--货币改变触发
function moneychangeex(actor,id)
    --print("货币改变：",id)
end

function titlechangeex(actor, id)
    print("称号改变",id)
end
--for _,moneyidx in pairs(money) do
--    _G["moneychange"..moneyidx] = function (actor)
--        local curnum = lib996:querymoney(actor, moneyidx)
--        local name = lib996:getstditeminfo(moneyidx, 1)
--        print("货币【"..name.."】改变：", moneyidx, curnum)
--    end
--end

function on_burst(attack,ack)    --暴击流程--attack是攻击者
    local burst = lib996:attr(attack,29)       --暴击概率
    local burst_dam = lib996:attr(attack,30)  --暴击伤害

    local cc = 0            --未暴击 返回0 暴击则把暴击额外伤害返回 
    if burst > 0 then
        local bu = math.random(1,10000)
        if bu <= burst then --本次暴击
            cc = (ack*(1+(burst_dam*0.0001)))//1
            ack = ack + cc
        end
    end
    return ack,cc
end

function on_ref_att(role,hp,attack)    --物理反伤流程--role是受击者 hp在没有反伤时为0  负数扣血 正数加血
    local ref = lib996:attr(role,37)
    local bref = lib996:attr(role,38)
    local pref = lib996:attr(role,39)

    local cc = 0
    local bu = 0

    if pref == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pref then
            bu = 1
        end
    end

    if bu == 1 then
        if ref > 0 then
            cc = ref
        end
        if bref > 0 then
            cc = cc - ((bref*hp*0.0001)//1)
        end
        lib996:humanhp(attack,"-",cc,1)
    end
    return cc
end

function on_ref_mag(role,hp,attack)    --魔法反伤流程--role是受击者
    local ref = lib996:attr(role,40)
    local bref = lib996:attr(role,41)
    local pref = lib996:attr(role,42)
    local cc = 0
    local bu = 0

    if pref == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pref then
            bu = 1
        end
    end

    if bu == 1 then
        if ref > 0 then
            cc = ref
        end
        if bref > 0 then
            cc = cc - ((bref*hp*0.0001)//1)
        end
        lib996:humanhp(attack,"-",cc,1)
    end
    return  cc
end

function on_imm_att(role,hp)    --物理免伤流程--
    local imm = lib996:attr(role,31)      --免伤固定值
    local bimm = lib996:attr(role,32)     --免伤百分比
    local pimm = lib996:attr(role,33)     --免伤几率 0时则100% 减免

    local cc = 0                            --免除了多少伤害
    local bu = 0                            --是否走免伤计算

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --减伤计算
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc - ((bimm*hp*0.0001)//1)
        end
        hp = hp + cc
    end
    return hp,cc
end

function on_imm_mag(role,hp)    --魔法免伤流程--
    local imm = lib996:attr(role,34)      --免伤固定值
    local bimm = lib996:attr(role,35)     --免伤百分比
    local pimm = lib996:attr(role,36)     --免伤几率 0时则100% 减免
    local cc = 0                            --免除了多少伤害
    local bu = 0                            --是否走免伤计算

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --减伤计算
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc - ((bimm*hp*0.0001)//1)
        end
        hp = hp + cc
    end
    return hp,cc
end

function on_ign_att(attack,def)    --物理穿透流程--
    local imm = lib996:attr(attack,43)
    local bimm = lib996:attr(attack,44)
    local pimm = lib996:attr(attack,45)

    local cc = 0
    local bu = 0

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --防御值最低为0 玩的花的随意
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc + ((bimm*def*0.0001)//1)
        end
        def = def - cc
        if def < 0 then
            def = 0
        end
    end
    return def,cc
end

function on_ign_mag(attack,def)    --魔法穿透流程--
    local imm = lib996:attr(attack,46)
    local bimm = lib996:attr(attack,47)
    local pimm = lib996:attr(attack,48)
    local cc = 0
    local bu = 0

    if pimm == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= pimm then
            bu = 1
        end
    end

    if bu == 1 then     --防御值最低为0
        if imm > 0 then
            cc = imm
        end
        if bimm > 0 then
            cc = cc + ((bimm*def*0.0001)//1)
        end
        def = def - cc
        if def < 0 then
            def = 0
        end
    end
    return def,cc
end

function on_suck_hp(attack,hp)    --吸血流程--
    local suck = lib996:attr(attack,49)
    local bsuck = lib996:attr(attack,50)
    local psuck = lib996:attr(attack,51)

    local cc = 0
    local bu = 0

    if psuck == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= psuck then
            bu = 1
        end
    end

    if bu == 1 then     --防御值最低为0
        if suck > 0 then
            cc = suck
        end
        if bsuck > 0 then
            cc = cc - ((bsuck*hp*0.0001)//1)
        end
        lib996:humanhp(attack,"+",cc,4)
    end
    return cc
end

function on_suck_mp(attack,hp,role)    --吸蓝流程--
    local suck = lib996:attr(attack,52)
    local bsuck = lib996:attr(attack,53)
    local psuck = lib996:attr(attack,54)
    local cc = 0
    local bu = 0

    if psuck == 0 then
        bu = 1
    else
        local sj = math.random(1,10000)
        if sj <= psuck then
            bu = 1
        end
    end

    if bu == 1 then
        if suck > 0 then
            cc = suck
        end
        if bsuck > 0 then
            cc = cc - ((bsuck*hp*0.0001)//1)
        end
        lib996:humanmp(role,"-",cc)
        lib996:humanmp(attack,"+",cc)
    end
    return cc
end

function on_dcr(attack,hp)    --倍攻流程--
    local dcr = lib996:attr(attack,56)
    local cc = 0

    if dcr > 0 then
        cc = cc + ((dcr*hp*0.0001)//1)
        hp = hp + cc
    end
    return hp,cc
end

function on_critical(attack,hp)    --会心一击流程
    local critical = lib996:attr(attack,200)

    local cc = 0
    if critical > 0 then
        local bu = math.random(1,10000)
        if bu <= critical then
            cc = hp*10
            hp = cc
        end
    end
    return hp,cc
end

function on_soul(attack,hp)    --噬魂流程
    local soul = lib996:attr(attack,201)


    local cc = 0
    if soul > 0 then
        cc = soul
        hp = hp - cc
    end
    return hp,cc
end

function on_blessed(role)    --神佑流程
    local blessed = lib996:attr(role,202)
    local sj = math.random(1,10000)
    local cc = 0
    if sj <= blessed then
        local maxhp = lib996:getbaseinfo(role,12)
        local dqhp = lib996:getbaseinfo(role,11)
        cc = (maxhp - dqhp)*0.5
        lib996:humanhp(role,"+",cc,4)
    end
    return cc
end

function on_def(role,hp)    --绝对防御流程
    local def = lib996:attr(role,202)
    local sj = math.random(1,10000)

    if sj <= def then
        hp = -1
    end
    return hp
end



--受伤前触发 虽然5.3支持双浮点 但是 不要玩的太变态了 数值会爆的 
function on_hurt_pre(attack,role,ack,def,skillid,hurttype)
    local hp = 0 -- 负数为扣血 正数为加血
    if lib996:getbaseinfo(attack,-1) then       --人物攻击
        if hurttype == 0 then           --根据伤害类型 计算穿透
            def = on_ign_att(attack,def)
        else
            def = on_ign_mag(attack,def)
        end

        ack = on_burst(attack,ack)      --攻击力暴击

        hp = def - ack                  --根据攻防计算初步伤害
    end
    if lib996:getbaseinfo(role,-1) then --计算反伤 人物受击伤害反弹与减免
        if hurttype == 0 then
            on_ref_att(role,hp,attack)
        else
            on_ref_mag(role,hp,attack)
        end

        if hurttype == 0 then           --根据伤害类型 计算 受击者 减伤
            hp = on_imm_att(role,hp)
        else
            hp = on_imm_mag(role,hp)
        end
    end
    if lib996:getbaseinfo(attack,-1) then      --人物攻击最终伤害计算
        hp = on_dcr(attack,hp)
        -----会心一击
        hp = on_critical(attack,hp)
        -----神佑
        if lib996:getbaseinfo(role,-1) then
            hp = on_def(role,hp)            --绝对防御
        end

        on_suck_hp(attack,hp)               --吸血
        on_suck_mp(attack,hp,role)          --吸蓝

        if not lib996:getbaseinfo(role,-1) then    --怪物时
            hp = on_soul(attack,hp)             --噬魂 不会额外记入吸血
        end
    end
    if not lib996:getbaseinfo(attack,-1) then    --怪物时攻击
        if lib996:getbaseinfo(attack,-1) then     --人物受击 
            on_blessed(role)                --神佑流程
        end
    end

    return hp
end



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
---------------------------------RobotManage.lua--------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function beforedawn()
    local t = lib996:getplayerlst()
    for _,actor in ipairs(t) do
        local beforedawndatas = {}
        GameEvent.push(EventCfg.onBeforedawn, actor, beforedawndatas)
    end
    local openday = lib996:grobalinfo(1)
    GameEvent.push(EventCfg.roBeforedawn, nil, openday)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
----------------------------------------定时器-----------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

--练功师伤害
function ontimer1(actor)
    local lg = "C_QsQliangong"
    local lg_tab = lib996:getplayvar(actor,lg)
    lg_tab = unserialize(lg_tab)
    local zs = lg_tab[1]
    local dps = lg_tab[1]*0.2
    local cs = lg_tab[2]
    local js = lg_tab[1]//lg_tab[2]

    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFA500\'>-----5秒内伤害统计-----</font>","Type":1}')
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFA500\'>总伤害：'..zs..'</font>","Type":1}')
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFA500\'>DPS：'..dps..'</font>","Type":1}')
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFA500\'>次数：'..cs..'</font>","Type":1}')
    lib996:sendmsg(actor, 1, '{"Msg":"<font color=\'#FFA500\'>均伤：'..js..'</font>","Type":1}')

    lib996:setplayvar(actor, "HUMAN",lg,nil,1)
    lib996:setflagstatus(actor,100,0)
end

--押镖定时器
function ontimer20002(actor)
    callfileex("Envir/Script/F/押镖表单:countdown","")
end
----------------------------------------系统定时器-----------------------------------

function ontimerex21()
    callfileex("Envir/Script/F/勇闯魔域表单:countdown","")
end
function ontimerex22()
    callfileex("Envir/Script/F/大乱斗表单:countdown","")
end

--攻城结束延时触发
function ontimerex24()
    GameEvent.push(EventCfg.goCastlewarend)
    lib996:setofftimerex(24)
end