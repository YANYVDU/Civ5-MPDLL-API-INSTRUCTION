-- 城邦独特能力（City-State Unique Ability, CSUA）系统（Super Power V11 - Pillars of Sovereignty）
-- integer、text、boolean分别需要输入整数、字符和true/false
-- 关联说明：每个城邦在 MinorCivilizations 表通过 UAType 列关联一条 CityStateUAs 记录；
--          每条 CityStateUAs 记录包含盟友效果(AllyEffectType)与朋友效果(FriendEffectType)各一个 EffectType；
--          每个 EffectType 在 CityStateUAEffects 表中对应一行，效果列取值即该效果提供的数值（0表示不生效）。
-- 版本需求：本系统依赖 MOD_SP_UNIQUE_CITYSTATE 与 MOD_SP_CITYSTATE_BASIC 宏（CustomMods.h 中由 gCustomMods 控制）。

-- ============================ CityStateUAEffects（效果定义表）============================
-- 一行为一个盟友效果或朋友效果；各效果列按来源城邦分组注释，0 表示该效果不适用
CREATE TABLE "CityStateUAEffects" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--效果类型，必须唯一，与 CityStateUAs 的 AllyEffectType/FriendEffectType 对应
	"Help"	text,--效果帮助文本Tag（本地化）
	-- 佛罗伦萨：信仰购买伟人成本的增幅降低（仅作用于增量部分而非全价）
	"FaithPurchaseGreatPeopleCostRiseModifier"	integer DEFAULT 0,--信仰购买伟人成本增幅变化百分比（负数为降低）
	"FaithPurchaseGreatPeopleCostRiseModifierPerGW"	integer DEFAULT 0,--每拥有一件杰作再额外降低的增幅百分比
	"FaithPurchaseAllGreatPeople"	boolean DEFAULT 0,--允许用信仰购买所有类型伟人
	-- 布宜诺斯艾利斯：大音乐家演奏后不死亡并保留演唱会魅力
	"GPNoDeathAfterGreatWork"	boolean DEFAULT 0,--大音乐家完成杰作后不消耗
	"GPConcertTourismRetentionPercent"	integer DEFAULT 0,--大音乐家演唱会魅力保留百分比
	-- 布鲁塞尔：大音乐家演唱会特殊修正
	"GreatMusicianConcertTourismModifier"	integer DEFAULT 0,--大音乐家演唱会魅力变化百分比
	"GreatMusicianConcertGoldPercent"	integer DEFAULT 0,--大音乐家演唱会金钱变化百分比
	-- 布拉迪斯拉发：首都与第二首都
	"CapitalAndSecondCapitalCultureModifier"	integer DEFAULT 0,--首都与第二首都文化变化百分比
	-- 基辅：首都每回合积累
	"CapitalCultureModifierPerTurn"	integer DEFAULT 0,--首都每回合文化积累
	"CapitalFaithModifierPerTurn"	integer DEFAULT 0,--首都每回合信仰积累
	"CapitalPerTurnYieldModifierMax"	integer DEFAULT 0,--首都每回合积累产出上限
	-- 布加勒斯特：国际移民
	"ImmigrationRatePerImmigrant"	integer DEFAULT 0,--每名移民的入境率
	"ImmigrationRateMax"	integer DEFAULT 0,--入境率上限
	"EmigrationRatePerImmigrant"	integer DEFAULT 0,--每名移民的出境率
	"EmigrationRateMax"	integer DEFAULT 0,--出境率上限
	-- 吉隆坡：傀儡城市科研门槛
	"PuppetNoTechCostPenalty"	boolean DEFAULT 0,--傀儡城市免除科研成本惩罚
	"PuppetTechCostPartial"	integer DEFAULT 0,--傀儡城市科研成本部分值
	-- 阿拉木图：可劫掠中立商路
	"CanPillageNeutralTradeRoute"	boolean DEFAULT 0,--可以劫掠中立势力的商路
	-- 贝尔格莱德：驻军城市防御
	"GarrisonCityDefenseModifier"	integer DEFAULT 0,--驻军城市防御变化百分比
	"MilitaryUnitProductionXP"	integer DEFAULT 0,--盟友建造（非购买）的军事单位获得经验值
	-- 布达佩斯：免疫渡河惩罚
	"LandUnitsImmuneRiverCrossing"	boolean DEFAULT 0,--陆军单位免疫渡河进攻惩罚
	-- 河内：边境固定伤害+和平条约+被宣战
	"EnemyFixedDamageModifierInBorders"	integer DEFAULT 0,--敌方单位在我方领土内的固定伤害变化百分比
	"CulturePerWarPeace"	integer DEFAULT 0,--战争与和平条约相关的文化获取
	"EnemyCombatModifierInBordersPerBeenDoW"	integer DEFAULT 0,--每次被宣战后敌方在我方领土内战斗力的额外加成
	-- 姆班扎刚果：城市数量相关
	"UnitProductionModifierPerCity"	integer DEFAULT 0,--每座城市提供单位产能百分比
	"ManpowerPerCity"	integer DEFAULT 0,--每座城市提供人力
	"CombatBonusPerTechDifference"	integer DEFAULT 0,--每点科技差提供战斗力加成
	-- 西顿：攻城无视建筑城防+军事城邦每回合经验
	"CityAttackIgnoreBuildingDefensePercent"	integer DEFAULT 0,--进攻城市时无视该城市来自建筑的城防百分比（盟友30/朋友15）
	"MilitaryXPPerTurnModifier"	integer DEFAULT 0,--军事城邦盟友提供的每回合单位经验加成百分比（100=+100%）
	"MilitaryXPSeaAir"	integer DEFAULT 0,--非0时上述每回合经验对海军和空军域同样生效
	-- 索菲亚：丘陵城市
	"HillsCityDamageReduction"	integer DEFAULT 0,--丘陵城市受到的伤害降低百分比
	"HillsMovementModifier"	integer DEFAULT 0,--丘陵移动力消耗变化百分比
	"HillsCityRangeBonus"	integer DEFAULT 0,--丘陵城市射程加成
	-- 索菲亚（间谍/政变UA）
	"CoupChanceModifier"	integer DEFAULT 0,--政变成功率加成百分比（可超过85%上限）
	"CoupFailSpySurvives"	boolean DEFAULT 0,--政变失败后间谍存活（仅盟友）
	"StealTechSpeedPerSpy"	integer DEFAULT 0,--每名存活间谍提供偷科技速度加成百分比（仅盟友）
	"SpyKillChancePerSpy"	integer DEFAULT 0,--每名存活间谍提供抓捕/击杀敌方间谍概率加成百分比（仅盟友）
	-- 梵蒂冈：宗教传播速度
	"ReligionSpreadSpeedModifier"	integer DEFAULT 0,--盟友/朋友为领袖的宗教传播速度变化百分比（盟友50/朋友20）
	-- 梵蒂冈：教廷承认（V11 新增列）
	"PapalRecognitionVotes"	integer DEFAULT 0,--教廷承认：半数以上城市信奉盟友宗教的文明获得此值张主流代表票（盟友同样作为追随者获得此值）
	"PapalRecognitionAllyVotes"	integer DEFAULT 0,--教廷承认：盟友每有一个追随文明（含自身）额外获得此值张代表票（默认1；与主流票独立配置，可改追随得2票等）
	-- 注：梵蒂冈圣城加成不在此表，由子表 CityStateUAEffect_HolyCityYieldModifierPerFollowingCity 定义（见文件末尾）
	-- 耶路撒冷：盟友每掌控一座圣城，其为领袖的宗教+此值%宗教压力；盟友免疫谴责；每座信教城市首都+此值/100%产出
	"ReligiousPressureModifierPerHolyCity"	integer DEFAULT 0,--每掌控一座圣城提供的宗教压力百分比（盟友40/朋友20）
	"DenounceImmunity"	boolean DEFAULT 0,--盟友免疫其他文明的谴责（仅盟友）
	-- 克孜勒：商路容量转商路距离
	"LandTradeRouteDistancePerTradeSlot"	integer DEFAULT 0,--每商路容量提供的陆地商路距离
	-- 迪拜：捐献计数
	"HappinessPerGoldDonated"	integer DEFAULT 0,--每捐献1000金提供快乐
	"GoldDonationInterval"	integer DEFAULT 0,--捐献计数的金币间隔（每多少金币计1次）
	"WonderProductionPerDonationHappiness"	integer DEFAULT 0,--每捐献快乐提供奇观产能
	"IdeologyPressurePerDonationHappiness"	integer DEFAULT 0,--每捐献快乐提供意识形态压力
	-- 热那亚：每条海上商路提供捐献影响力加成百分比
	"GoldDonationInfluenceModifierPerSeaRoute"	integer DEFAULT 0,--每条海上商路提供的金币捐献影响力加成百分比（1=+1%/条）
	-- 马六甲：奢侈品快乐
	"LuxuryHappinessModifier"	integer DEFAULT 0,--奢侈品快乐变化百分比
	"FoodKeptModifierPerLuxury"	integer DEFAULT 0,--每类快乐奢侈品提供食物盈余百分比（100=每1类+100%）
	"TradeRouteGoldModifierPerLuxuryType"	integer DEFAULT 0,--每类奢侈品类型提供商路金钱百分比（100=每1类+100%）
	-- 巴拿马：国际商路距离金钱+跨洲商路人口不满
	"TradeRouteGoldModifierPerDistance"	integer DEFAULT 0,--每格国际商路距离提供金钱百分比（100=每1格+100%）
	"UnhappinessReductionPerCrossContinentRoute"	integer DEFAULT 0,--每条跨洲商路降低人口不满百分比（100=每1条+100%，上限90）
	-- 瓦莱塔：被围城城市不能回血
	"EnemyCityNoHealBesiegeCount"	integer DEFAULT 0,--被我方至少此数量战斗单位围困的敌方城市无法回血
	-- 布拉格：击杀间谍获得间谍进度
	"SpyKillGainSpyProgress"	integer DEFAULT 0,--击杀敌方间谍获得新间谍进度（100=杀1得1，20=杀5得1）
	-- 塔那那利佛：沿海城市食物增长门槛+每城外交威望
	"CoastalCityGrowthThresholdModifier"	integer DEFAULT 0,--沿海城市食物增长门槛变化百分比（-20=-20%）
	"DiplomaticPrestigePerCity"	integer DEFAULT 0,--每座城市提供外交威望（100=0.1威望/城）
	-- 维尔纽斯：每人口降低黄金时代阈值
	"GoldenAgeThresholdPerPopulation"	integer DEFAULT 0,--每人口提供黄金时代阈值变化（负数为降低，-100=-1/每人口，先于百分比修正应用）
	-- 温哥华：每座沿海城市提供全局快乐（100=+1快乐/沿海城市；盟友300/朋友100）
	"CoastalCityHappiness"	integer DEFAULT 0,--每座沿海城市提供全局快乐（100=+1快乐/城，如盟友300=+3/城、朋友100=+1/城）
	-- 埃里温：每处被市民工作的宗教圣地改良（IMPROVEMENT_HOLY_SITE）提供全局快乐（100=+1快乐/处；盟友300=+3/处）
	-- 注：这是全局快乐，无本地人口上限，计入"来自城邦"项；"每点识字率→全国产能%"由子表 CityStateUAEffect_LiteracyYieldModifiers 定义（见文件末尾）
	-- 注：温哥华"每点快乐提升全国食物/魅力产出%"由子表 CityStateUAEffect_HappinessYieldModifiers 定义（见文件末尾）
	-- 注：以下数组/向量类效果由独立子表（CityStateUAEffect_*）定义，通过 EffectType 关联，见文件末尾
);

