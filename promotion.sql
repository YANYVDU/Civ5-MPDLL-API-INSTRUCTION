--integer、text、boolean分别需要输入整数、字符和true/false
--如果某个明确标注了功能的接口使用无效，请自行查阅源码寻找是否有全局设置限制其启用与否
CREATE TABLE "UnitPromotions" (
	"ID"	integer,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--必须唯一，所有标识有NOT NULL的列不能为空，否则闪退
	"Description"	text,--名字
	"Help"	text,--效果简述
	"DisabledHelp"	text,--不能选取时的提示文本
	"Button"	text,--按钮图标路径，一般不写
	"PortraitIndex"	integer DEFAULT 9,--图标索引
	"IconAtlas"	text DEFAULT 'ABILITY_ATLAS',--图标图集
	"HotKey"	text,--快捷键
	"HotKeyAlt"	text,--备选快捷键
	"HotKeyPriority"	integer DEFAULT 0,--快捷键优先级
	"HotKeyPriorityAlt"	integer DEFAULT 0,--备选快捷键优先级
	"OrderPriority"	integer DEFAULT 0,--晋升列表中的排序优先级
	"AltDown"	boolean DEFAULT 0,--快捷键需要按下Alt
	"AltDownAlt"	boolean DEFAULT 0,--备选快捷键需要按下Alt
	"ShiftDown"	boolean DEFAULT 0,--快捷键需要按下Shift
	"ShiftDownAlt"	boolean DEFAULT 0,--备选快捷键需要按下Shift
	"CtrlDown"	boolean DEFAULT 0,--快捷键需要按下Ctrl
	"CtrlDownAlt"	boolean DEFAULT 0,--备选快捷键需要按下Ctrl
	"Sound"	text,--选中音效
	"CannotBeChosen"	boolean DEFAULT 0,--不能通过升级手动选取获得
	"LostWithUpgrade"	boolean DEFAULT 0,--单位升级后失去此晋升
	"NotWithUpgrade"	boolean DEFAULT 0,--单位升级时不赠送此晋升作为新单位的免费晋升（升级获取的新单位不会获得此晋升，只能通过正常建造获得）
	"InstaHeal"	boolean DEFAULT 0,--获得此晋升时立刻回满血
	"Leader"	boolean DEFAULT 0,--领袖晋升：获得时不消耗等级，需要关联领袖单位（warlord），获得后继承领袖名字/外观并获得经验
	"Blitz"	boolean DEFAULT 0,--额外获得一次攻击次数
	"Amphib"	boolean DEFAULT 0,--消除海上登陆的战斗力惩罚
	"River"	boolean DEFAULT 0,--消除跨河攻击的战斗力惩罚
	"EnemyRoute"	boolean DEFAULT 0,--能够使用敌方道路
	"RivalTerritory"	boolean DEFAULT 0,--允许在未签订开放边界协议的情况下进入其他文明领土
	"MustSetUpToRangedAttack"	boolean DEFAULT 0,--必须先架设（消耗移动力）才能进行远程攻击
	"RangedSupportFire"	boolean DEFAULT 0,--每次近战战斗开始前先自动进行一轮远程攻击（先手打击）
	"CanMoveAfterAttacking"	boolean DEFAULT 0,--允许攻击后继续移动
	"AlwaysHeal"	boolean DEFAULT 0,--每回合都会回复生命值（无论做了什么动作）
	"HealOutsideFriendly"	boolean DEFAULT 0,--允许在友方地域外回复生命值
	"HillsDoubleMove"	boolean DEFAULT 0,--丘陵地块上移动仅消耗1移动力
	"RoughTerrainEndsTurn"	boolean DEFAULT 0,--进入粗糙地形（丘陵/森林/丛林等）后立刻消耗全部剩余移动力，结束回合
	"IgnoreTerrainCost"	boolean DEFAULT 0,--忽视地形导致的额外移动力消耗（移动力消耗统一为1）
	"HoveringUnit"	boolean DEFAULT 0,--悬浮单位，可穿越山脉/水面等地形障碍
	"FlatMovementCost"	boolean DEFAULT 0,--所有地形耗费1移动力
	"CanMoveImpassable"	boolean DEFAULT 0,--可进入冰区等不可通行地块
	"NoCapture"	boolean DEFAULT 0,--不能占领城市
	"OnlyDefensive"	boolean DEFAULT 0,--只能防御，不能主动攻击
	"NoDefensiveBonus"	boolean DEFAULT 0,--没有地形/驻防等带来的防御加成
	"NukeImmune"	boolean DEFAULT 0,--免疫核打击
	"HiddenNationality"	boolean DEFAULT 0,--隐藏国籍，单位不显示所属文明，可攻击任何单位而不触发战争
	"AlwaysHostile"	boolean DEFAULT 0,--始终被视为敌对单位，任何文明均可攻击
	"NoRevealMap"	boolean DEFAULT 0,--移动时不揭示地图（不驱散战争迷雾），路径寻路也不视为探路行为
	"Recon"	boolean DEFAULT 0,--侦查单位视野+1（六格范围可见）
	"CanMoveAllTerrain"	boolean DEFAULT 0,--允许在所有地形上移动
	"FreePillageMoves"	boolean DEFAULT 0,--劫掠改良设施不消耗移动力
	"AirSweepCapable"	boolean DEFAULT 0,--能够进行空中游猎以消灭敌方拦截单位
	"AllowsEmbarkation"	boolean DEFAULT 0,--允许上船海运
	"EmbarkedAllWater"	boolean DEFAULT 0,--允许在深海（大洋）格上船海运
	"HealIfDestroyExcludesBarbarians"	boolean DEFAULT 0,--消灭非野蛮人单位后回复15HP
	"RangeAttackIgnoreLOS"	boolean DEFAULT 0,--可越过障碍物（山脉/丘陵等）进行远程攻击
	"CityAttackOnly"	boolean DEFAULT 0,--只能攻击城市，不能攻击单位
	"CaptureDefeatedEnemy"	boolean DEFAULT 0,--击败敌方单位时可以将其俘虏转化为己方单位
	"HealOnPillage"	boolean DEFAULT 0,--劫掠地块后完全治愈该单位（回满血，而非默认的固定数值）
	"IgnoreGreatGeneralBenefit"	boolean DEFAULT 0,--无视大将军/陆军统帅的光环加成
	"IgnoreZOC"	boolean DEFAULT 0,--无视敌方单位的区域控制（ZOC）
	"HasPostCombatPromotions"	boolean DEFAULT 0,--在完成首次作战后，获得一项随机的特殊晋升
	"PostCombatPromotionsExclusive"	boolean DEFAULT 0,--战后随机晋升排除规则：0=排除当前单位已有晋升，1=排除该玩家任意单位已拥有的晋升
	"RangedAttackModifier"	integer DEFAULT 0,--远程攻击力加成百分比
	"InterceptionCombatModifier"	integer DEFAULT 0,--拦截时战斗力加成百分比
	"InterceptionDefenseDamageModifier"	integer DEFAULT 0,--遭受拦截时的损伤变化比例
	"AirSweepCombatModifier"	integer DEFAULT 0,--空中游猎战斗力加成百分比
	"ExtraAttacks"	integer DEFAULT 0,--每回合额外攻击次数
	"ExtraNavalMovement"	integer DEFAULT 0,--海上额外移动力
	"VisibilityChange"	integer DEFAULT 0,--视野范围变化（正值增加，负值减少）
	"MovesChange"	integer DEFAULT 0,--移动力变化
	"MoveDiscountChange"	integer DEFAULT 0,--移动力折扣变化：降低各种地形上的移动力消耗
	"RangeChange"	integer DEFAULT 0,--攻击范围变化
	"InterceptChanceChange"	integer DEFAULT 0,--拦截概率变化，一般写100表示必定拦截
	"NumInterceptionChange"	integer DEFAULT 0,--每回合可执行拦截的次数变化
	"EvasionChange"	integer DEFAULT 0,--规避拦截能力变化（正值更难被拦截，如隐形轰炸机）
	"CargoChange"	integer DEFAULT 0,--可运载单位数量变化
	"EnemyHealChange"	integer DEFAULT 0,--敌方地块额外回血量
	"NeutralHealChange"	integer DEFAULT 0,--中立地块额外回血量
	"FriendlyHealChange"	integer DEFAULT 0,--友方地块额外回血量
	"SameTileHealChange"	integer DEFAULT 0,--与友军同格时额外回血量
	"AdjacentTileHealChange"	integer DEFAULT 0,--邻近友军时额外回血量
	"EnemyDamageChance"	integer DEFAULT 0,--在敌方地块停留时受到伤害的概率
	"NeutralDamageChance"	integer DEFAULT 0,--在中立地块停留时受到伤害的概率
	"EnemyDamage"	integer DEFAULT 0,--在敌方地块停留时受到的伤害值
	"NeutralDamage"	integer DEFAULT 0,--在中立地块停留时受到的伤害值
	"CombatPercent"	integer DEFAULT 0,--战斗力加成百分比
	"CityAttack"	integer DEFAULT 0,--攻击城市时战斗力加成百分比
	"CityDefense"	integer DEFAULT 0,--防守城市时战斗力加成百分比
	"RangedDefenseMod"	integer DEFAULT 0,--对远程攻击的防御加成百分比
	"HillsAttack"	integer DEFAULT 0,--在丘陵上攻击时战斗力加成百分比
	"HillsDefense"	integer DEFAULT 0,--在丘陵上防御时战斗力加成百分比
	"OpenAttack"	integer DEFAULT 0,--在开阔地形（平原/草原等）攻击时战斗力加成百分比
	"OpenRangedAttackMod"	integer DEFAULT 0,--对处于开阔地形的敌人进行远程攻击时加成百分比
	"OpenDefense"	integer DEFAULT 0,--在开阔地形防御时战斗力加成百分比
	"RoughAttack"	integer DEFAULT 0,--在复杂地形攻击时战斗力加成百分比
	"RoughRangedAttackMod"	integer DEFAULT 0,--对处于复杂地形的敌人进行远程攻击时加成百分比
	"RoughDefense"	integer DEFAULT 0,--在复杂地形防御时战斗力加成百分比
	"AttackFortifiedMod"	integer DEFAULT 0,--攻击驻防单位时战斗力加成百分比
	"AttackWoundedMod"	integer DEFAULT 0,--攻击受伤单位时战斗力加成百分比
	"FlankAttackModifier"	integer DEFAULT 0,--侧翼攻击加成百分比
	"NearbyEnemyCombatMod"	integer DEFAULT 0,--每个邻近敌方单位带来的战斗力变化
	"NearbyEnemyCombatRange"	integer DEFAULT 0,--邻近敌人战斗力变化判定的范围（最大为2）
	"UpgradeDiscount"	integer DEFAULT 0,--单位升级费用折扣百分比（100=免费升级）
	"ExperiencePercent"	integer DEFAULT 0,--通过战斗获得经验的百分比变化
	"AdjacentMod"	integer DEFAULT 0,--邻近友军时战斗力加成百分比
	"AttackMod"	integer DEFAULT 0,--攻击时战斗力加成百分比（通用）
	"DefenseMod"	integer DEFAULT 0,--防御时战斗力加成百分比（通用）
	"DropRange"	integer DEFAULT 0,--空降/空投范围
	"GreatGeneral"	boolean DEFAULT 0,--该单位被视作陆军统帅（大将军）
	"GreatAdmiral"	boolean DEFAULT 0,--该单位被视作海军统帅
	"GreatGeneralModifier"	integer DEFAULT 0,--催生大将军/海军统帅的伟人点数积累比例变化
	"GreatGeneralReceivesMovement"	boolean DEFAULT 0,--与该单位同格的大将军将以该单位的速度前进
	"GreatGeneralCombatModifier"	integer DEFAULT 0,--和陆军统帅在同一格时战斗力加成百分比
	"FriendlyLandsModifier"	integer DEFAULT 0,--在己方领土内作战时战斗力加成百分比
	"FriendlyLandsAttackModifier"	integer DEFAULT 0,--在己方领土内攻击时战斗力加成百分比
	"OutsideFriendlyLandsModifier"	integer DEFAULT 0,--在境外作战时战斗力加成百分比
	"HPHealedIfDestroyEnemy"	integer DEFAULT 0,--消灭敌方单位后回复的生命值
	"ExtraWithdrawal"	integer DEFAULT 0,--面对近战攻击时撤退的概率加成
	"EmbarkExtraVisibility"	integer DEFAULT 0,--海运时额外视野范围
	"EmbarkDefenseModifier"	integer DEFAULT 0,--海运时防御加成百分比
	"CapitalDefenseModifier"	integer DEFAULT 0,--在首都作战时防御加成百分比
	"CapitalDefenseFalloff"	integer DEFAULT 0,--首都防御加成随距离衰减系数：每远离首都1格，CapitalDefenseModifier减少此值
	"CityAttackPlunderModifier"	integer DEFAULT 0,--攻击城市时获取该城市产出百分比的金币
	"ReligiousStrengthLossRivalTerritory"	integer DEFAULT 0,--进入未开放边界地块时每回合宗教力量下降百分比
	"TradeMissionInfluenceModifier"	integer DEFAULT 0,--进行贸易任务时影响力变化比例
	"TradeMissionGoldModifier"	integer DEFAULT 0,--进行贸易任务时金币变化比例
	"GoldenAgeValueFromKills"	integer DEFAULT 0,--消灭敌方单位时获得的黄金时代点数
	"Sapper"	boolean DEFAULT 0,--工兵：在紧邻敌方城市时为附近友方单位提供攻城加成
	"HeavyCharge"	boolean DEFAULT 0,--重型冲锋：如果对敌方造成的伤害大于己方所受伤害，可将敌方单位击退一格
	"LayerAnimationPath"	text DEFAULT NULL,--动画分层渲染路径（AnimationPathTypes枚举），一般不需要写
	"TechPrereq"	text DEFAULT NULL,--需要前置科技
	"Invisible"	text DEFAULT NULL,--隐身类型（填写INVISIBLE_SUBMARINE等InvisibleInfos的Type）
	"SeeInvisible"	text DEFAULT NULL,--反隐类型：可以探测到对应Invisible类型的隐身单位
	"PromotionPrereq"	text DEFAULT NULL,--必须拥有的前置晋升1（必须满足）
	"PromotionPrereqOr1"	text DEFAULT NULL,--可选前置晋升2
	"PromotionPrereqOr2"	text DEFAULT NULL,--可选前置晋升3
	"PromotionPrereqOr3"	text DEFAULT NULL,--可选前置晋升4
	"PromotionPrereqOr4"	text DEFAULT NULL,--可选前置晋升5
	"PromotionPrereqOr5"	text DEFAULT NULL,--可选前置晋升6
	"PromotionPrereqOr6"	text DEFAULT NULL,--可选前置晋升7
	"PromotionPrereqOr7"	text DEFAULT NULL,--可选前置晋升8
	"PromotionPrereqOr8"	text DEFAULT NULL,--可选前置晋升9
	"PromotionPrereqOr9"	text DEFAULT NULL,--可选前置晋升10
	"PediaType"	text,--百科分类类型
	"PediaEntry"	text,--百科条目标签，一般和Description相同
	"IgnoreTerrainDamage"	INTEGER DEFAULT 0,--无视地形导致的每回合伤害
	"IgnoreFeatureDamage"	INTEGER DEFAULT 0,--无视地貌导致的每回合伤害
	"ExtraTerrainDamage"	INTEGER DEFAULT 0,--地形额外伤害加成
	"ExtraFeatureDamage"	INTEGER DEFAULT 0,--地貌额外伤害加成
	"IsCrops"	BOOLEAN DEFAULT 0,--该晋升使单位成为军团（多单位合成）
	"IsArmee"	BOOLEAN DEFAULT 0,--该晋升使单位成为集团军
	"NumEstablishCorps"	INTEGER DEFAULT 0,--单位可以组建军团的数量
	"CannotBeEstablishedCorps"	BOOLEAN DEFAULT 0,--该单位不能被组建成军团
	"AuraRangeChange"	INTEGER DEFAULT 0,--大将军/统帅光环范围提升
	"AuraEffectChange"	INTEGER DEFAULT 0,--大将军/统帅光环效果提升百分比
	"CanCrossIce"	INTEGER DEFAULT 0,--允许通过浮冰地块
	"CanCrossMountains"	INTEGER DEFAULT 0,--允许通过山脉地块
	"CanCrossOceans"	INTEGER DEFAULT 0,--允许通过大洋地块（提前远洋航行）
	"EmbarkedDeepWater"	INTEGER DEFAULT 0,--允许在深海（大洋格）上船
	"GGFromBarbarians"	INTEGER DEFAULT 0,--消灭蛮族单位也能获得大将军点数
	"NearbyImprovementCombatBonus"	INTEGER DEFAULT 0,--在关联改良设施附近时战斗力加成
	"NearbyImprovementBonusRange"	INTEGER DEFAULT 0,--关联改良设施加成范围
	"CombatBonusImprovement"	INTEGER DEFAULT -1,--关联改良设施的Type（填写Improvements表的Type）
	"ReconChange"	INTEGER DEFAULT 0,--侦查视野范围变化
	"BarbarianCombatBonus"	integer DEFAULT 0,--对蛮族单位战斗力加成百分比
	"MultiAttackBonus"	integer DEFAULT 0,--连续攻击同一目标时每次攻击的战斗力加成
	"AntiHigherPopMod"	integer DEFAULT 0,--对抗人口更高的文明时战斗力加成百分比
	"GoldenAgeMod"	integer DEFAULT 0,--黄金时代期间战斗力加成百分比
	"WoundedMod"	integer DEFAULT 0,--自身受伤时的防御修正百分比
	"MoveLfetAttackMod"	integer DEFAULT 0,--剩余移动力对攻击的加成
	"MoveLeftDefenseMod"	integer DEFAULT 0,--剩余移动力对防御的加成
	"MoveUsedAttackMod"	integer DEFAULT 0,--已消耗移动力对攻击的加成
	"MoveUsedDefenseMod"	integer DEFAULT 0,--已消耗移动力对防御的加成
	"NumOriginalCapitalAttackMod"	integer DEFAULT 0,--每占领一个原始首都获得的攻击加成
	"NumOriginalCapitalDefenseMod"	integer DEFAULT 0,--每占领一个原始首都获得的防御加成
	"DoFallBackAttackMod"	integer DEFAULT 0,--对已被击退的敌人再次攻击时，每次击退叠加的攻击加成
	"BeFallBackDefenseMod"	integer DEFAULT 0,--自身被击退时叠加的防御加成
	"NumSpyAttackMod"	integer DEFAULT 0,--每个间谍带来的攻击加成
	"NumSpyDefenseMod"	integer DEFAULT 0,--每个间谍带来的防御加成
	"NumWonderAttackMod"	integer DEFAULT 0,--每个奇观带来的攻击加成
	"NumWonderDefenseMod"	integer DEFAULT 0,--每个奇观带来的防御加成
	"NumWorkAttackMod"	integer DEFAULT 0,--每个杰作带来的攻击加成
	"NumWorkDefenseMod"	integer DEFAULT 0,--每个杰作带来的防御加成
	"OnCapitalLandAttackMod"	integer DEFAULT 0,--在己方首都作战时攻击加成
	"OnCapitalLandDefenseMod"	integer DEFAULT 0,--在己方首都作战时防御加成
	"OutsideCapitalLandAttackMod"	integer DEFAULT 0,--不在己方首都作战时攻击加成
	"OutsideCapitalLandDefenseMod"	integer DEFAULT 0,--不在己方首都作战时防御加成
	"CurrentHitPointAttackMod"	integer DEFAULT 0,--每损失1点生命带来的攻击加成
	"CurrentHitPointDefenseMod"	integer DEFAULT 0,--每损失1点生命带来的防御加成
	"NearNumEnemyAttackMod"	integer DEFAULT 0,--邻近每个敌军带来的攻击加成
	"NearNumEnemyDefenseMod"	integer DEFAULT 0,--邻近每个敌军带来的防御加成
	"NumSpyStayAttackMod"	integer DEFAULT 0,--与有我方间谍驻扎的文明的单位作战时攻击加成
	"NumSpyStayDefenseMod"	integer DEFAULT 0,--与有我方间谍驻扎的文明的单位作战时防御加成
	"MeleeAttackModifier"	integer DEFAULT 0,--近战攻击力加成百分比
	"DifferentReligionAttackModifier"	integer DEFAULT 0,--对不同主流宗教文明的单位攻击加成
	"DifferentReligionDefenseModifier"	integer DEFAULT 0,--对不同主流宗教文明的单位防御加成
	"GoldenAgeTurnAttackModifier"	integer DEFAULT 0,--根据黄金时代已持续回合数获得攻击加成比例（100=每1黄金时代回合数+1%战斗力）
	"GoldenAgeTurnDefenseModifier"	integer DEFAULT 0,--根据黄金时代已持续回合数获得防御加成比例（100=每1黄金时代回合数+1%战斗力）
	"FollowerCountCombatModifier"	integer DEFAULT 0,--根据本教全图信众数量获得攻击/防御加成比例（100=每1信众+1%战斗力）
	"FollowingCityCountCombatModifier"	integer DEFAULT 0,--根据本教全图信教城市数量获得攻击/防御加成比例（100=每1城市+1%战斗力）
	-- [[ 击杀永久属性累积：单位每次击杀敌方单位时，根据晋升提供的每击杀加成值逐次叠加永久属性。
	-- 数值为百分位（centi-percent，即原值/100为实际每击杀加成量）。
	-- 例如PerKillAttackMod=50表示每击杀2单位永久+1%（进攻/防御加成是百分比修正），
	-- PerKillBaseCombatMod=50表示每击杀2单位永久+1基础力（基础力/远程力/最大生命/固伤/固免是直接加值）。
	-- 公式（进攻/防御）：修正% = 击杀总数 × 晋升值 / 100（加到战斗力修正中）
	-- 公式（基础力/远程力/HP/固伤/固免）：加值 = 击杀总数 × 晋升值 / 100（直接加到对应属性上）
	-- 击杀总数可继承（单位升级后保留）。]]
	"PerKillAttackMod"	integer DEFAULT 0,--每击杀永久进攻加成%（百分位，50=每2击杀+1%进攻修正）
	"PerKillDefenseMod"	integer DEFAULT 0,--每击杀永久防御加成%（百分位，50=每2击杀+1%防御修正）
	"PerKillBaseCombatMod"	integer DEFAULT 0,--每击杀永久基础近战战斗力直接加值（百分位，50=每2击杀+1力）
	"PerKillRangedCombatMod"	integer DEFAULT 0,--每击杀永久基础远程战斗力直接加值（百分位，50=每2击杀+1远程力）
	"PerKillMaxHpMod"	integer DEFAULT 0,--每击杀永久最大生命直接加值（百分位，50=每2击杀+1HP）
	"PerKillInflictDamageChange"	integer DEFAULT 0,--每击杀造成伤害固定增加值（百分位，50=每2击杀+1固伤）
	"PerKillDefenseDamageChange"	integer DEFAULT 0,--每击杀受到伤害固定减少值（百分位，50=每2击杀+1固免）
	"MeleeDefenseMod"	integer DEFAULT 0,--近战防御力加成百分比
	"NumAttacksMadeThisTurnAttackMod"	integer DEFAULT 0,--本回合已进行的攻击次数对攻击力的加成
	"AttackFullyHealedMod"	integer DEFAULT 0,--对满血敌方单位的攻击加成
	"AttackAbove50HealthMod"	integer DEFAULT 0,--对半血以上敌方单位的攻击加成
	"AttackBelowEqual50HealthMod"	integer DEFAULT 0,--对半血及以下敌方单位的攻击加成
	"RangedSupportFireMod"	integer DEFAULT 0,--近战先手远程打击的伤害变化比例
	"RangedFlankAttackModifier"	integer DEFAULT 0,--远程攻击侧翼夹击加成
	"RangedFlankAttackModifierPercent"	integer DEFAULT 0,--远程侧翼夹击加成百分比
	"MoraleBreakChance"	integer DEFAULT 0,--攻击时有x%几率击退敌人
	"RangeSuppressModifier"	integer DEFAULT 0,--远程压制修正：根据双方射程差距压制敌方（每差距1射程=此值的修正）
	"HeightModPerX"	integer DEFAULT 0,--自身所处高度大于敌方单位时，每点高度差带来的战斗力加成百分比
	"HeightModLimited"	integer DEFAULT 0,--高度加成上限
	"InterceptionDamageMod"	integer DEFAULT 0,--执行拦截时造成的额外伤害修正百分比
	"AirSweepDamageMod"	integer DEFAULT 0,--执行空中游猎时造成的额外伤害修正百分比
	"IsCanParadropUnLimit"	boolean DEFAULT 0,--每回合可以无限次空降直到移动力用尽
	"CanParadropAnyWhere"	boolean DEFAULT 0,--允许在境外进行空降
	"FeatureInvisible"	text,--在指定地貌类型中隐身（填写Features表的Type）
	"FeatureInvisible2"	text,--在第二种指定地貌类型中隐身
	"CanDoFallBackDamage"	boolean DEFAULT 0,--击退的单位会受到额外的溅射伤害
	"CanDoNukeDamage"	boolean DEFAULT 0,--攻击时可在一定范围内附带核爆伤害（伤害数值等同于原子弹）
	"AoEWhileFortified"	integer DEFAULT 0,--驻防时对周围敌军造成的AOE伤害
	"AOEDamageOnKill"	integer DEFAULT 0,--死亡时对周围单位造成AOE伤害
	"AoEDamageOnMove"	integer DEFAULT 0,--移动时对路径上周围地块造成AOE伤害
	"AOEDamageOnPillage"	integer DEFAULT 0,--劫掠时对相邻地块敌军造成的AOE伤害
	"NearbyEnemyDamage"	integer DEFAULT 0,--每回合对附近敌军造成的伤害
	"TurnDamagePercent"	integer DEFAULT 0,--每回合受到等同于最大生命值百分比的伤害
	"TurnDamage"	integer DEFAULT 0,--每回合受到的固定伤害值
	"InsightEnemyDamageModifier"	integer DEFAULT 0,--攻击时对视野中所有敌军单位造成百分比溅射伤害
	"AttackChanceFromAttackDamage"	text,--Lua公式引用：根据造成伤害获得额外攻击次数的几率（引用LuaFormula表）
	"MovementFromAttackDamage"	text,--Lua公式引用：根据造成伤害获得额外移动力的数值（引用LuaFormula表）
	"HealPercentFromAttackDamage"	text,--Lua公式引用：根据造成伤害获得百分比回血（引用LuaFormula表）
	"GoldAttackBonusFormula"	text,--Lua公式引用：基于玩家金币数量通过Lua公式计算攻击加成（引用LuaFormula表）
	"GoldDefenseBonusFormula"	text,--Lua公式引用：基于玩家金币数量通过Lua公式计算防御加成
	"CultureAttackBonusFormula"	text,--Lua公式引用：基于玩家文化值通过Lua公式计算攻击加成
	"CultureDefenseBonusFormula"	text,--Lua公式引用：基于玩家文化值通过Lua公式计算防御加成
	"FaithAttackBonusFormula"	text,--Lua公式引用：基于玩家信仰值通过Lua公式计算攻击加成
	"FaithDefenseBonusFormula"	text,--Lua公式引用：基于玩家信仰值通过Lua公式计算防御加成
	"StrongerDamaged"	boolean DEFAULT 0,--愈战愈勇：受伤时反而获得攻击加成（伤害越大加成越高）
	"FightWellDamaged"	boolean DEFAULT 0,--受伤时不受战斗力惩罚（保持完整攻击力但不额外加成）
	"NoResourcePunishment"	boolean DEFAULT 0,--缺少战略资源时不受战斗力惩罚
	"ImmueMeleeAttack"	boolean DEFAULT 0,--免疫近战攻击
	"CannotBeRangedAttacked"	boolean DEFAULT 0,--不能被远程攻击
	"IgnoreDamageChance"	integer DEFAULT 0,--闪避几率：有x%的概率完全免疫一次攻击造成的伤害
	"ForcedDamageValue"	integer DEFAULT 0,--每次受到攻击时至少受到此数值的固定伤害
	"ChangeDamageValue"	integer DEFAULT 0,--固定减免：每次受到攻击时固定减免此数值的伤害
	"HPHealedIfDestroyEnemyGlobal"	integer DEFAULT 0,--消灭敌方单位时全国单位回复生命值
	"GetGroundAttackRange"	integer DEFAULT 0,--空中游猎时获取地面视野的范围变化
	"GetGroundAttackDamage"	integer DEFAULT 0,--空中游猎时对获取视野的地面单位造成伤害
	"AirInterceptRangeChange"	integer DEFAULT 0,--空中拦截距离变化
	"MultipleInitExperence"	integer DEFAULT 0,--初始经验获得比例变化（百分比）
	"FreeExpPerTurn"	integer DEFAULT 0,--每回合自动获得的免费经验值
	"CarrierEXPGivenModifier"	integer DEFAULT 0,--将获得的经验按百分比传递给所在航母/载具
	"StayCSExpPerTurn"	integer DEFAULT 0,--单位停留在城邦领地内时每回合获得的额外经验值
	"StayCSInfluencePerTurn"	integer DEFAULT 0,--单位停留在城邦领地内时每回合增加的影响力
	"CannotBeCaptured"	boolean DEFAULT 0,--不能被俘虏
	"CaptureDefeatedEnemyChance"	integer DEFAULT 0,--俘虏敌方单位的概率百分比
	"CaptureEmenyPercent"	integer DEFAULT 0,--俘虏单位概率百分比变化
	"CaptureEmenyExtraMax"	integer DEFAULT 0,--俘虏单位概率上限变化
	"AdjacentEnemySapMovement"	integer DEFAULT 0,--邻近敌人时移动力变化
	"AdjacentFriendlySapMovement"	integer DEFAULT 0,--邻近友军时移动力变化
	"AdjacentSapExperience"	integer DEFAULT 0,--邻近单位时经验获取变化
	"Immobile"	boolean DEFAULT 0,--单位无法移动（驻守型单位）
	"LostAllMovesAttackCity"	integer DEFAULT 0,--攻击城市后失去所有移动力（值>0时生效）
	"RiverDoubleMove"	boolean DEFAULT 0,--跨越河流时移动力消耗减半（起点和终点均需沿河）
	"PeaceForCS"	boolean DEFAULT 0,--进入城邦领地不会因边境侵犯而触发战争
	"ExtraMoveTimesXX"	integer DEFAULT 0,--小数额外移动力（10=0.1移动力，100=1移动力）
	"RangeAttackCostModifier"	integer DEFAULT 0,--远程攻击消耗移动力的百分比修正（100=消耗全部移动力）
	"SetUpCostModifier"	integer DEFAULT 0,--架设远程攻击消耗移动力的百分比修正
	"UnitAttackFaithBonus"	integer DEFAULT 0,--攻击敌方单位时获得等同于造成伤害百分比数值的信仰
	"CityAttackFaithBonus"	integer DEFAULT 0,--攻击城市时获得等同于造成伤害百分比数值的信仰
	"MovePercentCaptureCity"	integer DEFAULT 0,--攻占城市后恢复x%移动力
	"HealPercentCaptureCity"	integer DEFAULT 0,--攻占城市后恢复x%生命值
	"RemovePromotionUpgrade"	text DEFAULT null,--升级后移除此晋升（填写晋升Type）
	"CanPlunderWithoutWar"	boolean DEFAULT 0,--允许在非战争状态下劫掠其他文明地块上的设施/道路
	"PillageReplenishMoves"	integer DEFAULT 0,--劫掠后获得额外移动力
	"PillageReplenishAttck"	boolean DEFAULT 0,--劫掠后获得额外攻击次数
	"PillageReplenishHealth"	integer DEFAULT 0,--劫掠后额外回复生命值
	"PlagueImmune"	boolean DEFAULT 0,--免疫瘟疫类负面晋升
	"PlagueChance"	integer DEFAULT 0,--攻击时有x%几率给目标施加瘟疫晋升
	"PlaguePromotion"	text DEFAULT null,--施加的瘟疫晋升Type（引用UnitPromotions表）
	"PlagueID"	integer DEFAULT -1,--瘟疫类型ID（用于区分不同类型的瘟疫）
	"PlaguePriority"	integer DEFAULT 0,--瘟疫优先级（高优先级的瘟疫会覆盖低优先级）
	"PlagueIDImmunity"	integer DEFAULT -1,--对此PlagueID的瘟疫免疫
	"MaintenanceCost"	integer DEFAULT 0,--晋升带来的额外单位维护费用
	"WorkRateMod"	integer DEFAULT 0,--工人工作效率修正百分比（提升地块改造速度）
	"MilitaryMightMod"	integer DEFAULT 0,--军事实力评分修正值（影响AI对己方军力的评估）
	"ShowInUnitPanel"	integer DEFAULT 1,--是否在单位面板中显示此晋升
	"ShowInTooltip"	integer DEFAULT 1,--是否在鼠标悬停提示中显示此晋升
	"ShowInPedia"	integer DEFAULT 1,--是否在文明百科中显示此晋升
	"AllyCityStateCombatModifier"	integer DEFAULT 0,--每个盟友城邦带来的战斗力加成
	"AllyCityStateCombatModifierMax"	integer DEFAULT -1,--盟友城邦战斗力加成上限（-1为无上限）
	"ExtraResourceType"	text,--多余资源类型（填写Resources表的Type）
	"ExtraResourceCombatModifier"	integer DEFAULT 0,--每份多余指定资源带来的战斗力加成
	"ExtraResourceCombatModifierMax"	integer DEFAULT -1,--多余资源战斗力加成上限（-1为无上限）
	"ExtraHappinessCombatModifier"	integer DEFAULT 0,--每点额外快乐度带来的战斗力加成
	"ExtraHappinessCombatModifierMax"	integer DEFAULT -1,--额外快乐度战斗力加成上限（-1为无上限）
	"NearbyUnitPromotionBonus"	integer DEFAULT 0,--邻近拥有指定晋升的友军时战斗力加成
	"NearbyUnitPromotionBonusRange"	integer DEFAULT 0,--邻近晋升加成的判定范围
	"NearbyUnitPromotionBonusMax"	integer DEFAULT 0,--邻近晋升加成的最大叠加数量
	"CombatBonusFromNearbyUnitPromotion"	text,--邻近加成所关联的晋升Type（引用UnitPromotions表）
	"AuraPromotionType"	text DEFAULT null,--光环晋升：为范围内友军自动添加此晋升Type
	"AuraPromotionRange"	integer DEFAULT 0,--光环作用范围
	"AuraPromotionRangeAIBonus"	integer DEFAULT 0,--AI使用时额外光环范围加成
	"AuraPromotionNoSelf"	boolean DEFAULT 0,--光环不对自身生效
	"PromotionPrereqOr10"	text DEFAULT null,--可选前置晋升11
	"PromotionPrereqOr11"	text DEFAULT null,--可选前置晋升12
	"PromotionPrereqOr12"	text DEFAULT null,--可选前置晋升13
	"PromotionPrereqOr13"	text DEFAULT null,--可选前置晋升14
	--注意：PromotionPrereq是必须满足的前置晋升，PromotionPrereqOr1~13全部是可选前置（满足其一即可解锁本晋升）
	"MutuallyExclusiveGroup"	integer DEFAULT -1,--互斥晋升组号（同组号晋升只能选取一个）
	"MaxHitPointsChange"	INTEGER DEFAULT 0,--最大生命值变化（固定值增减）
	"MaxHitPointsModifier"	INTEGER DEFAULT 0,--最大生命值变化百分比
	"NoSupply"	INTEGER DEFAULT 0,--不受补给限制（不需要补给线即可维持战斗力）
	"WarCasualtiesModifier"	int NOT NULL DEFAULT 0,--单位阵亡时战争伤亡点数变化比例
	"SplashDamagePercent"	integer DEFAULT 0,--溅射伤害比例（对周围敌军造成等同于对其单独战斗伤害N%的溅射伤害，非基于主目标伤害或最大生命值）
	"SplashDamageFixed"	integer DEFAULT 0,--固定溅射伤害值
	"SplashDamageRadius"	integer DEFAULT 0,--溅射伤害作用范围
	"SplashDamagePlotUnitLimit"	integer DEFAULT 0,--每格溅射伤害影响单位数量上限
	"SplashDamageImmune"	boolean DEFAULT 0,--免疫溅射伤害
	"SplashXP"	int DEFAULT 0,--每对一个敌军造成溅射伤害获得的额外经验值
	"TriggerSplashFinish"	boolean DEFAULT 0,--溅射击杀时触发Lua游戏事件（GAMEEVENT_OnTriggerSplashFinish）
	"CollateralDamagePercent"	integer DEFAULT 0,--穿透伤害比例（攻击主目标时对同格内其他敌军造成等同于对其单独战斗伤害N%的穿透伤害，非基于主目标伤害或最大生命值）
	"CollateralDamageFixed"	integer DEFAULT 0,--固定穿透伤害值
	"CollateralDamagePlotUnitLimit"	integer DEFAULT 0,--每格穿透伤害影响单位数量上限
	"CollateralDamageImmune"	boolean DEFAULT 0,--免疫穿透伤害
	"CollateralXP"	int DEFAULT 0,--穿透伤害获得的额外经验值
	"CollateralOnlyCity"	boolean DEFAULT 0,--穿透伤害仅对城市生效
	"CollateralOnlyUnit"	boolean DEFAULT 1,--穿透伤害仅对单位生效（默认为1）
	"AddEnemyPromotionImmune"	boolean DEFAULT 0,--免疫敌方单位施加的负面晋升
	"DestroyBuildingCollection"	text DEFAULT '',--摧毁城市建筑系列树（填写PromotionCollections的Type）
	"DestroyBuildingProbability"	int DEFAULT 0,--摧毁城市建筑的概率
	"DestroyBuildingNumLimit"	int DEFAULT 0,--单次攻击最多摧毁建筑数量
	"SiegeKillCitizensPercent"	integer DEFAULT 0,--远程攻击杀死城市市民的百分比
	"SiegeKillCitizensFixed"	integer DEFAULT 0,--远程攻击杀死城市市民的固定数量
	"RangeBackWhenDefense"	boolean DEFAULT 0,--被近战攻击时防御者可以远程反击攻击者所在格
	"HeavyChargeAddMoves"	integer DEFAULT 0,--冲锋击退目标后自身获得额外移动力
	"HeavyChargeExtraDamage"	integer DEFAULT 0,--冲锋击退目标后额外造成伤害百分比
	"HeavyChargeCollateralFixed"	integer DEFAULT 0,--冲锋击退目标后额外造成固定穿透伤害
	"HeavyChargeCollateralPercent"	integer DEFAULT 0,--冲锋击退目标后额外造成百分比穿透伤害
	"RemoveAfterXTurns"	integer DEFAULT 0,--获得后x回合自动移除该晋升
	"AutoRemoveDoneTurn"	boolean DEFAULT 0,--回合结束时自动移除（用于临时性晋升，配合Lua事件使用）
	"RemoveAfterFullyHeal"	boolean DEFAULT 0,--单位满血后自动移除该晋升
	"RemoveWithLuaCheck"	boolean DEFAULT 0,--在某个Lua检查条件满足后移除该晋升
	"CanActionClear"	boolean DEFAULT 0,--伟人可通过行动移除此晋升
	"AttackInflictDamageChange"	integer DEFAULT 0,--攻击时额外造成固定伤害
	"AttackInflictDamageChangeMaxHPPercent"	integer DEFAULT 0,--攻击时额外造成目标最大生命值百分比的伤害
	"DefenseInflictDamageChange"	integer DEFAULT 0,--防御时额外造成固定伤害
	"DefenseInflictDamageChangeMaxHPPercent"	integer DEFAULT 0,--防御时额外造成攻击者最大生命值百分比的伤害
	"SiegeInflictDamageChange"	integer DEFAULT 0,--攻城时额外造成固定伤害修正
	"SiegeInflictDamageChangeMaxHPPercent"	integer DEFAULT 0,--攻城时额外造成目标最大生命值百分比的伤害
	"OutsideFriendlyLandsInflictDamageChange"	integer DEFAULT 0,--在境外作战时额外造成固定伤害
	"OriginalCapitalDamageFix"	integer DEFAULT 0,--每个占领的原始首都带来的额外固定伤害
	"OriginalCapitalSpecialDamageFix"	integer DEFAULT 0,--每个占领的原始首都对陆地单位带来的额外固定伤害（对非陆地单位效果减半）
	"FixDamagePerPromotionMod"	integer DEFAULT 0,--每拥有一个晋升，攻击/防御时额外造成的固定伤害值（最终伤害=晋升数×该值/100）。攻击方计算攻击伤害，防御方计算防御伤害（对城市无效）
	"FixReducePerPromotionMod"	integer DEFAULT 0,--每拥有一个晋升，减少受到伤害的固定值（最终减伤=晋升数×该值/100）。攻击时减少敌方反击伤害，防御时减少敌方攻击伤害
	"ShowInFlag"	INTEGER DEFAULT -1,--是否在单位旗帜上显示此晋升图标（⚠ 仅Super Power模组UI层使用，DLL无此逻辑，-1=不显示）
	"IconStringSP"	text DEFAULT '[ICON_PROMOTION_ATTRIBUTES]',--晋升属性图标字符串
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("AttackChanceFromAttackDamage") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("AuraPromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("CombatBonusFromNearbyUnitPromotion") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("CultureAttackBonusFormula") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("CultureDefenseBonusFormula") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("Description") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("ExtraResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("FaithAttackBonusFormula") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("FaithDefenseBonusFormula") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("FeatureInvisible") REFERENCES "Features"("Type"),
	FOREIGN KEY("FeatureInvisible2") REFERENCES "Features"("Type"),
	FOREIGN KEY("GoldAttackBonusFormula") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("GoldDefenseBonusFormula") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("HealPercentFromAttackDamage") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("Help") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("IconAtlas") REFERENCES "IconTextureAtlases"("Atlas"),
	FOREIGN KEY("Invisible") REFERENCES "InvisibleInfos"("Type"),
	FOREIGN KEY("MovementFromAttackDamage") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("PediaEntry") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("PlaguePromotion") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereq") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr1") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr2") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr3") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr4") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr5") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr6") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr7") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr8") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PromotionPrereqOr9") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("SeeInvisible") REFERENCES "InvisibleInfos"("Type"),
	FOREIGN KEY("TechPrereq") REFERENCES "Technologies"("Type")
);

