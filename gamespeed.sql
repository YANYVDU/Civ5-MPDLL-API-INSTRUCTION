--integer、text、boolean分别需要输入整数、字符和true/false
--所有百分比类参数以100为基准（100=标准速度的100%），值越大需求越高/越慢
--游戏速度参数作用于全局，影响几乎所有的产出/消耗/时间进度

-- ============================================================
-- GameSpeeds 主表：定义游戏速度的核心参数
-- ============================================================
CREATE TABLE "GameSpeeds" (
	"ID"	integer,--自动生成，不管
	"Type"	text NOT NULL UNIQUE,--必须唯一，标识符如 GAMESPEED_MARATHON
	"Description"	text,--速度名称（引用Language_en_US）
	"Help"	text,--速度描述/帮助文本
	-- === 单位相关 ===
	"TrainPercent"	integer DEFAULT 100,--训练单位所需产能百分比。每100%=基准产能
	"UnitDiscoverPercent"	integer DEFAULT 100,--？？？
	"UnitHurryPercent"	integer DEFAULT 100,--购买单位所需金钱百分比。200表示金钱购买单位费用翻倍
	"UnitTradePercent"	integer DEFAULT 100,--商路金币产出百分比。值越大商路金币越多
	-- === 建筑/计划相关 ===
	"ConstructPercent"	integer DEFAULT 100,--建造建筑所需产能百分比
	"CreatePercent"	integer DEFAULT 100,--计划（如曼哈顿计划）所需产能百分比
	"BuildPercent"	integer DEFAULT 100,--工人修建设施所需回合百分比。200表示修设施慢一倍
	"ImprovementPercent"	integer DEFAULT 100,--改良设施建造速度百分比
	"FeatureProductionPercent"	integer DEFAULT 100,--砍伐森林/清除地貌获得的产能百分比。>100获得更多锤子
	-- === 城市发展 ===
	"GrowthPercent"	integer DEFAULT 100,--城市人口增长所需食物百分比。值越大增长越慢
	"CulturePercent"	integer DEFAULT 100,--城市扩地/政策所需文化百分比。影响扩地阈值和政策解锁速度
	"FaithPercent"	integer DEFAULT 100,--信仰产出百分比。影响万神殿/大先知产生阈值
	"GoldPercent"	integer DEFAULT 100,--金钱产出百分比。影响城市金币收入及购买地块费用
	"GreatPeoplePercent"	integer DEFAULT 100,--伟人点数阈值百分比。值越大伟人产生越慢
	"GoldenAgePercent"	integer DEFAULT 100,--黄金时代基础持续回合百分比。值越大黄金时代越长
	-- === 科技 ===
	"ResearchPercent"	integer DEFAULT 100,--研究科技所需科研点百分比。300=科研慢三倍
	-- === 交易/外交 ===
	"GoldGiftMod"	integer DEFAULT 100,--赠送城邦金钱的影响力回报百分比。值越大同样金额获得的影响力越少
	"DealDuration"	integer DEFAULT 30,--交易持续回合数（基础值，实际受游戏速度缩放）
	"PeaceDealDuration"	integer DEFAULT 10,--和平协议持续回合数
	"RelationshipDuration"	integer DEFAULT 50,--外交关系修正（如"我们曾交战"）持续回合百分比
	"OpinionDurationPercent"	integer DEFAULT 100,--AI态度记忆持续时间百分比。值越小态度变化越快
	"MinorCivElectionFreqMod"	integer DEFAULT 100,--城邦选举/任务刷新频率百分比。值越大刷新越慢
	-- === 蛮族/间谍 ===
	"BarbPercent"	integer DEFAULT 100,--蛮族营地刷新频率百分比。值越大刷新越慢
	"SpyRatePercent"	integer DEFAULT 100,--间谍活动速度百分比。值越大间谍行动越慢
	-- === 经济 ===
	"HurryPercent"	integer DEFAULT 100,--加速购买（金币购买）的费用百分比
	"InflationPercent"	integer DEFAULT 10,--每回合通胀率。影响后期单位/建筑购买费用上涨速度
	"InflationOffset"	integer DEFAULT 0,--通胀起始偏移回合。负数=通胀开始得晚
	-- === 宗教 ===
	"ReligiousPressureAdjacentCity"	integer DEFAULT 100,--邻近城市宗教压力传播值百分比。值越大压力越强
	-- === 世界议会 ===
	"LeaguePercent"	integer DEFAULT 100,--世界议会相关时间进度百分比
	-- === 胜利 ===
	"VictoryDelayPercent"	integer DEFAULT 100,--胜利条件延迟百分比（如文化胜利需要的影响力）。值越大越难胜利
	-- === 商路 ===
	"TradeRouteSpeedMod"	integer DEFAULT 100,--商路移动速度百分比。影响商路单位在地图上的移动快慢
	-- === UI ===
	"PortraitIndex"	integer DEFAULT 0,--图标在纹理图集中的横向偏移
	"IconAtlas"	text DEFAULT 'GAMESPEED_ATLAS',--图标纹理图集名称
	PRIMARY KEY("ID" AUTOINCREMENT)
);

