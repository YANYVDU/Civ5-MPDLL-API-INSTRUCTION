--integer、text、boolean分别需要输入整数、字符和true/false
--如果某个明确标注了功能的接口使用无效，请自行查阅源码寻找是否有全局设置限制其启用与否
CREATE TABLE "Policies" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--必须唯一，所有标识有NOT NULL的列不能为空，否则闪退
	"Description"	text DEFAULT 'write a bug on this',--名称
	"Civilopedia"	text,--百科描述
	"Strategy"	text,--策略提示
	"Help"	text,--效果简述
	"PolicyBranchType"	text DEFAULT NULL,--所属政策树分支（引用PolicyBranchTypes表）
	"NumExtraBranches"	integer DEFAULT 0,--允许额外选择的社会政策分支数量
	"CultureCost"	integer DEFAULT 0,--文化基础花费（一般统一为10）
	"GridX"	integer DEFAULT 0,--政策树中横向位置（1-5）
	"GridY"	integer DEFAULT 0,--政策树中竖向位置（1-3）
	"Level"	integer DEFAULT 0,--意识形态政策等级
	"PolicyCostModifier"	integer DEFAULT 0,--新政策的成本变化百分比（负值减少，如美学中二-33）
	"CulturePerCity"	integer DEFAULT 0,--每座城市产出额外文化
	"CulturePerWonder"	integer DEFAULT 0,--每个奇观产出额外文化
	"CultureWonderMultiplier"	integer DEFAULT 0,--拥有世界奇观的城市文化产出变化百分比
	"CulturePerTechResearched"	integer DEFAULT 0,--每个已研究科技提供额外文化
	"CultureImprovementChange"	integer DEFAULT 0,--政策为改良设施增加的文化产出值
	"CultureFromKills"	integer DEFAULT 0,--击杀敌方单位获得对方战斗力x%的文化值
	"CultureFromBarbarianKills"	integer DEFAULT 0,--击杀蛮族单位获得的文化值
	"GoldFromKills"	integer DEFAULT 0,--击杀敌方单位获得对方战斗力x%的金币
	"EmbarkedExtraMoves"	integer DEFAULT 0,--海运时额外移动力
	"AttackBonusTurns"	integer DEFAULT 0,--选取此政策后x回合内额外25%战斗力加成
	"GoldenAgeTurns"	integer DEFAULT 0,--开启x回合的黄金时代
	"GoldenAgeMeterMod"	integer DEFAULT 0,--开启黄金时代所需快乐值的阈值变化（传统关门-25）
	"GoldenAgeDurationMod"	integer DEFAULT 0,--黄金时代持续时间变化百分比
	"NumFreeTechs"	integer DEFAULT 0,--获得免费科技数量
	"NumFreePolicies"	integer DEFAULT 0,--获得免费政策数量
	"NumFreeGreatPeople"	integer DEFAULT 0,--获得免费伟人数量
	"MedianTechPercentChange"	integer DEFAULT 0,--合作研究（RA）产出变化百分比
	"StrategicResourceMod"	integer DEFAULT 0,--战略资源数量变化百分比
	"WonderProductionModifier"	integer DEFAULT 0,--奇观建造加速百分比
	"BuildingProductionModifier"	integer DEFAULT 0,--建筑建造加速百分比
	"GreatPeopleRateModifier"	integer DEFAULT 0,--伟人点数积累速度变化百分比
	"GreatGeneralRateModifier"	integer DEFAULT 0,--陆军统帅点数积累速度变化百分比
	"GreatAdmiralRateModifier"	integer DEFAULT 0,--海军统帅点数积累速度变化百分比
	"GreatWriterRateModifier"	integer DEFAULT 0,--大文学家点数积累速度变化百分比
	"GreatArtistRateModifier"	integer DEFAULT 0,--大艺术家点数积累速度变化百分比
	"GreatMusicianRateModifier"	integer DEFAULT 0,--大音乐家点数积累速度变化百分比
	"GreatMerchantRateModifier"	integer DEFAULT 0,--大商人点数积累速度变化百分比
	"GreatScientistRateModifier"	integer DEFAULT 0,--大科学家点数积累速度变化百分比
	"DomesticGreatGeneralRateModifier"	integer DEFAULT 0,--在本国领土内战斗时陆军统帅点数积累速度变化百分比
	"ExtraHappiness"	integer DEFAULT 0,--全局额外快乐值
	"ExtraHappinessPerCity"	integer DEFAULT 0,--每座城市额外快乐值
	"UnhappinessMod"	integer DEFAULT 0,--全国不满值变化百分比
	"CityCountUnhappinessMod"	integer DEFAULT 0,--城市数量导致的不满值变化百分比
	"OccupiedPopulationUnhappinessMod"	integer DEFAULT 0,--占领城市人口不满值变化百分比
	"CapitalUnhappinessMod"	integer DEFAULT 0,--首都人口不满值变化百分比
	"FreeExperience"	integer DEFAULT 0,--单位免费初始经验值
	"WorkerSpeedModifier"	integer DEFAULT 0,--工人改良速度变化百分比
	"AllFeatureProduction"	integer DEFAULT 0,--移除任何地形特征（森林/沼泽/丛林等）时获得的固定产能值
	"ImprovementCostModifier"	integer DEFAULT 0,--修建改良设施的成本修正百分比
	"ImprovementUpgradeRateModifier"	integer DEFAULT 0,--改良设施升级速度（如矿井随科技升级）的修正百分比
	"SpecialistProductionModifier"	integer DEFAULT 0,--所有专家提供的产能加成百分比
	"SpecialistUpgradeModifier"	integer DEFAULT 0,--专家成长速度修正百分比
	"MilitaryProductionModifier"	integer DEFAULT 0,--军事单位生产速度变化百分比
	"BaseFreeUnits"	integer DEFAULT 0,--免除维护费的基础单位数量
	"BaseFreeMilitaryUnits"	integer DEFAULT 0,--免除维护费的基础军事单位数量
	"FreeUnitsPopulationPercent"	integer DEFAULT 0,--基于总人口提供额外免费单位维护数量的百分比
	"FreeMilitaryUnitsPopulationPercent"	integer DEFAULT 0,--基于总人口提供额外免费军事单位维护数量的百分比
	"HappinessPerGarrisonedUnit"	integer DEFAULT 0,--城市驻军提供快乐值
	"CulturePerGarrisonedUnit"	integer DEFAULT 0,--城市驻军提供文化值
	"HappinessPerTradeRoute"	integer DEFAULT 0,--每条城市连接（商路）提供的快乐值
	"HappinessPerXPopulation"	integer DEFAULT 0,--每x人口提供1快乐（x即为此值）
	"ExtraHappinessPerLuxury"	integer DEFAULT 0,--每种奢侈资源额外提供快乐值
	"UnhappinessFromUnitsMod"	integer DEFAULT 0,--单位导致的不满值变化百分比
	"NumExtraBuilders"	integer DEFAULT 0,--允许训练的额外工人/建造者数量上限
	"PlotGoldCostMod"	integer DEFAULT 0,--购买地块花费金币变化百分比
	"PlotCultureCostModifier"	integer DEFAULT 0,--扩地所需文化值变化百分比
	"PlotCultureExponentModifier"	integer DEFAULT 0,--城市地块扩张成本指数变化百分比
	"NumCitiesPolicyCostDiscount"	integer DEFAULT 0,--城市数量导致文化阈值增加的比例减免
	"GarrisonedCityRangeStrikeModifier"	integer DEFAULT 0,--有单位驻守的城市远程攻击力变化百分比
	"UnitPurchaseCostModifier"	integer DEFAULT 0,--单位购买价格变化百分比
	"BuildingPurchaseCostModifier"	integer DEFAULT 0,--建筑购买价格变化百分比
	"CityConnectionTradeRouteGoldModifier"	integer DEFAULT 0,--城市连接商路金币产出变化百分比
	"TradeMissionGoldModifier"	integer DEFAULT 0,--大商贸易任务获得金币变化百分比
	"FaithCostModifier"	integer DEFAULT 0,--信仰购买价格变化百分比
	"CulturalPlunderMultiplier"	integer DEFAULT 0,--占领城市时获得文化产出倍数
	"StealTechSlowerModifier"	integer DEFAULT 0,--降低其他间谍偷取己方科技的速度比例
	"StealTechFasterModifier"	integer DEFAULT 0,--提高己方间谍偷取科技的速度比例
	"CatchSpiesModifier"	integer DEFAULT 0,--阻止敌方窃取科技的概率变化百分比
	"GoldPerUnit"	integer DEFAULT 0,--每个单位提供回合金币
	"GoldPerMilitaryUnit"	integer DEFAULT 0,--每个军事单位提供回合金币
	"RouteGoldMaintenanceMod"	integer DEFAULT 0,--道路维护费变化百分比
	"BuildingGoldMaintenanceMod"	integer DEFAULT 0,--建筑维护费变化百分比
	"UnitGoldMaintenanceMod"	integer DEFAULT 0,--单位维护费变化百分比
	"UnitSupplyMod"	integer DEFAULT 0,--军队维护费修正百分比（正值增加维护费，负值减少）
	"UnitUpgradeCostMod"	integer DEFAULT 0,--单位升级花费变化百分比
	"CityStrengthMod"	integer DEFAULT 0,--城市防御力变化百分比
	"CityGrowthMod"	integer DEFAULT 0,--城市粮食积累速率变化百分比
	"CapitalGrowthMod"	integer DEFAULT 0,--首都粮食积累速率变化百分比
	"SettlerProductionModifier"	integer DEFAULT 0,--移民建造速度变化百分比
	"CapitalSettlerProductionModifier"	integer DEFAULT 0,--首都移民建造速度变化百分比
	"NewCityExtraPopulation"	integer DEFAULT 0,--新城建立时额外人口数量
	"FreeFoodBox"	integer DEFAULT 0,--每座城市每回合获得相当于增长阈值x%的额外食物
	"HappyPerMilitaryUnit"	integer DEFAULT 0,--每个军事单位提供的额外快乐值
	"MilitaryFoodProduction"	boolean DEFAULT 0,--是否允许用食物加速军事单位建造（进行军事生产时食物不计为粮仓积累）
	"HappinessToCulture"	integer DEFAULT 0,--快乐值的百分比转化为额外文化产出
	"HappinessToScience"	integer DEFAULT 0,--溢出快乐≥0时将城市总科研的百分比转化为额外科研（公式：城市科研×此值/100，快乐非负为门槛非基数）
	"NumCitiesFreeCultureBuilding"	integer DEFAULT 0,--前x座城市免费获得文化建筑
	"NumCitiesFreeFoodBuilding"	integer DEFAULT 0,--前x座城市免费获得粮食建筑
	"HalfSpecialistUnhappiness"	boolean DEFAULT 0,--专家人口产生的不满值减半
	"HalfSpecialistFood"	boolean DEFAULT 0,--专家人口消耗的食物减半
	"MaxConscript"	integer DEFAULT 0,--允许强制征召的最大单位数量（需乘世界大小修正）
	"UnitSightRangeChange"	integer DEFAULT 0,--单位视野范围变化
	"WoundedUnitDamageMod"	integer DEFAULT 0,--受伤单位造成伤害的变化比例（负值为威力更高）
	"BarbarianCombatBonus"	integer DEFAULT 0,--对蛮族单位战斗力加成百分比
	"AlwaysSeeBarbCamps"	boolean DEFAULT 0,--新蛮族营地出现时始终获得通知
	"RevealAllCapitals"	boolean DEFAULT 0,--揭示所有文明的首都位置（在地图上显示）
	"FreeSpecialist"	integer DEFAULT 0,--每座城市获得空闲专家数量
	"ExpModifier"	integer DEFAULT 0,--战斗获得经验的变化百分比
	"ExpInBorderModifier"	integer DEFAULT 0,--在己方国境内战斗时经验值获取加成百分比
	"MinorQuestFriendshipMod"	integer DEFAULT 0,--完成城邦任务获取影响力的变化百分比
	"MinorGoldFriendshipMod"	integer DEFAULT 0,--赠送金币获得城邦影响力的变化百分比
	"MinorFriendshipMinimum"	integer DEFAULT 0,--对城邦基础影响力的最低值
	"MinorFriendshipDecayMod"	integer DEFAULT 0,--对城邦影响力下降速度的变化百分比
	"OtherPlayersMinorFriendshipDecayMod"	integer DEFAULT 0,--其他文明对城邦影响力下降速度的变化百分比
	"CityStateUnitFrequencyModifier"	integer DEFAULT 0,--城邦赠送军事单位的频率变化百分比
	"CommonFoeTourismModifier"	integer DEFAULT 0,--与目标文明有共同敌人时魅力输出变化百分比
	"LessHappyTourismModifier"	integer DEFAULT 0,--对快乐低于己方的文明魅力输出变化百分比
	"SharedIdeologyTourismModifier"	integer DEFAULT 0,--对相同意识形态文明魅力输出变化百分比
	"LandTradeRouteGoldChange"	integer DEFAULT 0,--陆地商路金币产出变化
	"SeaTradeRouteGoldChange"	integer DEFAULT 0,--海上商路金币产出变化
	"SharedIdeologyTradeGoldChange"	integer DEFAULT 0,--对相同意识形态文明商路金币产出变化
	"RiggingElectionModifier"	integer DEFAULT 0,--操纵城邦选举成功率的变化百分比
	"MilitaryUnitGiftExtraInfluence"	integer DEFAULT 0,--赠送军事单位给城邦时额外获得的影响力
	"ProtectedMinorPerTurnInfluence"	integer DEFAULT 0,--保护城邦（承诺保护）每回合影响力的变化
	"AfraidMinorPerTurnInfluence"	integer DEFAULT 0,--对畏惧己方的城邦每回合影响力的变化
	"MinorBullyScoreModifier"	integer DEFAULT 0,--生产威慑性武器后产生的魅力值变化
	"CityStateTradeChange"	integer DEFAULT 0,--城邦商路金币产出变化
	"ThemingBonusMultiplier"	integer DEFAULT 0,--杰作主题展示奖励的变化乘数
	"InternalTradeRouteYieldModifier"	integer DEFAULT 0,--国内商路产出变化百分比
	"SharedReligionTourismModifier"	integer DEFAULT 0,--对相同宗教文明魅力输出变化百分比
	"TradeRouteTourismModifier"	integer DEFAULT 0,--商路连接带来的魅力输出变化百分比
	"OpenBordersTourismModifier"	integer DEFAULT 0,--开放边界带来的魅力输出变化百分比
	"MinorGreatPeopleAllies"	boolean DEFAULT 0,--盟友城邦也会赠送伟人
	"MinorScienceAllies"	boolean DEFAULT 0,--盟友城邦提供科研加成
	"MinorResourceBonus"	boolean DEFAULT 0,--盟友城邦提供资源数量翻倍
	"GarrisonFreeMaintenance"	boolean DEFAULT 0,--驻守城市的单位免除维护费
	"GoldenAgeCultureBonusDisabled"	boolean DEFAULT 0,--黄金时代期间文化加成被禁用
	"SecondReligionPantheon"	boolean DEFAULT 0,--允许第二宗教的万神殿信条生效
	"AddReformationBelief"	boolean DEFAULT 0,--获得宗教改革信条
	"EnablesSSPartHurry"	boolean DEFAULT 0,--允许大工加速飞船组件的建造
	"EnablesSSPartPurchase"	boolean DEFAULT 0,--允许使用金币购买飞船组件
	"AbleToAnnexCityStates"	boolean DEFAULT 0,--允许合并（吞并）城邦
	"OneShot"	boolean DEFAULT 0,--一次性政策：只能触发一次效果
	"IncludesOneShotFreeUnits"	boolean DEFAULT 0,--一次性政策是否附带免费单位
	"WeLoveTheKing"	text DEFAULT NULL,--"国王爱戴日"中"国王"二字的替换文本（纯显示用，非触发条件，如设为"女王"则显示为"女王爱戴日"）
	"FreeBuildingOnConquest"	text DEFAULT NULL,--征服城市时自动赠送的建筑Type
	"TechPrereq"	text DEFAULT NULL,--需要前置科技
	"PortraitIndex"	integer DEFAULT 0,--图标图集索引
	"IconAtlas"	text DEFAULT NULL,--图标图集
	"IconAtlasAchieved"	text DEFAULT NULL,--已选取时的图标图集
	-- 以下为SP 2.0新增列 --
	"Dummy"	INTEGER DEFAULT 0,--虚拟政策标记（无实际游戏效果，仅作占位/标记用）
	"CityAutomatonWorkersChange"	INTEGER DEFAULT 0,--城市自动化工人数量变化
	"CityWorkingChange"	INTEGER DEFAULT 0,--城市可工作地块范围变化
	"ImmigrationInModifier"	INTEGER DEFAULT 0,--移民流入修正百分比（外国人口移入己方文明的速度）
	"ImmigrationOutModifier"	INTEGER DEFAULT 0,--移民流出修正百分比（己方人口移出到外国文明的速度）
	"ConversionModifier"	INTEGER DEFAULT 0,--抵抗外来宗教传播的修正百分比（正值更难被洗教，负值更容易，同时影响被动宗教压力和传教士/先知传播强度）
	"ScienceModifierFromRANum"	integer DEFAULT 0,--根据研究协议（RA）数量提供的科研加成
	"FreePopulation"	integer DEFAULT 0,--所有城市立即获得免费人口
	"FreePopulationCapital"	integer DEFAULT 0,--首都立即获得免费人口
	"InstantFoodThresholdPercent"	integer NOT NULL DEFAULT 0,--政策启用时给予所有城市相当于增长阈值x%的免费食物
	"InstantFoodKeptPercent"	integer NOT NULL DEFAULT 0,--政策启用时设置城市保底食物为增长阈值的x%
	"FreeBuildingClass"	text DEFAULT NULL,--全国赠送指定级别的建筑（引用BuildingClasses表）
	"ExtraSpies"	integer DEFAULT 0,--额外间谍数量
	"DefenseBoostAllCities"	integer DEFAULT 0,--所有城市防御力增加固定点数
	"AlwaysWeLoveKindDayInGoldenAge"	boolean DEFAULT 0,--黄金时代期间所有城市永久处于"国王爱戴日"状态
	"MinorLocalBullyScoreModifier"	integer DEFAULT 0,--全局军事分数对本方的影响力影响修正
	"MinorAllyBullyScoreModifier"	integer DEFAULT 0,--己方军事分数对威慑同盟城邦的效力修正
	"MinorBullyInfluenceLossModifier"	integer DEFAULT 0,--威慑城邦时影响力损失的变化比例
	"RiggingElectionInfluenceModifier"	integer DEFAULT 0,--操纵城邦选举时影响力变化修正
	"SpyLevelUpWhenRigging"	boolean DEFAULT 0,--操纵选举成功后间谍直接升级
	"IdeologyPressureModifier"	integer NOT NULL DEFAULT 0,--意识形态文化压力变化百分比
	"IdeologyUnhappinessModifier"	integer NOT NULL DEFAULT 0,--意识形态不满值变化百分比
	"NullifyInfluenceModifier"	boolean DEFAULT 0,--消除来自其他文明掌握科技带来的魅力加成
	"DifferentIdeologyTourismModifier"	integer DEFAULT 0,--对不同意识形态文明魅力输出变化百分比
	"TourismModifierPerGPCreation"	boolean DEFAULT 0,--每诞生一名伟人时获得临时魅力输出加成
	"DiplomatPropagandaModifier"	integer DEFAULT 0,--外交官在城邦进行宣传的效率修正
	"GlobalHappinessFromFaithPercent"	integer NOT NULL DEFAULT 0,--来自信仰产出的全局快乐值百分比
	"HappinessInWLTKDCities"	integer NOT NULL DEFAULT 0,--"国王爱戴日"期间城市本地快乐值
	"HappinessPerReligionInCity"	integer DEFAULT 0,--城市中每存在一种宗教提供的额外快乐值
	"HappinessPerPolicy"	integer DEFAULT 0,--每项已采用政策提供额外快乐值
	"NoResistance"	boolean DEFAULT 0,--征服的城市无抵抗期
	"UpgradeAllTerritory"	boolean DEFAULT 0,--允许在境外升级单位
	"CityCaptureHealGlobal"	integer DEFAULT 0,--占领城市时全国单位回复生命值
	"ConquestCasualtiesModifier"	integer DEFAULT 0,--征服城市时人口保留率的修正百分比
	"OriginalCapitalCaptureTech"	integer DEFAULT 0,--攻占其他文明的原始首都时获得免费科技数量
	"OriginalCapitalCapturePolicy"	integer DEFAULT 0,--攻占其他文明的原始首都时获得免费政策数量
	"OriginalCapitalCaptureGreatPerson"	integer DEFAULT 0,--攻占其他文明的原始首都时获得免费伟人数量
	"CaptureCityResistanceTurnsChangeFormula"	text,--占领城市抵抗回合数变化公式（引用LuaFormula表）
	"NoOccupiedUnhappinessGarrisonedCity"	boolean DEFAULT 0,--驻军后的占领城市不产生占领不满
	"FreePromotionRemoved"	integer DEFAULT -1,--指定要从所有单位移除的晋升类型
	"RemoveCurrentPromotion"	boolean DEFAULT 0,--是否立即从现有单位移除该晋升
	"RemoveOceanImpassableCombatUnit"	boolean DEFAULT 0,--移除战斗单位的"海洋不可通行"晋升
	"WaterBuildSpeedModifier"	integer DEFAULT 0,--水上改良/建筑建造速度变化百分比
	"SettlerPopConsume"	boolean DEFAULT 0,--建造移民额外消耗人口
	"SettlerProductionEraModifier"	integer DEFAULT 0,--移民建造速度随时代变化的修正
	"SettlerProductionStartEra"	text DEFAULT NULL,--移民建造速率开始变化的起始时代
	"NumTradeRouteBonus"	integer DEFAULT 0,--可用商路数量变化
	"CapitalTradeRouteGoldChange"	integer DEFAULT 0,--首都出发商路金币产出变化
	"CapitalTradeRouteRangeChange"	integer DEFAULT 0,--首都出发商路范围变化
	"ReligionProductionModifier"	integer DEFAULT 0,--宗教建筑/单位建造速度加成百分比
	"NationalWonderCityCostModifier"	integer DEFAULT 0,--国家奇观建造成本修正百分比
	"CityExtraProductionCount"	integer DEFAULT 0,--每回合可额外完成的生产队列项目数（默认1，+1后每回合可完成2个）
	"DeepWaterNavalStrengthCultureModifier"	integer DEFAULT 0,--训练/购买远洋海军单位时获得相当于其战斗力x%的文化值
	"NoTechForWonder"	boolean DEFAULT 0,--建造奇观时忽略科技前置要求
	"NoTechForProject"	boolean DEFAULT 0,--建造项目时忽略科技前置要求
	"GreatScientistBeakerPolicyModifier"	integer DEFAULT 0,--大科学家消耗时产出烧瓶的变化百分比
	"ProductionBeakerMod"	integer DEFAULT 0,--大工程师秒奇观时产出产能的变化百分比
	"CorruptionScoreModifier"	integer NOT NULL DEFAULT 0,--腐败分数变化百分比
	"CorruptionLevelReduceByOne"	boolean NOT NULL DEFAULT 0,--腐败等级降低一级
	"WarCasualtiesModifier"	int NOT NULL DEFAULT 0,--战争伤亡点数变化百分比
	"ResourceCityConnectionTradeRouteGoldModifier"	integer NOT NULL DEFAULT 0,--每种资源带来的城市连接金币加成修正
	"ResourceUnhappinessModifier"	integer NOT NULL DEFAULT 0,--资源数量对不满值影响的修正
	"InstantTourismBombWhenFirstConquerMajorCapital"	integer NOT NULL DEFAULT 0,--首次征服主要文明首都时获得瞬间旅游业绩爆发值（与Traits同名列可叠加）
	"NaturalWonderFirstFinderTech"	integer NOT NULL DEFAULT 0,--首先发现自然奇观时获得免费科技数量
	"NaturalWonderFirstFinderPolicies"	integer NOT NULL DEFAULT 0,--首先发现自然奇观时获得免费政策数量
	"NaturalWonderSubsequentFinderPolicies"	integer NOT NULL DEFAULT 0,--后续发现自然奇观时获得免费政策数量
	"NaturalWonderSubsequentFinderTech"	integer NOT NULL DEFAULT 0,--后续发现自然奇观时获得免费科技数量
	FOREIGN KEY("Description") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Civilopedia") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Strategy") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Help") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("PolicyBranchType") REFERENCES "PolicyBranchTypes"("Type"),
	FOREIGN KEY("FreeBuildingOnConquest") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("TechPrereq") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("IconAtlas") REFERENCES "IconTextureAtlases"("Atlas"),
	FOREIGN KEY("IconAtlasAchieved") REFERENCES "IconTextureAtlases"("Atlas"),
	FOREIGN KEY("CaptureCityResistanceTurnsChangeFormula") REFERENCES "LuaFormula"("Type"),
	FOREIGN KEY("SettlerProductionStartEra") REFERENCES "Eras"("Type"),
	FOREIGN KEY("FreeBuildingClass") REFERENCES "BuildingClasses"("Type")
);

