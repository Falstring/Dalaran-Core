-- Kilix the Unraveler and Azjol-anak Battleguards
UPDATE creature_template SET flags_extra=2, unit_flags=33536 WHERE entry IN(26653, 26662);

SET @CORRUPTER_RAGER := 21223;

UPDATE creature_template SET InhabitType=3 WHERE entry=@CORRUPTER_RAGER;
DELETE FROM `creature_loot_template` WHERE `Entry`=@CORRUPTER_RAGER AND `item`=37705;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (@CORRUPTER_RAGER, 37705, 0, 40, 0, 1, 0, 2, 4, NULL);

INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (@CORRUPTER_RAGER) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=24228 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=@CORRUPTER_RAGER);

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@CORRUPTER_RAGER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@CORRUPTER_RAGER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@CORRUPTER_RAGER,0,0,0,0,0,100,0,2000,8000,45000,50000,11,51613,65,0,0,0,0,2,0,0,0,0,0,0,0,"Corrupted Rager - In Combat - Cast 'Corrode Armor'");
 

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=3 AND `SourceEntry`=6546;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 3, 6546, 0, 0, 29, 0, 6550, 100, 0, 1, 0, 0, '', 'Mana Surge - Allow sai action only if not Mana Surge nearby');

-- -----------------------
-- ZUL'GURUB
-- -----------------------


-- High Priestess Jeklik
UPDATE creature_template SET InhabitType=5, flags_extra=536870913 WHERE entry=14517;

-- Deviate Hides - [A][H] http://www.wowhead.com/quest=1486/deviate-hides

UPDATE quest_template SET AllowableRaces=0 WHERE ID=1486;


-- Burning Essence - http://www.wowhead.com/item=11751/burning-essence
DELETE FROM gameobject_loot_template WHERE Entry=11103 AND Item=11751;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (11103, 11751, 0, 42, 0, 1, 0, 1, 2, NULL);


-- Kyle's Gone Missing! - [H] http://www.wowhead.com/quest=11129/kyles-gone-missing

UPDATE creature_loot_template SET chance=30 WHERE Item=33009;


-- Into the Pit - http://www.wowhead.com/quest=12997/into-the-pit

DELETE FROM smart_scripts WHERE entryorguid=30174 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (30174, 0, 0, 0, 1, 0, 100, 0, 0, 0, 0, 0, 18, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - Out of Combat - Set Unit_flag immune to npc (No Repeat)'),
    (30174, 0, 1, 0, 0, 0, 100, 0, 3000, 6000, 7000, 12000, 11, 54458, 1, 0, 0, 0, 0, 19, 29918, 50, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat - Cast \'Smash\' (No Repeat)'),
    (30174, 0, 2, 0, 0, 0, 100, 0, 1000, 35000, 70000, 95000, 11, 54459, 1, 0, 0, 0, 0, 19, 29918, 50, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat - Cast \'Maul\' (No Repeat)'),
    (30174, 0, 3, 0, 0, 0, 100, 0, 5000, 9000, 11000, 17000, 11, 54460, 1, 0, 0, 0, 0, 19, 29918, 50, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat - Cast \'Charge\' (No Repeat)'),
    (30174, 0, 4, 0, 26, 0, 100, 0, 0, 50, 0, 0, 20, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Hyldsmeet Warbear - In Combat LOS - Stop attack player');


-- Crazy Alchemist's Potion - http://www.wowhead.com/item=40077/crazy-alchemists-potion

DELETE FROM `spell_script_names` WHERE `spell_id`=53750;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('53750', 'spell_item_crazy_alchemists_potion');

-- Massacre At Light's Point - [A][H] http://www.wowhead.com/quest=12701/massacre-at-lights-point
UPDATE `creature` SET `spawntimesecs`=60 WHERE `id` IN (28834, 28856, 28850);


-- Fingers of Frost Proc on Arcane Blast self aura
DELETE FROM `spell_script_names` WHERE spell_id=74396;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (74396, 'spell_mage_fingers_of_frost');

-- Characters database.
/*CREATE TABLE `creature_vendor` (
  `spawnId` int(10) unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `instanceId` int(10) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lastIncrementTime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spawnId`,`instanceId`)
);*/

-- Rune of the Fallen Crusader
UPDATE `spell_enchant_proc_data` SET `PPMChance`=2 WHERE (`entry`=3368);

DELETE FROM `spell_custom_attr` WHERE `entry` IN (974, 32593, 32594);
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
(974, 8388608),
(32593, 8388608),
(32594, 8388608);



-- The Balance of Light and Shadow - [A][H] http://www.wowhead.com/quest=7622/the-balance-of-light-and-shadow
UPDATE `creature_template` SET `ScriptName`='npc_fleeing_peasant', `RegenHealth`=0 WHERE `entry` IN (14484,14485);
UPDATE `creature_template` SET `ScriptName`='npc_eris_havenfire' WHERE `entry`=14494;
UPDATE `creature_template` SET `AIName`='ArcherAI' WHERE `entry`=14489;

DELETE FROM `creature_text` WHERE `entry` IN (14484,14494);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(14484, 0, 0, 'Death take me! I cannot go on! I have nothing left...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 0, 1, 'Should I live through this, I shall make it my live\'s sole ambition to destroy Arthas...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 0, 2, 'The pain is unbearable!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 0, 3, 'I won\'t make it... go... go on without me...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 1, 0, 'The Scourge is uppon us! Run! Run for your lives!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 2, 0, 'Please help us! The Prince has gone mad!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 3, 0, 'Seek sanctuary in Hearthglen! It is our only hope!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 4, 0, 'Thank you, kind stranger. May your heroism never be forgotten.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 4, 1, 'The power of the light is truly great and merciful.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),
(14484, 4, 2, 'Stranger, find the fallen Prince Menethil and end his reign of terror.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fleeing Peasant'),

(14494, 0, 0, 'Be healed!', 12, 0, 100, 0, 0, 0, 0, 0, 'Eris Havenfire'),
(14494, 1, 0, 'We are saved! The peasants have escaped the Scourge!', 12, 0, 100, 0, 0, 0, 0, 0, 'Eris Havenfire');


-- AQ20 Idols
DELETE FROM `creature_loot_template` WHERE (`Entry`=15262) AND (`Item`=20873);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20873);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15229) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15233) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15246) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15264) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20872);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20870);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15233) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15249) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15277) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20869);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15262) AND (`Item`=20868);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20868);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20866);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15505) AND (`Item`=20866);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15229) AND (`Item`=20871);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15252) AND (`Item`=20871);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15262) AND (`Item`=20871);
DELETE FROM `creature_loot_template` WHERE (`Entry`=15387) AND (`Item`=20871);