-- ============================================================
-- GameSpeed_Turns 子表：定义各游戏速度下的年代与月份推进
-- 每个GameSpeed有10行，分别对应不同历史时段的月份增量
-- ============================================================
CREATE TABLE "GameSpeed_Turns" (
	"GameSpeedType"	text NOT NULL,--关联的游戏速度Type
	"MonthIncrement"	integer NOT NULL,--每回合推进的月份数（用于年代显示和年代切换）
	"TurnsPerIncrement"	integer NOT NULL,--该月份增量持续的回合数
	FOREIGN KEY("GameSpeedType") REFERENCES "GameSpeeds"("Type")
);

-- ============================================================
-- 参数详解
-- ============================================================
--【TrainPercent】训练单位产能需求
--  对应源码：CvCity::doTrain() → iCost *= getTrainPercent() / 100
--  如设为250，则单位所需产能 = 基础值 × 2.5

--【ConstructPercent】建造建筑产能需求
--  对应源码：CvCity::doCreate() → iCost *= getConstructPercent() / 100
--  如设为200，则建筑所需产能 = 基础值 × 2.0

--【CreatePercent】计划（如曼哈顿计划）产能需求
--  类似ConstructPercent，但针对Project类型

--【BuildPercent】工人修建设施所需回合
--  对应源码：CvUnit::getBuildTime() 相关逻辑
--  如设为200，修设施慢一倍（需要2倍回合）

--【ImprovementPercent】改良设施建造速度
--  影响工人建造改良设施的速度

--【FeatureProductionPercent】砍树/清地貌产能
--  对应源码：CvCity::doFeatureProduction() → iProduction *= getFeatureProductionPercent() / 100
--  值越大砍树获得越多锤子，标准100%=100%，史诗150%=150%

--【GrowthPercent】人口增长食物需求
--  对应源码：CvCity::doGrowth() → iCost *= getGrowthPercent() / 100
--  如设为300，则每口人需要的食物 = 标准 × 3.0

--【CulturePercent】文化阈值
--  对应源码：CvCity::GetJONSCultureThreshold() 和扩地计算
--  同时影响政策解锁所需的政策值阈值和城市扩地所需文化值
--  如设为300，政策文化成本 = 标准 × 3.0

--【FaithPercent】信仰阈值
--  对应源码：CvCity::doFaith()
--  影响万神殿/大先知等所需信仰的积累难度

--【GoldPercent】金币
--  对应源码：CvCity::doGold() → iCost *= getGoldPercent() / 100
--  影响城市金币收入相关的各种花费缩放

--【GreatPeoplePercent】伟人阈值
--  对应源码：CvCityCitizens::DoGreatPeople()
--  影响伟人产生所需伟人点数的阈值

--【GoldenAgePercent】黄金时代持续回合
--  基础黄金时代长度（回合数）会乘以这个百分比

--【ResearchPercent】科研需求
--  对应源码：CvTeam::GetResearchCost() → iCost *= getResearchPercent() / 100
--  如设为300，科技成本 = 标准 × 3.0

--【InflationPercent】通胀率
--  每回合单位/建筑金钱购买费用的上涨幅度
--  标准速度通常为10（即每回合+0.1%）
--  较快速度通胀率更高以匹配更多回合

--【InflationOffset】通胀偏移
--  通胀开始计算的回合偏移，负值延迟通胀开始时间

--【GoldGiftMod】城邦送礼影响力
--  对应源码：CvPlayer::DoGoldGiftToMinor()
--  送给城邦金钱获得影响力的效率，值越大同等金钱获得的影响力越少

--【DealDuration】交易持续回合
--  对应源码：CvDealAI 交易评估
--  常规交易（如奢侈换回合金）的基础持续回合数

--【PeaceDealDuration】和平协议持续回合
--  对应源码：CvDealAI::GetPeaceDuration()
--  签订和平条约后双方不能再次宣战的回合数

--【BarbPercent】蛮族刷新
--  对应源码：CvBarbarians::GetNumTurnsToSpawn()
--  控制蛮族营地生成周期和蛮族单位刷新频率

--【SpyRatePercent】间谍速度
--  间谍执行任务所需回合 = 基础值 × SpyRatePercent / 100

--【ReligiousPressureAdjacentCity】邻城宗教压力
--  相邻城市之间每回合传播的宗教压力值（-1表示使用原版全局值）

--【LeaguePercent】世界议会进度
--  世界议会召开频率、提案投票等时间相关

--【VictoryDelayPercent】胜利延迟
--  影响文化胜利所需影响力门槛等胜利条件

--【TradeRouteSpeedMod】商路移动速度
--  商路单位在地图上的视觉移动速度，不影响收益

-- ============================================================
-- more gamespeeds.xml 中的 6 个自定义速度一览
-- ============================================================
-- 速度名称      建造   科研   核心特点
-- D_1 慢一点    150%   300%  对标接近标准~史诗之间，建造稍慢科研较慢
-- D_2 再慢一点  175%   350%  建造=原版史诗(150%)的1.17倍
-- D_3 可以再慢  200%   500%  建造=马拉松级别，科研马拉松+
-- D_4 还可以再慢 250%   800%  建造和科研均大幅拉长
-- D_5 还想再慢  300%  1000%  超长局，科研极慢
-- D_6 没法再慢  300%  1500%  极限慢速，科研拉满
--
-- 注意：所有6个速度的 GameSpeed_Turns（年代月份推进）完全相同，
--       意味着游戏总回合数一致，差异仅在各百分比参数上。
--       各速度的 DealDuration=30, HurryPercent=100, PortraitIndex=0 均保持一致。