-- ============================ CityStateUAs（城邦UA类型表）============================
-- 一行为一个城邦的UA组合：盟友效果+朋友效果各一个 EffectType
CREATE TABLE "CityStateUAs" (
	"ID"	integer PRIMARY KEY AUTOINCREMENT,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--UA类型，与 MinorCivilizations.UAType 对应，如 CSUA_VATICAN
	"Description"	text,--盟友效果帮助文本Tag（本地化，如 TXT_KEY_CSUA_VATICAN_HELP）
	"Help"	text,--（预留）朋友效果帮助文本Tag
	"AllyEffectType"	text,--盟友效果Type，引用 CityStateUAEffects.Type
	"FriendEffectType"	text,--朋友效果Type，引用 CityStateUAEffects.Type
	-- 城邦→UA 的挂接方式：UPDATE MinorCivilizations SET UAType = 'CSUA_VATICAN' WHERE Type = 'MINOR_CIV_VATICAN_CITY';
);

-- ============================ CityStateUAEffect_* 子表（数组/向量效果）============================
-- 以下子表均以 EffectType 引用 CityStateUAEffects.Type，一个效果可包含多行
-- 各子表功能速览：
-- CityStateUAEffect_GreatPersonPoints            每回合伟人点数（按专家类型）
-- CityStateUAEffect_BornGreatPersonSpecialistYield   诞生伟人时额外专家产出
-- CityStateUAEffect_BuildingGreatPersonPoints    建筑提供伟人点数
-- CityStateUAEffect_BornGreatPersonAllyInfluenceMod  诞生伟人降低盟友影响力下限
-- CityStateUAEffect_BuildingClassYieldModifiers  建筑类别提供产出百分比加成（配合假建筑可实现"每座某规模/某腐败等级城市+X%产出"）
-- CityStateUAEffect_SpecialistPointRate          专家伟人点积累速率百分比
-- CityStateUAEffect_GreatWorkGreatPersonPoints   每件杰作提供伟人点数
-- CityStateUAEffect_GreatPersonOneShotModifier   指定伟人一次性产出修正百分比
-- CityStateUAEffect_InternalTRToUCSPerEraYield   通往该城邦的国际商路每时代固定产出
-- CityStateUAEffect_YieldToYieldViaTRToUCS       有商路通往该城邦的城市：某产出百分比转为额外另一产出（不消耗原产出）
-- CityStateUAEffect_PurchasedBuildingXP          购买指定建筑后领域单位获得经验
-- CityStateUAEffect_UnitBornYield                诞生指定单位时获得 影响力x百分比 的产出
-- CityStateUAEffect_SpyGarrisonYieldModifiers    己方间谍驻守城市提供产出百分比
-- CityStateUAEffect_ResourceYieldModifiers       拥有已改良指定资源的城市提供产出百分比
-- CityStateUAEffect_ImprovementYieldModifiers    每处有市民工作的改良设施提供产出百分比
-- CityStateUAEffect_ImprovementHappiness         每处有市民工作的改良设施提供本地快乐
-- CityStateUAEffect_FriendCityStateYieldModifiers   每拥有一个朋友城邦提供产出百分比
-- CityStateUAEffect_AllyCityStateYieldModifiers  每拥有一个盟友城邦提供产出百分比
-- CityStateUAEffect_PolicyYieldModifiers         每解锁一个社会政策提供产出百分比
-- CityStateUAEffect_CapitalYieldModifierPerFollowingCity  每座信教城市首都提供产出百分比（100=+1%）
-- CityStateUAEffect_HolyCityYieldModifierPerFollowingCity 每座信教城市使该宗教圣城提供产出百分比（100=+1%，如 YIELD_TOURISM/100=每城+1%魅力）
-- CityStateUAEffect_HappinessYieldModifiers  每点玩家净快乐提供产出百分比（YieldMod基点=每点+1%，Cap=此值%上限；如 FOOD/TOURISM 各 100/50 = 每点快乐食物/魅力+1%、单独上限50%）
-- CityStateUAEffect_LiteracyYieldModifiers   每点识字率（已拥有科技/总科技 x100）提供全国产出百分比（YieldMod基点=每点+1%，盟友 PRODUCTION/100、朋友 PRODUCTION/50）
-- CityStateUAEffect_BornGreatPersonYieldModifiers 每诞生某单位类伟人提供全国产出百分比（YieldMod基点=每诞生+1%，盟友 UNITCLASS_PROPHET/FAITH/500=每大先知+5%信仰）
-- CityStateUAEffect_AdjacentImprovementYieldChanges 本地块是改良（ImprovementType 指定受加成改良，留空=任意改良）、邻格改良为 AdjacentImprovementType（且被市民工作）时，本地块+该产出（flat值，如 [空]/圣邻 CULTURE/1=每工作圣地邻近改良+1文化）

