--integer、text、boolean分别需要输入整数、字符和true/false
--如果某个明确标注了功能的接口使用无效，请自行查阅源码寻找是否有全局设置限制其启用与否
CREATE TABLE "Buildings" (
	"ID"	integer,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--必须唯一，所有标识有NOT NULL的列不能为空，否则闪退
	"Description"	text,--名字
	"Civilopedia"	text,--百科
	"Strategy"	text,--策略
	"Help"	text,--效果简述
	"ThemingBonusHelp"	text,--杰作主题展示说明
	"Quote"	text,--引言，世界奇观需要
	"GoldMaintenance"	integer DEFAULT 0,--维护费
	"MutuallyExclusiveGroup"	integer DEFAULT '-1',--互斥建筑组号
	"TeamShare"	boolean DEFAULT 0,--建筑效果对同队所有玩家生效（不仅是建造者）
	"Water"	boolean DEFAULT 0,--需要邻近水源
	"River"	boolean DEFAULT 0,--需要沿河
	"FreshWater"	boolean DEFAULT 0,--需要淡水
	"Mountain"	boolean DEFAULT 0,--靠山
	"NearbyMountainRequired"	boolean DEFAULT 0,--两环内有山
	"Hill"	boolean DEFAULT 0,--需要位于丘陵
	"Flat"	boolean DEFAULT 0,--需要位于平地
	"FoundsReligion"	boolean DEFAULT 0,--标记宗教竞赛开启建筑（决定创教科技为PrereqTech，非"需要创教才能建造"）
	"IsReligious"	boolean DEFAULT 0,--宗教类建筑标记，享受宗教政策/信条的产能修正
	"BorderObstacle"	boolean DEFAULT 0,--长城的消耗额外移动力
	"PlayerBorderObstacle"	boolean DEFAULT 0,--全国边境障碍物（类似长城，进入己方领土的敌方单位消耗额外移动力）
	"Capital"	boolean DEFAULT 0,--需要在首都
	"GoldenAge"	boolean DEFAULT 0,--开启黄金时代
	"MapCentering"	boolean DEFAULT 0,--建造后小地图始终居中于此文明首都
	"NeverCapture"	boolean DEFAULT 0,--无法占领
	"NukeImmune"	boolean DEFAULT 0,--核免疫
	"AllowsWaterRoutes"	boolean DEFAULT 0,--允许水路链接城市
	"ExtraLuxuries"	boolean DEFAULT 0,--本城开发奢侈品额外一份
	"DiplomaticVoting"	boolean DEFAULT 0,--触发外交胜利投票
	"AffectSpiesNow"	boolean DEFAULT 0,--其他玩家间谍在你的国家效果减成，参考网络防火墙和强权的卫星防御网络
	"NullifyInfluenceModifier"	boolean DEFAULT 0,--消除科技魅力影响
	"Cost"	integer DEFAULT 0,--基础锤子
	"FaithCost"	integer DEFAULT 0,--基础信仰花费
	"LeagueCost"	integer DEFAULT 0,--世界议会项目所需的基础产能投入（未在当前DLL中使用）
	"UnlockedByBelief"	boolean DEFAULT 0,--被信条限制信仰购买
	"UnlockedByLeague"	boolean DEFAULT 0,--通过世界议会解锁
	"HolyCity"	boolean DEFAULT 0,--需要圣城
	"NumCityCostMod"	integer DEFAULT 0,--根据城市数量增加基准产能
	"HurryCostModifier"	integer DEFAULT 0,--购买系数
	"MinAreaSize"	integer DEFAULT 0,--最小连续水域
	"ConquestProb"	integer DEFAULT 0,--攻占城市后该建筑被保留的概率百分比
	"CitiesPrereq"	integer DEFAULT 0,--建造该建筑的全国最少城市数量要求
	"LevelPrereq"	integer DEFAULT 0,--建造该建筑需要的最高单位等级
	"CultureRateModifier"	integer DEFAULT 0,--本城文化加成百分比
	"GlobalCultureRateModifier"	integer DEFAULT 0,--全国文化加成百分比
	"GreatPeopleRateModifier"	integer DEFAULT 0,--本城伟人点数加成百分比
	"GlobalGreatPeopleRateModifier"	integer DEFAULT 0,--全国伟人点数加成百分比
	"GreatGeneralRateModifier"	integer DEFAULT 0,--大将军点数积累速率加成百分比（正值更快产生）
	"GreatPersonExpendGold"	integer DEFAULT 0,--消耗伟人获得金钱，可叠加
	"GoldenAgeModifier"	integer DEFAULT 0,--黄金时代延长比例
	"UnitUpgradeCostMod"	integer DEFAULT 0,--单位升级费用修正百分比（正值为增加费用，负值为折扣，下限-75）
	"Experience"	integer DEFAULT 0,--本城训练的单位免费初始经验值
	"GlobalExperience"	integer DEFAULT 0,--全国训练的单位免费初始经验值
	"FoodKept"	integer DEFAULT 0,--人口增长变化比例
	"Airlift"	boolean DEFAULT 0,--允许从本城空运单位
	"AirModifier"	integer DEFAULT 0,--城市停机位变化
	"NukeModifier"	integer DEFAULT 0,--降低战略轰炸人口损失比例
	"NukeExplosionRand"	integer DEFAULT 0,--核弹爆炸随机值（未在当前DLL中使用）
	"HealRateChange"	integer DEFAULT 0,--城市立刻回血
	"Happiness"	integer DEFAULT 0,--本城快乐
	"UnmoddedHappiness"	integer DEFAULT 0,--全局快乐
	"UnhappinessModifier"	integer DEFAULT 0,--全国红脸变化比例
	"HappinessPerCity"	integer DEFAULT 0,--每一城市+x快乐
	"HappinessPerXPolicies"	integer DEFAULT 0,--每x项采取政策+1笑脸
	"CityCountUnhappinessMod"	integer DEFAULT 0,--城市数量导致的不满值修正百分比（负值减少不满，正值增加）
	"NoOccupiedUnhappiness"	boolean DEFAULT 0,--消除被占领城市的额外不满
	"WorkerSpeedModifier"	integer DEFAULT 0,--工人工作效率变化
	"MilitaryProductionModifier"	integer DEFAULT 0,--军事生产提速比例
	"SpaceProductionModifier"	integer DEFAULT 0,--飞船组建生产提速比例
	"GlobalSpaceProductionModifier"	integer DEFAULT 0,--全国飞船组建生产提速比例
	"BuildingProductionModifier"	integer DEFAULT 0,--建筑建造提速比例
	"WonderProductionModifier"	integer DEFAULT 0,--奇观建造提速比例
	"CityConnectionTradeRouteModifier"	integer DEFAULT 0,--城市连接加钱比例
	"CapturePlunderModifier"	integer DEFAULT 0,--被劫掠金钱比例（应该是对面获得金钱增加，埃及陵墓100）
	"PolicyCostModifier"	integer DEFAULT 0,--新政策文化需求降低比例
	"PlotCultureCostModifier"	integer DEFAULT 0,--扩展地块需求文化改变比例
	"GlobalPlotCultureCostModifier"	integer DEFAULT 0,--全国扩展地块需求文化改变比例
	"PlotBuyCostModifier"	integer DEFAULT 0,--购买地块金钱改变比例
	"GlobalPlotBuyCostModifier"	integer DEFAULT 0,--全国购买地块金钱改变比例
	"GlobalPopulationChange"	integer DEFAULT 0,--全国城市人口改变
	"TechShare"	integer DEFAULT 0,--与指定编号队伍共享科技（值=目标队伍编号+1，每建一个+1共享计数）
	"FreeTechs"	integer DEFAULT 0,--赠送免费科技数量
	"FreePolicies"	integer DEFAULT 0,--赠送免费政策数量
	"FreeGreatPeople"	integer DEFAULT 0,--赠送免费伟人数量
	"MedianTechPercentChange"	integer DEFAULT 0,--合作研究产出增加比例
	"Gold"	integer DEFAULT 0,--提供一次性金钱产出
	"AllowsRangeStrike"	boolean DEFAULT 0,--允许城市远程攻击
	"Espionage"	boolean DEFAULT 0,--是否为间谍相关建筑
	"AllowsFoodTradeRoutes"	boolean DEFAULT 0,--允许内运食物
	"AllowsProductionTradeRoutes"	boolean DEFAULT 0,--允许内运产能
	"Defense"	integer DEFAULT 0,--城防增加*100
	"ExtraCityHitPoints"	integer DEFAULT 0,--城市血量增加
	"GlobalDefenseMod"	integer DEFAULT 0,--全国城防变化比例
	"MinorFriendshipChange"	integer DEFAULT 0,--与见面城邦影响力改变比例
	"VictoryPoints"	integer DEFAULT 0,--胜利点数（用于时间/分数胜利计算）
	"ExtraMissionarySpreads"	integer DEFAULT 0,--额外传教次数
	"ReligiousPressureModifier"	integer DEFAULT 0,--宗教压力提高比例
	"EspionageModifier"	integer DEFAULT 0,--本城敌国间谍活动效率变化
	"GlobalEspionageModifier"	integer DEFAULT 0,--全国敌国间谍活动效率变化
	"ExtraSpies"	integer DEFAULT 0,--额外间谍数量
	"SpyRankChange"	integer DEFAULT 0,--新间谍等级变化？
	"InstantSpyRankChange"	integer DEFAULT 0,----已有间谍等级变化
	"TradeRouteRecipientBonus"	integer DEFAULT 0,--商路发出者奖金
	"TradeRouteTargetBonus"	integer DEFAULT 0,--商路接收者奖金
	"NumTradeRouteBonus"	integer DEFAULT 0,--商路数量增加
	"LandmarksTourismPercent"	integer DEFAULT 0,--地块产出转魅力百分比
	"LandmarksTourismPerXForeignFollowers"	integer DEFAULT 0,--每X个外国信徒额外+1%地块魅力转换比例。只要城市有主流宗教即生效（无需玩家创立该宗教），外国信徒数÷此值=魅力加成百分比
	"InstantMilitaryIncrease"	integer DEFAULT 0,--每类陆地战斗单位免费赠送1个（值为开关，>0即生效，非倍数，兵马俑写1）
	"GreatWorksTourismModifier"	integer DEFAULT 0,--杰作魅力提高比例
	"XBuiltTriggersIdeologyChoice"	integer DEFAULT 0,--x个该建筑开启意识形态
	"TradeRouteSeaDistanceModifier"	integer DEFAULT 0,--海上商路距离提高比例
	"TradeRouteSeaGoldBonus"	integer DEFAULT 0,--海上商路金钱加成
	"TradeRouteLandDistanceModifier"	integer DEFAULT 0,--陆地商路距离提高比例
	"TradeRouteLandGoldBonus"	integer DEFAULT 0,--陆地商路金钱加成
	"CityStateTradeRouteProductionModifier"	integer DEFAULT 0,--每条城邦商路提高全国产能百分比
	"GreatScientistBeakerModifier"	integer DEFAULT 0,--烧大科获取瓶子增加比例
	"BuildingClass"	text DEFAULT NULL,--建筑等级
	"ArtDefineTag"	text DEFAULT NULL,--模型
	"NearbyTerrainRequired"	text DEFAULT NULL,--需要的邻近地形
	"ProhibitedCityTerrain"	text DEFAULT NULL,--冲突的邻近地形
	"VictoryPrereq"	text DEFAULT NULL,--需要开启某胜利才能建造
	"FreeStartEra"	text DEFAULT NULL,--开局时代≥此值时，在符合条件的城市自动免费获得该建筑
	"MaxStartEra"	text DEFAULT NULL,--开局时代晚于此值时，无法建造该建筑
	"ObsoleteTech"	text DEFAULT NULL,--过时科技
	"EnhancedYieldTech"	text DEFAULT NULL,--提高产出的科技
	"TechEnhancedTourism"	integer DEFAULT 0,--科技提高魅力
	"FreeBuilding"	text DEFAULT NULL,--全国赠送某等级的建筑
	"FreeBuildingThisCity"	text DEFAULT NULL,--本城赠送某等级建筑
	"FreePromotion"	text DEFAULT NULL,--全国免费晋升
	"TrainedFreePromotion"	text DEFAULT NULL,--本城免费晋升
	"FreePromotionRemoved"	text DEFAULT NULL,--移除某晋升，如波利初始下海假建筑
	"ReplacementBuildingClass"	text DEFAULT NULL,--该建筑的升级替换建筑类，建造后旧建筑产能自动转移至新建筑
	"PrereqTech"	text DEFAULT NULL,--解锁科技
	"PolicyBranchType"	text DEFAULT NULL,--需要开启某政策树
	"SpecialistType"	text DEFAULT NULL,--伟人类型（决定专家点数和槽位）
	"SpecialistCount"	integer DEFAULT 0,--伟人槽位数量，由SpecialistType决定
	"GreatWorkSlotType"	text DEFAULT NULL,--杰作槽位类型
	"FreeGreatWork"	text DEFAULT NULL,--免费赠送杰作名
	"GreatWorkCount"	integer DEFAULT 0,--杰作槽位数量
	"SpecialistExtraCulture"	integer DEFAULT 0,--本城所有专家额外产出的文化值
	"GreatPeopleRateChange"	integer DEFAULT 0,--伟人点数，同样由SpecialistType决定
	"ExtraLeagueVotes"	integer DEFAULT 0,--选票改变
	"CityWall"	boolean DEFAULT 0,--城市围墙，感觉是城市模型出现城墙的效果
	"DisplayPosition"	integer DEFAULT 0,--奇观显示优先级（>0=奇观，控制世界地图显示和建造完成UI通知）
	"PortraitIndex"	integer DEFAULT '-1',--图标取材顺序
	"WonderSplashImage"	text DEFAULT NULL,--奇观完成展示图片(需要972x568像素的dds图片)
	"WonderSplashAnchor"	text DEFAULT 'R,T',--图片展示方向？
	"WonderSplashAudio"	text,--奇观完成语音
	"IconAtlas"	text DEFAULT NULL,--图标取材
	"ArtInfoCulturalVariation"	boolean DEFAULT 0,--根据文明文化组使用不同建筑模型（纯视觉标记）
	"ArtInfoEraVariation"	boolean DEFAULT 0,--根据游戏时代使用不同建筑模型（纯视觉标记）
	"ArtInfoRandomVariation"	boolean DEFAULT 0,--同上两个
	"AddsFreshWater"	INTEGER DEFAULT 0,--添加淡水？
	"PurchaseOnly"	INTEGER DEFAULT 0,--只能购买
	"CityAutomatonWorkersChange"	INTEGER DEFAULT 0,--城市自动化工人数量变化（SP新增，MOD_BUILDINGS_CITY_AUTOMATON_WORKERS）
	"GlobalCityAutomatonWorkersChange"	INTEGER DEFAULT 0,--全国同上？
	"CityWorkingChange"	INTEGER DEFAULT 0,--城市市民工作范围提高
	"GlobalCityWorkingChange"	INTEGER DEFAULT 0,--全国城市市民工作范围提高？
	"GreatWorkYieldType"	TEXT DEFAULT 'YIELD_CULTURE',--杰作的基础产出类型更换为其他产出，需要开启全局设置GLOBAL_GREATWORK_YIELDTYPES
	"GlobalConversionModifier"	INTEGER DEFAULT 0,--全国外来宗教传播速度变化，强权波塞冬神庙
	"ConversionModifier"	INTEGER DEFAULT 0,--本地外来宗教传播速度变化？
	"MinorFriendshipAnchorChange"	int NOT NULL DEFAULT 0,--对城邦基准影响力提高值
	"MinorQuestFriendshipMod"	int NOT NULL DEFAULT 0,--完成城邦任务获取影响力提高比例？
	"GoldenAgeUnitCombatModifier"	int NOT NULL DEFAULT 0,--黄金时代单位战斗力提高比例
	"GoldenAgeMeterMod"	int NOT NULL DEFAULT 0,--黄金时代文化阈值变化比例
	"AllowInstantYield"	BOOLEAN DEFAULT 0,--即时奖励
	"AnyWater"	BOOLEAN DEFAULT 0,--需要邻近淡水或沿海（核电扩容）
	"PopulationChange"	INTEGER DEFAULT 0,--本城人口变化
	"RangedStrikeModifier"	INTEGER DEFAULT 0,--城市攻击加成
	"ResetDamageValue"	INTEGER DEFAULT 0,--城防固伤
	"ReduceDamageValue"	INTEGER DEFAULT 0,--城市固免
	"FollowerCountDamageModifier"	INTEGER DEFAULT 0,--城市根据本城宗教信众数量获得固免/固伤的比例（100=每1信众+1固免/固伤，非圣城无效果）
	"FollowingCityCountDamageModifier"	INTEGER DEFAULT 0,--城市根据本城宗教信教城市数量获得固免/固伤的比例（100=每1城市+1固免/固伤，非圣城无效果）
	"GlobalCityStrengthMod"	INTEGER DEFAULT 0,--全国城市战斗力加成，强权法西尔盖比城堡
	"GlobalRangedStrikeModifier"	INTEGER DEFAULT 0,--全国城市远程攻击加成，法西尔盖比城堡
	"NukeInterceptionChance"	INTEGER DEFAULT 0,--核弹拦截概率
	"ExtraDamageHeal"	INTEGER DEFAULT 0,--城市生命额外回复增加量，强权圣米歇尔
	"ExtraAttacks"	INTEGER DEFAULT 0,--城市额外攻击次数
	"WaterTileDamage"	INTEGER DEFAULT 0,--本城水域敌人移动所受伤害，强权水雷区
	"WaterTileMovementReduce"	INTEGER DEFAULT 0,--敌人在本城水域移动力额外消耗，强权水雷区
	"WaterTileTurnDamage"	INTEGER DEFAULT 0,--敌人在水域过回合受伤害
	"LandTileDamage"	INTEGER DEFAULT 0,--陆地伤害，参考上面三项
	"LandTileMovementReduce"	INTEGER DEFAULT 0,--同上
	"LandTileTurnDamage"	INTEGER DEFAULT 0,--同上
	"BombardRange"	INTEGER DEFAULT 0,--城市攻击范围
	"BombardIndirect"	INTEGER DEFAULT 0,--城市间接火力
	"FreePromotion2"	TEXT DEFAULT NULL,--全国免费晋升2
	"FreePromotion3"	TEXT DEFAULT NULL,--晋升3
	"MoveAfterCreated"	INTEGER DEFAULT 0,--买单位移动力不会清零
	"CorruptionScoreChange"	integer NOT NULL DEFAULT 0,--腐败分数变更（可以变成0级城市）
	"CorruptionLevelChange"	integer NOT NULL DEFAULT 0,--腐败等级变更（不会变为0级城）
	"CorruptionScoreGlobalChange"	integer NOT NULL DEFAULT 0,--全国腐败分数变化值（全局叠加，区别于CorruptionScoreChange的本地效果）
	"SiegeKillCitizensModifier"	integer NOT NULL DEFAULT 0,--瘟疫杀人变更？
	"EnableCityScaleGrowth"	text,--城市规模污染免疫
	"EnableAllCityScaleGrowth"	boolean NOT NULL DEFAULT 0,--城市人口增长免疫污染影响，强权德商馆
	"ImmigrationRegressandModifier"	integer DEFAULT 0,--移民回归变量修正百分比：影响移民系统的回归速率计算，正值增加回归速率
	FOREIGN KEY("Description") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Civilopedia") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Strategy") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Help") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("ThemingBonusHelp") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("NearbyTerrainRequired") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("BuildingClass") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("Quote") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("ProhibitedCityTerrain") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("VictoryPrereq") REFERENCES "Victories"("Type"),
	FOREIGN KEY("FreeGreatWork") REFERENCES "GreatWorks"("Type"),
	FOREIGN KEY("FreeBuilding") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("PrereqTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("TrainedFreePromotion") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("FreeStartEra") REFERENCES "Eras"("Type"),
	FOREIGN KEY("GreatWorkSlotType") REFERENCES "GreatWorkSlots"("Type"),
	FOREIGN KEY("ObsoleteTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("ReplacementBuildingClass") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("FreeBuildingThisCity") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("EnhancedYieldTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("FreePromotionRemoved") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("IconAtlas") REFERENCES "IconTextureAtlases"("Atlas"),
	FOREIGN KEY("MaxStartEra") REFERENCES "Eras"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type"),
	FOREIGN KEY("FreePromotion") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("PolicyBranchType") REFERENCES "PolicyBranchTypes"("Type"),
	PRIMARY KEY("ID" AUTOINCREMENT)
);

CREATE TABLE "Building_BuildingClassHappiness" (--建筑为某一级别的所有建筑提供额外快乐
	"BuildingType"	text,--提供加成的建筑(后续此类不再赘述)
	"BuildingClassType"	text,--受到加成的建筑等级(后续此类不再赘述)
	"Happiness"	integer,--快乐数量
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),--BuildingType中的东西必须存在于Buildings表中的Type列(后续此类不再赘述)
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

CREATE TABLE "Building_BuildingClassLocalYieldChanges" (--建筑为本城市某一等级建筑提供额外产出
	"BuildingType"	text,--
	"BuildingClassType"	text,--
	"YieldType"	integer,--提供的额外产出的产出类型(后续此类不再赘述)
	"YieldChange"	integer DEFAULT 0,--额外产出的数值(后续此类不再赘述)
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

CREATE TABLE "Building_AreaYieldModifiers" (--建筑对本大陆城市某种产出百分比加成（公式：本大陆所有城市产出×Yield%，异大陆城市不受加成）
	"BuildingType"	text,--
	"YieldType"	text,--
	"Yield"	integer,--额外产出的数值(后续此类不再赘述)
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_BuildingClassYieldChanges" (--建筑为全国某一等级建筑提供额外产出（多个该建筑可以一直叠加）
	"BuildingType"	text,--
	"BuildingClassType"	text,--
	"YieldType"	integer,--
	"YieldChange"	integer DEFAULT 0,--
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_BuildingClassYieldModifiers" (--建筑为全国某一等级建筑提供额外百分比产出（多个该建筑可以一直叠加）
	"BuildingType"	text,
	"BuildingClassType"	text,
	"YieldType"	integer,
	"Modifier"	integer DEFAULT 0,--额外百分比的数值(后续此类不再赘述)
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_CityWithWorldWonderYieldModifierGlobal" (--所有拥有世界奇观的城市额外获得某种百分比产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_ClassesNeededGlobal" (--建造本建筑需要全国拥有某个等级的建筑
	"BuildingType"	text,
	"BuildingClassType"	text,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

CREATE TABLE "Building_ClassesNeededInCity" (--建造本建筑需要本城拥有某个等级的建筑
	"BuildingType"	text,
	"BuildingClassType"	text,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

CREATE TABLE "Building_DomainFreeExperiencePerGreatWork" (--本建筑槽内每个杰作对本城市某种领域的军队的初始经验加成
	"BuildingType"	text,
	"DomainType"	text,--受到经验加成的领域(后续此类不再赘述)
	"Experience"	integer,--初始经验加成数值(后续此类不再赘述)
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type")
);

CREATE TABLE "Building_DomainFreeExperiencePerGreatWorkGlobal" (--本建筑槽内每个杰作对全国某种领域的军队的初始经验加成
	"BuildingType"	text,
	"DomainType"	text,
	"Experience"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type")
);

CREATE TABLE "Building_DomainFreeExperiences" (--本建筑对本城市某种领域的军队的初始经验加成
	"BuildingType"	text,
	"DomainType"	text,
	"Experience"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type")
);

CREATE TABLE "Building_DomainFreeExperiencesGlobal" (--本建筑对全国某种领域的军队的初始经验加成
	"BuildingType"	text,
	"DomainType"	text,
	"Experience"	integer,
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_DomainProductionModifiers" (--本城市生产某种领域的单位获得的额外产能加成比例
	"BuildingType"	text,
	"DomainType"	text,
	"Modifier"	integer,
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_DomainTroops" (--建筑提供的某领域单位兵力基数（基本为海军）
	"BuildingType"	TEXT,
	"DomainType"	TEXT,
	"NumTroop"	INTEGER NOT NULL DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type")
);

CREATE TABLE "Building_EmpireResourceAnds" (--修建此建筑需要国境内存在某资源（多种资源的话需要都有）
	"BuildingType"	text,
	"ResourceType"	text,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

CREATE TABLE "Building_EmpireResourceOrs" (--修建此建筑需要国境内存在某资源（多种资源的话需要有其中一种）
	"BuildingType"	text,
	"ResourceType"	text,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

CREATE TABLE "Building_EnableUnitPurchase" (--允许在本城市使用信仰或金钱直接购买某一等级的单位（仅支持YIELD_GOLD和YIELD_FAITH，其他产出类型无效）
	"BuildingType"	text,
	"UnitClassType"	text,--允许购买的单位类别
	"YieldType"	text,--购买花费的货币类型
	"CostModifier"	integer DEFAULT '-1',--需要的基础数量
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

CREATE TABLE "Building_FeatureYieldChanges" (--对本城市某种地貌的产出加成
	"BuildingType"	text,
	"FeatureType"	text,--地貌类型
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_FeatureYieldChangesGlobal" (--对全国某种地貌的产出加成
	"BuildingType"	text,
	"FeatureType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_FeatureYieldModifiers" (--本城市某种地貌每有一块增加城市某种产出的百分比
	"BuildingType"	text,
	"FeatureType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_FreeSpecUnits" (--建筑完成后赠送指定免费单位的数量（可以赠送其他人的UU)
	"BuildingType"	text,
	"UnitType"	text,--赠送的单位的Type
	"NumUnits"	integer,--赠送数量
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type")
);

CREATE TABLE "Building_FreeSpecialistCounts" (--无用废弃接口
	"BuildingType"	text,
	"SpecialistType"	text,
	"Count"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type")
);

CREATE TABLE "Building_FreeUnits" (--建筑完成后赠送指定免费单位同级单位的数量（写其他人的UU只会赠送同级普通单位/本级自身UU）
	"BuildingType"	text,
	"UnitType"	text,
	"NumUnits"	integer,
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_GlobalYieldModifiers" (--建筑对全国某种产出的百分比加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_GreatWorkYieldChanges" (--建筑对全国杰作产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer NOT NULL,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_HurryModifiers" (--全国购买系数降低值（大本钟）
	"BuildingType"	text,
	"HurryType"	text,
	"HurryCostModifier"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("HurryType") REFERENCES "HurryInfos"("Type")
);

CREATE TABLE "Building_HurryModifiersLocal" (--本城市购买系数降低值
	"BuildingType"	text,
	"HurryType"	text,
	"HurryCostModifier"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("HurryType") REFERENCES "HurryInfos"("Type")
);

CREATE TABLE "Building_ImprovementYieldChanges" (--对本城市某种改良的产出加成
	"BuildingType"	text,
	"ImprovementType"	text,--改良的type
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type")
);

CREATE TABLE "Building_ImprovementYieldChangesGlobal" (--对全国某种改良的产出加成
	"BuildingType"	text,
	"ImprovementType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_ImprovementYieldModifiers" (--本城市某种改良提供某种产出的本地百分比加成
	"BuildingType"	text,
	"ImprovementType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_InstantYield" (--建筑完成后获得一次性产出的类型和数值
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_LakePlotYieldChanges" (--建筑对本城市湖泊地格加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_LocalFeatureAnds" (--建造本建筑需要本城工作范围内拥有表中所有地貌（AND逻辑，缺一不可）
	"BuildingType"	text,
	"FeatureType"	text,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type")
);

CREATE TABLE "Building_LocalFeatureOrs" (--建造本建筑需要本城工作范围内拥有表中任一地貌（OR逻辑，满足一个即可）
	"BuildingType"	text,
	"FeatureType"	text,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type")
);

CREATE TABLE "Building_LocalResourceAnds" (--建造本建筑需要本城工作范围内拥有表中所有资源（AND逻辑，缺一不可）
	"BuildingType"	text,
	"ResourceType"	text,--需要的资源的type
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_LocalResourceOrs" (--建造本建筑需要本城市拥有表中所有需求资源中的任意一种
	"BuildingType"	text,
	"ResourceType"	text,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

CREATE TABLE "Building_LockedBuildingClasses" (--当城市拥有指定class的建筑时无法建造本建筑
	"BuildingType"	text,
	"BuildingClassType"	text,
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_PlotYieldChanges" (--建筑对本城市某种地块的产出加成（此处为高度判断，详见Plots表中列举的PlotType）
	"BuildingType"	text,
	"PlotType"	text,--地块高度的类别
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("PlotType") REFERENCES "Plots"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_PrereqBuildingClasses" (--建造本建筑需要全国拥有多少个指定class的建筑（-1为没有具体数量，但是需要全国所有直辖城市都有）
	"BuildingType"	text,
	"BuildingClassType"	text,
	"NumBuildingNeeded"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

CREATE TABLE "Building_ResourceCultureChanges" (--本建筑对本城市某种资源的文化加成
	"BuildingType"	text,
	"ResourceType"	text,
	"CultureChange"	integer,--文化加成的数值
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

CREATE TABLE "Building_ResourceFaithChanges" (--本建筑对本城市某种资源的信仰加成
	"BuildingType"	text,
	"ResourceType"	text,
	"FaithChange"	integer,--信仰加成数值
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

CREATE TABLE "Building_ResourceFromImprovement" (--本建筑使本城市指定改良提供指定资源的数量
	"BuildingType"	text,
	"ResourceType"	text,
	"ImprovementType"	text,
	"Value"	integer DEFAULT 0,
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type")
);

CREATE TABLE "Building_ResourceQuantity" (--建筑提供指定资源的数量
	"BuildingType"	text,
	"ResourceType"	text,
	"Quantity"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

CREATE TABLE "Building_ResourceQuantityFromPOP" (--本城市每1人口提供的指定资源数量百分比（200为1人口提供2份该资源）
	"BuildingType"	text,
	"ResourceType"	text,
	"Modifier"	integer,
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_ResourceQuantityRequirements" (--建造此建筑需要多少份指定资源
	"BuildingType"	text,
	"ResourceType"	text,
	"Cost"	integer,
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_ResourceYieldChanges" (--建筑对本城市某种资源的产出加成
	"BuildingType"	text,
	"ResourceType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

CREATE TABLE "Building_ResourceYieldChangesGlobal" (--建筑对全国某种资源的产出加成
	"BuildingType"	text,
	"ResourceType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_ResourceYieldModifiers" (--建筑为本城某种资源提供百分比产出加成（每份该资源叠加一次；如Yield=5且本城有3份铁则产出+15%，与其他修正加算）
	"BuildingType"	text,
	"ResourceType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_RiverPlotYieldChanges" (--建筑对本城市沿河地块产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_SeaPlotYieldChanges" (--建筑对本城市大洋和海滨地块产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_SeaResourceYieldChanges" (--建筑对本城市海洋资源产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_SpecialistYieldChanges" (--本建筑对全国指定专家的产出加成
	"BuildingType"	text,
	"SpecialistType"	text,--专家类型
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type")
);

CREATE TABLE "Building_SpecialistYieldChangesLocal" (--本建筑对本城指定专家的产出加成
	"BuildingType"	text,
	"SpecialistType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_SpecialistYieldModifiers" (--建筑为本城指定专家提供的百分比产出加成
	"BuildingType"	text,
	"SpecialistType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type")
);

CREATE TABLE "Building_SpecialistYieldModifiersGlobal" (--建筑为全国指定专家提供的百分比产出加成
	"BuildingType"	text,
	"SpecialistType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_SpecificGreatPersonRateModifier" (--本城市指定专家的伟人点数积累速度百分比加成
	"BuildingType"	text,
	"SpecialistType"	text,
	"Modifier"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type")
);

CREATE TABLE "Building_TechAndPrereqs" (--需要同时拥有多个指定科技才能建造本建筑
	"BuildingType"	text,
	"TechType"	text,--需要的科技type
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("TechType") REFERENCES "Technologies"("Type")
);

CREATE TABLE "Building_TechEnhancedYieldChanges" (--建筑的EnhancedYieldTech中的科技为本建筑提供的产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_TerrainYieldChanges" (--建筑对本城市指定地形的产出加成
	"BuildingType"	text,
	"TerrainType"	text,--获得加成的地形
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type")
);

CREATE TABLE "Building_TerrainYieldChangesGlobal" (--建筑对全国指定地形的产出加成
	"BuildingType"	text,
	"TerrainType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_TerrainYieldModifier" (--建筑为本城指定地形提供百分比产出加成
	"BuildingType"	text,
	"TerrainType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_ThemingBonuses" (--建筑的主题奖励
	"BuildingType"	text,
	"Description"	text,
	"Bonus"	integer,--奖励数值
	"SameEra"	bool,--是否需要杰作都在同一个时代
	"UniqueEras"	bool,--是否需要每个杰作都不在同一个时代
	"MustBeArt"	bool,--必须是艺术杰作
	"MustBeArtifact"	bool,--必须是文物
	"MustBeEqualArtArtifact"	bool,--必须包含艺术品和文物
	"RequiresOwner"	bool,--必须是归属本文明作品
	"RequiresAnyButOwner"	bool,--必须是国外作品
	"RequiresSamePlayer"	bool,--作品必须来自同一个国家
	"RequiresUniquePlayers"	bool,--作品必须来自不同国家
	"AIPriority"	int,--AI倾向
	"ConsecutiveEras"	INTEGER DEFAULT 0,--要求作品连续跨越的时代数量
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_TradeRouteFromTheCityYields" (--本城市出发商路的额外产出加成
	"BuildingType"	text no,
	"YieldType"	text,
	"YieldValue"	int NOT NULL DEFAULT 0,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_UnitCombatFreeExperiences" (--本城市生产的指定战斗类型的单位初始经验加成
	"BuildingType"	text,
	"UnitCombatType"	text,
	"Experience"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

CREATE TABLE "Building_UnitCombatProductionModifiers" (--本城市生产指定战斗类型的单位时的产能加成
	"BuildingType"	text,
	"UnitCombatType"	text,
	"Modifier"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

CREATE TABLE "Building_UnitTypePrmoteHealGlobal" (--当表内单位获得晋升时，本建筑为其回复的血量
	"BuildingType"	text,
	"UnitType"	text,
	"Heal"	integer DEFAULT 0,
	FOREIGN KEY("UnitType") REFERENCES "Units"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldChangeWorldWonder" (--建筑对本城市的世界奇观产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldChangeWorldWonderGlobal" (--建筑对全国的世界奇观产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldChanges" (--建筑的基本产出
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldChangesPerPop" (--建筑为城市每人口提供的固定产出（存为×100精度，填100时每人口+1产出，非百分比）
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldChangesPerPopInEmpire" (--建筑为全国每人口提供的固定产出（存为×100精度，填100时每人口+1产出，非百分比）
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldChangesPerReligion" (--城市中每个宗教提供的产出*100(写200时每个宗教+2对应产出)
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldFromBirth" (--本城人口增长时提供一次性产出，公式：增长人口数×游戏速度增长系数/100×本表数值
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldFromBorderGrowth" (--本城因文化积累自然扩地（每获得一格新地块）时提供一次性产出，产出值×游戏速度文化修正/100
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldFromConstruction" (--本城完成建筑建造时根据其产能提供的一次性产出比例
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldFromInternalTR" (--本城出发的国内商路产出加成
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldFromOtherYield" (--本城每X数值的A产出转化为Y数值的B产出（无法二次转化）
	"BuildingType"	text,
	"InYieldType"	text,--A产出
	"InYieldValue"	integer NOT NULL,--X
	"OutYieldType"	text,--B产出
	"OutYieldValue"	integer NOT NULL,--Y
	FOREIGN KEY("InYieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("OutYieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldFromProcessModifier" (--本城产能转化其他产出时的额外转换率
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldFromProcessModifierGlobal" (--全国产能转化其他产出时的额外转换率（百分比点数，与本地值加算）
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldFromUnitProduction" (--本城市训练单位时根据其产能提供一次性产出的比例
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldFromYieldPercentGlobal" (--根据A产出的全局百分比为全国提供B产出加成的比例
	"BuildingType"	text,
	"YieldOut"	integer,
	"YieldIn"	integer,
	"Value"	integer DEFAULT 0,
	FOREIGN KEY("YieldOut") REFERENCES "Yields"("Type"),
	FOREIGN KEY("YieldIn") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldModifiers" (--建筑对本城市某种产出的百分比加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldMultiplier" (--本城市某种产出的总量乘算加成（与YieldModifier不同，乘算在所有加算之后生效，填50=最终产出×150%）
	"BuildingType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldPerAlly" (--每个同盟城邦为本城市提供的产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer NOT NULL,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldPerEspionageSpy" (--我方间谍驻扎的非己方城市为本城市提供该城市对应产出的百分比
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer NOT NULL,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type")
);

CREATE TABLE "Building_YieldPerFriend" (--每个友好城邦为本城市提供的产出加成
	"BuildingType"	text,
	"YieldType"	text,
	"Yield"	integer NOT NULL,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

CREATE TABLE "Building_YieldPerXFeatureTimes100" (--本城每个指定地貌为城市提供的产出（存为×100精度，填100=每地貌+1产出，填50=每地貌+0.5产出）
	"BuildingType"	text,
	"FeatureType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type")
);

CREATE TABLE "Building_YieldPerXTerrainTimes100" (--本城每个指定地形为城市提供的产出（存为×100精度，填100=每地形+1产出，填50=每地形+0.5产出）
	"BuildingType"	text,
	"TerrainType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type"),
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type")
);

--本城出发商路每个时代为本城增加的产出
CREATE TABLE "Building_TradeRouteFromTheCityYieldsPerEra" (
	"BuildingType"	text references Buildings(Type),
	"YieldType"	text references Yields(Type),
	"YieldValue"	integer
);
--本建筑随时代为城市增加的产出（公式：表中数值×(当前时代序号+1)，Ancient=×1, Classical=×2...）
CREATE TABLE "Building_YieldChangesPerEra" (
	"BuildingType"	text references Buildings(Type),
	"YieldType"	text references Yields(Type),
	"Yield"	integer
);
--全国沿河加成
CREATE TABLE Building_RiverPlotYieldChangesGlobal (
	'BuildingType' text no null references Buildings(Type),
	'YieldType' text references Yields(Type),
	'Yield' int default 0 not null
);
--本建筑需要城市有哪些高度地形
CREATE TABLE "Building_LocalPlotAnds" (
	'BuildingType' text no null references Buildings(Type),
	'PlotType' text references Plots(Type)
);
--本城每人口提供城市某领域单位初始经验百分比
CREATE TABLE "Building_DomainFreeExperiencesPerPop" (
	'BuildingType'	no null references Buildings(Type),
	'DomainType'	no null references Domains(Type),
	'Modifier'	integer
);
--本城每人口提供全国某领域单位初始经验百分比
CREATE TABLE "Building_DomainFreeExperiencesPerPopGlobal" (
	'BuildingType'	no null references Buildings(Type),
	'DomainType'	no null references Domains(Type),
	'Modifier'	integer
);
--驻守本城市某领域单位每回合获取经验
CREATE TABLE "Building_DomainFreeExperiencesPerTurn" (
	'BuildingType'	no null references Buildings(Type),
	'DomainType'	no null references Domains(Type),
	'Value'	integer
);
--全国某领域单位每回合获取经验
CREATE TABLE "Building_DomainFreeExperiencesPerTurnGlobal" (
	'BuildingType'	no null references Buildings(Type),
	'DomainType'	no null references Domains(Type),
	'Value'	integer
);
--建造本建筑需要全国拥有某个特定建筑（非建筑类级别，是指定具体建筑Type）
CREATE TABLE "Building_BuildingsNeededGlobal" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--本建筑Type
	"PreBuildingType"	text NOT NULL REFERENCES Buildings(Type)--前置需求建筑Type
);
--建造本建筑需要本城拥有某个特定建筑（非建筑类级别，是指定具体建筑Type）
CREATE TABLE "Building_BuildingsNeededInCity" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--本建筑Type
	"PreBuildingType"	text NOT NULL REFERENCES Buildings(Type)--前置需求建筑Type
);
--建筑为通往城邦的商路提供产出修正（本城出发）
CREATE TABLE "Building_CityStateTradeRouteYieldModifiers" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"YieldType"	text NOT NULL REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--产出修正值
);
--建筑为通往城邦的商路提供产出修正（全国叠加）
CREATE TABLE "Building_CityStateTradeRouteYieldModifiersGlobal" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"YieldType"	text NOT NULL REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--产出修正值
);
--建筑对特定域敌方单位的战斗力修正（本城境内）
CREATE TABLE "Building_DomainEnemyCombatModifier" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"DomainType"	text NOT NULL REFERENCES Domains(Type),--敌方单位域类型（陆地/海洋/空军）
	"Modifier"	integer DEFAULT 0--战斗力修正百分比
);
--建筑对特定域敌方单位的战斗力修正（全国叠加）
CREATE TABLE "Building_DomainEnemyCombatModifierGlobal" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"DomainType"	text NOT NULL REFERENCES Domains(Type),--敌方单位域类型
	"Modifier"	integer DEFAULT 0--战斗力修正百分比
);
--建筑对友方特定域单位在本城境内的战斗力修正
CREATE TABLE "Building_DomainFriendsCombatModifierLocal" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"DomainType"	text NOT NULL REFERENCES Domains(Type),--友方单位域类型
	"Modifier"	integer DEFAULT 0--战斗力修正百分比
);
--建筑对友方特定域单位的战斗力修正（全国叠加）
CREATE TABLE "Building_DomainFriendsCombatModifierGlobal" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"DomainType"	text NOT NULL REFERENCES Domains(Type),--友方单位域类型
	"Modifier"	integer DEFAULT 0--战斗力修正百分比（全国叠加，与Local效果叠加）
);
--建筑的口味值（影响AI建造该建筑的优先级权重）
CREATE TABLE "Building_Flavors" (
	"BuildingType"	text,--建筑Type
	"FlavorType"	text,--口味类型
	"Flavor"	integer,--口味值，越大AI越倾向建造
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("FlavorType") REFERENCES "Flavors"("Type")
);
--建筑增加特定单位类的最大可训练数量上限
CREATE TABLE "Building_UnitClassMaxInstances" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"UnitClassType"	text NOT NULL REFERENCES UnitClasses(Type),--单位类Type
	"ExtraMax"	integer DEFAULT 0--额外可训练数量上限
);
--己方单位劫掠敌方地块时，若劫掠单位的来源城市拥有此建筑，为该来源城市提供一次性产出（三层叠加：Local→来源城 + Global→来源城 + GlobalPlayer→全国每城）
CREATE TABLE "Building_YieldFromPillage" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"YieldType"	integer NOT NULL REFERENCES Yields(Type),--产出类型
	"Yield"	integer NOT NULL DEFAULT 0--产出数值
);
--己方单位劫掠敌方地块时，为劫掠单位的来源城市提供一次性产出（⚠ 虽名Global但仍归来源城，三层中第二层）
CREATE TABLE "Building_YieldFromPillageGlobal" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"YieldType"	integer NOT NULL REFERENCES Yields(Type),--产出类型
	"Yield"	integer NOT NULL DEFAULT 0--产出数值
);
--己方单位劫掠敌方地块时，为全国每座城市各提供一次性产出（范围最广）
CREATE TABLE "Building_YieldFromPillageGlobalPlayer" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"YieldType"	integer NOT NULL REFERENCES Yields(Type),--产出类型
	"Yield"	integer NOT NULL DEFAULT 0--产出数值
);
--建筑产出修正随时代变化（每进入新时代时该数值叠加一次）
CREATE TABLE "Building_YieldModifiersChangesPerEra" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"YieldType"	text NOT NULL REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--每时代产出修正百分比增加值
);
--建筑为特定改良设施提供额外产出（改良设施邻接改良设施时触发，OtherImprovementType为邻接的改良类型，效果仅本城）
CREATE TABLE "Building_AdjacentImprovementYieldChanges" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"ImprovementType"	text REFERENCES Improvements(Type),--改良设施Type
	"OtherImprovementType"	text REFERENCES Improvements(Type),--邻接的改良设施Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("OtherImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);
--建筑为特定改良设施提供额外产出（改良设施邻接改良设施时触发，效果全国叠加）
CREATE TABLE "Building_AdjacentImprovementYieldChangesGlobal" (
	"BuildingType"	text NOT NULL REFERENCES Buildings(Type),--建筑Type
	"ImprovementType"	text REFERENCES Improvements(Type),--改良设施Type
	"OtherImprovementType"	text REFERENCES Improvements(Type),--邻接的改良设施Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("BuildingType") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("OtherImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);