-- ============================================================
-- 以下是 UnitPromotions 相关子表
-- ============================================================

--晋升为指定单位类型提供对特定单位战斗类型的每邻近单位战斗力修正（⚠ 需MOD_ROG_CORE，否则仅加载不生效）
CREATE TABLE "UnitPromotions_CombatModPerAdjacentUnitCombat" (
	"PromotionType"	text,--提供加成的晋升
	"UnitCombatType"	text,--受到修正判定的单位战斗类型
	"Modifier"	integer DEFAULT 0,--每邻近单位的战斗力修正值
	"Attack"	integer DEFAULT 0,--攻击时是否生效
	"Defense"	integer DEFAULT 0,--防御时是否生效
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--晋升限定仅对指定领域（陆地/海洋/空军）的单位生效
CREATE TABLE "UnitPromotions_Domains" (
	"PromotionType"	text,
	"DomainType"	text,--限定生效的领域类型
	"Modifier"	integer,--该晋升对此领域单位的修正值
	"PediaType"	text,--百科分类
	"Attack"	integer DEFAULT 0,--攻击时是否生效
	"Defense"	integer DEFAULT 0,--防御时是否生效
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type")
);

--晋升为指定单位战斗类型提供特定的战斗力修正（区别于通用的UnitPromotions_UnitCombatMods，作用于不同方向）
CREATE TABLE "UnitPromotions_UnitCombatMods" (
	"PromotionType"	text,
	"UnitCombatType"	text,--受到修正的单位战斗类型
	"Modifier"	integer,--修正百分比值
	"PediaType"	text,
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--晋升限定仅对指定单位战斗类型的单位可选取/生效
CREATE TABLE "UnitPromotions_UnitCombats" (
	"PromotionType"	text,
	"UnitCombatType"	text,--允许获得此晋升的单位战斗类型
	"PediaType"	text,
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--晋升限定仅对指定单位类别（UnitClass）的单位可选取/生效
CREATE TABLE "UnitPromotions_UnitClasses" (
	"PromotionType"	text,
	"UnitClassType"	text,--允许获得此晋升的单位类别
	"Modifier"	integer,
	"Attack"	integer,
	"Defense"	integer,
	"PediaType"	text,
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

--晋升限定仅对指定单位Type生效（精确到具体单位，如某个UU）
CREATE TABLE "UnitPromotions_UnitType" (
	"PromotionType"	text,
	"UnitType"	text,--精确指定获得此晋升的单位Type
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type")
);

--晋升限定仅对指定平民单位Type生效
CREATE TABLE "UnitPromotions_CivilianUnitType" (
	"PromotionType"	text,
	"UnitType"	text,--精确指定获得此晋升的平民单位Type
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type")
);

--晋升在地形上的特殊效果：攻击/防御加成、双倍移动、不可通行、通行科技、半移动力
CREATE TABLE "UnitPromotions_Terrains" (
	"PromotionType"	text,
	"TerrainType"	text,--受影响的地形类型
	"Attack"	integer DEFAULT 0,--在该地形上攻击时的加成
	"Defense"	integer DEFAULT 0,--在该地形上防御时的加成
	"DoubleMove"	boolean DEFAULT 0,--在该地形上移动仅消耗1移动力
	"Impassable"	boolean DEFAULT 0,--该地形是否变为不可通行
	"PassableTech"	text,--使该地形变为可通行所需的科技
	"PediaType"	text,
	"HalfMove"	INTEGER DEFAULT 0,--在该地形上移动消耗减半
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("PassableTech") REFERENCES "Technologies"("Type")
);

--晋升在地貌上的特殊效果：攻击/防御加成、双倍移动、不可通行、通行科技、半移动力
CREATE TABLE "UnitPromotions_Features" (
	"PromotionType"	text,
	"FeatureType"	text,--受影响的地貌类型
	"Attack"	integer DEFAULT 0,--在该地貌上攻击时的加成
	"Defense"	integer DEFAULT 0,--在该地貌上防御时的加成
	"DoubleMove"	boolean DEFAULT 0,--在该地貌上移动仅消耗1移动力
	"Impassable"	boolean DEFAULT 0,--该地貌是否变为不可通行
	"PassableTech"	text,--使该地貌变为可通行所需的科技
	"PediaType"	text,
	"HalfMove"	INTEGER DEFAULT 0,--在该地貌上移动消耗减半
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("PassableTech") REFERENCES "Technologies"("Type")
);

--获取晋升时自动免费赠送另一个晋升（前提需拥有指定前置晋升）
CREATE TABLE "UnitPromotions_Promotions" (
	"FreePromotionType"	text,--免费赠送的晋升Type
	"PrePromotionType"	text,--获得赠送前必须拥有的前置晋升Type
	FOREIGN KEY("FreePromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PrePromotionType") REFERENCES "UnitPromotions"("Type")
);

--晋升为指定特定晋升提供额外的战斗力修正（如对拥有某晋升的敌人有加成）
CREATE TABLE "UnitPromotions_PromotionModifiers" (
	"PromotionType"	text,--提供修正的本晋升
	"OtherPromotionType"	text,--目标晋升Type（拥有此晋升的敌方/友方单位）
	"Modifier"	integer DEFAULT 0,--战斗力修正百分比
	"Attack"	integer DEFAULT 0,--攻击时是否生效
	"Defense"	integer DEFAULT 0,--防御时是否生效
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("OtherPromotionType") REFERENCES "UnitPromotions"("Type")
);

--晋升升级：当单位同时拥有本晋升和Judge晋升时，自动转换为New晋升（⚠ 需MOD_PROMOTION_NEW_EFFECT_FOR_SP）
CREATE TABLE "UnitPromotions_PromotionUpgrade" (
	"PromotionType"	text,--本晋升
	"JudgePromotionType"	text,--判断条件：需同时拥有的另一个晋升
	"NewPromotionType"	text,--替换为的新晋升
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("JudgePromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("NewPromotionType") REFERENCES "UnitPromotions"("Type")
);

--战后随机晋升池：HasPostCombatPromotions为true时，本表定义战后可随机获得的晋升列表
CREATE TABLE "UnitPromotions_PostCombatRandomPromotion" (
	"PromotionType"	text,--拥有此晋升后可以从战后随机池中获得
	"NewPromotion"	text,--战后可随机获得的晋升
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("NewPromotion") REFERENCES "UnitPromotions"("Type")
);

--消灭敌方单位时获得一次性产出
CREATE TABLE "UnitPromotions_YieldFromKills" (
	"PromotionType"	text,
	"YieldType"	text,--获得的产出类型（金币/文化/信仰等）
	"Yield"	integer,--获得的产出数值
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--消灭蛮族单位时获得一次性产出
CREATE TABLE "UnitPromotions_YieldFromBarbarianKills" (
	"PromotionType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--探索时获得一次性产出（侦察单位探索新地块时触发）
CREATE TABLE "UnitPromotions_ExploreYield" (
	"PromotionType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,--每探索一个地块获得的产出
	"EraPercent"	integer DEFAULT 0,--每个时代的额外比例加成
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--转化宗教信徒时获得一次性产出
CREATE TABLE "UnitPromotions_InstantYieldPerReligionFollowerConverted" (
	"PromotionType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,--每转化一个信徒获得的产出
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--晋升允许单位执行特定的建造命令（如建造堡垒、修路等）
CREATE TABLE "Promotion_Builds" (
	"PromotionType"	text,
	"BuildType"	text,--允许执行的建造Type（引用Builds表）
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("BuildType") REFERENCES "Builds"("Type")
);

--晋升对指定道路上移动力的修正
CREATE TABLE "Promotion_RouteMovementChanges" (
	"PromotionType"	text,
	"RouteType"	text,--道路类型
	"MovementChange"	integer NOT NULL,--移动力消耗修正值
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("RouteType") REFERENCES "Routes"("Type")
);

--晋升的光环作用域限定（仅对指定领域的单位生效）
CREATE TABLE "Promotion_AuraPromotionDomains" (
	"PromotionType"	text,--提供光环的晋升
	"DomainType"	text,--光环仅对此领域单位生效
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type")
);

--光环晋升的额外条件：受光环影响的单位需要拥有一项指定前置晋升
CREATE TABLE "Promotion_AuraPromotionPrePromotionOr" (
	"PromotionType"	text,--提供光环的晋升
	"PrePromotionType"	text,--目标单位需拥有的晋升（满足其一即可）
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PrePromotionType") REFERENCES "UnitPromotions"("Type")
);

--光环晋升的层叠数量：同一光环被多个提供者覆盖时的效力限制（⚠ 需MOD_PROMOTION_AURA_PROMOTION，ProviderNum决定启动光环所需提供者数量）
CREATE TABLE "Promotion_AuraPromotionProviderNum" (
	"PromotionType"	text,--提供光环的晋升
	"AuraPromotionType"	text,--光环赋予的晋升
	"ProviderNum"	integer DEFAULT 0,--提供者数量限制（最大层叠数）
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("AuraPromotionType") REFERENCES "UnitPromotions"("Type")
);

--晋升的前置晋升AND条件：必须同时拥有表内所有晋升才能选取（与PromotionPrereq配合）
CREATE TABLE "Promotion_PromotionPrereqAnds" (
	"PromotionType"	text,--本晋升
	"PrereqPromotionType"	text,--必须同时拥有的前置晋升
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PrereqPromotionType") REFERENCES "UnitPromotions"("Type")
);

--晋升的前置晋升OR条件扩展（与PromotionPrereqOr1~13功能相同但放在子表中）
CREATE TABLE "Promotion_PromotionPrereqOrs" (
	"PromotionType"	text,--本晋升
	"PrereqPromotionType"	text,--满足其一即可的前置晋升
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PrereqPromotionType") REFERENCES "UnitPromotions"("Type")
);

--晋升互斥：如果单位拥有ExclusionPromotionType则无法获取PromotionType
CREATE TABLE "Promotion_PromotionExclusionAny" (
	"PromotionType"	text,--本晋升
	"ExclusionPromotionType"	text,--互斥的晋升（拥有此晋升则不能选本晋升）
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("ExclusionPromotionType") REFERENCES "UnitPromotions"("Type")
);

--使拥有此表关联晋升的单位被视作拥有指定战斗类型（用于晋升前置判定，非仅UI，含实际游戏逻辑）
CREATE TABLE "Promotion_UnitCombatsPromotionValid" (
	"PromotionType"	text,
	"UnitCombatType"	text,--可选取此晋升的单位战斗类型
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--航母与舰载机之间的晋升传递关系（⚠ 仅Super Power模组Lua层使用，DLL无此实现）
CREATE TABLE "SPCarrierTransferPromotions" (
	"CarrierPromotionType"	TEXT PRIMARY KEY,--航母拥有的晋升
	"FighterPromotionType"	TEXT,--传递给舰载机的晋升
	FOREIGN KEY("CarrierPromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("FighterPromotionType") REFERENCES "UnitPromotions"("Type")
);

--晋升百科分类定义（用于文明百科中晋升的归类显示）
CREATE TABLE "PromotionPedias" (
	"ID"	integer,
	"Type"	text NOT NULL UNIQUE,--百科分类名
	"Description"	text,--分类描述文字
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("Description") REFERENCES "Language_en_US"("Tag")
);

--晋升集合/系列定义（用于DestroyBuildingCollection等需要成组晋升的功能）
CREATE TABLE "PromotionCollections" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	"Type"	text UNIQUE,--集合名
	"StackingFightBack"	boolean DEFAULT 0,--叠加反击：该集合中的多个晋升效果是否可以叠加
	"StopAttacker"	boolean DEFAULT 0,--是否可以阻止攻击者行动
);

--晋升集合中的条目：定义每个晋升在集合中的编号及触发条件
CREATE TABLE "PromotionCollections_Entries" (
	"CollectionType"	text,--所属集合
	"PromotionType"	text,--集合中的晋升
	"PromotionIndex"	int NOT NULL DEFAULT 0,--晋升在集合中的序号
	"TriggerMeleeAttack"	boolean NOT NULL DEFAULT 0,--近战攻击时触发
	"TriggerRangedAttack"	boolean NOT NULL DEFAULT 0,--远程攻击时触发
	"TriggerMeleeDefense"	boolean NOT NULL DEFAULT 0,--近战防御时触发
	"TriggerRangedDefense"	boolean NOT NULL DEFAULT 0,--远程防御时触发
	"TriggerHPFixed"	integer NOT NULL DEFAULT 0,--HP低于此固定值时触发
	"TriggerHPPercent"	integer NOT NULL DEFAULT 0,--HP低于此百分比时触发
	"TriggerLuaCheck"	boolean NOT NULL DEFAULT 0,--由Lua检查决定是否触发
	"TriggerLuaHook"	boolean NOT NULL DEFAULT 0,--由Lua钩子决定是否触发
	FOREIGN KEY("CollectionType") REFERENCES "PromotionCollections"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--晋升集合向敌军施加的负面晋升关联：当单位拥有CollectionType集合的晋升时，可以为另一个集合中的晋升触发敌方的负面效果
CREATE TABLE "PromotionCollections_AddEnemyPromotions" (
	"CollectionType"	text,--本集合
	"OtherCollectionType"	text,--给予敌军的另一个晋升集合
	FOREIGN KEY("CollectionType") REFERENCES "PromotionCollections"("Type"),
	FOREIGN KEY("OtherCollectionType") REFERENCES "PromotionCollections"("Type")
);

--晋升为单位指定具体名称（用于领袖/特殊单位获得晋升后改名）
CREATE TABLE "UnitPromotions_UnitName" (
	"PromotionType"	text,
	"UnitType"	text,--获得名称的单位
	"Name"	text,--名称文本引用
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("Name") REFERENCES "Language_en_US"("Tag")
);

-- ============================================================
-- 以下是与其他系统关联的晋升相关表
-- ============================================================

--单位自带免费晋升（单位一生产出来就拥有的晋升）
CREATE TABLE "Unit_FreePromotions" (
	"UnitType"	text,--单位Type
	"PromotionType"	text,--免费赠送的晋升Type
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--科技解锁后全国单位免费获得的晋升
CREATE TABLE "Technology_FreePromotions" (
	"TechType"	text,--科技Type（实际此表存在于Technology相关定义中，此处仅列举结构）
	"PromotionType"	text,
	FOREIGN KEY("TechType") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--政策免费提供的晋升（指定单位战斗类型）
CREATE TABLE "Policy_FreePromotionUnitCombats" (
	"PolicyType"	text,
	"PromotionType"	text,
	"UnitCombatType"	text,--限定获得晋升的单位战斗类型
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--政策免费提供的晋升（不限单位类型）
CREATE TABLE "Policy_FreePromotions" (
	"PolicyType"	text,
	"PromotionType"	text,
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--文明特性免费提供的晋升（指定单位类别）
CREATE TABLE "Trait_FreePromotionUnitClasses" (
	"TraitType"	text,
	"PromotionType"	text,
	"UnitClassType"	text,--限定获得晋升的单位类别
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

--文明特性免费提供的晋升（指定单位战斗类型）
CREATE TABLE "Trait_FreePromotionUnitCombats" (
	"TraitType"	text,
	"PromotionType"	text,
	"UnitCombatType"	text,
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--文明特性免费提供的晋升（不限单位类型）
CREATE TABLE "Trait_FreePromotions" (
	"TraitType"	text,
	"PromotionType"	text,
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);