SET @LSCOFFER := 180690;
SET @SCOFFER  := 180691;
SET @GUIDLSC  := 17800;
SET @GUIDSC   := 20918;

-- Updating maxcount for Scarab Scarab Bag
UPDATE `item_loot_template` SET `maxcount` = 5 WHERE `entry` = 21156;

-- Updating spawn location for Large Scarab Coffers
DELETE FROM `gameobject` WHERE `guid` IN (@GUIDLSC, @GUIDLSC+1, @GUIDLSC+2, @GUIDLSC+3, @GUIDLSC+4, @GUIDLSC+5, @GUIDLSC+6, @GUIDLSC+7, @GUIDLSC+8, @GUIDLSC+9, @GUIDLSC+10, @GUIDLSC+11);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(@GUIDLSC, @LSCOFFER, 531, 1, 1, -8130.227, 1136.687, -88.93, 0.857524, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+1, @LSCOFFER, 531, 1, 1, -8588.386, 1300.252, -68.730408, 2.097758, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+2, @LSCOFFER, 531, 1, 1, -8685.795, 1598.988, -87.498146, 4.515244, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+3, @LSCOFFER, 531, 1, 1, -8878.372, 1366.834, -98.920456, 1.169440, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+4, @LSCOFFER, 531, 1, 1, -9094.497, 1515.304, -98.369436, 5.289001, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+5, @LSCOFFER, 531, 1, 1, -9205.269, 1489.207, -94.166359, 0.800427, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+6, @LSCOFFER, 531, 1, 1, -9239.013, 1569.972, -77.098450, 5.92124, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+7, @LSCOFFER, 531, 1, 1, -9162.003, 1584.0142, -79.262154, 2.819869, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+8, @LSCOFFER, 531, 1, 1, -9203.490, 1967.797, -51.939789, 1.508256, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+9, @LSCOFFER, 531, 1, 1, -8923.832, 1826.973, -20.905273, 1.040937, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+10, @LSCOFFER, 531, 1, 1, -8561.847, 1988.220, -3.113131, 4.493683, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDLSC+11, @LSCOFFER, 531, 1, 1, -8507.548, 2018.031, 104.526520, 3.540616, 0, 0, 0, 0, 10800, 100, 1);

-- Updating spawn location for Scarab Coffers
DELETE FROM `gameobject` WHERE `guid` IN (@GUIDSC, @GUIDSC+1, @GUIDSC+2, @GUIDSC+3, @GUIDSC+4, @GUIDSC+5, @GUIDSC+6, @GUIDSC+7, @GUIDSC+8);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(@GUIDSC, @SCOFFER, 509, 1, 1, -8698.908, 1560.894, 32.013947, 2.385138, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+1, @SCOFFER, 509, 1, 1, -9117.897, 1511.653, 21.414448, 1.780370, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+2, @SCOFFER, 509, 1, 1, -8775.216, 2003.485, 21.403147, 3.060552, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+3, @SCOFFER, 509, 1, 1, -9009.267, 1989.094, 33.044173, 0.115302, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+4, @SCOFFER, 509, 1, 1, -9130.286, 2188.145, 25.825098, 0.872438, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+5, @SCOFFER, 509, 1, 1, -9544.468, 2010.560, 105.250053, 0.864585, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+6, @SCOFFER, 509, 1, 1, -9701.868, 1619.060, 27.191568, 0.042328, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+7, @SCOFFER, 509, 1, 1, -9552.093, 1567.647, 23.153004, 2.197394, 0, 0, 0, 0, 10800, 100, 1),
(@GUIDSC+8, @SCOFFER, 509, 1, 1, -9335.515, 1214.496, 21.385408, 0.709061, 0, 0, 0, 0, 10800, 100, 1);

