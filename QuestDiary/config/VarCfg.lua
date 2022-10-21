VarCfg = {}

--引擎G变量

--引擎A变量

--引擎U变量
VarCfg.U_create_actor_time                  = "U0"                --创建角色时间戳
VarCfg.U_create_actor_openday               = "U1"                --创建角色时已开服的天数
VarCfg.U_real_recharge                      = "U2"                --总充值金额
VarCfg.U_today_real_recharge                = "U3"                --今日充值金额


--引擎T变量
VarCfg.T_daily_date                         = "T1"                --格式 20211103 年月日，  每日凌晨更新，如果凌晨不在线每日第一次登陆更新

--引擎变量 S

--临时自定义变量
VarCfg.Die_Flag                         = "N$B死掉了"               --死亡触发之前处理 0 没死 1死掉了
VarCfg.Die_Drop_item                    = "S$B死亡掉装备"           --死亡爆出的装备
VarCfg.Recharge_Temp                    = "S$B充值记录"             --充值临时记录

--自定义个人变量
VarCfg.SSJ_caiji_num                    = "SSJ_caiji_num"           --今日采集次数
VarCfg.SSJ_yabiao_num1                  = "SSJ_yabiao_num1"         --今日押镖次数
VarCfg.SSJ_yabiao_num2                  = "SSJ_yabiao_num2"         --今日劫镖次数

VarCfg.S_cur_mapid                      = "SSJ_cur_mapid"           --当前所在地图id，切换地图时候获取上一次的地图id
VarCfg.C_QsQVIP                         = "C_QsQVIP"                --vip等级

--引擎N变量
VarCfg.N_cur_level                      = "N$A_当前等级"             --当前等级(为了升级触发获取到上一次是多少级)



return VarCfg