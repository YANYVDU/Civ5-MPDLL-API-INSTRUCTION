--integer、text、boolean分别需要输入整数、字符和true/false
--如果某个明确标注了功能的接口使用无效，请自行查阅源码寻找是否有全局设置限制其启用与否
CREATE TABLE "Beliefs" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--必须唯一，所有标识有NOT NULL的列不能为空，否则闪退
	"Description"	text,--信条效果描述
	"ShortDescription"	text,--信条名称
	"Pantheon"	boolean DEFAULT 0,--是否为万神殿信条
	"Founder"	boolean DEFAULT 0,--是否为创立者信条
	"Follower"	boolean DEFAULT 0,--是否为追随者信条
	"Enhancer"	boolean DEFAULT 0,--是否为强化者信条
	"Reformation"	boolean DEFAULT 0,--是否为宗教改革信条
	"RequiresPeace"	boolean DEFAULT 0,--是否仅在和平时期生效
	"ConvertsBarbarians"	boolean DEFAULT 0,--允许通过传教将蛮族单位转化为己方单位
	"FaithPurchaseAllGreatPeople"	boolean DEFAULT 0,--允许使用信仰购买所有类型的伟人
	"MinPopulation"	integer DEFAULT 0,--生效所需的最低城市人口数
	"MinFollowers"	integer DEFAULT 0,--生效所需的最低城市信徒数
	"MaxDistance"	integer DEFAULT 0,--击杀获取信仰的最大生效距离（配合FaithFromKills）
	"CityGrowthModifier"	integer DEFAULT 0,--城市食物积累速度变化百分比
	"FaithFromKills"	integer DEFAULT 0,--击杀敌方单位时获得对方战斗力x%的信仰值
	"FaithFromDyingUnits"	integer DEFAULT 0,--己方单位阵亡时获得其战斗力x%的信仰值
	"RiverHappiness"	integer DEFAULT 0,--沿河城市额外快乐值
	"HappinessPerCity"	integer DEFAULT 0,--每座信仰该宗教的城市提供快乐
	"HappinessPerFollowingCity"	float DEFAULT 0.0,--每座本国信仰该宗教的城市提供快乐（浮点数）
	"HappinessPerXPeacefulForeignFollowers"	integer DEFAULT 0,--和平文明的每x个外国信徒提供1快乐
	"PlotCultureCostModifier"	integer DEFAULT 0,--城市扩地所需文化值变化百分比
	"CityRangeStrikeModifier"	integer DEFAULT 0,--城市远程攻击战斗力变化百分比
	"CombatModifierEnemyCities"	integer DEFAULT 0,--在信仰该宗教的敌方城市范围内作战的战斗力加成
	"CombatModifierFriendlyCities"	integer DEFAULT 0,--在信仰该宗教的己方城市范围内作战的战斗力加成
	"FriendlyHealChange"	integer DEFAULT 0,--在友方地块上的额外回血量
	"CityStateFriendshipModifier"	integer DEFAULT 0,--对城邦影响力恢复速度变化百分比
	"LandBarbarianConversionPercent"	integer DEFAULT 0,--击败蛮族营地时蛮族投降的概率百分比（传教士转化蛮族）
	"WonderProductionModifier"	integer DEFAULT 0,--奇观建造产能加速百分比
	"PlayerHappiness"	integer DEFAULT 0,--全局快乐值增加
	"PlayerCultureModifier"	integer DEFAULT 0,--全局文化产出变化百分比
	"GoldPerFollowingCity"	integer DEFAULT 0,--每座信仰该宗教的己方城市提供回合金币
	"GoldPerXFollowers"	integer DEFAULT 0,--每x个信徒提供1回合金币
	"GoldPerFirstCityConversion"	integer DEFAULT 0,--城市首次皈依该宗教时获得的一次性金币
	"SciencePerOtherReligionFollower"	integer DEFAULT 0,--每转化一个异教徒获得的一次性科研点数
	"SpreadDistanceModifier"	integer DEFAULT 0,--宗教传播距离变化百分比
	"SpreadStrengthModifier"	integer DEFAULT 0,--宗教压力的传播强度变化百分比
	"ProphetStrengthModifier"	integer DEFAULT 0,--大先知传教强度变化百分比
	"ProphetCostModifier"	integer DEFAULT 0,--大先知信仰购买花费变化百分比
	"MissionaryStrengthModifier"	integer DEFAULT 0,--传教士传教强度变化百分比
	"MissionaryCostModifier"	integer DEFAULT 0,--传教士信仰购买花费变化百分比
	"FriendlyCityStateSpreadModifier"	integer DEFAULT 0,--对友好城邦的宗教传播速度变化百分比
	"GreatPersonExpendedFaith"	integer DEFAULT 0,--消耗伟人时获得的信仰值
	"CityStateMinimumInfluence"	integer DEFAULT 0,--对信仰该宗教的城邦最低影响力值
	"CityStateInfluenceModifier"	integer DEFAULT 0,--对信仰该宗教城邦的影响力变化百分比
	"OtherReligionPressureErosion"	integer DEFAULT 0,--消解异教宗教压力的比例
	"SpyPressure"	integer DEFAULT 0,--间谍在敌方城市提供宗教压力的数值
	"InquisitorPressureRetention"	integer DEFAULT 0,--被大先知和异端审判官传教时原有宗教压力保留比例
	"FaithBuildingTourism"	integer DEFAULT 0,--信仰购买建筑产生的魅力值
	"ObsoleteEra"	text DEFAULT NULL,--该信条在哪个时代过时失效
	"ResourceRevealed"	text DEFAULT NULL,--揭示某隐藏资源（如资源尚未被科技揭示时通过信条提前可见）
	"SpreadModifierDoublingTech"	text DEFAULT NULL,--研发某科技后传播速度翻倍
	-- 以下为SP 2.0新增列 --
	"ExtraSpies"	integer DEFAULT 0,--额外间谍数量
	"CuttingBonusModifier"	integer DEFAULT 0,--砍伐森林/清理地貌奖励变化百分比
	"LandmarksTourismPercent"	integer DEFAULT 0,--地块文化产出转化为魅力的百分比
	"AllowYieldPerBirth"	boolean DEFAULT 0,--产生大先知时允许获得一次性产出（配合Belief_YieldPerBirth定义产出类型）
	"GoldenAgeModifier"	integer DEFAULT 0,--黄金时代持续时间变化百分比
	"HolyCityUnitExperence"	integer DEFAULT 0,--圣城生产的单位获得的额外初始经验
	"CityExtraMissionarySpreads"	integer DEFAULT 0,--传教士额外传教次数
	"HolyCityPressureModifier"	integer DEFAULT 0,--圣城宗教压力变化百分比
	"InquisitorProhibitSpreadInAlly"	boolean DEFAULT 0,--异端审判官驻扎可阻止盟友城市被传教
	"InquisitionFervorTimeModifier"	integer DEFAULT 0,--异端审判官审判后的冷却时间变化比例
	"SameReligionMinorRecoveryModifier"	integer DEFAULT 0,--对同信仰城邦影响力恢复速度变化百分比
	"GreatPersonPointsPerCity"	boolean DEFAULT 0,--每城市提供伟人点数（需配合Belief_GreatPersonPoints定义类型）
	"GreatPersonPointsCapital"	boolean DEFAULT 0,--首都额外提供伟人点数
	"GreatPersonPointsHolyCity"	boolean DEFAULT 0,--圣城额外提供伟人点数
	"FreePromotionForProphet"	text DEFAULT NULL,--大先知免费获得的晋升（引用UnitPromotions表）
	"FounderFreePromotion"	text DEFAULT NULL,--创立者信条给予创立文明所有单位的免费晋升
	"FollowingCityFreePromotion"	text DEFAULT NULL,--追随者信条给予信仰城市单位的免费晋升
	"CityCorruptionScoreChange"	integer DEFAULT 0,--信仰该宗教的城市腐败分数变化值（正值增加腐败，负值减少腐败）
	"FirstConversionCitiesPerGoldenAge"	integer DEFAULT 0,--每X座城市首次皈依该宗教时创立者开启一次黄金时代（X为此阈值，与FirstConversionCitiesPerPop共用计数器）
	"FirstConversionCitiesPerPop"	integer DEFAULT 0,--每X座城市首次皈依该宗教时圣城增长1人口（X为此值）
	FOREIGN KEY("ObsoleteEra") REFERENCES "Eras"("Type"),
	FOREIGN KEY("ResourceRevealed") REFERENCES "Resources"("Type"),
	FOREIGN KEY("SpreadModifierDoublingTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("FreePromotionForProphet") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("FounderFreePromotion") REFERENCES "UnitPromotions"("Type"),
	FOREIGN KEY("FollowingCityFreePromotion") REFERENCES "UnitPromotions"("Type")
);