-- ============================================================
-- 以下是 Policies 相关子表
-- ============================================================

--政策树/分支定义表（如传统、自主、荣誉、虔信等）
CREATE TABLE "PolicyBranchTypes" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT,
	"Type"	text NOT NULL UNIQUE,--政策树Type，必须唯一
	"Description"	text,--名称
	"Civilopedia"	text,--百科描述
	"Strategy"	text,--策略提示
	"Help"	text,--效果简述
	"Title"	text,--标题文本
	"EraPrereq"	text DEFAULT NULL,--所需时代
	"FreePolicy"	text DEFAULT NULL,--解锁该政策树时赠送的免费政策
	"FreeFinishingPolicy"	text DEFAULT NULL,--点满该政策树时赠送的免费政策
	"FirstAdopterFreePolicies"	int DEFAULT 0,--首个采用者（同一分支）获得的免费政策数
	"SecondAdopterFreePolicies"	int DEFAULT 0,--第二个采用者获得的免费政策数
	"PurchaseByLevel"	boolean DEFAULT 0,--是否依赖政策等级购买（SP新增）
	"LockedWithoutReligion"	boolean DEFAULT 0,--无国教时锁定该政策树
	"AIMutuallyExclusive"	boolean DEFAULT 0,--AI互斥（AI不能同时选此树和另一树）
	"AIDelayNoReligion"	boolean DEFAULT 0,--AI无宗教时推迟选择此树
	"AIDelayNoCulture"	boolean DEFAULT 0,--AI文化不足时推迟选择此树
	"AIDelayNoCityStates"	boolean DEFAULT 0,--AI无城邦盟友时推迟选择此树
	"AIDelayNoScience"	boolean DEFAULT 0,--AI科研不足时推迟选择此树
	FOREIGN KEY("Description") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Civilopedia") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Strategy") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Help") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("Title") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("EraPrereq") REFERENCES "Eras"("Type"),
	FOREIGN KEY("FreePolicy") REFERENCES "Policies"("Type"),
	FOREIGN KEY("FreeFinishingPolicy") REFERENCES "Policies"("Type")
);

