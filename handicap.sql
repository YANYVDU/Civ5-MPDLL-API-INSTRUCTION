--难度表（HandicapInfos）除原版列外的自定义列
--AIAutoBuildingUpgrade：AI 玩家在该难度下是否执行建筑自动升级（1 = 执行，0 = 不执行）
--人类玩家不受此列影响，始终执行建筑自动升级
--配合 Building_AutoUpgrade 表使用，默认值 0 不影响未配置的难度
ALTER TABLE HandicapInfos ADD AIAutoBuildingUpgrade boolean default 0;
