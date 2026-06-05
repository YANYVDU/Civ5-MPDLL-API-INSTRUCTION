--integer、text、boolean分别需要输入整数、字符和true/false
--如果某个明确标注了功能的接口使用无效，请自行查阅源码寻找是否有全局设置限制其启用与否
CREATE TABLE "Units" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--必须唯一，所有标识有NOT NULL的列不能为空，否则闪退
	"Description"	text,--名字
	"Civilopedia"	text,--百科描述
	"Strategy"	text,--策略提示
	"Help"	text,--功能简述
	"Requirements"	text,--不能建造时的提示文本（如移民需要2人口）
	"Combat"	integer DEFAULT 0,--近战战斗力
	"RangedCombat"	integer DEFAULT 0,--远程战斗力
	"Cost"	integer DEFAULT 0,--基准锤子花费
	"FaithCost"	integer DEFAULT 0,--基准信仰购买花费
	"RequiresFaithPurchaseEnabled"	boolean DEFAULT 0,--需要特定信条解锁信仰购买
	"PurchaseOnly"	boolean DEFAULT 0,--只能通过购买获得，不能建造
	"MoveAfterPurchase"	boolean DEFAULT 0,--购买后本回合仍可移动
	"Moves"	integer DEFAULT 0,--基准移动力
	"Immobile"	boolean DEFAULT 0,--无法移动
	"Range"	integer DEFAULT 0,--基准远程攻击射程
	"BaseSightRange"	integer DEFAULT 2,--基准视野范围（山脉和树林仍会阻碍）
	"Class"	text DEFAULT NULL,--单位级别（引用UnitClasses表）
	"Special"	text DEFAULT NULL,--特殊类型（伟人、空军等，引用SpecialUnits表）
	"Capture"	text DEFAULT NULL,--被俘后获得的单位Class，一般与本单位相同或不写
	"CombatClass"	text DEFAULT NULL,--战斗类型（引用UnitCombatInfos表）
	"Domain"	text DEFAULT NULL,--活动领域（陆地/海洋/空军，引用Domains表）
	"CivilianAttackPriority"	text DEFAULT NULL,--AI判定平民单位价值
	"DefaultUnitAI"	text DEFAULT NULL,--AI默认如何使用此单位（引用UnitAIInfos表）
	"Food"	boolean DEFAULT 0,--为true时建造该单位期间城市人口停止增长
	"NoBadGoodies"	boolean DEFAULT 0,--不会触发蛮族营地的负面事件（古代遗迹总是正面奖励）
	"RivalTerritory"	boolean DEFAULT 0,--可以进入未开边的敌对领土
	"MilitarySupport"	boolean DEFAULT 0,--标识该单位为军事单位（参与军事支援计算）
	"MilitaryProduction"	boolean DEFAULT 0,--生产该单位为军事生产，军事单位建造加速对此有效
	"Pillage"	boolean DEFAULT 0,--允许劫掠改良设施
	"PillagePrereqTech"	text DEFAULT NULL,--研发某科技后允许劫掠（南北战争剧本焦土战术）
	"Found"	boolean DEFAULT 0,--允许建立城市
	"FoundAbroad"	boolean DEFAULT 0,--允许在异大陆建立城市
	"CultureBombRadius"	integer DEFAULT 0,--大商/大艺扩地范围
	"GoldenAgeTurns"	integer DEFAULT 0,--消耗该单位获得黄金时代的回合数
	"FreePolicies"	integer DEFAULT 0,--消耗该单位获得免费政策数量
	"OneShotTourism"	integer DEFAULT 0,--消耗大音对指定文明n回合魅力输出
	"OneShotTourismPercentOthers"	integer DEFAULT 0,--消耗大音时对其他文明的额外魅力输出百分比
	"IgnoreBuildingDefense"	boolean DEFAULT 0,--攻击城市时忽略城防建筑的防御加成
	"PrereqResources"	boolean DEFAULT 0,--需要战略资源才能建造（工船用于判断是否有可开发的海上资源）
	"Mechanized"	boolean DEFAULT 0,--机械化单位标记，原版无实际作用
	"Suicide"	boolean DEFAULT 0,--攻击后自毁（导弹类单位）
	"CaptureWhileEmbarked"	boolean DEFAULT 0,--海运时可以被俘虏（仅剧情宝藏舰队使用）
	"PrereqTech"	text DEFAULT NULL,--需要前置科技
	"ObsoleteTech"	text DEFAULT NULL,--过时科技（此科技后无法再建造）
	"GoodyHutUpgradeUnitClass"	text DEFAULT NULL,--踩蘑菇升级为的单位级别
	"HurryCostModifier"	integer DEFAULT 0,--购买所需金币的系数（100=1:1）
	"AdvancedStartCost"	integer DEFAULT 0,--高级开局（后期开始）时购买此单位的费用
	"MinAreaSize"	integer DEFAULT -1,--需要的最小连续水域大小（用于工船等）
	"AirInterceptRange"	integer DEFAULT 0,--空中拦截范围
	"AirUnitCap"	integer DEFAULT 0,--占据航母载机位数量（默认1表示占据1个位置）
	"NukeDamageLevel"	integer DEFAULT -1,--核打击等级（决定杀伤范围和辐射覆盖）
	"WorkRate"	integer DEFAULT 0,--工人工作效率
	"NumFreeTechs"	integer DEFAULT 0,--消耗该单位获得免费科技数量
	"BaseBeakersTurnsToCount"	integer DEFAULT 0,--消耗大科时基于近x回合科研产出获得烧瓶
	"BaseCultureTurnsToCount"	integer DEFAULT 0,--消耗大文时基于近x回合文化产出获得文化
	"RushBuilding"	boolean DEFAULT 0,--允许像大工那样秒杀建筑建造
	"BaseHurry"	integer DEFAULT 0,--秒建筑的基础产能
	"HurryMultiplier"	integer DEFAULT 0,--秒建筑时每人口额外提供的产能
	"BaseGold"	integer DEFAULT 0,--大商进行贸易任务的基础金币
	"NumGoldPerEra"	integer DEFAULT 0,--大商贸易任务每个时代额外增加的金币
	"SpreadReligion"	boolean DEFAULT 0,--允许传播宗教（可能会导致IGE看不到单位）
	"RemoveHeresy"	boolean DEFAULT 0,--允许像异端审判官一样移除异教
	"ReligionSpreads"	integer DEFAULT 0,--传教次数（可能会导致IGE看不到单位）
	"ReligiousStrength"	integer DEFAULT 0,--传教强度（可能会导致IGE看不到单位）
	"FoundReligion"	boolean DEFAULT 0,--允许创立宗教（可能会导致IGE看不到单位）
	"RequiresEnhancedReligion"	boolean DEFAULT 0,--需要宗教已被强化后才可建造（如异端审判官）
	"ProhibitsSpread"	boolean DEFAULT 0,--驻扎城市时禁止其他文明向此城传教
	"CanBuyCityState"	boolean DEFAULT 0,--可用金币直接购买城邦（威尼斯商人）
	"CombatLimit"	integer DEFAULT 100,--战斗限制值（100=正常战斗单位，0=非战斗平民单位）
	"RangeAttackOnlyInDomain"	boolean DEFAULT 0,--远程攻击只能攻击相同Domain的单位（潜艇打不到陆地单位）
	"RangeAttackIgnoreLOS"	boolean DEFAULT 0,--远程攻击可无视视线障碍（原版为空，通常由晋升控制）
	"Trade"	boolean DEFAULT 0,--可通过此单位建立贸易路线（商船和商队）
	"NumExoticGoods"	integer DEFAULT 0,--"珍奇商品"按钮的可使用次数（换取金币和经验）
	"PolicyType"	text DEFAULT NULL,--需要开启某项政策后才能建造
	"RangedCombatLimit"	integer DEFAULT 0,--远程战斗力限制（远程单位写100，近战写0）
	"XPValueAttack"	integer DEFAULT 0,--AI判断此单位进攻价值
	"XPValueDefense"	integer DEFAULT 0,--AI判断此单位防御价值
	"SpecialCargo"	text DEFAULT NULL,--可运载的特殊单位类型（引用SpecialUnits表），不写为全部
	"DomainCargo"	text DEFAULT NULL,--可运载单位的活动领域（引用Domains表）
	"Conscription"	integer DEFAULT 0,--征召兵数量（可从城市人口征召的数量）
	"ExtraMaintenanceCost"	integer DEFAULT 0,--额外维护费用
	"NoMaintenance"	boolean DEFAULT 0,--免除全部维护费用
	"Unhappiness"	integer DEFAULT 0,--存在时产生的不满值
	"UnitArtInfo"	text DEFAULT NULL,--单位模型的ArtDefine引用
	"UnitArtInfoCulturalVariation"	boolean DEFAULT 0,--模型随文化变化（如移民）
	"UnitArtInfoEraVariation"	boolean DEFAULT 0,--模型随时代变化
	"ProjectPrereq"	text DEFAULT NULL,--需要完成某计划（如曼哈顿计划、阿波罗计划）
	"SpaceshipProject"	text DEFAULT NULL,--该单位为飞船组件（关联Projects表）
	"LeaderPromotion"	text DEFAULT NULL,--废接口，现在由新表实现领袖晋升功能
	"LeaderExperience"	integer DEFAULT 0,--废接口，同上
	"DontShowYields"	boolean DEFAULT 0,--不在地图上显示地块产出（通常仅可建改良的单位需要设为false）
	"ShowInPedia"	boolean DEFAULT 1,--是否在文明百科中显示
	"MoveRate"	text DEFAULT 'BIPED',--移动动画类型（BIPED=双足步行，WHEEL=轮式等）
	"UnitFlagIconOffset"	integer DEFAULT 0,--旗帜图标偏移量
	"PortraitIndex"	integer DEFAULT -1,--图标图集中的索引
	"IconAtlas"	text DEFAULT NULL,--图标图集
	"UnitFlagAtlas"	text DEFAULT 'UNIT_FLAG_ATLAS',--旗帜图标图集
	-- 以下为SP 2.0新增列 --
	"SendCanMoveIntoEvent"	INTEGER DEFAULT 0,--移动前触发Lua事件CanMoveInto检查
	"CannotEmbark"	INTEGER DEFAULT 0,--禁止上船
	"NoMinorGifts"	INTEGER DEFAULT 0,--城邦不会将此单位作为礼物赠送
	"MoveAfterUpgrade"	INTEGER DEFAULT 0,--升级后本回合仍可移动
	"PromotionClass"	TEXT DEFAULT NULL REFERENCES UnitCombatInfos(Type),--升级时以此战斗类型的晋升池为准
	"CanRepairFleet"	INTEGER DEFAULT 0,--可以维修相邻的海军单位
	"CanChangePort"	INTEGER DEFAULT 0,--可以改变海军单位的驻扎港口
	"NoTroopConsume"	BOOLEAN DEFAULT 0,--组建军团/集团军时不消耗此单位（SP引入的文明6军团合并机制）
	"CannotBeEstablishedCorps"	BOOLEAN DEFAULT 0,--不能被组建为军团/集团军（SP引入的文明6军团合并机制）
	"NuclearWinterProcess"	INTEGER DEFAULT 0,--核冬天进程相关（用于核冬天环境改造）
	"ScaleFromNumGWs"	integer DEFAULT 0,--根据拥有的杰作数量缩放战斗力
	"GivePoliciesWithSpreaded"	boolean DEFAULT 0,--传播宗教到城市时获得免费政策
	"GoldenAgeWithSpreaded"	boolean DEFAULT 0,--传播宗教到城市时开启黄金时代
	"GoldFromTourismModifier"	integer DEFAULT 0,--魅力产出转化为金钱的比例
	"CombatStrengthChangeAfterKilling"	integer DEFAULT 0,--击杀单位后近战战斗力提升（可叠加）
	"RangedCombatStrengthChangeAfterKilling"	integer DEFAULT 0,--击杀单位后远程战斗力提升（可叠加）
	"ExtraXPValueAttack"	integer DEFAULT 0,--额外AI攻击价值评估
	"ExtraXPValueDefense"	integer DEFAULT 0,--额外AI防御价值评估
	"BoundLandImprovement"	text REFERENCES Improvements(Type),--绑定陆地改良（单位自动与此改良关联）
	"BoundWaterImprovement"	text REFERENCES Improvements(Type),--绑定海洋改良
	"PolicyBranchType"	text REFERENCES PolicyBranchTypes(Type),--需要已解锁某项政策分支
	"TrainPopulationConsume"	integer DEFAULT 0,--训练此单位消耗城市人口数量
	"PuppetPurchaseOverride"	boolean DEFAULT 0,--允许在傀儡城市购买此单位
	"ProductionCostAddedPerEra"	integer DEFAULT 0,--每个时代增加的单位生产成本
	"FaithCostIncrease"	integer DEFAULT 0,--信仰购买费用额外增加量
	"NoSpreadTurnPopModifierAfterRemovingHeresy"	integer DEFAULT 0,--移除异教后宗教传播冷却回合对人口的修正
	"NoAggressive"	boolean DEFAULT 0,--不能主动攻击
	"ForbidRebase"	boolean DEFAULT 0,--禁止空军单位转场换基地
	"UnitTechUpgrade"	boolean DEFAULT 0,--通过科技自动升级（代替锤子升级）
	"NoFallout"	boolean DEFAULT 0,--免疫核辐射
	"ExtraNukeBlastRadius"	integer DEFAULT 0,--额外核爆半径
	"BarbarianCanTrait"	boolean DEFAULT 0,--蛮族可以拥有UA特性
	"BarbarianTraitTechObsolete"	boolean DEFAULT 0,--蛮族UA随科技过时
	"MaxHitPoints"	INTEGER DEFAULT 100,--最大生命值（默认100）
	"NoSupply"	INTEGER DEFAULT 0,--不需要补给上限
	FOREIGN KEY("Description") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Civilopedia") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Strategy") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Help") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Class") REFERENCES "UnitClasses"("Type"),
	FOREIGN KEY("Special") REFERENCES "SpecialUnits"("Type"),
	FOREIGN KEY("Capture") REFERENCES "UnitClasses"("Type"),
	FOREIGN KEY("CombatClass") REFERENCES "UnitCombatInfos"("Type"),
	FOREIGN KEY("Domain") REFERENCES "Domains"("Type"),
	FOREIGN KEY("DefaultUnitAI") REFERENCES "UnitAIInfos"("Type"),
	FOREIGN KEY("PillagePrereqTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("PrereqTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("ObsoleteTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("GoodyHutUpgradeUnitClass") REFERENCES "UnitClasses"("Type"),
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("SpecialCargo") REFERENCES "SpecialUnits"("Type"),
	FOREIGN KEY("DomainCargo") REFERENCES "Domains"("Type"),
	FOREIGN KEY("ProjectPrereq") REFERENCES "Projects"("Type"),
	FOREIGN KEY("SpaceshipProject") REFERENCES "Projects"("Type"),
	FOREIGN KEY("LeaderPromotion") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("MoveRate") REFERENCES "MovementRates"("Type"),
	FOREIGN KEY("IconAtlas") REFERENCES "IconTextureAtlases"("Atlas"),
	FOREIGN KEY("UnitFlagAtlas") REFERENCES "IconTextureAtlases"("Atlas")
);

-- ============================================================
-- 以下是 Units 相关子表
-- ============================================================

--定义AI可使用此单位的策略类型（如UNITAI_ATTACK、UNITAI_DEFENSE等）
CREATE TABLE "Unit_AITypes" (
	"UnitType"	text,--单位Type
	"UnitAIType"	text,--AI策略类型（引用UnitAIInfos表）
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("UnitAIType") REFERENCES "UnitAIInfos"("Type")
);

--禁止AI使用此单位的策略类型（排除特定AI行为）
CREATE TABLE "Unit_NotAITypes" (
	"UnitType"	text,
	"UnitAIType"	text,--AI不会以这种方式使用此单位
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("UnitAIType") REFERENCES "UnitAIInfos"("Type")
);

--建造此单位需要本城市拥有指定级别的建筑（检查本城而非全国）
CREATE TABLE "Unit_BuildingClassRequireds" (
	"UnitType"	text,
	"BuildingClassType"	text,--需要全国存在的建筑级别
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--建造此单位需要本城市拥有指定建筑（⚠ 此表在DLL中无调用代码，无法生效，为无效接口。请使用Unit_BuildingClassRequireds替代）
CREATE TABLE "Unit_Buildings" (
	"UnitType"	text,
	"BuildingType"	text,--需要本城拥有的具体建筑
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

--此单位可以执行哪些建造指令（如修路、建堡垒等）
CREATE TABLE "Unit_Builds" (
	"UnitType"	text,
	"BuildType"	text,--允许执行的建造Type（引用Builds表）
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("BuildType") REFERENCES "Builds"("Type")
);

--单位的升级路线：此UnitType可以升级为哪些单位级别
CREATE TABLE "Unit_ClassUpgrades" (
	"UnitType"	text,--当前单位
	"UnitClassType"	text,--可升级到的单位级别
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

--AI偏好设定：定义AI在各种策略上对该单位的偏好程度
CREATE TABLE "Unit_Flavors" (
	"UnitType"	text,
	"FlavorType"	text,--偏好类型（FLAVOR_OFFENSE、FLAVOR_DEFENSE等）
	"Flavor"	integer NOT NULL,--偏好数值（越大越优先）
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("FlavorType") REFERENCES "Flavors"("Type")
);

--单位生产出来时自动拥有的免费晋升
CREATE TABLE "Unit_FreePromotions" (
	"UnitType"	text,
	"PromotionType"	text,--免费赠送的晋升
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--此单位被认定为哪种伟人类型（⚠ 此表在DLL中无调用代码，无法生效。伟人认定实际靠Units主表的SpecialUnitType设为SPECIALUNIT_PEOPLE）
CREATE TABLE "Unit_GreatPersons" (
	"UnitType"	text,
	"GreatPersonType"	text,--伟人分类（引用Specialists表）
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "Specialists"("Type")
);

--训练完成此单位时玩家获得一次性产出（产出归属玩家，食物/产能就近归属城市）
CREATE TABLE "Unit_InstantYieldFromTrainings" (
	"UnitType"	text,
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出数值
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--本城市拥有指定建筑时生产此单位的产能加成（百分比加成）
CREATE TABLE "Unit_ProductionModifierBuildings" (
	"UnitType"	text,
	"BuildingType"	text,--提供加成的建筑
	"ProductionModifier"	integer,--产能加成百分比
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

--玩家拥有指定UA时生产此单位的产能加成百分比
CREATE TABLE "Unit_ProductionTraits" (
	"UnitType"	text,
	"TraitType"	text,--提供加成的特性
	"Trait"	integer,--加成数值
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type")
);

--建造此单位需要消耗多少战略资源
CREATE TABLE "Unit_ResourceQuantityRequirements" (
	"UnitType"	text,
	"ResourceType"	text,--需要的资源Type
	"Cost"	integer DEFAULT 1,--需要消耗的资源数量
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

--根据己方拥有的改良设施数量缩放该单位能力（Amount为百分比系数，公式：(拥有数×Amount×上下文)/100，⚠ 需MOD_BALANCE_CORE）
CREATE TABLE "Unit_ScalingFromOwnedImprovements" (
	"UnitType"	text,
	"ImprovementType"	text,--计算的改良设施Type
	"Amount"	integer DEFAULT 0,--每拥有一个改良增加的战斗力点数
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type")
);

--特定科技后替换单位近战战斗力为指定值（非叠加，仅在指定值>当前值时生效）
CREATE TABLE "Unit_TechCombatStrength" (
	"UnitType"	text,
	"TechType"	text,--解锁加成的科技
	"CombatStrength"	integer DEFAULT 0,--额外近战战斗力
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("TechType") REFERENCES "Technologies"("Type")
);

--特定科技后替换单位远程战斗力为指定值（非叠加，仅在指定值>当前值时生效）
CREATE TABLE "Unit_TechRangedCombatStrength" (
	"UnitType"	text,
	"TechType"	text,
	"RangedCombatStrength"	integer DEFAULT 0,
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("TechType") REFERENCES "Technologies"("Type")
);

--为单位增加额外的硬性前置科技（效果等同于PrereqTech，且使该科技在科技树上显示解锁此单位）
CREATE TABLE "Unit_TechTypes" (
	"UnitType"	text,
	"TechType"	text,
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("TechType") REFERENCES "Technologies"("Type")
);

--单位的唯一名称列表（用于伟人命名、领袖晋升改名等）
CREATE TABLE "Unit_UniqueNames" (
	"UnitType"	text,
	"UniqueName"	text NOT NULL,--唯一名称文本
	"GreatWorkType"	text,--关联的杰作Type
	"FreePromotion"	text REFERENCES UnitPromotions(Type),--获得此名称时赠送的晋升
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("UniqueName") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("GreatWorkType") REFERENCES "GreatWorks"("Type")
);

--本单位击杀蛮族时获得额外一次性产出（与Unit_YieldFromKills叠加，产出归玩家，⚠ 需MOD_API_UNIFIED_YIELDS）
CREATE TABLE "Unit_YieldFromBarbarianKills" (
	"UnitType"	text,
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出数值
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--本单位击杀任意敌方单位时获得一次性产出（产出归玩家，⚠ 需MOD_API_UNIFIED_YIELDS）
CREATE TABLE "Unit_YieldFromKills" (
	"UnitType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);
