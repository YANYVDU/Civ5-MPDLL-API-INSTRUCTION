--integer、text、boolean分别需要输入整数、字符和true/false
--如果某个明确标注了功能的接口使用无效，请自行查阅源码寻找是否有全局设置限制其启用与否
CREATE TABLE "Traits" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--必须唯一，所有标识有NOT NULL的列不能为空，否则闪退
	"Description"	text,--特性描述
	"ShortDescription"	text,--特性简称
	"LevelExperienceModifier"	integer DEFAULT 0,--单位升级所需经验修正百分比（祖鲁为-25）
	"GreatPeopleRateModifier"	integer DEFAULT 0,--伟人点数积累速率修正百分比
	"GreatScientistRateModifier"	integer DEFAULT 0,--大科学家点数积累速率修正百分比（巴比伦为50）
	"GreatGeneralRateModifier"	integer DEFAULT 0,--大将军产生速率修正百分比（中国为50）
	"GreatGeneralExtraBonus"	integer DEFAULT 0,--大将军提供的战斗奖励额外加成（中国为15）
	"GreatPersonGiftInfluence"	integer DEFAULT 0,--将伟人赠送给城邦可获得的影响力值（瑞典为90）
	"MaxGlobalBuildingProductionModifier"	integer DEFAULT 0,--全局建筑建造速度修正上限（SP新增功能）
	"MaxTeamBuildingProductionModifier"	integer DEFAULT 0,--团队建筑建造速度修正上限（SP新增功能）
	"MaxPlayerBuildingProductionModifier"	integer DEFAULT 0,--玩家建筑建造速度修正上限（SP新增功能）
	"CityUnhappinessModifier"	integer DEFAULT 0,--城市数量导致的不满值修正百分比（印度100表示增加100%）
	"PopulationUnhappinessModifier"	integer DEFAULT 0,--人口数量导致的不满值修正百分比（印度-50表示减半）
	"CityStateBonusModifier"	integer DEFAULT 0,--友好/同盟城邦提供奖励产出修正百分比（暹罗50）
	"CityStateFriendshipModifier"	integer DEFAULT 0,--城邦影响力恢复速度修正百分比（希腊100）
	"CityStateCombatModifier"	integer DEFAULT 0,--对城邦单位的战斗力加成（蒙古30）
	"LandBarbarianConversionPercent"	integer DEFAULT 0,--击败陆地蛮族营地单位时使其投降的几率百分比（德国67）
	"LandBarbarianConversionExtraUnits"	integer DEFAULT 0,--击败蛮族营地额外获得单位数量
	"SeaBarbarianConversionPercent"	integer DEFAULT 0,--击败海上蛮族单位时使其投降的几率百分比（土耳其）
	"LandUnitMaintenanceModifier"	integer DEFAULT 0,--陆地单位维护费修正百分比（德国-25）
	"NavalUnitMaintenanceModifier"	integer DEFAULT 0,--海军单位维护费修正百分比（土耳其-66）
	"CapitalBuildingModifier"	integer DEFAULT 0,--在其他城市建造首都已拥有的建筑时产能加成百分比（罗马25）
	"PlotBuyCostModifier"	integer DEFAULT 0,--购买地块金币费用修正百分比（美国-50）
	"PlotCultureCostModifier"	integer DEFAULT 0,--文化扩地所需文化值修正百分比（俄罗斯-25）
	"CultureFromKills"	integer DEFAULT 0,--击杀单位获得对方战斗力×此百分比的文化值（阿兹特克100）
	"FaithFromKills"	integer DEFAULT 0,--击杀单位获得对方战斗力×此百分比的信仰值
	"CityCultureBonus"	integer DEFAULT 0,--每座城市额外获得的文化值（法国2）
	"CapitalThemingBonusModifier"	integer DEFAULT 0,--首都主题展示奖励修正百分比（法国100）
	"PolicyCostModifier"	integer DEFAULT 0,--解锁政策所需文化值修正百分比
	"CityConnectionTradeRouteChange"	integer DEFAULT 0,--城市连接的商路金币收益变化百分比
	"WonderProductionModifier"	integer DEFAULT 0,--奇观建造产能加成修正百分比（埃及20）
	"PlunderModifier"	integer DEFAULT 0,--劫掠城市/摧毁蛮族营地时获得金钱修正百分比
	"ImprovementMaintenanceModifier"	integer DEFAULT 0,--改良设施维护费修正百分比（印加-50表示陆地改良免费）
	"GoldenAgeDurationModifier"	integer DEFAULT 0,--黄金时代持续时间修正百分比（波斯50）
	"GoldenAgeMoveChange"	integer DEFAULT 0,--黄金时代期间单位移动力变化值
	"GoldenAgeCombatModifier"	integer DEFAULT 0,--黄金时代期间单位战斗力修正百分比
	"GoldenAgeTourismModifier"	integer DEFAULT 0,--黄金时代期间旅游业绩修正百分比（巴西）
	"GoldenAgeGreatArtistRateModifier"	integer DEFAULT 0,--黄金时代期间大艺术家点数速率修正百分比
	"GoldenAgeGreatMusicianRateModifier"	integer DEFAULT 0,--黄金时代期间大音乐家点数速率修正百分比
	"GoldenAgeGreatWriterRateModifier"	integer DEFAULT 0,--黄金时代期间大文学家点数速率修正百分比
	"ExtraEmbarkMoves"	integer DEFAULT 0,--额外海运移动力
	"NaturalWonderFirstFinderGold"	integer DEFAULT 0,--首先发现自然奇观获得的金币值（西班牙500）
	"NaturalWonderSubsequentFinderGold"	integer DEFAULT 0,--后续发现自然奇观获得的金币值（西班牙100）
	"NaturalWonderFirstFinderTech"	int DEFAULT 0,--首先发现自然奇观时获得免费科技数量
	"NaturalWonderFirstFinderPolicies"	int DEFAULT 0,--首先发现自然奇观时获得免费政策数量
	"NaturalWonderSubsequentFinderPolicies"	int DEFAULT 0,--后续发现自然奇观时获得免费政策数量
	"NaturalWonderSubsequentFinderTech"	int DEFAULT 0,--后续发现自然奇观时获得免费科技数量
	"NaturalWonderYieldModifier"	integer DEFAULT 0,--自然奇观产出修正百分比（西班牙100）
	"NaturalWonderHappinessModifier"	integer DEFAULT 0,--自然奇观快乐值修正百分比
	"NearbyImprovementCombatBonus"	integer DEFAULT 0,--临近指定改良设施时战斗力加成百分比
	"NearbyImprovementBonusRange"	integer DEFAULT 0,--上述加成的生效范围（格数）
	"CultureBuildingYieldChange"	integer DEFAULT 0,--文化类建筑额外产出文化值
	"CombatBonusVsHigherTech"	integer DEFAULT 0,--对抗科技领先的文明时战斗力加成（仅在己方领土防御时生效）
	"CombatBonusVsLargerCiv"	integer DEFAULT 0,--对抗城市数量多于己方的文明时战斗力加成（埃塞俄比亚，比较城数非人口）
	"RazeSpeedModifier"	integer DEFAULT 0,--夷平城市速度修正百分比（匈人100表示翻倍）
	"DOFGreatPersonModifier"	integer DEFAULT 0,--声明友谊后双方伟人产生速率加成百分比（瑞典10）
	"LuxuryHappinessRetention"	integer DEFAULT 0,--即使奢侈资源全部交易出去，仍可保留的快乐值比例（荷兰50表示保留50%）
	"ExtraSpies"	integer DEFAULT 0,--额外间谍数量（英国1）
	"UnresearchedTechBonusFromKills"	integer DEFAULT 0,--击杀单位时获得未研发科技的进度百分比
	"ExtraFoundedCityTerritoryClaimRange"	integer DEFAULT 0,--建立城市时额外获得的领土格数（肖肖尼8）
	"FreeSocialPoliciesPerEra"	integer DEFAULT 0,--每个新时代开始时赠送的免费政策数量（波兰1，⚠ 无MOD_BUGFIX_MINOR时值>0仅送1个政策）
	"NumTradeRoutesModifier"	integer DEFAULT 0,--可用商路数量修正百分比（威尼斯100表示翻倍）
	"TradeRouteResourceModifier"	integer DEFAULT 0,--资源多样性带来的商路金币修正百分比（葡萄牙100）
	"UniqueLuxuryCities"	integer DEFAULT 0,--可赠送独有奢侈资源的城市数量（印尼3）
	"UniqueLuxuryQuantity"	integer DEFAULT 0,--每座城市赠送的独有奢侈资源数量（印尼2）
	"WorkerSpeedModifier"	integer DEFAULT 0,--工人工作速度修正百分比（剧情英国100）
	"AfraidMinorPerTurnInfluence"	integer DEFAULT 0,--每回合对可索要贡品的城邦额外增加的影响力
	"LandTradeRouteRangeBonus"	integer DEFAULT 0,--陆上商路距离固定增加值（直接加到基础距离上，非百分比，阿拉伯5=距离+5）
	"TradeReligionModifier"	integer DEFAULT 0,--商路宗教压力修正百分比
	"TradeBuildingModifier"	integer DEFAULT 0,--建筑提供的商路金币奖励修正百分比（仅客栈和港口）
	"FightWellDamaged"	boolean DEFAULT 0,--单位即使受伤也不会降低战斗力（日本）
	"MoveFriendlyWoodsAsRoad"	boolean DEFAULT 0,--友方/中立森林和丛林地块视为道路（易洛魁）
	"FasterAlongRiver"	boolean DEFAULT 0,--沿河地块移动仅消耗1行动力
	"FasterInHills"	boolean DEFAULT 0,--单位进入丘陵地块不消耗额外移动力
	"EmbarkedAllWater"	boolean DEFAULT 0,--允许单位在远洋海块上通行
	"EmbarkedToLandFlatCost"	boolean DEFAULT 0,--登陆仅消耗1移动力（不需要额外移动力）
	"NoHillsImprovementMaintenance"	boolean DEFAULT 0,--丘陵上的改良设施免除维护费
	"TechBoostFromCapitalScienceBuildings"	boolean DEFAULT 0,--首都完成科技类建筑/奇观时获得科研奖励（朝鲜）
	"StaysAliveZeroCities"	boolean DEFAULT 0,--即使失去所有城市也不会完全灭亡（还能通过其他途径复活）
	"FaithFromUnimprovedForest"	boolean DEFAULT 0,--未改良的森林地块提供信仰产出（凯尔特）
	"BonusReligiousBelief"	boolean DEFAULT 0,--创立宗教时可以额外选择一个信条（拜占庭）
	"AbleToAnnexCityStates"	boolean DEFAULT 0,--可花费金钱合并或傀儡已同盟5回合以上的城邦（奥地利）
	"CrossesMountainsAfterGreatGeneral"	boolean DEFAULT 0,--获得首个陆军统帅后，单位可以跨越山脉（迦太基）
	"MayaCalendarBonuses"	boolean DEFAULT 0,--长纪历：时代更替时可选择一位伟人（玛雅）
	"NoAnnexing"	boolean DEFAULT 0,--无法吞并城市，只能傀儡
	"TechFromCityConquer"	boolean DEFAULT 0,--占领城市时免费获得该文明已研发的一项科技（亚述）
	"UniqueLuxuryRequiresNewArea"	boolean DEFAULT 0,--赠送奢侈资源是否需要在异大陆（印尼为true）
	"RiverTradeRoad"	boolean DEFAULT 0,--河流及临河复杂地形上的移动力等同于开阔地形
	"AngerFreeIntrusionOfCityStates"	boolean DEFAULT 0,--单位进入城邦领土不会引发城邦不满
	"FreeUnit"	text DEFAULT NULL,--在某科技后赠送的免费单位类Type
	"FreeUnitPrereqTech"	text DEFAULT NULL,--定义上述免费单位所需的科技前置
	"CombatBonusImprovement"	text DEFAULT NULL,--为附近单位提供战斗力加成的改良设施Type（如要塞/大军堡垒）
	"FreeBuilding"	text DEFAULT NULL,--城市自动获得的免费建筑Type（迦太基港口）
	"FreeBuildingOnConquest"	text DEFAULT NULL,--征服城市后获得的免费建筑Type
	"ObsoleteTech"	text DEFAULT NULL,--该特质在研发某项科技后失效
	"PrereqTech"	text DEFAULT NULL,--该特质在研发某项科技后开始生效（玛雅神学）
	"CityAutomatonWorkersChange"	INTEGER DEFAULT 0,--城市自动化工人数量变化（SP新增）
	"CityWorkingChange"	INTEGER DEFAULT 0,--城市可工作地块数量变化（SP新增）
	"AnyBelief"	INTEGER DEFAULT 0,--可额外选择任意信条的数量（SP新增）
	"CrossesIce"	INTEGER DEFAULT 0,--单位可以穿越冰层（SP新增）
	"ExtraSupply"	INTEGER DEFAULT 0,--额外单位补给上限（SP新增）
	"ExtraSupplyPerCity"	INTEGER DEFAULT 0,--每座城市提供的额外补给上限（SP新增）
	"ExtraSupplyPerPopulation"	INTEGER DEFAULT 0,--每人口提供的额外补给上限（SP新增）
	"GGFromBarbarians"	INTEGER DEFAULT 0,--击杀蛮族可获得大将军点数（SP新增，对蛮族也能累积统帅进度）
	"ObsoleteBelief"	TEXT DEFAULT NULL REFERENCES Beliefs(Type),--拥有特定信条后该特质失效（SP新增）
	"PrereqBelief"	TEXT DEFAULT NULL REFERENCES Beliefs(Type),--需要拥有特定信条后该特质才能生效（SP新增）
	"ObsoletePolicy"	TEXT DEFAULT NULL REFERENCES Policies(Type),--拥有特定政策后该特质失效（SP新增）
	"PrereqPolicy"	TEXT DEFAULT NULL REFERENCES Policies(Type),--需要拥有特定政策后该特质才能生效（SP新增）
	"SeaTradeRouteRangeBonus"	INTEGER DEFAULT 0,--海上商路距离加成百分比（SP新增）
	"TradeRouteLandGoldBonus"	int DEFAULT 0,--陆地商路额外金币收益（SP新增）
	"TradeRouteSeaGoldBonus"	int DEFAULT 0,--海上商路额外金币收益（SP新增）
	"GreatWorksTourism"	int DEFAULT 0,--每个杰作额外提供的旅游业绩（SP新增）
	"ShareAllyResearchPercent"	int DEFAULT 0,--共享盟友研发进度的百分比（SP新增）
	"CultureBonusUnitStrengthModify"	int DEFAULT 0,--文化产出转化为单位战斗力的修正系数（SP新增）
	"OthersTradeBonusModifier"	int DEFAULT 0,--他国与本文明商路收益的加成百分比（SP新增）
	"TrainedAll"	boolean DEFAULT 0,--所有城市在建造单位时都视为拥有训练类建筑（SP新增）
	"NoDoDeficit"	boolean DEFAULT 0,--不会出现国防赤字（SP新增）
	"FreeGreatPeoplePerEra"	integer DEFAULT 0,--每个新时代开始时赠送的免费伟人数量（SP新增）
	"OwnedReligionUnitCultureExtraTurns"	int DEFAULT 0,--本宗教单位传播宗教时额外提供的文化回合加成（SP新增）
	"InfluenceFromGreatPeopleBirth"	integer DEFAULT 0,--伟人诞生时获得城邦影响力（SP新增）
	"ExtraUnitPlayerInstances"	integer DEFAULT 0,--额外单位玩家实例数上限（SP新增，允许超出全局限制额外训练单位）
	"ArtistGoldenAgeTechBoost"	boolean DEFAULT 0,--艺术家开启黄金时代时获得科技推进（SP新增）
	"GoodyUnitUpgradeFirst"	boolean DEFAULT 0,--踩蘑菇时单位优先升级（而非其他奖励）（SP新增）
	"UnitMaxHitPointChangePerRazedCityPop"	int DEFAULT 0,--每夷平城市人口提供的单位最大生命值变化（SP新增）
	"UnitMaxHitPointChangePerRazedCityPopLimit"	int DEFAULT 0,--上述加成的上限值（SP新增）
	"AllyCityStateCombatModifier"	int DEFAULT 0,--对同盟城邦的战斗力加成百分比（SP新增）
	"AllyCityStateCombatModifierMax"	int DEFAULT -1,--上述加成的最大值上限（-1表示无上限）（SP新增）
	"AttackBonusAdjacentWhenUnitKilled"	integer DEFAULT 0,--击杀敌方单位后相邻友军获得的攻击加成（SP新增）
	"KilledAttackBonusDecreasePerTurn"	integer DEFAULT 0,--上述攻击加成每回合衰减值（SP新增）
	"AwayFromCapitalCombatModifier"	integer DEFAULT 0,--远离首都时的单位战斗力加成（SP新增）
	"AwayFromCapitalCombatModifierMax"	integer DEFAULT 0,--上述加成的最大值上限（SP新增）
	"PromotionWhenKilledUnit"	text DEFAULT NULL,--击杀敌方单位时获得晋升Type（SP新增）
	"PromotionRadiusWhenKilledUnit"	integer DEFAULT 0,--击杀单位时给予晋升的范围（SP新增）
	"CiviliansFreePromotion"	text DEFAULT NULL,--平民单位获得的免费晋升Type（SP新增）
	"NoResistance"	boolean DEFAULT 0,--占领城市无抵抗期（SP新增）
	"GoldenAgeOnWar"	boolean DEFAULT 0,--宣战时自动进入黄金时代（SP新增）
	"CanConquerUC"	boolean DEFAULT 0,--攻占其他文明原始首都后，可训练/建造该文明的特殊单位、特殊建筑和特殊改良设施（UC=Unique Component）（SP新增）
	"FreePolicyWhenFirstConquerMajorCapital"	int DEFAULT 0,--首次征服主要文明首都时获得免费政策数量（SP新增）
	"InstantTourismBombWhenFirstConquerMajorCapital"	int DEFAULT 0,--首次征服主要文明首都时获得瞬间旅游业绩爆发值（SP新增）
	"ConquestCasualtiesModifier"	int DEFAULT 0,--征服城市时人口伤亡修正百分比（SP新增）
	"AbleToDualEmpire"	boolean DEFAULT 0,--可以建立双重帝国（SP新增）
	"CanDiplomaticMarriage"	boolean DEFAULT 0,--可与城邦外交联姻（奥地利式合并）（SP新增）
	"BuyOwnedTiles"	boolean DEFAULT 0,--可以购买已被其他文明拥有的地块（SP新增）
	"CanFoundMountainCity"	boolean DEFAULT 0,--可在山脉地块上建立城市（SP新增）
	"CanFoundCoastCity"	boolean DEFAULT 0,--可在海岸地块上建立城市（SP新增）
	"CanPurchaseWonderInGoldenAge"	boolean DEFAULT 0,--黄金时代期间可以用金币购买奇观（SP新增）
	"NumFreeWorldWonderPerCity"	integer DEFAULT 0,--每座城市可建造的免费奇观数量（SP新增）
	"TriggersIdeologyTech"	text DEFAULT NULL,--触发意识形态选择的科技Type（SP新增）
	"ExceedingHappinessImmigrationModifier"	integer DEFAULT 0,--溢出快乐带来的移民吸引力修正百分比（SP新增）
	"GoldenAgeResearchTotalCostModifier"	int DEFAULT 0,--黄金时代科研总成本修正百分比（SP新增）
	"GoldenAgeResearchCityCountCostModifier"	int DEFAULT 0,--黄金时代科研城市数量成本修正百分比（SP新增）
	"GoldenAgeGrowThresholdModifier"	int DEFAULT 0,--黄金时代人口增长阈值修正百分比（SP新增）
	"GoldenAgeMinorPerTurnInfluence"	int DEFAULT 0,--黄金时代每回合对城邦影响力（SP新增）
	"AdequateLuxuryCompleteQuestInfluenceModifier"	int DEFAULT 0,--完成城邦任务且拥有充足奢侈资源时影响力修正（SP新增）
	"AdequateLuxuryCompleteQuestInfluenceModifierMax"	int DEFAULT -1,--上述影响力修正的上限（-1无上限）（SP新增）
	"WLKDLengthChangeModifier"	integer DEFAULT 0,--"庆祝国王日"持续时间修正（SP新增）
	"WLKDCityNoResearchCost"	boolean DEFAULT 0,--"庆祝国王日"期间城市无科研成本（SP新增）
	"NaturalWonderYieldModifierPerEra"	int DEFAULT 0,--每个时代自然奇观产出修正增加值（SP新增）
	"GoldenAgeTechChainBoost"	boolean DEFAULT 0,--黄金时代期间完成科技时，溢出科研点数不浪费，自动转移至下一正在研究的科技（SP新增）
	"CorruptionLevelReduceByOne"	boolean NOT NULL DEFAULT 0,--腐败等级降低一级（SP新增）
	"MaxCorruptionLevel"	integer NOT NULL DEFAULT -1,--最大腐败等级限制（-1为无限制）（SP新增）
	"NaturalWonderCorruptionScoreChange"	int NOT NULL DEFAULT 0,--自然奇观影响的腐败分数变化值（SP新增）
	"NaturalWonderCorruptionRadius"	int NOT NULL DEFAULT 0,--自然奇观影响腐败的半径（SP新增）
	"RiverCorruptionScoreChange"	int NOT NULL DEFAULT 0,--河流影响的腐败分数变化值（SP新增）
	"SpreadReligionFromKilledUnitStrengthPercent"	integer NOT NULL DEFAULT 0,--击杀单位时以击杀者战斗力的百分比传播宗教（SP新增）
	"SpreadReligionRadius"	integer NOT NULL DEFAULT 0,--击杀单位传播宗教的范围（SP新增）
	"InflictDamageChangePerCapturedHolyCity"	integer NOT NULL DEFAULT 0,--每占领一座圣城增加造成的伤害（SP新增）
	"DamageChangePerCapturedHolyCity"	integer NOT NULL DEFAULT 0,--每占领一座圣城减少受到的伤害（SP新增）
	"SiegeDamagePercentIfSameReligion"	integer NOT NULL DEFAULT 0,--攻击与己方国教相同的城市时，额外附加目标城市最大生命值N%的伤害（SP新增，值=直接附加的百分比点数）
	"FaithPurchaseCombatUnitCostPercent"	integer NOT NULL DEFAULT 0,--信仰购买战斗单位的成本修正百分比（SP新增）
	FOREIGN KEY("Description") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("ShortDescription") REFERENCES "Language_en_US"("Tag"),
	FOREIGN KEY("FreeUnit") REFERENCES "UnitClasses"("Type"),
	FOREIGN KEY("FreeUnitPrereqTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("CombatBonusImprovement") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("FreeBuilding") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("FreeBuildingOnConquest") REFERENCES "Buildings"("Type"),
	FOREIGN KEY("ObsoleteTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("PrereqTech") REFERENCES "Technologies"("Type"),
	FOREIGN KEY("ObsoleteBelief") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("PrereqBelief") REFERENCES "Beliefs"("Type"),
	FOREIGN KEY("ObsoletePolicy") REFERENCES "Policies"("Type"),
	FOREIGN KEY("PrereqPolicy") REFERENCES "Policies"("Type"),
	FOREIGN KEY("TriggersIdeologyTech") REFERENCES "Technologies"("Type")
);

-- ============================================================
-- 以下是 Traits 相关子表
-- ============================================================

--特质替代或限制特定建筑类的信仰购买成本（绝对值，非减扣；正数<原成本=降价，>原成本=涨价）
CREATE TABLE "Trait_BuildingClassFaithCost" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"BuildingClassType"	text REFERENCES BuildingClasses(Type),--建筑类Type
	"Cost"	int DEFAULT 0--信仰购买成本的替代值
);

