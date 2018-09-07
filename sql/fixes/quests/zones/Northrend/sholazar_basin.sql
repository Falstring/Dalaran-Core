-- -------------------------------------------
-- SHOLAZAR BASIN
-- -------------------------------------------
-- [Q] Flown the Coop! -- http://wotlk.openwow.com/quest=12532
-- Chicken Escapee SAI
SET @ENTRY := 28161;
UPDATE `creature_template` SET `AIName`="SmartAI", npcflag=16777217 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,51959,0,0,0,28,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Spellhit 'Chicken Net' - Remove Aura 'Scared Chicken'"),
(@ENTRY,0,1,9,61,0,100,0,51959,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Spellhit 'Chicken Net' - Despawn In 4000 ms"),
(@ENTRY,0,2,3,64,0,100,0,0,0,0,0,85,51037,2,0,0,0,0,7,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Invoker Cast 'Capture Chicken Escapee'"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Close Gossip"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Set Npc Flag "),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,28,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Remove Aura 'Scared Chicken'"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Gossip Hello - Despawn In 500 ms"),
(@ENTRY,0,7,0,1,0,100,0,1000,1000,10000,10000,11,50734,1,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - Out of Combat - Cast 'Frenzyheart Chicken: Invisibility'"),
(@ENTRY,0,8,0,1,0,100,0,2500,2500,25000,25000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - Out of Combat - Run Script"),
(@ENTRY,0,9,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Spellhit 'Chicken Net' - Run Script");


-- Actionlist SAI
SET @ENTRY := 2816100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,75,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Script - Add Aura 'Scared Chicken'"),
(@ENTRY,9,1,0,0,0,100,0,25000,25000,0,0,24,51846,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chicken Escapee - On Script - Evade");

-- Actionlist SAI
SET @ENTRY := 2816101;
DELETE FROM smart_scripts WHERE entryorguid=2816101 and source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@ENTRY, 9, 0, 0, 0, 0, 100, 0, 10, 10, 0, 0, 11, 51959, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chicken Escapee - Script - Cast Chicken Net');


DELETE FROM `spell_area` WHERE `spell`=50735;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(50735, 3711, 12532, 12532, 0, 0, 2, 1, 74, 11),
(50735, 3711, 12702, 12702, 0, 0, 2, 1, 74, 11),
(50735, 4292, 12532, 12532, 0, 0, 2, 1, 74, 11),
(50735, 4292, 12702, 12702, 0, 0, 2, 1, 74, 11);


-- Just Following Orders - [A][H] http://www.wowhead.com/quest=12540/just-following-orders

DELETE FROM smart_scripts WHERE entryorguid IN(28217, 2821700, 2821701) and source_type IN(0, 9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (28217, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 11, 51329, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Cast Feign Death'),
    (28217, 0, 1, 14, 61, 0, 100, 0, 0, 0, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Set NPC Flags (Gossip Only)'),
    (28217, 0, 2, 3, 62, 0, 100, 0, 9677, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Say Line 1'),
    (28217, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 28, 51329, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Remove Aura - Feign Death'),
    (28217, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Remove Aura - Set NPC Flags - Quest + Gossip'),
    (28217, 0, 5, 15, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Close Gossip'),
    (28217, 0, 6, 0, 62, 0, 100, 0, 9677, 0, 0, 0, 85, 51382, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Invoker Cast Forcecast Summon Huge Crocolisk'),
    (28217, 0, 7, 0, 64, 0, 100, 0, 0, 0, 0, 0, 98, 9684, 13124, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Hello - Send Gossip Menu'),
    (28217, 0, 8, 10, 62, 0, 100, 0, 9684, 0, 0, 0, 2, 774, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Set Faction (Alliance)'),
    (28217, 0, 9, 10, 62, 0, 100, 0, 9684, 0, 0, 0, 2, 775, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Set Faction (Horde)'),
    (28217, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Store Targetlist'),
    (28217, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2821700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Run Script'),
    (28217, 0, 12, 0, 19, 0, 100, 0, 12570, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On On Quest Accept - Fortunate Misunderstandings - Say Line 2'),
    (28217, 0, 13, 0, 40, 0, 100, 0, 64, 28217, 0, 0, 80, 2821701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Reached WP80 - Run Script'),
    (28217, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 58806, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Add Aura Permanent Feign Death'),
    (28217, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 58806, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Select - Remove Aura Permanent Feign Death');

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2821700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Set NPC Flags'),
    (2821700, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Say Line 3'),
    (2821700, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 53, 1, 28217, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Start WP');

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2821701, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Say Line 4'),
    (2821701, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51448, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Cast Oracle Intro Quest Complete'),
    (2821701, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Say Line 5'),
    (2821701, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 52100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Cast Summon Frenyheart Tracker'),
    (2821701, 9, 4, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Despawn');

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(1, 15) AND SourceGroup=9677 AND SourceEntry IN(0, 11446);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (1, 9677, 11446, 0, 0, 8, 0, 4242, 0, 0, 0, 0, 0, '', NULL),
    (15, 9677, 0, 0, 0, 28, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings complete'),
    (15, 9677, 0, 0, 0, 8, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings rewarded'),    
    (15, 9677, 0, 0, 0, 29, 1, 28325, 50, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if not crocodile is near'),
    (15, 9677, 0, 0, 0, 9, 0, 12540, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Just following orders taken'),
    (15, 9677, 0, 0, 0, 8, 0, 12540, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Just following orders not rewarded');


-- The Lost Mistwhisper Treasure - [A][H] http://www.wowhead.com/quest=12575/the-lost-mistwhisper-treasure

SET @TARTEK := 28105;
SET @ZEPTEK := 28399;

DELETE FROM smart_scripts WHERE entryorguid=@TARTEK AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@TARTEK, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 2, 2061, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Set Faction 2061'),
    (@TARTEK, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 18, 756, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Set Flags Disable Movement & Rename & Preparation & Not Attackable & Immune To NPC\'s'),
    (@TARTEK, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 12, @ZEPTEK, 1, 100000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Summon Creature \'Zeptek the Destroyer\''),
    (@TARTEK, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46598, 2, 0, 0, 0, 0, 11, @ZEPTEK, 10, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Cast \'Ride Vehicle Hardcoded\''),
    (@TARTEK, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Say Line 0'),
    (@TARTEK, 0, 5, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Aggro - Say Line 1'),
    (@TARTEK, 0, 6, 0, 8, 0, 100, 0, 46598, 0, 0, 0, 19, 756, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Spellhit \'Ride Vehicle Hardcoded\' - Remove Flags Disable Movement & Rename & Preparation & Not Attackable & Immune To NPC\'s'),
    (@TARTEK, 0, 7, 0, 9, 0, 100, 0, 5000, 8000, 5000, 8000, 11, 29426, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - Within 5000-8000 Range - Cast \'Heroic Strike\''),
    (@TARTEK, 0, 8, 0, 0, 0, 100, 0, 5000, 15000, 5000, 15000, 11, 35429, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - In Combat - Cast \'Sweeping Strikes\''),
    (@TARTEK, 0, 9, 0, 0, 0, 100, 0, 6000, 15000, 6000, 15000, 11, 15572, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - In Combat - Cast \'Sunder Armor\''),
    (@TARTEK, 0, 10, 11, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 28121, 0, 50, 0, 0, 0, 0, 'Warlord Tartek - On Just Died - Set Data 1 1'),
    (@TARTEK, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 15, 12575, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Just Died - Quest Credit \'The Lost Mistwhisper Treasure\''),
    (@TARTEK, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @ZEPTEK, 50, 0, 0, 0, 0, 0, 'Warlord Tartek - On Just Died - Despawn Zeptek');


-- [Q] Gods Like Shiny Things -- http://wotlk.openwow.com/quest=12572
SET @ENTRY_Q_GIVER = 28027;
SET @ENTRY_TRIGGER = 1010579;
SET @ENTRY_LAFOO = 28120;
SET @ENTRY_BUG = 28372;
SET @ITEM_BAG = 38622;
SET @ITEM_SHINY_THING = 38575;
SET @SPELL = 52547;
SET @QUEST = 12572;
SET @QUEST_DAILY = 12704;

-- Give quest item on quest start
UPDATE `quest_template` SET `startItem`=@ITEM_BAG WHERE `Id` IN(@QUEST,@QUEST_DAILY);

-- Creature dummy npc for shiny aura
DELETE FROM `creature_template` WHERE `entry`=@ENTRY_TRIGGER;
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `faction`, `unit_class`, `unit_flags`, `ScriptName`, `InhabitType`, `flags_extra`) VALUES
(@ENTRY_TRIGGER,2177,'Shiny Thing Visual',35,1,4,'npc_shiny_thing_visual',7,128);

-- Assign core script to quest pet
UPDATE `creature_template` SET `ScriptName`='npc_lafoo', `AIName`='' WHERE `entry`=@ENTRY_LAFOO;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY_LAFOO;
DELETE FROM `conditions` WHERE `sourceentry`=@ENTRY_LAFOO;

-- Spawn dummy npcs for shiny aura
DELETE FROM `creature` WHERE `guid` BETWEEN 3019487 AND 3019507;
INSERT INTO `creature`(`guid`,`id`,`map`,`phaseMask`,`position_x`,`position_y`,`position_z`,`spawntimesecs`,`curhealth`) VALUES
(3019487,@ENTRY_TRIGGER,571,3,5558.76,4574.78, -138.48,60,42),
(3019488,@ENTRY_TRIGGER,571,3,5588.39,4588.88,-138.516,60,42),
(3019489,@ENTRY_TRIGGER,571,3,5544.37,4549.89, -137.59,60,42),
(3019490,@ENTRY_TRIGGER,571,3,5583.12,   4529,-136.771,60,42),
(3019491,@ENTRY_TRIGGER,571,3,5577.62,4509.19,-137.369,60,42),
(3019492,@ENTRY_TRIGGER,571,3,5627.33,   4492,-139.436,60,42),
(3019494,@ENTRY_TRIGGER,571,3,5656.51,4503.94,-135.427,60,42),
(3019495,@ENTRY_TRIGGER,571,3,5683.57,4470.23,-135.971,60,42),
(3019496,@ENTRY_TRIGGER,571,3,5720.83,4486.55,-132.376,60,42),
(3019497,@ENTRY_TRIGGER,571,3,5757.99,4504.68,-132.779,60,42),
(3019498,@ENTRY_TRIGGER,571,3,5787.01,4515.92,-134.161,60,42),
(3019499,@ENTRY_TRIGGER,571,3,5794.41,4560.74,-133.969,60,42),
(3019500,@ENTRY_TRIGGER,571,3,5822.04,4601.84, -136.63,60,42),
(3019501,@ENTRY_TRIGGER,571,3,5790.18,4637.94,-137.215,60,42),
(3019502,@ENTRY_TRIGGER,571,3, 5746.9,4650.37,-134.807,60,42),
(3019503,@ENTRY_TRIGGER,571,3,5758.81,4678.04,-133.392,60,42),
(3019504,@ENTRY_TRIGGER,571,3,5703.91,4690.92, -135.06,60,42),
(3019505,@ENTRY_TRIGGER,571,3,5705.88,4743.37,-136.066,60,42),
(3019506,@ENTRY_TRIGGER,571,3,5621.83, 4687.3,-135.878,60,42),
(3019507,@ENTRY_TRIGGER,571,3,5546.65,4671.62,-132.304,60,42);

-- Add loot for glinting bug
UPDATE `creature_template` SET `lootid`=@ENTRY_BUG WHERE `entry`=@ENTRY_BUG;
DELETE FROM `creature_loot_template` WHERE `entry`=@ENTRY_BUG AND `item`=@ITEM_SHINY_THING;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@ENTRY_BUG, @ITEM_SHINY_THING, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Spawn visible go's on same position as dummy npcs
DELETE FROM `gameobject` WHERE `guid` BETWEEN 2026183 AND 2026203;
INSERT INTO `gameobject`(`guid`,`id`,`map`,`phaseMask`,`position_x`,`position_y`,`position_z`,`spawntimesecs`,`state`)
SELECT `guid`-993304,'192949',`map`,'1',`position_x`,`position_y`,`position_z`,`spawntimesecs`,'1' FROM `creature` WHERE `guid` BETWEEN 3019487 AND 3019507 AND `id`=@ENTRY_TRIGGER;

-- Reconnaisance Flight
UPDATE creature_template SET speed_walk=3, speed_run=2 WHERE entry=28710;

-- The Lost Mistwhisper Treasure (12575)
SET @TRIGGER := 5030;
-- Criteria linked with involved relation
DELETE FROM `areatrigger_involvedrelation` WHERE `id` = @TRIGGER;
DELETE FROM `areatrigger_scripts` WHERE `entry` = @TRIGGER;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@TRIGGER AND `source_type`=2;
UPDATE `gameobject_template` SET `ScriptName`='go_mistwhisper_treasure' WHERE `entry`=190578;
UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE  `ID`=12575;

-- Warlord Tartek SAI
SET @ENTRY := 28105;
UPDATE `creature_template` SET `AIName`="SmartAI", `scriptname`='npc_warlord_tartek_treasure' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,2,2061,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - On Respawn - Set Faction 2061"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,18,756,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - On Respawn - Set Flags Disable Movement & Rename & Preparation & Not Attackable & Immune To NPC's"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,12,28399,1,100000,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - On Respawn - Summon Creature 'Zeptek the Destroyer'"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,11,46598,2,0,0,0,0,11,28399,10,0,0,0,0,0,"Warlord Tartek - On Respawn - Cast 'Ride Vehicle Hardcoded'"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - On Respawn - Say Line 0"),
(@ENTRY,0,5,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - On Aggro - Say Line 1"),
(@ENTRY,0,6,0,8,0,100,0,46598,0,0,0,19,756,0,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - On Spellhit 'Ride Vehicle Hardcoded' - Remove Flags Disable Movement & Rename & Preparation & Not Attackable & Immune To NPC's"),
(@ENTRY,0,7,0,9,0,100,0,5000,8000,5000,8000,11,29426,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - Within 5000-8000 Range - Cast 'Heroic Strike'"),
(@ENTRY,0,8,0,0,0,100,0,5000,15000,5000,15000,11,35429,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warlord Tartek - In Combat - Cast 'Sweeping Strikes'"),
(@ENTRY,0,9,0,0,0,100,0,6000,15000,6000,15000,11,15572,2,0,0,0,0,2,0,0,0,0,0,0,0,"Warlord Tartek - In Combat - Cast 'Sunder Armor'"),
(@ENTRY,0,10,11,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,28121,0,50,0,0,0,0,"Warlord Tartek - On Just Died - Set Data 1 1");

-- Captive Crocolisk SAI
SET @ENTRY := 28308;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,512,0,0,0,0,80,@ENTRY*100+00,0,2,0,0,0,1,0,0,0,0,0,0,0,"Captive Crocolisk - On Just Summoned - Run Script"),
(@ENTRY,0,1,2,40,0,100,512,39,0,0,0,11,50630,2,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Crocolisk - On Waypoint 39 Reached - Cast 'Eject All Passengers'"),
(@ENTRY,0,2,3,61,0,100,512,39,0,0,0,15,12536,0,0,0,0,0,23,0,0,0,0,0,0,0,"Captive Crocolisk - On Waypoint 39 Reached - Quest Credit ''"),
(@ENTRY,0,3,0,61,0,100,512,39,0,0,0,86,51189,2,23,0,0,0,1,0,0,0,0,0,0,0,"Captive Crocolisk - On Waypoint 39 Reached - Cross Cast 'Summon Zepik the Gorloc Hunter'"),
(@ENTRY,0,4,0,40,0,100,512,40,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Crocolisk - On Waypoint 40 Reached - Despawn Instant");

UPDATE `creature_template` SET `speed_run` = 2.14286 WHERE `entry` = 28308; 
UPDATE `creature_template` SET `unit_flags` = 33536, `unit_flags2`= 34816  WHERE `entry` = 28298;
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 28307; 

-- Captive Crocolisk SAI
SET @ENTRY := 28298;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,9674,0,0,0,85,51258,0,0,0,0,0,7,0,0,0,0,0,0,0,"Captive Crocolisk - On Gossip Option 0 Selected - Invoker Cast 'Forcecast Summon Crocolisk'"),
(@ENTRY,0,1,0,61,0,100,0,9674,0,0,0,45,1,3,0,0,0,0,19,28216,15,0,0,0,0,0,"Captive Crocolisk - On Gossip Option 0 Selected - Set Data 1 3"),
(@ENTRY,0,2,0,1,0,100,1,1000,1000,0,0,11,51256,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Crocolisk - Out of Combat - Cast 'Captive Crocolisk Chains' (No Repeat)");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 13 AND `SourceGroup`= 1 AND `SourceEntry`= 51256;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,51256,0,0,31,0,3,28307,0,0,0,0,'','Captive Crocolisk Chains targets Croclisk Chain Bunny');

UPDATE `smart_scripts` SET `action_param1` = 0 WHERE `entryorguid` = 28216 AND `source_type` = 0 AND `id` = 19 AND `link` = 0; -- Comment: Instant despawn for Zepik just like it was shown on the video.