-- ============================================================
-- 以下是 Beliefs 相关子表
-- ============================================================

--允许使用信仰购买指定级别的建筑（通常配合Follower信条）
CREATE TABLE "Belief_BuildingClassFaithPurchase" (
	"BeliefType"	text,--信条Type
	"BuildingClassType"	text,--可通过信仰购买的建筑级别
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--信仰该宗教的城市中指定级别建筑提供额外快乐
CREATE TABLE "Belief_BuildingClassHappiness" (
	"BeliefType"	text,
	"BuildingClassType"	text,
	"Happiness"	integer,--快乐数量
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--信仰该宗教的城市中指定级别建筑提供额外魅力
CREATE TABLE "Belief_BuildingClassTourism" (
	"BeliefType"	text,
	"BuildingClassType"	text,
	"Tourism"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--信仰该宗教的城市中指定级别建筑提供额外产出
CREATE TABLE "Belief_BuildingClassYieldChanges" (
	"BeliefType"	text,
	"BuildingClassType"	text,
	"YieldType"	integer,--产出类型
	"YieldChange"	integer DEFAULT 0,--产出增加值
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--首都额外产出（创立者/改革信条常用）
CREATE TABLE "Belief_CapitalYieldChanges" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer NOT NULL,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--每个信仰该宗教的城市为本城提供的额外产出
CREATE TABLE "Belief_CityYieldChanges" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--城市中未改良地貌的城市基础产出加成（产出归城市，排除自然奇观，⚠ 需MOD_API_UNIFIED_YIELDS）
CREATE TABLE "Belief_CityYieldFromUnimprovedFeature" (
	"BeliefType"	text,
	"FeatureType"	text,--地貌类型
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--城市中每种异教提供的额外产出
CREATE TABLE "Belief_CityYieldPerOtherReligion" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--沿海城市的额外产出（受MinPopulation限制，⚠ 需MOD_API_UNIFIED_YIELDS）
CREATE TABLE "Belief_CoastalCityYieldChanges" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer NOT NULL,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--砍伐森林/清理地貌时获得一次性产出
CREATE TABLE "Belief_CuttingInstantYield" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--砍伐/清理时产出修正百分比
CREATE TABLE "Belief_CuttingInstantYieldModifier" (
	"BeliefType"	text,
	"YieldType"	text,
	"Modifier"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--允许在特定时代信仰购买指定级别的单位（改革信条用途）
CREATE TABLE "Belief_EraFaithUnitPurchase" (
	"BeliefType"	text,
	"EraType"	text,--可在该时代及之后购买
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("EraType") REFERENCES "Eras"("Type")
);

--信条对指定地貌的产出加成
CREATE TABLE "Belief_FeatureYieldChanges" (
	"BeliefType"	text,
	"FeatureType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--黄金时代中指定伟人类型的点数积累速度变化
CREATE TABLE "Belief_GoldenAgeGreatPersonRateModifier" (
	"BeliefType"	text,
	"GreatPersonType"	text,--伟人类型
	"Modifier"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "GreatPersons"("Type")
);

--消耗伟人时获得额外产出（产出归玩家，仅对创立者本人创立的宗教生效，⚠ 第二神系不生效，⚠ 需MOD_API_UNIFIED_YIELDS）
CREATE TABLE "Belief_GreatPersonExpendedYield" (
	"BeliefType"	text,
	"GreatPersonType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "GreatPersons"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条提供的伟人点数类型和数值（配合主表的GreatPersonPointsPerCity/Capital/HolyCity）
CREATE TABLE "Belief_GreatPersonPoints" (
	"BeliefType"	text,
	"GreatPersonType"	text,
	"Value"	integer DEFAULT 0,--每城市/首都/圣城的伟人点数
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "GreatPersons"("Type")
);

--信条对杰作产出的加成
CREATE TABLE "Belief_GreatWorkYieldChanges" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer NOT NULL,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--圣城额外产出
CREATE TABLE "Belief_HolyCityYieldChanges" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--圣城基于外国追随者数量获得的产出（每x外国追随者提供y产出）
CREATE TABLE "Belief_HolyCityYieldPerForeignFollowers" (
	"BeliefType"	text,
	"YieldType"	text,
	"PerForeignFollowers"	integer,--每多少个外国追随者
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--圣城基于本国追随者数量获得的产出
CREATE TABLE "Belief_HolyCityYieldPerNativeFollowers" (
	"BeliefType"	text,
	"YieldType"	text,
	"PerNativeFollowers"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--指定改良设施邻接其所有者城市时，该改良地块获得额外产出（产出归地块，遍历6邻格检查同玩家城市）
CREATE TABLE "Belief_ImprovementAdjacentCityYieldChanges" (
	"BeliefType"	text,
	"ImprovementType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对指定改良设施的产出加成
CREATE TABLE "Belief_ImprovementYieldChanges" (
	"BeliefType"	text,
	"ImprovementType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条为特定改良设施提供额外产出（改良设施邻接改良设施时触发，OtherImprovementType为邻接的改良类型）
CREATE TABLE "Belief_AdjacentImprovementYieldChanges" (
	"BeliefType"	text,--信条Type
	"ImprovementType"	text,--改良设施Type
	"OtherImprovementType"	text,--邻接的改良设施Type
	"YieldType"	text,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("OtherImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信仰该宗教的城市中每点本地快乐转化为产出的比例（Rate=100表示1快乐=1产出，Rate=50表示1快乐=0.5产出）
CREATE TABLE "Belief_LocalHappinessYieldRate" (
	"BeliefType"	text,
	"YieldType"	text,
	"Rate"	integer DEFAULT 0,--每点本地快乐转化为产出的比例（百分数）
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--腐败分数转化为产出的比例(100=每100腐败+1产出，公式=腐败分×Rate/10000，0腐败城市产出为0)
CREATE TABLE "Belief_CorruptionScoreYieldRate" (
	"BeliefType"	text,
	"YieldType"	text,
	"Rate"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对城市中湖泊地块的产出加成
CREATE TABLE "Belief_LakePlotYieldChanges" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--基于追随者数量的产出百分比修正（上限由Yields定义，但此处Max限定）
CREATE TABLE "Belief_MaxYieldModifierPerFollower" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Max"	integer DEFAULT 0,--最大百分比加成
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--城市中指定高度类型（丘陵/平地/山地/水域，引用Plots表）地块的产出加成（⚠ 需启用MOD_RELIGION_PLOT_YIELDS全局开关）
CREATE TABLE "Belief_PlotYieldChanges" (
	"BeliefType"	text,
	"PlotType"	text,--地块高度类型（引用Plots表）
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("PlotType") REFERENCES "Plots"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条使指定资源提供额外快乐（⚠ 此表在DLL中无调用代码，无法生效，为无效接口）
CREATE TABLE "Belief_ResourceHappiness" (
	"BeliefType"	text,
	"ResourceType"	text,
	"HappinessChange"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

--信条使指定资源数量变化百分比（⚠ 此表在DLL中无调用代码，无法生效，为无效接口）
CREATE TABLE "Belief_ResourceQuantityModifiers" (
	"BeliefType"	text,
	"ResourceType"	text,
	"ResourceQuantityModifier"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

--信条对指定资源的产出加成
CREATE TABLE "Belief_ResourceYieldChanges" (
	"BeliefType"	text,
	"ResourceType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--城市沿河地块的产出加成
CREATE TABLE "Belief_RiverPlotYieldChanges" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对指定专家的产出加成
CREATE TABLE "Belief_SpecialistYieldChanges" (
	"BeliefType"	text,
	"SpecialistType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--城市坐落于指定地形时的公民粮食消耗百分比修正
CREATE TABLE "Belief_TerrainCityFoodConsumption" (
	"BeliefType"	text,
	"TerrainType"	text,
	"Modifier"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type")
);

--城市中指定地形的产出加成（本地效果）
CREATE TABLE "Belief_TerrainCityYieldChanges" (
	"BeliefType"	text,
	"TerrainType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对指定地形的产出加成（基础层，在地貌处理前计算，与Belief_TerrainYieldChangesAdditive效果等价）
CREATE TABLE "Belief_TerrainYieldChanges" (
	"BeliefType"	text,
	"TerrainType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对指定地形的产出加成（叠加层，在地貌处理后、与湖泊/河流加成同阶段计算，和Belief_TerrainYieldChanges效果等价）
CREATE TABLE "Belief_TerrainYieldChangesAdditive" (
	"BeliefType"	text,
	"TerrainType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对指定领域（陆地/海上）的商路产出加成
CREATE TABLE "Belief_TradeRouteYieldChange" (
	"BeliefType"	text,
	"DomainType"	text,--商路领域
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对未改良地貌的地块产出加成（产出归地块，需市民工作，⚠ 需MOD_API_UNIFIED_YIELDS）
CREATE TABLE "Belief_UnimprovedFeatureYieldChanges" (
	"BeliefType"	text,
	"FeatureType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对任意专家的产出加成（不限定专家类型）
CREATE TABLE "Belief_YieldChangeAnySpecialist" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对城市中自然奇观的产出加成
CREATE TABLE "Belief_YieldChangeNaturalWonder" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--基于每个外国信仰城市的额外产出
CREATE TABLE "Belief_YieldChangePerForeignCity" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--基于每x个外国追随者的额外产出
CREATE TABLE "Belief_YieldChangePerXForeignFollowers" (
	"BeliefType"	text,
	"YieldType"	integer,
	"ForeignFollowers"	integer DEFAULT 0,--每多少个外国追随者
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--与首都通过道路/铁路连通的城市获得额外产出（非商路系统，检查的是IsRouteToCapitalConnected）
CREATE TABLE "Belief_YieldChangeTradeRoute" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对城市中世界奇观的产出加成
CREATE TABLE "Belief_YieldChangeWorldWonder" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--击杀蛮族单位时获得一次性产出
CREATE TABLE "Belief_YieldFromBarbarianKills" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--击杀任意敌方单位时获得一次性产出
CREATE TABLE "Belief_YieldFromKills" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--信条对自然奇观产出的百分比修正
CREATE TABLE "Belief_YieldModifierNaturalWonder" (
	"BeliefType"	text,
	"YieldType"	integer,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--基于每个追随者的百分比产出修正（*100来避免浮点数，写100=1%）
CREATE TABLE "Belief_YieldModifierPerFollowerTimes100" (
	"BeliefType"	text,
	"YieldType"	text,
	"Modifier"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--产生大先知时的额外一次性产出（配合主表AllowYieldPerBirth启用）
CREATE TABLE "Belief_YieldPerBirth" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--每个信仰该宗教的城市提供的额外产出
CREATE TABLE "Belief_YieldPerFollowingCity" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--每转化一个异教徒提供的额外产出
CREATE TABLE "Belief_YieldPerOtherReligionFollower" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--每x个信徒提供的额外产出
CREATE TABLE "Belief_YieldPerXFollowers" (
	"BeliefType"	text,
	"YieldType"	text,
	"PerXFollowers"	integer,--每多少个信徒
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--商路通往本宗教圣城时，起源城市获得的额外产出
CREATE TABLE "Belief_TradeRouteToHolyCityYield" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--商路通往本宗教圣城时，圣城（目的地）获得的额外产出
CREATE TABLE "Belief_TradeRouteToHolyCityDestYield" (
	"BeliefType"	text,
	"YieldType"	text,
	"Yield"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--商路通往同一主流宗教的城市时产出百分比修正（*100避免浮点，写100=+100%）
CREATE TABLE "Belief_TradeRouteSameReligionYieldModifier" (
	"BeliefType"	text,
	"YieldType"	text,
	"Modifier"	integer DEFAULT 0,
	FOREIGN KEY("BeliefType") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);