--政策树锁定特定文明才能使用
CREATE TABLE "PolicyBranch_CivilizationLocked" (
	"PolicyBranchType"	text REFERENCES PolicyBranchTypes(Type),--政策树Type
	"CivilizationType"	text REFERENCES Civilizations(Type)--限定文明Type
);

--政策树之间的互斥关系（选择此树后禁用另一树）
CREATE TABLE "PolicyBranch_Disables" (
	"PolicyBranchType"	text,--政策树Type
	"PolicyBranchDisable"	text,--被禁用的政策树Type
	FOREIGN KEY("PolicyBranchType") REFERENCES "PolicyBranchTypes"("Type"),
	FOREIGN KEY("PolicyBranchDisable") REFERENCES "PolicyBranchTypes"("Type")
);

--政策对特定改良建造速度的加成
CREATE TABLE "Policy_BuildSpeedModifier" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"BuildType"	text REFERENCES Builds(Type),--改良/建造Type
	"Modifier"	integer NOT NULL--建造速度修正百分比
);

--政策为特定建筑类提供额外文化产出
CREATE TABLE "Policy_BuildingClassCultureChanges" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--建筑类Type
	"CultureChange"	integer,--文化产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--政策为特定建筑类提供快乐值
CREATE TABLE "Policy_BuildingClassHappiness" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--建筑类Type
	"Happiness"	integer,--快乐值变化
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--政策为特定建筑类提供建造速度加成
CREATE TABLE "Policy_BuildingClassProductionModifiers" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--建筑类Type
	"ProductionModifier"	integer,--建造速度修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--政策为特定建筑类提供旅游业绩修正
