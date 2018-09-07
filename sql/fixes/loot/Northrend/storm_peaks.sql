-- -------------------------------------------
-- STORM PEAKS
-- -------------------------------------------

-- Brittle Revenant loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30160;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30160, 42246, 0, 68, 1, 1, 0, 1, 1, NULL),
(30160, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30160, 42780, 0, 34, 0, 1, 0, 1, 1, NULL),
(30160, 37701, 0, 26, 0, 1, 0, 1, 2, NULL),
(30160, 42107, 0, 0.2, 1, 1, 0, 1, 1, NULL),
(30160, 39512, 0, 81, 0, 1, 0, 1, 1, NULL),
(30160, 39513, 0, 19, 0, 1, 0, 1, 1, NULL);

-- Niflheim Forefather loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=29974;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(29974, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(29974, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(29974, 33454, 0, 5, 0, 1, 0, 1, 1, NULL),
(29974, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(29974, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(29974, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(29974, 36678, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36146, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36145, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36255, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(29974, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(29974, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

-- Restless Frostborn Warrior loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30135;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30135, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(30135, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(30135, 35947, 0, 5, 0, 1, 0, 1, 1, NULL),
(30135, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(30135, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(30135, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(30135, 36425, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30135, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(30135, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=30135;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30135, 38269, 0, 31, 0, 1, 0, 1, 1, NULL),
(30135, 43575, 0, 19, 0, 1, 0, 1, 1, NULL),
(30135, 35947, 0, 1, 0, 1, 0, 1, 1, NULL),
(30135, 33447, 0, 1, 0, 1, 0, 1, 1, NULL);

-- Restless Frostborn Ghost loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30144;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30144, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(30144, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(30144, 35945, 0, 5, 0, 1, 0, 1, 1, NULL),
(30144, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(30144, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(30144, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(30144, 36425, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(30144, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30144, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=30144;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30144, 38269, 0, 30, 0, 1, 0, 1, 1, NULL),
(30144, 43575, 0, 25, 0, 1, 0, 1, 1, NULL),
(30144, 35947, 0, 1, 0, 1, 0, 1, 1, NULL),
(30144, 33447, 0, 1, 0, 1, 0, 1, 1, NULL);

-- Viscous Oil loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30325;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30325, 42640, 0, 100, 1, 1, 0, 1, 1, NULL),
(30325, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36678, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36255, 0, 0.1, 0, 1, 0, 1, 1, NULL), 
(30325, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36145, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30325, 39551, 0, 81, 0, 1, 0, 1, 1, NULL),
(30325, 39552, 0, 19, 0, 1, 0, 1, 1, NULL);

-- Stormforged Infiltrator loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=30222;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30222, 42780, 0, 44, 0, 1, 0, 1, 1, NULL),
(30222, 33470, 0, 31, 0, 1, 0, 1, 4, NULL),
(30222, 33454, 0, 5, 0, 1, 0, 1, 1, NULL),
(30222, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(30222, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(30222, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(30222, 36425, 0, 0.1, 0, 1, 0, 1, 1, NULL), 
(30222, 36030, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36028, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36140, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36364, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36366, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 36027, 0, 0.1, 0, 1, 0, 1, 1, NULL), 
(30222, 43851, 0, 21, 0, 1, 0, 1, 1, NULL),
(30222, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(30222, 43852, 0, 15, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=30222;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(30222, 43575, 0, 32, 0, 1, 0, 1, 1, NULL), 
(30222, 37467, 0, 26, 0, 1, 0, 1, 1, NULL),
(30222, 35950, 0, 21, 0, 1, 0, 1, 1, NULL);


-- Stoic Mammoth - 30260
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30260) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=29402 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30260);


-- Ravenous Jormungar - 30291
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30291) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=29605 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30291);


-- Roaming Jormungar - 30422
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30422) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=29605 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30422);


-- Stormforged Ambusher - 30208
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30208) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=30222 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30208);