-- ============================ 温哥华 CSUA 实现示例（V11）============================
-- 温哥华设计：盟友每座沿海城市+3全局快乐；盟友每点快乐使全国食物+1%、魅力+1%（各自上限50%）
-- 朋友每座沿海城市+1全局快乐（朋友无产出加成）
-- CSUA.xml 效果定义：
--   <Row><Type>EFFECT_CSUA_VANCOUVER_ALLY</Type><CoastalCityHappiness>300</CoastalCityHappiness></Row>
--   <Row><Type>EFFECT_CSUA_VANCOUVER_FRIEND</Type><CoastalCityHappiness>100</CoastalCityHappiness></Row>
--   <CityStateUAEffect_HappinessYieldModifiers>
--        <Row><EffectType>EFFECT_CSUA_VANCOUVER_ALLY</EffectType><YieldType>YIELD_FOOD</YieldType><YieldMod>100</YieldMod><Cap>50</Cap></Row>
--        <Row><EffectType>EFFECT_CSUA_VANCOUVER_ALLY</EffectType><YieldType>YIELD_TOURISM</YieldType><YieldMod>100</YieldMod><Cap>50</Cap></Row>
--   </CityStateUAEffect_HappinessYieldModifiers>
-- CSUA.sql 挂接：
--   UPDATE MinorCivilizations SET UAType = 'CSUA_VANCOUVER' WHERE Type = 'MINOR_CIV_VANCOUVER';
-- 底层逻辑：
--   * CoastalCityHappiness（基点）在 CvPlayer::GetHappinessFromMinorCivs 中累加：iHappiness += GetNumCoastalCities() x 值/100（计入"来自城邦"快乐）
--   * CityStateUAEffect_HappinessYieldModifiers 在 CvPlayer::GetCSUAYieldPercentModifier 中计算：
--       base = max(GetHappiness(), 0)（含本UA给的沿海城市快乐，协同放大，被 Cap 封顶）
--       每产出% = min(base x YieldMod/100, Cap)，再经逐城产出模板（CvCity::getBaseYieldRateModifier）应用
--   * 快乐在净快乐 GetHappiness() 中含沿海城市快乐 => 两块效果自然协同（沿海越多→快乐越多→食物/魅力%越高，上限50%封死）