CREATE TABLE "Policy_BuildingClassTourismModifiers" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--建筑类Type
	"TourismModifier"	integer,--旅游业绩修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--政策为特定建筑类提供产出变化
CREATE TABLE "Policy_BuildingClassYieldChanges" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--建筑类Type
	"YieldType"	text,--产出类型
	"YieldChange"	integer,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为特定建筑类提供产出百分比修正
CREATE TABLE "Policy_BuildingClassYieldModifiers" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--建筑类Type
	"YieldType"	text,--产出类型
	"YieldMod"	integer,--产出修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策对首都产出的固定加成
CREATE TABLE "Policy_CapitalYieldChanges" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策对首都产出的百分比修正
CREATE TABLE "Policy_CapitalYieldModifiers" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策对首都按人口数提供产出
CREATE TABLE "Policy_CapitalYieldPerPopChanges" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--每人口产出值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策在"庆祝国王日"期间提供产出加成
CREATE TABLE "Policy_CityLoveKingDayYieldMod" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--产出加成值
);

--政策按城市数量提供产出修正（乘以百分比的Yield）
CREATE TABLE "Policy_CityNumberCityYieldModifier" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--每座城市产出修正值
);

--政策为城市提供额外资源（可带条件：城市规模、是否沿海等）
CREATE TABLE "Policy_CityResources" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"ResourceType"	text REFERENCES Resources(Type),--资源Type
	"Quantity"	integer NOT NULL DEFAULT 0,--提供数量
	"CityScaleType"	text NULL REFERENCES CityScales(Type),--可选：城市规模条件
	"LargerScaleValid"	boolean NOT NULL DEFAULT 0,--更大规模是否可用
	"MustCoastal"	boolean NOT NULL DEFAULT 0--是否必须沿海城市
);

