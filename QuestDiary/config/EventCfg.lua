EventCfg = {}


--引擎事件
EventCfg.onNewHuman                 = "onNewHuman"                    --新角色第一次登录    (参数：actor)
EventCfg.onLogin                    = "onLogin"                       --登录    (参数：actor)
EventCfg.onLoginAttr                = "onLoginAttr"                   --登录附加属性    (参数：actor, 登录属性数据)
EventCfg.onLoginEnd                 = "onLoginEnd"                    --登录完成    (参数：actor, 登录同步数据)
EventCfg.onKillMon                  = "onKillMon"                     --任意地图杀怪    (参数：actor, 死亡怪物对象, 死亡怪物idx)
EventCfg.onkillplay                 = "onkillplay"                    --任意地图杀人
EventCfg.onPlayLevelUp              = "onPlayLevelUp"                 --玩家升级    (参数：actor, 当前等级, 之前等级)
EventCfg.onTakeOnEx                 = "onTakeOnEx"                    --穿装备goPlayerVar
EventCfg.onTakeOffEx                = "onTakeOffEx"                   --脱装备
EventCfg.onAddBag                   = "onAddBag"                      --物品进背包
EventCfg.onExitGame                 = "onExitGame"                    --小退或大退游戏
EventCfg.onTriggerChat              = "onTriggerChat"                 --聊天栏输入信息
EventCfg.onClicknpc                 = "onClicknpc"                    --点击某NPC
EventCfg.onRechargeBefore           = "onRechargeBefore"              --充值前触发,修改实充用(参数：actor, 充值rmb金额, 产品ID（保留）, 货币ID)
EventCfg.onRecharge                 = "onRecharge"                    --充值     (参数：actor, 充值rmb金额, 产品ID（保留）, 货币ID)
EventCfg.goEnterMap                 = "goEnterMap"                    --进入地图
EventCfg.goSwitchMap                = "goSwitchMap"                   --切换地图
EventCfg.onPostDie                  = "onPostDie"                     --角色死亡后触发    (参数：actor被击杀者对象,hiter杀人者对象)
EventCfg.goBill                     = "goBill"                        --充值相关(月卡功能用来扣除灵符并阻止累计充值)
EventCfg.onMove                     = "onMove"                        --移动触发 (参数：actor, 0跑/1走)
EventCfg.onLoserCar                 = "onLoserCar"                    --丢失镖车触发    (参数：actor, 镖车对象, 镖车idx)
EventCfg.onKillCar                  = "onKillCar"                     --击杀镖车触发    (参数：actor, 镖车对象, 镖车idx)

--游戏事件
EventCfg.goDeclareVar               = "goDeclareVar"                  --声明全局变量
EventCfg.goPlayerVar                = "goPlayerVar"                   --声明个人变量    (参数：actor)
EventCfg.goZSLevelChange            = "goZSLevelChange"               --转生等级发生变化 (参数：actor, 当前转生等级， 之前的转生等级)
EventCfg.goBeforedawn               = "goBeforedawn"                  --机器人脚本每日凌晨触发  (参数：actor, 凌晨同步数据)
EventCfg.roBeforedawn               = "roBeforedawn"                  --机器人脚本每日凌晨触发 (已开服天数)
EventCfg.goDailyUpdate              = "goDailyUpdate"                 --每日更新(凌晨或每日第一次登录)(参数：actor, 是否每日第一次登录, 同步数据)
EventCfg.goCheckModule              = "goCheckModule"                 --检查是否有模块达到开启要求
EventCfg.goOpenModule               = "goOpenModule"                  --某模块达到开启要求(参数：actor, 模块ID)
EventCfg.goSetGem                   = "goSetGem"                      --镶嵌宝石(参数：actor)
EventCfg.goBaoWu                    = "goBaoWu"                       --宝物升级(参数：actor)
EventCfg.goNiTian                   = "goNiTian"                      --逆天改命升级(参数：actor)
EventCfg.goShenShou                 = "goShenShou"                    --神兽升级(参数：actor)
EventCfg.goKuangBao                 = "goKuangBao"                    --开启狂暴(参数：actor)
EventCfg.goPickUpItemEx             = "goPickUpItemEx"                --拾取物品后触发(参数：actor, item，--等待支持num)
EventCfg.goCastlewarend             = "goCastlewarend"                --攻城结束时触发
EventCfg.gocastlewarstart           = "gocastlewarstart"              --攻城开始时触发
EventCfg.gomapeventwalk             = "gomapeventwalk"                --沙巴克进皇宫走步触发
EventCfg.goActivityState            = "goActivityState"               --活动开启或关闭展示红点(参数 活动idx,活动state)

EventCfg.goActivityMap              = "goActivityMap"                 --进入活动地图触发(清除任务栏的信息)
EventCfg.goBackMap                  = "goBackMap"                     --离开活动地图触发(刷新任务栏的信息)

EventCfg.goVIPlvelup                = "goVIPlvelup"                   --升级vip时触发触发(参数：1actor, 2viplevel)
EventCfg.goADDFashion               = "goADDFashion"                  --添加上自定义时装触发

EventCfg.goRongHe                   = "goRongHe"                    --装备融合(参数：actor)
EventCfg.goJinJie                   = "goJinJie"                    --装备进阶(参数：actor)
EventCfg.goJHMW                     = "goJHMW"                      --江湖名望/vip进阶(参数：actor)
EventCfg.goHecheng1                 = "goHecheng1"                  --复活合成
EventCfg.goHecheng2                 = "goHecheng2"                  --麻痹合成

EventCfg.goQuickAccess              = "goQuickAccess"               --打开材料引导面板(itemidx)

EventCfg.goBill                     = "goBill"                      --充值相关(月卡功能用来扣除灵符并阻止累计充值)

EventCfg.dingdai                     = "dingdai"                      --充值相关(月卡功能用来扣除灵符并阻止累计充值)

return EventCfg