-- ============================ 梵蒂冈 CSUA 实现示例（V11）============================
-- CSUA.xml 效果定义：
--   <Row><Type>EFFECT_CSUA_VATICAN_ALLY</Type>
--        <ReligionSpreadSpeedModifier>50</ReligionSpreadSpeedModifier>
--        <PapalRecognitionVotes>1</PapalRecognitionVotes>
--        <PapalRecognitionAllyVotes>1</PapalRecognitionAllyVotes></Row>
--   <Row><Type>EFFECT_CSUA_VATICAN_FRIEND</Type>
--        <ReligionSpreadSpeedModifier>20</ReligionSpreadSpeedModifier></Row>
--   <CityStateUAEffect_HolyCityYieldModifierPerFollowingCity>
--        <Row><EffectType>EFFECT_CSUA_VATICAN_ALLY</EffectType><YieldType>YIELD_TOURISM</YieldType><Modifier>100</Modifier></Row>
--   </CityStateUAEffect_HolyCityYieldModifierPerFollowingCity>
-- CSUA.sql 挂接：
--   UPDATE MinorCivilizations SET UAType = 'CSUA_VATICAN' WHERE Type = 'MINOR_CIV_VATICAN_CITY';
-- 底层逻辑：
--   * ReligionSpreadSpeedModifier 在 CvGameReligions::GetAdjacentCityReligiousPressure 中按宗教创始人累计值放大压力（传播速度）
--   * PapalRecognitionVotes / PapalRecognitionAllyVotes 在 CvLeague::GetPapalRecognitionVotes 计算：
--       追随文明各得 PapalRecognitionVotes 票（主流，需半数以上城市信奉）；盟友得 自身主流票（同样需半数以上，否则为0）
--       + PapalRecognitionAllyVotes x 追随文明数（含自身）
--       例：A/B/C/D 都主要信奉 A 的宗教且 A 为盟友（两列均1），A 得 1+4=5 票，B/C/D 各1票
--   * CityStateUAEffect_HolyCityYieldModifierPerFollowingCity 在 CvCity::getBaseYieldRateModifier 中仅对圣城按信教城市数放大对应产出，
--       与首都加成（CapitalYieldModifierPerFollowingCity）并列独立显示于城市产出页面（TXT_KEY_PRODMOD_CITYSTATE_UA）
--   * 上述玩家查询入口：CvPlayer::GetCSUAReligionSpreadSpeedModifier() / GetCSUAPapalRecognitionVotes() / GetCSUAPapalRecognitionAllyVotes() / GetCSUAHolyCityYieldModifierPerFollowingCity()
--   * 追随文明数缓存：CvPlayer::GetCSUAPapalRecognitionFollowerCount()（含自身）在 doTurn() 中每回合刷新（RefreshPapalRecognitionFollowerCount，参考耶路撒冷圣城数缓存 m_iCachedHolyCityCount），
--       惰性兜底：首次访问为 -1 时即时重算；GetPapalRecognitionVotes 直接读该缓存，避免对每个会员重复全图遍历