--政策为拥有世界奇观的城市提供产出百分比修正
CREATE TABLE "Policy_CityWithWorldWonderYieldModifier" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--产出修正百分比
);

--政策对城市产出的固定加成
CREATE TABLE "Policy_CityYieldChanges" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为有未改良地貌的城市提供产出
CREATE TABLE "Policy_CityYieldFromUnimprovedFeature" (
	"PolicyType"	text,--政策Type
	"FeatureType"	text,--地貌Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策对沿海城市的产出加成
CREATE TABLE "Policy_CoastalCityYieldChanges" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策按腐败等级降低政策成本
CREATE TABLE "Policy_CorruptionLevelPolicyCostModifier" (
	"PolicyType"	text DEFAULT '',--政策Type
	"CorruptionLevelType"	text DEFAULT '',--腐败等级Type
	"Modifier"	integer NOT NULL DEFAULT 0--政策成本修正百分比
);

--政策之间的禁用关系（选择此政策后禁用另一政策）
CREATE TABLE "Policy_Disables" (
	"PolicyType"	text,--政策Type
	"PolicyDisable"	text,--被禁用的政策Type
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PolicyDisable") REFERENCES "Policies"("Type")
);

--政策允许用信仰购买特定单位类（可限定时代）
CREATE TABLE "Policy_FaithPurchaseUnitClasses" (
	"PolicyType"	text,--政策Type
	"UnitClassType"	text NOT NULL,--可用信仰购买的单位类Type
	"EraType"	text DEFAULT NULL,--限定的时代
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("EraType") REFERENCES "Eras"("Type")
);

--政策对特定地貌的产出加成
CREATE TABLE "Policy_FeatureYieldChanges" (
	"PolicyType"	text,--政策Type
	"FeatureType"	text,--地貌Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策的口味值（影响AI选择该政策的权重）
CREATE TABLE "Policy_Flavors" (
	"PolicyType"	text,--政策Type
	"FlavorType"	text,--口味类型（FLAVOR_MILITARY、FLAVOR_CULTURE等）
	"Flavor"	integer NOT NULL,--口味值，越大AI越倾向选择
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("FlavorType") REFERENCES "Flavors"("Type")
);

--政策在所有城市赠送免费建筑
CREATE TABLE "Policy_FreeBuildingClass" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--免费获得的建筑类Type
	"Count"	integer DEFAULT 1,--建筑数量
	"IsRemovedWhenPolicyBlocked"	boolean DEFAULT 1,--政策被禁用时是否移除该建筑
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--政策仅在首都赠送免费建筑
CREATE TABLE "Policy_FreeBuildingClassCapital" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--免费获得的建筑类Type
	"Count"	integer DEFAULT 1,--建筑数量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--政策对每个城邦盟友赠送免费建筑
CREATE TABLE "Policy_FreeBuildingClassCityStates" (
	"PolicyType"	text,--政策Type
	"BuildingClassType"	text,--免费获得的建筑类Type
	"Count"	integer DEFAULT 1,--建筑数量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type")
);

--政策赠送免费物品（⚠ 此表在DLL源码中不存在，为无效接口）
CREATE TABLE "Policy_FreeItems" (
	"PolicyType"	text,--政策Type
	"SetType"	text NOT NULL,--物品集合Type（定义可选物品池）
	"MinItems"	integer DEFAULT 1,--最少获得数量
	"MaxItems"	integer DEFAULT 1,--最多获得数量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type")
);

--政策为特定单位战斗类型赠送免费晋升
CREATE TABLE "Policy_FreePromotionUnitCombats" (
	"PolicyType"	text,--政策Type
	"UnitCombatType"	text,--单位战斗类型（如UNITCOMBAT_MELEE）
	"PromotionType"	text,--赠送的晋升Type
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--政策为所有单位赠送免费晋升（不限战斗类型）
CREATE TABLE "Policy_FreePromotions" (
	"PolicyType"	text,--政策Type
	"PromotionType"	text,--赠送的晋升Type
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--政策赠送免费单位
CREATE TABLE "Policy_FreeUnitClasses" (
	"PolicyType"	text,--政策Type
	"UnitClassType"	text,--单位类Type
	"Count"	integer NOT NULL,--赠送数量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

--政策在黄金时代期间对伟人点数速率的修正
CREATE TABLE "Policy_GoldenAgeGreatPersonRateModifier" (
	"PolicyType"	text,--政策Type
	"GreatPersonType"	text,--伟人类型
	"Modifier"	integer,--伟人点数速率修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "GreatPersons"("Type")
);

--政策在消耗特定伟人时提供一次性产出
CREATE TABLE "Policy_GreatPersonExpendedYield" (
	"PolicyType"	text,--政策Type
	"GreatPersonType"	text,--伟人类型
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "GreatPersons"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策根据已有杰作数量提高伟人产出修正
CREATE TABLE "Policy_GreatPersonOutputModifierPerGWs" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"GreatPersonType"	text REFERENCES GreatPersons(Type),--伟人类型
	"Modifier"	integer DEFAULT 0--每个杰作提供的修正百分比
);

--政策为所有杰作提供额外产出
CREATE TABLE "Policy_GreatWorkYieldChanges" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策通过Lua公式将快乐值转换为产出修正
CREATE TABLE "Policy_HappinessYieldModifier" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"YieldFormula"	text REFERENCES LuaFormula(Type)--计算公式（引用LuaFormula表）
);

--政策对加速方式（如用金币购买）的成本修正
CREATE TABLE "Policy_HurryModifiers" (
	"PolicyType"	text,--政策Type
	"HurryType"	text,--加速类型（如HURRY_GOLD）
	"HurryCostModifier"	integer,--成本修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("HurryType") REFERENCES "HurryInfos"("Type")
);

--政策为特定改良设施提供额外文化产出
CREATE TABLE "Policy_ImprovementCultureChanges" (
	"PolicyType"	text,--政策Type
	"ImprovementType"	text,--改良设施Type
	"CultureChange"	integer,--文化产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type")
);

--政策为特定改良设施提供额外产出
CREATE TABLE "Policy_ImprovementYieldChanges" (
	"PolicyType"	text,--政策Type
	"ImprovementType"	text,--改良设施Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为特定改良设施提供额外产出（改良设施邻接改良设施时触发，OtherImprovementType为邻接的改良类型）
CREATE TABLE "Policy_AdjacentImprovementYieldChanges" (
	"PolicyType"	text,--政策Type
	"ImprovementType"	text,--改良设施Type
	"OtherImprovementType"	text,--邻接的改良设施Type
	"YieldType"	text,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("OtherImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为国内商路目的地提供产出速率（Rate为百分比，公式：来源城市产出速率 × Rate / 100，⚠ 需MOD_API_TRADE_ROUTE_YIELD_RATE）
CREATE TABLE "Policy_InternalTradeRouteDestYieldRate" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Rate"	integer DEFAULT 0--产出速率
);

--政策为通往城邦的商路提供产出速率（Rate为百分比，公式：目标城市产出速率 × Rate / 100，⚠ 需MOD_API_TRADE_ROUTE_YIELD_RATE）
CREATE TABLE "Policy_MinorsTradeRouteYieldRate" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Rate"	integer DEFAULT 0--产出速率
);

--政策对特定地块类型的产出加成
CREATE TABLE "Policy_PlotYieldChanges" (
	"PolicyType"	text,--政策Type
	"PlotType"	text,--地块类型（PLOT_HILLS、PLOT_MOUNTAIN等）
	"YieldType"	text,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PlotType") REFERENCES "Plots"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策的"或"前置条件（满足任一即可）
CREATE TABLE "Policy_PrereqORPolicies" (
	"PolicyType"	text,--政策Type
	"PrereqPolicy"	text,--前置政策Type（OR条件）
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PrereqPolicy") REFERENCES "Policies"("Type")
);

--政策的"与"前置条件（所有都需要满足）
CREATE TABLE "Policy_PrereqPolicies" (
	"PolicyType"	text,--政策Type
	"PrereqPolicy"	text,--前置政策Type（AND条件）
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PrereqPolicy") REFERENCES "Policies"("Type")
);

--政策为特定资源提供额外产出
CREATE TABLE "Policy_ResourceYieldChanges" (
	"PolicyType"	text,--政策Type
	"ResourceType"	text,--资源Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为所有专家提供额外产出
CREATE TABLE "Policy_SpecialistExtraYields" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加量
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为特定专家类型提供产出变化
CREATE TABLE "Policy_SpecialistYieldChanges" (
	"PolicyType"	text,--政策Type
	"SpecialistType"	text,--专家类型
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策对特定地形的产出加成
CREATE TABLE "Policy_TerrainYieldChanges" (
	"PolicyType"	text,--政策Type
	"TerrainType"	text,--地形Type
	"YieldType"	text,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策在训练特定单位类时获得旅游业绩
CREATE TABLE "Policy_TourismOnUnitCreation" (
	"PolicyType"	text,--政策Type
	"UnitClassType"	text,--单位类Type
	"Tourism"	integer NOT NULL,--获得的旅游业绩值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

--政策按商路数量为城市提供产出修正
CREATE TABLE "Policy_TradeRouteCityYieldModifier" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--每条商路产出修正百分比
);

--政策对特定域（陆地/海洋）的商路产出加成
CREATE TABLE "Policy_TradeRouteYieldChange" (
	"PolicyType"	text,--政策Type
	"DomainType"	text,--域类型（DOMAIN_LAND/DOMAIN_SEA）
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为未改良地貌提供产出加成
CREATE TABLE "Policy_UnimprovedFeatureYieldChanges" (
	"PolicyType"	text,--政策Type
	"FeatureType"	text,--地貌Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为特定单位类提供建造速度加成
CREATE TABLE "Policy_UnitClassProductionModifiers" (
	"PolicyType"	text,--政策Type
	"UnitClassType"	text,--单位类Type
	"ProductionModifier"	integer,--建造速度修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

--政策为特定战斗类型的单位提供免费经验
CREATE TABLE "Policy_UnitCombatFreeExperiences" (
	"PolicyType"	text,--政策Type
	"UnitCombatType"	text,--单位战斗类型
	"FreeExperience"	integer,--赠送的经验值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--政策为特定战斗类型的单位提供建造速度加成
CREATE TABLE "Policy_UnitCombatProductionModifiers" (
	"PolicyType"	text,--政策Type
	"UnitCombatType"	text,--单位战斗类型
	"ProductionModifier"	integer,--建造速度修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--政策解锁特定专家槽类型
CREATE TABLE "Policy_ValidSpecialists" (
	"PolicyType"	text,--政策Type
	"SpecialistType"	text,--解锁的专家类型
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type")
);

--政策对商路的产出加成
CREATE TABLE "Policy_YieldChangeTradeRoute" (
	"PolicyType"	text,--政策Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策对世界奇观的产出加成
CREATE TABLE "Policy_YieldChangeWorldWonder" (
	"PolicyType"	text,--政策Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策对自然奇观的产出加成
CREATE TABLE "Policy_YieldChangesNaturalWonder" (
	"PolicyType"	text,--政策Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策按城市宗教数量提供产出
CREATE TABLE "Policy_YieldChangesPerReligion" (
	"PolicyType"	text,--政策Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--每个宗教提供的产出值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策在击杀蛮族单位时提供一次性产出
CREATE TABLE "Policy_YieldFromBarbarianKills" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出数值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策在击杀任意敌方单位时提供一次性产出
CREATE TABLE "Policy_YieldFromKills" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出数值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策为非专家市民提供额外产出
CREATE TABLE "Policy_YieldFromNonSpecialistCitizens" (
	"PolicyType"	text,--政策Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--每个非专家市民产出值
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策按活跃间谍数量提供产出修正
CREATE TABLE "Policy_YieldModifierFromActiveSpies" (
	"PolicyType"	text,--政策Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--每个活跃间谍提供的产出修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策按文物数量提供产出修正
CREATE TABLE "Policy_YieldModifierPerArtifacts" (
	"PolicyType"	text REFERENCES Policies(Type),--政策Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--每个文物提供的产出修正百分比
);

--政策的产出百分比修正（全局）
CREATE TABLE "Policy_YieldModifiers" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出修正百分比
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--政策按人口提供产出
CREATE TABLE "Policy_YieldPerPopChanges" (
	"PolicyType"	text,--政策Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--每人口产出值（乘以100后的整数，如50表示0.5）
	FOREIGN KEY("PolicyType") REFERENCES "Policies"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);
