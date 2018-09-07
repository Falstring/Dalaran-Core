-- [Quest] Distracting Jarven -- http://www.wowhead.com/quest=308
-- Jarven Thunderbrew SAI
SET @ENTRY := 1373;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,308,0,0,0,1,0,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Quest 'Distracting Jarven' Finished - Say Line 0"),
(@ENTRY,0,1,9,61,0,100,0,308,0,0,0,53,0,1373,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Quest 'Distracting Jarven' Finished - Start Waypoint"),
(@ENTRY,0,2,0,40,0,100,0,2,1373,0,0,70,30,0,0,0,0,0,14,35875,270,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 2 Reached - Respawn Closest Gameobject 'Unguarded Thunder Ale Barrel'"),
(@ENTRY,0,3,6,40,0,100,0,8,1373,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 8 Reached - Say Line 1"),
(@ENTRY,0,4,0,40,0,100,0,15,1373,0,0,1,2,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 15 Reached - Say Line 2"),
(@ENTRY,0,5,7,40,0,100,0,17,1373,0,0,1,3,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 17 Reached - Say Line 3"),
(@ENTRY,0,6,0,61,0,100,0,8,1373,0,0,54,11000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 8 Reached - Pause Waypoint"),
(@ENTRY,0,7,8,61,0,100,0,17,1373,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.97738,"Jarven Thunderbrew - On Waypoint 17 Reached - Set Orientation 0,97738"),
(@ENTRY,0,8,0,61,0,100,0,17,1373,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Waypoint 17 Reached - Set Npc Flags Gossip & Questgiver"),
(@ENTRY,0,9,0,61,0,100,0,308,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jarven Thunderbrew - On Quest 'Distracting Jarven' Finished - Remove Npc Flags Gossip & Questgiver");

UPDATE `creature_text` SET `type`=16, `language`=7 WHERE  `entry`=1373 AND `groupid`=0 AND `id`=0;

DELETE FROM `waypoints` WHERE `entry`=1373;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(1373, 1, -5601.64,-541.38,392.42,"Jarven Thunderbrew"),
(1373, 2, -5597.94,-542.04,392.42,"Jarven Thunderbrew"), -- Respawn Closest Gameobject 'Unguarded Thunder Ale Barrel'
(1373, 3, -5597.95,-548.43,395.48,"Jarven Thunderbrew"),
(1373, 4, -5605.31,-549.33,399.09,"Jarven Thunderbrew"),
(1373, 5, -5607.55,-546.63,399.09,"Jarven Thunderbrew"),
(1373, 6, -5597.52,-538.75,399.09,"Jarven Thunderbrew"),
(1373, 7, -5597.62,-530.24,399.65,"Jarven Thunderbrew"),
(1373, 8, -5603.67,-529.91,399.65,"Jarven Thunderbrew"), -- On Script - Say Line 1
(1373, 9, -5603.67,-529.91,399.65,"Jarven Thunderbrew"),
(1373, 10, -5597.62,-530.24,399.65,"Jarven Thunderbrew"),
(1373, 11, -5597.52,-538.75,399.09,"Jarven Thunderbrew"),
(1373, 12, -5607.55,-546.63,399.09,"Jarven Thunderbrew"),
(1373, 13, -5605.31,-549.33,399.09,"Jarven Thunderbrew"),
(1373, 14, -5597.95,-548.43,395.48,"Jarven Thunderbrew"),
(1373, 15, -5597.94,-542.04,392.42,"Jarven Thunderbrew"), -- On Script - Say Line 2 
(1373, 16, -5601.64,-541.38,392.42,"Jarven Thunderbrew"),
(1373, 17, -5605.96,-544.45,392.43,"Jarven Thunderbrew"); -- On Script - Say Line 3

-- Delete Actionlist SAI
SET @ENTRY := 137300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;

-- Lokhtos Darkbargainer quests
-- Favor Amongst the Brotherhood, Core Leather - ID: 6645
-- Favor Amongst the Brotherhood, Blood of the Mountain - ID: 6646
-- Favor Amongst the Brotherhood, Fiery Core - ID: 6643
-- Favor Amongst the Brotherhood, Lava Core - ID: 6644
-- Favor Amongst the Brotherhood, Dark Iron Ore - ID: 6642
UPDATE `quest_template_addon` SET `RequiredMinRepValue` = 0 WHERE `ID` BETWEEN 6642 AND 6646;
UPDATE `quest_template_addon` SET `RequiredMaxRepFaction` = 59 , `RequiredMaxRepValue` = 9000 , `SpecialFlags` = 1 WHERE `ID` = 13662;

-- [Quest][WoTLK][Zul'Drak] Troll Patrol (Daily) -- Add Pooling for Daily quests
SET @Pool := 370;

UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE  `ID` IN(12604,12541,12502,12509,12519,12502,12509,12519,12588,12591,12594,12557,12597,12598,12599,12564,12568,12585);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(19,20) AND`SourceEntry` IN(12541,12604,12502,12509,12519,12502,12509,12519,12588,12591,12594,12557,12597,12598,12599,12564,12568,12585);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(19, 0, 12604, 0, 0, 1, 0, 51573, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has aura 51573 'On Patrol'."),
(20, 0, 12604, 0, 0, 1, 0, 51573, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has aura 51573 'On Patrol'."),
(19, 0, 12604, 0, 0, 1, 0, 53707, 0, 0, 1, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has no aura 51573 'On Patrol Heartbeat Script'."),
(20, 0, 12604, 0, 0, 1, 0, 53707, 0, 0, 1, 0, 0, '', "Show quest mark 12604 'Congratulations!' if player has no aura 51573 'On Patrol Heartbeat Script'."),
(19, 0, 12541, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(20, 0, 12541, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(19, 0, 12541, 0, 1, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(20, 0, 12541, 0, 1, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(19, 0, 12541, 0, 2, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(20, 0, 12541, 0, 2, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: The Alchemists Apprentice' if player has quest Troll patrol'."),
(19, 0, 12509, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12509 'Troll Patrol: Intestinal Fortitude' if player has quest Troll patrol'."),
(20, 0, 12509, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12509 'Troll Patrol: Intestinal Fortitude' if player has quest Troll patrol'."),
(19, 0, 12519, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: Whatdya Want, a Medal?' if player has quest Troll patrol'."),
(20, 0, 12519, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12604 'Troll Patrol: Whatdya Want, a Medal?' if player has quest Troll patrol'."),
(19, 0, 12502, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12502 'Troll Patrol: High Standards' if player has quest Troll patrol'."),
(20, 0, 12502, 0, 0, 9, 0, 12501, 0, 0, 0, 0, 0, '', "Show quest mark 12502 'Troll Patrol: High Standards' if player has quest Troll patrol'."),
(19, 0, 12564, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12564 'Troll Patrol: Something for the Pain' if player has quest Troll patrol'."),
(20, 0, 12564, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12564 'Troll Patrol: Something for the Pain' if player has quest Troll patrol'."),
(19, 0, 12568, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12568 'Troll Patrol: Done to Death' if player has quest Troll patrol'."),
(20, 0, 12568, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12558 'Troll Patrol: Done to Death' if player has quest Troll patrol'."),
(19, 0, 12585, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12585 'Troll Patrol: Creature Comforts' if player has quest Troll patrol'."),
(20, 0, 12585, 0, 0, 9, 0, 12563, 0, 0, 0, 0, 0, '', "Show quest mark 12585 'Troll Patrol: Creature Comforts' if player has quest Troll patrol'."),
(19, 0, 12588, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12588 'Troll Patrol: Can You Dig It?' if player has quest Troll patrol'."),
(20, 0, 12588, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12588 'Troll Patrol: Can You Dig It?' if player has quest Troll patrol'."),
(19, 0, 12591, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12591 'Troll Patrol: Throwing Down' if player has quest Troll patrol'."),
(20, 0, 12591, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12591 'Troll Patrol: Throwing Down' if player has quest Troll patrol'."),
(19, 0, 12594, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12594 'Troll Patrol: Couldn't Care Less' if player has quest Troll patrol'."),
(20, 0, 12594, 0, 0, 9, 0, 12587, 0, 0, 0, 0, 0, '', "Show quest mark 12594 'Troll Patrol: Couldn't Care Less' if player has quest Troll patrol'."),
(19, 0, 12557, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12557 'Lab Work' if player has quest Pa'Troll'."),
(20, 0, 12557, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12557 'Lab Work' if player has quest Pa'Troll'."),
(19, 0, 12597, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12597 'Something for the Pain' if player has quest Pa'Troll'."),
(20, 0, 12597, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12597 'Something for the Pain' if player has quest Pa'Troll'."),
(19, 0, 12598, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12598 'Throwing Down' if player has quest Pa'Troll'."),
(20, 0, 12598, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12598 'Throwing Down' if player has quest Pa'Troll'."),
(19, 0, 12599, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12599 'Creature Comforts' if player has quest Pa'Troll'."),
(20, 0, 12599, 0, 0, 9, 0, 12596, 0, 0, 0, 0, 0, '', "Show quest mark 12599 'Creature Comforts' if player has quest Pa'Troll'.");
 
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`=''  WHERE `entry` =28039;
DELETE FROM `smart_scripts` WHERE `entryorguid` =28039 AND `source_type`=0;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(28039, 0, 0, 1, 19, 0, 100, 0, 12596, 0, 0, 0, 85, 51506, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Pa''Troll - Invoker Cast Clear Patrol Quests'),
(28039, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 51509, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Pa''Troll - Invoker Cast Clear Patrol Quests II'),
(28039, 0, 2, 5, 19, 0, 100, 0, 12587, 0, 0, 0, 85, 51573, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol'),
(28039, 0, 3, 5, 19, 0, 100, 0, 12501, 0, 0, 0, 85, 51573, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol'),
(28039, 0, 4, 5, 19, 0, 100, 0, 12563, 0, 0, 0, 85, 51573, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol'),
(28039, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53712, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 00'),
(28039, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53713, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 01'),
(28039, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53715, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 02'),
(28039, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53716, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast Clear DAILY Patrol SUBQuests 03'),
(28039, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 53707, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Accept Troll Patrol - Invoker Cast On Patrol Heartbeat Script'),
(28039, 0, 10, 0, 20, 0, 100, 0, 12587, 0, 0, 0, 28, 51573, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Congratulations - Remove Aura On Patrol'),
(28039, 0, 11, 0, 20, 0, 100, 0, 12563, 0, 0, 0, 28, 53707, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Troll Patrol - Remove Aura On Patrol Heartbeat Script'),
(28039, 0, 12, 0, 20, 0, 100, 0, 12501, 0, 0, 0, 28, 53707, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Troll Patrol - Remove Aura On Patrol Heartbeat Script'),
(28039, 0, 13, 0, 20, 0, 100, 0, 12604, 0, 0, 0, 28, 53707, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Commander Kunz - On Quest Reward Troll Patrol - Remove Aura On Patrol Heartbeat Script');

UPDATE `quest_template_addon` SET `ExclusiveGroup`=12587 WHERE  `ID`  IN(12501,12563,12587);

DELETE FROM `pool_quest` WHERE `pool_entry` IN (@Pool);

INSERT INTO `pool_quest` (`entry`, `pool_entry`, `description`) VALUES
(12587, @Pool, 'Troll Patrol'),
(12501, @Pool, 'Troll Patrol'),
(12563, @Pool, 'Troll Patrol');
    
DELETE FROM `pool_template` WHERE `entry` IN (@Pool);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@Pool, 1, 'Troll Patrol Daily Quests');

-- DB/Quest: Troll Patrol: High Standards - Add Banner Visual
UPDATE `smart_scripts` SET `link`=1 WHERE  `entryorguid`IN (28064,28304,28305) AND `source_type`=0 AND `id`=0 AND `link`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN (28064,28304,28305) AND `source_type`=0 AND `id`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(28064, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51249, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Pedestal 01 - On Spellhit \'Place Banner\' - Cast Summon Agent Crusade Banner'),
(28304, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51249, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Pedestal 02 - On Spellhit \'Place Banner\' - Cast Summon Agent Crusade Banner'),
(28305, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 51249, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drakkari Pedestal 02 - On Spellhit \'Place Banner\' - Cast Summon Agent Crusade Banner');
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid` IN(109153,109501,110958);

--  DB/Quest: Troll Patrol: Can You Dig it?
SET @CGUID := 3110215;

DELETE FROM `smart_scripts` WHERE `entryorguid`IN(28162,28330,28156) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(2833000,2833001,2833002) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(28330, 0, 0, 1, 8, 0, 100, 0, 51333, 0, 120000, 120000, 33, 28330, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Give Quest Credit'),
(28330, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 70, 120, 0, 0, 0, 0, 0, 20, 190550, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Despawn GO'),
(28330, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 87, 2833000, 2833001, 2833002, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - On Spell Hit - Run Random Script'),
(2833000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 1 - Cast Summon Ancient Drakkari Chest'),
(2833001, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51357, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 2 - Cast Summon Spider'),
(2833002, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51370, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ancient Dirt KC Bunny - Script 3 - Cast Summon Drakkari Spectre');

DELETE FROM `gameobject_template` WHERE `entry`=190552;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
(190552, 3, 2450, 'Ancient Drakkari Chest', '', '', '', 94, 0, 1, 1691, 27240, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 14007);

DELETE FROM `gameobject_loot_template` WHERE `Entry`=27240;
INSERT INTO `gameobject_loot_template` (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES 
(27240, 46369, 0, 52, 0, 1, 1, 1, 1, NULL),
(27240, 46368, 0, 47, 0, 1, 1, 1, 1, NULL),
(27240, 43851, 0, 15, 0, 1, 2, 1, 1, NULL),
(27240, 43852, 0, 14, 0, 1, 2, 1, 1, NULL),
(27240, 33470, 0, 14, 0, 1, 3, 1, 4, NULL);

UPDATE `creature` SET `modelid`='19595' WHERE  `id`=28330;

DELETE FROM `gameobject` WHERE `id`=190550;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 190550, 571, 1, 1,  4994.237, -2934.52, 289.698, 4.502949,       0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 4278)
(@OGUID+1, 190550, 571, 1, 1,  4928.283, -2954.844, 289.4258, 0.3665192,    0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+2, 190550, 571, 1, 1,  4971.499, -2967.053, 290.4032, 6.021386,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+3, 190550, 571, 1, 1,  4934.217, -2988.888, 290.1517, 3.316126,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+4, 190550, 571, 1, 1,  4901.642, -3020.357, 290.4903, 3.577925,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+5, 190550, 571, 1, 1,  4936.192, -2911.305, 289.9935, 3.804818,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+6, 190550, 571, 1, 1,  4904.635, -2938.013, 290.041, 2.792527,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+7, 190550, 571, 1, 1,  4959.712, -2882.519, 290.1794, 2.495821,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+8, 190550, 571, 1, 1,  4903.988, -2988.983, 289.8607, 6.073746,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+9, 190550, 571, 1, 1,  4884.578, -2949.397, 291.4635, 6.248279,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+10, 190550, 571, 1, 1, 4867.053, -3032.317, 290.2768, 0.01745329,   0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+11, 190550, 571, 1, 1, 4875.137, -2981.573, 289.6624, 3.769911,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+12, 190550, 571, 1, 1, 4948.37, -2845.009, 289.9186, 0.2094395,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+13, 190550, 571, 1, 1, 4900.262, -2870.288, 290.5846, 2.879793,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+14, 190550, 571, 1, 1, 4889.488, -2826.498, 291.2368, 6.213372,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+15, 190550, 571, 1, 1, 4865.896, -2879.65, 291.2252, 3.124139,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+16, 190550, 571, 1, 1, 4847.792, -2933.366, 290.7986, 1.954769,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 4279)
(@OGUID+17, 190550, 571, 1, 1, 4838.494, -2962.302, 290.7893, 5.096361,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+18, 190550, 571, 1, 1, 4834.676, -3024.518, 290.9732, 5.77704,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+19, 190550, 571, 1, 1, 4834.516, -3055.432, 292.7168, 4.223697,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+20, 190550, 571, 1, 1, 4833.344, -3086.806, 290.7325, 5.183628,     0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+21, 190550, 571, 1, 1, 4811.373, -3122.263, 290.908, 3.787364,      0, 0, 0, 1,      120, 255, 1), -- 190550 (Area: 0)
(@OGUID+22, 190550, 571, 1, 1, 4774.604, -3146.782, 293.9535, 4.886922,     0, 0, 0, 1,      120, 255, 1); -- 190550 (Area: 0)

-- [Quest][Zul'Drak] Cocooned! -- http://www.wowhead.com/quest=12606/cocooned
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_nerubian_cocoon', `unit_flags` = 4, `flags_extra` = 66 WHERE `entry` =28413;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 28413 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE  `entryorguid`=2841300 AND `source_type`=9;

-- Chicken -- http://wotlk.openwow.com/npc=620
DELETE FROM `creature_text` WHERE `entry`=620;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`, `BroadcastTextId`) VALUES 
(620, 0, 0, '%s looks up at you quizzically. Maybe you should inspect it?', 16, 0, 100, 0, 0, 0, 0, 'cluck EMOTE_A_HELLO', 4714),
(620, 1, 0, '%s looks at you unexpectadly.', 16, 0, 100, 0, 0, 0, 0, 'cluck EMOTE_H_HELLO', 0),
(620, 2, 0, '%s starts pecking at the feed.', 16, 0, 100, 0, 0, 0, 0, 'cluck EMOTE_CLUCK_TEXT2', 0);

-- [Quest][ZulDrak] Throwing Down -- http://wotlk.openwow.com/quest=12598
-- Nethurbian Crater KC Bunny SAI
UPDATE `creature` SET `phaseMask`=65535 WHERE  `id`=28352;
SET @ENTRY := 28352;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,51381,0,180000,180000,33,28352,0,0,0,0,0,7,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Spellhit 'Toss Grenade' - Quest Credit 'Nethurbian Crater'"),
(@ENTRY,0,1,0,61,0,100,0,51381,0,180000,180000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Spellhit 'Toss Grenade' - Run Script");

-- Add Conditions to decrease castrange of Toss Grenade (should be around 9 yards to the dummy)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=51381;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,51381,0,0,29,0,28352,9,0,0,0,0,"","Cast Toss Grenade only in 9 yards range to Nethurbian Crater KC Bunny");

-- Actionlist SAI
SET @ENTRY := 2835200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,11,44762,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Camera Shake - Med'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,75,48456,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Add Aura 'Shredder Smoke'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,11,51435,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Cast 'Summon Skimmer'"),
(@ENTRY,9,7,0,0,0,100,0,9000,9000,0,0,28,48456,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Remove Aura 'Shredder Smoke'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,44,2,0,0,0,0,0,20,190555,2,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Phase 2"),
(@ENTRY,9,9,0,0,0,100,0,167000,167000,0,0,44,1,0,0,0,0,0,20,190555,2,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Phase 1"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nethurbian Crater KC Bunny - On Script - Set Active Off");

-- decrease spellfocus range
UPDATE `gameobject_template` SET `Data1`=10 WHERE  `entry`=190555;

-- Toss Grenade should ignore LOS
DELETE FROM `disables` WHERE `entry`=51381 AND `flags`=64;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(0, 51381, 64, '', '', 'Ignore LOS for Toss Grenade');

-- Remove static spawned Burning Skimmer
DELETE FROM `creature` WHERE `id`=28369;

-- Burning Skimmer SAI
SET @ENTRY := 28369;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,63,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Despawn In 10000 ms"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,11,40148,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Cast 'Immolation'"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Start Random Movement"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,208,1.5,1.5,0,0,0,0,1,0,0,0,0,0,0,0,"Burning Skimmer - On Just Created - Set Speed Walk & Run 1.5");

-- [Quest Item][WoTLK][Zul'Drak] Unliving Choker -- http://www.wowhead.com/item=38660/unliving-choker
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=1 AND `SourceGroup`=28519 AND `SourceEntry`=38660;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(1, 28519, 38660, 0, 0, 9, 0, 12238, 0, 0, 0, 0, 0, '', 'show itemloot if player has quest Cleansing Drak\'Tharon taken'),
(1, 28519, 38660, 0, 1, 28, 0, 12238, 0, 0, 0, 0, 0, '', 'show itemloot if player has quest Cleansing Drak\'Tharon completed'),
(1, 28519, 38660, 0, 2, 14, 0, 12238, 0, 0, 0, 0, 0, '', 'show itemloot if player has quest Cleansing Drak\'Tharon none');

-- Quest: The Thunderspike -- http://wotlk.openwow.com/quest=10526
DELETE FROM `event_scripts` WHERE `id`=13685;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES 
(13685, 0, 10, 21319, 90000, 0, 1314.47, 6687.27, -18.28, 0.27);
UPDATE `gameobject_template` SET `data3`=5000 WHERE `entry`=184729;

-- Gor Grimgut SAI
SET @ENTRY := 21319;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,2,37,0,100,1,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor Grimgut - On Initialize - Set Flags Immune To Players & Immune To NPC's (No Repeat)"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor Grimgut - On Initialize - Set Reactstate Passive (No Repeat)"),
(@ENTRY,0,3,4,60,0,100,1,3000,3000,0,0,66,0,0,0,0,0,0,20,184729,10,0,0,0,0,0,"Gor Grimgut - On Update - Set Orientation Closest Gameobject 'The Thunderspike' (No Repeat)"),
(@ENTRY,0,4,0,61,0,100,0,3000,3000,0,0,1,0,4000,0,0,0,0,21,30,0,0,0,0,0,0,"Gor Grimgut - On Update - Say Line 0 (No Repeat)"),
(@ENTRY,0,5,0,60,0,100,1,5500,5500,0,0,71,0,1,30440,0,0,0,1,0,0,0,0,0,0,0,"Gor Grimgut - On Update - Change Equipment (No Repeat)"),
(@ENTRY,0,6,7,60,0,100,1,7000,7000,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor Grimgut - On Update - Remove Flags Immune To Players & Immune To NPC's (No Repeat)"),
(@ENTRY,0,7,8,61,0,100,0,7000,7000,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor Grimgut - On Update - Set Reactstate Aggressive (No Repeat)"),
(@ENTRY,0,8,9,61,0,100,0,7000,7000,0,0,49,0,0,0,0,0,0,21,30,0,0,0,0,0,0,"Gor Grimgut - On Update - Start Attacking (No Repeat)"),
(@ENTRY,0,9,10,61,0,100,0,7000,7000,0,0,1,1,6000,0,0,0,0,21,30,0,0,0,0,0,0,"Gor Grimgut - On Update - Say Line 1 (No Repeat)"),
(@ENTRY,0,10,0,61,0,100,0,7000,7000,0,0,45,1,1,0,0,0,0,13,184737,0,50,0,0,0,0,"Gor Grimgut - On Update - Set Data 1 1 (No Repeat)"),
(@ENTRY,0,11,0,7,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gor Grimgut - On Evade - Despawn In 2000 ms"),
(@ENTRY,0,12,0,0,0,100,0,3000,5000,7000,10000,75,35492,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gor Grimgut - In Combat - Add Aura 'Exhaustion'"),
(@ENTRY,0,13,0,0,0,100,0,10000,12000,12000,15000,11,35491,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gor Grimgut - In Combat - Cast 'Furious Rage'");

-- The Thunderspike SAI
SET @ENTRY := 184737;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,38,0,100,0,1,1,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"The Thunderspike - On Data Set 1 1 - Run Script");

-- Actionlist SAI
SET @ENTRY := 18473700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Thunderspike - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Thunderspike - On Script - Set Phase 2"),
(@ENTRY,9,2,0,0,0,100,0,120000,120000,0,0,44,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Thunderspike - On Script - Set Phase 1");

UPDATE `gameobject` SET `spawntimesecs` = 120 WHERE `id` IN (184729,184737);

DELETE FROM `creature_text` WHERE `entry` IN (21319);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(21319, 0, 0, 'Puny $r cannot lift spear.  Gor lift spear!', 12, 0, 100, 0, 0, 0, 18980, 0, 'Gor Grimgut'),
(21319, 1, 0, 'Hah!  The Thunderspike is mine.  Die!', 12, 0, 100, 0, 0, 0, 18979, 0, 'Gor Grimgut');


-- [NPC][Classic] Demetria - missing guards - update path
SET @CGUID := 5004778;
DELETE FROM `creature` WHERE `id` IN (12352, 12339);
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID + 0 AND @CGUID + 9;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID + 0, 12352, 0, 0, 0, 1, 1, 0, 0, 1640.14,-5467.21,97.83,1.15839, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 1, 12352, 0, 0, 0, 1, 1, 0, 0, 1638.76,-5466.3,97.7965,1.15839, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 2, 12352, 0, 0, 0, 1, 1, 0, 0, 1636.83,-5467.03,98.3487,1.37436, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 3, 12352, 0, 0, 0, 1, 1, 0, 0, 1640.8,-5468.42,98.0504,1.24477, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 4, 12352, 0, 0, 0, 1, 1, 0, 0, 1640.3,-5469.83,98.5054,1.0414, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 5, 12352, 0, 0, 0, 1, 1, 0, 0, 1636.94,-5468.06,98.5386,0.927513, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 6, 12352, 0, 0, 0, 1, 1, 0, 0, 1639.53,-5470.85,98.8409,1.12386, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 7, 12352, 0, 0, 0, 1, 1, 0, 0, 1637.89,-5470.61,98.9737,1.10815, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 8, 12352, 0, 0, 0, 1, 1, 0, 0, 1636.58,-5469.1,98.8369,1.09245, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420),
(@CGUID + 9, 12339, 0, 0, 0, 1, 1, 0, 0, 1638.35,-5469.5,98.6581,1.26412, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420);

-- add guard linking
DELETE FROM `creature_formations` WHERE `leaderGUID`=@CGUID+9;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(@CGUID+9, @CGUID+9, 0, 0, 7, 0, 0),
(@CGUID+9, @CGUID + 0, 3, 360, 7, 0, 0),
(@CGUID+9, @CGUID + 1, 3, 320, 7, 0, 0),
(@CGUID+9, @CGUID + 2, 3, 280, 7, 0, 0),
(@CGUID+9, @CGUID + 3, 3, 240, 7, 0, 0),
(@CGUID+9, @CGUID + 4, 3, 200, 7, 0, 0),
(@CGUID+9, @CGUID + 5, 3, 160, 7, 0, 0),
(@CGUID+9, @CGUID + 6, 3, 120, 7, 0, 0),
(@CGUID+9, @CGUID + 7, 3, 80, 7, 0, 0),
(@CGUID+9, @CGUID + 8, 3, 40, 7, 0, 0);

DELETE FROM `creature_template_addon` WHERE  `entry`=12339;
DELETE FROM `waypoint_data` WHERE  `id`=12339;

-- Demetria <The Scarlet Oracle>
UPDATE `creature_template` SET `Speed_Walk` = 1 WHERE `entry`  IN (12339, 12352);
SET @NPC := @CGUID + 9;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`, `action_chance`) VALUES
(@PATH,1,1638.35,-5469.5,98.6581,0,0,100),
(@PATH,2,1645.41,-5450.02,92.1866,0,0,100),
(@PATH,3,1652.78,-5430.76,84.4578,0,0,100),
(@PATH,4,1657.93,-5416.62,79.8772,0,0,100),
(@PATH,5,1661.83,-5406.66,76.2934,0,0,100),
(@PATH,6,1669.8,-5383.78,73.6196,0,0,100),
(@PATH,7,1677.99,-5358.84,73.6117,0,0,100),
(@PATH,8,1695.25,-5350.09,73.6118,0,0,100),
(@PATH,9,1687.04,-5321.94,73.6112,0,0,100),
(@PATH,10,1688.58,-5304.51,73.6112,0,0,100),
(@PATH,11,1691,-5283.65,73.6122,0,0,100),
(@PATH,12,1691.91,-5262.08,73.6113,0,0,100),
(@PATH,13,1692.66,-5241.1,73.6185,0,0,100),
(@PATH,14,1692.85,-5206.13,74.6546,0,0,100),
(@PATH,15,1690.64,-5185.28,73.9301,0,0,100),
(@PATH,16,1688.08,-5167.96,73.9937,0,0,100),
(@PATH,17,1690.38,-5149.03,74.0396,0,0,100),
(@PATH,18,1697.51,-5118.86,73.6245,0,0,100),
(@PATH,19,1704.67,-5099.13,74.6873,0,0,100),
(@PATH,20,1711.01,-5080.54,77.301,0,0,100),
(@PATH,21,1718.55,-5057.22,80.1628,0,0,100),
(@PATH,22,1730.24,-5032.73,80.6236,0,0,100),
(@PATH,23,1742.91,-5011.79,79.9012,0,0,100),
(@PATH,24,1754.95,-4994.6,80.643,0,0,100),
(@PATH,25,1766.67,-4977.18,81.2274,0,0,100),
(@PATH,26,1773.03,-4950.42,81.449,0,0,100),
(@PATH,27,1777.47,-4922.77,81.5212,0,0,100),
(@PATH,28,1782.09,-4902.3,84.2517,0,0,100),
(@PATH,29,1788.34,-4877.56,87.4965,0,0,100),
(@PATH,30,1796.57,-4845.8,89.4469,0,0,100),
(@PATH,31,1809.45,-4798.58,91.0304,0,0,100),
(@PATH,32,1816.93,-4777.84,90.0115,0,0,100),
(@PATH,33,1831.75,-4734.83,90.0915,0,0,100),
(@PATH,34,1862.63,-4701.05,93.0158,0,0,100),
(@PATH,35,1889.08,-4684.05,92.355,0,0,100),
(@PATH,36,1910.74,-4672.59,91.1087,0,0,100),
(@PATH,37,1927.94,-4658.95,87.5957,0,0,100),
(@PATH,38,1935.76,-4647.33,84.3063,0,0,100),
(@PATH,39,1944.66,-4632.27,79.9795,0,0,100),
(@PATH,40,1954.98,-4609.24,74.7545,0,0,100),
(@PATH,41,1958.16,-4599.23,73.7161,0,0,100),
(@PATH,42,1968.46,-4572.57,73.6229,0,0,100),
(@PATH,43,1979.44,-4555.29,73.6229,0,0,100),
(@PATH,44,1984,-4549.99,73.6229,0,0,100),
(@PATH,45,1996.94,-4538.24,73.6229,0,0,100),
(@PATH,46,2005.36,-4531.97,73.6229,0,0,100),
(@PATH,47,2016.76,-4523.84,73.6213,0,0,100),
(@PATH,48,2027.83,-4517.97,73.6213,0,0,100),
(@PATH,49,2045.28,-4518.38,73.6213,0,0,100),
(@PATH,50,2061.31,-4534.8,73.6213,0,0,100),
(@PATH,51,2086.08,-4561.88,73.6213,0,0,100),
(@PATH,52,2105.32,-4580.45,73.6238,0,0,100),
(@PATH,53,2121.3,-4594.16,73.6238,0,0,100),
(@PATH,54,2146.73,-4612.71,73.6218,0,0,100),
(@PATH,55,2177.86,-4627.43,73.6067,0,0,100),
(@PATH,56,2197.77,-4633.93,73.6226,0,0,100),
(@PATH,57,2219.97,-4633.96,73.6226,0,0,100),
(@PATH,58,2250.74,-4627.66,73.6226,0,0,100),
(@PATH,59,2274.12,-4620.36,73.6226,0,0,100),
(@PATH,60,2304.25,-4611.22,73.6227,0,0,100),
(@PATH,61,2338.64,-4604.74,73.6227,0,0,100),
(@PATH,62,2389.36,-4603.99,73.6227,0,0,100),
(@PATH,63,2457.27,-4631.39,74.092,0,0,100),
(@PATH,64,2493.9,-4652.17,75.2848,0,0,100),
(@PATH,65,2535.82,-4654.52,77.3071,0,0,100),
(@PATH,66,2567.1,-4644.61,79.4072,0,0,100),
(@PATH,67,2594.36,-4628.84,81.876,0,0,100),
(@PATH,68,2617.07,-4615.06,84.1387,0,0,100),
(@PATH,69,2689.76,-4571.94,87.2045,0,0,100),
(@PATH,70,2745.8,-4539.07,88.764,0,0,100),
(@PATH,71,2839.33,-4436.83,89.7157,0,0,100),
(@PATH,72,2880.41,-4361.54,90.2576,0,0,100),
(@PATH,73,2923.76,-4110.16,96.3698,0,0,100),
(@PATH,74,2947.2,-4033.15,99.8002,0,0,100),
(@PATH,75,2968.64,-3982.02,104.423,0,0,100),
(@PATH,76,2976.9,-3964.26,107.058,0,0,100),
(@PATH,77,2983.54,-3937.96,111.717,0,0,100),
(@PATH,78,3000.21,-3877.74,118.93,0,0,100),
(@PATH,79,3011.92,-3842.22,119.306,0,0,100),
(@PATH,80,3021.88,-3813.28,118.955,0,0,100),
(@PATH,81,3028.71,-3797.17,120.17,0,0,100),
(@PATH,82,3042.19,-3764.47,119.971,0,0,100),
(@PATH,83,3057.23,-3724.98,119.568,0,0,100),
(@PATH,84,3062.31,-3690.16,121.125,0,0,100),
(@PATH,85,3048.16,-3659.65,122.811,0,0,100),
(@PATH,86,3041.49,-3641.07,125.02,0,0,100),
(@PATH,87,3039.91,-3617.72,123.977,0,0,100),
(@PATH,88,3040.67,-3597.35,124.377,0,0,100),
(@PATH,89,3042.45,-3556.22,126.571,0,0,100),
(@PATH,90,3046.02,-3530.23,129.898,0,0,100),
(@PATH,91,3057.06,-3493.26,131.601,0,0,100),
(@PATH,92,3076.38,-3462.24,134.709,0,0,100),
(@PATH,93,3086.02,-3451.18,136,0,0,100),
(@PATH,94,3097.45,-3438.57,136.842,0,0,100),
(@PATH,95,3133.22,-3404.77,139.345,0,0,100),
(@PATH,96,3150.28,-3401.16,140.105,0,0,100),
(@PATH,97,3172.46,-3393.09,142.015,0,0,100),
(@PATH,98,3191.09,-3389.1,143.607,0,0,100),
(@PATH,99,3210.72,-3387.02,144.24,0,0,100),
(@PATH,100,3250.95,-3382.95,143.581,0,0,100),
(@PATH,101,3269.06,-3382.33,143.195,0,0,100),
(@PATH,102,3286.95,-3382.42,142.377,0,0,100),
(@PATH,103,3307.89,-3382.95,144.951,0,0,100),
(@PATH,104,3329.2,-3382.28,144.845,0,0,100),
(@PATH,105,3347.55,-3381.64,144.779,0,0,100),
(@PATH,106,3361.09,-3380.75,144.781,0,0,100),
(@PATH,107,3339.81,-3380.58,144.774,0,0,100),
(@PATH,108,3311.44,-3380.27,145.017,0,0,100),
(@PATH,109,3296.01,-3380.1,143.741,0,0,100),
(@PATH,110,3274.59,-3380.86,142.727,0,0,100),
(@PATH,111,3274.59,-3380.86,142.727,0,0,100),
(@PATH,112,3251.44,-3382.31,143.585,0,0,100),
(@PATH,113,3217.38,-3385.87,144.301,0,0,100),
(@PATH,114,3189.08,-3389.3,143.545,0,0,100),
(@PATH,115,3168.36,-3392.69,141.758,0,0,100),
(@PATH,116,3128.73,-3405.3,139.154,0,0,100),
(@PATH,117,3104.29,-3429.73,137.697,0,0,100),
(@PATH,118,3079.44,-3458.29,135.39,0,0,100),
(@PATH,119,3062.03,-3484.05,132.59,0,0,100),
(@PATH,120,3051.15,-3508.73,131.122,0,0,100),
(@PATH,121,3044.5,-3543.07,128.53,0,0,100),
(@PATH,122,3040.58,-3585.59,124.369,0,0,100),
(@PATH,123,3040.05,-3618.85,124.055,0,0,100),
(@PATH,124,3041.87,-3636.23,125.378,0,0,100),
(@PATH,125,3048.01,-3656.25,122.83,0,0,100),
(@PATH,126,3059.89,-3685.41,121.254,0,0,100),
(@PATH,127,3063.62,-3704.59,120.885,0,0,100),
(@PATH,128,3049.97,-3743.53,120.437,0,0,100),
(@PATH,129,3038.77,-3773.26,119.728,0,0,100),
(@PATH,130,3029.37,-3797.56,120.123,0,0,100),
(@PATH,131,3017.78,-3822.93,118.882,0,0,100),
(@PATH,132,3011.9,-3841.29,119.307,0,0,100),
(@PATH,133,2999.1,-3881.4,118.595,0,0,100),
(@PATH,134,2992.82,-3899.77,116.742,0,0,100),
(@PATH,135,2987.35,-3919.01,114.686,0,0,100),
(@PATH,136,2979.54,-3951.23,108.575,0,0,100),
(@PATH,137,2974.35,-3965.01,106.582,0,0,100),
(@PATH,138,2965.39,-3989.01,103.564,0,0,100),
(@PATH,139,2947.58,-4032.49,99.8551,0,0,100),
(@PATH,140,2940.68,-4050.84,98.8149,0,0,100),
(@PATH,141,2927.47,-4095.16,96.9418,0,0,100),
(@PATH,142,2922.28,-4117.41,96.1034,0,0,100),
(@PATH,143,2916.91,-4141.33,95.1063,0,0,100),
(@PATH,144,2912.33,-4161.43,94.1942,0,0,100),
(@PATH,145,2906.67,-4194.05,92.8009,0,0,100),
(@PATH,146,2902.22,-4224.72,91.8676,0,0,100),
(@PATH,147,2898.62,-4254.12,91.3725,0,0,100),
(@PATH,148,2896.84,-4270.08,91.1643,0,0,100),
(@PATH,149,2892.88,-4300.96,90.6728,0,0,100),
(@PATH,150,2882.86,-4347.85,90.3236,0,0,100),
(@PATH,151,2875.88,-4369.2,90.0259,0,0,100),
(@PATH,152,2866.06,-4388.72,89.6369,0,0,100),
(@PATH,153,2855.15,-4407.04,89.3003,0,0,100),
(@PATH,154,2844.51,-4424.87,89.4741,0,0,100),
(@PATH,155,2835.01,-4439.19,89.6752,0,0,100),
(@PATH,156,2825.9,-4452.37,89.8312,0,0,100),
(@PATH,157,2781.37,-4503.54,89.6992,0,0,100),
(@PATH,158,2768.3,-4516.57,89.4068,0,0,100),
(@PATH,159,2751.64,-4531.98,88.9045,0,0,100),
(@PATH,160,2738.52,-4542.49,88.4996,0,0,100),
(@PATH,161,2714.09,-4557.62,87.6424,0,0,100),
(@PATH,162,2699.67,-4566.29,87.4294,0,0,100),
(@PATH,163,2684.52,-4575.58,87.001,0,0,100),
(@PATH,164,2667.22,-4586.17,85.7211,0,0,100),
(@PATH,165,2630.76,-4606.45,84.5909,0,0,100),
(@PATH,166,2618.07,-4614.37,84.1965,0,0,100),
(@PATH,167,2592.51,-4629.78,81.6831,0,0,100),
(@PATH,168,2570.53,-4643.56,79.6884,0,0,100),
(@PATH,169,2558.75,-4648.16,78.7332,0,0,100),
(@PATH,170,2544.22,-4651.95,77.8191,0,0,100),
(@PATH,171,2528.11,-4654.63,76.8986,0,0,100),
(@PATH,172,2511.76,-4655.66,76.0362,0,0,100),
(@PATH,173,2487.63,-4647.41,75.1608,0,0,100),
(@PATH,174,2467.38,-4636.04,74.6576,0,0,100),
(@PATH,175,2453.17,-4627.91,73.6226,0,0,100),
(@PATH,176,2437.83,-4620.44,73.6179,0,0,100),
(@PATH,177,2425.09,-4614.63,73.613,0,0,100),
(@PATH,178,2401.34,-4604.92,73.6229,0,0,100),
(@PATH,179,2367.28,-4602.14,73.6229,0,0,100),
(@PATH,180,2348.43,-4603.85,73.6229,0,0,100),
(@PATH,181,2312.07,-4610.25,73.6226,0,0,100),
(@PATH,182,2289.67,-4616.1,73.6237,0,0,100),
(@PATH,183,2270.18,-4621.81,73.6232,0,0,100),
(@PATH,184,2237.91,-4633.07,73.623,0,0,100),
(@PATH,185,2211.17,-4636.19,73.623,0,0,100),
(@PATH,186,2185.27,-4631.85,73.6238,0,0,100),
(@PATH,187,2161.67,-4621.89,73.6227,0,0,100),
(@PATH,188,2149.52,-4615.7,73.6227,0,0,100),
(@PATH,189,2128.18,-4600.53,73.6227,0,0,100),
(@PATH,190,2110.23,-4586.01,73.6227,0,0,100),
(@PATH,191,2094.4,-4570.16,73.6232,0,0,100),
(@PATH,192,2059.78,-4531.27,73.6232,0,0,100),
(@PATH,193,2025.92,-4515.28,73.6218,0,0,100),
(@PATH,194,1981.81,-4549.69,73.6228,0,0,100),
(@PATH,195,1968.69,-4574.04,73.6228,0,0,100),
(@PATH,196,1957.36,-4608.7,74.4979,0,0,100),
(@PATH,197,1948.95,-4627.72,78.4405,0,0,100),
(@PATH,198,1940.18,-4642.16,82.8813,0,0,100),
(@PATH,199,1932.32,-4651.64,85.6817,0,0,100),
(@PATH,200,1923.41,-4662.78,88.4994,0,0,100),
(@PATH,201,1912.89,-4671.55,90.7472,0,0,100),
(@PATH,202,1904.98,-4676.2,91.9429,0,0,100),
(@PATH,203,1880.51,-4687.26,92.3027,0,0,100),
(@PATH,204,1854.01,-4707.87,93.1035,0,0,100),
(@PATH,205,1840.53,-4719.99,92.1716,0,0,100),
(@PATH,206,1833.29,-4732.42,90.4734,0,0,100),
(@PATH,207,1825.75,-4748.92,88.8841,0,0,100),
(@PATH,208,1822.27,-4758.66,89.1826,0,0,100),
(@PATH,209,1817.98,-4771.4,89.7992,0,0,100),
(@PATH,210,1813.98,-4783.45,90.3784,0,0,100),
(@PATH,211,1810.56,-4794.25,91.0151,0,0,100),
(@PATH,212,1805.81,-4811.34,90.581,0,0,100),
(@PATH,213,1801.15,-4827.95,90.0279,0,0,100),
(@PATH,214,1791.34,-4861.33,88.9552,0,0,100),
(@PATH,215,1787.86,-4875.91,87.5166,0,0,100),
(@PATH,216,1780.76,-4905.48,84.0821,0,0,100),
(@PATH,217,1776.19,-4928.71,81.4626,0,0,100),
(@PATH,218,1774.3,-4938.49,81.4626,0,0,100),
(@PATH,219,1771.16,-4965.22,81.2126,0,0,100),
(@PATH,220,1757.6,-4990.9,80.8461,0,0,100),
(@PATH,221,1748.01,-5004.46,79.9039,0,0,100),
(@PATH,222,1738.94,-5016.73,79.9039,0,0,100),
(@PATH,223,1730.81,-5028.28,80.3151,0,0,100),
(@PATH,224,1720.51,-5053.17,80.4197,0,0,100),
(@PATH,225,1713.61,-5072.05,78.6081,0,0,100),
(@PATH,226,1704.71,-5094.96,75.245,0,0,100),
(@PATH,227,1692.75,-5131.78,73.8809,0,0,100),
(@PATH,228,1689.73,-5148.36,74.0206,0,0,100),
(@PATH,229,1688.35,-5178.24,73.7731,0,0,100),
(@PATH,230,1692.81,-5201.48,74.6409,0,0,100),
(@PATH,231,1690.74,-5274.98,73.6232,0,0,100),
(@PATH,232,1687.05,-5306.95,73.6112,0,0,100),
(@PATH,233,1686.21,-5322.85,73.6114,0,0,100),
(@PATH,234,1688.3,-5343.87,74.2449,0,0,100),
(@PATH,235,1672.16,-5377.38,73.6118,0,0,100),
(@PATH,236,1667.54,-5388.89,73.6137,0,0,100),
(@PATH,237,1664.18,-5398.35,74.3809,0,0,100),
(@PATH,238,1659.56,-5411.51,78.0987,0,0,100),
(@PATH,239,1657.63,-5416.96,80.0233,0,0,100),
(@PATH,240,1654.7,-5425.03,82.2941,0,0,100),
(@PATH,241,1652.04,-5432.05,84.9364,0,0,100),
(@PATH,242,1649.05,-5439.55,87.5085,0,0,100),
(@PATH,243,1646.61,-5446.01,90.2014,0,0,100),
(@PATH,244,1644.44,-5452.14,93.1195,0,0,100),
(@PATH,245,1641.84,-5459.95,95.4057,0,0,100),
(@PATH,246,1639.43,-5466.45,97.7334,0,0,100),
(@PATH,247,1635.2,-5476.15,100.195,0,0,100),
(@PATH,248,1631.56,-5485.27,100.73,0,0,100),
(@PATH,249,1627.96,-5493.81,100.73,0,0,100),
(@PATH,250,1623.74,-5501.82,102.308,0,0,100),
(@PATH,251,1621.54,-5506.67,104.154,0,0,100),
(@PATH,252,1619.31,-5510.5,105.706,0,0,100),
(@PATH,253,1617.2,-5514.39,107.478,0,0,100),
(@PATH,254,1615.11,-5518.38,108.951,0,0,100),
(@PATH,255,1613.27,-5521.97,110.422,0,0,100),
(@PATH,256,1610.31,-5527.82,111.163,0,0,100),
(@PATH,257,1606.59,-5535.3,111.171,0,0,100),
(@PATH,258,1596.95,-5537.16,111.171,0,0,100),
(@PATH,259,1591.5,-5546.99,111.171,0,0,100),
(@PATH,260,1594.64,-5559.12,111.171,0,0,100),
(@PATH,261,1587.05,-5573.4,111.171,0,0,100),
(@PATH,262,1576.47,-5592.38,111.171,0,0,100),
(@PATH,263,1569.09,-5606.81,114.19,5000,0,100);


-- [Quest][GrizzlyHills]Life or Death/Kick 'EM While They are Down - Wounded Skirmisher +Wounded Westfall Infantry
SET @cguid:=5005372;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+11;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+0, 27463, 571, 0, 0, 1, 1, 0, 0, 4203.006, -3047.501, 281.2304, 4.415683, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+1, 27482, 571, 0, 0, 1, 1, 0, 0, 4184.69, -2980.583, 284.83, 3.543018, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27482 (Area: -1)
(@CGUID+2, 27457, 571, 0, 0, 1, 1, 0, 0, 4137.022, -3007.063, 285.8553, 5.51524, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27457 (Area: -1) (Auras: 29266 - 29266)
(@CGUID+3, 27481, 571, 0, 0, 1, 1, 0, 0, 4141.247, -3012.803, 285.4366, 0.2443461, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27481 (Area: -1) (Auras: 29266 - 29266)
(@CGUID+4, 27463, 571, 0, 0, 1, 1, 0, 0, 4166.682, -2964.984, 283.2789, 2.740167, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+5, 27482, 571, 0, 0, 1, 1, 0, 0, 4206.615, -3002.458, 282.8639, 3.176499, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27482 (Area: -1)
(@CGUID+6, 27482, 571, 0, 0, 1, 1, 0, 0, 4180.862, -3014.165, 280.0445, 5.497787, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27482 (Area: -1)
(@CGUID+7, 27463, 571, 0, 0, 1, 1, 0, 0, 4139.789, -3021.132, 285.5673, 5.899213, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+8, 27482, 571, 0, 0, 1, 1, 0, 0, 4147.580, -2955.251, 283.479, 5.757801, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+9, 27482, 571, 0, 0, 1, 1, 0, 0, 4140.755, -3006.965, 285.378, 4.524723, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+10, 27482, 571, 0, 0, 1, 1, 0, 0, 4201.036, -2985.048, 283.169, 0.860837, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420), -- 27463 (Area: -1)
(@CGUID+11, 27482, 571, 0, 0, 1, 1, 0, 0, 4128.313, -2937.812, 281.963, 0.605581, 300, 0, 0, 1, 0, 0, 0, 0, 0, 23420); -- 27463 (Area: -1)

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+11;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102453 AND 102457;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102459 AND 102463;
DELETE FROM `creature_addon` WHERE `guid` IN (102466, 102467, 102469);
DELETE FROM `creature_addon` WHERE `guid` IN (104181, 104182, 104184, 104185);
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 104187 AND 104189;

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102034 AND 102038;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102041 AND 102047;

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 103956 AND 103960;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 103972 AND 103978;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 103984 AND 103987;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(102034, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102035, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102036, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102037, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102038, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102041, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102042, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102043, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102044, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102045, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102046, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(102047, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103956, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103957, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103958, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103959, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103960, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103972, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103973, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103974, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103975, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103976, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103977, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103978, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103984, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103985, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103986, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(103987, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(@CGUID+0, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+1, 0, 0, 8, 257, 0, ''), -- 27482
(@CGUID+2, 0, 0, 0, 1, 0, '29266'), -- 27457 - 29266 - 29266
(@CGUID+3, 0, 0, 0, 1, 0, '29266'), -- 27481 - 29266 - 29266
(@CGUID+4, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+5, 0, 0, 8, 257, 0, ''), -- 27482
(@CGUID+6, 0, 0, 8, 257, 0, ''), -- 27482
(@CGUID+7, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+8, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+9, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+10, 0, 0, 8, 257, 0, ''), -- 27463
(@CGUID+11, 0, 0, 8, 257, 0, ''), -- 27463
(102453, 0, 0, 8, 257, 0, ''), -- 27463
(102454, 0, 0, 8, 257, 0, ''), -- 27463
(102455, 0, 0, 8, 257, 0, ''), -- 27463
(102456, 0, 0, 8, 257, 0, ''), -- 27463
(102457, 0, 0, 8, 257, 0, ''), -- 27463
(102459, 0, 0, 8, 257, 0, ''), -- 27463
(102460, 0, 0, 8, 257, 0, ''), -- 27463
(102461, 0, 0, 8, 257, 0, ''), -- 27463
(102462, 0, 0, 8, 257, 0, ''), -- 27463
(102463, 0, 0, 8, 257, 0, ''), -- 27463
(102466, 0, 0, 8, 257, 0, ''), -- 27463
(102467, 0, 0, 8, 257, 0, ''), -- 27463
(102469, 0, 0, 8, 257, 0, ''), -- 27463
(104181, 0, 0, 8, 257, 0, ''), -- 27463
(104182, 0, 0, 8, 257, 0, ''), -- 27463
(104184, 0, 0, 8, 257, 0, ''), -- 27463
(104185, 0, 0, 8, 257, 0, ''), -- 27463
(104187, 0, 0, 8, 257, 0, ''), -- 27463
(104188, 0, 0, 8, 257, 0, ''), -- 27463
(104189, 0, 0, 8, 257, 0, '');


DELETE FROM `creature` WHERE `guid` IN (104190, 102458, 102464);
DELETE FROM `creature_addon` WHERE `guid` IN (104190, 102458, 102464);


UPDATE `creature` SET `position_x` = 4018.115 , `position_y` = -2835.341 , `position_z` = 279.326 , `orientation` = 1.795531 WHERE `guid` = 102466; 
UPDATE `creature` SET `position_x` = 4133.794 , `position_y` = -2896.201 , `position_z` = 279.241 , `orientation` = 5.215924 WHERE `guid` = 102457; 
UPDATE `creature` SET `orientation` = 3.488043 WHERE `guid` = 102462; 
UPDATE `creature` SET `orientation` = 2.486658 WHERE `guid` = 102464; 
UPDATE `creature` SET `position_x` = 4190.735 , `position_y` = -2958.304 , `position_z` = 283.319 , `orientation` = 0.719515 WHERE `guid` = 102463; 
UPDATE `creature` SET `position_x` = 4172.601 , `position_y` = -2906.019 , `position_z` = 282.077 , `orientation` = 4.351964 , `spawndist` = 0 , `MovementType` = 0 WHERE `guid` = 104181; 
UPDATE `creature` SET `equipment_id`=1 WHERE  `id` IN (27482, 27463);

-- Add Pooling for Horde and alliance creatures
UPDATE `creature` SET `spawntimesecs`=1 WHERE  `id` IN (27482, 27463);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|64|2 WHERE `entry` IN (27482, 27463);

SET @POOLID := 202484;
DELETE FROM `pool_template` WHERE `entry` = @POOLID;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@POOLID, 8, 'Spawn pool forWounded Westfall Infantry (27482)');

DELETE FROM `pool_creature` WHERE `pool_entry`=202484;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(5005383,  @POOLID, 'Wounded Westfall Infantry'),
(5005382,  @POOLID, 'Wounded Westfall Infantry'),
(104187,   @POOLID, 'Wounded Westfall Infantry'),
(104185,   @POOLID, 'Wounded Westfall Infantry'),
(104184,   @POOLID, 'Wounded Westfall Infantry'),
(104182,   @POOLID, 'Wounded Westfall Infantry'),
(104181,   @POOLID, 'Wounded Westfall Infantry'),
(5005373,  @POOLID, 'Wounded Westfall Infantry'),
(104188,   @POOLID, 'Wounded Westfall Infantry'),
(104189,   @POOLID, 'Wounded Westfall Infantry'),
(5005380,  @POOLID, 'Wounded Westfall Infantry'),
(5005378,  @POOLID, 'Wounded Westfall Infantry'),
(5005377,  @POOLID, 'Wounded Westfall Infantry'),
(5005381,  @POOLID, 'Wounded Westfall Infantry');

SET @POOLID := 202485;
DELETE FROM `pool_template` WHERE `entry` = @POOLID;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(@POOLID, 8, 'Spawn pool for Wounded Skirmisher (27463)');

DELETE FROM `pool_creature` WHERE `pool_entry`=202485;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `description`) VALUES
(102469,  @POOLID, 'Wounded Skirmisher'),
(102467,  @POOLID, 'Wounded Skirmisher'),
(102466,  @POOLID, 'Wounded Skirmisher'),
(102463,  @POOLID, 'Wounded Skirmisher'),
(102462,  @POOLID, 'Wounded Skirmisher'),
(102461,  @POOLID, 'Wounded Skirmisher'),
(102460,  @POOLID, 'Wounded Skirmisher'),
(102459,  @POOLID, 'Wounded Skirmisher'),
(102457,  @POOLID, 'Wounded Skirmisher'),
(102456,  @POOLID, 'Wounded Skirmisher'),
(102455,  @POOLID, 'Wounded Skirmisher'),
(102454,  @POOLID, 'Wounded Skirmisher'),
(102453,  @POOLID, 'Wounded Skirmisher'),
(5005372, @POOLID, 'Wounded Skirmisher'),
(5005379, @POOLID, 'Wounded Skirmisher'),
(5005376, @POOLID, 'Wounded Skirmisher');

-- Wounded Skirmisher SAI
SET @ENTRY := 27463;
UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,48812,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - On Spellhit 'Renew Skirmisher' - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,0,0,3000,3000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Say Line 0 (Phase 1)"),
(@ENTRY,0,2,3,1,1,100,0,2000,2000,2000,2000,53,1,27463,0,12289,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Start Waypoint (Phase 1)"),
(@ENTRY,0,3,4,61,1,100,0,0,0,0,0,18,128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Set Flag Not Attackable (Phase 1)"),
(@ENTRY,0,4,5,61,1,100,0,0,0,0,0,11,48813,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Cast 'Kill Credit' (Phase 1)"),
(@ENTRY,0,5,8,61,1,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Remove Flag Standstate Kneel (Phase 1)"),
(@ENTRY,0,6,0,40,2,100,0,2,27463,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - On Waypoint 2 Reached - Despawn Instant (Phase 2)"),
(@ENTRY,0,7,0,25,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - On Reset - Set Reactstate Defensive"),
(@ENTRY,0,8,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Skirmisher - Out of Combat - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,9,0,0,0,100,0,2000,3000,4000,6000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Skirmisher - In Combat - Cast 'Cleave'"),
(@ENTRY,0,10,0,0,0,100,0,5000,6000,12000,14000,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Skirmisher - In Combat - Cast 'Hamstring'"),
(@ENTRY,0,11,0,0,0,100,0,5000,6000,8000,12000,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Skirmisher - In Combat - Cast 'Mortal Strike'");

-- Wounded Westfall Infantry SAI
SET @ENTRY := 27482;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Spellhit - Set Event Phase 1"),
(@ENTRY,0,1,0,1,1,100,0,0,0,3000,3000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Say Line 0 (Phase 1)"),
(@ENTRY,0,2,3,1,1,100,0,2000,2000,2000,2000,53,1,27482,0,12296,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Start Waypoint (Phase 1)"),
(@ENTRY,0,3,4,61,1,100,0,0,0,0,0,18,128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Set Flag Not Attackable (Phase 1)"),
(@ENTRY,0,4,5,61,1,100,0,0,0,0,0,11,48813,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Cast 'Kill Credit' (Phase 1)"),
(@ENTRY,0,5,8,61,1,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Remove Flag Standstate Kneel (Phase 1)"),
(@ENTRY,0,6,0,40,2,100,0,2,27482,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Waypoint 2 Reached - Despawn Instant (Phase 2)"),
(@ENTRY,0,7,0,25,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Reset - Set Reactstate Defensive"),
(@ENTRY,0,8,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - Out of Combat - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,9,0,4,0,100,0,0,0,0,0,11,29385,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wounded Westfall Infantry - On Aggro - Cast 'Seal of Command'"),
(@ENTRY,0,10,0,0,0,100,0,2000,3000,6000,10000,11,32771,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wounded Westfall Infantry - In Combat - Cast 'Holy Shock'");

DELETE FROM `waypoints` WHERE `entry`=27463;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(27463,1,4105.278809,-2917.963867,280.320129,'Wounded Skirmisher'),
(27463,2,4048.682861,-2936.736572,275.191681,'Wounded Skirmisher');

-- [Quest][Classic] Hilary's Necklace - https://wowgaming.altervista.org/aowow/?quest=3741
-- Nida SAI
SET @ENTRY := 8962;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,3741,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nida - On Quest Reward Hilary''s Necklace - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,8963,5,0,0,0,0,0,"Nida - Script - Target Say 0"), -- Effsee should say with player as target but can't in sai
(@ENTRY*100,9,1,0,0,0,100,0,2000,2000,0,0,1,0,1,0,0,0,0,7,0,0,0,0,0,0,0,"Nida - Script - Say 0"); -- Nida says with player as target
-- Text
DELETE FROM `creature_text` WHERE `entry` IN (8962,8963);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(8962, 0, 0, 'I know how to speak kitty, and Effsee said thank you.', 12, 0, 100, 0, 0, 0, 4628, 'Nida'),
(8963, 0, 0, 'Meow!', 12, 0, 100, 0, 0, 0, 4627, 'Effsee');

-- Quest: The fallen sisters - http://www.wowhead.com/quest=11314/the-fallen-sisters
-- Conditions for spell Lurielle's Pendant
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=49624 AND `ConditionTypeOrReference`=38;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,49624,0,0,38,1,30,4,0,0,0,0,"","Cast Lurielle's Pendant only at targets <= 30 % HP");

-- [Shadowmourne] - Enable 100 % proccchance
DELETE FROM `spell_proc_event` WHERE  `entry`=71903;

-- Quest: Absholutely... Thish Will Work -- http://www.wowhead.com/quest=11330/absholutely-thish-will-work
UPDATE `creature_template` SET `ainame`='SmartAI' WHERE `entry` IN(23842,24284);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(23842,24284) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(23844) AND `source_type`=0 AND `id`=0;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(2428400,2428401,2384200) AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23842,0,0,0,38,0,30,0,1,1,0,0,80,2384200,2,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - On Data Set - Run Script'),
(23842,0,1,0,0,0,100,0,5000,15000,20000,40000,11,48147,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Crazed'),
(23842,0,2,0,0,0,100,1,500,500,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Defensive'),
(23842,0,3,0,0,0,100,0,1000,3000,10400,10400,11,3639,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Improved Blocking'),
(23842,0,4,0,0,0,100,0,2000,5000,10000,21000,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast ShieldBash'),
(23842,0,5,0,0,0,100,0,0,5000,1000,6000,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Westguard Defender - IC - Cast Shoot'),
(24284,0,0,0,8,0,100,0,43386,0,0,0,80,2428400,2,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Spell Hit (Peppys Special Mix) - Run Script'),
(24284,0,1,2,40,0,100,0,1,24284,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP1 - Say Line 0'),
(24284,0,2,0,61,0,100,0,0,0,0,0,54,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP1 - Pause WP'),
(24284,0,3,4,40,0,100,0,9,24284,0,0,11,43401,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP9 - Cast Cosmetic - Blood Explosion Green - Large'),
(24284,0,4,5,61,0,100,0,0,0,0,0,3,0,1145,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP9 - Change displayid to 1145'),
(24284,0,5,0,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - On Reached WP9 - Set Phase 2'),
(24284,0,6,0,1,2,100,1,4000,4000,0,0,80,2428401,2,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - OOC (Phase 2) - Run Script'),
(2384200,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,24288,0,0,0,0,0,0,'Westguard Defender - Script - Face Target'), -- 19:36:43.046
(2384200,9,1,0,0,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Set Bytes 1'), -- 19:36:43.046
(2384200,9,2,0,0,0,100,0,1000,1000,0,0,11,43391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Cast Vomit'), -- 19:36:44.231
(2384200,9,3,0,0,0,100,0,9000,9000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Set Bytes 1'), -- 19:36:53.872
(2384200,9,4,0,0,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Westguard Defender - Script - Evade'), 
(2428401,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99027,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,1,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99023,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,2,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99012,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,3,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99010,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99024,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,5,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,10,99026,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Say'), 
(2428401,9,6,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,9,23842,0,80,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Set Data'), 
(2428401,9,7,0,0,0,100,0,1000,1000,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script 2 - Cast Suicide, No Blood, No Logging'), 
(2428400,9,0,0,0,0,100,0,0,0,0,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Play Emote (OneShotEat)'), -- 19:36:18.195
(2428400,9,1,0,0,0,100,0,0,0,0,0,71,0,0,2200,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Equip item 2200 to Slot 1'), -- 19:36:18.195
(2428400,9,2,0,0,0,100,0,2800,2800,0,0,11,21862,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Cast Radiation'), -- 19:36:20.925
(2428400,9,3,0,0,0,100,0,0,0,0,0,33,24284,0,0,0,0,0,7,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Give Quest Credit'),
(2428400,9,4,0,0,0,100,0,0,0,0,0,71,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - UnEquip item'), -- 19:36:20.925
(2428400,9,5,0,0,0,100,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Remove Bytes 1'), -- 19:36:20.925
(2428400,9,6,0,0,0,100,0,3200,3200,0,0,4,9110,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Play Sound 9110'), -- 19:36:23.421
(2428400,9,7,0,0,0,100,0,0,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Play Emote OneShotBattleRoar'), -- 19:36:23.421
(2428400,9,8,0,0,0,100,0,1200,1200,0,0,53,0,24284,0,0,0,0,1,0,0,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Start WP'), -- 19:36:24.622
(2428400,9,9,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,10,99027,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Say'), -- 19:36:24.622
(2428400,9,10,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,10,99023,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Say'), -- 19:36:24.622
(2428400,9,11,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,10,99012,23842,0,0,0,0,0,'Dragonflayer Vrykul Prisoner - Script - Say'); -- 19:36:24.622


DELETE FROM `waypoints` WHERE `entry`=24284;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(24284, 1, 1366.673, -3179.636, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 2, 1367.06, -3177.925, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 3, 1368.679, -3181.09, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 4, 1367.308, -3179.079, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 5, 1366.374, -3179.791, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 6, 1365.373, -3179.188, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 7, 1365.733, -3179.677, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 8, 1366.468, -3176.728, 153.576, 'Dragonflayer Vrykul Prisoner'),
(24284, 9, 1365.269, -3181.054, 153.576, 'Dragonflayer Vrykul Prisoner');

DELETE FROM `creature_text` WHERE `entry`IN(24284,23842);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `comment`) VALUES
(24284, 0, 0, 'The vrykul clutches at his throat as he begins to gag and thrash about.', 16, 0, 100, 53, 0, 0, 23087, 'Dragonflayer Vrykul Prisoner to Player'),
(23842, 0, 0, 'Uh...?', 12, 7, 100, 1, 0, 0, 23103, 'Westguard Defender to Player'),
(23842, 0, 1, 'Interesting.', 12, 7, 100, 1, 0, 0, 23107, 'Westguard Defender to Player'),
(23842, 0, 2, 'Yikes.', 12, 7, 100, 0, 0, 0, 23104, 'Westguard Defender to Player'),
(23842, 0, 3, 'Is he okay?', 12, 7, 100, 0, 0, 0, 23105, 'Westguard Defender to Player'),
(23842, 0, 4, 'Captain''s not gonna like this.', 12, 7, 100, 0, 0, 0, 23106, 'Westguard Defender to Player'),
(23842, 0, 5, 'Whoa.', 12, 7, 100, 0, 0, 0, 23108, 'Westguard Defender to Player'),
(23842, 1, 0, 'I didn''t know they could do that.', 12, 7, 100, 1, 0, 0, 23096, 'Westguard Defender to Player'),
(23842, 1, 1, 'That''s... special.', 12, 7, 100, 1, 0, 0, 23097, 'Westguard Defender to Player'),
(23842, 1, 2, 'Heh, cool!', 12, 7, 100, 1, 0, 0, 23094, 'Westguard Defender to Player'),
(23842, 1, 3, 'That''s the new Forsaken plague?', 12, 7, 100, 1, 0, 0, 23098, 'Westguard Defender to Player'),
(23842, 1, 4, 'What kind of sicko are you?', 12, 7, 100, 1, 0, 0, 23095, 'Westguard Defender to Player'),
(23842, 1, 5, 'Oh, sick!', 12, 7, 100, 1, 0, 0, 23091, 'Westguard Defender to Player'),
(23842, 1, 6, 'I feel ill.', 12, 7, 100, 1, 0, 0, 23093, 'Westguard Defender to Player'),
(23842, 1, 7, 'That did NOT just happen!', 12, 7, 100, 1, 0, 0, 23092, 'Westguard Defender to Player');

-- The Defias Traitor -- http://wotlk.openwow.com/npc=467
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `guid` = 90214; 
UPDATE `creature_text` SET `language` = 7 WHERE `entry` = 467 AND `groupid` = 3 AND `id` = 1; 

-- The Defias Traitor SAI
SET @ENTRY := 467;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,155,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Quest 'The Defias Traitor' Taken - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,36,467,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Waypoint 36 Reached - Set Run Off"),
(@ENTRY,0,2,0,40,0,100,0,37,467,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Waypoint 37 Reached - Say Line 1"),
(@ENTRY,0,3,0,40,0,100,0,45,467,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Waypoint 45 Reached - Run Script"),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,1,3,0,0,0,0,0,19,0,10,0,0,0,0,0,"The Defias Traitor - On Aggro - Say Line 3"),
(@ENTRY,0,5,0,11,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Respawn - Set Active Off");

-- Actionlist SAI
SET @ENTRY := 46700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,64,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Store Targetlist"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Remove Npc Flag Questgiver"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Set Active On"),
(@ENTRY,9,3,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Say Line 0"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,53,1,467,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Start Waypoint");

-- Actionlist SAI
SET @ENTRY := 46701;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,100,100,0,0,66,0,0,0,0,0,0,12,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Set Orientation stored target"),
(@ENTRY,9,1,0,0,0,100,0,100,100,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Say Line 2"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,15,155,0,0,0,0,0,16,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Quest Credit 'The Defias Traitor'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Defias Traitor - On Script - Despawn In 3000 ms");

UPDATE `creature_template` SET `ScriptName`='npc_the_defias_traitor' WHERE  `entry`=467;

-- Treant Ally SAI
SET @ENTRY := 5806;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,63,0,100,0,0,0,0,0,89,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Treant Ally - On Just Created - Start Random Movement"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,39,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Treant Ally - On Aggro - Call For Help");

-- Son of Cenarius SAI
SET @ENTRY := 4057;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,12,5806,6,60000,0,0,0,1,0,0,0,0,0,0,0,"Son of Cenarius - On Reset - Summon Creature 'Treant Ally'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,39,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Son of Cenarius - On Aggro - Call For Help");

-- Highland Mustang
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE  `id`=26472;
DELETE FROM `creature_formations` WHERE `leaderguid` IN (105236, 105244, 105249, 105250, 105251, 105253, 105254, 105255, 105256, 105257, 105258, 105259, 105260, 105261, 105262, 105263, 105264, 105265, 105266, 105267, 105268, 105269, 105270, 105271, 105272, 105273, 105274, 105275, 105276, 105281, 105282, 105283, 105284, 105285, 105286, 105287, 105288, 105289, 105290, 105291, 105292, 105293, 105294, 105295, 105296, 105297, 105298, 105299, 105300, 105301, 105302, 105303, 105304, 105305, 105307, 105308, 105310, 105317, 105319, 105320, 105321, 105322, 105324, 105325, 105326, 105327, 105328, 105329, 105330, 105331, 105332, 105333, 105334, 105335, 105336, 105337, 105338, 105339, 105340, 105341, 105342, 105343, 105344, 105345, 105346, 105347, 105348, 105349, 105350, 105352, 105353);

-- Shoveltusk Ligament -- http://wotlk.openwow.com/item=33611
UPDATE `creature_loot_template` SET `Chance`=45 WHERE `Item`=33611;

-- [Quest][WotlK] The Last of Her Kind
-- Harnessed Icemaw Matriarch SAI
SET @ENTRY := 30468;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,4,0,28,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harnessed Icemaw Matriarch - On Passenger Removed - Despawn Instant");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=29563 AND `SourceEntry`=56795;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 29563, 56795, 0, 0, 9, 0, 12983, 0, 0, 0, 0, 0, '', 'Required quest \'The Last of Her Kind\' active for spellclick');

-- Mangy Nightsaber
UPDATE `creature_template` SET `skinloot` = 1985 WHERE `entry` = 2032;

-- Forsaken Refugee SAI
SET @ENTRY := 31437;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,10,0,50,0,1,20,10000,20000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Forsaken Refugee - Within 1-20 Range Out of Combat LoS - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=31437;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(31437, 0, 0, 'We''ve lost Undercity. Nothing but demons and Putress'' apothecaries left there...', 12, 1, 100, 0, 0, 0, 32226, 'Forsaken Refugee'),
(31437, 0, 1, 'They killed hundreds! We barely escaped with our lives! Help!', 12, 1, 100, 0, 0, 0, 32229, 'Forsaken Refugee'),
(31437, 0, 2, 'The Dark Lady fought off as many as she could, but in the end... I hope she survived. Please help!', 12, 1, 100, 0, 0, 0, 32230, 'Forsaken Refugee'),
(31437, 0, 3, 'You must help! We''re homeless!', 12, 1, 100, 0, 0, 0, 32227, 'Forsaken Refugee'),
(31437, 0, 4, 'Help us! Please!', 12, 1, 100, 0, 0, 0, 32225, 'Forsaken Refugee'),
(31437, 0, 5, 'Could you spare a gold?', 12, 1, 100, 0, 0, 0, 32228, 'Forsaken Refugee');

-- Portal to Stormwind
UPDATE `creature_template` SET `unit_flags`=0x02000000 WHERE  `entry`=31640;

--  Mok'thardin's Enchantment - Gameobject respawn timer
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `guid` = 10121;

-- Zanzil Witch Doctor SAI
SET @ENTRY := 1490;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,0,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,"Zanzil Witch Doctor - In Combat - Cast 'Shadow Bolt'"),
(@ENTRY,0,1,0,0,0,100,0,0,0,10000,11000,11,15038,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zanzil Witch Doctor - In Combat - Cast 'Scorching Totem'");

UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `id` BETWEEN 2891 AND 2893;

-- Bloodscalp Witch Doctor SAI
SET @ENTRY := 660;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,11000,11,8376,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bloodscalp Witch Doctor - In Combat - Cast 'Earthgrab Totem'"),
(@ENTRY,0,1,0,2,0,100,513,0,30,0,0,11,8599,2,0,0,0,0,1,0,0,0,0,0,0,0,"Bloodscalp Witch Doctor - Between 0-30% Health - Cast 'Enrage' (No Repeat)");

-- Venture Co. Strip Miner SAI
SET @ENTRY := 674;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,6000,12000,15000,11,7978,0,0,0,0,0,2,0,0,0,0,0,0,0,"Venture Co. Strip Miner - In Combat - Cast 'Throw Dynamite'");

UPDATE `creature_text` SET `sound` = 0 WHERE `Entry` = 8035 AND `groupid` = 1 AND `id` = 0; 


-- Dark Iron Agent SAI
SET @ENTRY := 6212;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,1000,2000,31000,31000,11,11802,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Agent - In Combat - Cast 'Dark Iron Land Mine' (Normal Dungeon)");


-- Dark Iron Land Mine SAI
SET @ENTRY := 8035;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,3,0,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Just Summoned - Run Script (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,1,2,61,0,100,3,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Just Summoned - Say Line 0 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,2,3,60,0,100,3,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Say Line 1 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,3,6,60,0,100,3,10000,10000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Say Line 2 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,4,5,9,0,100,3,0,9,0,0,11,4043,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dark Iron Land Mine - Within 0-9 Range - Cast 'Detonation' (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,5,0,61,0,100,3,0,9,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - Within 0-9 Range - Despawn Instant (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,6,4,61,0,100,3,10000,10000,0,0,19,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Remove Flag Pacified (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,7,0,60,0,100,3,30000,30000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Update - Despawn Instant (No Repeat) (Normal Dungeon)");

-- Actionlist SAI
SET @ENTRY := 803500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Flag Pacified"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Rooted On"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Land Mine - On Script - Set Active On");

-- Haal'eshi Windwalker SAI
SET @ENTRY := 16966;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,3500,25000,30000,11,32717,1,0,0,0,0,2,0,0,0,0,0,0,0,"Haal'eshi Windwalker - In Combat - Cast 'Hurricane'"),
(@ENTRY,0,1,0,9,0,100,0,0,40,1000,1000,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Haal'eshi Windwalker - Within 0-40 Range - Cast 'Lightning Bolt'");

-- Haal'eshi Talonguard SAI
SET @ENTRY := 16967;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,12000,16000,11,32720,0,0,0,0,0,1,0,0,0,0,0,0,0,"Haal'eshi Talonguard - In Combat - Cast 'Sprint'");

-- Kaliri Swooper SAI
SET @ENTRY := 17053;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,8000,10000,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kaliri Swooper - Within 0-5 Range - Cast 'Swoop'");

-- Kaliri Matriarch SAI
SET @ENTRY := 17035;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,8000,8000,10000,11,32914,0,0,0,0,0,2,0,0,0,0,0,0,0,"Kaliri Matriarch - In Combat - Cast 'Wing Buffet'");


-- Avruu SAI
SET @ENTRY := 17084;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,40,16000,20000,11,16588,1,0,0,0,0,1,0,0,0,0,0,0,0,"Avruu - Between 0-40% Health - Cast 'Dark Mending'"),
(@ENTRY,0,1,0,74,0,100,0,0,40,16000,20000,11,16588,1,0,0,0,0,11,0,40,0,0,0,0,0,"Avruu - On Friendly Between 0-40% Health - Cast 'Dark Mending'"),
(@ENTRY,0,2,0,9,0,100,0,0,5,8000,8000,11,34112,32,0,0,0,0,2,0,0,0,0,0,0,0,"Avruu - Within 0-5 Range - Cast 'Judgement of Darkness'");

-- Winterfall Shaman SAI
SET @ENTRY := 7439;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,"Winterfall Shaman - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,1,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Shaman - Out of Combat - Cast 'Winterfall Firewater'"),
(@ENTRY,0,2,0,1,0,100,0,0,0,60000,60000,11,13585,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Shaman - Out of Combat - Cast 'Lightning Shield'"),
(@ENTRY,0,3,0,16,0,100,0,13585,1,15000,30000,11,13585,33,0,0,0,0,11,0,15,0,0,0,0,0,"Winterfall Shaman - On Friendly Unit Missing Buff 'Lightning Shield' - Cast 'Lightning Shield'"),
(@ENTRY,0,4,0,2,0,100,0,0,40,14000,21000,11,11431,1,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Shaman - Between 0-40% Health - Cast 'Healing Touch'"),
(@ENTRY,0,5,0,74,0,100,0,0,40,15000,18000,11,11431,1,0,0,0,0,11,0,15,0,0,0,0,0,"Winterfall Shaman - On Friendly Between 0-40% Health - Cast 'Healing Touch'");


-- Grizzle Snowpaw SAI
SET @ENTRY := 10199;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,6000,8000,11,15793,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle Snowpaw - Within 0-5 Range - Cast 'Maul'"),
(@ENTRY,0,1,0,9,0,100,0,0,20,10000,12000,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle Snowpaw - Within 0-20 Range - Cast 'Frost Shock'"),
(@ENTRY,0,2,0,0,0,100,0,5000,7000,24000,25000,11,8364,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grizzle Snowpaw - In Combat - Cast 'Blizzard'"),
(@ENTRY,0,3,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Grizzle Snowpaw - Out of Combat - Cast 'Winterfall Firewater'");

-- Winterfall Ursa SAI
SET @ENTRY := 7438;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Ursa - Out of Combat - Cast 'Winterfall Firewater'");

-- Winterfall Den Watcher SAI
SET @ENTRY := 7440;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"Winterfall Den Watcher - Out of Combat - Cast 'Winterfall Firewater'");

-- High Chief Winterfall SAI
SET @ENTRY := 10738;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,6000,8000,11,15793,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Chief Winterfall - Within 0-5 Range - Cast 'Maul'"),
(@ENTRY,0,1,0,9,0,100,0,0,20,10000,12000,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Chief Winterfall - Within 0-20 Range - Cast 'Frost Shock'"),
(@ENTRY,0,2,0,0,0,100,0,5000,7000,24000,25000,11,8364,0,0,0,0,0,2,0,0,0,0,0,0,0,"High Chief Winterfall - In Combat - Cast 'Blizzard'"),
(@ENTRY,0,3,0,1,0,100,0,1000,1000,60000,60000,11,17205,32,0,0,0,0,1,0,0,0,0,0,0,0,"High Chief Winterfall - Out of Combat - Cast 'Winterfall Firewater'");

-- Venomhide Eggs should have the pre-quest Toxic Tolerance.
UPDATE `quest_template_addon` SET `PrevQuestID` = 13850 WHERE `ID` = 13887;

-- Lar'kowi mate should only drop one item.
UPDATE `creature_loot_template` SET `MaxCount` = 1 WHERE `Entry` = 9683 AND `Item` = 11509;

-- Mosh'Ogg Shaman SAI
SET @ENTRY := 679;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2500,4000,5500,6500,11,12058,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,2,0,100,0,0,75,32000,33000,11,6742,1,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - Between 0-75% Health - Cast 'Bloodlust'"),
(@ENTRY,0,2,0,0,0,100,0,0,1000,32000,32000,11,11899,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - In Combat - Cast 'Healing Ward'"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Shaman - On Aggro - Say Line 0"),
(@ENTRY,0,4,0,74,0,100,0,0,75,31000,32000,86,6742,33,1,0,0,0,11,0,15,0,0,0,0,0,"Mosh'Ogg Shaman - On Friendly Between 0-75% Health - Cross Cast 'Bloodlust'");

-- Mosh'Ogg Spellcrafter SAI
SET @ENTRY := 710;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,300000,300000,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,3000,4000,5000,6000,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - In Combat - Cast 'Fireball'"),
(@ENTRY,0,2,0,0,0,100,0,6000,7000,12000,14000,11,11829,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - In Combat - Cast 'Flamestrike'"),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Spellcrafter - On Aggro - Say Line 0");

-- Mosh'Ogg Lord SAI
SET @ENTRY := 680;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,30000,40000,11,9128,32,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Lord - In Combat - Cast 'Battle Shout'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Lord - On Aggro - Say Line 0"),
(@ENTRY,0,2,0,9,0,100,0,0,5,4000,5000,11,7093,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Lord - Within 0-5 Range - Cast 'Intimidation'");

-- Mosh'Ogg Warmonger SAI
SET @ENTRY := 709;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,10000,11000,11,8147,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Warmonger - In Combat - Cast 'Thunderclap'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Warmonger - On Aggro - Say Line 0");

-- Mosh'Ogg Mauler SAI
SET @ENTRY := 678;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,6000,11000,12000,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mosh'Ogg Mauler - In Combat - Cast 'Knockdown'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Mosh'Ogg Mauler - On Aggro - Say Line 0");

-- Mai'Zoth SAI
SET @ENTRY := 818;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,6000,7000,11,8398,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mai'Zoth - In Combat - Cast 'Frostbolt Volley'"),
(@ENTRY,0,1,0,0,0,100,0,0,3000,4000,5000,11,8814,0,0,0,0,0,2,0,0,0,0,0,0,0,"Mai'Zoth - In Combat - Cast 'Flame Spike'");

-- Texts
DELETE FROM `creature_text` WHERE `Entry` IN (679, 678, 709, 680, 710);
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(679,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Shaman'),
(679,0,1,'Me smash! You die!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Shaman'),
(679,0,2,'I\'ll crush you!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Shaman'),
(678,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Mauler'),
(678,0,1,'Me smash! You die!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Mauler'),
(678,0,2,'I\'ll crush you!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Mauler'),
(709,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Warmonger'),
(709,0,1,'Me smash! You die!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Warmonger'),
(709,0,2,'I\'ll crush you!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Warmonger'),
(680,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Lord'),
(680,0,1,'Me smash! You die!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Lord'),
(680,0,2,'I\'ll crush you!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Lord'),
(710,0,0,'Raaar!!! Me smash $r!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Spellcrafter'),
(710,0,1,'Me smash! You die!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Spellcrafter'),
(710,0,2,'I\'ll crush you!',12,0,100,0,4000,0,0,0,'Mosh\'Ogg Spellcrafter');


-- Paths
SET @NPC := 849;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `position_x`=-12378.6, `position_y`=-963.559, `position_z`=15.3825, `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,1,-12378.6,-963.559,15.3825,0,0,0,0,100,0),
(@PATH,2,-12389.1,-960.663,19.123,0,0,0,0,100,0),
(@PATH,3,-12402,-953.174,24.9704,0,0,0,0,100,0),
(@PATH,4,-12410.9,-950.4,28.0988,0,0,0,0,100,0),
(@PATH,5,-12415.9,-942.535,28.7172,0,0,0,0,100,0),
(@PATH,6,-12422.5,-930.758,30.8608,0,0,0,0,100,0),
(@PATH,7,-12434.3,-915.714,35.5984,0,0,0,0,100,0),
(@PATH,8,-12448.6,-909.005,38.7702,0,0,0,0,100,0),
(@PATH,9,-12434.3,-915.714,35.5984,0,0,0,0,100,0),
(@PATH,10,-12422.5,-930.758,30.8608,0,0,0,0,100,0),
(@PATH,11,-12415.9,-942.535,28.7172,0,0,0,0,100,0),
(@PATH,12,-12410.9,-950.4,28.0988,0,0,0,0,100,0),
(@PATH,13,-12402,-953.174,24.9704,0,0,0,0,100,0),
(@PATH,14,-12389.1,-960.663,19.123,0,0,0,0,100,0),
(@PATH,15,-12378.6,-963.559,15.3825,0,0,0,0,100,0),
(@PATH,16,-12369.5,-963.88,12.9135,0,0,0,0,100,0);

SET @NPC := 856;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `position_x`=-12330.2, `position_y`=-933.855, `position_z`=9.33679, `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,1,-12330.2,-933.855,9.33679,0,0,0,0,100,0),
(@PATH,2,-12309.3,-908.34,8.68362,0,0,0,0,100,0),
(@PATH,3,-12287.8,-885.928,7.72276,0,0,0,0,100,0),
(@PATH,4,-12271.6,-855.56,7.95999,0,0,0,0,100,0),
(@PATH,5,-12256,-815.657,9.87775,0,0,0,0,100,0),
(@PATH,6,-12246.8,-791.101,12.5155,0,0,0,0,100,0),
(@PATH,7,-12256,-815.657,9.87775,0,0,0,0,100,0),
(@PATH,8,-12271.6,-855.56,7.95999,0,0,0,0,100,0),
(@PATH,9,-12287.8,-885.928,7.72276,0,0,0,0,100,0),
(@PATH,10,-12309.3,-908.34,8.68362,0,0,0,0,100,0),
(@PATH,11,-12330.2,-933.855,9.33679,0,0,0,0,100,0),
(@PATH,12,-12351.4,-969,13.033,0,0,0,0,100,0);


SET @NPC := 1306;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `position_x`=-12321, `position_y`=-987.277, `position_z`=16.1281, `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,1,-12321,-987.277,16.1281,0,0,0,0,100,0),
(@PATH,2,-12313.4,-996.214,20.1334,0,0,0,0,100,0),
(@PATH,3,-12306.6,-1001.41,22.9486,0,0,0,0,100,0),
(@PATH,4,-12300.2,-1003.79,25.7924,0,0,0,0,100,0),
(@PATH,5,-12291.5,-1005.99,29.7797,0,0,0,0,100,0),
(@PATH,6,-12280,-1000.79,32.059,0,0,0,0,100,0),
(@PATH,7,-12268.3,-989.618,33.7009,0,0,0,0,100,0),
(@PATH,8,-12240.5,-984.796,34.0938,0,0,0,0,100,0),
(@PATH,9,-12268.3,-989.618,33.7009,0,0,0,0,100,0),
(@PATH,10,-12280,-1000.79,32.059,0,0,0,0,100,0),
(@PATH,11,-12291.5,-1005.99,29.7797,0,0,0,0,100,0),
(@PATH,12,-12300.2,-1003.79,25.7924,0,0,0,0,100,0),
(@PATH,13,-12306.6,-1001.41,22.9486,0,0,0,0,100,0),
(@PATH,14,-12313.4,-996.214,20.1334,0,0,0,0,100,0),
(@PATH,15,-12321,-987.277,16.1281,0,0,0,0,100,0),
(@PATH,16,-12340.8,-974.699,12.554,0,0,0,0,100,0);

-- Jungle Panther SAI
SET @ENTRY := 31636;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,0,0,1000,1000,49,0,0,0,0,0,0,25,10,0,0,0,0,0,0,"Jungle Panther - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,1,0,100,0,10000,10000,10000,10000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jungle Panther - Out of Combat - Despawn Instant");

-- Earthgrab Totem should not grant experience
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 6066;

-- Spawn Knot Thimblejack, it was missing for some reason.
DELETE FROM `creature` WHERE `guid`=56804;
DELETE FROM `creature_addon` WHERE `guid`=56804;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(56804,14338,429,0,0,1,1,0,0,591.98,598.8,-4.57,3.94,644,0,0,2215,0,0,0,0,0,0);

-- Grimtotem Shaman SAI
SET @ENTRY := 7727;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,2000,8500,9000,11,930,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Shaman - In Combat - Cast 'Chain Lightning'"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,27623,1,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Shaman - Between 0-50% Health - Cast 'Fire Nova' (No Repeat)"),
(@ENTRY,0,2,0,2,0,100,0,0,40,8000,10000,11,8005,1,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Shaman - Between 0-40% Health - Cast 'Healing Wave'"),
(@ENTRY,0,3,0,74,0,100,0,0,40,8000,10000,11,8005,1,0,0,0,0,15,0,15,0,0,0,0,0,"Grimtotem Shaman - On Friendly Between 0-40% Health - Cast 'Healing Wave'");


-- Grimtotem Naturalist SAI
SET @ENTRY := 7726;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Aggro - Set Event Phase 1 (No Repeat)"),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Aggro - Cast 'Wrath' (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,9,1,100,0,0,40,2000,4000,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Naturalist - Within 0-40 Range - Cast 'Wrath' (Phase 1)"),
(@ENTRY,0,3,0,3,1,100,1,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-15% Mana - Set Event Phase 2 (Phase 1)"),
(@ENTRY,0,4,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 30-100% Mana - Set Event Phase 1 (Phase 2)"),
(@ENTRY,0,5,0,7,1,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Evade - Set Event Phase 0 (Phase 1) (No Repeat)"),
(@ENTRY,0,6,7,2,0,100,1,0,50,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-50% Health - Set Event Phase 3 (Phase 1) (No Repeat)"),
(@ENTRY,0,7,0,61,0,100,1,0,50,0,0,11,19030,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-50% Health - Cast 'Bear Form' (Phase 1) (No Repeat)"),
(@ENTRY,0,8,0,0,4,100,0,3000,4500,12000,13000,11,12161,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Naturalist - In Combat - Cast 'Maul' (Phase 4)"),
(@ENTRY,0,9,0,0,4,100,0,8000,9000,25000,26000,11,15727,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - In Combat - Cast 'Demoralizing Roar' (Phase 4)"),
(@ENTRY,0,10,0,7,4,100,1,0,0,0,0,28,19030,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Evade - Remove Aura (Phase 4) (No Repeat)"),
(@ENTRY,0,11,0,7,4,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - On Evade - Set Event Phase 0 (Phase 4) (No Repeat)"),
(@ENTRY,0,12,0,2,0,100,1,0,25,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Naturalist - Between 0-25% Health - Run In Fear (No Repeat)");

-- Grimtotem Raider SAI
SET @ENTRY := 7725;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,7366,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimtotem Raider - On Aggro - Cast 'Berserker Stance'"),
(@ENTRY,0,1,0,9,0,100,0,0,20,5000,6000,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,"Grimtotem Raider - Within 0-20 Range - Cast 'Net'");

SET @OGUID := 2031864;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID + 0 AND @OGUID + 7;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES 
(@OGUID + 0, 192187, 571, 67, 4455, 1, 65535, 7303.5, -2056.25, 761.303, 1.16167, 0, 0, 0.548722, 0.836005,    60, 0, 1, 0),
(@OGUID + 1, 192187, 571, 67, 4455, 1, 65535, 7310.18, -2056.72, 761.332, 0.662946, 0, 0, 0.325436, 0.945564,  60, 0, 1, 0),
(@OGUID + 2, 192187, 571, 67, 4455, 1, 65535, 7319.18, -2050.69, 761.45, 4.81377, 0, 0, 0.670369, -0.742028,   60, 0, 1, 0),
(@OGUID + 3, 192187, 571, 67, 4455, 1, 65535, 7318.3, -2044.77, 761.376, 1.20094, 0, 0, 0.565031, 0.82507,     60, 0, 1, 0),
(@OGUID + 4, 192187, 571, 67, 4455, 1, 65535, 7328.92, -2047.76, 761.564, 0.0149901, 0, 0, 0.007495, 0.999972, 60, 0, 1, 0),
(@OGUID + 5, 192187, 571, 67, 4455, 1, 65535, 7311.64, -2039.96, 761.518, 4.95121, 0, 0, 0.617835, -0.786308,  60, 0, 1, 0),
(@OGUID + 6, 192187, 571, 67, 4455, 1, 65535, 7305.54, -2047.59, 761.476, 3.22727, 0, 0, 0.999083, -0.0428247, 60, 0, 1, 0),
(@OGUID + 7, 192187, 571, 67, 4455, 1, 65535, 7325.97, -2038.3, 761.321, 1.54652, 0, 0, 0.698473, 0.715636,    60, 0, 1, 0);

-- [Q] Gamel the Cruel -- http://wotlk.openwow.com/quest=11619
-- Karuk SAI
SET @ENTRY := 25435;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,11619,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Karuk - On Quest 'Gamel the Cruel' Finished - Run Script");

-- Actionlist SAI
SET @ENTRY := 2543500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,12,26450,1,15000,0,0,0,8,0,0,0,2003.83,5851.17,36.2061,2.75762,"Karuk - On Script - Summon Creature 'Ariut'"),
(@ENTRY,9,1,0,0,0,100,0,2000,2000,0,0,1,0,10000,0,0,0,0,19,26450,20,0,0,0,0,0,"Karuk - On Script - Say Line 0");

DELETE FROM `creature_text` WHERE `entry`=26450;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(26450, 0, 0, 'The fallen of Pal\'ea will not rest, son.  Find the naga priestess!', 12, 0, 100, 1, 0, 0, 25684, 'Ariut');

-- Frostfeather Witch, Frostfeather Screecher, Frozen Orb, Disturbed Taunka Ancestor
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry` IN (29849, 30480, 29792, 29793);

-- [NPC][WotlK] Enraged Tempest, Raging Boiler and Boiling Spirit 
SET @cguid:=5005755;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+53;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+0, 25419, 571, 0, 0, 1, 1, 0, 0, 4419.61, 5952.447, 57.03477, 1.121153, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: -1)
(@CGUID+1, 25419, 571, 0, 0, 1, 1, 0, 0, 4448.788, 5916.716, 57.72005, 5.721869, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: -1)
(@CGUID+2, 25419, 571, 0, 0, 1, 1, 0, 0, 4448.035, 5957.813, 57.98078, 1.14177, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: -1)
(@CGUID+3, 25419, 571, 0, 0, 1, 1, 0, 0, 4461.483, 5886.482, 61.893, 3.48094, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: -1)
(@CGUID+4, 25419, 571, 0, 0, 1, 1, 0, 0, 4413.073, 5904.856, 56.37568, 4.019106, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: -1)
(@CGUID+5, 25419, 571, 0, 0, 1, 1, 0, 0, 4382.702, 5905.957, 55.72123, 2.909203, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: -1)
(@CGUID+6, 25419, 571, 0, 0, 1, 1, 0, 0, 4421.654, 5896.283, 55.94137, 4.782922, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: -1)
(@CGUID+7, 25419, 571, 0, 0, 1, 1, 0, 0, 4348.286, 5917.032, 60.72934, 5.387158, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+8, 25419, 571, 0, 0, 1, 1, 0, 0, 4451.888, 5851.77, 69.95783, 6.034452, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+9, 25417, 571, 0, 0, 1, 1, 0, 0, 4393.225, 5881.099, 55.97466, 4.578428, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+10, 25419, 571, 0, 0, 1, 1, 0, 0, 4386.144, 5881.497, 55.75355, 3.575644, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+11, 25419, 571, 0, 0, 1, 1, 0, 0, 4384.099, 5850.214, 69.215, 0.3004377, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+12, 25419, 571, 0, 0, 1, 1, 0, 0, 4320.845, 5906.834, 57.5699, 5.094295, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+13, 25419, 571, 0, 0, 1, 1, 0, 0, 4343.608, 5851.565, 56.67913, 1.960553, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+14, 25417, 571, 0, 0, 1, 1, 0, 0, 4313.515, 5889.598, 56.97303, 0.8698314, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+15, 25419, 571, 0, 0, 1, 1, 0, 0, 4344.71, 5882.019, 56.23266, 5.41927, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+16, 25419, 571, 0, 0, 1, 1, 0, 0, 4315.075, 5880.785, 56.03077, 1.569275, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+17, 25419, 571, 0, 0, 1, 1, 0, 0, 4284.087, 5915.679, 57.39619, 2.622871, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+18, 25419, 571, 0, 0, 1, 1, 0, 0, 4386.544, 5815.437, 71.95725, 5.795134, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+19, 25419, 571, 0, 0, 1, 1, 0, 0, 4315.096, 5840.36, 58.56625, 5.083281, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+20, 25419, 571, 0, 0, 1, 1, 0, 0, 4285.949, 5883.651, 58.90496, 0.1985445, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+21, 25417, 571, 0, 0, 1, 1, 0, 0, 4417.659, 5814.049, 73.62916, 2.305409, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+22, 25419, 571, 0, 0, 1, 1, 0, 0, 4347.293, 5797.105, 70.4449, 3.9803, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+23, 25417, 571, 0, 0, 1, 1, 0, 0, 4287.359, 5808.424, 65.015, 1.333162, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+24, 25419, 571, 0, 0, 1, 1, 0, 0, 4315.808, 5817.751, 63.17729, 1.716837, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+25, 25419, 571, 0, 0, 1, 1, 0, 0, 4295.346, 5844.404, 59.16083, 5.644846, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+26, 25417, 571, 0, 0, 1, 1, 0, 0, 4313.68, 5790.48, 68.38795, 3.758053, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+27, 25417, 571, 0, 0, 1, 1, 0, 0, 4306.196, 5755.188, 74.17075, 0.4614642, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+28, 25417, 571, 0, 0, 1, 1, 0, 0, 4285.329, 5785.763, 69.6144, 6.263107, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+29, 25417, 571, 0, 0, 1, 1, 0, 0, 4380.976, 5786.691, 76.09017, 5.706718, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+30, 25417, 571, 0, 0, 1, 1, 0, 0, 4345.296, 5780.17, 74.79289, 2.769791, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+31, 25417, 571, 0, 0, 1, 1, 0, 0, 4380.676, 5750.541, 81.36572, 2.86511, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+32, 25417, 571, 0, 0, 1, 1, 0, 0, 4277.169, 5757.782, 68.8129, 0.09976582, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+33, 25417, 571, 0, 0, 1, 1, 0, 0, 4350.86, 5749.646, 82.05293, 4.125741, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+34, 25419, 571, 0, 0, 1, 1, 0, 0, 4411.514, 5790.069, 76.78316, 3.849571, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25419 (Area: 4134)
(@CGUID+35, 25417, 571, 0, 0, 1, 1, 0, 0, 4413.009, 5788.343, 77.10886, 5.096886, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+36, 25417, 571, 0, 0, 1, 1, 0, 0, 4351.502, 5714.72, 86.44733, 4.789735, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+37, 25417, 571, 0, 0, 1, 1, 0, 0, 4373.826, 5713.223, 85.16576, 3.343639, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4134)
(@CGUID+38, 25417, 571, 0, 0, 1, 1, 0, 0, 4317.503, 5711.320, 89.224, 4.042527, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+39, 25417, 571, 0, 0, 1, 1, 0, 0, 4250.292, 5746.842, 66.42384, 1.142227, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+40, 25417, 571, 0, 0, 1, 1, 0, 0, 4309.887, 5676.108, 92.774, 5.29737, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+41, 25417, 571, 0, 0, 1, 1, 0, 0, 4315.956, 5653.785, 94.06521, 3.442963, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+42, 25417, 571, 0, 0, 1, 1, 0, 0, 4255.53, 5709.95, 56.70618, 2.291923, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+43, 25417, 571, 0, 0, 1, 1, 0, 0, 4242.124, 5780.734, 66.33765, 3.578308, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+44, 25417, 571, 0, 0, 1, 1, 0, 0, 4218.904, 5751.581, 65.40733, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+45, 25419, 571, 0, 0, 1, 1, 0, 0, 4420.043, 5841.368, 67.582, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
-- water eles
(@CGUID+46, 25419, 571, 0, 0, 1, 1, 0, 0, 4456.091, 5874.284, 64.093, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+47, 25419, 571, 0, 0, 1, 1, 0, 0, 4456.091, 5874.284, 64.093, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+48, 25419, 571, 0, 0, 1, 1, 0, 0, 4325.170, 5855.809, 57.569, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+49, 25419, 571, 0, 0, 1, 1, 0, 0, 4325.170, 5855.809, 57.569, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
-- fire eles
(@CGUID+50, 25417, 571, 0, 0, 1, 1, 0, 0, 4348.101, 5731.171, 83.638, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+51, 25417, 571, 0, 0, 1, 1, 0, 0, 4348.101, 5731.171, 83.638, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+52, 25417, 571, 0, 0, 1, 1, 0, 0, 4348.101, 5731.171, 83.638, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420), -- 25417 (Area: 4133)
(@CGUID+53, 25417, 571, 0, 0, 1, 1, 0, 0, 4348.101, 5731.171, 83.638, 1.580321, 120, 0, 0, 0, 0, 0, 0, 0, 0, 23420); -- 25417 (Area: 4133)

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+53;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@CGUID+0, 0, 0, 0, 1, 0, ''), -- 25415
(@CGUID+1, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+2, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+3, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+4, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+5, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+6, 0, 0, 0, 1, 0, ''), -- 25418
(@CGUID+7, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+8, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+9, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+10, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+11, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+12, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+13, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+14, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+15, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+16, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+17, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+18, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+19, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+20, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+21, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+22, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+23, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+24, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+25, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+26, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+27, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+28, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+29, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+30, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+31, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+32, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+33, 0, 0, 0, 1, 0, ''), -- 31685
(@CGUID+34, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+35, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+36, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+37, 0, 0, 0, 1, 0, ''), -- 25419
(@CGUID+38, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+39, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+40, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+41, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+42, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+43, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+44, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+45, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+46, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+47, 0, 0, 0, 1, 0, ''), -- 25417
(@CGUID+48, 0, 0, 0, 1, 0, ''), -- 25416
(@CGUID+49, 0, 0, 0, 1, 0, ''), -- 24613
(@CGUID+50, 0, 0, 0, 1, 0, ''), -- 24613
(@CGUID+51, 0, 0, 0, 1, 0, ''), -- 24613
(@CGUID+52, 0, 0, 0, 1, 0, ''), -- 24614
(@CGUID+53, 0, 0, 0, 1, 0, ''); -- 31685

UPDATE `creature` SET `spawntimesecs` = 300 , `spawndist` = 10 , `curhealth` = 1 , `MovementType` = 1 WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+53; 
UPDATE `creature` SET `spawntimesecs` = 300 , `spawndist` = 4 , `curhealth` = 1 , `MovementType` = 1 WHERE `guid` = @CGUID+11; 

-- delete water eles
DELETE FROM `creature` WHERE `guid` BETWEEN 102648 AND 102652;
DELETE FROM `creature` WHERE `guid` BETWEEN 102661 AND 102666;
DELETE FROM `creature` WHERE `guid` IN (102645, 102626);
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102648 AND 102652;
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 102661 AND 102666;
DELETE FROM `creature_addon` WHERE `guid` IN (102645, 102626);

UPDATE `creature` SET `position_x` = 4309.695 , `position_y` = 5633.367 , `position_z` = 94.87403 , `orientation` = 1.413717 WHERE `guid` = 200013; 

-- air eles
UPDATE `creature` SET `spawndist` = 10 WHERE `guid` BETWEEN 102437 AND 102442; 
UPDATE `creature` SET `spawndist` = 10 WHERE `guid` BETWEEN 102471 AND 102485; 
UPDATE `creature` SET `spawndist` = 10 WHERE `guid` = 102452; 

-- Pathing for Enraged Tempest Entry: 25415 'TDB FORMAT' 
SET @NPC := 102479;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4582.429,`position_y`=5916.411,`position_z`=56.099 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4582.429,5916.411,56.099,0,0,0,0,100,0), -- 20:25:05
(@PATH,2,4567.213,5933.478,62.72065,0,0,0,0,100,0), -- 20:25:16
(@PATH,3,4550.817,5949.297,68.55141,0,0,0,0,100,0), -- 20:25:25
(@PATH,4,4542.173,5982.366,71.99318,0,0,0,0,100,0), -- 20:25:36
(@PATH,5,4563.726,6018.92,78.21175,0,0,0,0,100,0), -- 20:25:51
(@PATH,6,4586.041,6047.054,81.09695,0,0,0,0,100,0), -- 20:26:09
(@PATH,7,4606.639,6079.772,79.38864,0,0,0,0,100,0), -- 20:26:23
(@PATH,8,4602.986,6101.729,78.74768,0,0,0,0,100,0), -- 20:26:37
(@PATH,9,4582.914,6126.627,81.2157,0,0,0,0,100,0), -- 20:26:49
(@PATH,10,4556.886,6142.86,81.20538,0,0,0,0,100,0), -- 20:27:03
(@PATH,11,4572.895,6134.833,81.22743,0,0,0,0,100,0), -- 20:27:16
(@PATH,12,4600.353,6109.119,78.72827,0,0,0,0,100,0), -- 20:27:26
(@PATH,13,4604.147,6095.896,79.12968,0,0,0,0,100,0), -- 20:27:39
(@PATH,14,4600.552,6070.209,81.15663,0,0,0,0,100,0), -- 20:27:52
(@PATH,15,4570.93,6028.483,79.49257,0,0,0,0,100,0), -- 20:28:07
(@PATH,16,4542.822,5986.35,72.76584,0,0,0,0,100,0), -- 20:28:19
(@PATH,17,4550.624,5951.442,69.22236,0,0,0,0,100,0), -- 20:28:38
(@PATH,18,4564.791,5935.697,64.15934,0,0,0,0,100,0), -- 20:28:54
(@PATH,19,4582.332,5916.214,55.95428,0,0,0,0,100,0); -- 20:29:03

-- Pathing for Enraged Tempest Entry: 25415 'TDB FORMAT' 
SET @NPC := 102473;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4497.891,`position_y`=6137.541,`position_z`=80.16054 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4497.891,6137.541,80.16054,0,0,0,0,100,0), -- 20:26:22
(@PATH,2,4497.828,6131.405,79.64149,0,0,0,0,100,0), -- 20:26:30
(@PATH,3,4499.488,6112.93,80.19643,0,0,0,0,100,0), -- 20:26:35
(@PATH,4,4491.456,6088.593,78.08659,0,0,0,0,100,0), -- 20:26:45
(@PATH,5,4505.488,6055.596,76.68158,0,0,0,0,100,0), -- 20:26:52
(@PATH,6,4491.953,6023.114,67.60138,0,0,0,0,100,0), -- 20:27:07
(@PATH,7,4514.078,5986.287,68.74522,0,0,0,0,100,0), -- 20:27:21
(@PATH,8,4500.425,5965.788,63.89717,0,0,0,0,100,0), -- 20:27:39
(@PATH,9,4503.254,5931.495,61.60934,0,0,0,0,100,0), -- 20:27:57
(@PATH,10,4489.393,5948.091,63.07407,0,0,0,0,100,0), -- 20:28:15
(@PATH,11,4513.931,5982.552,67.93922,0,0,0,0,100,0), -- 20:28:30
(@PATH,12,4494.02,6016.712,67.46692,0,0,0,0,100,0), -- 20:28:48
(@PATH,13,4501.351,6044.861,75.96799,0,0,0,0,100,0), -- 20:29:05
(@PATH,14,4492.195,6082.638,77.78274,0,0,0,0,100,0), -- 20:29:21
(@PATH,15,4500.411,6098.807,79.48975,0,0,0,0,100,0), -- 20:29:35
(@PATH,16,4498.477,6122.489,79.74394,0,0,0,0,100,0), -- 20:29:41
(@PATH,17,4497.76,6137.652,80.19916,0,0,0,0,100,0); -- 20:29:51

-- paths water eles
SET @NPC := @CGUID+46;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4456.091,`position_y`=5874.284,`position_z`=64.093 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,2,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,3,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,4,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,5,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,6,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,7,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,8,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,9,4456.091,5874.284,64.093,0,0,1,0,100,0); -- 20:26:22

SET @NPC := @CGUID+47;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4408.679,`position_y`=5920.878,`position_z`=55.669 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4408.679,5920.878,55.669,0,0,1,0,100,0), -- 20:26:22
(@PATH,2,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,3,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,4,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,5,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,6,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,7,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,8,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,9,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,10,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,11,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,12,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,13,4408.679,5920.878,55.669,0,0,1,0,100,0); -- 20:26:22

SET @NPC := @CGUID+48;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4325.170,`position_y`=5855.809,`position_z`=57.569 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,2,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,3,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,4,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,5,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,6,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,7,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,8,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,9,4325.170,5855.809,57.569,0,0,1,0,100,0); -- 20:26:22

SET @NPC := @CGUID+49;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4370.834,`position_y`=5889.521,`position_z`=55.853 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4370.834,5889.521,55.853,0,0,1,0,100,0), -- 20:26:22
(@PATH,2,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,3,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,4,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,5,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,6,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,7,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,8,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,9,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,10,4325.170,5855.809,57.569,0,0,1,0,100,0); -- 20:26:22

SET @NPC := @CGUID+34;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4400.289,`position_y`=5853.771,`position_z`=64.700 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4400.289,5853.771,64.700,0,0,1,0,100,0), -- 20:26:22
(@PATH,2,4406.379,5794.868,75.189,0,0,1,0,100,0), -- 20:26:30
(@PATH,3,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,4,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,5,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,6,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,7,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,8,4406.379,5794.868,75.189,0,0,1,0,100,0), -- 20:26:30
(@PATH,9,4400.289,5853.771,64.700,0,0,1,0,100,0); -- 20:26:22

SET @NPC := @CGUID+19;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4325.170,`position_y`=5855.809,`position_z`=57.569 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,2,4301.863,5794.378,67.805,0,0,1,0,100,0), -- 20:26:30
(@PATH,3,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,4,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,5,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,6,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,7,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,8,4301.863,5794.378,67.805,0,0,1,0,100,0), -- 20:26:30
(@PATH,9,4325.170,5855.809,57.569,0,0,1,0,100,0); -- 20:26:22

-- fire eles paths
SET @NPC := @CGUID+50;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4309.625,`position_y`=5638.164,`position_z`=94.449 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,2,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,3,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,4,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,5,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,6,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,7,4408.679,5920.878,55.669,0,0,1,0,100,0), -- 20:26:22
(@PATH,8,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,9,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,10,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,11,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,12,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,13,4309.625,5638.164,94.449,0,0,1,0,100,0); -- 20:26:45

SET @NPC := @CGUID+51;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4347.967,`position_y`=5730.564,`position_z`=83.739 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4347.967,5730.564,83.739,0,0,1,0,100,0), -- 20:26:35
(@PATH,2,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,3,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,4,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,5,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,6,4408.679,5920.878,55.669,0,0,1,0,100,0), -- 20:26:22
(@PATH,7,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,8,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,9,4418.135,5826.952,70.059,0,0,1,0,100,0), -- 20:26:30
(@PATH,10,4364.599,5757.606,80.218,0,0,1,0,100,0), -- 20:26:35
(@PATH,11,4347.967,5730.564,83.739,0,0,1,0,100,0); -- 20:26:35

SET @NPC := 102601;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4400.118,`position_y`=5793.260,`position_z`=75.037 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4400.118,5793.260,75.037,0,0,1,0,100,0), -- 20:26:35
(@PATH,2,4400.289,5853.771,64.700,0,0,1,0,100,0), -- 20:26:22
(@PATH,3,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,4,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,5,4391.264,5878.812,55.666,0,0,1,0,100,0), -- 20:26:22
(@PATH,6,4356.525,5896.896,56.012,0,0,1,0,100,0), -- 20:26:22
(@PATH,7,4391.264,5878.812,55.666,0,0,1,0,100,0), -- 20:26:22
(@PATH,8,4453.867,5900.081,59.354,0,0,1,0,100,0), -- 20:26:22
(@PATH,9,4456.091,5874.284,64.093,0,0,1,0,100,0), -- 20:26:22
(@PATH,10,4400.289,5853.771,64.700,0,0,1,0,100,0), -- 20:26:22
(@PATH,11,4400.118,5793.260,75.037,0,0,1,0,100,0); -- 20:26:35

SET @NPC := @CGUID+52;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4309.625,`position_y`=5638.164,`position_z`=94.449 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4309.625,5638.164,94.449,0,0,1,0,100,0), -- 20:26:45
(@PATH,2,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,3,4347.967,5730.564,83.739,0,0,1,0,100,0), -- 20:26:35
(@PATH,4,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,5,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,6,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,7,4356.525,5896.896,56.012,0,0,1,0,100,0), -- 20:26:22
(@PATH,8,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,9,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,10,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,11,4347.967,5730.564,83.739,0,0,1,0,100,0), -- 20:26:35
(@PATH,12,4312.593,5704.205,90.690,0,0,1,0,100,0), -- 20:26:45
(@PATH,13,4309.625,5638.164,94.449,0,0,1,0,100,0); -- 20:26:45

SET @NPC := @CGUID+53;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4347.967,`position_y`=5730.564,`position_z`=83.739 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4347.967,5730.564,83.739,0,0,1,0,100,0), -- 20:26:35
(@PATH,2,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,3,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,4,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,5,4356.525,5896.896,56.012,0,0,1,0,100,0), -- 20:26:22
(@PATH,6,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,7,4331.969,5789.342,70.842,0,0,1,0,100,0), -- 20:26:30
(@PATH,8,4340.155,5758.681,79.466,0,0,1,0,100,0), -- 20:26:35
(@PATH,9,4347.967,5730.564,83.739,0,0,1,0,100,0); -- 20:26:35

SET @NPC := 102600;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4319.603,`position_y`=5784.604,`position_z`=69.714 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4319.603,5784.604,69.714,0,0,1,0,100,0), -- 20:26:35
(@PATH,2,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,3,4356.525,5896.896,56.012,0,0,1,0,100,0), -- 20:26:22
(@PATH,4,4325.170,5855.809,57.569,0,0,1,0,100,0), -- 20:26:22
(@PATH,5,4319.603,5784.604,69.714,0,0,1,0,100,0);

-- Boiling Spirit SAI
SET @ENTRY := 25419;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,15000,20000,11,50206,0,0,0,0,0,2,0,0,0,0,0,0,0,"Boiling Spirit - In Combat - Cast 'Scalding Steam'");

-- Raging Boiler SAI
SET @ENTRY := 25417;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,15000,20000,11,50207,0,0,0,0,0,2,0,0,0,0,0,0,0,"Raging Boiler - In Combat - Cast 'Boiling Blood'");

UPDATE `creature_template` SET `DamageModifier` = 1.2 WHERE `entry` = 25417; 

-- Enraged Tempest SAI
SET @ENTRY := 25415;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,50,120000,120000,11,50420,0,0,0,0,0,1,0,0,0,0,0,0,0,"Enraged Tempest - Between 0-50% Health - Cast 'Enrage'"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,11,50215,0,0,0,0,0,1,0,0,0,0,0,0,0,"Enraged Tempest - On Just Died - Cast 'Zephyr'");

-- [Q] If he canot be turned -- http://wotlk.openwow.com/quest=12897
-- General Lightsbane SAI
SET @ENTRY := 29851;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,7,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29860,0,0,0,0,0,0,"General Lightsbane - On Evade - Set Data 1 1"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29858,0,0,0,0,0,0,"General Lightsbane - On Evade - Set Data 1 1"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29859,0,0,0,0,0,0,"General Lightsbane - On Evade - Set Data 1 1"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Evade - Despawn In 1000 ms"),
(@ENTRY,0,4,5,54,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Just Summoned - Say Line 0"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"General Lightsbane - On Just Summoned - Start Attacking"),
(@ENTRY,0,6,0,4,0,100,0,0,0,0,0,80,@ENTRY*100+00,1,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Aggro - Run Script"),
(@ENTRY,0,7,0,9,0,100,0,0,5,13000,18000,11,60186,0,0,0,0,0,2,0,0,0,0,0,0,0,"General Lightsbane - Within 0-5 Range - Cast 'Plague Strike'"),
(@ENTRY,0,8,0,9,0,100,0,0,5,8000,11000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,"General Lightsbane - Within 0-5 Range - Cast 'Cleave'"),
(@ENTRY,0,9,0,9,0,100,0,3000,5000,10000,15000,11,60160,0,0,0,0,0,2,0,0,0,0,0,0,0,"General Lightsbane - Within 3000-5000 Range - Cast 'Death and Decay'"),
(@ENTRY,0,10,11,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29860,0,0,0,0,0,0,"General Lightsbane - On Just Died - Set Data 1 1"),
(@ENTRY,0,11,12,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29858,0,0,0,0,0,0,"General Lightsbane - On Just Died - Set Data 1 1"),
(@ENTRY,0,12,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,29859,0,0,0,0,0,0,"General Lightsbane - On Just Died - Set Data 1 1"),
(@ENTRY,0,13,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"General Lightsbane - On Initialize - Despawn In 320000 ms");

UPDATE `gameobject_template` SET `Data3`=320000 WHERE  `entry`=191779;
UPDATE `creature_template` SET `HealthModifier`=20 WHERE  `entry` IN (29860, 29858, 29859);

-- Vile SAI
SET @ENTRY := 29860;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,29860,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,8,29860,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Set Home Position"),
(@ENTRY,0,2,3,61,0,100,0,8,29860,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Set Reactstate Aggressive"),
(@ENTRY,0,3,4,61,0,100,0,8,29860,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Say Line 0"),
(@ENTRY,0,4,0,61,0,100,0,8,29860,0,0,49,0,0,0,0,0,0,19,29851,0,0,0,0,0,0,"Vile - On Waypoint 8 Reached - Start Attacking"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Data Set 1 1 - Despawn Instant"),
(@ENTRY,0,6,0,4,0,100,0,0,0,0,0,11,37548,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile - On Aggro - Cast 'Taunt'"),
(@ENTRY,0,7,0,0,0,100,0,8000,15000,10000,15000,11,37548,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile - In Combat - Cast 'Taunt'"),
(@ENTRY,0,8,0,9,0,100,0,0,5,5000,8000,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vile - Within 0-5 Range - Cast 'Backhand'"),
(@ENTRY,0,9,0,0,0,100,0,10000,15000,15000,23000,11,56646,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - In Combat - Cast 'Enrage'"),
(@ENTRY,0,10,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vile - On Initialize - Despawn In 320000 ms");

-- Lady Nightswood SAI
SET @ENTRY := 29858;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,29858,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,7,29858,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Set Home Position"),
(@ENTRY,0,2,3,61,0,100,0,7,29858,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Set Reactstate Aggressive"),
(@ENTRY,0,3,4,61,0,100,0,7,29858,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Say Line 0"),
(@ENTRY,0,4,0,61,0,100,0,7,29858,0,0,49,0,0,0,0,0,0,19,29851,0,0,0,0,0,0,"Lady Nightswood - On Waypoint 7 Reached - Start Attacking"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Data Set 1 1 - Despawn Instant"),
(@ENTRY,0,6,0,0,0,100,0,0,8000,13000,18000,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,"Lady Nightswood - In Combat - Cast 'Banshee Curse'"),
(@ENTRY,0,7,0,9,0,100,0,0,5,4000,7000,11,16838,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - Within 0-5 Range - Cast 'Banshee Shriek'"),
(@ENTRY,0,8,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Nightswood - On Initialize - Despawn In 320000 ms");

-- The Leaper SAI
SET @ENTRY := 29859;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,29859,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,6,29859,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Set Home Position"),
(@ENTRY,0,2,3,61,0,100,0,6,29859,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Set Reactstate Aggressive"),
(@ENTRY,0,3,4,61,0,100,0,6,29859,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Say Line 0"),
(@ENTRY,0,4,0,61,0,100,0,6,29859,0,0,49,0,0,0,0,0,0,19,29851,0,0,0,0,0,0,"The Leaper - On Waypoint 6 Reached - Start Attacking"),
(@ENTRY,0,5,0,38,0,100,0,1,1,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Data Set 1 1 - Despawn Instant"),
(@ENTRY,0,6,0,9,0,100,0,0,5,4000,7000,11,60195,0,0,0,0,0,2,0,0,0,0,0,0,0,"The Leaper - Within 0-5 Range - Cast 'Sinister Strike'"),
(@ENTRY,0,7,0,0,0,100,0,5000,8000,30000,35000,11,60177,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - In Combat - Cast 'Hunger For Blood'"),
(@ENTRY,0,8,0,37,0,100,0,0,0,0,0,41,320000,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Leaper - On Initialize - Despawn In 320000 ms");

-- [Q] Generosity Abounds - http://wotlk.openwow.com/quest=13146
-- Scourge Bomb SAI
SET @ENTRY := 31075;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,58203,0,30000,30000,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Scourge Bomb - On Spellhit 'Iron Chain' - Start Follow Invoker"),
(@ENTRY,0,1,0,34,0,100,0,0,0,0,0,11,58206,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Reached Point 0 - Cast 'Scourge Bomb Dragging Aura'"),
(@ENTRY,0,2,0,38,0,100,0,1,1,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Data Set 1 1 - Run Script"),
(@ENTRY,0,3,0,38,0,100,0,1,1,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Data Set 1 1 - Set Rooted On"),
(@ENTRY,0,4,0,60,0,100,0,1000,1000,1000,1000,3,0,27462,0,0,0,0,1,0,0,0,0,0,0,0,"Scourge Bomb - On Update - Morph To Model 27462");

-- [Q] The Sum is Greater than the Parts -- http://wotlk.openwow.com/quest=13043
UPDATE `creature_template` SET `speed_walk`=0.001, `speed_run`=0.001 WHERE  `entry`=30403;
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=30403;
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x20000000 WHERE  `entry` IN (30403,30404,30432,30471);

-- Vargul Assailant SAI
SET @ENTRY := 30471;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1000,1000,49,0,0,0,0,0,0,19,30403,200,0,0,0,0,0,"Vargul Assailant - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,8,0,100,0,32067,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - On Spellhit 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' - Despawn Instant"),
(@ENTRY,0,2,0,0,0,100,0,4500,5599,13400,15600,11,43410,0,0,0,0,0,2,0,0,0,0,0,0,0,"Vargul Assailant - In Combat - Cast 'Chop'"),
(@ENTRY,0,3,0,0,0,100,0,8000,9000,35000,37000,11,23262,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - In Combat - Cast 'Demoralize'"),
(@ENTRY,0,4,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vargul Assailant - On Just Summoned - Set Active On");

-- Dr. Terrible SAI
SET @ENTRY := 30404;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1000,1000,49,0,0,0,0,0,0,19,30403,200,0,0,0,0,0,"Vargul Assailant - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Aggro - Say Line 0 (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,15000,19000,11,61143,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dr. Terrible - In Combat - Cast 'Crazed Chop'"),
(@ENTRY,0,3,0,0,0,100,0,10000,12000,28000,33000,11,61146,0,0,0,0,0,5,0,0,0,0,0,0,0,"Dr. Terrible - In Combat - Cast 'Slime Stream'"),
(@ENTRY,0,4,5,2,0,100,1,0,45,0,0,11,31730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - Between 0-45% Health - Cast 'Heal' (No Repeat)"),
(@ENTRY,0,5,0,61,0,100,0,0,45,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - Between 0-45% Health - Say Line 1 (No Repeat)"),
(@ENTRY,0,6,7,6,0,100,1,0,0,0,0,11,32067,2,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Died - Cast 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' (No Repeat)"),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Died - Say Line 2 (No Repeat)"),
(@ENTRY,0,8,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dr. Terrible - On Just Summoned - Set Active On");

-- Grimmr Hound SAI
SET @ENTRY := 30432;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,1000,1000,49,0,0,0,0,0,0,19,30403,200,0,0,0,0,0,"Vargul Assailant - Out of Combat - Start Attacking"),
(@ENTRY,0,1,0,8,0,100,0,32067,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimmr Hound - On Spellhit 'The Sum is Greater than the Parts: Dr. Terrible's Death Signal' - Despawn Instant"),
(@ENTRY,0,2,0,54,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Grimmr Hound - On Just Summoned - Set Active On");

-- Actionlist SAI
SET @ENTRY := 3040300;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,5000,5000,0,0,12,30471,2,300000,0,0,0,8,0,0,0,7993.9,3336.91,632.396,0.14577,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8003.72,3323.56,632.396,0.648783,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8026.94,3307.58,632.396,1.48207,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8001.77,3306.38,632.396,0.863447,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8022.616,3323.931,632.395,0.753,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8016.52,3318.92,632.396,0.940311,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,6,0,0,0,100,0,30000,30000,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8014.93,3327.38,632.39,0.818,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8011.71,3315.36,632.396,0.901169,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8000.67,3317.23,632.396,0.710591,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8025.24,3313.55,632.396,1.28693,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8007.71,3337.13,632.396,0.407285,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,11,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8009.92,3319.81,632.396,0.804842,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,12,0,0,0,100,0,30000,30000,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8021.79,3312.45,632.396,1.13086,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8001.36,3332.71,632.396,0.443351,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8017.730,3334.196,632.395,0.8193,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8000.5,3345.77,632.396,5.82389,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8001.77,3311.95,632.396,0.797157,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,30471,2,300000,0,0,0,8,0,0,0,8012.21,3325.82,632.396,0.737667,"Nergeld - On Script - Summon Creature 'Vargul Assailant'"),
(@ENTRY,9,18,0,0,0,100,0,31000,31000,0,0,12,30404,2,300000,0,1,0,8,0,0,0,8022.616,3323.931,632.395,0.753,"Nergeld - On Script - Summon Creature 'Dr. Terrible'"),
(@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8017.730,3334.196,632.39,0.8193,"Nergeld - On Script - Summon Creature 'Grimmr Hound'"),
(@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,30432,2,300000,0,0,0,8,0,0,0,8022.616,3323.931,632.395,0.753,"Nergeld - On Script - Summon Creature 'Grimmr Hound'");

-- [Q] Army of the Damned -- http://www.wowhead.com/quest=13236/army-of-the-damned
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(58912, 58916, 58917);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry IN(58913);
INSERT INTO conditions VALUES (13, 1, 58912, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58917, 0, 0, 31, 0, 3, 31276, 0, 0, 0, 0, '', 'Target Ghoul Minion');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 31, 0, 3, 31254, 0, 0, 0, 0, '', 'Target Lordaeron Footsoldier');
INSERT INTO conditions VALUES (13, 1, 58916, 0, 0, 36, 0, 0, 0, 0, 1, 0, 0, '', 'Target must be dead');
INSERT INTO conditions VALUES (17, 0, 58913, 0, 0, 32, 0, 8, 0, 0, 0, 0, 0, '', 'Soul Cleave can target units');

-- Ghoulish Minion SAI
SET @ENTRY := 31276;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,1,58917,0,0,0,85,58919,3,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Spellhit 'Consume Minions' - Invoker Cast 'Consume Minions' (No Repeat)"),
(@ENTRY,0,1,0,60,0,100,1,0,0,0,0,11,50142,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Update - Cast 'Emerge Visual' (No Repeat)"),
(@ENTRY,0,2,0,60,0,100,1,4000,4000,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ghoulish Minion - On Update - Start Random Movement (No Repeat)"),
(@ENTRY,0,3,0,60,0,100,1,4000,4000,0,0,49,0,0,0,0,0,0,19,31254,15,0,0,0,0,0,"Ghoulish Minion - On Update - Start Attacking (No Repeat)");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=16 AND SourceEntry=31830;
INSERT INTO conditions VALUES (16, 0, 31830, 0, 0, 23, 0, 4622, 0, 0, 0, 0, 0, '', 'Vehicle must be in area 4622');
INSERT INTO conditions VALUES (16, 0, 31830, 0, 1, 23, 0, 4537, 0, 0, 0, 0, 0, '', 'Vehicle must be in area 4537');

-- Threat From Above -- http://wotlk.openwow.com/?search=Threat+From+Above
UPDATE vehicle_template_accessory SET minion=1 WHERE entry=33687;
DELETE FROM smart_scripts WHERE entryorguid=33687 AND source_type=0;
INSERT INTO smart_scripts VALUES(33687, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set event phase on reset");
INSERT INTO smart_scripts VALUES(33687, 0, 1, 0, 0, 0, 100, 0, 5000, 7000, 8000, 12000, 11, 65248, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "cast frost breath in combat");
INSERT INTO smart_scripts VALUES(33687, 0, 2, 0, 0, 0, 100, 0, 8000, 9000, 10000, 13000, 11, 65260, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "wing buffet in combat");
INSERT INTO smart_scripts VALUES(33687, 0, 3, 4, 2, 1, 100, 0, 0, 80, 1000, 1000, 12, 33695, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "check health and spawn third bombardier");
INSERT INTO smart_scripts VALUES(33687, 0, 4, 0, 61, 1, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Go to next phase");
INSERT INTO smart_scripts VALUES(33687, 0, 5, 6, 2, 2, 100, 0, 0, 50, 1000, 1000, 12, 33695, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "check health and spawn third bombardier");
INSERT INTO smart_scripts VALUES(33687, 0, 6, 0, 61, 2, 100, 0, 0, 0, 0, 0, 22, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Go to next phase");
INSERT INTO smart_scripts VALUES(33687, 0, 7, 8, 2, 4, 100, 0, 0, 30, 1000, 1000, 12, 33695, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "check health and spawn third bombardier");
INSERT INTO smart_scripts VALUES(33687, 0, 8, 0, 61, 4, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Go to next phase");
UPDATE creature_template SET AIName="SmartAI" WHERE entry=33695;
DELETE FROM smart_scripts WHERE entryorguid=33695 AND source_type=0;
INSERT INTO smart_scripts VALUES(33695, 0, 0, 0, 0, 0, 100, 0, 5000, 6000, 8000, 12000, 11, 65128, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "cast throw dynamite in combat");
INSERT INTO smart_scripts VALUES(33695, 0, 1, 0, 0, 0, 100, 0, 8000, 9000, 6000, 13000, 11, 65130, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "time bomb in combat");
UPDATE creature_template SET AIName="SmartAI", faction=14, unit_flags=262144+33554432+131072+4 WHERE entry=34307;
DELETE FROM smart_scripts WHERE entryorguid=34307 AND source_type=0;
INSERT INTO smart_scripts VALUES(34307, 0, 0, 0, 60, 0, 100, 0, 1, 1, 30000, 30000, 11, 59686, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "apply aura on spawn");
INSERT INTO smart_scripts VALUES(34307, 0, 1, 2, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 11, 59687, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "explode!");
INSERT INTO smart_scripts VALUES(34307, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "despawn on explode");

-- DB/Quest: Assault by Air (H) -- http://wotlk.openwow.com/quest=13310
DELETE FROM `creature` WHERE `id`=32225;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(16398, 32225, 571, 1, 1, 0, 0, 7303.23, 1520.81, 323.2961, 1.53589, 300, 0, 0, 63000, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `spell1`=59880 WHERE `entry`=32227;
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=32225;
UPDATE `creature_template` SET `speed_run`=3 WHERE  `entry`=32225;
UPDATE `vehicle_template_accessory` SET `minion`=1 WHERE  `entry`=32225 AND `seat_id`=0;

DELETE FROM `waypoints` WHERE `entry`=32225;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(32225, 1, 7224.952, 1493.076, 355.6927, 'Skybreaker Troop Transport'),
(32225, 2, 7158.104, 1468.994, 408.7451, 'Skybreaker Troop Transport'),
(32225, 3, 7091.476, 1447.724, 454.6882, 'Skybreaker Troop Transport'),
(32225, 4, 6959.782, 1423.015, 558.3835, 'Skybreaker Troop Transport'),
(32225, 5, 6779.104, 1463.505, 646.3554, 'Skybreaker Troop Transport'),
(32225, 6, 6655.649, 1608.774, 709.994, 'Skybreaker Troop Transport'),
(32225, 7, 6624.22, 1736.658, 728.0214, 'Skybreaker Troop Transport'),
(32225, 8, 6669.947, 1866.185, 709.688, 'Skybreaker Troop Transport'),
(32225, 9, 6718.041, 1885.129, 690.6326, 'Skybreaker Troop Transport'),
(32225, 10, 6795.828, 1838.745, 659.0216, 'Skybreaker Troop Transport'),
(32225, 11, 6829.202, 1723.054, 616.9384, 'Skybreaker Troop Transport'),
(32225, 12, 6938.554, 1702.879, 585.9383, 'Skybreaker Troop Transport'),
(32225, 13, 7024.898, 1752.804, 565.5496, 'Skybreaker Troop Transport'),
(32225, 14, 7113.707, 1734.315, 556.3559, 'Skybreaker Troop Transport'),
(32225, 15, 7265.8, 1765.196, 556.3559, 'Skybreaker Troop Transport'),
(32225, 16, 7302.899, 1853.759, 575.8558, 'Skybreaker Troop Transport'),
(32225, 17, 7312.44, 1944.328, 581.4116, 'Skybreaker Troop Transport'),
(32225, 18, 7307.329, 2014.243, 581.4116, 'Skybreaker Troop Transport'),
(32225, 19, 7253.363, 2115.422, 583.3, 'Skybreaker Troop Transport'),
(32225, 20, 7193.522, 2155.816, 607.7997, 'Skybreaker Troop Transport'),
(32225, 21, 7128.84, 2168.484, 642.6707, 'Skybreaker Troop Transport'),
(32225, 22, 7069.121, 2157.589, 689.7963, 'Skybreaker Troop Transport'),
(32225, 23, 7024.457, 2135.705, 708.6849, 'Skybreaker Troop Transport'),
(32225, 24, 6934.063, 2183.969, 750.9397, 'Skybreaker Troop Transport'),
(32225, 25, 6941.725, 2249.074, 754.6065, 'Skybreaker Troop Transport'),
(32225, 26, 7072.678, 2295.607, 714.44, 'Skybreaker Troop Transport'),
(32225, 27, 7260.946, 2257.761, 639.7736, 'Skybreaker Troop Transport'),
(32225, 28, 7419.038, 2123.693, 587.7736, 'Skybreaker Troop Transport'),
(32225, 29, 7471.735, 1962.737, 559.6346, 'Skybreaker Troop Transport'),
(32225, 30, 7436.465, 1818.688, 508.0233, 'Skybreaker Troop Transport'),
(32225, 31, 7366.372, 1694.51, 469.3012, 'Skybreaker Troop Transport'),
(32225, 32, 7329.872, 1609.157, 432.2737, 'Skybreaker Troop Transport'),
(32225, 33, 7296.424, 1556.42, 417.7181, 'Skybreaker Troop Transport'),
(32225, 34, 7272.382, 1525.835, 411.4405, 'Skybreaker Troop Transport');

-- Skybreaker Suppression Turret SAI
SET @ENTRY := 32227;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,27,0,100,0,0,0,0,0,45,1,0,0,0,0,0,19,32225,10,0,0,0,0,0,"Skybreaker Suppression Turret - On Passenger Boarded - Set Data 1 0"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Suppression Turret - On Just Died - Despawn Instant");

-- Skybreaker Troop Transport SAI
SET @ENTRY := 32225;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Data Set 1 0 - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,9,32225,0,0,11,64631,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 9 Reached - Cast 'Eject Passenger 3'"),
(@ENTRY,0,2,0,40,0,100,0,13,32225,0,0,11,64614,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 13 Reached - Cast 'Eject Passenger 4'"),
(@ENTRY,0,3,0,40,0,100,0,17,32225,0,0,11,64633,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 17 Reached - Cast 'Eject Passenger 5'"),
(@ENTRY,0,4,0,40,0,100,0,22,32225,0,0,11,64634,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 22 Reached - Cast 'Eject Passenger 6'"),
(@ENTRY,0,5,6,40,0,100,0,34,32225,0,0,200,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 34 Reached - Despawn Instant"),
(@ENTRY,0,6,7,61,0,100,0,34,32225,0,0,116,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 34 Reached - Despawn Instant"),
(@ENTRY,0,7,0,61,0,100,0,34,32225,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Waypoint 34 Reached - Despawn Instant");
UPDATE `creature_template` SET `HealthModifier`=5000 WHERE  `entry`=32225;

-- Actionlist SAI
SET @ENTRY := 3222500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,53,1,32225,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Set Reactstate Passive"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Set Flag Pacified"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Troop Transport - On Script - Set Health Regeneration Off");

-- Skybreaker Infiltrator SAI
SET @ENTRY := 32222;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,1,46598,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Has Aura 'Ride Vehicle Hardcoded' - Run Script (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 3222200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,60208,0,0,0,0,0,21,20,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Cast 'Ally Air Dropoff Kill Credit'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,100,100,0,0,11,45472,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Cast 'Parachute'"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skybreaker Infiltrator - On Script - Despawn Instant");

DELETE FROM `creature_text` WHERE `entry`=32222;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(32222, 0, 0, 'I''ll kill one just for you.', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32532),
(32222, 0, 1, 'Dropping. Good luck, boys!', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32526),
(32222, 0, 2, 'Thanks for the cover!', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32527),
(32222, 0, 3, 'Destination reached - engaging in scouting mission.', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32528),
(32222, 0, 4, 'Infiltration commencing.', 12, 0, 100, 0, 0, 0, 'Skybreaker Infiltrator',32529);

-- Ymirheim Spear Gun SAI
SET @ENTRY := 31280;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,1,100,0,5000,5000,3000,4000,11,59894,0,0,0,0,0,19,32225,100,0,0,0,0,0,"Ymirheim Spear Gun - Out of Combat - Cast 'Launch Spear' (Phase 1)"),
(@ENTRY,0,1,0,1,1,100,0,5000,5000,3000,4000,11,59894,0,0,0,0,0,19,32225,100,0,0,0,0,0,"Ymirheim Spear Gun - Out of Combat - Cast 'Launch Spear' (Phase 1)"),
(@ENTRY,0,2,3,8,0,100,0,59880,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Set Event Phase 2"),
(@ENTRY,0,3,0,61,0,100,0,59880,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Run Script"),
(@ENTRY,0,4,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Reset - Set Event Phase 1");

-- Actionlist SAI
SET @ENTRY := 3128000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,15000,15000,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Event Phase 1");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=32227 AND `SourceEntry`=46598;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 32227, 46598, 0, 0, 9, 0, 13309, 0, 0, 0, 0, 0, '', 'Required quest ''Assault by Ait'' active for spellclick');


-- DB/Quest: Assault by Air (A)
UPDATE `creature_template` SET `spell1`=59880 WHERE `entry`=31884;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE  `guid`=125330;
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=31881;
UPDATE `creature_template` SET `speed_run`=3 WHERE  `entry`=31881;
UPDATE `vehicle_template_accessory` SET `minion`=1 WHERE  `entry`=31881 AND `seat_id`=0;

DELETE FROM `waypoints` WHERE `entry`=31881;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(31881, 1, 7513.354, 1781.131, 381.561, 'Kor\'kron Troop Transport'),
(31881, 2, 7508.576, 1843.856, 445.5052, 'Kor\'kron Troop Transport'),
(31881, 3, 7496.634, 1890.942, 496.6479, 'Kor\'kron Troop Transport'),
(31881, 4, 7451.161, 1990.051, 581.2389, 'Kor\'kron Troop Transport'),
(31881, 5, 7372.757, 2143.088, 590.3499, 'Kor\'kron Troop Transport'),
(31881, 6, 7293.971, 2233.48, 602.4611, 'Kor\'kron Troop Transport'),
(31881, 7, 7117.833, 2278.535, 605.0721, 'Kor\'kron Troop Transport'),
(31881, 8, 7017.111, 2263.003, 647.082, 'Kor\'kron Troop Transport'),
(31881, 9, 6996.222, 2205.772, 679.2115, 'Kor\'kron Troop Transport'),
(31881, 10, 7061.963, 2173.603, 675.7964, 'Kor\'kron Troop Transport'),
(31881, 11, 7121.235, 2156.643, 656.629, 'Kor\'kron Troop Transport'),
(31881, 12, 7217.851, 2134.94, 612.4905, 'Kor\'kron Troop Transport'),
(31881, 13, 7288.108, 2086.021, 596.8795, 'Kor\'kron Troop Transport'),
(31881, 14, 7327.417, 1958.794, 585.9348, 'Kor\'kron Troop Transport'),
(31881, 15, 7298.545, 1875.991, 585.4906, 'Kor\'kron Troop Transport'),
(31881, 16, 7249.319, 1800.969, 588.4902, 'Kor\'kron Troop Transport'),
(31881, 17, 7157.543, 1745.975, 588.4902, 'Kor\'kron Troop Transport'),
(31881, 18, 7067.531, 1718.656, 588.4902, 'Kor\'kron Troop Transport'),
(31881, 19, 6988.929, 1710.539, 589.5177, 'Kor\'kron Troop Transport'),
(31881, 20, 6858.088, 1715.7, 617.0735, 'Kor\'kron Troop Transport'),
(31881, 21, 6789.24, 1811.618, 658.2943, 'Kor\'kron Troop Transport'),
(31881, 22, 6741.477, 1881.004, 687.6509, 'Kor\'kron Troop Transport'),
(31881, 23, 6687.517, 1859.595, 701.3486, 'Kor\'kron Troop Transport'),
(31881, 24, 6683.648, 1766.575, 692.5154, 'Kor\'kron Troop Transport'),
(31881, 25, 6738.948, 1709.63, 686.7657, 'Kor\'kron Troop Transport'),
(31881, 26, 6906.804, 1642.973, 664.1547, 'Kor\'kron Troop Transport'),
(31881, 27, 7009.317, 1640.16, 631.8771, 'Kor\'kron Troop Transport'),
(31881, 28, 7174.014, 1608.189, 554.7385, 'Kor\'kron Troop Transport'),
(31881, 29, 7328.232, 1587.251,  465.3495, 'Kor\'kron Troop Transport'),
(31881, 30, 7449.845, 1582.211, 415.2385, 'Kor\'kron Troop Transport'),
(31881, 31, 7493.209, 1659.839, 383.9886, 'Kor\'kron Troop Transport'),
(31881, 32, 7508.813, 1745.664, 371.2109, 'Kor\'kron Troop Transport');

-- Kor'kron Suppression Turret SAI
SET @ENTRY := 31884;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,27,0,100,0,0,0,0,0,45,1,0,0,0,0,0,19,31881,10,0,0,0,0,0,"Kor'kron Suppression Turret - On Passenger Boarded - Set Data 1 0"),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Suppression Turret - On Just Died - Despawn Instant");

-- Kor'kron Troop Transport SAI
SET @ENTRY := 31881;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Data Set 1 0 - Run Script"),
(@ENTRY,0,1,0,40,0,100,0,11,31881,0,0,11,64631,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 11 Reached - Cast 'Eject Passenger 3'"),
(@ENTRY,0,2,0,40,0,100,0,16,31881,0,0,11,64614,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 16 Reached - Cast 'Eject Passenger 4'"),
(@ENTRY,0,3,0,40,0,100,0,19,31881,0,0,11,64633,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 19 Reached - Cast 'Eject Passenger 5'"),
(@ENTRY,0,4,0,40,0,100,0,22,31881,0,0,11,64634,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 22 Reached - Cast 'Eject Passenger 6'"),
(@ENTRY,0,5,6,40,0,100,0,32,31881,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 32 Reached - Despawn Instant"),
(@ENTRY,0,6,7,61,0,100,0,32,31881,0,0,116,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 32 Reached - Despawn Instant"),
(@ENTRY,0,7,0,61,0,100,0,32,31881,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Waypoint 32 Reached - Despawn Instant");
UPDATE `creature_template` SET `HealthModifier`=5000 WHERE  `entry`=31881;

-- Actionlist SAI
SET @ENTRY := 3188100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,2000,2000,0,0,53,1,31881,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Set Reactstate Passive"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,18,131072,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Set Flag Pacified"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Troop Transport - On Script - Set Health Regeneration Off");

-- Kor'kron Infiltrator SAI
SET @ENTRY := 31882;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,23,0,100,1,46598,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Has Aura 'Ride Vehicle Hardcoded' - Run Script (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 3188200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,59977,0,0,0,0,0,21,20,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Cast 'Horde Air Dropoff Kill Credit'"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,100,100,0,0,11,45472,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Cast 'Parachute'"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Infiltrator - On Script - Despawn Instant");

DELETE FROM `creature_text` WHERE `entry`=31882;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextId`) VALUES 
(31882, 0, 0, 'I''ll kill one just for you.', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32532),
(31882, 0, 1, 'Dropping. Good luck, boys!', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32526),
(31882, 0, 2, 'Thanks for the cover!', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32527),
(31882, 0, 3, 'Destination reached - engaging in scouting mission.', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32528),
(31882, 0, 4, 'Infiltration commencing.', 12, 0, 100, 0, 0, 0, 'Kor''kron Infiltrator',32529);

-- Ymirheim Spear Gun SAI
SET @ENTRY := 31280;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,1,100,0,5000,5000,3000,4000,11,59894,0,0,0,0,0,19,31881,100,0,0,0,0,0,"Ymirheim Spear Gun - Out of Combat - Cast 'Launch Spear' (Phase 1)"),
(@ENTRY,0,1,2,8,0,100,0,59880,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Set Event Phase 2"),
(@ENTRY,0,2,0,61,0,100,0,59880,0,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Spellhit 'Suppression Charge' - Run Script"),
(@ENTRY,0,3,0,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ymirheim Spear Gun - On Reset - Set Event Phase 1");

-- Actionlist SAI
SET @ENTRY := 3128000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,15000,15000,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Event Phase 1");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=31884 AND `SourceEntry`=46598;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 31884, 46598, 0, 0, 9, 0, 13310, 0, 0, 0, 0, 0, '', 'Required quest ''Assault by Ait'' active for spellclick');

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE  `entry`=190590;
DELETE FROM `smart_scripts` WHERE `entryorguid`=190590 AND  `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(190590, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 70, 60, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Unstable Explosives - On State Changed - Despawn for 60 sec');

-- Scarlet Onslaught Daily Orders
UPDATE `gameobject` SET `spawntimesecs`=60 WHERE `id` IN (188676, 188675, 188677);

-- No Rest For The Wicked -- http://wotlk.openwow.com/quest=13367
-- Cult Researcher SAI
SET @ENTRY := 32297;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,1000,4000,5000,11,15587,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cult Researcher - In Combat - Cast 'Mind Blast'"),
(@ENTRY,0,1,0,0,0,100,0,5000,9000,13000,18000,11,62129,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cult Researcher - In Combat - Cast 'Wail of Souls'");

UPDATE `item_template` SET `duration`=120 WHERE  `entry` IN (44479, 44476, 44478, 44477);

-- [Q] Dun-da-Dun-tah! - http://www.wowhead.com/quest=12082/dun-da-dun-tah
-- Harrison Jones SAI
SET @ENTRY := 26814;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,11,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Set Faction 0"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Set Invincibility Hp 1"),
(@ENTRY,0,2,33,61,0,100,0,0,0,0,0,71,0,3,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Change Equipment"),
(@ENTRY,0,3,4,19,0,100,0,12082,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Quest 'Dun-da-Dun-tah!' Taken - Run Script"),
(@ENTRY,0,4,0,61,0,100,0,12082,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,"Harrison Jones - On Quest 'Dun-da-Dun-tah!' Taken - Store Targetlist"),
(@ENTRY,0,5,6,40,0,100,0,7,26814,0,0,54,8500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 7 Reached - Pause Waypoint"),
(@ENTRY,0,6,0,61,0,100,0,7,26814,0,0,1,1,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 7 Reached - Say Line 1"),
(@ENTRY,0,7,32,52,0,100,0,1,26814,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Text 1 Over - Say Line 2"),
(@ENTRY,0,8,9,40,0,100,0,9,26814,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 9 Reached - Pause Waypoint"),
(@ENTRY,0,9,0,61,0,100,0,9,26814,0,0,80,@ENTRY*100+01,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 9 Reached - Run Script"),
(@ENTRY,0,10,11,40,0,100,0,11,26814,0,0,54,18000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 11 Reached - Pause Waypoint"),
(@ENTRY,0,11,0,61,0,100,0,11,26814,0,0,80,@ENTRY*100+02,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 11 Reached - Run Script"),
(@ENTRY,0,12,13,40,0,100,0,13,26814,0,0,54,4600,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 13 Reached - Pause Waypoint"),
(@ENTRY,0,13,0,61,0,100,0,13,26814,0,0,1,4,4600,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 13 Reached - Say Line 4"),
(@ENTRY,0,14,0,52,0,100,0,4,26814,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Text 4 Over - Say Line 5"),
(@ENTRY,0,15,0,40,0,100,0,16,26814,0,0,9,0,0,0,0,0,0,20,188480,50,0,0,0,0,0,"Harrison Jones - On Waypoint 16 Reached - Activate Gameobject"),
(@ENTRY,0,16,17,40,0,100,0,17,26814,0,0,54,500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 17 Reached - Pause Waypoint"),
(@ENTRY,0,17,0,61,0,100,0,17,26814,0,0,12,26865,2,300000,0,0,0,8,0,0,0,4906.59,-4818.92,32.6393,2.53073,"Harrison Jones - On Waypoint 17 Reached - Summon Creature 'Tecahuna'"),
(@ENTRY,0,18,0,40,0,100,0,18,26814,0,0,80,@ENTRY*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 18 Reached - Run Script"),
(@ENTRY,0,19,20,2,0,100,1,0,0,0,0,32,0,0,0,0,0,0,20,188480,50,0,0,0,0,0,"Harrison Jones - Between 0-0% Health - Reset Gameobject (No Repeat)"),
(@ENTRY,0,20,21,61,0,100,0,0,0,0,0,6,12082,0,0,0,0,0,12,1,0,0,0,0,0,0,"Harrison Jones - Between 0-0% Health - Fail Quest 'Dun-da-Dun-tah!' (No Repeat)"),
(@ENTRY,0,21,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - Between 0-0% Health - Kill Self (No Repeat)"),
(@ENTRY,0,22,23,56,0,100,0,17,26814,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Say Line 6"),
(@ENTRY,0,23,0,61,0,100,0,17,26814,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Set Run On"),
(@ENTRY,0,24,0,38,0,100,0,0,1,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Data Set 0 1 - Set Event Phase 1"),
(@ENTRY,0,25,0,7,1,100,0,0,0,0,0,80,@ENTRY*100+04,2,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Evade - Run Script (Phase 1)"),
(@ENTRY,0,26,27,40,0,100,0,21,268140,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 21 Reached - Pause Waypoint"),
(@ENTRY,0,27,0,61,0,100,0,21,268140,0,0,1,9,0,0,0,0,0,21,100,0,0,0,0,0,0,"Harrison Jones - On Waypoint 21 Reached - Say Line 9"),
(@ENTRY,0,28,29,56,0,100,0,21,268140,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Set Run On"),
(@ENTRY,0,29,0,61,0,100,0,21,268140,0,0,15,12082,0,0,0,0,0,12,1,0,0,0,0,0,0,"Harrison Jones - On Waypoint Resumed - Quest Credit 'Dun-da-Dun-tah!'"),
(@ENTRY,0,30,0,40,0,100,0,25,268140,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 25 Reached - Despawn Instant"),
(@ENTRY,0,31,0,4,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Aggro - Set Reactstate Aggressive"),
(@ENTRY,0,32,0,61,0,100,0,1,26814,0,0,45,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Text 1 Over - Set Data 7 0"),
(@ENTRY,0,33,0,61,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Respawn - Add Npc Flag Questgiver"),
(@ENTRY,0,34,0,6,0,100,0,0,0,0,0,45,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Just Died - Set Data 7 0"),
(@ENTRY,0,35,0,40,0,100,0,2,268140,0,0,45,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Waypoint 2 Reached - Set Data 7 0");

-- Actionlist SAI
SET @ENTRY := 2681400;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,500,500,0,0,9,0,0,0,0,0,0,20,188465,5,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Faction 250"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,71,0,2,0,2081,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Change Equipment"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Remove Npc Flags Gossip & Questgiver"),
(@ENTRY,9,5,0,0,0,100,0,2500,2500,0,0,53,0,26814,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Start Waypoint"),
(@ENTRY,9,6,0,0,0,100,0,7000,7000,0,0,9,0,0,0,0,0,0,20,188465,50,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Active On");

-- Actionlist SAI
SET @ENTRY := 2681401;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Emote State 133"),
(@ENTRY,9,1,0,0,0,100,0,2500,2500,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Emote State 0"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 3"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,188487,5,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,24405,5,0,0,0,0,0,"Harrison Jones - On Script - Set Data 0 1"),
(@ENTRY,9,5,0,0,0,100,0,10000,10000,0,0,9,0,0,0,0,0,0,20,188487,5,0,0,0,0,0,"Harrison Jones - On Script - Activate Gameobject");

-- Actionlist SAI
SET @ENTRY := 2681402;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,6.14356,"Harrison Jones - On Script - Set Orientation 6.14356"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Flag Standstate Kneel"),
(@ENTRY,9,2,0,0,0,100,0,2400,2400,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.67748,"Harrison Jones - On Script - Set Orientation 4.67748"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Remove Flag Standstate Kneel"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,71,0,1,32246,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Change Equipment"),
(@ENTRY,9,5,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Emote 36"),
(@ENTRY,9,6,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Sound 12827"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Cast 'Camera Shake - Small'"),
(@ENTRY,9,8,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Emote 36"),
(@ENTRY,9,9,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Sound 12827"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Cast 'Camera Shake - Small'"),
(@ENTRY,9,11,0,0,0,100,0,2500,2500,0,0,5,36,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Emote 36"),
(@ENTRY,9,12,0,0,0,100,0,0,0,0,0,4,12827,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Play Sound 12827"),
(@ENTRY,9,13,0,0,0,100,0,0,0,0,0,11,47533,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Cast 'Camera Shake - Small'"),
(@ENTRY,9,14,0,0,0,100,0,2000,2000,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4902.23,-4827.56,32.6125,2.44346,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4876.61,-4805.58,32.5825,6.17846,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4877.39,-4815.75,32.5835,0.15708,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4883.1,-4823.98,32.5884,0.872665,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,18,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4892.31,-4828.58,32.5958,1.5708,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4908.68,-4794.35,32.6706,3.97935,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4899.54,-4789.86,32.5981,4.76475,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,21,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4889.96,-4790.65,32.5985,5.20108,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,22,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4914.76,-4813.24,32.5866,3.01942,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'"),
(@ENTRY,9,23,0,0,0,100,0,0,0,0,0,12,26867,2,300000,0,0,0,8,0,0,0,4914.13,-4802.8,32.6696,3.42085,"Harrison Jones - On Script - Summon Creature 'Mummy Effect Bunny'");

-- Actionlist SAI
SET @ENTRY := 2681403;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 7"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Home Position"),
(@ENTRY,9,2,0,0,0,100,0,7200,7200,0,0,1,8,0,0,0,0,0,21,100,0,0,0,0,0,0,"Harrison Jones - On Script - Say Line 8"),
(@ENTRY,9,3,0,0,0,100,0,6000,6000,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Reactstate Aggressive");

-- Actionlist SAI
SET @ENTRY := 2681404;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,53,1,268140,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Start Waypoint"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Harrison Jones - On Script - Set Event Phase 0");

UPDATE `creature_template` SET `ScriptName`='npc_harrison_jones_grizzly' WHERE  `entry`=26814;

-- Fire Upon the Waters -- http://www.wowhead.com/quest=12243/fire-upon-the-waters
SET @CGUID := 4109129;

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+31;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 24110, 571, 1, 2480.52, -405.0309, 31.25292, 1.954769, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+1, 24110, 571, 1, 2485.832, -406.4011, 38.64569, 1.937315, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+2, 24110, 571, 1, 2483.247, -405.9387, 35.05476, 4.991642, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+3, 24110, 571, 1, 2477.307, -404.4191, 27.71297, 2.530727, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+4, 24110, 571, 1, 2490.05, -404.6198, 27.34736, 0, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+5, 24110, 571, 1, 2486.804, -396.4983, 37.61678, 6.248279, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+6, 24110, 571, 1, 2473.764, -403.68, 23.80915, 3.246312, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+7, 24110, 571, 1, 2489.167, -395.6806, 28.83605, 0.01745329, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+8, 24110, 571, 1, 2488.105, -403.3663, 35.30573, 2.80998, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+9, 24110, 571, 1, 2457.642, -389.6918, 23.55255, 6.143559, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+10, 24110, 571, 1, 2469.61, -402.5246, 21.45798, 4.08407, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+11, 24110, 571, 1, 2454.252, -397.5855, 51.25713, 0.03490658, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+12, 24110, 571, 1, 2457.418, -405.3847, 30.72205, 6.213372, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+13, 24110, 571, 1, 2483.101, -393.8391, 43.72463, 2.897247, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+14, 24110, 571, 1, 2455.441, -395.9613, 42.66463, 0.05235988, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+15, 24110, 571, 1, 2454.66, -404.776, 48.54633, 6.143559, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+16, 24110, 571, 1, 2458.783, -404.1076, 23.79817, 6.265732, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+17, 24110, 571, 1, 2458.11, -410.4796, 22.85155, 6.195919, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+18, 24110, 571, 1, 2481.292, -393.944, 40.58387, 4.171337, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+19, 24110, 571, 1, 2457.773, -397.1545, 31.50192, 6.195919, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+20, 24110, 571, 1, 2469.01, -396.4393, 25.475, 0.2792527, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+21, 24110, 571, 1, 2478.411, -394.4479, 36.02073, 4.223697, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+22, 24110, 571, 1, 2456.78, -389.8281, 32.9614, 0, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+23, 24110, 571, 1, 2460.665, -399.6276, 19.7543, 3.089233, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+24, 24110, 571, 1, 2476.166, -394.8342, 31.92243, 1.27409, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+25, 24110, 571, 1, 2455.731, -404.8611, 40.88202, 6.213372, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+26, 24110, 571, 1, 2460.889, -401.5321, 19.4641, 5.131268, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+27, 24110, 571, 1, 2464.679, -397.7112, 21.8534, 5.113815, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+28, 24110, 571, 1, 2464.713, -401.7634, 19.7663, 0.06981317, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+29, 24110, 571, 1, 2456.293, -412.3963, 29.24669, 6.073746, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+30, 24110, 571, 1, 2472.812, -395.45, 28.40558, 3.368485, 120, 0, 0), -- 24110 (Area: 4181)
(@CGUID+31, 24110, 571, 1, 2458.6, -396.5036, 23.42054, 6.248279, 120, 0, 0); -- 24110 (Area: 4181)

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=28013;
UPDATE `creature_template` SET `AIName`='' WHERE  `entry`=28013;
DELETE FROM `creature` WHERE  `id`=28013;

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` BETWEEN -@CGUID-31 AND -@CGUID-0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(-@CGUID-0, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-0, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-1, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-1, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-2, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-2, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-3, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-3, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-4, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-4, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-5, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-5, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-6, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-6, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-7, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-7, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-8, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-8, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-9, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-9, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-10, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-10, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-11, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-11, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-12, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-12, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-13, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-13, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-14, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-14, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-15, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-15, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-16, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-16, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-17, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-17, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-18, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-18, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-19, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-19, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-20, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-20, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-21, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-21, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-22, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-22, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-23, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-23, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-24, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-24, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-25, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-25, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-26, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-26, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-27, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-27, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-28, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-28, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-29, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-29, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-30, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-30, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\''),
(-@CGUID-31, 0, 0, 1, 8, 0, 100, 0, 48455, 0, 0, 0, 11, 50290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Fire Upon the Waters: Sail Burning Kill Credit\''),
(-@CGUID-31, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 48522, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny Large - On Spellhit \'Apothecary\'s Burning Water\' - Cast \'Sinner''s Folly Fire Bunny: Periodic Fire Aura\'');

UPDATE `conditions` SET `ConditionValue2`=24110, `Comment`='Fire Upon the Waters - spell to ELM General Purpose Bunny Large' WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=48455 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=28013 AND `ConditionValue3`=0;

-- [Q] Territorial Trespass -- http://www.wowhead.com/quest=13051/territorial-trespass
DELETE FROM `spell_script_names` WHERE `spell_id`=56788;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(56788, 'spell_place_stolen_eggs');

DELETE FROM `event_scripts` WHERE `id`=19714;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES (19714, 10, 10, 30461, 600000, 0, 6947.48, -859.518, 1147.6, 5.67487);

DELETE FROM `waypoints` WHERE `entry`=30461;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(30461, 1, 7093.494629, -913.732178, 1067.546265, 'Veranus - WP1');

DELETE FROM `waypoints` WHERE `entry`=3046100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(3046100, 1, 7276.143555, -947.613098, 1290.209961, 'Veranus - WP2');

-- Veranus SAI
SET @ENTRY := 30461;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,8,63,0,100,0,0,0,0,0,53,1,30461,0,13051,0,0,1,0,0,0,0,0,0,0,"Veranus - On Just Created - Start Waypoint"),
(@ENTRY,0,1,2,58,0,100,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Waypoint Finished - Say Line 0"),
(@ENTRY,0,2,3,61,0,100,0,1,0,0,0,33,30461,0,0,0,0,0,7,0,0,0,0,0,0,0,"Veranus - On Waypoint Finished - Quest Credit 'Territorial Trespass'"),
(@ENTRY,0,3,6,61,0,100,0,1,0,0,0,12,30462,8,0,0,0,0,8,0,0,0,7096.86,-904.658,1119.9,2.33874,"Veranus - On Waypoint Finished - Summon Creature 'Thorim'"),
(@ENTRY,0,4,5,38,0,100,0,1,1,0,0,53,0,@ENTRY*100+00,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Data Set 1 1 - Start Waypoint"),
(@ENTRY,0,5,7,61,0,100,0,1,1,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Data Set 1 1 - Despawn In 10000 ms"),
(@ENTRY,0,6,0,61,0,100,0,1,0,0,0,91,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Waypoint Finished - Remove Flag Hover"),
(@ENTRY,0,7,0,61,0,100,0,1,1,0,0,90,2,3,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Data Set 1 1 - Set Flag Hover"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Veranus - On Just Created - Set Active On");

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

-- Examples to be made -- http://www.wowhead.com/quest=12907/examples-to-be-made
UPDATE `creature_template` SET `faction` = 7 WHERE `entry`IN(29427, 30146, 30147);
UPDATE `creature_template` SET flags_extra = flags_extra | 0x40000000 WHERE entry IN(30147, 29426);

-- Garhal SAI
SET @ENTRY := 30147;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,5000,9000,11,50306,0,0,0,0,0,2,0,0,0,0,0,0,0,"Garhal - Within 0-5 Range - Cast 'Thrash Kick'"),
(@ENTRY,0,1,2,0,0,100,0,0,100,15000,15000,45,0,5,0,0,0,0,9,29426,0,8,0,0,0,0,"Garhal - In Combat - Set Data 0 5"),
(@ENTRY,0,2,3,61,0,100,0,0,100,15000,15000,45,0,5,0,0,0,0,9,29427,0,9,0,0,0,0,"Garhal - In Combat - Set Data 0 5"),
(@ENTRY,0,3,0,61,0,100,0,0,100,15000,15000,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Garhal - In Combat - Set Faction 190"),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,2,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Garhal - On Respawn - Set Faction 7");
-- Hyldnir Overseer SAI
SET @ENTRY := 29426;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,7000,11000,16000,11,30931,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hyldnir Overseer - In Combat - Cast 'Battle Shout'"),
(@ENTRY,0,1,0,8,0,100,0,0,5,6000,9000,11,46182,1,0,0,0,0,2,0,0,0,0,0,0,0,"Hyldnir Overseer - On Spellhit - Cast 'Snap Kick'"),
(@ENTRY,0,2,0,38,0,100,0,0,5,0,0,49,0,0,0,0,0,0,19,30147,15,0,0,0,0,0,"Hyldnir Overseer - On Data Set 0 5 - Start Attacking");

-- Captive Vrykul SAI
SET @ENTRY := 29427;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,0,5,0,0,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Vrykul - On Data Set 0 5 - Set Faction 190"),
(@ENTRY,0,1,0,11,0,100,0,0,0,0,0,2,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captive Vrykul - On Respawn - Set Faction 7");

DELETE FROM `creature_addon` WHERE `guid` IN (118803, 118804);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(118803,0,0,0,1,0,''),
(118804,0,0,0,1,0,'');

-- We Call Him Steelfeather (11418)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24514;
DELETE FROM smart_scripts WHERE entryorguid=24514 AND source_type=0;
INSERT INTO smart_scripts VALUES(24514, 0, 0, 1, 8, 0, 100, 0, 43969, 0, 0, 0, 19, 524288, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Evade Hack');
INSERT INTO smart_scripts VALUES(24514, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 60, 1, 300, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Fly');
INSERT INTO smart_scripts VALUES(24514, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Store Target');
INSERT INTO smart_scripts VALUES(24514, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 24514, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Start WP');
INSERT INTO smart_scripts VALUES(24514, 0, 4, 5, 40, 0, 100, 0, 5, 0, 0, 0, 33, 24515, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'On WP Reach - Kill Credit');
INSERT INTO smart_scripts VALUES(24514, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 28, 43969, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'On WP Reach - Remove Aura');
INSERT INTO smart_scripts VALUES(24514, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Despawn');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=43969;
INSERT INTO conditions VALUES (17, 0, 43969, 0, 0, 31, 1, 3, 24514, 0, 0, 0, 0, '', 'Requires Steelfeather');
DELETE FROM waypoints WHERE entry=24514;
INSERT INTO waypoints VALUES (24514, 1, 2613, -5086.51, 398.899, 'Steelfeather'),(24514, 2, 2640.59, -5144.9, 427.292, 'Steelfeather'),(24514, 3, 2611.1, -5253.76, 419.437, 'Steelfeather'),(24514, 4, 2575.39, -5252.23, 382.764, 'Steelfeather'),(24514, 5, 2570.71, -5228.31, 376.612, 'Steelfeather');
DELETE FROM creature_text WHERE entry IN(24139, 24131);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(24131, 0, 0, 'Why not? Just think how much better it\'ll look with the hatchlings to either side --', 12, 0, 100, 0, 0, 0, 'Trapper Jethan'),
(24131, 1, 0, 'What? I\'m just sayin\' that\'s how we do things in Grizzly Hills.', 12, 0, 100, 0, 0, 0, 'Trapper Jethan'),
(24139, 0, 0, 'Y\'hear that, Jethan? You\'re not getting that Steelfeather trophy now that we know she\'s a mother.', 12, 0, 100, 0, 0, 0, 'Gil Grisert'),
(24139, 1, 0, 'Jethan!', 12, 0, 100, 0, 0, 0, 'Gil Grisert');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=24139;
DELETE FROM smart_scripts WHERE entryorguid=24139 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=24139*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (24139, 0, 0, 0, 20, 0, 100, 0, 11418, 0, 0, 0, 80, 24139*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Rewarded - Script9');
INSERT INTO smart_scripts VALUES (24139*100, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');
INSERT INTO smart_scripts VALUES (24139*100, 9, 1, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 24131, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');
INSERT INTO smart_scripts VALUES (24139*100, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');
INSERT INTO smart_scripts VALUES (24139*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, 24131, 0, 0, 0, 0, 0, 0, 'Script 9 - Talk');

-- Quest It's All Fun and Games [A][H] - www.wowhead.com/quest=12892/its-all-fun-and-games - http://www.wowhead.com/quest=12887/its-all-fun-and-games
-- The Ocular SAI
SET @ENTRY := 29747;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,75,55162,1,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Reset - Add Aura 'The Ocular: Transform'"),
(@ENTRY,0,1,0,1,0,100,0,0,0,0,0,85,55289,0,0,0,0,0,18,200,0,0,0,0,0,0,"The Ocular - Out of Combat - Invoker Cast 'It's All Fun and Games: The Ocular Kill Credit'"),
(@ENTRY,0,2,0,0,0,100,0,1500,1500,4000,4000,11,55269,0,0,0,0,0,2,0,0,0,0,0,0,0,"The Ocular - In Combat - Cast 'Deathly Stare'"),
(@ENTRY,0,3,0,6,0,100,0,0,0,0,0,33,29803,0,0,0,0,0,7,0,0,0,0,0,0,0,"The Ocular - On Just Died - Quest Credit ''"),
(@ENTRY,0,4,5,6,0,100,0,0,0,0,0,200,60,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Just Died - set respawntimer"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,116,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Just Died - set respawntimer"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Just Died - Despawn Instant"),
(@ENTRY,0,7,0,11,0,100,0,0,0,0,0,75,43775,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Respawn - Add Aura 'Flight'"),
(@ENTRY,0,8,0,1,0,100,0,1000,1000,1000,1000,201,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - Out of Combat - Move Homeposition"),
(@ENTRY,0,9,0,37,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"The Ocular - On Init - set active");
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=29789;

DELETE FROM `creature_template_addon` WHERE `entry`=29747;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (29747, 0, 0, 50331648, 1, 0, '43775');
UPDATE `creature_model_info` SET `CombatReach`=60 WHERE  `DisplayID`=6533;
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=29747;

-- The gunship chest should contain 3 items
UPDATE `gameobject_loot_template` SET `MinCount`=3, `MaxCount`=3 WHERE  `Entry`=28090 AND `Item`=1;
UPDATE `gameobject_loot_template` SET `MinCount`=3, `MaxCount`=3 WHERE  `Entry`=28072 AND `Item`=1;

-- [Quest] Seeking Spiritual Aid - http://www.wowhead.com/quest=5158/deprecated-seeking-spiritual-aid
-- Islen Waterseer SAI
SET @ENTRY := 5901;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,5158,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Quest 'Seeking Spiritual Aid' Finished - Run Script"),
(@ENTRY,0,1,0,61,0,100,0,5158,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Islen Waterseer - On Quest 'Seeking Spiritual Aid' Finished - Store Targetlist");

-- Actionlist SAI
SET @ENTRY := 590100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Set Flag Not Selectable"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Set Run Off"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,69,0,0,0,0,0,0,8,0,0,0,-1345.16,-4065.02,-0.49,4.73,"Islen Waterseer - On Script - Move To Position"),
(@ENTRY,9,3,0,0,0,100,0,8000,8000,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"Islen Waterseer - On Script - Say Line 0"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,12,11256,3,25000,0,0,0,8,0,0,0,-1346.59,-4076.39,-1.23,1.6,"Islen Waterseer - On Script - Summon Creature 'Manifestation of Water'"),
(@ENTRY,9,5,0,0,0,100,0,12000,12000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,2000,2000,0,0,69,0,0,0,0,0,0,8,0,0,0,-1345,-4048,6.09,4.34,"Islen Waterseer - On Script - Move To Position"),
(@ENTRY,9,7,0,0,0,100,0,6000,6000,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,"Islen Waterseer - On Script - Remove Flag Not Selectable"),
(@ENTRY,9,8,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.345870,"Islen Waterseer - On Script - Set Orientation 4,345870");

-- Manifestation of Water SAI
SET @ENTRY := 11256;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,10000,10000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Manifestation of Water - Out of Combat - Say Line 0 (No Repeat)");

UPDATE `creature_text` SET `type`=12 WHERE  `entry`=5901 AND `groupid`=0 AND `id`=0;
UPDATE `creature_text` SET `text`='[Kalimag] Ma reth bromo zoln kilagrin dra ma zoern tu ko fraht ko tadrom Ma krin drinor zoln drinor Ma krin kan aasrugel korsul.', `BroadcastTextId`=0, `type`=12 WHERE  `entry`=11256 AND `groupid`=0 AND `id`=0;