-- ============================ 伊费 CSUA 实现示例（V11）============================
-- 三张新接口表：
--   (1) CityStateUAEffect_FaithGPClassCostModifier  REFF：按 UnitClassType 限定"信仰购伟人最终价折扣"
--       EffectType, UnitClassType, CostRiseModifier（最终价格百分比修正，负值=折扣，上限 -90%）
--   (2) CityStateUAEffect_GreatWorkYieldModifiers   按 GreatWorkClassType 分辨，"每件该类杰作/文物全国X%产出"
--       EffectType, GreatWorkClassType, YieldType, YieldMod（基点，100=+1%/件）
--   (3) CityStateUAEffect_GoldenAgeYieldModifiers   黄金时代进行中，"全国X%产出"
--       EffectType, YieldType, YieldMod（基点，100=+1%，2500=+25%）
-- CSUA.xml 效果定义：
--   <Row><Type>EFFECT_CSUA_IFE_ALLY</Type><Help>...</Help></Row>
--   <Row><Type>EFFECT_CSUA_IFE_FRIEND</Type><Help>...</Help></Row>
--   <CityStateUAEffect_FaithGPClassCostModifier>   <!-- 盟友 -30 / 朋友 -10，仅 ARTIST/WRITER/MUSICIAN -->
--        <Row><EffectType>EFFECT_CSUA_IFE_ALLY</EffectType><UnitClassType>UNITCLASS_ARTIST</UnitClassType><CostRiseModifier>-30</CostRiseModifier></Row>
--        <Row><EffectType>EFFECT_CSUA_IFE_FRIEND</EffectType><UnitClassType>UNITCLASS_MUSICIAN</UnitClassType><CostRiseModifier>-10</CostRiseModifier></Row>
--   </CityStateUAEffect_FaithGPClassCostModifier>
--   <CityStateUAEffect_GreatWorkYieldModifiers>     <!-- 盟友：杰作+文物各 +200基点(=+2%/件) 全国信仰 -->
--        <Row><EffectType>EFFECT_CSUA_IFE_ALLY</EffectType><GreatWorkClassType>GREAT_WORK_ART</GreatWorkClassType><YieldType>YIELD_FAITH</YieldType><YieldMod>200</YieldMod></Row>
--   </CityStateUAEffect_GreatWorkYieldModifiers>
--   <CityStateUAEffect_GoldenAgeYieldModifiers>     <!-- 盟友：黄金时代内全国 +25% 信仰（直接填百分比，非基点） -->
--        <Row><EffectType>EFFECT_CSUA_IFE_ALLY</EffectType><YieldType>YIELD_FAITH</YieldType><YieldMod>25</YieldMod></Row>
--   </CityStateUAEffect_GoldenAgeYieldModifiers>
-- CSUA.sql 挂接：
--   UPDATE MinorCivilizations SET UAType = 'CSUA_IFE' WHERE Type = 'MINOR_CIV_IFE';  -- MINOR_CIV_IFE 已在游戏本体定义
-- 底层逻辑：
--   * FaithGPClassCostModifier 在 CvCity::GetFaithPurchaseCost 中，对"当前购买单位的 UnitClass"查该折扣：
--       - 大伟人分支（SPECIALUNIT_PEOPLE，如艺术家/文学家/音乐家）：复用函数内已取的 eUnitClass，
--         放在佛罗伦萨"成本上升增量修正"块**之后、最后执行**
--       - 普通单位分支（// ALL OTHERS，如传教士/审判官/战斗单位）：用 pkUnitInfo->GetUnitClassType() 查
--         该分支所有其它修正（基础价/时代乘子/政策/降速等）结算后作为最终价格修正
--       两者都直接作用于最终价：iCost = iCost * (100 + iIfeClassMod) / 100（-30 => 七折）。
--       因为是最终价修正且最后执行，时代涨幅/政策/佛罗伦萨修正越多，伊费这七折抵扣的绝对值越大；
--       且绑定任意 UnitClass（伟人或普通单位）都能生效，便于后续调整 UA 时复用此表
--   * GreatWorkYieldModifiers 在 CvPlayer::GetCSUAYieldPercentModifier 中：遍历 entry、匹配 eYield 后，
--       用 CvPlayerCityStateUA::GetCachedGreatWorkCount((GreatWorkClass)) 读到的"每回合缓存杰作数" x 基点累加，
--       最终 /100 归一为产出百分比。缓存由 CvPlayerCityStateUA::CacheGreatWorkCounts() 每 doTurn（RefreshCSAllUAEffects
--       内、entries 重建后）对玩家所有城市按该类 GetNumGreatWorks 计件一次填平 m_aiCachedGreatWorkCount；
--       热路径不再逐城市实时累加，只读缓存 int。
--   * GoldenAgeYieldModifiers 在 CvPlayer::GetCSUAYieldPercentModifier 中：if (getGoldenAgeTurns() > 0) 叠加该产出%。
--       填值按普通百分比（25 = +25%），累加进 iMod 前 ×100 转为基点（因该方法末尾 /100 归一）。
--   * 三者均经 RefreshCSAllUAEffects 每回合从零重算，无需序列化、无需 bump MOD_DLL_VERSION_NUMBER（旧档自动兼容）