--特质为特定建筑类提供产出变化
CREATE TABLE "Trait_BuildingClassYieldChanges" (
	"TraitType"	text,--特质Type
	"BuildingClassType"	text,--建筑类Type
	"YieldType"	integer,--产出类型
	"YieldChange"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("BuildingClassType") REFERENCES "BuildingClasses"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为首都提供产出的固定加成
CREATE TABLE "Trait_CapitalYieldChanges" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为所有城市提供产出的固定加成
CREATE TABLE "Trait_CityYieldChanges" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为拥有未改良地貌的城市提供产出加成
CREATE TABLE "Trait_CityYieldFromUnimprovedFeature" (
	"TraitType"	text,--特质Type
	"FeatureType"	text,--地貌Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质根据城市邻近的地貌提供产出百分比修正（每个相邻地貌累加百分比到产出倍率）
CREATE TABLE "Trait_CityYieldModifierFromAdjacentFeature" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"FeatureType"	text REFERENCES Features(Type),--邻近的地貌Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	int DEFAULT 0--每个相邻地块的百分比修正值
);

--特质根据城市邻近的地貌提供产出（上限可设）
CREATE TABLE "Trait_CityYieldPerAdjacentFeature" ( --特质根据城市邻近地貌提供产出（MaxValue为相邻地貌产出总和的上限，非每地块上限）
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"FeatureType"	text REFERENCES Features(Type),--邻近的地貌Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"MaxValue"	int DEFAULT 0--所有相邻地块产出总和的最大值上限
);

--特质为沿海城市提供产出的固定加成
CREATE TABLE "Trait_CoastalCityYieldChanges" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质设定额外产出阈值（SP新增，达到特定产出值时触发额外奖励）
CREATE TABLE "Trait_ExtraYieldThresholds" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--阈值产出值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对特定地貌的产出加成
CREATE TABLE "Trait_FeatureYieldChanges" (
	"TraitType"	text,--特质Type
	"FeatureType"	text,--地貌Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为特定单位类赠送免费晋升
CREATE TABLE "Trait_FreePromotionUnitClasses" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"UnitClassType"	text REFERENCES UnitClasses(Type),--单位类Type
	"PromotionType"	text REFERENCES UnitPromotions(Type)--赠送的晋升Type
);

--特质为特定单位战斗类型赠送免费晋升
CREATE TABLE "Trait_FreePromotionUnitCombats" (
	"TraitType"	text,--特质Type
	"UnitCombatType"	text,--单位战斗类型
	"PromotionType"	text,--赠送的晋升Type
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--特质为所有单位赠送免费晋升（不限战斗类型）
CREATE TABLE "Trait_FreePromotions" (
	"TraitType"	text,--特质Type
	"PromotionType"	text,--赠送的晋升Type
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("PromotionType") REFERENCES "UnitPromotions"("Type")
);

--特质在最初X座城市中免费提供特定资源
CREATE TABLE "Trait_FreeResourceFirstXCities" (
	"TraitType"	text,--特质Type
	"ResourceType"	text,--免费提供的资源Type
	"ResourceQuantity"	integer,--资源数量
	"NumCities"	integer,--生效城市数量
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

--特质在黄金时代期间对特定伟人点数速率的修正
CREATE TABLE "Trait_GoldenAgeGreatPersonRateModifier" (
	"TraitType"	text,--特质Type
	"GreatPersonType"	text,--伟人类型
	"Modifier"	integer,--伟人点数速率修正百分比
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "GreatPersons"("Type")
);

--特质在黄金时代期间提供产出百分比加成
CREATE TABLE "Trait_GoldenAgeYieldModifiers" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--每个相邻地块的百分比修正值
);

--特质在消耗特定伟人时提供一次性产出
CREATE TABLE "Trait_GreatPersonExpendedYield" (
	"TraitType"	text,--特质Type
	"GreatPersonType"	text,--伟人类型
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("GreatPersonType") REFERENCES "GreatPersons"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为所有杰作提供额外产出（每个杰作独立计算，非全局一次性加成）
CREATE TABLE "Trait_GreatWorkYieldChanges" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer NOT NULL--产出增加值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对特定改良设施的产出加成
CREATE TABLE "Trait_ImprovementYieldChanges" (
	"TraitType"	text,--特质Type
	"ImprovementType"	text,--改良设施Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为特定改良设施提供额外产出（改良设施邻接改良设施时触发，OtherImprovementType为邻接的改良类型）
CREATE TABLE "Trait_AdjacentImprovementYieldChanges" (
	"TraitType"	text,--特质Type
	"ImprovementType"	text,--改良设施Type
	"OtherImprovementType"	text,--邻接的改良设施Type
	"YieldType"	text,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("ImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("OtherImprovementType") REFERENCES "Improvements"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对特定单位战斗类型的维护费修正
CREATE TABLE "Trait_MaintenanceModifierUnitCombats" (
	"TraitType"	text,--特质Type
	"UnitCombatType"	text,--单位战斗类型
	"MaintenanceModifier"	int,--维护费修正百分比
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--特质对特定单位战斗类型的移动力修正
CREATE TABLE "Trait_MovesChangeUnitCombats" (
	"TraitType"	text,--特质Type
	"UnitCombatType"	text,--单位战斗类型
	"MovesChange"	int,--移动力变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("UnitCombatType") REFERENCES "UnitCombatInfos"("Type")
);

--特质禁止训练特定单位类
CREATE TABLE "Trait_NoTrain" (
	"TraitType"	text,--特质Type
	"UnitClassType"	text NOT NULL,--禁止训练的单位类Type
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("UnitClassType") REFERENCES "UnitClasses"("Type")
);

--特质根据主要宗教的每信徒提供产出修正
CREATE TABLE "Trait_PerMajorReligionFollowerYieldModifier" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	int DEFAULT 0--每信徒修正值（内部×100，填2=每信徒2%产出修正）
);

--特质根据主要宗教信徒数的产出修正最大值
CREATE TABLE "Trait_PerMajorReligionFollowerYieldModifierMax" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Max"	int DEFAULT 0--修正最大值上限
);

--特质根据主要宗教每信徒提供产出修正（乘以100后的值）
CREATE TABLE "Trait_PerMajorReligionFollowerYieldModifierTimes100" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	int DEFAULT 0--每信徒修正值（×100精度，表中值不乘100，填200=每信徒2%）
);

--特质对特定地块类型的产出加成
CREATE TABLE "Trait_PlotYieldChanges" (
	"TraitType"	text,--特质Type
	"PlotType"	text,--地块类型
	"YieldType"	text,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("PlotType") REFERENCES "Plots"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对特定资源的数量修正
CREATE TABLE "Trait_ResourceQuantityModifiers" (
	"TraitType"	text,--特质Type
	"ResourceType"	text,--资源Type
	"ResourceQuantityModifier"	integer DEFAULT 0,--资源数量修正百分比（俄罗斯100表示战略资源翻倍）
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type")
);

--特质为特定资源提供额外产出
CREATE TABLE "Trait_ResourceYieldChanges" (
	"TraitType"	text,--特质Type
	"ResourceType"	text,--资源Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("ResourceType") REFERENCES "Resources"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对沿河地块的产出加成
CREATE TABLE "Trait_RiverPlotYieldChanges" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"YieldType"	text NOT NULL REFERENCES Yields(Type),--产出类型
	"Yield"	integer DEFAULT 0--产出值
);

--特质对海上商路产出按时代加成（乘以100）
CREATE TABLE "Trait_SeaTradeRouteYieldPerEraTimes100" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	int DEFAULT 0--每时代产出值（乘以100）
);

--特质对海上商路产出加成（乘以100）
CREATE TABLE "Trait_SeaTradeRouteYieldTimes100" (
	"TraitType"	text REFERENCES Traits(Type),--特质Type
	"YieldType"	text REFERENCES Yields(Type),--产出类型
	"Yield"	int DEFAULT 0--产出值（乘以100）
);

--特质对特定专家类型的产出加成
CREATE TABLE "Trait_SpecialistYieldChanges" (
	"TraitType"	text,--特质Type
	"SpecialistType"	text,--专家类型
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("SpecialistType") REFERENCES "Specialists"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对特定地形的产出加成
CREATE TABLE "Trait_TerrainYieldChanges" (
	"TraitType"	text,--特质Type
	"TerrainType"	text,--地形Type
	"YieldType"	text,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("TerrainType") REFERENCES "Terrains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质在地形上的额外效果（StrategicResourceQuantityModifier：该地形战略资源数量百分比修正，100=翻倍）
CREATE TABLE "Trait_Terrains" (
	"TraitType"	text,--特质Type
	"TerrainType"	text,--地形Type
	"StrategicResourceQuantityModifier"	integer DEFAULT 0,--该地形上战略资源数量修正百分比
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type")
);

--特质对特定域（陆地/海洋）商路的产出加成
CREATE TABLE "Trait_TradeRouteYieldChange" (
	"TraitType"	text,--特质Type
	"DomainType"	text,--域类型
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("DomainType") REFERENCES "Domains"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对未改良地貌的产出加成
CREATE TABLE "Trait_UnimprovedFeatureYieldChanges" (
	"TraitType"	text,--特质Type
	"FeatureType"	text,--地貌Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("FeatureType") REFERENCES "Features"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对商路的产出加成
CREATE TABLE "Trait_YieldChangeTradeRoute" (
	"TraitType"	text,--特质Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对世界奇观的产出加成
CREATE TABLE "Trait_YieldChangeWorldWonder" (
	"TraitType"	text,--特质Type
	"YieldType"	integer,--产出类型
	"Yield"	integer DEFAULT 0,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为所有城市提供固定产出（YIELD_CHANGE，非百分比，每个城市直接+数值）
CREATE TABLE "Trait_YieldChanges" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--每个相邻地块的百分比修正值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对入境商路的产出加成
CREATE TABLE "Trait_YieldChangesIncomingTradeRoute" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对自然奇观的产出加成
CREATE TABLE "Trait_YieldChangesNaturalWonder" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出变化值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质按贸易伙伴数量提供产出加成
CREATE TABLE "Trait_YieldChangesPerTradePartner" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--每个贸易伙伴提供的产出值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质为战略资源提供产出加成
CREATE TABLE "Trait_YieldChangesStrategicResources" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质在击杀蛮族单位时提供一次性产出
CREATE TABLE "Trait_YieldFromBarbarianKills" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出数值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质在击杀任意敌方单位时提供一次性产出
CREATE TABLE "Trait_YieldFromKills" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--产出数值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);

--特质对所有城市产出的全局百分比修正（YIELD_MODIFIER，加算到产出倍率）
CREATE TABLE "Trait_YieldModifiers" (
	"TraitType"	text,--特质Type
	"YieldType"	text,--产出类型
	"Yield"	integer,--每个相邻地块的百分比修正值
	FOREIGN KEY("TraitType") REFERENCES "Traits"("Type"),
	FOREIGN KEY("YieldType") REFERENCES "Yields"("Type")
);
