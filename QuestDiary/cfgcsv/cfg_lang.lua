local config = {
	[1] = {
		Msg = "角色50级免费激活光翼，属性大幅提升",
		Remarks = "主角翅膀界面激活时的文字描述",
	},
	[2] = {
		Msg = "行会的老铁们：<br>1、每天15：00行会首领，装备道具掉不停<br>2、兄弟们努力冲级搞装备，第3天我们一起拿沙！",
		Remarks = "默认行会公告",
	},
	[3] = {
		Msg = "创建英雄后免费激活英雄光翼，属性大幅提升",
		Remarks = "英雄翅膀界面激活时的文字描述",
	},
	[6] = {
		Msg = "<font color='0xfcd132'>参与挑战遗迹BOSS有概率获得</font> <font color='0xe27d07'>传世装备</font>",
		Remarks = "BOSS界面文字描述",
	},
	[7] = {
		Msg = "<font color='0xfcd132'>参与挑战秘境BOSS有概率获得</font> <font color='0xe27d07'>传世宝钻</font>",
		Remarks = "BOSS界面文字描述",
	},
	[9] = {
		Msg = "关卡进度满后才可挑战，杀怪增加关卡进度",
		Remarks = "小怪击杀波数不足无法挑战BOSS",
	},
	[16] = {
		Msg = "排名越高，获得<font color='0x02afe8'>更多</font>的传世宝钻和橙装，有<font color='0x02afe8'>更高概率</font>获得传世装备",
		Remarks = "遗迹boss排名奖励描述",
	},
	[17] = {
		Msg = "1、首个对BOSS造成伤害的玩家可以获得归属<br>2、当归属的玩家被其他玩家击败，移交归属权<br>3、BOSS死亡时最终归属的玩家获得归属奖励",
		Remarks = "遗迹BOSS归属者奖励",
	},
	[18] = {
		Msg = "1、首个对BOSS造成伤害的玩家可以获得归属<br>2、当归属的玩家被其他玩家击败，移交归属权<br>3、BOSS死亡时最终归属的玩家获得归属奖励",
		Remarks = "秘境BOSS归属者奖励",
	},
	[20] = {
		Msg = "尚未获得技能",
	},
	[21] = {
		Msg = "获得通关奖励",
		Remarks = "通关面板奖励描述",
	},
	[22] = {
		Msg = "获得 归属者 奖励",
		Remarks = "通关面板奖励描述",
	},
	[23] = {
		Msg = "获得 最后一击 奖励",
		Remarks = "通关面板奖励描述",
	},
	[24] = {
		Msg = "获得 参与者 奖励",
		Remarks = "通关面板奖励描述",
	},
	[25] = {
		Msg = "获得 伤害第<font color='0x01f801'>{0}</font>名 奖励",
		Remarks = "通关面板奖励描述",
	},
	[41] = {
		Msg = "您已累计在线超过<font color='0xe70909'>1</font>小时，请注意适度休息，健康游戏！",
		Remarks = "防沉迷提示",
	},
	[42] = {
		Msg = "您已累计在线超过<font color='0xe70909'>2</font>小时，即将处于游戏收益减半状态，请注意适度休息，健康游戏！",
		Remarks = "防沉迷提示",
	},
	[43] = {
		Msg = "您已累计在线超过<font color='0xe70909'>3</font>小时，已经处于<font color='0xe70909'>游戏收益减半</font>状态，请注意适度休息，健康游戏！",
		Remarks = "防沉迷提示",
	},
	[44] = {
		Msg = "您已累计在线超过<font color='0xe70909'>4</font>小时，已经处于<font color='0xe70909'>游戏收益减半</font>状态，请注意适度休息，健康游戏！",
		Remarks = "防沉迷提示",
	},
	[45] = {
		Msg = "您已累计在线超过<font color='0xe70909'>5</font>小时，已经处于不健康游戏时间，<font color='0xe70909'>游戏收益变为0</font>，请下线休息！",
		Remarks = "防沉迷提示",
	},
	[46] = {
		Msg = "1、<font color='0x01f801'>青铜特权礼包</font><br>2、<font color='0x01f801'>对怪伤害增加50</font><br>3、<font color='0x01f801'>专属称号</font><br>4、<font color='0x01f801'>专属折扣礼包</font><br>5、<font color='0x01f801'>特权专属BOSS</font><br>6、<font color='0x01f801'>回收加成5%</font><br>",
		Remarks = "青铜特权说明",
	},
	[47] = {
		Msg = "根据法规要求，请您完善实名信息再进行发言（完善后请重新登录游戏）",
		Remarks = "聊天实名提示",
	},
	[50] = {
		Msg = "攻击怪物时有几率触发神力特效，对怪物伤害加成增加<font color='0x01f801'>10%</font>，持续5秒",
	},
	[51] = {
		Msg = "被怪物攻击时有几率触发神戒护体，受怪物伤害减免<font color='0x01f801'>10%</font>，持续5秒",
	},
	[52] = {
		Msg = "受到致命伤害时有<font color='0x01f801'>10%</font>的概率立即回复<font color='0x01f801'>30%</font>的最大生命，每场战斗可触发1次",
	},
	[53] = {
		Msg = "战斗中有概率麻痹目标，使目标无法攻击或移动，持续<font color='0x01f801'>2</font>秒",
	},
	[55] = {
		Msg = "不自量力",
	},
	[56] = {
		Msg = "勇者出现之地",
	},
	[57] = {
		Msg = "玛法大陆重镇",
	},
	[58] = {
		Msg = "1、攻击威望低于自身玩家<font color='0x01f801'>+7%</font>威慑伤害<br>2、每天<font color='0x01f801'>24</font>点整根据玩家的威望值进行排行<br>3、威望等级每日回收如下：<br>    默默无闻             <font color='0x01f801'>0</font><br>    声名不显             <font color='0x01f801'>10000</font><br>    小有名气             <font color='0x01f801'>20000</font><br>    名声鹊起             <font color='0x01f801'>30000</font><br>    名噪一时             <font color='0x01f801'>40000</font><br>    赫赫有名             <font color='0x01f801'>50000</font><br>    闻名遐迩             <font color='0x01f801'>60000</font><br>    大名鼎鼎             </font><font color='0x01f801'>70000</font><br>    威名远播             <font color='0x01f801'>80000</font><br>    名震四海             <font color='0x01f801'>100000</font><br>    震古烁今及以上   <font color='0x01f801'>120000</font>",
		Remarks = "威望说明",
	},
	[60] = {
		Msg = "归属者将获得归属大奖",
	},
	[66] = {
		Msg = "消耗 <font color='0x01f801'>{0}元宝</font> 可立即获得1次野战事件<br>是否确认购买？",
		Remarks = "野战系统次数购买确定提示",
	},
	[67] = {
		Msg = "勇士不知道哪里可以获得兑换码？关注各大平台官方网站或者公众号，会不定期发送激活码哦！",
		Remarks = "没有输入激活码时文本",
	},
	[68] = {
		Msg = "激活码正确，获得了大礼包呢！",
		Remarks = "输入正确激活码时文本",
	},
	[69] = {
		Msg = "哎哟，激活码错了，勇士需要先获得正确的激活码哦",
		Remarks = "输入错误激活码时文本",
	},
	[79] = {
		Msg = "需要提高至尊等级才能购买更多次数，",
	},
	[80] = {
		Msg = "今日可购买次数不足，请明日再来",
	},
	[81] = {
		Msg = "获得如下奖励",
		Remarks = "通关面板奖励描述",
	},
	[84] = {
		Msg = "确定使用 {0} 吗？<br><font color='0x01f801'>{1}阶</font>及以下的光翼使用后直接升级到6阶1星，超过6阶1星后使用增加<font color='0x01f801'>{2}点</font>祝福值",
		Remarks = "光翼直升丹使用文本提示",
	},
	[89] = {
		Msg = "每周一、三、五20:00-20：30开启匹配",
	},
	[90] = {
		Msg = "您的月卡特权仅剩下 <font color='0x01f801'>{0}</font> 天，即将过期。<br>是否立即续费月卡？",
	},
	[91] = {
		Msg = "红包发起来，财源滚滚来",
	},
	[101] = {
		Msg = "需要等级：{0}",
	},
	[102] = {
		Msg = "角色等级不超过{0}级",
	},
	[103] = {
		Msg = "角色{0}转开启",
	},
	[104] = {
		Msg = "角色转生不超过{0}转",
	},
	[105] = {
		Msg = "行会等级达到{0}级",
	},
	[106] = {
		Msg = "英雄等级达到{0}级",
	},
	[107] = {
		Msg = "英雄经脉等级达到{0}级",
	},
	[108] = {
		Msg = "至尊等级达到{0}级",
	},
	[109] = {
		Msg = "开服天数超过{0}天",
	},
	[110] = {
		Msg = "开服天数小于{0}天",
	},
	[111] = {
		Msg = "VIP等级达到{0}级",
	},
	[113] = {
		Msg = "攻击威望值低于自身的玩家，<font color='0x01f801'>伤害增加7%</font>",
	},
	[114] = {
		Msg = "消耗<font color='#1fcb20'>{0}传奇币</font>，可购买<font color='#1fcb20'>1</font>次挑战次数<br>今日已购买：{1}/{2}次<br>是否确认购买？",
		Remarks = "秘境BOSS购买次数",
	},
	[120] = {
		Msg = "至尊等级不过{0}级",
	},
	[121] = {
		Msg = "行会{0}级",
	},
	[122] = {
		Msg = "欢迎 <font color='0x02afe8'>{0}</font> 加入行会",
		Remarks = "加入行会日志",
	},
	[123] = {
		Msg = " <font color='0x02afe8'>{0}</font> 离开了行会",
		Remarks = "离开行会日志",
	},
	[124] = {
		Msg = "<font color='0x02afe8'>{0}</font> 将 <font color='0x02afe8'>{1}</font> 踢出了行会",
		Remarks = "踢出行会日志",
	},
	[125] = {
		Msg = " <font color='0x02afe8'>{0}</font> 将 <font color='0x02afe8'>{1}</font> 的职位从 <font color='0x02afe8'>{2}</font> 调整为 <font color='0x02afe8'>{3}</font>",
		Remarks = "调整行会职位日志",
	},
	[126] = {
		Msg = " <font color='0x02afe8'>{0}</font> 召唤的行会BOSS被击杀",
		Remarks = "击杀行会BOSS日志",
	},
	[127] = {
		Msg = " <font color='0x02afe8'>{0}</font> 将帮主之位转让给了 <font color='0x02afe8'>{1}</font>",
		Remarks = "帮主转让日志",
	},
	[128] = {
		Msg = "行会升级！行会从<font color='0x02afe8'>{0}</font>级提升到了<font color='0x02afe8'>{1}</font>级",
		Remarks = "行会升级日志",
	},
	[129] = {
		Msg = "行会拿下了龙城，成为了龙城霸主！",
		Remarks = "拿下沙巴克日志",
	},
	[130] = {
		Msg = " <font color='0x02afe8'>{0}</font> 派发了行会红包",
		Remarks = "行会发送红包公告",
	},
	[1000] = {
		Msg = " ",
		Remarks = "版本更新公告",
	},
	[131] = {
		Msg = "1.<font color='0x01f801'>白银特权礼包</font><br>2.<font color='0x01f801'>对怪伤害增加100</font><br>3.<font color='0x01f801'>专属称号</font><br>4.<font color='0x01f801'>专属折扣礼包</font><br>5.<font color='0x01f801'>特权专属BOSS</font><br>6.<font color='0x01f801'>回收加成10%</font><br>",
		Remarks = "白银特权说明",
	},
	[132] = {
		Msg = "1.<font color='0x01f801'>黄金特权礼包</font><br>2.<font color='0x01f801'>对怪伤害增加150</font><br>3.<font color='0x01f801'>专属称号</font><br>4.<font color='0x01f801'>专属折扣礼包</font><br>5.<font color='0x01f801'>特权专属BOSS</font><br>6.<font color='0x01f801'>回收加成15%</font><br>7.<font color='#fcd132'>随身回收特权</font><br>",
		Remarks = "黄金特权说明",
	},
	[133] = {
		Msg = "1.<font color='0x01f801'>铂金特权礼包</font><br>2.<font color='0x01f801'>对怪伤害增加200</font><br>3.<font color='0x01f801'>专属称号</font><br>4.<font color='0x01f801'>专属折扣礼包</font><br>5.<font color='0x01f801'>特权专属BOSS</font><br>6.<font color='0x01f801'>回收加成20%</font><br>7.<font color='0x01f801'>随身回收特权</font><br>8.<font color='#fcd132'>自动买药特权</font>",
		Remarks = "铂金特权说明",
	},
	[134] = {
		Msg = "1.<font color='0x01f801'>钻石特权礼包</font><br>2.<font color='0x01f801'>对怪伤害增加300</font><br>3.<font color='0x01f801'>专属称号</font><br>4.<font color='0x01f801'>专属折扣礼包</font><br>5.<font color='0x01f801'>特权专属BOSS</font><br>6.<font color='0x01f801'>回收加成25%</font><br>7.<font color='0x01f801'>随身回收特权</font><br>8.<font color='0x01f801'>自动买药特权</font><br>9.<font color='#fcd132'>自动回收特权</font><br>",
		Remarks = "钻石特权说明",
	},
	[135] = {
		Msg = "1.<font color='0x01f801'>星耀特权礼包</font><br>2.<font color='0x01f801'>对怪伤害增加400</font><br>3.<font color='0x01f801'>专属称号</font><br>4.<font color='0x01f801'>专属折扣礼包</font><br>5.<font color='0x01f801'>特权专属BOSS</font><br>6.<font color='0x01f801'>回收加成30%</font><br>7.<font color='0x01f801'>随身回收特权</font><br>8.<font color='0x01f801'>自动买药特权</font><br>9.<font color='0x01f801'>自动回收特权</font><br>",
		Remarks = "星耀特权说明",
	},
	[136] = {
		Msg = "1.<font color='0x01f801'>王者特权礼包</font><br>2.<font color='0x01f801'>对怪伤害增加500</font><br>3.<font color='0x01f801'>专属称号</font><br>4.<font color='0x01f801'>专属折扣礼包</font><br>5.<font color='0x01f801'>特权专属BOSS</font><br>6.<font color='0x01f801'>回收加成35%</font><br>7.<font color='0x01f801'>随身回收特权</font><br>8.<font color='0x01f801'>自动回收特权</font><br>9.<font color='0x01f801'>自动买药特权</font><br>10.<font color='#fcd132'>随身仓库特权</font>",
		Remarks = "王者特权说明",
	},
	[137] = {
		Msg = "<font color='0x01f801'>1.无视麻痹效果</font><br><font color='0x01f801'>2.自动使用背包里经验、元宝相关道具</font><br><font color='0x01f801'>3.随身材料仓库，随身背包仓库，同时开启挂机再也不怕满背包</font>",
		Remarks = "荣耀特权说明",
	},
	[138] = {
		Msg = "<font color='0xffffff'>1.无视麻痹效果</font><br><font color='0xffffff'>2.打怪爆率增加<font color='0x01f801'>25%</font><br><font color='0xffffff'>3.元宝回收额外加成<font color='0x01f801'>20%</font><br><font color='0xffffff'>4.随身材料仓库，随身背包仓库，同时开启挂机再也不怕满背包</font><br><font color='0xffffff'>5.自动使用背包里经验、元宝相关道具</font><br><font color='0x01f801'>6.自动回收已勾选列表道具</font><br><font color='0x01f801'>7.拍卖行可上架已绑定道具</font><br><font color='0x01f801'>8.回收获得非绑元宝</font>",
		Remarks = "神圣特权说明",
	},
	[139] = {
		Msg = "<font color='0xffffff'>1.无视麻痹效果</font><br><font color='0xffffff'>2.打怪爆率增加<font color='0x01f801'>50%</font><br><font color='0xffffff'>3.元宝回收额外加成<font color='0x01f801'>40%</font><br><font color='0x01f801'>4.自动拾取掉落道具</font><br><font color='0xffffff'>5.随身材料仓库，随身背包仓库，同时开启挂机再也不怕满背包</font></font><br><font color='0xffffff'>6.自动回收已勾选列表道具</font><br><font color='0xffffff'>7.自动使用背包里经验、元宝相关道具</font><br><font color='0xffffff'>8.拍卖行可上架已绑定道具</font><br><font color='0xffffff'>9.回收获得非绑元宝</font><br><font color='0x01f801'>10.自动批量使用经验、元宝相关道具</font>",
		Remarks = "永恒特权说明",
	},
	[140] = {
		Msg = "<font color='0xffffff'>1.无视麻痹效果</font><br><font color='0xffffff'>2.打怪爆率增加<font color='0x01f801'>75%</font><br><font color='0xffffff'>3.元宝回收额外加成<font color='0x01f801'>60%</font><br><font color='0xffffff'>4.自动拾取掉落道具</font><br><font color='0xffffff'>5.随身材料仓库，随身背包仓库，同时开启挂机再也不怕满背包</font><br><font color='0xffffff'>6.自动回收已勾选列表道具</font><br><font color='0xffffff'>7.自动使用背包里经验、元宝相关道具</font><br><font color='0xffffff'>8.拍卖行可上架已绑定道具</font><br><font color='0xffffff'>9.回收获得非绑元宝</font><br><font color='0xffffff'>10.自动批量使用经验、元宝相关道具</font><br><font color='0x01f801'>11.回城、随机石即点即回城</font>",
		Remarks = "至尊特权说明",
	},
	[141] = {
		Msg = "<font color='0xffffff'>1.无视麻痹效果</font><br><font color='0xffffff'>2.打怪爆率增加<font color='0x01f801'>100%</font><br><font color='0xffffff'>3.元宝回收额外加成<font color='0x01f801'>80%</font><br><font color='0xffffff'>4.自动拾取掉落道具</font><br><font color='0xffffff'>5.随身材料仓库，随身背包仓库，同时开启挂机再也不怕满背包</font><br><font color='0xffffff'>6.自动回收已勾选列表道具</font><br><font color='0xffffff'>7.自动使用背包里经验、元宝相关道具</font><br><font color='0xffffff'>8.拍卖行可上架已绑定道具</font><br><font color='0xffffff'>9.回收获得非绑元宝</font><br><font color='0xffffff'>10.自动批量使用经验、元宝相关道具</font><br><font color='0xffffff'>11.回城、随机石即点即回城</font><br><font color='0x01f801'>12.攻击时额外对怪造成充值金额的两倍伤害</font>",
		Remarks = "史诗特权说明",
	},
	[142] = {
		Msg = "<font color='0xffffff'>1.无视麻痹效果</font><br><font color='0xffffff'>2.打怪爆率增加<font color='0x01f801'>150%</font><br><font color='0xffffff'>3.元宝回收额外加成<font color='0x01f801'>100%</font><br><font color='0xffffff'>4.自动拾取掉落道具</font><br><font color='0xffffff'>5.随身材料仓库，随身背包仓库，同时开启挂机再也不怕满背包</font><br><font color='0xffffff'>6.自动回收已勾选列表道具</font><br><font color='0xffffff'>7.自动使用背包里经验、元宝相关道具</font><br><font color='0xffffff'>8.拍卖行可上架已绑定道具</font><br><font color='0xffffff'>9.回收获得非绑元宝</font><br><font color='0xffffff'>10.自动批量使用经验、元宝相关道具</font><br><font color='0xffffff'>11.回城、随机石即点即回城</font><br><font color='0xffffff'>12.攻击时额外对怪造成充值金额的两倍伤害</font><br><font color='0x01f801'>13.打怪有概率额外再掉落一份奖励</font>",
		Remarks = "传说特权说明",
	},
	[146] = {
		Msg = "1、成功通关副本可以获得大量的进阶材料奖励<br>2、每个副本通关后可以消耗元宝扫荡一次<br>3、每天0点重置副本次数",
		Remarks = "材料副本",
	},
	[149] = {
		Msg = "1、进入副本后按波数刷新怪物，一波怪物击杀完成后刷新下一波<br>2、每击杀完一波怪物就可以获得经验奖励<br>3、副本时间有限，玩家需要在有限的时间内击杀越多的怪物",
		Remarks = "封魔",
	},
	[150] = {
		Msg = "1、活动开启之后，所有玩家需<font color='0x01f801'>摧毁</font>城门，从而开启皇宫争夺，最终成功获得皇宫归属权的行会为<font color='0x01f801'>沙城占领者</font>。<br>2、开服/合服<font color='0x01f801'>首次</font>沙城争霸活动<font color='0x01f801'>无守城方</font>。其他时间守城方为上一次占领沙城的行会，攻城方为其他行会。<br>3、城门被摧毁后，正式开启皇宫归属权争夺。守城方玩家可<font color='0x01f801'>提前</font>进入皇宫占位。<br>4、活动结束时，获得皇宫<font color='0x01f801'>归属权</font>的行会成为沙城占领者。<br>5、活动结束时，如没有行会获得皇宫归属权，则行会<font color='0x01f801'>积分排名第一</font>的行会成为沙城占领者。<br>6、行会成员才会获得积分",
		Remarks = "沙巴克",
	},
	[151] = {
		Msg = "1、活动开启之后，所有玩家需<font color='0x01f801'>摧毁</font>城门，从而开启皇宫争夺，最终成功获得皇宫归属权的行会为<font color='0x01f801'>沙城占领者</font>。<br>2、开服/合服<font color='0x01f801'>首次</font>沙城争霸活动<font color='0x01f801'>无守城方</font>。其他时间守城方为上一次占领沙城的行会，攻城方为其他行会。<br>3、城门被摧毁后，正式开启皇宫归属权争夺。守城方玩家可<font color='0x01f801'>提前</font>进入皇宫占位。<br>4、活动结束时，获得皇宫<font color='0x01f801'>归属权</font>的行会成为沙城占领者。<br>5、活动结束时，如没有行会获得皇宫归属权，则行会<font color='0x01f801'>积分排名第一</font>的行会成为沙城占领者。<br>6、行会成员才会获得积分",
		Remarks = "沙巴克",
	},
	[155] = {
		Msg = "消耗<font color='#01f801'>{0}</font>传奇币，购买<font color='#01f801'>{1}寻宝积分</font>？购买后赠送<font color='#01f801'>寻宝钥匙</font>并<font color='#01f801'>自动寻宝</font>，是否确认购买？",
		Remarks = "寻宝弹窗",
	},
	[156] = {
		Msg = "1、玩家可以使用传奇币发放红包供帮派成员领取。<br>2、红包个数上限为行会当前等级人数上限。<br>3、红包金额最低为1000传奇币。<br>4、玩家发放的红包中未被领取的传奇币将在24小时后返还。<br>5、沙城争霸中可以获得帮派红包奖励，该红包发放后不返还。",
		Remarks = "帮派红包",
	},
	[157] = {
		Msg = "前往殿前",
	},
	[158] = {
		Msg = "摧毁殿前雕像",
	},
	[159] = {
		Msg = "守卫殿前雕像",
	},
	[160] = {
		Msg = "前往皇宫",
	},
	[161] = {
		Msg = "占领龙城皇宫",
	},
	[162] = {
		Msg = "守卫龙城皇宫",
	},
	[163] = {
		Msg = "返回殿前",
	},
	[164] = {
		Msg = "立即复活",
	},
	[165] = {
		Msg = "消耗：{0}元宝",
	},
	[166] = {
		Msg = "攻击雕像",
	},
	[167] = {
		Msg = "寻找外敌",
	},
	[168] = {
		Msg = "当前无敌对行会成员",
	},
	[169] = {
		Msg = "返回殿前",
	},
	[170] = {
		Msg = "正在寻找目标怪物",
	},
	[171] = {
		Msg = "正在自动寻路前往NPC",
	},
	[172] = {
		Msg = "英雄已阵亡，无法释放连击",
	},
	[173] = {
		Msg = "龙城霸主尚未决出，无法膜拜",
	},
	[174] = {
		Msg = "今日已膜拜，请明日再来",
	},
	[175] = {
		Msg = "每<font color='0x01f801'>周日晚22:00</font>点结算赛季奖励",
	},
	[178] = {
		Msg = "<font color='0x01f801'>额外奖励次数：{0}</font>",
	},
	[179] = {
		Msg = "1、龙城争霸活动开启后，攻城方需要等待1分钟才能进入殿前摧毁雕像。守城方可以直接进入殿前守卫雕像。<br>2、殿前雕像被攻城方摧毁后，开启皇宫，所有行会成员都可以进入皇宫站位。<br>3、皇宫开启120秒后，可以归属权争夺，当皇宫内只有同一个行会的成员时，则该行会获得归属权。<br>4、活动期间内攻击玩家和守卫都可以获得积分，击杀玩家连续获胜后获得的积分更多，击杀连胜玩家也会获得高额积分奖励。<br>5、皇宫内泡点每5秒增加一次积分。<br>6、活动结束时，获得皇宫归属权的行会成为龙城占领者。<br>7、活动结束时，如果没有行会获得皇宫归属权，则行会积分排名第一的行会成为龙城占领者。<br>8、龙城争霸中，每次死亡后复活时间延长，最多延长到30秒。",
		Remarks = "龙城场景内的查看帮助",
	},
	[180] = {
		Msg = "至尊等级越高，奖励越丰富",
		Remarks = "至尊礼包购买文本",
	},
	[181] = {
		Msg = "需要购买前置礼包",
		Remarks = "至尊等级已到但未购买前一礼包时",
	},
	[182] = {
		Msg = "<font color='0xe1dac0'>霸主行会膜拜城主获得高额奖励。</font>",
	},
	[183] = {
		Msg = "<font color='0xe1dac0'>团结行会，抢先占领皇宫，最后时间，守住阵地。</font>",
	},
	[184] = {
		Msg = "当前无非归属者的敌对玩家",
	},
	[185] = {
		Msg = "{0}秒后开启皇宫归属权争夺",
		Remarks = "雕像被毁后的提示",
	},
	[186] = {
		Msg = "{0}秒后攻城方可进攻殿前",
		Remarks = "攻城方进攻提醒",
	},
	[187] = {
		Msg = "守城方可直接进入殿前防守",
		Remarks = "守城方防守提醒",
	},
	[189] = {
		Msg = "排行奖励每晚24:00结算，明日可领取",
	},
	[190] = {
		Msg = "次数不足，请明日再来",
	},
	[191] = {
		Msg = "消耗<font color='#01f801'>{0}</font>元宝，可购买<font color='#01f801'>1</font>次挑战次数<br>今日已购买：{1}/{2}<br>是否确认购买？",
	},
	[192] = {
		Msg = "战斗力不低于{0}",
	},
	[193] = {
		Msg = "战斗力低于{0}",
	},
	[194] = {
		Msg = "完成神龙挑战",
		Remarks = "condition13的描述",
	},
	[195] = {
		Msg = "寻宝获得#寻宝获得",
		Remarks = "传世界面的描述",
	},
	[196] = {
		Msg = "巅峰竞技前{0}名",
		Remarks = "竞技场奖励界面秒数",
	},
	[197] = {
		Msg = "1、挑战特殊关数后会获得增益状态<br>2、选择不同的增益状态，能更有效的针对不同的关卡敌人<br>3、玩家每天有重置一次的机会<br>4、重置后会根据当前挑战的关数领取奖励<br>5、每周日24:00系统会将玩家的通关数重置，并根据玩家挑战的最高层数发放奖励",
		Remarks = "竞技场奖励界面秒数",
	},
	[217] = {
		Msg = "寻宝1次可获得1积分",
		Remarks = "寻宝积分兑换界面提示",
	},
	[240] = {
		Msg = "你的活跃度不足，请完成更多每日任务",
	},
	[242] = {
		Msg = "是否消耗<font color='0x01f801'>{0}{1}</font>弹劾会长，弹劾成功您将成为新会长",
		Remarks = "弹劾会长",
	},
	[244] = {
		Msg = " <font color='0x02afe8'>{0}</font> 弹劾了会长，成为新会长 ",
		Remarks = "弹劾会长成功公告",
	},
	[245] = {
		Msg = "该道具为稀有道具，摧毁后无法还原<br>请确认是否摧毁。",
		Remarks = "摧毁的二次确认",
	},
	[246] = {
		Msg = " <font color='0x02afe8'>{0}</font> 修改行会名为<font color='0x02afe8'>{1}</font>",
		Remarks = "行会发送红包公告",
	},
	[255] = {
		Msg = "未满足领取条件",
	},
	[256] = {
		Msg = "当前已通关至最高层",
	},
	[257] = {
		Msg = "<font color='0xfcd132'>挑战后，明日可领奖</font>",
	},
	[258] = {
		Msg = "<font color='0xfcd132'>明日可领奖，通关层数越高，奖励越好</font>",
	},
	[259] = {
		Msg = "<font color='0xff7f00'>每通关10层，即可拿走奖池里的1个奖励</font>",
	},
	[260] = {
		Msg = "角色光翼等级不低于{0}级",
	},
	[261] = {
		Msg = "英雄光翼总等级不低于{0}级",
	},
	[262] = {
		Msg = "角色技能总等级不低于{0}级",
	},
	[263] = {
		Msg = "强化总等级不低于{0}级",
	},
	[264] = {
		Msg = "魂石总等级不低于{0}级",
	},
	[265] = {
		Msg = "经脉总等级不低于{0}级",
	},
	[266] = {
		Msg = "精炼总等级不低于{0}级",
	},
	[267] = {
		Msg = "目标未达成，无法升级",
		Remarks = "升级法宝的错误提示",
	},
	[268] = {
		Msg = "宝物总等级不低于{0}级",
	},
	[269] = {
		Msg = "角色6转且开服天数超过20天开启",
	},
	[271] = {
		Msg = "通关百炼塔达到{0}关开启",
	},
	[272] = {
		Msg = "心法可提供属性加成<br>心法品质越高，属性越多",
		Remarks = "心法学习提醒",
	},
	[273] = {
		Msg = "拆卸心法:{0}后可以如下获得道具<br>{1}",
		Remarks = "心法拆卸提示",
	},
	[274] = {
		Msg = "请先购买月卡",
	},
	[275] = {
		Msg = "请先购买至尊月卡",
	},
	[276] = {
		Msg = "1、您可以通过寻宝图的方式参与寻宝活动，每次寻宝可额外获得一个橙装碎片<br>2、目前游戏内有寻宝1次、10次2个选项，分别需要使用1个寻宝图、10个寻宝图。<br>3、寻宝奖励产生的道具内容：顶级装备、高级装备、普通装备、高级材料、低级材料等等游戏内道具。每种道具的掉落概率都会不同。<br>具体内容如下：<br>顶级装备类：1、5%<br>高级装备类：8、5%<br>普通装备类：42、5%<br>顶级材料类：1、5%<br>高级材料类：11、5%<br>低级材料类：34、5%",
		Remarks = "寻宝概率公示",
	},
	[277] = {
		Msg = "1、您可以通过寻宝图的方式参与寻宝活动，每次寻宝可额外获得一个橙装碎片<br>2、目前游戏内有寻宝1次、10次2个选项，分别需要使用1个寻宝图、10个寻宝图。<br>3、寻宝奖励产生的道具内容：顶级装备、高级装备、普通装备、高级材料、低级材料等等游戏内道具。每种道具的掉落概率都会不同。<br>具体内容如下：<br>顶级装备类：1、5%<br>高级装备类：8、5%<br>普通装备类：42、5%<br>顶级材料类：1、5%<br>高级材料类：11、5%<br>低级材料类：34、5%",
		Remarks = "寻宝概率公示",
	},
	[278] = {
		Msg = "<font color='#fcd132'>每天免费领取5000威望</font>&<font color='#cf26a5'>每天免费挑战至尊特权BOSS&材料副本收益提升20%</font>&开启一键扫荡材料副本功能&背包格子增加100格&每日赠送1个BOSS召唤令&每日赠送1次精英任务",
		Remarks = "至尊月卡特权",
	},
	[279] = {
		Msg = "<font color='0xe1dac0'>回收选中的心法可获得 <font color='0x01f801'>{0}</font> 个<font color='0xff7f00'>心法残卷</font></font>",
		Remarks = "心法回收",
	},
	[280] = {
		Msg = "<font color='0xe1dac0'>点击心法图标选中要回收的心法</font>",
		Remarks = "心法回收",
	},
	[281] = {
		Msg = "野战中与其他玩家战斗增加pk值，pk值大于100后无法继续野战",
		Remarks = "野战提示",
	},
	[282] = {
		Msg = "当前pk值达到<font color='0xe27d07'>{0}</font><br>是否消耗<font color='0x01f801'>{1}元宝</font>减少<font color='0x01f801'>{2}</font>点pk值并<font color='0x01f801'>立即挑战</font>",
		Remarks = "野战提示",
	},
	[283] = {
		Msg = "请先领取幸运转盘奖励",
		Remarks = "百炼塔幸运转盘提示",
	},
	[284] = {
		Msg = "材料寻宝或者通关百炼塔可获得心法",
		Remarks = "没有心法的提示",
	},
	[285] = {
		Msg = "请选中要拆卸的心法",
		Remarks = "拆卸心法提示",
	},
	[286] = {
		Msg = "该角色尚未学习任何心法",
		Remarks = "拆卸心法的提示",
	},
	[287] = {
		Msg = "合成所需材料不足",
		Remarks = "拆卸心法的提示",
	},
	[295] = {
		Msg = "1、首个对BOSS造成伤害的玩家可以获得归属<br>2、当归属的玩家被其他玩家击败，移交归属权<br>3、BOSS死亡时最终归属的玩家获得归属奖励，参与<br>玩家无奖励",
		Remarks = "秘境BOSS归属者奖励",
	},
	[296] = {
		Msg = "1、首个对BOSS造成伤害的玩家可以获得归属<br>2、当归属的玩家被其他玩家击败，移交归属权<br>3、BOSS死亡时最终归属的玩家获得归属奖励",
		Remarks = "秘境BOSS归属者奖励",
	},
	[299] = {
		Msg = "消耗<font color='#01f801'>{0}</font>传奇币，购买<font color='#01f801'>{1}寻宝积分</font>？购买后赠送<font color='#01f801'>寻宝钥匙</font>并<font color='#01f801'>自动寻宝</font>，是否确认购买？",
	},
	[300] = {
		Msg = "抽奖次数不足，挑战百炼塔可免费获得抽奖次数！",
		Remarks = "百炼塔抽奖提示",
	},
	[301] = {
		Msg = "受到致命伤害时有概率<font color='0x01f801'>不会死亡</font>，并立即回复<font color='0x01f801'>{1}%</font>的最大生命，每场战斗每个角色最多触发1次",
	},
	[303] = {
		Msg = "<font color='#01f801'>今日挑战行会试炼已达上限，请明日再来！</font><br>每日最多可挑战{0}关",
	},
	[304] = {
		Msg = "是否替换为{0}<br>{1}将被拆卸并100%返还升级材料",
	},
	[305] = {
		Msg = "挑战完成，请领取奖励",
	},
	[308] = {
		Msg = "恭喜你已完成全部龙神挑战",
	},
	[310] = {
		Msg = "装备评分达到{0}",
	},
	[311] = {
		Msg = "立即获得<font color='#fcd132'>11000元宝</font>，每天领取<font color='#fcd132'>1000元宝</font>&获得威望+<font color='#fcd132'>20%</font>，每天领取<font color='#fcd132'>5000威望</font>&免费挑战<font color='#fcd132'>月卡BOSS和至尊卡BOSS</font>&一键扫荡材料副本，获得奖励<font color='#fcd132'>+20%</font>&挂机经验<font color='#fcd132'>+10%</font>，挂机金币<font color='#fcd132'>+10%</font>&每日领取<font color='#fcd132'>BOSS召唤令+1</font>，背包格子<font color='#fcd132'>+200</font>&每日赠送<font color='#fcd132'>精英任务次数+1</font>",
		Remarks = "至尊月卡特权",
	},
	[313] = {
		Msg = "转盘次数不足，充值每达到{0}元宝即可获得1次转盘次数",
	},
	[314] = {
		Msg = "没有加入行会，无法召唤帮众助战",
	},
	[315] = {
		Msg = "<font color='0xe1dac0'>回收龙城战歌装备获得 <font color='0x01f801'>{0}</font> 个<font color='0xff7f00'>战歌之魂</font></font>",
		Remarks = "符文回收界面描述",
	},
	[316] = {
		Msg = "<font color='0xe1dac0'>点击装备图标选中要回收的龙城战歌装备</font>",
	},
	[317] = {
		Msg = "封魔副本达到{0}层",
	},
	[318] = {
		Msg = "<font color='0xe1dac0'>回收图鉴可获得 <font color='0x01f801'>{0}</font> 个<font color='0xff7f00'>图鉴经验</font></font>",
		Remarks = "符文回收界面描述",
	},
	[319] = {
		Msg = "<font color='0xe1dac0'>点击图鉴选中要回收的图鉴</font>（只回收已激活的图鉴）",
	},
	[320] = {
		Msg = "60002#攻击时有几率召唤出神龙，对目标造成无视防御的真实伤害",
		Remarks = "神龙挑战界面描述",
	},
	[321] = {
		Msg = "60003#受到伤害时，有几率触发神龙守护，降低所受到的伤害",
		Remarks = "神龙挑战界面描述",
	},
	[322] = {
		Msg = "60004#攻击目标时，如果目标生命值较低，有几率造成100倍伤害",
		Remarks = "神龙挑战界面描述",
	},
	[323] = {
		Msg = "<font color='0xe1dac0'>1、玩家等级达到<font color='#fcd132'>30级</font>即可参与该玩法<br>2、玩家随机加入两个<font color='#fcd132'>对立阵营</font>，每<font color='#fcd132'>3分钟</font>重新分配阵营<br>3、击杀对立阵营的玩家、持续参与活动都可以获得积分<br>4、奖励分为达标奖励和排名奖励，积分越高，获得的奖励越丰厚<br>5、玩家每阵亡一次即可获得一层“逆袭”BUFF，每层的“逆袭”BUFF可增加30%的伤害</font>",
		Remarks = "热血乱斗规则描述",
	},
	[325] = {
		Msg = "1、无尽封魔共4层，无次数限制<br>2、击杀怪物越多，可获得奖励越多<br>3、击杀一定怪物数量则可额外领取宝箱<br>4、每日最大击杀数和击杀奖励每日0点刷新<br>5、领取全部宝箱奖励则进入下一层副本<br>6、封魔层数越高宝箱奖励内容越好<br>7、击杀至一定怪物量可额外领取特殊奖励",
	},
	[328] = {
		Msg = "已通关顶层，请明日再来挑战！",
		Remarks = "封魔副本挑战提示",
	},
	[329] = {
		Msg = "被锁定的绝学在修炼时不会被替换",
		Remarks = "绝学锁定面板描述",
	},
	[330] = {
		Msg = "修炼后习的《{0}》有几率替换已学习的绝学，是否修炼？<br><font color='0x01f801'>（低级绝学不会替换高级绝学）</font>",
		Remarks = "修炼绝学提示",
	},
	[331] = {
		Msg = "炼魂等级达到{0}",
	},
	[332] = {
		Msg = "修炼有可能替换已学绝学，高级绝学必定替换同属性的中级绝学",
		Remarks = "绝学面板描述",
	},
	[333] = {
		Msg = "1、玩家等级达到<font color='0x01f801'>7</font>转，即可开启人物的【炼魂】系统<br>2、炼魂六道分为：地狱道、饿鬼道、畜生道、修罗道、人间道、天道<br>3、每道分为<font color='0x01f801'>六境</font>，依次为：玄、生、破、虚、妄、灭<br>4、消耗一定的<font color='0x01f801'>业力</font>由玄境开始顺时针依次激活六境<br>5、升级炼魂可获得无视防御的连击神圣伤害，威力巨大<br>6、获取“业力”提升炼魂，可消耗经验或者购买炼魂丹来兑换<br>7、炼魂达到地狱道·破境即可开启第一组<font color='0x01f801'>炼魂BOSS</font>，在遗迹BOSS页面击杀；炼魂等级越高，开启的炼魂BOSS越多<br>8、炼魂BOSS产出大量<font color='0x01f801'>炼魂装备</font>，穿戴炼魂装备可获得无视防御的神圣伤害、提高神圣伤害百分比的神圣精通和合击伤害减免，威力极其巨大",
		Remarks = "炼魂系统详细描述",
	},
	[334] = {
		Msg = "激活全部灵器后开启",
		Remarks = "condition：300007的描述",
	},
	[335] = {
		Msg = "1、修炼绝学时有几率替换已有绝学。<br>2、可使用任意三本同等级的绝学置换一本新绝学，置换时有<font color='0x01f801'>一定概率</font>获得<font color='0xe27d07'>更高级的绝学</font>。<br>3、修炼<font color='0xdb0bf3'>低级的绝学</font>不会替换原有的<font color='0xe27d07'>高级的绝学</font>，修炼时随机到已修炼高级的绝学槽位时将会修炼失败并消耗相应道具。<br>4、修炼<font color='0xe27d07'>高级的绝学</font>时，若有已修炼的同属性<font color='0xdb0bf3'>低级绝学</font>将直接替换成<font color='0xe27d07'>高级的绝学</font>。<br>5、绝学烙印界面点击修炼槽中绝学可锁定绝学，锁定后在修炼新绝学时<font color='0x01f801'>不会被替换</font>。<br>6、解锁绝学烙印时不会返还道具，请谨慎操作。<br>7、开服<font color='#01f801'>30天</font>开放<font color='#01f801'>神级绝学</font>，神级绝学无法通过高级绝学置换获得，可在<font color='#01f801'>分解界面</font>分解高级绝学获得合成材料，在<font color='#01f801'>道具合成</font>中合成。",
		Remarks = "绝学详细说明",
	},
	[336] = {
		Msg = "消耗<font color='#01f801'>{0}</font>元宝，购买<font color='#01f801'>{1}</font>个神装寻宝图进行寻宝<br>是否确认购买？",
		Remarks = "神装寻宝说明",
	},
	[337] = {
		Msg = "开服{0}天开启",
	},
	[338] = {
		Msg = "守护系统未激活",
	},
	[339] = {
		Msg = "消耗<font color='#01f801'>{0}</font>元宝，购买<font color='#01f801'>{1}</font>个活动寻宝图进行寻宝<br>是否确认购买？",
		Remarks = "神装寻宝说明",
	},
	[340] = {
		Msg = "1、角色达到<font color='0x01f801'>4转</font>，即可开启人物的【守护】系统<br>2、消耗对应的<font color='0x01f801'>守护精魄</font>可以激活守护；开启守护附体天赋后，守护便可以被附体到角色上协同作战<br>3、使用<font color='0x01f801'>守护精元</font>可以提升守护星数，每满10星可以提升到下一阶<br>4、提升守护等级可以提升守护属性，解锁<font color='0x01f801'>超强技能</font><br>5、所有天赋激活后可<font color='0x01f801'>同时生效</font>，无需幻化，幻化只是改变守护的外观<br>6、多余的守护可用于提升守护<font color='0x01f801'>天赋</font>，增强天赋效果和大量战力",
		Remarks = "守护系统说明",
	},
	[341] = {
		Msg = "消耗<font color='#01f801'>{0}</font>元宝，购买<font color='#01f801'>{1}</font>个幸运寻宝图进行寻宝<br>是否确认购买？",
		Remarks = "幸运转盘说明",
	},
	[342] = {
		Msg = "{0}次合服后开启",
	},
	[343] = {
		Msg = "守护系统达到{0}阶{0}星开启",
	},
	[344] = {
		Msg = "您已离开行会《{0}》",
	},
	[345] = {
		Msg = "您已被请离行会《{0}》",
	},
	[347] = {
		Msg = "每次挑战都有概率获得<font color='0xe70909'>绝学礼盒</font>。学习绝学能大幅提升战力！",
		Remarks = "巅峰竞技奖励提示",
	},
	[348] = {
		Msg = "消耗<font color='#01f801'>{0}</font>传奇币，可购买<font color='#01f801'>1</font>次归属奖励次数<br>今日已购买：{1}/{2}<br>是否确认购买？",
		Remarks = "跨服BOSS增加次数",
	},
	[349] = {
		Msg = "1、首个对BOSS造成伤害的玩家可以获得归属<br>2、当归属的玩家被其他玩家击败，移交归属权<br>3、BOSS死亡时最终归属的玩家获得归属奖励",
		Remarks = "跨服BOSS归属者奖励",
	},
	[350] = {
		Msg = "1、开服达到<font color='0x01f801'>25</font>天开启<font color='0x01f801'>上古皇陵</font>，玩家达到<font color='0x01f801'>6</font>转可进入<br>2、开服达到<font color='0x01f801'>37</font>天开启<font color='0x01f801'>跨服皇陵秘境</font>，玩家达到<font color='0x01f801'>8</font>转可进入<br>3、每次进入上古皇陵消耗<font color='0x01f801'>1</font>次进入次数<br>4、每天<font color='0x01f801'>0</font>点增加<font color='0x01f801'>1</font>次挑战次数，最大次数为<font color='0x01f801'>3</font>次，皇陵外围和皇陵秘境<font color='0x01f801'>共享</font>进入次数<br>5、进入上古皇陵后<font color='0x01f801'>每分钟</font>增加<font color='0x01f801'>1</font>点皇陵威压<br>6、被其他玩家击杀增加<font color='0x01f801'>5</font>点皇陵威压<br>7、击杀BOSS在获得奖励的同时会<font color='0x01f801'>增加</font>每个BOSS对应的皇陵威压<br>8、BOSS<font color='0x01f801'>脱战</font>后会失去归属<br>9、皇陵威压达到<font color='0x01f801'>100</font>时，倒计时10秒后会被传送出地图",
		Remarks = "上古皇陵介绍",
	},
	[351] = {
		Msg = "<font color='#e1dac0'>结界的<font color='#01f801'>{0}</font>提升<font color='#01f801'>{1}</font>，与五行中的<font color='#db0bf3'>结界资质</font>同时生效</font>",
		Remarks = "结界技能tips显示文本",
	},
	[356] = {
		Msg = "<br><font color='#fcd132'>{0}</font>收益提升<font color='#01f801'>{1}</font><br>结界仙锻等级上限突破至<font color='#fcd132'>{2}级</font>",
		Remarks = "结界天赋突破tips显示文本",
	},
	[357] = {
		Msg = "没有结界处于激活状态",
		Remarks = "结界活动未激活提示",
	},
	[358] = {
		Msg = "激活后可大幅提升角色<font color='#01f801'>{0}</font>加成，加成仙锻效果",
		Remarks = "结界五行tips激活效果说明",
	},
	[359] = {
		Msg = "五行<font color='#01f801'>{0}</font>加成永久提升<font color='#01f801'>{1}</font>",
		Remarks = "结界五行tips下级效果说明",
	},
	[360] = {
		Msg = "<br><font color='#fcd132'>{0}</font>基础属性提升<font color='#01f801'>{1}</font><br>结界仙锻等级上限突破至<font color='#fcd132'>{2}级</font>",
		Remarks = "结界天赋突破tips显示文本",
	},
	[362] = {
		Msg = "合服后可兑换",
		Remarks = "五阶仙装兑换",
	},
	[363] = {
		Msg = "消耗<font color='#01f801'>{0}</font>元宝，可购买<font color='#01f801'>1</font>次挑战次数<br>今日已购买：{1}/{2}<br>是否确认购买？",
		Remarks = "购买挑战次数",
	},
	[364] = {
		Msg = "尚未装备神兵装备",
		Remarks = "神兵活动未激活提示",
	},
	[368] = {
		Msg = "1、该活动为<font color='#01f801'>全服全平台</font>活动<br>2、活动持续<font color='#01f801'>3</font>天，每天出售的总份数有一定限制，当日份额售完后将<font color='#01f801'>无法购买</font><br>3、活动期间过<font color='#01f801'>0</font>点补充总份数，每<font color='#01f801'>10</font>分钟同步更新当前剩余份数",
		Remarks = "绝版守护详细",
	},
	[369] = {
		Msg = "消耗<font color='#01f801'>{0}</font>元宝，购买<font color='#01f801'>{1}</font>个龙珠寻宝图进行寻宝<br>是否确认购买？",
		Remarks = "龙珠寻宝提示",
	},
	[370] = {
		Msg = "全新BOSS挑战开放，挑战<font color='#01f801'>秘境BOSS</font>，掉落神羽装备提供<font color='#01f801'>百分比</font>的伤害加成、伤害减免，光翼战力暴增。",
		Remarks = "秘境BOSS系统说明",
	},
	[371] = {
		Msg = "<font color='#01f801'>神龙挑战</font>开启，完成挑战可穿戴龙装，激活龙装技能，触发<font color='#01f801'>100倍</font>伤害。<br>全新挑战<font color='#01f801'>神龙塔</font>、<font color='#01f801'>神龙殿堂</font>、<font color='#01f801'>神龙秘境</font>开放，<font color='#01f801'>极品龙装</font>掉不停。",
		Remarks = "神龙塔、神龙殿堂系统说明",
	},
	[372] = {
		Msg = "全新装备系统——<font color='#01f801'>主宰装备</font>开启，穿戴主宰装备激活<font color='#01f801'>灵魂锁链</font>技能，各部位属性连锁加成。<br>致命一击<font color='#01f801'>2、5倍</font>伤害，输出超暴力。",
		Remarks = "主宰装备系统说明",
	},
	[373] = {
		Msg = "多人副本——<font color='#01f801'>兽巢</font>开启，全新的副本战斗模式，组队激情打怪。<br>每周两次首杀重置，奖励丰厚，必掉<font color='#01f801'>光之守护</font>，战力飙升<font color='#01f801'>50万</font>！",
		Remarks = "兽巢系统说明",
	},
	[374] = {
		Msg = "全新PVP玩法——<font color='#01f801'>巅峰竞技</font>开启，挑战其他玩家，提升自己的排名，更有几率掉落<font color='#01f801'>绝学</font>奖励疯狂提升战力。<br>每周结算排名奖励，排名越靠前奖励越丰厚，前<font color='#01f801'>10</font>更有<font color='#01f801'>专属称号</font>！",
		Remarks = "巅峰竞技系统说明",
	},
	[375] = {
		Msg = "全新BOSS挑战——<font color='#01f801'>暗之神域</font>开启，掉落灵宝装备，提供大量的攻击、生命值加成。穿戴灵纹、灵印激活套装效果，触发目标<font color='#01f801'>生命上限百分比</font>的<font color='#01f801'>额外伤害</font>！",
		Remarks = "暗之神域系统说明",
	},
	[376] = {
		Msg = "<font color='#01f801'>洛神图</font>系统开启，佩戴相应的洛神图激活组合技能——<font color='#01f801'>荆棘</font>，卡牌品质越高，组合技能威力越强，最高<font color='#01f801'>反伤30%！</font><br>洛神图对应副本——<font color='#01f801'>王者禁地</font>开启，收集材料兑换、升级洛神图，战力蹭蹭涨。",
		Remarks = "洛神图系统说明",
	},
	[377] = {
		Msg = "<font color='#01f801'>守护</font>系统开启，升级守护开启<font color='#01f801'>守护附体</font>天赋，附体到角色上协同作战，提升能力，增强战场统治力。<br><font color='#01f801'>幻化</font>守护外形解锁额外的天赋和属性，守护外形任你挑。",
		Remarks = "守护系统说明",
	},
	[378] = {
		Msg = "<font color='#01f801'>神龙帝国跨服玩法</font>即将开启，以区服为单位，互为对手的区服在跨服战场里都拥有自己的<font color='#01f801'>主战场</font>。<br>挑战白虎获取守护装备，大幅度提升守护战力，更有几率掉落守护幻化——<font color='#01f801'>冰心守护</font>！",
		Remarks = "神龙帝国系统说明",
	},
	[379] = {
		Msg = "1、玩家等级达到<font color='0x01f801'>4</font>转，即可开启人物的【神兵】系统<br>2、每把神兵可镶嵌<font color='0x01f801'>5</font>个神兵装备，全部镶嵌后<font color='0x01f801'>出战时</font>获得战力加成<br>3、每个槽位需要镶嵌<font color='0x01f801'>指定</font>的神兵装备，且有<font color='0x01f801'>阶数</font>要求<br>4、神兵出战后额外激活<font color='0x01f801'>神兵技能</font>，大幅增加神兵属性<br>5、神兵最多出战<font color='0x01f801'>3</font>把",
		Remarks = "神兵系统说明",
	},
	[380] = {
		Msg = "神龙帝国内全新区域<font color='#01f801'>上古皇陵</font>开启，六大BOSS齐聚，危机四伏，随时都可能被传送出地图。<br><font color='#01f801'>结界</font>系统开放，为各系统提供<font color='#01f801'>百分比战力加成</font>；升级结界领悟<font color='#01f801'>五行之力</font>，战力提升百万！",
		Remarks = "皇陵外围系统说明",
	},
	[381] = {
		Msg = "全新跨服PVP玩法——<font color='#01f801'>人皇榜</font>开启，挑战其他玩家提升自己的排名，100%掉落<font color='#01f801'>魔兵碎片</font>奖励，激活魔兵战力疯狂提升。<br>每周结算排名奖励，排名越靠前奖励越丰厚，前<font color='#01f801'>10</font>更有<font color='#01f801'>专属称号</font>奖励！",
		Remarks = "人皇榜系统说明",
	},
	[382] = {
		Msg = "神龙帝国沙城中心区域——<font color='#01f801'>灭神魔殿</font>开放，守护神兽<font color='#01f801'>青龙</font>现身，跨越区服的较量，共同争夺高阶守护装备、<font color='#01f801'>灵龙守护</font>外形等稀有奖励。",
		Remarks = "灭魔神殿系统说明",
	},
	[383] = {
		Msg = "上古皇陵内部跨服区域——<font color='#01f801'>皇陵秘境</font>开启，更高难度的挑战，更高档次的收益，更加刺激的战斗。<br>朱雀、火雨两大结界，<font color='#01f801'>百万战力</font>的诱惑！",
		Remarks = "皇陵秘境系统说明",
	},
	[384] = {
		Msg = "跨服战场——<font color='#01f801'>暗影龙穴</font>，<font color='#01f801'>混沌</font>、<font color='#01f801'>穷奇</font>、<font color='#01f801'>饕餮</font>三大凶兽盘踞。<br><font color='#01f801'>极品守护装备</font>，<font color='#01f801'>灵龙守护</font>、<font color='#01f801'>冰心守护</font>两大外形。<br><font color='#01f801'>即将来袭</font>。",
		Remarks = "暗影龙穴系统说明",
	},
	[385] = {
		Msg = "请先激活神器{0}",
	},
	[386] = {
		Msg = "开服第二天开启<font color='#01f801'>荣耀之路</font>，挑战指定关卡收集神器碎片，开启<font color='#01f801'>神盾护体</font>，消耗魔法值抵扣伤害！<br>解锁神器，提升对怪伤害，激活<font color='#01f801'>死神</font>效果，<font color='#01f801'>斩杀生命值</font>！",
		Remarks = "荣耀之路系统说明",
	},
	[387] = {
		Msg = "1、开服第二天开启<font color='#01f801'>荣耀之路</font>，挑战指定关卡收集神器碎片，开启<font color='#01f801'>神盾护体</font>，消耗魔法值抵扣伤害！<br>2、解锁神器，提升对怪伤害，激活<font color='#01f801'>死神</font>效果，<font color='#01f801'>斩杀10%生命</font>！<br>3、每次挑战关卡均会获得<font color='#01f801'>挑战值</font>，挑战值随着挑战次数<font color='#01f801'>递增</font>，每天<font color='#01f801'>0</font>点重置<br>4、每分钟会自动降低<font color='#01f801'>1</font>点挑战值，挑战值低于<font color='#01f801'>100</font>点后方可继续挑战！",
		Remarks = "荣耀之路详细",
	},
	[388] = {
		Msg = "您尚未首充，领取首充奖励可购买",
		Remarks = "未首充时点击活动充值的提醒",
	},
	[389] = {
		Msg = "地防达到{0}",
	},
	[390] = {
		Msg = "水防达到{0}",
	},
	[391] = {
		Msg = "火防达到{0}",
	},
	[392] = {
		Msg = "风防达到{0}",
	},
	[393] = {
		Msg = "1、开服达到<font color='0x01f801'>30</font>天开启<font color='0x01f801'>元素殿堂</font>，玩家达到<font color='0x01f801'>8</font>转可进入<br>2、挑战元素殿堂BOSS可以获得<font color='0x01f801'>各阶觉醒装备</font><br>3、元素殿堂分为<font color='0x01f801'>三层</font>，层数越高，BOSS掉落奖励<font color='0x01f801'>越好</font><br>4、挑战一层<font color='0x01f801'>前三只</font>boss无特殊要求，除此外，每层boss均有不同的元素<font color='0x01f801'>防御</font>要求<br>5、元素防御有四种，分别是<font color='0x01f801'>地防</font>、<font color='0x01f801'>水防</font>、<font color='0x01f801'>火防</font>、<font color='0x01f801'>风防</font>，达到满足对应防御要求时才能挑战boss<br>6、元素殿堂<font color='0x01f801'>只有归属奖励</font>，无参与奖励，次数每天0点增加<font color='0x01f801'>2</font>次，最多保留<font color='0x01f801'>6</font>次",
		Remarks = "元素殿堂详细",
	},
	[394] = {
		Msg = "神龙帝国内全新区域<font color='#01f801'>元素殿堂</font>开启，挑战BOSS可获得各阶<font color='#01f801'>觉醒装备</font>、<font color='0x01f801'>御龙灵石</font>和<font color='0x01f801'>神兽灵石</font>。<br>提升元素防御，挑战更强大的BOSS，掌控元素之力！",
		Remarks = "元素殿堂系统说明",
	},
	[395] = {
		Msg = "1、开服达到<font color='0x01f801'>45</font>天开启<font color='0x01f801'>觉醒装备</font><br>2、觉醒装备可提供<font color='0x01f801'>元素攻击</font>、<font color='0x01f801'>元素防御</font>、<font color='0x01f801'>元素攻击穿透</font>和<font color='0x01f801'>元素防御强化</font><br>3、提升元素攻击可大幅提升造成的伤害<br>4、提升元素防御可大幅度降低受到的伤害<br>5、提升元素攻击穿透可降低目标单位一定比例的元素防御<br>6、提升元素防御强化可提升一定比例的元素防御<br>7、<font color='0x01f801'>元素攻击只生效最高的一种，并且只受到目标对应防御的影响</font>",
		Remarks = "觉醒装备详细",
	},
	[396] = {
		Msg = "激活点金手",
	},
	[397] = {
		Msg = "1、副本每周首次通关，将会获得<font color='0x01f801'>首通奖励</font>，可使用<font color='0x01f801'>扫荡</font>再次挑战已通关的副本<br>2、上一层所有副本全部通关后，才可继续挑战下一层<br>3、副本进度<font color='0x01f801'>每周重置一次</font>，排行及排行奖励，积分奖励也同样会重置<br>4、每周日晚22:00<font color='0x01f801'>锁死排名及积分</font>，不允许挑战副本，不再累加积分，不可领取积分奖励，直至次日0点<br>5、锁死排名半个小时后，通过邮件发放积分排名奖励；未领取的积分奖励，也将通过邮件发放<br>6、随着重置次数增多，奖励内容有几率变更或增多<br>7、任意元素攻击高于<font color='0x01f801'>540</font>，通关积分<font color='0x01f801'>+50%</font><br>  任意元素攻击高于<font color='0x01f801'>720</font>，通关积分<font color='0x01f801'>+60%</font><br>  任意元素攻击高于<font color='0x01f801'>840</font>，通关积分<font color='0x01f801'>+70%</font><br>  任意元素攻击高于<font color='0x01f801'>1050</font>，通关积分<font color='0x01f801'>+80%</font><br>  任意元素攻击高于<font color='0x01f801'>1200</font>，且任意元素穿透达到<font color='0x01f801'>20%</font>，通关积分<font color='0x01f801'>+90%</font><br>  任意元素攻击达到<font color='0x01f801'>1500</font>点，且任意元素穿透达到<font color='0x01f801'>40%</font>，通关积分<font color='0x01f801'>+100%</font>",
		Remarks = "元素圣域详内容",
	},
	[398] = {
		Msg = "开启全新元素副本——<font color='#01f801'>元素圣域</font>，奖励每周重置，强力<font color='#01f801'>觉醒装备</font>，助力元素殿堂。<br><font color='#01f801'>青龙</font>、<font color='#01f801'>白虎</font>、<font color='#01f801'>朱雀</font>、<font color='#01f801'>玄武</font>、<font color='#01f801'>麒麟</font>五大神兽镇守，等你来战。",
		Remarks = "元素圣域系统说明",
	},
	[399] = {
		Msg = "消耗<font color='#01f801'>{0}</font>元宝，可购买<font color='#01f801'>1</font>次挑战次数<br>今日已购买：{1}次<br>是否确认购买？",
		Remarks = "购买挑战次数",
	},
	[400] = {
		Msg = "升级需要消耗等级丹<font color='eldac0'>等级丹</font><br>第二行说明测试用<br>第三行说明还没编好<br>总共4行说明差不多了吧",
	},
	[401] = {
		Msg = "失落已久的帝国藏宝阁已开启",
	},
	[402] = {
		Msg = "满身阴魂，斩杀出宝",
	},
	[403] = {
		Msg = "吧啦吧啦吧啦吧啦吧啦吧啦<br>吧啦吧啦吧啦吧啦吧啦吧啦",
		Remarks = "无尽封魔副本内描述",
	},
	[404] = {
		Msg = "<font color='#d7a53c'>生命 18000  攻击 450-1200</font><br><font color='#dbc299'>每天首次死亡不掉落装备</font><br><font color='#dbc299'>背包界面可远程开启回收</font><br><font color='#dbc299'>每天免费领取100000元宝</font><br><font color='#dbc299'>每天免费领取5000威望值</font>",
		Remarks = "白金特权描述",
	},
	[405] = {
		Msg = "<font color='#d7a53c'>生命 27000  攻击 800-2000</font><br><font color='#dbc299'>每天额外赠送一次押镖任务</font><br><font color='#dbc299'>背包界面可远程开启仓库</font><br><font color='#dbc299'>激活灵宠自动拾取和自动回收</font><br><font color='#dbc299'>每天免费领取200000元宝</font>",
		Remarks = "钻石特权描述",
	},
	[406] = {
		Msg = "<font color='#d7a53c'>生命 45000  攻击 1600-4000</font><br><font color='#dbc299'>死亡时装备掉落几率降低30%</font><br><font color='#dbc299'>可免费一键完成除魔任务</font><br><font color='#dbc299'>每天免费领取300000元宝</font><br><font color='#dbc299'>每天免费领取10000威望值</font>",
		Remarks = "星耀特权描述",
	},
	[407] = {
		Msg = "经脉达到{0}",
	},
	[408] = {
		Msg = "穿戴一套{0}阶生肖装备",
	},
	[409] = {
		Msg = "消耗<font color='#01f801'>200</font>传奇币可购买<font color='#01f801'>1</font>寻宝积分，并赠送1把<font color='#01f801'>寻宝钥匙</font>",
		Remarks = "寻宝界面说明",
	},
	[410] = {
		Msg = "1、炎魔神狱共有<font color='0x01f801'>10</font>层，击杀每层BOSS均有几率爆出极品装备<br>2、击杀小怪可收集的<font color='0x01f801'>神狱令</font><br>4、本层BOSS死亡后消耗一定数量的<font color='0x01f801'>神狱令</font>领取奖励后通过传送门可进入下一层<br>5、该玩法死亡后<font color='0x01f801'>不会掉落</font>装备<br>6、<font color='0x01f801'>多倍领取</font>条件：VIP1可2倍领取，VIP4可4倍领取，VIP7可6倍领取，VIP10可8倍领取",
		Remarks = "炎魔神狱说明",
	},
	[411] = {
		Msg = "<font color='0x01f801'>炼魂装备获取：<br>1、开服第5天跨服主城BOSS有概率掉落。<br>2、开服活动获得。</font>",
		Remarks = "炼魂装备获取提示",
	},
	[412] = {
		Msg = "<font color='0x01f801'>生肖装备获取：<br>1、击杀300级以上的BOSS概率掉落。<br>2、寻龙图事件获得。",
		Remarks = "生肖装备获取提示",
	},
	[413] = {
		Msg = "<font color='0x01f801'>诛仙装备获取：<br>1、使用诛仙灵魂合成。<br>2、神龙宝藏中概率获得。</font>",
		Remarks = "诛仙装备获取提示",
	},
	[414] = {
		Msg = "<font color='0x01f801'>圣域装备获取：<br>1、开服第2天圣域BOSS概率掉落。<br>2、只要努力，小怪也能爆极品。</font>",
		Remarks = "圣装备获取提示",
	},
	[415] = {
		Msg = "<font color='0x01f801'>高阶人物战装获取：<br>1、击杀300级以上的BOSS概率掉落。<br>2、只要努力，小怪也能爆极品。</font>",
		Remarks = "普通装备提示",
	},
	[416] = {
		Msg = "1、幻兽只会受到<font color='0x01f801'>1</font>点伤害，可以单挑<font color='0x01f801'>任何BOSS</font>，阶级越高麻痹概率越高<br>2、升级幻兽增加人物<font color='0x01f801'>斩杀伤害</font>和<font color='0x01f801'>冰冻神技</font><br>3、开服快速升级幻兽至满级<font color='0x01f801'>70%</font>麻痹概率，再加超值特惠幻兽绝对麻痹30%加成达到<font color='0x01f801'>百分百麻痹</font>，轻松挂机打boss<br>4、满麻痹伤害爆炸幻兽，越早获得越早挑战超高级BOSS，<font color='0x01f801'>掉落极品兑换充值货币</font>，称霸全服<br>5、幻兽<font color='0x01f801'>跟随主人</font>攻击，但是在锁定目标后<font color='0x01f801'>不会更换</font>攻击目标",
		Remarks = "幻兽说明",
	},
	[417] = {
		Msg = "<font color='0xe27d07'>当前超爽大爆：{2}次</font><br>击杀<font color='0x01f801'>300级以上</font>的BOSS有概率掉落<font color='0x01f801'>粉装红装首饰</font><br>升级<font color='0x01f801'>VIP</font>可增加1次爆率<br><font color='0xe27d07'>当前幸运爆率：{0}次</font><br>击杀<font color='0x01f801'>300级以上</font>的BOSS有概率掉落<font color='0x01f801'>红装首饰</font><br>成为<font color='0x01f801'>至尊4</font>可增加1次爆率<br><font color='0xe332b7'>当前超级幸运爆率：{1}次</font><br>击杀<font color='0x01f801'>300级以上</font>的BOSS有概率掉落<font color='0xe70909'>顶级红装首饰</font><br>成为<font color='0x01f801'>至尊7</font>可增加1次爆率",
		Remarks = "幸运掉落说明",
	},
	[418] = {
		Msg = "<font color='0xe1dac0'>  当前保险次数：</font><font color='0x01f801'>{0}</font><font color='0xe1dac0'>次<br>  保护装备不掉落，触发后消耗一次保险次数，<font color='0x01f801'>兑换</font>或<font color='0x01f801'>分解</font>成其他装备后投保<font color='0x01f801'>不继承</font></font>",
		Remarks = "装备投保装备tips描述",
	},
	[419] = {
		Msg = "1、投保后装备获得<font color='#01f801'>1</font>次保险次数，可防止死亡掉落<br>2、投保需要消耗<font color='#01f801'>非绑定传奇币</font>，品阶<font color='#01f801'>越高</font>的装备消耗<font color='#01f801'>越大</font><br>3、已投保的装备<font color='#01f801'>不能重复</font>投保，次数耗尽后可再次投保<br>4、需要注意，处于保险状态的装备<font color='#01f801'>不能丢弃、交易、摆摊上架</font>，投保<font color='#01f801'>不能反悔</font>需谨慎<br>5、装备触发保险后消耗<font color='#01f801'>1</font>次保险次数，掉落<font color='#01f801'>一部分</font>投保消耗的传奇币<br>6、投保后的装备进行<font color='#01f801'>升阶</font>操作，投保的效果<font color='#01f801'>依旧有效</font>",
		Remarks = "装备投保规则",
	},
	[420] = {
		Msg = "1、法器目前开放<font color='#01f801'>4</font>个阶段，激活后可获得<font color='#01f801'>魔力转换</font>被动效果<br>2、每个法器需要激活<font color='#01f801'>4次</font>才能完全激活被动效果<br>3、法器的魔力转换只生效当前最高等级效果，<font color='#01f801'>不会重复生效</font><br>4、法器激活后可升级，升级增加基础属性<br>5、法器激活碎片及升级材料可在<font color='#01f801'>荣耀之路</font>玩法中获得",
		Remarks = "法器规则说明",
	},
	[421] = {
		Msg = "1、荣耀之路目前开放<font color='#01f801'>6</font>个章节，通关可获得<font color='#01f801'>法器</font>激活材料<br>2、每个章节有<font color='#01f801'>10个</font>小关，通关前置关卡才能挑战下一关，首次通关有首通奖励<br>3、挑战荣耀之路会增加挑战值，进入增加的挑战值会根据<font color='#01f801'>当天进入次数</font>而增加，挑战值达到100以上就无法挑战，挑战值<font color='#01f801'>每分钟</font>会减少<font color='#01f801'>1</font>点<br>4、挑战时还可以选择好友协助战斗，每个好友1天只能助战1次，0点刷新<br>5、推荐选择强力好友助战，挑战失败没有奖励，但会增加挑战值，请慎重。",
		Remarks = "荣耀之路说明",
	},
	[422] = {
		Msg = "1、激活灵宠后购买<font color='#01f801'>钻石</font>特权后可激活灵宠<font color='#01f801'>场景外观</font>及<font color='#01f801'>自动拾取</font>和<font color='#01f801'>自动回收</font>功能，灵宠不会打怪，可拾取角色周围一定范围的道具，背包满后自动回收已设置回收装备<br>2、特权到期后灵宠<font color='#01f801'>场景外观</font>及<font color='#01f801'>自动拾取</font>和<font color='#01f801'>自动回收</font>功能将会关闭，重新购买特权后可重新激活<br>3、灵宠被回收后，升级获得的属性<font color='#01f801'>依然生效</font>，并可继续升级灵宠<br>4、玩家可设置灵宠是否开启<font color='#01f801'>自动拾取</font>和<font color='#01f801'>自动回收</font>功能<br>5、部分玩法和副本地图灵宠不能被召唤",
		Remarks = "灵宠说明",
	},
	[423] = {
		Msg = "主人，背包满了，请及时回收垃圾装备哦~",
		Remarks = "灵宠背包满喊话",
	},
	[424] = {
		Msg = "1、灌注<font color='#01f801'>凝星石</font>和<font color='#01f801'>亘古星屑</font>可提升装备的星辰之力属性<br>2、星辰之力共<font color='#01f801'>10阶</font>，每阶<font color='#01f801'>六星</font>，每次星级提升都会增加属性<br>3、在<font color='#01f801'>荣誉商城</font>可花费<font color='#01f801'>荣誉值</font>兑换星辰之力升级道具，荣誉值可在跨服远征相关玩法中获得<br>4、星辰之力激发需要依托装备，如果该部位没有装备，星辰之力属性<font color='#01f801'>会失效</font><br>4、装备部位穿戴<font color='#01f801'>36阶及以上</font>装备可激活<font color='#01f801'>星辰属性额外加成400%</font>被动效果，PK打怪超人一等！",
		Remarks = "星辰之力规则说明",
	},
	[425] = {
		Msg = "1、共有多种特戒，可消耗对应特戒激活，激活后可获得<font color='#01f801'>强力技能</font><br>2、特戒激活后开放<font color='#01f801'>4个部位</font>，可分别进行升级获得属性<br>3、当特戒的4个部位都达到一定等级，可提升<font color='#01f801'>技能效果</font><br>4、特戒激活后，多余的特戒可在【锻造-分解】中分解成<font color='#01f801'>特戒之灵</font>，特戒之灵用于升级特戒部位<font color='#01f801'>特殊等级</font><br>5、特戒在<font color='#01f801'>跨服乱斗</font>活动中BOSS有概率掉落",
		Remarks = "特戒规则说明",
	},
	[426] = {
		Msg = "<font color='0x01f801'>武魂装备获取：<br>1、跨服阴阳魂殿BOSS有概率掉落。<br>2、运营活动获得。</font>",
		Remarks = "命魂装备获取提示",
	},
	[427] = {
		Msg = "1、开服<font color='#01f801'>105天</font>且角色<font color='#01f801'>10转</font>开启<br>2、每个战装部位可镶嵌<font color='#01f801'>8个</font>战纹，根据角色<font color='#01f801'>战纹总战力</font>开放镶嵌槽<br>3、同一部位同类型的战纹只能镶嵌1种，镶嵌后的战纹可<font color='#01f801'>无消耗无损</font>拆下<br>4、战纹可强化，品质越高的战纹<font color='#01f801'>强化等级上限</font>越高<br>5、多余的战纹可回收，<font color='#01f801'>已强化</font>过的战纹回收时<font color='#01f801'>返还全部</font>强化材料<br>6、战纹可在世界BOSS挑战中获得",
		Remarks = "战纹说明",
	},
	[428] = {
		Msg = "<font color='0x01f801'>天羽装备获取：<br>1、冰枫谷圣兽有概率掉落。<br>2、各地图福禄金猪有概率掉落。<br>3、运营活动获得。</font>",
		Remarks = "天羽装备获得提示",
	},
	[429] = {
		Msg = "1、双击或者拖动天羽装备可在对应部位穿戴天羽装备，角色属性暴涨<br>2、天羽装备分6个部位，3件和6件套可触发套装效果，加成<font color='0x01f801'>十步一杀</font>技能效果，PK超牛<br>3、穿戴天羽装备有光翼阶数要求，天羽装备阶数越高，需要光翼的阶数越高",
	},
	[430] = {
		Msg = "<font color='0x01f801'>至尊神器获取：<br>1、运营活动获得。</font>",
		Remarks = "至尊神器获得提示",
	},
	[431] = {
		Msg = "1、开服<font color='0x01f801'>15天</font>后，每个<font color='0x01f801'>周五的20点</font>开启，持续20分钟<br>2、活动期间，匹配到的跨服中，所有<font color='0x01f801'>加入同盟</font>的玩家均可进入活动地图参与活动。<br>3、活动开启之后，所有玩家需<font color='0x01f801'>摧毁</font>位于殿前的雕像，从而开启皇宫争夺，当皇宫内只有一个同盟时，该同盟获得<font color='0x01f801'>皇宫归属权</font>。<br>4、<font color='0x01f801'>每次</font>群雄逐鹿活动<font color='0x01f801'>都无守城方</font>。<br>5、获得皇宫归属的帮派会给参与活动的所有人持续加积分<br>6、活动结束时，获得皇宫<font color='0x01f801'>归属权</font>的同盟成为皇宫占领者。<br>7、活动结束时，如没有同盟获得皇宫归属权，则同盟<font color='0x01f801'>积分排名第一</font>的同盟成为沙城占领者。8、死亡掉落非绑定物品",
		Remarks = "群雄逐鹿面板规则",
	},
	[432] = {
		Msg = "1、活动期间，参与的沙城内成员<font color='0x01f801'>5秒</font>会获得一次积分奖励，指定目标积分可换取相应<font color='0x01f801'>积分礼包</font>。<br>2、活动开启内，击杀<font color='0x01f801'>玩家</font>跟击杀<font color='0x01f801'>守卫</font>都能获得积分奖励。<br>3、活动结束后，系统会根据自身的积分排名发放<font color='0x01f801'>个人排名奖励</font>。<br>4、活动结束后，皇宫<font color='0x01f801'>归属同盟</font>会获得奖励，胜利同盟中帮派<font color='0x01f801'>积分最高</font>的行会获得<font color='0x01f801'>一等奖</font>，<font color='0x01f801'>积分第二</font>的行会获得<font color='0x01f801'>二等奖</font>，积分<font color='0x01f801'>第三</font>的行会获得<font color='0x01f801'>三等奖</font>，其他的参与帮派会获得<font color='0x01f801'>安慰奖</font>。<br>5、奖励会发给参与的每个玩家。6、帮主奖励只有帮主才能获得，内含大量的<font color='0x01f801'>传奇币红包</font>，可发放给行会成员分享。",
		Remarks = "群雄逐鹿面板奖励规则",
	},
	[433] = {
		Msg = "行会拿下了龙城，成为了龙城霸主！",
		Remarks = "拿下沙巴克日志",
	},
	[434] = {
		Msg = "{0}秒后开启皇宫归属权争夺",
		Remarks = "雕像被毁后的提示",
	},
	[435] = {
		Msg = "{0}秒后攻城方可进攻殿前",
		Remarks = "攻城方进攻提醒",
	},
	[436] = {
		Msg = "守城方可直接进入殿前防守",
		Remarks = "守城方防守提醒",
	},
	[437] = {
		Msg = "1、开服<font color='0x01f801'>45天</font>后，每个<font color='0x01f801'>周日的20点</font>开启，活动持续20分钟<br>2、活动期间，成功匹配到的帮派玩家均可进入活动地图参与活动。<br>3、<font color='0x01f801'>每次</font>群雄逐鹿活动<font color='0x01f801'>都需要重新抢夺皇宫</font>。<br>4、活动开启之后，所有玩家需要<font color='0x01f801'>摧毁</font>位于殿前的雕像，从而开启皇宫的争夺，当皇宫内只有一个帮派时，该帮派获得<font color='0x01f801'>皇宫归属权</font>。<br>5、玩家杀死弓箭手，有<font color='0x01f801'>概率掉落增益</font>，拾取增益后，会给<font color='0x01f801'>参与玩法的所有行会人员</font>都加上<br>6、获得皇宫归属的帮派会给参与活动的所有人<font color='0x01f801'>持续加积分</font><br>7、攻城方可进入传送阵，传送阵将会把人随机传送到地图的4个点<br>8、活动结束时，获得皇宫<font color='0x01f801'>归属权</font>的帮派成为皇宫占领者，成为本次活动的胜利者，其帮主为<font color='0x01f801'>群雄霸主</font>。<br>9、活动结束时，如没有帮派获得皇宫归属权，则帮派<font color='0x01f801'>积分排名第一</font>的帮派成为皇宫占领者。<br>10、<font color='0x01f801'>只有参与了玩法才会获得奖励</font><br>11、活动中死亡<font color='0x01f801'>不掉落</font>自身装备</font><br>Tips：区服显示为帮主<font color='0x01f801'>合服前</font>的区服",
		Remarks = "跨服帮战规则说明",
	},
	[438] = {
		Msg = "1、<font color='0x01f801'>周日00:00至18:00</font>为报名时间<br>2、<font color='0x01f801'>在报名时间</font>，行会等级达到<font color='0x01f801'>3级</font>，且有<font color='0x01f801'>5个</font>超过<font color='0x01f801'>400级</font>的<font color='0x01f801'>在线</font>成员，可由<font color='0x01f801'>帮主或副帮主</font>报名和取消报名<br>3、报名成功，行会将<font color='0x01f801'>不可退出、加入和解散</font><br>4、<font color='0x01f801'>19:00公布</font>匹配对手，可在<font color='0x01f801'>群雄面板</font>中查看<br>5、匹配成功的帮派可以在活动开启时，<font color='0x01f801'>在此界面处直接</font>进入副本<br>",
		Remarks = "跨服帮战报名规则说明",
	},
	[439] = {
		Msg = "行会拿下了皇宫，成为了群雄霸主！",
		Remarks = "拿下皇宫日志",
	},
	[440] = {
		Msg = "{0}秒后开启皇宫归属权争夺",
		Remarks = "雕像被毁后的提示",
	},
	[441] = {
		Msg = "行会已由<font color='0x01f801'>{0}</font>成功<font color='0x01f801'>报名</font>群雄逐鹿，不要忘记时间哦！",
		Remarks = "行会报名群雄",
	},
	[442] = {
		Msg = "行会已由<font color='0x01f801'>{0}</font>取消报名群雄逐鹿！",
		Remarks = "取消报名群雄",
	},
	[443] = {
		Msg = "天外来客身上携带无尽的财宝，无数的勇士前来斩杀",
		Remarks = "天外来客说明",
	},
	[1001] = {
		Msg = "亲爱的玩家：<br>欢迎您的到来！<br>这是一款全新传奇挂机手游，战法道三大传统职业，呈现原汁原味的经典传奇风格，炫酷技能畅快新玩法，高福利高爆率助你一臂之力。<br>装备靠打，升级靠挂。上线就PK，杀人就爆装！兄弟百人，同夺龙城霸主之位。<r>客服QQ公众号：4000051591<br>客服电话：4000051591",
		Remarks = "高热开服游戏公告",
	},
	[1002] = {
		Msg = "1、该玩法死亡后<font color='0x01f801'>不会掉落</font>装备",
		Remarks = "杀我爆元宝活动",
	},
	[1003] = {
		Msg = "任务说明：<br>免费刷新次数用完后，每次刷新消耗　　　<font color='#d7a53c'>50</font><br>一键刷新后<font color='#01f801'>4</font>个任务均是4星橙色。",
		Remarks = "随机BOSS任务睡眠",
	},
	[1004] = {
		Msg = "1、遗迹探险分为两个阶段：前8分钟为全民探险，后7分钟为普天同庆。<br>2、全民探险阶段：选择2个藏宝位置中的一个进行挖宝，挖宝后藏宝位置刷新。<br>3、普天同庆阶段：玩家可前往龙柱所在的绿色区域，在龙柱范围内每过数秒可获得一次普天同庆奖励，并且在龙柱范围中使用铁铲挖宝，挖掘的奖励更为丰富。<br>4、活动开启后在地图中央处会出现一只携带大量奖励的宝藏守护者，BOSS被击杀后归属者可获得海量的珍稀奖励。<br>5、铁铲有60秒的使用冷却时间。<br>6、遗迹探险玩法死亡后<font color='0x01f801'>不会掉落</font>任何装备。",
		Remarks = "全民寻宝规则说明",
	},
	[1005] = {
		Msg = "1、逆魔古阵有<font color='0x01f801'>10</font>层，每层四方向各存着一个法阵，选中正确的方向进入下一层，失败则倒退<font color='0x01f801'>1</font>～<font color='0x01f801'>3</font>层。<br>2、进入<font color='0x01f801'>10</font>层的玩家可点击守卫领取大量奖励，领取奖励之后，还能进入最后的BOSS巢穴，击杀最终BOSS<br>3、该玩法死亡后<font color='0x01f801'>不会掉落</font>装备",
		Remarks = "逆魔玩法介绍",
	},
	[1006] = {
		Msg = "1、打我爆极品里面的怪物是共享归属的，击杀BOSS后大家都可以拾取奖励<br>2、红装福利开服前3天必定掉落红装，千万不要错过！<br>3、该玩法死亡后<font color='0x01f801'>不会掉落</font>装备",
		Remarks = "打我爆极品玩法介绍",
	},
	[1007] = {
		Msg = "1、角色<font color='0x01f801'>转生等级</font>达到条件后可挑战兽巢<br>2、最多可<font color='0x01f801'>3人</font>组队，推荐组队进入，单人也可进入<br>3、只有通关当前区域才能进入下一区域<br>4、每<font color='0x01f801'>周二、周六</font>重置首杀，仅首杀可获得通关奖励",
		Remarks = "兽巢规则说明",
	},
	[1008] = {
		Msg = "1、随机匹配对手，通过击败对手来提升段位。<br>2、段位从低到高分别是青铜、白银、黄金、钻石、星耀、最强王者，每段又分3阶。<br>3、玩家从青铜·3阶开始挑战，每次胜利可获得1颗星，集满5星即可升阶。<br>4、每周日22点至周一10点为休战时间，周日22点30分根据段位发放<font color='#d7a53c'>荣誉宝箱</font>。<br>5、赛季结算时，排行榜前5的玩家还能获得额外的<font color='#d7a53c'>王者宝箱</font>，只有最强王者才能上榜，按王者星级数排名。<br>6、每次挑战胜利有概率获得<font color='#d7a53c'>随机绝学</font>奖励。<br>7、赛季结算后，玩家段位会重置到青铜·3阶。",
		Remarks = "(竞技场)竞技场规则说明",
	},
	[1009] = {
		Msg = "1、活动开启之后，所有玩家需<font color='0x01f801'>摧毁</font>城门，从而开启皇宫争夺，最终成功获得皇宫归属权的行会为<font color='0x01f801'>沙城占领者</font>。<br>2、开服/合服<font color='0x01f801'>首次</font>沙城争霸活动<font color='0x01f801'>无守城方</font>。其他时间守城方为上一次占领沙城的行会，攻城方为其他行会。<br>3、城门被摧毁后，正式开启皇宫归属权争夺。守城方玩家可<font color='0x01f801'>提前</font>进入皇宫占位。<br>4、活动结束时，获得皇宫<font color='0x01f801'>归属权</font>的行会成为沙城占领者。<br>5、活动结束时，如没有行会获得皇宫归属权，则行会<font color='0x01f801'>积分排名第一</font>的行会成为沙城占领者。<br>6、行会成员才会获得积分",
		Remarks = "沙城争霸规则说明",
	},
	[1010] = {
		Msg = "1、龙神秘宝是一个玩家以<font color='0x01f801'>行会</font>为单位，参与争夺阵营内秘宝的玩法<br>2、召集行会人员共同抢夺秘宝，夺得后每个<font color='0x01f801'>固定时间点</font>，夺得秘宝行会，整个行会参与人员都可以获得一次奖励，同时秘宝会重新刷至出生点，重新抢夺",
		Remarks = "龙神秘宝规则说明",
	},
	[1011] = {
		Msg = "<font color='0x01f801'>11:00-12:00</font>和<font color='0x01f801'>21:00-22:00</font>为双倍押镖时间，期间内押镖可获得双倍奖励。",
		Remarks = "押镖规则说明",
	},
	[1012] = {
		Msg = "双击物品即可进行上架操作。<br>出售成功的物品，摆摊收益有邮件的形式发放。",
		Remarks = "摆摊说明1",
	},
	[1013] = {
		Msg = "列表中只显示物品单价，如需多份购买，请选择数量。<br>购买物品时，请仔细确认，以免造成财产损失。",
		Remarks = "摆摊说明2",
	},
	[1014] = {
		Msg = "1、进入条件：开服<font color='0x01f801'>8</font>天开启<br>2、参与条件：角色达到<font color='0x01f801'>4</font>转。<br>3、次数规则：每日0点回复3次归属和协助次数，最多积累<font color='0x01f801'>9</font>次。<br>4、协助规则：<font color='0x01f801'>同行会</font>的人获得BOSS归属奖励时，自己将获得<font color='0x01f801'>协助奖励</font>。<br>5、开服<font color='0x01f801'>20</font>天开启暗影龙穴系统，与跨服战场共享归属和协助次数。<br>6、跨服战场与暗影龙穴均有掉落保护，PK爆装几率为其他地图的一半。",
		Remarks = "跨服战场说明",
	},
	[1015] = {
		Msg = "1、活动时间：<font color='0x01f801'>10:00</font>-<font color='0x01f801'>10:15</font>、<font color='0x01f801'>16:30</font>-<font color='0x01f801'>16:45</font><br>2、参与条件：<font color='0x01f801'>150级</font><br>3、副本共计<font color='0x01f801'>15</font>分钟，进入地图后，地图会随机刷新30只小金猪。<br>4、金猪是不计其数的，地图中的金猪<font color='0x01f801'>全部被击杀</font>完后，即会重新刷新一波新的金猪<br>5、只要实力足够强，就能最大程度获得更丰厚的奖励。",
		Remarks = "金猪送礼规则说明",
	},
	[1016] = {
		Msg = "1、行会中有多只神兽，可以消耗<font color='0x01f801'>不同品质</font>的贡品来喂养神兽。<br>2、每次喂满之后，只有<font color='0x01f801'>帮主和副帮主</font>可以召唤神兽，开启神兽祭坛副本。<br>3、祭坛中的神兽十分强大，记得带上帮中的小伙伴一起击杀，击杀后<font color='0x01f801'>参与击杀的每个人</font>都能获得一份奖励哦。",
		Remarks = "行会祭坛规则",
	},
	[1017] = {
		Msg = "1、在<font color='0x01f801'>任意地图</font>击杀一名玩家，则获得<font color='0x01f801'>1点</font>杀意值<br>2、A玩家被B玩家重复击杀时，<font color='0x01f801'>30分钟</font>内无法再次被计数<br>3、每周一<font color='0x01f801'>0点</font>重置杀意值<br>4、当杀意值相同时，<font color='0x01f801'>先达者</font>优先<br>5、各等级段可击杀玩家的等级规则如下<br><font color='0x01f801'>1-3天</font>      上榜计数条件：<font color='0x01f801'>300级</font>        击杀玩家：<font color='0x01f801'>250级</font>以上生效<br><font color='0x01f801'>4-7天</font>      上榜计数条件：<font color='0x01f801'>350级</font>        击杀玩家：<font color='0x01f801'>300级</font>以上生效<br><font color='0x01f801'>8-15天</font>    上榜计数条件：<font color='0x01f801'>400级</font>        击杀玩家：<font color='0x01f801'>350级</font>以上生效<br><font color='0x01f801'>16-30天</font>  上榜计数条件：<font color='0x01f801'>400级</font>        击杀玩家：<font color='0x01f801'>380级</font>以上生效<br><font color='0x01f801'>30天</font>以后 上榜计数条件：<font color='0x01f801'>400级</font>        击杀玩家：<font color='0x01f801'>400级</font>以上生效",
		Remarks = "诛神榜规则",
	},
	[1018] = {
		Msg = "1、天赋种类分生存系和输出系，选择其中一个升级路线后不可升级另外一条，可通过洗点水重置天赋点重新选择。<br>2、升级天赋消耗天赋点，升级封号可获得基础天赋点，并增加天赋卷轴使用上限，1天赋卷轴增加1天赋点。<br>3、升级封号需要消耗功勋，卧龙山庄玩法中可获得大量功勋。",
		Remarks = "天赋说明",
	},
	[1020] = {
		Msg = "需转职战士",
		Remarks = "三职业条件",
	},
	[1021] = {
		Msg = "需转职法师",
		Remarks = "三职业条件",
	},
	[1022] = {
		Msg = "需转职道士",
		Remarks = "三职业条件",
	},
	[1141] = {
		Msg = "1、背包格子<font color='0x01f801'>+55</font><br>2、免费领取<font color='0x01f801'>至尊11</font>豪礼<br>3、PK加成<font color='0x01f801'>11%</font><br>4、回收道具获得元宝加成<font color='0x01f801'>24%</font><br>5、每日使用寻龙图次数<font color='0x01f801'>+24</font><br>6、每日免费原地复活次数<font color='0x01f801'>+6</font><br>7、幸运爆率次数<font color='0x01f801'>+1</font><br>8、超级幸运爆率次数<font color='0x01f801'>+1</font>",
		Remarks = "至尊11特权说明",
	},
	[1142] = {
		Msg = "1、背包格子<font color='0x01f801'>+60</font><br>2、免费领取<font color='0x01f801'>至尊12</font>豪礼<br>3、PK加成<font color='0x01f801'>12%</font><br>4、回收道具获得元宝加成<font color='0x01f801'>26%</font><br>5、每日使用寻龙图次数<font color='0x01f801'>+26</font><br>6、每日免费原地复活次数<font color='0x01f801'>+6</font><br>7、幸运爆率次数<font color='0x01f801'>+1</font><br>8、超级幸运爆率次数<font color='0x01f801'>+1</font>",
		Remarks = "至尊12特权说明",
	},
	[1143] = {
		Msg = "1、背包格子<font color='0x01f801'>+65</font><br>2、免费领取<font color='0x01f801'>至尊13</font>豪礼<br>3、PK加成<font color='0x01f801'>13%</font><br>4、回收道具获得元宝加成<font color='0x01f801'>28%</font><br>5、每日使用寻龙图次数<font color='0x01f801'>+28</font><br>6、每日免费原地复活次数<font color='0x01f801'>+7</font><br>7、幸运爆率次数<font color='0x01f801'>+1</font><br>8、超级幸运爆率次数<font color='0x01f801'>+1</font>",
		Remarks = "至尊13特权说明",
	},
	[1144] = {
		Msg = "1、背包格子<font color='0x01f801'>+70</font><br>2、免费领取<font color='0x01f801'>至尊14</font>豪礼<br>3、PK加成<font color='0x01f801'>14%</font><br>4、回收道具获得元宝加成<font color='0x01f801'>30%</font><br>5、每日使用寻龙图次数<font color='0x01f801'>+30</font><br>6、每日免费原地复活次数<font color='0x01f801'>+7</font><br>7、幸运爆率次数<font color='0x01f801'>+1</font><br>8、超级幸运爆率次数<font color='0x01f801'>+1</font>",
		Remarks = "至尊14特权说明",
	},
	[1145] = {
		Msg = "<font color='#dbc299'>升级只能通过<font color='0x01f801'>等级丹</font>升级<br>可以通过等级丹碎片合成等级丹<br>高等级地图更高概率产出高级等级丹</font>",
		Remarks = "等级说明",
	},
	[1146] = {
		Msg = "保护等级：10<br><font color='#c9cacc'>处于保护等级死亡不爆装</font>",
		Remarks = "等级保护",
	},
	[1147] = {
		Msg = "1、圣域BOSS地图是一个<font color='0x01f801'>公共地图场景</font>，玩家们一起争夺BOSS的归属权，玩家死亡不会爆装备。<br>2、进入需要消耗挑战次数，挑战次数上限为<font color='0x01f801'>12</font>次，每隔<font color='0x01f801'>2小时</font>会恢复一次。<br>3、BOSS被击杀后其他玩家获得<font color='0x01f801'>参与奖励</font>，拥有BOSS归属权的玩家获得稀有道具爆率为<font color='0x01f801'>5倍</font>的<font color='0x01f801'>归属奖励</font>。<br>4、BOSS被击杀后一定时间后会复活，届时玩家可再次挑战。<br>5、BOSS特殊掉落：<font color='0x01f801'>圣域装备</font><br>",
		Remarks = "圣域boss规则说明",
	},
	[1148] = {
		Msg = "活动期间，全服寻宝<font color='0x01f801'>8888</font>次必出以上物品",
		Remarks = "8888续寻宝描述文字",
	},
	[1149] = {
		Msg = "每个羽毛消耗<font color='0x01f801'>50传奇币</font>",
	},
	[1150] = {
		Msg = "<font color='0xe70909'>当前升级目标不满足穿戴条件</font>",
		Remarks = "圣装升级提示",
	},
	[1151] = {
		Msg = "投入传奇币炼制，有几率获得双倍守护精元！",
	},
	[1152] = {
		Msg = "1、秘境BOSS地图是一个<font color='0x01f801'>公共地图场景</font>，玩家们一起争夺BOSS的归属权，玩家死亡不会爆装备。<br>2、进入需要消耗挑战次数，挑战次数上限为<font color='0x01f801'>3</font>次，每天<font color='0x01f801'>0点</font>恢复。<br>3、BOSS被击杀后其他玩家获得<font color='0x01f801'>参与奖励</font>，拥有BOSS归属权的玩家获得稀有道具爆率为<font color='0x01f801'>5倍</font>的<font color='0x01f801'>归属奖励</font>。<br>4、BOSS被击杀后一定时间后会复活，届时玩家可再次挑战。<br>5、BOSS特殊掉落：<font color='0x01f801'>神兵装备</font>",
		Remarks = "秘境boss规则说明",
	},
	[1153] = {
		Msg = "     500万悬赏活动持续</font><font color='0x01f801'>7天</font>，前5天每天会开放各种BOSS击杀任务，达成击杀数即可领取奖励，完成全部任务最多可领取</font><font color='0x01f801'>500万</font>元宝，至尊玩家可以</font><font color='0x01f801'>双倍领取</font>，此外完成全部任务还能领取</font><font color='0xe70909'>海军上将</font>限定时装哦！",
		Remarks = "500万悬赏活动说明",
	},
	[1154] = {
		Msg = "我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明我是说明",
		Remarks = "灵兽说明",
	},
	[1155] = {
		Msg = "1、<font color='0x01f801'>火龙级</font>以上的装备可以和对应部位的特殊装备融合<br>2、融合后的基础装备保留原有属性和强化，并获得特殊装备的额外属性<br>3、融合后特殊装备的强化不继承到基础装备<br>4、融合过的装备不可再次融合<br>5、仅可拆分背包里面已融合的装备",
		Remarks = "星装说明",
	},
	[1156] = {
		Msg = "1、虚空BOSS地图是一个<font color='0x01f801'>公共地图场景</font>，玩家们一起争夺BOSS的归属权，玩家死亡不会爆装备。<br>2、进入需要消耗挑战次数，挑战次数上限为<font color='0x01f801'>5</font>次，每隔<font color='0x01f801'>2小时</font>会恢复一次。<br>3、BOSS被击杀后其他玩家获得<font color='0x01f801'>参与奖励</font>，拥有BOSS归属权的玩家获得稀有道具爆率为<font color='0x01f801'>5倍</font>的<font color='0x01f801'>归属奖励</font>。<br>4、BOSS被击杀后一定时间后会复活，届时玩家可再次挑战。<br>5、BOSS特殊掉落：<font color='0x01f801'>八卦装备、圣域装备</font>",
		Remarks = "虚空boss规则说明",
	},
	[1157] = {
		Msg = "能量增长：</font><font color='0x01f801'>持续在线、使用<font color='0xe70909'>修罗卡</font>，可累计能量值</font>",
		Remarks = "修罗副本面板说明",
	},
	[1158] = {
		Msg = "玩法说明：<br>1、能量值累积到<font color='0x01f801'>100%</font>，增加<font color='0x01f801'>1次</font>开启修罗秘境副本的次数，每天可进入次数增加5次后能量值<font color='0x01f801'>不再增加</font><br>2、角色每<font color='0x01f801'>在线</font>1分钟，能量值增加1%，使用<font color='0x01f801'>修罗卡</font>也可增加能量值，击杀300级以上的BOSS均有<font color='0x01f801'>概率掉落</font><br>3、开服<font color='0x01f801'>60天</font>开启扫荡，扫荡直接获得<font color='0x01f801'>最高档奖励</font>",
		Remarks = "修罗秘境规则说明",
	},
	[1159] = {
		Msg = "1.在闯过通天塔1层后，自动开启挂机助手。<br>2.挂机助手会自动挑战已通过层数的领主及精英。<br>3.挂机助手最多开启12小时，12小时后需收取装备后才可启用。<br>4.回收装备获得传奇币为绑定传奇币<br>5.战斗记录最多保留30条。",
		Remarks = "离线挂机说明",
	},
	[1160] = {
		Msg = "1、角色达到10转开启<font color='0x01f801'>雷神</font>系统，激活雷神战装可增加海量属性<br>2、激活雷神战装可使穿戴角色对应装备槽的<font color='0x01f801'>装备品质</font>提升至<font color='0x01f801'>金色</font><br>3、激活10件雷神战装可觉醒逆天神技-<font color='0x01f801'>雷霆之力</font>，PK超强！",
		Remarks = "雷神说明",
	},
	[1161] = {
		Msg = "总武魂解放达到{0}",
		Remarks = "阴阳魂殿进入所需要的分数",
	},
	[1162] = {
		Msg = "1、开服达到<font color='0x01f801'>70</font>天开启<font color='0x01f801'>阴阳魂殿</font>，玩家达到<font color='0x01f801'>8</font>转可进入<br>2、阴阳魂殿BOSS可以获得<font color='0x01f801'>武魂系列装备</font>，武魂装备附带随机属性，属性越好武魂解放值越高<br>3、阴阳魂殿总计<font color='0x01f801'>40层</font>，分为黑白二殿，层数越高，BOSS掉落奖励<font color='0x01f801'>越好</font><br>4、挑战<font color='0x01f801'>前四只</font>boss无特殊要求，除此外，每四层boss均有不同的<font color='0x01f801'>总武魂解放分数</font>要求<br>5、阴阳魂殿<font color='0x01f801'>只有归属奖励</font>，无参与奖励，次数每天0点增加<font color='0x01f801'>2</font>次，最多保留<font color='0x01f801'>6</font>次<br>6、阴阳魂殿产出多余的<font color='0x01f801'>武魂系列装备</font>，可以在<font color='0x01f801'>锻造-分解</font>中，分解获得<font color='0x01f801'>锻造-分解</font>",
		Remarks = "阴阳魂殿说明",
	},
	[1163] = {
		Msg = "跨服乱斗未开启",
		Remarks = "跨服乱斗",
	},
	[1164] = {
		Msg = "1、限时活动，点击卡牌消耗<font color='#01f801'>仙灵宝鉴</font>进行探宝，每次探索可从展示奖励中抽取一种<br>2、共有2种宝藏秘境，<font color='#01f801'>珍宝阁、山海观</font>分别对应<font color='#01f801'>凡、绝</font>刷新，奖励越来越好，可消耗对应币种刷新<br>3、刷新后每轮奖池持续<font color='#01f801'>8小时</font>，时间到或者全部探索完后自动刷新成<font color='#01f801'>凡级奖池</font><br>4、探索需要消耗<font color='#01f801'>仙灵宝鉴</font>，可用传奇币购买<br>5、刷新奖池后当前的探索记录和奖池都会重置，请考虑清楚后操作<br>6、<font color='#01f801'>珍宝阁</font>可探索到<font color='#01f801'>凡·≮子鼠≯</font>和<font color='#01f801'>凡·≮丑牛≯</font>，刷新·绝对应的<font color='#01f801'>山海观</font>可探索到<font color='#01f801'>2阶鼠牛</font>、<font color='#01f801'>特戒之灵</font>和<font color='#01f801'>擒龙手残页</font>，擒龙手残页可合成<font color='#01f801'>擒龙手技能书</font>",
		Remarks = "仙灵宝藏活动说明",
	},
	[1165] = {
		Msg = "1、进入条件：开服<font color='0x01f801'>45</font>天开启<br>2、参与条件：遗迹分为两层，第一层角色达到<font color='0x01f801'>6</font>转<br>可进入，第二层角色达到<font color='0x01f801'>12</font>转可进入<br>3、次数规则：进入副本扣除1次进入次数，每日0点回复<font color='0x01f801'>2</font>次进入次数，最多积累<font color='0x01f801'>6</font>次<br>4、进入跨服遗迹后，每分钟增加<font color='0x01f801'>1点</font>探险值，若被其他玩家击杀增加<font color='0x01f801'>2点</font>探险点值，击杀BOSS增加探险点值显示在副本内右侧信息栏内BOSS头像上<br>5、探险值大于等于<font color='0x01f801'>100点</font>时，倒计时5秒后会被传出地图<br>5、跨服遗迹地图中分别存在<font color='0x01f801'>6</font>只大BOSS，<font color='0x01f801'>10</font>只小BOSS，固定地点刷新，玩家需要争夺BOSS<font color='0x01f801'>归属</font>获得奖励<br>6、跨服遗迹PK<font color='0x01f801'>爆装几率</font>为其他地图的一半",
		Remarks = "跨服遗迹说明",
	},
	[1166] = {
		Msg = "1、开服<font color='0x01f801'>45</font>天开启法阵系统<br>2、法阵分为6种，前面<font color='0x01f801'>3</font>种可通过<font color='0x01f801'>跨服遗迹</font>玩法获得<br>3、每个法阵对应一套<font color='0x01f801'>天赋</font>，激活法阵可获得对应的天赋，天赋可额外提升主角属性<br>4、法阵等级可消耗<font color='0x01f801'>法阵精魄</font>来提升，法阵达到一定等级后，想继续提升则需要提升对应的天赋等级来提升<br>5、天赋等级可通过消耗<font color='0x01f801'>天赋对应的法阵</font>来提升<br>6、法阵天赋通过点开法阵<font color='0x01f801'>技能图标，打开天赋界面升级</font>",
		Remarks = "法阵说明",
	},
	[1168] = {
		Msg = "不满足进入条件",
		Remarks = "幻兽园说明",
	},
	[1169] = {
		Msg = "1、活动时间：<font color='0x01f801'>21:00</font>-<font color='0x01f801'>21:15</font><br>2、参与条件：<font color='0x01f801'>3转</font><br>3、副本共计<font color='0x01f801'>15</font>分钟，进入地图后，地图会随机刷新幻兽，pk不掉落装备。<br>4、幻兽总数不限，地图中的幻兽<font color='0x01f801'>全部被击杀</font>完后，会刷新一波新的幻兽<br>5、只要打的够快，就能无限获得皮肤碎片。",
		Remarks = "幻兽园面板显示规则",
	},
	[1170] = {
		Msg = "1、充值累积达到指定金额可获得福利转盘转动<font color='0x01f801'>次数</font>，且每次获得次数的要求是<font color='0x01f801'>递增</font>的<br>2、转盘的奖励只会获得一次，转完转盘可获得<font color='0x01f801'>全部奖励</font><br>3、福利转盘活动开服第<font color='0x01f801'>7</font>天结束",
		Remarks = "福利转盘规则",
	},
	[1171] = {
		Msg = "1、角色达到10转可消耗巃皇装备升级<font color='0x01f801'>巃皇</font>系统，激活巃皇战装可增加海量属性<br>2、激活巃皇战装后角色对应装备槽的<font color='0x01f801'>装备品质</font>会展示<font color='0x01f801'>专属底纹</font><br>3、激活10件巃皇战装可觉醒逆天神技-<font color='0x01f801'>巃皇之气</font>，PK超强！",
		Remarks = "巃皇说明",
	},
	[1172] = {
		Msg = "<font color='0x01f801'>诛仙装备获取：<br>1、至尊礼包购买。<br>2、神龙宝藏中概率获得。</font>",
		Remarks = "诛仙武器衣服获取提示",
	},
	[1173] = {
		Msg = "1、<font color='0x01f801'>每周二四六日19:00</font>开启<br>2、<font color='0x01f801'>5V5</font>持续5分钟，击杀BOSS和敌对玩家可获得<font color='0x01f801'>个人贡献</font>，时间结束后，贡献总和更高的一方获得胜利。<br>3、战场结算胜方获得<font color='0x01f801'>5000荣誉值</font>，败方<font color='0x01f801'>2000荣誉值</font>，<font color='0x01f801'>24小时</font>恢复一次。<br>4、战场内死亡不会掉落，<font color='0x01f801'>贡献</font>低于<font color='0x01f801'>100</font>和<font color='0x01f801'>逃兵</font>不会获得结算奖励。",
		Remarks = "荣誉战场规则说明",
	},
	[1174] = {
		Msg = "魔器专用",
		Remarks = "魔器专用规则说明",
	},
	[1175] = {
		Msg = "神铸总等级达到{0}",
		Remarks = "神铸等级条件说明",
	},
	[1176] = {
		Msg = "VIP{0}级可购买",
		Remarks = "平台vip礼包（购买）说明",
	},
	[1177] = {
		Msg = "<font color='0xfcd123'>愈战愈勇</font><br>每次死亡可获得一层BUFF，积分落后方死亡复活时可额外获得1层BUFF，每层BUFF可增加<font color='0xfcd123'>30%</font>角色基础属性，击杀敌对玩家后消失",
		Remarks = "荣誉战场bufftips文本",
	},
	[1178] = {
		Msg = "成功之路，从头开始",
		Remarks = "摆摊的公告词",
	},
	[1179] = {
		Msg = "1、开服<font color='0x01f801'>30天</font>开启王者争霸，<font color='0x01f801'>8转及以上</font>玩家可参与，每日<font color='0x01f801'>20:20-21:00</font>开放<font color='0x01f801'>全平台</font>跨服排位<br>2、玩法共有<font color='0x01f801'>6个</font>段位：<font color='0xfcd123'>青铜、白银、黄金、钻石、王者、霸主</font>，积累一定的星级可自动晋升下个段位，霸主段位没有星级限制<br>3、每周日结算后，玩家段位重置，<font color='0xfcd123'>上周王者、霸主段位重置至白银，其余段位重置清零</font><br>4、每局游戏计时<font color='0x01f801'>3分钟</font>，游戏分成红、蓝两方，<font color='0xfcd123'>当一方所有人员无复活次数或者时间走完</font>，游戏结束<br>5、杀死一人可得<font color='0x01f801'>50荣誉值</font>，每人有<font color='0x01f801'>3次复活</font>的机会<br>6、胜利方奖励<font color='0x01f801'>500荣誉值</font>，失败方奖励<font color='0x01f801'>200荣誉值</font><br>7、红蓝两方击杀数相同时，先达到的一方胜利<br>8、提前退出副本将视为逃兵，无法获取奖励<br>9、匹配面板中显示的战力为你的<font color='0x01f801'>巅峰战力</font><br>10、玩家进入游戏后，可以在<font color='0x01f801'>新的面板</font>中，选择自己心仪的<font color='0x01f801'>增益</font>，它将帮助你赢下比赛<br>11、福利机制：玩家<font color='0x01f801'>每次失败后</font>会获得<font color='0x01f801'>隐藏的积分</font>，当玩家取得<font color='0x01f801'>胜利时</font>隐藏的积分<font color='0x01f801'>有概率</font>为玩家额外<font color='0x01f801'>增加胜利场次</font>，<font color='0x01f801'>钻石1星后</font>该<font color='0x01f801'>福利机制不生效！</font>",
		Remarks = "王者争霸规则说明",
	},
	[1180] = {
		Msg = "1、每局游戏计时<font color='0x01f801'>3分钟</font><br>2、游戏分成红、蓝两方，<font color='0xfcd123'>当一方所有人员无复活次数或者时间走完</font>，游戏结束<br>3、杀死一人可得<font color='0x01f801'>50荣誉值</font>，每人有<font color='0x01f801'>3次复活</font>的机会<br>4、胜利方奖励<font color='0x01f801'>500荣誉值</font>，失败方奖励<font color='0x01f801'>200荣誉值</font><br>5、红蓝两方击杀数相同时，先达到的一方胜利<br>6、提前退出副本将视为逃兵，无法获取奖励<br>7、玩家可以在选择增益时，也可以查看其他人选择了什么",
		Remarks = "王者争霸对战规则说明",
	},
	[1181] = {
		Msg = "1、高级挂机功能：可在自己选定的地图，<font color='0x01f801'>稳定挂机</font>，玩家死亡后，辅助会帮玩家<font color='0x01f801'>安全复活至主城</font>，并重新返回勾选地图挂机<br>2、高级挂机和普通挂机不同，高级挂机只能在该界面开启，开启后普通挂机中自动使用<font color='0x01f801'>回城石</font>的功能失效<br>3、玩家可在【停止挂机】选项中选择自己所需死亡后的停止挂机次数<br>4、挂机之前玩家还可以<font color='0x01f801'>怪物过滤</font>中自定义手动勾选需要打的怪物以及在选择在当前地图<font color='0x01f801'>随机X次后</font>更换当前地图的选项来更为合理的挂机<br>5、随机X次后更换的地图在会在除当前地图外<font color='0x01f801'>勾选的地图</font>中随机选择进入挂机<br>6、低血保护功能：设置血量低于目标血量后会快速飞至治疗师处免费治疗",
		Remarks = "高级辅助规则",
	},
	[1182] = {
		Msg = "1、进入条件：开服<font color='0x01f801'>60天且8转</font>开启<br>2、BOSS每日固定<font color='0x01f801'>8点、16点、24点</font>刷新<br>3、协助奖励：<font color='0x01f801'>同行会</font>的人如果得到了BOSS的归属奖励，自己也将获得<font color='0x01f801'>协助奖励</font><br>4、点击boss头像可快速自动寻路",
		Remarks = "冰雪神殿规则说明",
	},
	[1185] = {
		Msg = "应国家法规要求：未成年人每日游戏时间<font color='0x01f801'>不得超过90分钟</font>且<font color='0x01f801'>每日22时至次日8时</font>，无法为未成年人提供游戏服务，请您合理安排时间！",
		Remarks = "未成年人防沉迷系统规则说明",
	},
	[1187] = {
		Msg = "1、活动开启时间：<font color='0xfcd123'>每周一、三、五19:30-20:00</font><br>2、开服<font color='0x01f801'>45</font>天且角色<font color='0x01f801'>8转</font>可参与。<br>3、匹配成功后开启<font color='0x01f801'>勇者</font>副本，持续<font color='0x01f801'>10</font>分钟，峡谷内固定位置会刷5个积分点，通关占领积分点、击杀积分怪和敌阵玩家获得积分。<br>4、时间结束后，阵营总积分高的一方获胜，发放胜者奖励，失败方获得鼓励奖；同时按峡谷内个人积分高低发放<font color='0x01f801'>个人排名奖励</font>，奖励统一通过<font color='0x01f801'>邮件发放</font>。<br>5、提前退出峡谷的玩家会被视为<font color='0x01f801'>逃兵</font>，结算时不会有任何奖励，玩家死亡后获得<font color='0x01f801'>复仇buff</font>。<br>6、积分规则：每个积分点归属阵营玩家获得<font color='0x01f801'>30分/5秒</font>，击杀大小积分怪归属阵营每人分别获得<font color='0x01f801'>300和150</font>分，击杀敌方玩家获得<font color='0x01f801'>450</font>分。",
		Remarks = "勇者峡谷（15V15夺点）规则说明",
	},
	[1189] = {
		Msg = "规则描述",
		Remarks = "谁与争锋",
	},
	[1190] = {
		Msg = "1、把对应装备部位<font color='0x01f801'>多余装备</font>作为材料进行<font color='0x01f801'>熔炼</font>，获得该部位属性强化<br>2、<font color='0x01f801'>越高阶</font>的装备熔炼时获得的熔炼值<font color='0x01f801'>越高</font><br>3、装备部位上没有装备，<font color='0x01f801'>熔炼属性</font>还会<font color='0x01f801'>生效</font>",
		Remarks = "熔炼规则",
	},
	[1191] = {
		Msg = "<font size='16' color='#ffe4c7'>1、开服<font color='0x01f801'>15天</font>后，每个<font color='0x01f801'>周五的20点</font>开启，持续20分钟<br>2、活动期间，匹配到的跨服中，所有<font color='0x01f801'>加入同盟</font>的玩家均可进入活动地图参与活动。<br>3、活动开启之后，所有玩家需<font color='0x01f801'>摧毁</font>位于殿前的雕像，从而开启皇宫争夺，当皇宫内只有一个同盟时，该同盟获得<font color='0x01f801'>皇宫归属权</font>。<br>4、<font color='0x01f801'>每次</font>群雄逐鹿活动<font color='0x01f801'>都无守城方</font>。<br>5、活动结束时，获得皇宫<font color='0x01f801'>归属权</font>的同盟成为皇宫占领者。<br>6、活动结束时，如没有同盟获得皇宫归属权，则同盟<font color='0x01f801'>积分排名第一</font>的同盟成为沙城占领者。7、死亡掉落非绑定物品</font>",
		Remarks = "群雄逐鹿里面规则说明",
	},
	[1192] = {
		Msg = "1、boss提醒功能需要激活<font color='0x01f801'>星耀特权</font>开启<br>2、玩家在<font color='0x01f801'>副本地图</font>外时，勾选怪物复活都会第一时间收到<font color='0x01f801'>复活提示</font>，且点击前往可第一时间飞至怪物出生点附近。",
		Remarks = "BOSS提醒规则",
	},
	[1193] = {
		Msg = "说明：<br>在副本里面任何地方都会获得泡点<font color='0x01f801'>经验</font><br>开启泡点宝箱可以获得<font color='0x01f801'>经验丹</font>、<font color='0x01f801'>10倍经验丹</font>、<font color='0x01f801'>转生修炼心得</font>等<br>每隔300秒刷新一波宝箱",
		Remarks = "激情泡点副本文本",
	},
	[1194] = {
		Msg = "1、活动开启时间：<font color='0x01f801'>每周一、三、五</font><br><font color='0x01f801'>19:00-19:30</font><br>2、开服<font color='0x01f801'>30</font>天且角色<font color='0x01f801'>8转</font>可参与，活动每日0点会回复1次挑战次数。<br>3、进入地图的玩家被分为两个阵营，分别为<font color='0x01f801'>千秋万代</font>和<font color='0x01f801'>雄霸天下</font>。<br>4、地图中每<font color='0x01f801'>10秒</font>发放一次<font color='0x01f801'>威望和荣誉值</font>奖励，阵营奖励倍数越高则己方阵营所有人获得的奖励越高。<br>5、每个阵营的<font color='0x01f801'>基础奖励倍数为9</font>，抢夺奖励点可为己方阵营提高奖励<font color='0x01f801'>总倍数</font>，从而提高己方阵营所有人的奖励。<br>6、每个奖励点只能站<font color='0x01f801'>1个角色</font>，只有角色站在点位上时才能提高己方阵营的奖励<font color='0x01f801'>总倍数</font>。<br><font color='#02afe8'>7、特殊：活动场景中死亡<font color='#02afe8'>不会掉落</font>自身装备。</font>",
		Remarks = "激情泡点匹配界面规则介绍",
	},
	[1195] = {
		Msg = "<font size='16' color='#ffe4c7'>1、活动期间，所有报名匹配成功后的行会玩家可进入活动地图参与活动。<br>2、活动开启之后，所有玩家需摧毁位于殿前的雕像，从而开启皇宫争夺，最终成功获得皇宫归属权的行会为皇宫占领者。<br>3、每次群雄逐鹿活动所有行会为攻城方。<br>4、雕像被摧毁60S后，玩家可提前进入皇宫占位。倒计时结束正式开启皇宫归属权争夺。<br>5、获得皇宫归属的帮派会给参与活动的所有人持续加积分<br>6、活动结束时，获得皇宫归属权的行会成为皇宫占领者。<br>7、活动结束时，如没有行会获得皇宫归属权，则行会积分排名第一的行会成为皇宫占领者。</font>",
		Remarks = "跨服帮战规则说明",
	},
	[1196] = {
		Msg = "1、活动时间结束后如未激活红包则活动入口将会消失，激活红包后，直到<font color='0x01f801'>领完</font>所有奖励入口才会消失<br>2、激活后到达指定天数即可领取传奇币红包，如果您当日无法登录，再次上线时<font color='0x01f801'>依然可以领取</font>",
		Remarks = "福运红包",
	},
	[1197] = {
		Msg = "1、开服<font color='0x01f801'>105</font>天且角色<font color='0x01f801'>10转</font>开启<br>2、每天有<font color='0x01f801'>3</font>次奖励次数，没获得奖励<font color='0x01f801'>不扣除</font>次数，奖励次数每日<font color='0x01f801'>0点</font>重置<br>3、非协助状态下击杀BOSS且<font color='0x01f801'>伤害排名第一</font>，可额外获得一份奖励<br>4、协助状态下自己的伤害将统计到<font color='0x01f801'>协助对象</font>上，协助的对象获得伤害<font color='0x01f801'>第一名</font>，自己可额外获得一份<font color='0x01f801'>2000秘法石</font>协助奖励，每日最高可获得<font color='0x01f801'>20000秘法石</font><br>5、世界BOSS均有<font color='0x01f801'>掉落保护</font>，PK爆装几率为其他地图的一半。",
		Remarks = "世界BOSS规则描述",
	},
	[1198] = {
		Msg = "1、每日可押送<font color='0x01f801'>2</font>次灵鲲，运送到终点可领取大量<font color='0x01f801'>特戒精华</font>和<font color='0x01f801'>秘法石等奖励</font><br>2、护送中可截取其他人灵鲲，击杀灵鲲后可立即获得该灵鲲的<font color='0x01f801'>部分</font>奖励<br>3、在双倍押镖<font color='0x01f801'>（活动之间内）</font>，<font color='0x01f801'>接取</font>灵鲲并<font color='0x01f801'>送达</font>，才能获取双倍奖励！",
		Remarks = "跨服护送规则说明",
	},
	[1199] = {
		Msg = "战纹系统总战力达到{0}",
		Remarks = "战纹总战力条件说明",
	},
	[1202] = {
		Msg = "仅在当前页面点击购买，在弹出的充值页付款可获得至尊福利礼包",
		Remarks = "至尊福利说明",
	},
	[1203] = {
		Msg = "需激活{0}特戒",
		Remarks = "特戒条件说明",
	},
	[1204] = {
		Msg = "需激活{0}法阵",
		Remarks = "法阵条件说明",
	},
	[1205] = {
		Msg = "<font color='0x01f801'>伏羲装备获取：<br>1、运营活动<br>2、群雄逐鹿</font>",
		Remarks = "八卦装备tips",
	},
	[1206] = {
		Msg = "按<font color='0x01f801'>行会积分</font>排名，奖励发给<font color='0x01f801'>所有参与活动的成员</font>！",
		Remarks = "行会奖励说明",
	},
	[1207] = {
		Msg = "按玩法内所有人的<font color='0x01f801'>个人积分</font>排名，奖励发给<font color='0x01f801'>个人</font>！",
		Remarks = "个人奖励说明",
	},
	[1208] = {
		Msg = "按<font color='0x01f801'>行会积分</font>排名，奖励发给只<font color='0x01f801'>帮主</font>！",
		Remarks = "帮主奖励说明",
	},
	[1209] = {
		Msg = "超级大奖献给<font color='0x01f801'>群雄霸主！</font><br>霸主奖励会发给占领皇宫的帮派<font color='0x01f801'>帮主</font>",
		Remarks = "群雄奖励说明",
	},
	[1210] = {
		Msg = "1、购买至尊福利礼包消耗的金额<font color='0x01f801'>会计入</font>其他充值活动<br>2、购买至尊福利礼包除展示奖励以外无法额外获得充值传奇币<br>3、仅在至尊福利礼包页面点击购买，在弹出的充值页付款可获得对应礼包，其他页充值<font color='0x01f801'>无法</font>获得礼包",
		Remarks = "至尊福利规则说明",
	},
	[1211] = {
		Msg = "1、未激活勋章的玩家，达到领取条件后每天可领取一份奖励，激活勋章后可额外领取一份奖励<br>2、<font color='0x01f801'>任何时候</font>激活勋章，所有满足领取条件的勋章奖励均可<font color='0x01f801'>领取</font><br>3、勋章奖励达到指定天数后无论是否领取都会<font color='0x01f801'>重置</font>，重置后需要重新激活，领取条件也将重新开始记录，请<font color='0x01f801'>及时领奖</font>",
		Remarks = "勋章系统规则描述",
	},
	[1212] = {
		Msg = "1、角色<font color='0x01f801'>150级</font>可开启副本挑战。<br>2、挑战副本成功可获得一份<font color='0x01f801'>奖励</font>，每<font color='0x01f801'>20层</font>可获得一份<font color='0x01f801'>豪华奖励</font>，失败可提升战力后继续挑战，没有次数限制。<br>3、<font color='0x01f801'>副本挑战1次后</font>根据当前的挑战进度可额外领取<font color='0x01f801'>进度累积奖励</font>，奖励每<font color='0x01f801'>10分钟</font>增加一次，最高可累积<font color='0x01f801'>8小时</font>，奖励领取后重新累积。",
		Remarks = "试炼之地规则",
	},
	[1213] = {
		Msg = "奖励多累积<font color='0x01f801'>8小时</font>，上限后不再增加，请及时领取！",
		Remarks = "试炼之地说明文本",
	},
	[1214] = {
		Msg = "上架说明：1、交易税10% 2、双击道具上架",
		Remarks = "拍卖上架说明",
	},
	[1215] = {
		Msg = "您对{0}的竞拍价已被买走，已返还竞拍的{1}{2}",
		Remarks = "拍卖物品竞价后被买走",
	},
	[1216] = {
		Msg = "您对{0}的竞拍价被超过，已返还竞拍的{1}{2}",
		Remarks = "拍卖物品竞价被超过",
	},
	[1217] = {
		Msg = "交易记录最多保留50条",
		Remarks = "记录说明",
	},
	[1218] = {
		Msg = "1.玩家对首领造成伤害，可以获得大量奖励<br>2.行会对首领造成伤害的前100名可以获得稀有奖励，第一名可以获得极品奖励，包括<font color='#ff0000'>风云级完美</font>，<font color='#ff0000'>5阶面纱</font>，<font color='#ff0000'>5阶盾牌</font>，以及各类<font color='#28ef01'>战神级以上装备</font><br>3.行会拍卖中的道具成功拍出，所有全程参与的玩家都将获得分红奖励<br>4、行会排名前三名的行会成员可获得进入<font color='#ff0000'>盟重·行会地图</font>的资格",
		Remarks = "行会BOSS说明",
	},
	[1219] = {
		Msg = "<font color='#CC00FF'>附魔属性额外加成{0}%</font>",
		Remarks = "附魔属性说明",
	},
	[1221] = {
		Msg = "1、角色<font color='0x01f801'>250</font>开启五行圣器系统<br>2、消耗<font color='0x01f801'>五行石、混沌圣晶</font>提升五行部位属性，达到一定等级可激活套装属性<br>3、五行相生相克，点击五行部位可打开五行激活界面，激活后可提升大量属性<br>4、五行圣器有<font color='0x01f801'>套装效果</font>，激活全部位不仅可附加大量属性，还能激活<font color='0x01f801'>五行守护</font>被动效果",
		Remarks = "五行圣器规则说明",
	},
	[1222] = {
		Msg = "战纹系统总战力达到{0}",
		Remarks = "灵宝总战力条件说明",
	},
	[1223] = {
		Msg = "1、进入条件：开服<font color='0x01f801'>60</font>天开启<br>2、参与条件：神魔遗迹分为多层，<font color='0x01f801'>达到条件</font>的玩家可以选择层数<br>3、怒气值规则：玩家<font color='0x01f801'>获得BOSS归属后扣除怒气值</font>，<font color='0x01f801'>每日0点全部回复</font>，怒气值不管在哪个副本中都是一样的，若玩家<font color='0x01f801'>没有怒气值</font>，则<font color='0x01f801'>无法获得BOSS归属</font>，击杀BOSS后也<font color='0x01f801'>不会获得奖励</font><br>4、进入神魔战场后，有行会的玩家可以<font color='0x01f801'>点击协助</font>向行会中的人发起求助，<font color='0x01f801'>没有怒气值的玩家无法请求协助</font><br>5、<font color='0x01f801'>前往协助的玩家，只有在被协助玩家站在怪物脚下的圈内时，才可对怪物造成伤害，若获得归属，则怪物的归属算为被协助玩家的</font><br>6、若请求协助的玩家的<font color='0x01f801'>怒气值归0或退出地图，则协助状态消失</font><br>7、神魔遗迹PK<font color='0x01f801'>爆装几率</font>为其他地图的一半",
		Remarks = "神魔遗迹规则",
	},
	[1224] = {
		Msg = "我在神魔遗迹需要协助！！！",
		Remarks = "神魔遗迹协助文字（废弃）",
	},
	[1225] = {
		Msg = "通关试炼之地{0}层",
		Remarks = "试炼之地conditon提示",
	},
	[1226] = {
		Msg = "世界花园协助",
		Remarks = "世界花园协助文字（废弃）",
	},
	[1227] = {
		Msg = "完成<font color='0x01f801'>元神任务</font>解锁装备格<br><font color='0x01f801'>元神装备获取：<br>1、挑战元神秘境BOSS<br>2、运营活动</font>",
		Remarks = "神玄装备tips",
	},
	[1228] = {
		Msg = "1、活动期间<font color='0x01f801'>消费传奇币</font>金额达到<font color='0x01f801'>30万</font>后即可参与名人堂排行<br>2、消费统计将在<font color='0x01f801'>4月17日23：29：59</font>进行结算，结算持续30分钟<br>3、本期活动将在<font color='0x01f801'>4月17日23：29：59</font>停止数据更新，在<font color='0x01f801'>4月17日23：59：59</font>结束并关闭入口<br>4、活动奖励将在活动结束后通过邮件发放（由于数据过多，部分区服可能会存在邮件延迟，<font color='0x01f801'>请耐心等待</font>）<br>5、名人堂排行数据<font color='0x01f801'>10分钟更新1次</font>，需<font color='0x01f801'>重新打开页面</font>才能同步最新数据<br>",
		Remarks = "名人堂规则描述",
	},
	[1229] = {
		Msg = "1、进入条件：开服<font color='0x01f801'>2</font>天开启<br>2、参与条件：世界花园分为多层，<font color='0x01f801'>达到条件</font>的玩家可以选择层数<br>3、怒气值规则：玩家<font color='0x01f801'>获得BOSS归属后扣除怒气值</font>，<font color='0x01f801'>每日0点全部回复</font>，怒气值不管在哪个副本中都是一样的，若玩家<font color='0x01f801'>没有怒气值</font>，则<font color='0x01f801'>无法获得BOSS归属</font>，击杀BOSS后也<font color='0x01f801'>不会获得奖励</font><br>4、进入神魔战场后，有行会的玩家可以<font color='0x01f801'>点击协助</font>向行会中的人发起求助，<font color='0x01f801'>没有怒气值的玩家无法请求协助</font><br>5、<font color='0x01f801'>前往协助的玩家，只有在被协助玩家站在怪物脚下的圈内时，才可对怪物造成伤害，若获得归属，则怪物的归属算为被协助玩家的</font><br>6、若请求协助的玩家的<font color='0x01f801'>怒气归0或退出地图，则解散协助</font>",
		Remarks = "世界花园规则",
	},
	[1230] = {
		Msg = "神器附魔：<br>   <font color='#dbc299'>装备部位穿戴36阶及以上装备可激活该部位附魔属性额外加成的被动效果，否则，附魔之力会失效</font>",
		Remarks = "附魔之力规则",
	},
	[1231] = {
		Msg = "1、神秘圣地有6只神秘BOSS，星级越高其奖励越丰厚<br>2、神秘圣地需要用修炼积分探索，寻出BOSS方可进入挑战<br>3、游戏内每杀死一个天妖及以上怪物会增加修炼积分<br>4、修炼积分用于探索神秘圣地中的BOSS，每日获取的修炼积分存在上限<br>5、同一轮内被玩家击杀的BOSS，在此轮中不在会被探索到<br>6、只有当前轮有BOSS被探索击杀后，才可以重置成新的一轮",
		Remarks = "修炼圣地规则",
	},
	[1232] = {
		Msg = "角色总战力达到{0}",
		Remarks = "角色条件说明",
	},
	[1233] = {
		Msg = "为确保游戏的<font color='0x01f801'>公平公正</font>，还给广大玩家一个<font color='0x01f801'>绿色健康</font>的游戏环境，现抽取部分玩家进行答题检测，<font color='0x01f801'>请认真作答</font>，避免误认，<font color='0x01f801'>多次答错会被关禁闭</font>",
		Remarks = "答题说明",
	},
	[1234] = {
		Msg = "怒气值为零，不会获得任何奖励",
		Remarks = "神魔遗迹说明",
	},
	[1235] = {
		Msg = "1、活动结束前激活聚宝盆，每天都能领取奖励，直到<font color='0x01f801'>领完</font>奖励入口才会消失<br>2、购买聚宝盆计入<font color='0x01f801'>充值活动</font>，可获得对应金额的<font color='0x01f801'>至尊经验</font>",
		Remarks = "聚宝盆规则",
	},
	[1236] = {
		Msg = "1、使用皇权秘宝可激活无上皇权，该道具使用多个<font color='0x01f801'>效果可叠加</font><br>2、激活皇权尊享无上权益：<br>  a、皇权加身：充值额外返利<font color='0x01f801'>10%</font><br>  b、免费领取<font color='0x01f801'>无上</font>礼包<br>  c、生命上限永久增加<font color='0x01f801'>450000</font><br>  d、角色攻击永久增加<font color='0x01f801'>16500</font><br>  e、爆率永久增加<font color='0x01f801'>10%</font><br>3、皇权加身充值额外返利通过邮件发放",
		Remarks = "无上皇权说明",
	},
	[1237] = {
		Msg = "注释：低血保护勾选并开启辅助时，【设置中-自动随机】会自动屏蔽，关闭辅助后，效果恢复",
		Remarks = "回城治疗的注释",
	},
	[1238] = {
		Msg = "角色木灵力不低于{0}",
		Remarks = "神玄装备属性条件",
	},
	[1239] = {
		Msg = "角色火灵力不低于{0}",
		Remarks = "神玄装备属性条件",
	},
	[1240] = {
		Msg = "角色土灵力不低于{0}",
		Remarks = "神玄装备属性条件",
	},
	[1241] = {
		Msg = "角色金灵力不低于{0}",
		Remarks = "神玄装备属性条件",
	},
	[1242] = {
		Msg = "1、天下第一分为3个阶段，即:<font color='0x01f801'>报名，筛选和决赛阶段</font><br>2、玩家报名天下第一争霸赛即可获得<font color='0x01f801'>大量秘法石奖励</font><br>3、即使不报名也可以参与海选阶段<br>4、<font color='0x01f801'>各个赛区</font>筛选阶段决出的<font color='0x01f801'>16强</font>选手可以进入决赛阶段<br><font color='0x01f801'>此版本为测试版，若您遇到问题请及时反馈给客服</font>",
		Remarks = "天下第一报名界面规则",
	},
	[1243] = {
		Msg = "1、在筛选阶段，玩家可以每天<font color='0x01f801'>晚上9、00-9、30</font>参与游戏，每天回复3次次数<br>2、海选结束时，<font color='0x01f801'>该赛区积分前16名</font>的玩家可以进入决赛<br>3、每次胜利或者失败都会给玩家增加积分<br>4、如果玩家<font color='0x01f801'>连胜</font>，那么会给玩家增加<font color='0x01f801'>更多的积分</font><br>5、<font color='0x01f801'>玩家胜利或失败会获得不同的奖励</font><br>6、逃跑不会获得任何奖励<br>7、<font color='0x01f801'>游戏内死亡不掉落装备</font><br><font color='0x01f801'>此版本为测试版，若您遇到问题请及时反馈给客服</font>",
		Remarks = "天下第一海选界面规则",
	},
	[1244] = {
		Msg = "天下第一报名海选面板ICON点击后显示的规则",
		Remarks = "天下第一报名海选面板ICON点击后显示的规则",
	},
	[1245] = {
		Msg = "1、决赛在每天的<font color='0x01f801'>晚上9点开启，9、30结束</font><br>2、获得<font color='0x01f801'>决赛资格</font>的玩家，需要在<font color='0x01f801'>比赛阶段进行准备</font>，如果一方准备了而另一方<font color='0x01f801'>没有准备</font>，过了比赛阶段后，<font color='0x01f801'>算没有准备的一方失败</font>，如果<font color='0x01f801'>两方都没有准备</font>，那么算两名玩家<font color='0x01f801'>都失败</font><br>3、如果<font color='0x01f801'>2名玩家都失败</font>，那么他们<font color='0x01f801'>下一轮的对手</font>，<font color='0x01f801'>只需要在第二天的比赛阶段点击准备</font>，<font color='0x01f801'>即可晋级</font>到下一轮<br>4、决赛期间，进入16强的玩家将通过<font color='0x01f801'>每天一场比赛</font>的方式，决出更高名次的玩家进入<font color='0x01f801'>下一轮</font><br>5、进入下一轮的玩家可以在<font color='0x01f801'>第二天继续比赛</font>，夺得更高的名次，获取更豪华的奖励</font><br>6、当玩家<font color='0x01f801'>失败时</font>，代表他<font color='0x01f801'>结束了决赛之旅</font>，他将会获得<font color='0x01f801'>当前名次的排名奖励</font><br>7、<font color='0x01f801'>冠军奖励会在总决赛打完发放给玩家</font><br>8、决赛同样分为多个赛区，会有<font color='0x01f801'>多个冠军</font><br>9、<font color='0x01f801'>游戏内死亡不掉落装备</font><br><font color='0x01f801'>此版本为测试版，若您遇到问题请及时反馈给客服</font>",
		Remarks = "天下第一决赛点击icon显示的规则",
	},
	[1246] = {
		Msg = "1、玩家可以通过设置二级密码来<font color='0x01f801'>保护自己的账号</font><br>2、二级密码可以保护玩家的<font color='0x01f801'>传奇币</font>和仓库<br>3、玩家登录或消耗传奇币时都需要<font color='0x01f801'>验证二级密码</font>，否则无法消耗传奇币<br>4、<font color='0x01f801'>本次登录</font>，玩家只要<font color='0x01f801'>输入正确过一次</font>二级密码，就<font color='0x01f801'>不会继续弹出验证</font><br>5、如果玩家忘记了密码，可以点击<font color='0x01f801'>重置按钮</font>，密码将会在<font color='0x01f801'>72小时后重置</font>，重置后即可设置新的二级密码",
		Remarks = "二级密码说明",
	},
	[1247] = {
		Msg = "1、进入条件：开服<font color='0x01f801'>210天且14转</font>开启<br>2、BOSS每日固定<font color='0x01f801'>12点</font>刷新<br>3、协助奖励：<font color='0x01f801'>同行会</font>的人如果得到了BOSS的归属奖励，自己也将获得<font color='0x01f801'>协助奖励</font><br>4、点击boss头像可快速自动寻路",
		Remarks = "静寂之森规则说明",
	},
	[1248] = {
		Msg = "是否协助夺回被{0}抢夺的矿脉",
		Remarks = "比奇矿洞协助文",
	},
	[1249] = {
		Msg = "鲜花榜说明",
		Remarks = "鲜花榜说明",
	},
	[1250] = {
		Msg = "完成木元神精通任务",
		Remarks = "conditon说明",
	},
	[1251] = {
		Msg = "完成火元神精通任务",
		Remarks = "conditon说明",
	},
	[1252] = {
		Msg = "完成土元神精通任务",
		Remarks = "conditon说明",
	},
	[1253] = {
		Msg = "完成金元神精通任务",
		Remarks = "conditon说明",
	},
	[1254] = {
		Msg = "野外跨服矿战玩法说明",
		Remarks = "野外跨服矿战玩法说明",
	},
	[1255] = {
		Msg = "关注游戏公众号即可获得丰厚大奖！",
		Remarks = "关注公众号说明",
	},
	[1256] = {
		Msg = "1、元神秘境每日次数回复至<font color='0x01f801'>2次</font><br>2、开启元神秘境后可选择开启层的任意BOSS击杀<br>3、击杀任意BOSS后，玩家会在<font color='0x01f801'>倒计时结束后退出副本</font>",
		Remarks = "元神秘境规则",
	},
	[1257] = {
		Msg = "1、因你没有通过系统的脚本检测，故将你流放至此<br>2、在<font color='0x01f801'>放逐之地</font>需要<font color='0x01f801'>累计足够的时长</font>方可离开(<font color='0x01f801'>离线记录时长</font>)<br>3、时长会<font color='0x01f801'>随着进入次数而增加</font><br>4、若对系统检测存在质疑，请咨询客服",
		Remarks = "小黑屋规则",
	},
	[1258] = {
		Msg = "在你结束决赛之旅时才会获得奖励！",
		Remarks = "天下第一奖励说明",
	},
	[1259] = {
		Msg = "排行榜十分钟更新一次！",
		Remarks = "天下全服排名说明",
	},
	[1263] = {
		Msg = "1.在行会领地指定位置停留，每隔一段时间可以获得<font color='#28ef01'>泡点经验</font>；<br>2.活动开启前，<font color='#28ef01'>击杀</font>行会领地刷新出的<font color='#28ef01'>怪物</font>，拾取到的材料可以<font color='#28ef01'>在篝火上使用</font>，并获得<font color='#28ef01'>额外奖励</font>；<br>3.活动开启同时，开启行会答题比拼。<font color='#28ef01'>每道题有任意一名行会内成员答对即可</font>。<font color='#28ef01'>回答正确的玩家将会获得一份奖励</font>；<br>4.所有参与答题的行会，会根据回答题目的正确数量排名。当正确数相同时，耗时最短的行会排名靠前；<br>5.活动结束后，<font color='#28ef01'>根据行会排名发放奖励</font>，参与答题行会的行会成员均获得；",
		Remarks = "答题玩法规则",
	},
	[1278] = {
		Msg = "<font color='0xebf291'>24：00恢复10倍经验30点   1经验点=40万基础经验</font>",
		Remarks = "十倍经验点说明",
	},
	[1279] = {
		Msg = "经验幻境规则",
		Remarks = "经验幻境规则",
	},
	[1280] = {
		Msg = "材料副本规则",
		Remarks = "材料副本规则",
	},
	[1281] = {
		Msg = "1.领取任意每日充值奖励持续一定天数可以获得累充奖励<br>2.累充奖励全部领取后，会继续开启新一轮的累充",
		Remarks = "惊喜礼包规则描述",
	},
	[1282] = {
		Msg = "神盾合成",
		Remarks = "神盾合成",
	},
	[1283] = {
		Msg = "激活青铜会员",
		Remarks = "特权条件",
	},
	[1284] = {
		Msg = "激活白银会员",
		Remarks = "特权条件",
	},
	[1285] = {
		Msg = "激活黄金会员",
		Remarks = "特权条件",
	},
	[1286] = {
		Msg = "参与活动才会获得行会排行奖励！",
		Remarks = "奖励说明",
	},
	[1287] = {
		Msg = "未激活对应时装",
		Remarks = "conditon说明",
	},
	[1288] = {
		Msg = "<font color='#c9cacc'><font color='0xe1dac0'size='14'>增加<font color='0x01f801'>5%</font>基础经验 <font color='0xe1dac0'size='14'>增加<font color='0x01f801'>2%</font>伤害增幅</font>",
		Remarks = "青铜会员buff说明",
	},
	[1289] = {
		Msg = "<font color='#c9cacc'><font color='0xe1dac0'size='14'>增加<font color='0x01f801'>10%</font>基础经验 <font color='0xe1dac0'size='14'>增加<font color='0x01f801'>5%</font>伤害增幅</font>",
		Remarks = "白银会员buff说明",
	},
	[1290] = {
		Msg = "<font color='#c9cacc'><font color='0xe1dac0'size='14'>增加<font color='0x01f801'>20%</font>基础经验 <font color='0xe1dac0'size='14'>增加<font color='0x01f801'>10%</font>伤害增幅</font>",
		Remarks = "黄金会员buff说明",
	},
	[1291] = {
		Msg = "11:00开启",
		Remarks = "condition条件文本",
	},
	[1292] = {
		Msg = "没有需要重铸的装备",
		Remarks = "装备重铸提示",
	},
	[1293] = {
		Msg = "击杀怪物收集转生材料，激活血脉之力，即可<font color='0x01f801'>强化体质，大幅提升生命</font>。然而，突破自我的道路又谈何容易......",
		Remarks = "转生试炼界面提示文字",
	},
	[1294] = {
		Msg = "副本周日开启",
		Remarks = "周末开启",
	},
	[1295] = {
		Msg = "敬请期待",
		Remarks = "condition文本",
	},
	[1296] = {
		Msg = "说明：<br>1、<font color='#28ef01'>赤月级</font>以上装备熔炼后可获得<font color='#28ef01'>声望</font>；装备等级越高，熔炼获得的声望越多<br>2、熔炼<font color='#28ef01'>赤月级</font>以上装备有概率获得<font color='#28ef01'>真龙锻造书[首饰]</font>、<font color='#28ef01'>热血锻造书[首饰]</font>、<font color='#28ef01'>热血锻造书[武器]</font>、<font color='#28ef01'>热血锻造书[衣服]</font>、<font color='#28ef01'>创造宝石</font>、<font color='#28ef01'>顿悟印记</font>、<font color='#28ef01'>觉醒之石</font>、<font color='#28ef01'>至尊宝石</font>、<font color='#28ef01'>灵魂宝石</font>、<font color='#28ef01'>玛雅宝石</font>、<font color='#28ef01'>祝福宝石</font>、<font color='#28ef01'>英雄宝石</font>、<font color='#28ef01'>幸运宝石</font>、<font color='#28ef01'>血魔结晶</font>、<font color='#28ef01'>金刚符印</font>等高级材料",
		Remarks = "天地熔炉文本",
	},
	[1297] = {
		Msg = "1、怪物有<font color='#28ef01'>归属权</font>，只有获得了此怪物的归属，击杀了才可获得奖励！<br>2、所有怪物<font color='#28ef01'>共享归属次数</font>，每天3次，0点重置次数<br>3、消耗挑战卷轴可恢复次数（注意：只有当玩家归属次数不足3次时使用才可恢复次数！）",
		Remarks = "特权boss提示文本",
	},
	[1298] = {
		Msg = "1.消耗<font color='#28ef01'>风云令</font>升级官职，升级后可获得<font color='#28ef01'>官职称号</font>和<font color='#28ef01'>大量属性</font>。<br>2.风云令可打怪中获得。<br>3.提升官职可获得<font color='#28ef01'>受怪减伤</font>加成。",
		Remarks = "官职说明",
	},
	[1299] = {
		Msg = "1、消耗上古星辰章[残]，将有几率获得随机品质、随机职业的星辰徽章<br>2、消耗乱古主宰章[残]及任意星辰徽章，将有几率获得随机品质、随机职业的主宰徽章<br>添加对应徽章，可以提高合成成功几率<br>4、每级徽章成功合成一定次数后，下次成功合成必定获得极品徽章！<br>5、使用普通生肖装备参与合成，有概率获得更高等级的生肖装备！",
		Remarks = "勋章合成说明",
	},
	[1300] = {
		Msg = "1、等级榜排行根据玩家的等级由高到低进行排名<br>2、战士、法师、道士榜根据各个职业攻击属性由高到低排<br>3、称号、时装榜根据玩家称号、时装的等级由高到低进行排名<br>4、每个榜的第一名都有专属称号<br>5、优先到达的排名靠前",
		Remarks = "排行榜规则",
	},
	[1301] = {
		Msg = "拍卖行上架了本职业更高属性的装备，是否前往查看？",
		Remarks = "拍卖提示",
	},
	[1302] = {
		Msg = "神龙血脉",
		Remarks = "效果名称",
	},
	[1303] = {
		Msg = "PK伤害增加5%，对怪伤害增加15%",
		Remarks = "神龙血脉效果描述",
	},
	[1304] = {
		Msg = "1、深渊秘境是神秘之地，可使用召唤令召唤来自深渊的魔物，击杀深渊魔物可获得丰厚的宝藏<br>2、召唤令可在运营获得中获得，点击副本信息栏中召唤令可购买<br>3、点击副本信息栏右侧剩余召唤令或在背包中使用召唤令召唤深渊魔物<br>4、魔物被击杀后掉落会存入恶魔宝库，可点击副本信息栏开启宝库取出，宝库中的道具在深渊秘境结束后不会消失",
		Remarks = "深渊秘境",
	},
	[1305] = {
		Msg = "玩家每阵亡一次即可获得一层“逆袭”BUFF，每层的“逆袭”BUFF可增加30%的伤害，击杀玩家后清除",
		Remarks = "比奇buff",
	},
	[1306] = {
		Msg = "需该部位淬炼等级+{0}",
		Remarks = "淬炼condition",
	},
	[1307] = {
		Msg = "换一个职业，换一种世界！玩累了当前的职业，那就换换口味吧，前提是你先要有一张转职卡哦！<br>转职后系统将自动变更职业技能，会将身上属于本职业的装备全部脱下",
		Remarks = "转职说明",
	},
	[1308] = {
		Msg = "<font color='0x01f801'>组队经验加成：</font><br>队伍2人及以上经验加成<font color='0x01f801'>10%</font><br>队伍5人及以上经验加成<font color='0x01f801'>20%</font><br>队伍10人及以上经验加成<font color='0x01f801'>30%</font>",
		Remarks = "组队加成说明",
	},
	[1309] = {
		Msg = "1、剑气效果高级会覆盖低级<br>2、升级剑气只需要补差价<br>3、开服七天后押金全额返还<br>4、返还押金后剑气效果消失",
		Remarks = "剑气租聘说明",
	},
	[1310] = {
		Msg = "活动【{0}】尚未开启",
		Remarks = "活动开启条件",
	},
	[1311] = {
		Msg = "需要该部位觉醒等级+{0}",
		Remarks = "condition",
	},
	[1312] = {
		Msg = "1.购买任一每日礼包（传奇币礼包除外）持续一定天数可以获得累充奖励<br>2.累充奖励全部领取后，会继续开启新一轮的累充",
		Remarks = "累计直购描述",
	},
	[1313] = {
		Msg = "尊敬的勇士，当你觉得你足够强大时，你乐意找我进行试炼<br>现在我送你回盟重，继续挑战下个试炼",
		Remarks = "个人副本结算展示文字",
	},
	[1314] = {
		Msg = "需要玩家{0}达到{1}",
		Remarks = "三职业攻击条件",
	},
	[5000] = {
		Msg = "资源找回说明",
		Remarks = "资源找回说明",
	},
	[2001] = {
		Msg = "<font colorStyleID='1030'>卧龙山庄的子民体内流淌着龙的血脉，激活血脉之力，即可<font colorStyleID='1040'>强化体质，大幅提升生命</font>。然而，突破自我的道路又谈何容易........</font>",
		Remarks = "转生试炼描述",
	},
	[2002] = {
		Msg = "已达存储上限，无法存储",
		Remarks = "经验存储提示",
	},
	[2003] = {
		Msg = "今日提取已达上限！",
		Remarks = "经验提取提示",
	},
	[2004] = {
		Msg = "<font colorStyleID='1030'>1.洗练出的极品属性需要点击“保存属性”按钮才会生效<br>2.洗练只会改变装备极品属性的数值，不会改变极品属性类型<br>3.切换装备或关闭界面，未保存的洗练属性将不会保留<br>4.洗练结果随机，有概率提升装备品质或降低品质，请谨慎操作</font>",
		Remarks = "装备洗练",
	},
	[2005] = {
		Msg = "<font colorStyleID='1030'>1.精炼绑定玩家灵器部位，替换灵器后精炼等级保留<br>2.灵器等级越高可精炼的等级上限越高<br>3.精炼等级大于穿戴灵器的精炼最大等级时，超出部分的属性将被暂时封印</font>",
		Remarks = "装备精炼",
	},
	[2006] = {
		Msg = "1.觉醒只针对装备部位，与装备无关<br>2.觉醒存在成功率，如果觉醒成功，那么装备星级提升，如果觉醒失败，装备星级不变",
		Remarks = "装备强星",
	},
	[2007] = {
		Msg = "<font colorStyleID='1030'>1.开服12天，角色50级才能对可炼魂的装备进行炼魂<br>2.炼魂存在成功率，所使用的材料品质越高，数量越多，炼魂成功率越高<br>3.炼魂能够提升装备强星上限</font>",
		Remarks = "装备炼魂",
	},
	[2008] = {
		Msg = "<font colorStyleID='1030'>1.消耗元宝或绑定经验珠可以获得超级经验点<br>2.每1点超级经验点可以在击杀怪物时获得25万额外经验值<br>3.每天可以提取的超级经验点上限为300点<br>4.经验鉴定可容纳的超级经验点上限为9999点，超过上限不可再获得超级经验点</font>",
		Remarks = "经验鉴定",
	},
	[2009] = {
		Msg = "1.<font colorStyleID='1030'>没有十倍经验点后，<font color='0x01f801'>经验丹获取的经验</font>会储存在经验鉴定师处<br>2.可在<font color='#28ef01'>【盟重】-【经验鉴定师】</font>处消耗十倍经验点数提取储存的经验</font>",
		Remarks = "储存经验",
	},
	[2010] = {
		Msg = "<font colorStyleID='1030'>1.勇士试炼为单人副本<br>2.进入副本后刷新怪物，打死怪物.玩家死亡.副本时间结束判定为副本结束<br>3.副本结束时判定是否成功通关副本.通关时角色血量大于50%.通关时间小于30秒，每满足一个条件为1星<br>4.三星通关后，下一小关开启，扣除一次三星通关次数，本小关不可再次挑战；未能三星通关，本小关可反复挑战，不扣除三星通关次数，每日三星通关次数为0时，即使满足三星通关条件，也不发放奖励<br>5.单个小关每一星奖励仅可领取一次</font>",
		Remarks = "勇者试炼",
	},
	[2011] = {
		Msg = "·地衍沧澜盾无需添加装备提高成功率！",
		Remarks = "神盾界面描述显示",
	},
	[2012] = {
		Msg = "1.装备传承后继承已镶嵌的铭文、宝石、已开孔的孔位<br>2.仅限于低品质装备传承给高品质装备<br>3.未开孔装备才能被传承",
		Remarks = "传承界面描述",
	},
	[2013] = {
		Msg = "·熔火天极盾需添加<font color='#28ef01'>地衍沧澜盾</font>",
		Remarks = "神盾界面描述显示",
	},
	[2014] = {
		Msg = "·玄冥永生盾需添加<font color='#28ef01'>熔火天极盾</font>",
		Remarks = "神盾界面描述显示",
	},
	[2015] = {
		Msg = "1.积分获得方式：<br>    击杀积分  积分+10<br>    挂机积分  每十秒积分+5<br>    被击杀积分  积分+5<br>2.被击杀复活后，获得隐藏的伤害提升buff，可以叠加，离开场景后buff清零<br>3.单次活动积分达到一定值可以获得对应档次的奖励，以最高档次为准<br>4.进入积分排行榜的玩家还能获得排行奖励",
		Remarks = "热血乱斗描述",
	},
	[2016] = {
		Msg = "1.尸王最多刷新3波，每一波中有一只尸王携带神秘宝藏<br>2.击杀特定尸王的玩家获得神秘宝藏，神秘宝藏结算时间为三分钟<br>3.神秘宝藏结算时，拥有宝藏的玩家可以获得实物奖励和海量元宝",
		Remarks = "尸王争夺战描述",
	},
	[2017] = {
		Msg = "1.消耗<font color='#28ef01'>地衍沧澜盾[残]</font>，将有几率获得随机品质、随机职业的<font color='#28ef01'>地衍沧澜盾</font>；<br>2.消耗<font color='#28ef01'>熔火天极盾[残]</font>及<font color='#28ef01'>任意地衍沧澜盾</font>，将有几率获得随机品质、随机职业的<font color='#28ef01'>熔火天极盾</font>；<br>3.添加对应盾牌，可以提高合成成功几率<br>5.每级盾牌成功合成<font color='#28ef01'>一定次数后</font>，下次成功合成<font color='#28ef01'>必定</font>获得<font color='#28ef01'>极品盾牌</font>！<br>6.使用<font color='#28ef01'>普通生肖装备</font>参与<font color='#28ef01'>合成</font>，可以<font color='#28ef01'>随机</font>获得<font color='#28ef01'>更高等级生肖装备</font>！",
		Remarks = "神盾界面描述显示",
	},
	[2018] = {
		Msg = "魔血石存储量不足5千，请注意使用",
	},
	[2019] = {
		Msg = "魔血石存储量不足1千，请注意使用",
	},
	[2020] = {
		Msg = "魔血石已经消耗完毕",
	},
	[2021] = {
		Msg = "1.雷霆级以上装备可进行打造<br>2、装备打造后继承原有装备的强星等级、炼魂等级、以及极品属性，其他属性不保留",
	},
	[2022] = {
		Msg = "1.购买任一每日礼包（传奇币礼包除外）持续一定天数可以获得累充奖励<br>2.累充奖励全部领取后，会继续开启新一轮的累充",
	},
	[2023] = {
		Msg = "1.消耗<font color='#28ef01'>功勋</font>升级封号，升级后可获得<font color='#28ef01'>专属封号</font>和<font color='#28ef01'>大量属性</font>。<br>2.功勋可从卧龙山庄各种玩法中获得。<br>3.封号达到5级后，可解锁<font color='#28ef01'>封号天赋</font>。<br>4.在<font color='#28ef01'>封号天赋</font>中加点，可<font color='#28ef01'>提高对职业的伤害</font>和<font color='#28ef01'>降低受职业的伤害</font><br>5.属性点可通过<font color='#28ef01'>升级封号</font>获得，也可通过<font color='#28ef01'>使用属性丹</font>获得。",
		Remarks = "封号说明",
	},
	[2024] = {
		Msg = "1.每件行会拍品成交后，会根据成交价格扣除一定比例的交易税<br>2.传奇币商品成交后，每位参与成员平分成交价格50%的分红",
	},
	[2025] = {
		Msg = "1.活动共持续30分钟。<br>2.活动开始后，地图上会刷出一只发财金猪，一只恭喜金猪。击杀金猪可获得大量奖励<br>2.金猪掉落的奖励无归属，所有玩家皆可拾取。<br>3.金猪被击杀后会有1分钟复活时间。",
		Remarks = "金猪活动文本描述",
	},
	[2026] = {
		Msg = "道具使用过于频繁，请稍后再试！",
		Remarks = "道具使用CD文本说明",
	},
	[2027] = {
		Msg = "当前精力充沛，基础经验为300%！",
		Remarks = "经验获取上限提示",
	},
	[2028] = {
		Msg = "当前精力充沛，基础经验为200%！",
		Remarks = "经验获取上限提示",
	},
	[2029] = {
		Msg = "当前正常状态，次日可恢复精力。",
		Remarks = "经验获取上限提示",
	},
	[2030] = {
		Msg = "对应装备未在背包，请卸下后重试",
		Remarks = "合成提示",
	},
	[2031] = {
		Msg = "1.在行会领地指定位置停留，每隔一段时间可以获得<font color='#28ef01'>泡点经验</font>；<br>2.活动开启前，<font color='#28ef01'>击杀</font>行会领地刷新出的<font color='#28ef01'>怪物</font>，拾取到的材料可以<font color='#28ef01'>在篝火上使用</font>，并获得<font color='#28ef01'>额外奖励</font>；<br>3.活动开启同时，开启行会答题比拼。<font color='#28ef01'>每道题有任意一名行会内成员答对即可</font>。<font color='#28ef01'>回答正确的玩家将会获得一份奖励</font>；<br>4.所有参与答题的行会，会根据回答题目的正确数量排名。当正确数相同时，耗时最短的行会排名靠前；<br>5.活动结束后，<font color='#28ef01'>根据行会排名发放奖励</font>，参与答题行会的行会成员均获得；",
		Remarks = "群英汇描述显示",
	},
	[2032] = {
		Msg = "背包已满，请清理后重试！",
		Remarks = "拍卖行购买提示",
	},
	[2033] = {
		Msg = "背包空间不足，请清理后重试",
		Remarks = "背包使用BOX空间提示",
	},
	[2034] = {
		Msg = "1.<font color='#28ef01'>开服第7天</font>将开启沙城争霸活动，此后每周<font color='#28ef01'>周3</font>、<font color='#28ef01'>周6</font>也将开启沙城争霸；<br>2.<font color='#28ef01'>城门被攻破</font>前后，攻守双方的<font color='#28ef01'>出生点</font>会变化，建议防守方提早进入城池；<br>3.<font color='#28ef01'>防守方可以召唤</font>流动护卫及防守弓箭手；<br>4.进攻方可以通过<font color='#28ef01'>地道</font>潜入城池内。地道入口在城池后附近；<br>5.进攻方需要攻破城门，皇宫宫墙，才可进入皇宫。无法通过皇宫宫门进入；<br>6.攻城战<font color='#28ef01'>开启10分钟后</font>，<font color='#28ef01'>才可以变换占领方</font>，请勇士们稍安勿躁！<br>7.所有参与战斗的玩家，都可以获得<font color='#28ef01'>积分奖励</font>和<font color='#28ef01'>积分排名奖励</font>；<br>8.活动结束后，占领方将获得<font color='#28ef01'>丰厚占领奖励</font>。奖励将以<font color='#28ef01'>行会拍卖</font>的方式发放；",
		Remarks = "沙城争霸面板文本说明",
	},
	[2035] = {
		Msg = "皇陵秘境埋藏着无尽财宝，无数的勇士前来淘金。",
		Remarks = "神龙禁地文本",
	},
	[2036] = {
		Msg = "退出行会，2个小时后才能重新加入行会<br>                        确定退出行会？",
		Remarks = "退出行会提示",
	},
	[2037] = {
		Msg = "1.玩家对首领造成伤害，会根据行会个人伤害排名获得个人伤害奖励<br>2.行会对首领造成伤害的前100名可以获得稀有奖励，第一名可以获得极品奖励，包括<font color='#ff0000'>狂雷级完美</font>，<font color='#ff0000'>1阶面纱</font>，<font color='#ff0000'>1阶盾牌</font>，<font color='#ff0000'>面纱碎片</font>，以及各类<font color='#28ef01'>雷霆级以上装备</font><br>3.行会拍卖中的道具成功拍出，所有全程参与的玩家都将获得分红奖励<br>4、行会排名前三名的行会成员可获得进入<font color='#ff0000'>盟重·行会地图</font>的资格",
		Remarks = "行会首领说明",
	},
	[2038] = {
		Msg = "1、等级榜排行根据玩家的等级由高到低进行排名<br>2、攻击、魔法、道术榜根据各个职业攻击属性由高到低进行排名",
		Remarks = "排行榜说明",
	},
	[2039] = {
		Msg = "当前精力充沛，基础经验为400%！",
		Remarks = "经验获取上限提示",
	},
	[2040] = {
		Msg = "背包已满，无法合成！",
		Remarks = "装备合成时的提示",
	},
	[2041] = {
		Msg = "1.特惠礼包限时发放，超值好礼等你抢购",
	},
	[2042] = {
		Msg = "注：合服后，天外杀手称号消失",
		Remarks = "天外来客活动tips",
	},
	[2043] = {
		Msg = "说明：<br>1、<font color='#28ef01'>赤月级</font>以上装备熔炼后可获得<font color='#28ef01'>声望</font>；装备等级越高，熔炼获得的声望越多<br>2、熔炼<font color='#28ef01'>赤月级</font>以上装备有概率获得<font color='#28ef01'>真龙锻造书[首饰]</font>、<font color='#28ef01'>热血锻造书[首饰]</font>、<font color='#28ef01'>热血锻造书[武器]</font>、<font color='#28ef01'>热血锻造书[衣服]</font>、<font color='#28ef01'>创造宝石</font>、<font color='#28ef01'>顿悟印记</font>、<font color='#28ef01'>觉醒之石</font>、<font color='#28ef01'>至尊宝石</font>、<font color='#28ef01'>灵魂宝石</font>、<font color='#28ef01'>玛雅宝石</font>、<font color='#28ef01'>祝福宝石</font>、<font color='#28ef01'>英雄宝石</font>、<font color='#28ef01'>幸运宝石</font>、<font color='#28ef01'>血魔结晶</font>、<font color='#28ef01'>金刚符印</font>等高级材料",
		Remarks = "天外来客活动tips",
	},
	[2044] = {
		Msg = "1、玉佩，盾牌，勋章，斗笠，战鼓，面纱可进行觉醒<br>2、觉醒将大幅度增加攻防属性<br>3、觉醒提升到特殊等级将额外获得强力特殊技能<br>4、觉醒后的属性，无论是否佩戴该部位装备都生效",
	},
	[2045] = {
		Msg = "1、火龙级以上的装备可以和对应部位特殊装备进行融合<br>2、融合后基础装备保留原有属性和强化，并获得对应特殊装备的额外属性<br>3、融合后特殊装备将不保留原有强化<br>4、融合后的装备不可再次融合<br>5、特殊装备镶嵌铭文时不可进行融合<br>6、融合和涅槃可同时存在",
	},
	[2046] = {
		Msg = "1、拆分可将合成后的装备拆分成基础装备和特殊装备<br>2、拆分后基础装备保留原有强化，特殊装备不保留原有强化",
	},
	[2047] = {
		Msg = "是否消耗<font color='#28ef01'>额外玉佩试练</font>进入试练之地？",
	},
	[2048] = {
		Msg = "是否消耗<font color='#28ef01'>额外阵法试练</font>进入试练之地？",
	},
	[2049] = {
		Msg = "1、击杀王冠持有者会掉落王冠的象征<br>2、拾取王冠的象征可佩戴王冠<br>3、佩戴王冠被击杀后、离开活动、离线后王冠会掉落<br>4、活动结束时王冠佩戴者所在行会获得胜利<br>5、活动结束时如果没有玩家佩戴王冠，则根据活动中行会成员佩戴王冠的时长作为依据，时长最多的行会获胜",
	},
	[2050] = {
		Msg = "神秘的神龙帝国即将现世，强大的神龙守将与它的分身守卫着神龙帝国的入口<br>只有击败真正的神龙守将可以增加神龙帝国的开启进度，早日进入神龙帝国！尊敬的勇士，你足够强大么！",
		Remarks = "卧龙遗迹说明",
	},
	[2051] = {
		Msg = "传闻魔物首领在被击杀后会在天地大乱、纷争四起的时刻出现在神龙帝国，意图搅乱天下风云，为祸玛法大陆····乱世出英雄！！！尊敬的勇士建功立业的机会到了，快去把握住吧！！！！",
		Remarks = "神龙帝国说明",
	},
	[2052] = {
		Msg = "1、焰火屠魔为多人副本，允许<font color='#28ef01'>1-3人</font>进入挑战；<br>2、根据挑战副本<font color='#28ef01'>花费的时长</font>，评出S、A、B级评分，当获得<font color='#28ef01'>A级</font>评分时，可<font color='#28ef01'>获得</font>首通奖励；<font color='#28ef01'>S级</font>评分时，可<font color='#28ef01'>解锁</font>下一难度；<br>3、<font color='#28ef01'>首次通关</font>副本，将会获得<font color='#28ef01'>首次通关奖励</font>。<font color='#28ef01'>协助</font>其他勇士通关副本，将会获得<font color='#28ef01'>协助奖励</font>；<br>4、协助其他玩家通关副本，将会获得<font color='#28ef01'>“侠义之心”</font>，<font color='#28ef01'>累计数量，<font color='#28ef01'>排名第一</font>，每周将获得<font color='#28ef01'>大量血祭结晶奖励</font>！<br>5、副本进度及排名，会在<font color='#28ef01'>每周一0点重置</font>。重置后，挑战副本会重新获得首次通关奖励。侠义榜将重新积累、排名！<br>6、侠义榜<font color='#28ef01'>整点</font>刷新排名。每周一<font color='#28ef01'>0点</font>更新榜单发放排名奖励",
		Remarks = "多人副本说明",
	},
	[2053] = {
		Msg = "1、<font color='#28ef01'>火龙级及火龙级以上</font>装备打孔后可镶嵌铭文<br>2、铭文需穿戴装备后才生效，同类型铭文只能生效<font color='#28ef01'>三个</font>最高级铭文<br>3、铭文可以通过<font color='#28ef01'>源石切割</font>或<font color='#28ef01'>碎片合成</font>获得",
		Remarks = "铭文说明",
	},
	[2054] = {
		Msg = "1.远古首领因次元的力量变得更加强大，同时也有<font color='#28ef01'>双倍概率</font>掉落极品转生装备<br>2.进入神龙帝国后会碰到来自其他次元的玩家",
	},
	[2055] = {
		Msg = "1、觉醒技能升级失败时有概率降低技能等级<br>2、最强防御无需升级，基础觉醒技能中等级最高的技能将激活同等级的最强防御<br>3、最强伤害无需升级，基础觉醒技能中等级最低的技能将激活同等级的最强伤害",
	},
	[2056] = {
		Msg = "1、限定时间内，完成对应目标，可领取超值奖励<br>2、当天未完成的目标，活动时间内都可以完成",
	},
	[2057] = {
		Msg = "8888次寻宝",
		Remarks = "8888次寻宝",
	},
	[2058] = {
		Msg = "合成转生凭证有概率合成失败<br>成功率：<br>　合成2转凭证：40%<br>　合成3转凭证：50%<br>　合成4转凭证：60%<br>　合成5转凭证：60%",
		Remarks = "转生凭证合成条件",
	},
	[2059] = {
		Msg = "1、开服<font color='#28ef01'>90天以上</font>，且处在<font color='#28ef01'>跨服状态</font>的服务器开放跨服竞技场，<font color='#28ef01'>等级高于100级</font>玩家可以参与<br>2、<font color='#28ef01'>2020年9月1号12点</font>开启第一赛季。每个自然月为一个赛季，<font color='#28ef01'>赛季最后一天21点50</font>关闭匹配，<font color='#28ef01'>22点</font>结算赛季奖励<br>3、竞技场采用<font color='#28ef01'>三局两胜制</font>，胜利、失败或平局都会获得一定的奖励，<font color='#28ef01'>每小局三分钟</font>，小局内击杀对方玩家，视为胜利，双方均未死亡，视为平局<br>4、竞技场匹配次数<font color='#28ef01'>每天零点重置到6次</font>，额外可购买<font color='#28ef01'>3次</font>，<font color='#28ef01'>未使用的次数不保留</font><br>5、每赛季结算<font color='#28ef01'>排名及段位奖励</font>，排名和段位越高，获得奖励越好，积分达到<font color='#28ef01'>1100分</font>才能进入排行榜<br>6、竞技场界面，<font color='#28ef01'>前三名形象整点刷新</font>，竞技场排行榜实时刷新<br>7、主动离开竞技场地图，<font color='#28ef01'>次数将被扣除</font>，且不会获得奖励",
	},
	[2060] = {
		Msg = "1.开服<font color='#28ef01'>8天后</font>会开启<font color='#28ef01'>灵魂殿堂</font>；<br>2.击杀各类BOSS，<font color='#28ef01'>搜索尸体</font>，将有几率获得蕴含怪物灵魂的<font color='#28ef01'>稀有材料</font>；<br>3.前往庄园，通过NPC进入灵魂殿堂，向怪物雕像<font color='#28ef01'>注入灵魂</font>；<br>4.雕像<font color='#28ef01'>每升一级</font>，将会获得对应<font color='#28ef01'>属性奖励</font>；<br>当<font color='#28ef01'>激活多种</font>同类怪物时，将会激发<font color='#28ef01'>灵魂共鸣</font>效果，获得<font color='#28ef01'>大量属性奖励</font>！",
	},
	[2061] = {
		Msg = "挂机小助手已启动",
		Remarks = "启动提示",
	},
	[2062] = {
		Msg = "挂机小助手已关闭",
		Remarks = "关闭提示",
	},
	[2063] = {
		Msg = "<font colorStyleID='10771'> %s </font>  进入 <font colorStyleID='10771'> %s </font> ",
		Remarks = "进入地图提示（玩家名字，地图）",
	},
	[2064] = {
		Msg = "<font colorStyleID='10771'> %s </font> 遭遇了 <font colorStyleID='10771'> %s </font> ，正在进行战斗",
		Remarks = "遭遇提示（玩家名字，怪物名字）",
	},
	[2065] = {
		Msg = "<font colorStyleID='10771'> %s </font> 击杀了 <font colorStyleID='10771'> %s </font> ，获得 %s",
		Remarks = "击杀提示（玩家名字，怪物名字，掉落物）",
	},
	[2066] = {
		Msg = "1.离线10分钟后，自动开启离线挂机助手<br>2.离线挂机助手会自动选择匹配条件的领主进行挑战<br>3.离线挂机助手最多开启12小时，12小时后需收取装备后才可启用。<br>4.回收装备获得传奇币为绑定传奇币<br>5.战斗记录最多保留30条。",
		Remarks = "挂机小助手问号内容",
	},
	[2067] = {
		Msg = "1.站在神皇周围<font color='#28ef01'>6格</font>范围内每<font color='#28ef01'>5秒</font>可获得<font color='#28ef01'>1次</font>泡点奖励<br>2.共有4个神皇停留点：<font color='#28ef01'>神龙市场</font>、<font color='#28ef01'>神龙侧殿</font>、<font color='#28ef01'>神龙花园</font>、<font color='#28ef01'>神龙秘卫</font>，神皇进入停留点时根据当前归属权发放归属奖励；停留时间结束后，玩家活动参与状态将会重置<br>3、活动共有4个奇袭点：<font color='#28ef01'>正门</font>、<font color='#28ef01'>民居</font>、<font color='#28ef01'>神龙花园</font>、<font color='#28ef01'>侧门</font>，点击<font color='#28ef01'>任务栏</font>右侧按钮，在界面中点击奇袭点可进行奇袭",
		Remarks = "镖车帮助问号内容",
	},
	[2068] = {
		Msg = "<font colorStyleID='10061'> 激活青铜会员挂机爆率+50%</font>",
		Remarks = "青铜会员未激活提示",
	},
	[2069] = {
		Msg = "<font colorStyleID='1010'> 青铜会员挂机爆率+50%</font>",
		Remarks = "青铜会员激活提示",
	},
	[2070] = {
		Msg = "<font colorStyleID='1010'> 白银会员挂机爆率+100%</font>",
		Remarks = "白银会员激活提示",
	},
	[2071] = {
		Msg = "<font colorStyleID='1010'> 黄金会员挂机爆率+400%</font>",
		Remarks = "黄金会员激活提示",
	},
	[2072] = {
		Msg = "<font colorStyleID='10771'> %s </font> 回收了装备，获得了传奇币",
		Remarks = "回收装备提示",
	},
	[2073] = {
		Msg = "1、火龙级以上的装备可以和对应部位涅槃装备进行涅槃<br>2、涅槃后基础装备保留原有属性和强化，并获得对应涅槃装备的额外套装<br>3、涅槃后涅槃装备将不保留原有强化<br>4、涅槃后的装备不可再次涅槃<br>5、涅槃装备镶嵌铭文时不可进行融合<br>6、涅槃和融合可同时存在",
	},
	[2074] = {
		Msg = "装备的元素属性合成后会继承",
		Remarks = "元素装备合成",
	},
	[2075] = {
		Msg = "合成的4阶勋章及以上无法分解",
	},
	[2076] = {
		Msg = "巅峰竞技场",
	},
	[2077] = {
		Msg = "1、3转以上的武器可以进行神铸<br>2、神铸前可选择强化路线，选择后将不可更改<br>3、神铸有成功率，提升神铸等级需要消耗相应数量的神铸之锤<br>4、装备合成后会保留神铸属性，更高品质的装备有更高的神铸等级上限",
		Remarks = "冶炼装备提示",
	},
	[2078] = {
		Msg = "1.元素传承后目标装备将继承原始装备的元素等级<br>2.仅限于同部位装备的元素传承",
		Remarks = "元素传承提示",
	},
	[2079] = {
		Msg = "1.<font color='#28ef01'>等级达到35级</font>开启；<br>2.阅读完全部的防骗指南后可领取奖励；<br>3.领取奖励<font color='#28ef01'>7天后</font>可<font color='#28ef01'>重新阅读领奖</font>。",
		Remarks = "防骗指南问号内容",
	},
	[2080] = {
		Msg = "1.开服<font color='#28ef01'>120天</font>，等级达到<font color='#28ef01'>100级</font>，自动接取<font color='#28ef01'>内功激活任务</font>；<br>2.前往盟重省<font color='#28ef01'>酒神随从</font>处，交付内功激活任务，即可获得激活唯一道具：<font color='#28ef01'>推荐信</font>；<br>3.向<font color='#28ef01'>酒神弟子</font>提交<font color='#28ef01'>推荐信</font>、<font color='#28ef01'>300000传奇币</font>，即可成功激活内功；<br>4.激活内功后，击杀高等级怪物即可获得<font color='#28ef01'>内功经验</font>；<br>5.积累足够的内功经验可提升内功等级。每次<font color='#28ef01'>提升</font>内功等级，可<font color='#28ef01'>激活</font>一个<font color='#28ef01'>内功穴位</font>；<br>6.成功激活<font color='#28ef01'>5</font>个穴位后，即可将经脉<font color='#28ef01'>突破</font>到下一重；<br>7.<font color='#28ef01'>突破经脉</font>需要消耗道具：<font color='#28ef01'>金针</font>。经脉重数越高，消耗的金针等级要求越高；<br>8.<font color='#28ef01'>高级金针可以由低级金针合成</font>；<br>9.<font color='#28ef01'>提升内功</font>可获得<font color='#28ef01'>内力值</font>、<font color='#28ef01'>破功值</font>等属性。内力值可减免收到的伤害。拥有破功值，可以削减目标的内力值；<br>10.当内力值<font color='#28ef01'>高于一定比例</font>，会获得<font color='#28ef01'>额外的血量上限</font>、<font color='#28ef01'>血量回复</font>以及<font color='#28ef01'>攻击额外伤害</font>等被动技能；<br>11.随着内功的提升，可提升被动技能的效果；",
		Remarks = "内功说明",
	},
	[2081] = {
		Msg = "1.开服<font color='#28ef01'>29天</font>后，可以对<font color='#28ef01'>元素神兵</font>、<font color='#28ef01'>元素神甲</font>投保；<br>2.<font color='#28ef01'>投保后</font>，元素神兵神甲<font color='#28ef01'>触发掉落</font>时，将会以<font color='#28ef01'>保金的一定金额比例代替</font>掉落。并将元素神兵神甲以<font color='#28ef01'>邮件</font>的方式<font color='#28ef01'>发送回来</font>；<br>3.投保后的装备，将会<font color='#28ef01'>抵消一次</font>掉落；<br>4.已经投保的装备，<font color='#28ef01'>无法重复投保</font>；<br>5.消耗元宝或者传奇币可以进行投保；<br>6.可以选择<font color='#28ef01'>手动弃保</font>，弃保后，将<font color='#28ef01'>返还</font>全额保金；<br>7.弃保操作会消耗一定的传奇币；<br>8.<font color='#28ef01'>已投保</font>的元素装备<font color='#28ef01'>不可合成</font>，弃保才可进行合成操作；",
		Remarks = "投保说明",
	},
	[2082] = {
		Msg = "投保后，元素神装触发掉落，将会通过邮件送回<br>并以您保金的一定比例代替掉落",
		Remarks = "投保简介",
	},
	[2083] = {
		Msg = "已投保的装备无法合成、无法交易、无法上架拍卖行<br>弃保操作会放弃当前的保险状态，并返还全额保金<br>请慎重使用！",
		Remarks = "弃保简介",
	},
	[2084] = {
		Msg = "1、<font color='#28ef01'>觉醒</font>装备打孔后可镶嵌宝石<br>2、宝石镶嵌后即可生效，同类型宝石只能生效<font color='#28ef01'>三个</font>最高级宝石<br>3、宝石可以通过<font color='#28ef01'>拆解天外神石</font>获得<br>4、多余的宝石可通过<font color='#28ef01'>宝石回收</font>回收成神石精华",
		Remarks = "宝石说明",
	},
	[2085] = {
		Msg = "当前精力充沛，基础经验为400%！",
		Remarks = "经验获取上限提示",
	},
	[2086] = {
		Msg = "当前精力充沛，基础经验为300%！",
		Remarks = "经验获取上限提示",
	},
	[2087] = {
		Msg = "当前精力充沛，基础经验为200%！",
		Remarks = "经验获取上限提示",
	},
	[2088] = {
		Msg = "当前正常状态，次日可恢复精力。",
		Remarks = "经验获取上限提示",
	},
	[2089] = {
		Msg = "当前有10倍经验，获得额外10倍经验",
		Remarks = "有经验点存储提示",
	},
	[2090] = {
		Msg = "当前无10倍经验，额外经验存储至盟重-经验鉴定师",
		Remarks = "没有经验点存储提示",
	},
	[2091] = {
		Msg = "1、七日豪礼每天开放一个限时目标，完成目标可领取豪华大礼 <br>2、所有任务开服7天内完成均可获得奖励",
		Remarks = "七日豪礼说明",
	},
	[2092] = {
		Msg = "激活青铜会员挂机爆率+50%",
		Remarks = "离线挂机文本普通",
	},
	[2093] = {
		Msg = "青铜会员挂机爆率+50%",
		Remarks = "离线挂机文本-青铜",
	},
	[2094] = {
		Msg = "白银会员挂机爆率+200%",
		Remarks = "离线挂机文本-白银",
	},
	[2095] = {
		Msg = "黄金会员挂机爆率+400%",
		Remarks = "离线挂机文本-黄金",
	},
	[2100] = {
		Msg = "1、<font color='#28ef01'>角色性别为男性</font>",
		Remarks = "角色性别提示男",
	},
	[2101] = {
		Msg = "1、<font color='#28ef01'>角色性别为女性</font>",
		Remarks = "角色性别提示女",
	},
	[2102] = {
		Msg = "<font color='#078b07' size='15'>您的武器因精神火球而炙热</font>",
	},
	[2103] = {
		Msg = "<font color='#078b07' size='15'>您的剑气已凝聚成型！</font>",
	},
	[2104] = {
		Msg = "<font color='#ffe400' size='18'>激活狂暴可瞬间获得属性加成，允许进入高爆率地图</font>",
		Remarks = "狂暴说明",
	},
	[2105] = {
		Msg = "<font size='16'><font color='#28ef01'>【狂暴】技能：<font color='0xffff0f'>{0}</font><br><font color='#28ef01'>【狂暴】称号：<font color='#FF0000'>【杀死有惊喜】+  全服专属特效</font><br><font color='#28ef01'>【狂暴】属性：<font color='0xffff0f'>对怪伤害+20%</font>     <font color='0xffff0f'>人物爆率+25%</font>     <font color='0xffff0f'>增伤+5%</font><br><font color='#28ef01'>【热心提醒】：<font color='#FF00FF'>狂暴状态下被击杀者失去1000灵符，击杀方获得1000灵符。<br><font color='#28ef01'>【温馨提示】：<font color='0x3ba0ff'>狂暴状态下被怪物击杀，活动场景被击杀，不会失去灵符</font><br>【激活条件】：<font color='#ffe4c7'>拥有3000以上非绑灵符，即可免费开启狂暴，也可手动关闭狂暴。灵符少于3000时，狂暴自动关闭</font>",
		Remarks = "狂暴说明",
	},
	[2106] = {
		Msg = "黄金会员挂机爆率+400% <br>黄金会员挂机爆率+400% ",
	},
	[2107] = {
		Msg = "<font color='#ffe400' size='18'>可用绑定灵符捐献，榜单实时刷新，每天零点清空排名！</font>",
		Remarks = "元宝捐献说明",
	},
	[2108] = {
		Msg = "<font color='#ffffff' size='15'>1.玩家消耗挑战次数选择战神殿的一名玩家对战，<font color='#28ef01'>如果胜利则与该玩家名次对换</font><br>2.战神殿比赛中玩家的最大生命值提高至<font color='#28ef01'>300%</font><br>3.战神殿攻方将获得<font color='#28ef01'>20%攻击加成</font><br>4.每职业<font color='#28ef01'>排行第一</font>可获得专属称号奖励<br>5.比自己排名低的玩家可进行扫荡</font>",
		Remarks = "战神殿说明",
	},
	[2109] = {
		Msg = "各职业排名第一可获得对应职业的专属传奇称号！",
		Remarks = "战神殿界面描述",
	},
	[2110] = {
		Msg = "是否通过时空缝隙召唤特有时空怪物",
		Remarks = "时空缝隙召唤提示面板",
	},
	[2111] = {
		Msg = "所有宠物基础属性相同，不同栏位宠物可同时出战！",
		Remarks = "召唤物系统1",
	},
	[2112] = {
		Msg = "1：宠物需要喂食口粮方可主动出战<br>2：宠物基础属性相同，但是喂食口粮可给宠物增加强力属性<br>3：当更换宠物时，被更换的宠物就会消失掉！<br>4：宠物捕捉需要金刚网，可前往商城购买<br>5:不同栏位宠物可同时出战，最多可同时出战4只宠物！",
		Remarks = "召唤物系统2",
	},
	[2113] = {
		Msg = "特殊技能：攻击时有概率麻痹目标2秒",
		Remarks = "宠物口粮3技能",
	},
	[2114] = {
		Msg = "当前{0}不足，是否再通过消耗{1}元宝来召唤{2}？",
		Remarks = "天外来客 元宝补足提示",
	},
	[2115] = {
		Msg = "泡点经验加成",
		Remarks = "泡点假buff描述",
	},
	[2116] = {
		Msg = "在此状态下可获得十倍泡点经验加成",
		Remarks = "泡点假buff描述",
	},
	[2117] = {
		Msg = "BOSS掉落有归属权，归属者获得boss击杀奖励！",
		Remarks = "世界boss",
	},
	[2118] = {
		Msg = "1、参与活动可获得大量<font color='0x01f801'>元宝</font>、<font color='0x01f801'>经验丹</font>、<font color='0x01f801'>完美装备</font><br>2、神威狱一共<font color='0x01f801'>25</font>层，每层会有一只首领<br>3、击杀小怪可获得<font color='0x01f801'>神威令</font>；<br>4、需击杀本层首领后，才可进入下一层，需要消耗对应数量神威令<br>5、每前进一层都能获得保底奖励<br>6、<font color='0x01f801'>神威令</font>除了打怪获得，还可以通过<font color='0x01f801'>【商城】-【灵符商城】</font>购买",
		Remarks = "神威狱奖励",
	},
	[2119] = {
		Msg = "1、在副本里面任何地方都会获得泡点<font color='0x01f801'>经验</font><br>2、开<font color='0x01f801'>泡点宝箱</font>获得<font color='0x01f801'>经验丹</font>、<font color='0x01f801'>10倍经验丹</font>、<font color='0x01f801'>转生修炼心得</font>等<br>3、每隔<font color='0x01f801'>180</font>秒刷新一波宝箱",
		Remarks = "激情泡点",
	},
	[2120] = {
		Msg = "1、<font color='#28ef01'>战神级以上</font>装备根据<font color='#28ef01'>装备品质</font>生成对应数量的宝石孔<br>2、<font color='0xc532ea'>罕世</font>品质装备携带<font color='#28ef01'>2</font>个宝石孔<br>      <font color='0xffff0f'>传说</font>品质装备携带<font color='#28ef01'>4</font>个宝石孔<br>      <font color='0xff0000'>完美</font>品质装备携带<font color='#28ef01'>6</font>个宝石孔<br>3、宝石镶嵌后即可生效，可选择已镶嵌的孔位进行拆卸<br>4、宝石可以通过<font color='#28ef01'>活动、重楼幻境</font>获得<br>5、装备掉落时<font color='#28ef01'>宝石</font>也随着一起掉落<br>6、同一装备相同类型<font color='#28ef01'>宝石</font>只能镶嵌一种",
		Remarks = "宝石玩法说明",
	},
	[2121] = {
		Msg = "1、<font color='#28ef01'>战神级以上</font>装备根据<font color='#28ef01'>装备品质</font>生成对应数量的铭文孔<br>2、<font color='0xc532ea'>罕世</font>品质装备携带<font color='#28ef01'>1</font>个铭文孔<br>      <font color='0xffff0f'>传说</font>品质装备携带<font color='#28ef01'>2</font>个铭文孔<br>      <font color='0xff0000'>完美</font>品质装备携带<font color='#28ef01'>3</font>个铭文孔<br>3、铭文镶嵌后即可生效，可选择已镶嵌的孔位进行拆卸<br>4、铭文可以通过<font color='#28ef01'>活动</font>获得<br>5、装备掉落时<font color='#28ef01'>铭文</font>也随着一起掉落",
		Remarks = "铭文玩法说明",
	},
	[2122] = {
		Msg = "逆袭",
		Remarks = "热血乱斗 BUFF名称",
	},
	[2123] = {
		Msg = "每次死亡伤害提高{0}%",
		Remarks = "热血乱斗 BUFF描述",
	},
	[2124] = {
		Msg = "<font size='20' color='#ffe4c7'>升级攻略：</font><font size='18' color='#00FFFF'><br>◆玩家前期可依照主线任务进行游戏，快速了解各个系统；</font><font size='18' color='#FF00FF'><br>◆可通过打怪获得经验丹，提升人物等级，怪物掉落经验丹爆率极高，BOSS和首领掉落1万经验的概率更高；</font><font size='18' color='#FFA500'><br>◆练功房内怪物密度大，刷新快会掉落经验丹，推荐拥有群攻技能并达到一定能力后去高倍练功房挂机升级；</font><font size='18' color='#FF0000'><br>◆在拥有10倍经验点的时候，使用经验丹可以额外获得10倍经验，飞速升级！</font></font>",
		Remarks = "攻略描述",
	},
	[2125] = {
		Msg = "<font size='20' color='#ffe4c7'>打金攻略：</font><font size='18' color='#00FFFF'><br>◆尽量前往更高级地图打宝，打怪获得高级装备的几率更大，打到不需要的装备回收获取元宝；极品装备元宝回收有加成，1完美=5传说=10其他品质；</font><font size='18' color='#FF00FF'><br>◆打到高级装备也可以直接挂在拍卖行，换取灵符和元宝；</font><font size='18' color='#FFA500'><br>◆本游戏回收装备获得的元宝都是非绑定，可在安全区上方当铺老板处兑换成元宝箱挂在拍卖行出售；</font><font size='18' color='#FF0000'><br>◆50级以上武器、衣服回收可获得灵符，永久回收、无次数限制</font></font>",
		Remarks = "攻略描述",
	},
	[2126] = {
		Msg = "<font size='20' color='#ffe4c7'>进阶攻略：</font><font size='18' color='#00FFFF'><br>◆黄金会员开启随身回收，钻石会员开启自动回收，会员特权除了充值外还可通过捐献完美级装备白嫖；</font><font size='18' color='#FF00FF'><br>◆越高级的会员特权拥有的特权越多，拥有超高属性加成、装备回收加成，还可以免费进入海量地图；</font><font size='18' color='#FFA500'><br>◆安全区上方还有狂暴使者和捐献榜；狂暴开启后有10%几率对怪物鞭尸，获得双倍掉落奖励，还能进入狂暴地图击杀高级怪物；</font><font size='18' color='#FF0000'><br>◆捐献上榜后可获得专属称号和大量免伤属性，并且开启捐献地图</font></font>",
		Remarks = "攻略描述",
	},
	[2127] = {
		Msg = "<font color='#ffe4c7'>1、转动转盘可随机获得奖励，转盘的消耗逐次递增。</font>",
		Remarks = "经验转盘描述",
	},
	[2128] = {
		Msg = "<font colorStyleID='1030'>1.重铸出的极品属性类型需要点击“保存属性”按钮才会生效<br>2.重铸只会改变装备极品属性类型，不会改变装备品质<br>3.切换装备或关闭界面，未保存的重铸属性将不会保留<br>4.开光后的装备重铸不会影响极品属性词条数量</font>",
		Remarks = "装备重铸提示",
	},
	[2129] = {
		Msg = "1、怪物死亡后，装备、道具会掉落在地上，一分钟保护时间后，才可以拾取<br>2、怪物<font color='#28ef01'>每日2点、6点、10点、14点、18点、22点</font>，整点刷新",
		Remarks = "转生boss提示文本",
	},
	[2130] = {
		Msg = "<font color='#00FFFF'>极品装备回收元宝加成</font> 1<font color='0xff0000'>完美</font>=5<font color='0xffff0f'>传说</font>=10<font color='0xc532ea'>其他</font>",
		Remarks = "回收面板提示",
	},
	[2131] = {
		Msg = "<font color='#28ef01'>当前位置怪兽较少，建议使用<font color='#FF0000'>随机石</font>或前往<font color='#FF0000'>地图深处</font></font>",
	},
	[2132] = {
		Msg = "升级行会等级全员获得大量属性加成",
		Remarks = "行会属性tips描述",
	},
	[2133] = {
		Msg = "1.福利之塔达到10层之后每天可领取一次每日工资<br>2.福利之塔层数越高奖励越好，工资越多<br>3.每通关10层可领取额外奖励",
		Remarks = "福利之塔面板描述",
	},
	[2134] = {
		Msg = "<font size='16' color='0x28ef01'>规则描述：</font><br><font size='16' color='0xffff0f'>免费找回：免费找回一定比例的资源</font><br><font size='16' color='0x28ef01'>灵符找回：灵符找回可以找回全部资源</font><br><font size='16' color='0xffffff'>未完成的山庄首领、山庄圣物、山庄货运可在次日找回，最多累计三天</font>",
	},
	[2135] = {
		Msg = "<font colorStyleID='1030'>1.只有完美等级的装备才可开光<br>2.开光后可增加极品属性数量，最多可增加两条<br>3.开光后的装备重铸不会影响已增加的极品属性词条数量<br>4.已开光的装备回收时100%返还开光石，请放心使用</font>",
		Remarks = "装备重铸提示",
	},
	[2136] = {
		Msg = "【一层： 激活称号[煊赫千古] 】<br>【二层： 激活称号[日月为身] 】<br>【三层： 激活称号[一刃横天] 】<br>【四层： 激活称号[得此一生] 】",
		Remarks = "称号神殿进入限制说明",
	},
	[2137] = {
		Msg = "【一层： 激活时装 [骷髅战士披风]      】<br>【二层： 激活时装[骷髅披风]    】<br>【三层： 激活时装[雪人披风 】<br>【三层： 激活时装[祖玛披风] 】",
		Remarks = "神之领域进入限制说明",
	},
	[2138] = {
		Msg = "60级以上武器、衣服极品等级越高回收获得灵符越多，可在背包内无限回收",
		Remarks = "极品回收界面描述",
	},
	[2139] = {
		Msg = "1、您可以通过天降鸿福的方式参与寻宝活动，<br>2、目前游戏内有寻宝1次、10次、60次，3个选项。<br>3、寻宝奖励产生的道具内容：特戒、神装、普通装备、高级材料、低级材料等等游戏内道具。每种道具的掉落概率都会不同。<br>具体内容如下：<br>第一档奖励获取概率：1.3%<br>第二档奖励获取概率：5.3%<br>第三档奖励获取概率：24.7%<br>第四档奖励获取概率：68.7%",
		Remarks = "兔子寻宝",
	},
	[2140] = {
		Msg = "玛法大陆最早的天外战场，因为常年发生战争，环境逐渐沾染杀戮气息，里面的怪物逐渐变得狂躁。<br><br>--------------------------<br><br><font color='0xffff0f'>BOSS死亡60秒才能拾取奖励</font>",
		Remarks = "转生活动tips描述",
	},
	[2141] = {
		Msg = "<font size='14' color='0xffff0f'>★ <font size='16' color='0xffff0f'>通关50层必得5级宝石，有概率出稀有属性宝石</font><br><font size='14' color='0x28ef01'>★ <font size='16' color='0x28ef01'>每5层掉落大量宝石</font><br><font size='14' color='0x28ef01'>★ <font size='16' color='0x28ef01'>每10层掉落大量高级宝石</font><br><font size='14' color='0x28ef01'>★ <font size='16' color='0x28ef01'>普通骰子使用后，1-6层随机层数</font><br><font size='14' color='0x28ef01'>★ <font size='16' color='0x28ef01'>黄金骰子使用后，可指定点数，更快前往目标层数</font><br><font size='14' color='0xffff0f'>★ <font size='16' color='0xffff0f'>挑战进度每日重置</font>",
		Remarks = "重楼幻境描述",
	},
	[2142] = {
		Msg = "提高50的对怪伤害，增加400攻速，<br>怪物死亡10%几率双倍掉落",
		Remarks = "狂暴之力buff描述",
	},
	[2143] = {
		Msg = "游戏攻略：登录游戏，完成主线会获得新手系列神炉装备，分为玉佩：提升暴击伤害，同时能减少受到的暴击伤害，穿上我能一打五；斗笠：提升切割伤害，越级打怪更轻松；战鼓：大量增加生命值，阶数越高越耐抗；勋章：降低受到怪物的伤害，提升神炉装备会获得较大实力提升。<br>首充玩家：充值100元档，除了获得无级别穿戴完美品质、极品属性黄金武器以外，还有60级完美开天装备，更有可升级冰冻怪物时装寒冰剑，刀刀冰冻挂机更轻松。<br>特权玩家：建议购买至特权-至尊会员，在获得额外属性增加之外，自动回收、自动拾取开启。打怪，回收元宝两不误<br>土豪玩家：建议直接购买特权-传说会员，前期直接获得1000对怪固伤，打怪如砍瓜切菜。自动回收、自动买药、自动拾取、随身仓库功能开启，元宝回收获得收益再加50%。允许镇魔之地，再次镇压里面被关押的首领。直接获得绝版群体麻痹技能【十步一杀】；",
		Remarks = "前期攻略",
	},
	[2144] = {
		Msg = "前期攻略:第一时间进入游戏，首充任意金额，即可获得完美黄金武器，前期打怪大大速度增加；随着主线进行，遇到人多时可前往下一层。<br>前期新手地图：散人天堂、丛林迷宫、神秘地图，每个名称对应都有三张地图击杀怪物都能完成任务，遇到人多时候可前往另外两张地图进行杀怪。<br>回收掉落在地上的装备，可以获得元宝，回收雷霆级以上武器、衣服可获得灵符和战鼓碎片收益；元宝作为日常重要消耗货币之一，在合成、锻造、商城里需要大量消耗；<br>灵符充裕，推荐购买特权，会员除了超大属性增幅外，特别对回收元宝还有最高额外50%的加成，比普通玩家获得元宝速度的150%；成为会员还可获得随身回收、自动买药、镇魔之地、随身仓库、自动回收、自动拾取萌宠熊猫，更有绝版技能书【开天斩】、【十步一杀】相赠，无论打怪PK战无不胜；<br>中期攻略：相比新手引导地图，后续地图爆率也随之增加，难度也随之增加的，可通过盟重-锻造npc对身上穿戴的玉佩、斗笠、战鼓、勋章进行合成，对神炉子专属技能进行升级。同时也可以通过消耗风云令在盟重-官职npc提升自身官职，来增加攻击、受怪减伤、对怪伤害。<br>",
		Remarks = "进阶攻略",
	},
	[2150] = {
		Msg = "玛法大陆最早的打宝圣地之一，地图里面会掉落大量新手系列神炉装备，元宝、经验等。",
		Remarks = "打宝殿堂描述",
	},
	[2151] = {
		Msg = "<font color='0xff0000'>达到推荐攻击要求即可获得练功房最大收益</font><br>【练功房：攻击＜700】【1.5倍◇练功房：攻击＞700】<br>【2倍◇练功房：攻击＞2600】【3倍◇练功房：攻击＞5000】<br>【4倍◇练功房：攻击＞11000】【5倍◇练功房：攻击＞24000】",
		Remarks = "练功房进入限制说明",
	},
	[2152] = {
		Msg = "道术伤害增加{0}倍 {1}秒",
		Remarks = "无极真气聊天框描述",
	},
	[2153] = {
		Msg = "玛法先祖地域邪神的战场之一，邪神身陨后，他的血液却滋养这一方怪物，里面的怪物逐渐变得狂躁。<br><font color='0xffff0f'>可凭借威压在此作战</font>",
		Remarks = "邪血神殿描述",
	},
	[2154] = {
		Msg = "【福利地图1层：3转以下可进】【福利地图2层：3-5转可进】<br>【福利地图3层：6转以上可进】<br>【福利地图4层：3转以上3层传送员进入】<br>【福利地图5层：6转以上4层传送员进入】",
		Remarks = "福利地图描述",
	},
	[2155] = {
		Msg = "【黄巾之战：4转可进入】【讨伐袁术：4转可进入】<br>【江东之战：5转可进入】【长坂坡之战：5转可进入】<br>【官渡之战：6转可进入】【赤壁之战：6转可进入】<br>【虎牢之战：7转可进入】",
		Remarks = "福利地图描述",
	},
	[2156] = {
		Msg = "道具不足，击杀封魔-特权首领、领取日常奖励可获得！",
		Remarks = "没有挖掘道具的提示",
	},
	[4031] = {
		Msg = "可通过弹劾工具人会长，成为会长，商城有行会改名卡出售<br>1、每天15：00行会首领，装备道具掉不停<br>2、第5天我们一起拿沙！",
		Remarks = "系统行会公告",
	},
	[4032] = {
		Msg = "1、完成日常精英挑战即可获得炼丹材料<br>2、收集炼丹材料后，可回到红土大陆-八卦炉处炼制丹药<br>3、炼丹有成功率，20%概率成功，失败后获得药渣<br>4、紫金炉因为材质特殊，可承受住三昧真火，在获得三昧真火后，丹药炼制成功率将大幅提升",
		Remarks = "炼丹炉",
	},
	[4033] = {
		Msg = "<font color='0xa38d70'>炼制丹药和灵器时不会出现失败药<br>炼丹和炼器效率提升50%<br><br><font color='0xff0000'>罕见的异火，可增加火焰的穿透力，使丹药品质更上一层楼。</font>",
		Remarks = "三昧真火未激活描述",
	},
	[4034] = {
		Msg = "<font color='0xa38d70'>炼制丹药时不会出现失败<br>炼丹和炼器效率提升20%<br><br><font color='0xff0000'>仅存于世的上品炼丹炉之一，铸造的时候，加入稀有的紫庚金，使炉子更加稳定。</font>",
		Remarks = "紫金炉未激活描述",
	},
	[4035] = {
		Msg = "基础成功率：<font color='0x01f801'>20%</font>，可通过紫金炉，三昧真火提升！",
		Remarks = "炼丹炉界面描述",
	},
	[4036] = {
		Msg = "<font color='0x01f801'>炼制丹药和灵器时不会出现失败<br>炼丹和炼器效率提升50%<br><br><font color='0xff0000'>罕见的异火，可增加火焰的穿透力，使丹药品质更上一层楼。</font>",
		Remarks = "三昧真火激活描述",
	},
	[4037] = {
		Msg = "<font color='0x01f801'>炼制丹药时不会出现失败<br>炼丹和炼器效率提升20%<br><br><font color='0xff0000'>仅存于世的上品炼丹炉之一，铸造的时候，加入稀有的紫庚金，使炉子更加稳定。</font>",
		Remarks = "紫金炉激活描述",
	},
	[4038] = {
		Msg = "修炼卷中的奇技每提升1级增加百分比效果，修炼失败会降级",
		Remarks = "上古卷轴描述",
	},
	[4039] = {
		Msg = "全部技能达到指定等级可激活“上古之力”属性",
		Remarks = "上古卷轴描述",
	},
	[4040] = {
		Msg = "总修炼次数达到500次，花费288800灵符可一键升满所有技能",
		Remarks = "上古卷轴描述",
	},
	[4041] = {
		Msg = "全身幸运达到13点触发刀刀最高伤害<br>祝福失败幸运-1，强7为保护点",
		Remarks = "幸运项链描述",
	},
	[4042] = {
		Msg = "项链幸运达到6及以上，项链不可回收",
		Remarks = "幸运项链描述",
	},
	[4043] = {
		Msg = "<font color='0xff0000'>{0}共可献祭{1}次<br><font color='#9C7AAF'>当前{2}献祭次数为：<font color='#9C7AAF'>{3}</font>",
		Remarks = "剑甲献祭描述",
	},
	[4046] = {
		Msg = "14-23阶剑甲献祭全满可获得永久属性<br><font color='0xff0000'>属性：<font color='#7dfcfe'>生命+4500、攻击+900、防御+900<br><font color='0xff0000'>属性：<font color='#7dfcfe'>打怪伤害+90%、打怪爆率+90%</font>",
		Remarks = "剑甲献祭描述",
	},
	[4047] = {
		Msg = "<font color='#9C7AAF'>进击的战鼓原本属性极低，可通过吞噬巨人胆汁和巨人心脏使其不断成长</font>",
		Remarks = "战鼓晋级描述",
	},
	[4048] = {
		Msg = "每次进化都会附加<font color='0x01f801'>{0}</font>和<font color='0x01f801'>{1}</font>，最高成长到<font color='0x01f801'>{2}</font>",
		Remarks = "战鼓晋级描述",
	},
	[4049] = {
		Msg = "如果对成长属性不满意还可以清零重新成长",
		Remarks = "战鼓晋级描述",
	},
	[4050] = {
		Msg = "1、战鼓进化可获得大量成长属性<br>2、晋级成下阶战鼓后，成长属性会被继承",
		Remarks = "战鼓晋级描述",
	},
	[4051] = {
		Msg = "1、只有<font color='0x01f801'>归属的玩家</font>获得奖励<br>2、可通过花费一定灵符，进入对应四圣兽副本获得单独奖励，且不会有他人来争夺",
		Remarks = "四象圣殿描述",
	},
	[4052] = {
		Msg = "激活荣耀会员特权，开启自动使用经验卷、元宝",
		Remarks = "自动使用道具描述",
	},
	[4053] = {
		Msg = "<font color='0x01f801'>1.幸运可以免费转移至其他项链<br>2.幸运达到强6以后每级增加特殊效果<br>3.幸运强化有概率失败，失败则减少1点幸运，幸运+7为保护点，达到+7后不会降低到7以下<br>4.全身幸运达到13点触发刀刀最高伤害</font>",
		Remarks = "幸运项链玩法说明",
	},
	[4060] = {
		Msg = "龙珠「普通」·1阶  生命：200  攻击：20-20  魔法：20-20  道术：20-20<br>龙珠「精良」·1阶  生命：300  攻击：30-30  魔法：30-30  道术：30-30<br>龙珠「优秀」·1阶  生命：400  攻击：40-40  魔法：40-40  道术：40-40<br>龙珠「稀有」·1阶  生命：500  攻击：50-50  魔法：50-50  道术：50-50<br>龙珠「完美」·1阶  生命：600  攻击：60-60  魔法：60-60  道术：60-60",
		Remarks = "龙珠属性预览",
	},
	[4061] = {
		Msg = "龙珠「完美」·3阶：10%概率触发蛛网束缚敌人减速3秒<br>龙珠「完美」·4阶：10%概率触发蛛网束缚敌人减速4秒<br>龙珠「完美」·5阶：10%概率触发蛛网束缚敌人减速5秒<br>龙珠「完美」·6阶：8%概率触发蛛网减速敌人3秒、8%概率触发禁锢困囚敌人1秒<br>龙珠「完美」·7阶：8%概率触发蛛网减速敌人3秒、8%概率触发禁锢困囚敌人2秒<br>龙珠「完美」·8阶：8%概率触发蛛网减速敌人4秒、8%概率触发禁锢困囚敌人3秒<br>龙珠「完美」·9阶：8%概率触发蛛网减速敌人5秒、8%概率触发禁锢困囚敌人3秒<br>龙珠「完美」·10阶：5%概率触发蛛网减速敌人5秒、5%概率触发禁锢困囚敌人3<br>秒、5%概率斩杀敌人20%血量",
		Remarks = "龙珠效果预览",
	},
	[4071] = {
		Msg = "初级保险：卷轴投保后，6-10失败只掉到5级。",
		Remarks = "上古卷轴初级宝箱",
	},
	[4072] = {
		Msg = "中级保险：卷轴投保后，12-15失败只掉到12级。",
		Remarks = "上古卷轴中级宝箱",
	},
	[4073] = {
		Msg = "高级保险：卷轴投保后，16-20失败只掉到16级。",
		Remarks = "上古卷轴高级宝箱",
	},
	[4074] = {
		Msg = "1、卷轴中奇技每提升1级，获得对应稀有属性百分比增加。<br>2、失败会掉一定等级，推荐购买保险。<br>3、奇技1-5级成功概率100%，6-10失败后等级掉到1，可通过购买保险减少损失。<br>4、初级保险，可直接购买，购买后失败只会掉到5级。<br>5、中级保险，需要卷轴中奇技均达到10级方可购买，购买后12-15失败只会掉到12级。<br>6、高级保险，需要卷轴中奇技均达到16级可购买，购买后16-20失败只会掉到16级。",
		Remarks = "上古卷轴玩法说明",
	},
	[4075] = {
		Msg = "<font color='0x01f801'>失败后主材料不会消失</font>",
		Remarks = "神兵利器界面描述",
	},
	[4076] = {
		Msg = "激活荣耀会员特权，开启材料仓库自动储存、快捷合成",
		Remarks = "材料仓库提示",
	},
	[4077] = {
		Msg = "1、可通过击杀怪物获得神魔之体的炼体材料<br>2、对应炼体达到5级后，开启其他炼体<br>3、炼体可获得防御、魔防加成，攻魔道属性，生命加成，打怪爆率加成<br>4、幸运宝石每次升级最多只能使用4个",
		Remarks = "神魔之体玩法",
	},
}
return config