-- ============================ 埃里温 CSUA 实现示例（V11）============================
-- 埃里温（文化型，MINOR_CIV_YEREVAN）设计：
--   盟友：每点识字率→全国产能+1%；每处被市民工作的宗教圣地→全局快乐+3 且邻近改良+1文化；每诞生大先知→全国信仰+5%
--   朋友：每2点识字率→全国产能+1%（即每点+0.5%）
-- 识字率 = 已拥有科技数 ÷ 科技总数 x 100（百分点整数），原版科技计数，无需新玩法体系。
-- 三张新接口表：
--   (1) CityStateUAEffect_LiteracyYieldModifiers   每点识字率→全国X%产出（可按 YieldType 换任意产出）
--   (2) CityStateUAEffect_BornGreatPersonYieldModifiers 每诞生某 UnitClassType 伟人→全国X%产出（可按 UnitClassType/YieldType/YieldMod 自由配置）
--   (3) CityStateUAEffect_AdjacentImprovementYieldChanges 本地块是改良（ImprovementType 必须为具体改良类型，严格匹配，无通配）、
--        邻格改良为 AdjacentImprovementType → 本地块+Yield of YieldType。
--        参考 SP_AdjacentImprovementYieldChangesForNewImproments：用 INSERT...SELECT FROM Improvements 全量枚举每个改良
--        生成一行，并建 AFTER INSERT ON Improvements 触发器覆盖未来新增改良（对齐 NewSpecialistRule.sql 手法）
-- 主表新列：
--   HolySiteHappiness（基点）：每处被工作的宗教圣地→全局快乐（无人口上限，计入"来自城邦"项）
-- CSUA.xml 效果定义：
--   <Row><Type>EFFECT_CSUA_YEREVAN_ALLY</Type><HolySiteHappiness>300</HolySiteHappiness></Row>
--   <Row><Type>EFFECT_CSUA_YEREVAN_FRIEND</Type></Row>   <!-- 朋友无快乐/信仰 -->
--   <CityStateUAEffect_LiteracyYieldModifiers>
--        <Row><EffectType>EFFECT_CSUA_YEREVAN_ALLY</EffectType><YieldType>YIELD_PRODUCTION</YieldType><YieldMod>100</YieldMod></Row>
--        <Row><EffectType>EFFECT_CSUA_YEREVAN_FRIEND</EffectType><YieldType>YIELD_PRODUCTION</YieldType><YieldMod>50</YieldMod></Row>
--   </CityStateUAEffect_LiteracyYieldModifiers>
--   <CityStateUAEffect_BornGreatPersonYieldModifiers>
--        <Row><EffectType>EFFECT_CSUA_YEREVAN_ALLY</EffectType><UnitClassType>UNITCLASS_PROPHET</UnitClassType><YieldType>YIELD_FAITH</YieldType><YieldMod>500</YieldMod></Row>
--   </CityStateUAEffect_BornGreatPersonYieldModifiers>
--   （不在 XML 手写该段，改由 CSUA.sql 的 INSERT...SELECT FROM Improvements + AFTER INSERT 触发器全量枚举，见上方挂接示例）
-- CSUA.sql 挂接（含枚举+触发器，替代在 CSUA.xml 手写单行）：
--   UPDATE MinorCivilizations SET UAType = 'CSUA_YEREVAN' WHERE Type = 'MINOR_CIV_YEREVAN';
--   INSERT INTO CityStateUAEffect_AdjacentImprovementYieldChanges(EffectType,ImprovementType,AdjacentImprovementType,YieldType,Yield)
--   SELECT 'EFFECT_CSUA_YEREVAN_ALLY', Type, 'IMPROVEMENT_HOLY_SITE', 'YIELD_CULTURE', 1 FROM Improvements;
--   CREATE TRIGGER IF NOT EXISTS SP_CSUA_YerevanAdjacentForNewImprovements AFTER INSERT ON Improvements ... (自动为 New.Type 补行)
-- 底层逻辑：
--   * HolySiteHappiness 在 CvPlayer::GetHappinessFromMinorCivs 中累加（计入"来自城邦"全局快乐）：
--       iHappiness += GetCachedWorkedHolySites() x 值/100。GetCachedWorkedHolySites 为每回合缓存的玩家所有城市
--       GetNumImprovementWorked(IMPROVEMENT_HOLY_SITE) 总数（RefreshCSAllUAEffects 内 CacheWorkedHolySites 每 doTurn 刷新一次）。
--       注意这是全局快乐，不受本地人口上限约束——与桑给巴尔的 CityStateUAEffect_ImprovementHappiness（本地快乐）不同。
--   * LiteracyYieldModifiers 在 CvPlayer::GetCSUAYieldPercentModifier 中：遍历 entry、匹配 eYield 后，
--       iMod += GetCachedLiteracyPercent() x YieldMod。GetCachedLiteracyPercent 由 ComputeLiteracyPercent 每 doTurn 遍历 HasTech 算一次。
--   * BornGreatPersonYieldModifiers 在 CvPlayer::GetCSUAYieldPercentModifier 中：匹配 eYield 后，
--       iMod += GetBornGreatPersonCount(GetGreatPersonFromUnitClass(UnitClass)) x YieldMod（大先知诞生是累计计数，O(1)读取）。
--   * AdjacentImprovementYieldChanges 在 CvPlot::calculateImprovementYieldChange 的邻格循环中：对每个属于该玩家的邻格改良，
--       iYield += GetCSUAAdjacentImprovementYieldChange(本地改良, 邻格改良, eYield)（flat值）。本地改良 ImprovementType 严格匹配
--       （无通配禁用），由 SP SQL 全量枚举每个改良+触发器补行；不要求邻格“被工作”，与 Policy/Trait/Building 相邻改良系列一致；
--       本地块本身需被工作才会显示产出，故加成都落在被工作格上。
--   * 识字率 = 已拥有科技数/总科技数，随研究推进动态变化（每回合缓存，非离线累积）。
--   * 三者在 GetCSUAYieldPercentModifier 末尾 /100 归一；均经 RefreshCSAllUAEffects 每回合从零重算，
--     新增成员均为 DB 派生 + 每回合内存缓存，无需序列化、无需 bump MOD_DLL_VERSION_NUMBER（旧档自动兼容）