-- Pool template for Large Scarab Coffers and Scarab Coffers
DELETE FROM `pool_template` WHERE entry IN (1161, 1162);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(1161, 5, 'Large Scarab Coffers'),
(1162, 7, 'Scarab Coffers');

-- Pool_gameobject pool for Large Scarab Coffers
DELETE FROM `pool_gameobject` WHERE guid IN (@GUIDLSC, @GUIDLSC+1, @GUIDLSC+2, @GUIDLSC+3, @GUIDLSC+4, @GUIDLSC+5, @GUIDLSC+6, @GUIDLSC+7, @GUIDLSC+8, @GUIDLSC+9, @GUIDLSC+10, @GUIDLSC+11);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@GUIDLSC, 1161, 0, 'Large Scarab Coffers - Spawn 1'),
(@GUIDLSC+1, 1161, 0, 'Large Scarab Coffers - Spawn 2'),
(@GUIDLSC+2, 1161, 0, 'Large Scarab Coffers - Spawn 3'),
(@GUIDLSC+3, 1161, 0, 'Large Scarab Coffers - Spawn 4'),
(@GUIDLSC+4, 1161, 0, 'Large Scarab Coffers - Spawn 5'),
(@GUIDLSC+5, 1161, 0, 'Large Scarab Coffers - Spawn 6'),
(@GUIDLSC+6, 1161, 0, 'Large Scarab Coffers - Spawn 7'),
(@GUIDLSC+7, 1161, 0, 'Large Scarab Coffers - Spawn 8'),
(@GUIDLSC+8, 1161, 0, 'Large Scarab Coffers - Spawn 9'),
(@GUIDLSC+9, 1161, 0, 'Large Scarab Coffers - Spawn 10'),
(@GUIDLSC+10, 1161, 0, 'Large Scarab Coffers - Spawn 11'),
(@GUIDLSC+11, 1161, 0, 'Large Scarab Coffers - Spawn 12');

-- Pool_gameobject pool for Large Scarab Coffers
DELETE FROM `pool_gameobject` WHERE guid IN (@GUIDSC, @GUIDSC+1, @GUIDSC+2, @GUIDSC+3, @GUIDSC+4, @GUIDSC+5, @GUIDSC+6, @GUIDSC+7, @GUIDSC+8, @GUIDSC+9, @GUIDSC+10, @GUIDSC+11);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(@GUIDSC, 1162, 0, 'Scarab Coffers - Spawn 1'),
(@GUIDSC+1, 1162, 0, 'Scarab Coffers - Spawn 2'),
(@GUIDSC+2, 1162, 0, 'Scarab Coffers - Spawn 3'),
(@GUIDSC+3, 1162, 0, 'Scarab Coffers - Spawn 4'),
(@GUIDSC+4, 1162, 0, 'Scarab Coffers - Spawn 5'),
(@GUIDSC+5, 1162, 0, 'Scarab Coffers - Spawn 6'),
(@GUIDSC+6, 1162, 0, 'Scarab Coffers - Spawn 7'),
(@GUIDSC+7, 1162, 0, 'Scarab Coffers - Spawn 8'),
(@GUIDSC+8, 1162, 0, 'Scarab Coffers - Spawn 9');


-- Mana-Tombs Stasis Chamber
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE (`entry`= 185519);
INSERT INTO `smart_scripts` VALUES (185519, 1, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 26, 10977, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Summon Pax\'ivi');
INSERT INTO `smart_scripts` VALUES (185519, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 22928, 3, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Summon Pax\'ivi');

-- Mana-Tombs Stasis Chamber
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (164445, 185519, 557, 2, -107.662, -102.516, -0.420004, 0.707648, 0.346487, 0.938055, 300, 100, 1);


-- http://www.wowhead.com/item=34863/bag-of-fishing-treasures
DELETE FROM `item_loot_template` WHERE (`Entry`= 34863);
INSERT INTO `item_loot_template` VALUES (34863, 1, 11113, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `item_loot_template` VALUES (34863, 2, 11114, 5, 0, 1, 0, 1, 1, NULL);
INSERT INTO `item_loot_template` VALUES (34863, 3, 11115, 60, 0, 1, 0, 1, 1, NULL);

-- Primed Key Mold loot
DELETE FROM `creature_loot_template` WHERE (`Item`=31239);
INSERT INTO `creature_loot_template` VALUES (22037, 31239, 0, 100, 0, 1, 0, 1, 1, NULL);

-- The Talon King's Coffer
UPDATE `gameobject` SET `spawntimesecs`= 1 WHERE (`guid`= 44719);