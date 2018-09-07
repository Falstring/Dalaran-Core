UPDATE creature_template SET speed_walk=1.2, speed_run=1.42 WHERE entry IN(33707);
UPDATE creature_template SET damageModifier=4 WHERE entry IN(33707);
-- Argent Champion SAI mechanic
SET @Arg_Champion := 33707;
SET @Script := 3370700;
UPDATE `creature_template` SET `AIName`='SmartAI',`ScriptName`='',`faction`=35, `gossip_menu_id`=10343, `unit_flags`=0, `npcflag`=1 WHERE `entry`=@Arg_Champion;
DELETE FROM `creature_template_addon` WHERE `entry`=33707;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(33707,0,28919,0,1,0,'63501 62852 64723');
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Arg_Champion;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=@Script;
-- Argent Champion SAI
SET @ENTRY := 33707;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10343,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Argent Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,0,61,0,100,0,10343,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,3,0,52,0,100,0,0,33707,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Argent Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,4,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Argent Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,5,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Argent Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,6,0,0,0,100,0,5000,10000,6000,7000,46,25,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - In Combat - Move Forward 25 Yards"),
(@ENTRY,0,7,8,9,0,100,0,8,25,4000,5000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Argent Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,9,0,2,0,100,1,1,25,60000,60000,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - Between 1-25% Health - Set Faction 35 (No Repeat)"),
(@ENTRY,0,10,11,2,0,100,1,1,25,60000,60000,33,33708,0,0,0,0,0,7,0,0,0,0,0,0,0,"Argent Champion - Between 1-25% Health - Quest Credit '' (No Repeat)"),
(@ENTRY,0,11,12,61,0,100,0,1,25,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - Between 1-25% Health - Say Line 2 (No Repeat)"),
(@ENTRY,0,12,0,61,0,100,0,1,25,60000,60000,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - Between 1-25% Health - Despawn In 3000 ms (No Repeat)"),
(@ENTRY,0,13,14,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,14,15,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,15,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Champion - On Killed Unit - Despawn Instant"),

-- Timed actionlist 1
(@Script,9,1,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run ON'),
(@Script,9,2,0,0,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run ON'),
(@Script,9,3,0,0,0,100,0,0,0,0,0,11,62719,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast Defend on self/Layer 1/'),
(@Script,9,4,0,0,0,100,0,0,0,0,0,11,62719,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast Defend on self/Layer 2/'),
(@Script,9,5,0,0,0,100,0,0,0,0,0,46,20,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Move forward 15 yards'),
(@Script,9,6,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Set run Off'),
(@Script,9,7,0,0,0,100,0,0,0,0,0,11,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Cast aura TriggerS for Defend /10 sec one/'),
(@Script,9,8,0,0,0,100,0,3500,3500,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,'All champions - Script 1 - Change faction to 14'),
(@Script,9,9,0,0,0,100,0,0,0,0,0,1,0,1500,0,0,0,0,2,0,0,0,0,0,0,0,'All champions - Script 1 - Say text');
-- Argent Champions texts
--
SET @Arg_Champion := 33707;
-- Squire Danny gossip
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10343;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, box_text, `BoxBroadcastTextID` ) VALUES
( 10343, 0, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 1, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 2, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 3, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 4, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 5, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 6, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 7, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 8, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0),
( 10343, 9, 0, 'I am ready to fight!', 33430, 1, 1, 0, 0, 0, 0, '' ,0); 

-- Argent Champions texts
DELETE FROM `creature_text` WHERE `entry`= @Arg_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`,`BroadcastTextId`) VALUES
(@Arg_Champion,0,1,'Ready yourself!',12,0,100,1,1000,0,'Argent Champion',33753),
(@Arg_Champion,0,2,'Prepare yourself!',12,0,100,1,1000,0,'Argent Champion',33750),
(@Arg_Champion,0,3,'On your guard!',12,0,100,1,1000,0,'Argent Champion',33752),
(@Arg_Champion,0,4,'On your guard!',12,0,100,1,1000,0,'Argent Champion',33756),
(@Arg_Champion,0,5,'Let it begin!',12,0,100,1,1000,0,'Argent Champion',33758),
(@Arg_Champion,0,6,'Argent Champion is looking winded!',12,0,100,1,1000,0,'Argent Champion',0),
(@Arg_Champion,1,7,'Victory is mine!',12,0,100,1,1000,0,'Argent Champion',33771),
(@Arg_Champion,1,8,'It seems you still need more practice. Perhaps another time.',12,0,100,1,1000,0,'Argent Champion',33763),
(@Arg_Champion,1,9,'I have won. Better luck another time, friend.',12,0,100,1,1000,0,'Argent Champion',33773),
(@Arg_Champion,1,10,'I am afraid you will need more practice to defeat me.',12,0,100,1,1000,0,'Argent Champion',33772),
(@Arg_Champion,2,11,'I yield to you.',12,0,100,1,1000,0,'Argent Champion',33767),
(@Arg_Champion,2,12,'That was a well fought battle. I yield to you.',12,0,100,1,1000,0,'Argent Champion',33776),
(@Arg_Champion,2,13,'It would seem I underestimated your skills. Well done..',12,0,100,1,1000,0,'Argent Champion',33768),
(@Arg_Champion,2,14,'I have been defeated. Good fight!',12,0,100,1,1000,0,'Argent Champion',33868);

-- Squire Danny gossip  conditions
DELETE FROM `conditions` WHERE `SourceGroup`=10343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceID`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`,  `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10343, 0, 0, 0, 9, 13725, 0, 0, 0, 0, '', "Gossip shows up only if the player is on NE quest The Valiant's Challenge"),
(15, 10343, 0, 0, 0, 28, 13725, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 0, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 1, 0, 0, 9, 13724, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Exo quest The Valiant's Challenge"),
(15, 10343, 1, 0, 0, 28, 13724, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed Exo The Valiant's Challenge objectives"),
(15, 10343, 1, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 1, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 2, 0, 0, 9, 13723, 0, 0, 0, 0, '', "Gossip shows up only if the player is on GR quest The Valiant's Challenge"),
(15, 10343, 2, 0, 0, 28, 13723, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed GR The Valiant's Challenge objectives"),
(15, 10343, 2, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 2, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 3, 0, 0, 9, 13713, 0, 0, 0, 0, '', "Gossip shows up only if the player is on IF quest The Valiant's Challenge"),
(15, 10343, 3, 0, 0, 28, 13713, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed IF The Valiant's Challenge objectives"),
(15, 10343, 3, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 3, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 4, 0, 0, 9, 13726, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Org quest The Valiant's Challenge"),
(15, 10343, 4, 0, 0, 28, 13726, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed Org The Valiant's Challenge objectives"),
(15, 10343, 4, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 4, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 5, 0, 0, 9, 13727, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Sen quest The Valiant's Challenge"),
(15, 10343, 5, 0, 0, 28, 13727, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed Sen The Valiant's Challenge objectives"),
(15, 10343, 5, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 5, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 6, 0, 0, 9, 13731, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SM quest The Valiant's Challenge"),
(15, 10343, 6, 0, 0, 28, 13731, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 6, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 6, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 7, 0, 0, 9, 13699, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SW quest The Valiant's Challenge"),
(15, 10343, 7, 0, 0, 28, 13699, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 7, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 7, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 8, 0, 0, 9, 13728, 0, 0, 0, 0, '', "Gossip shows up only if the player is on TB quest The Valiant's Challenge"),
(15, 10343, 8, 0, 0, 28, 13728, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 8, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 8, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 9, 0, 0, 9, 13729, 0, 0, 0, 0, '', "Gossip shows up only if the player is on UC quest The Valiant's Challenge"),
(15, 10343, 9, 0, 0, 28, 13729, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 9, 0, 0, 29, 33707, 100, 0, 1, 0, '', "Gossip doesnt show up if there's a nearby Arg champion"),
(15, 10343, 9, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount");

-- Argent Champion gossip
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10343;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`) VALUES
( 10343, 0, 0, "I am ready to fight!", 1, 1 );
DELETE FROM `gossip_menu` WHERE `entry` = 10343;
INSERT INTO `gossip_menu` (`entry`, `text_id` ) VALUES
( 10343, 14421); 

-- Argent Champion gossip conditions
DELETE FROM `conditions` WHERE `SourceGroup`=10343;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceID`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`,  `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 10343, 0, 0, 0, 9, 13725, 0, 0, 0, 0, '', "Gossip shows up only if the player is on NE quest The Valiant's Challenge"),
(15, 10343, 0, 0, 1, 9, 13724, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Exo quest The Valiant's Challenge"),
(15, 10343, 0, 0, 2, 9, 13723, 0, 0, 0, 0, '', "Gossip shows up only if the player is on GR quest The Valiant's Challenge"),
(15, 10343, 0, 0, 3, 9, 13713, 0, 0, 0, 0, '', "Gossip shows up only if the player is on IF quest The Valiant's Challenge"),
(15, 10343, 0, 0, 4, 9, 13726, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Org quest The Valiant's Challenge"),
(15, 10343, 0, 0, 5, 9, 13727, 0, 0, 0, 0, '', "Gossip shows up only if the player is on Sen quest The Valiant's Challenge"),
(15, 10343, 0, 0, 6, 9, 13731, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SM quest The Valiant's Challenge"),
(15, 10343, 0, 0, 7, 9, 13699, 0, 0, 0, 0, '', "Gossip shows up only if the player is on SW quest The Valiant's Challenge"),
(15, 10343, 0, 0, 8, 9, 13728, 0, 0, 0, 0, '', "Gossip shows up only if the player is on TB quest The Valiant's Challenge"),
(15, 10343, 0, 0, 9, 9, 13729, 0, 0, 0, 0, '', "Gossip shows up only if the player is on UC quest The Valiant's Challenge"),
(15, 10343, 0, 0, 0, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 1, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 2, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 3, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 4, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 5, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 6, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 7, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 8, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 9, 1, 63034, 0, 0, 0, 0, '', "Gossip shows up only if the player is using Tournament Mount"),
(15, 10343, 0, 0, 0, 28, 13725, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 1, 28, 13724, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 2, 28, 13723, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 3, 28, 13713, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 4, 28, 13726, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 5, 28, 13727, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 6, 28, 13731, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 7, 28, 13699, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 8, 28, 13728, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives"),
(15, 10343, 0, 0, 9, 28, 13729, 0, 0, 1, 0, '', "Gossip doesnt show up if the player completed NE The Valiant's Challenge objectives");

-- Summoning
SET @Script := 33518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=33518;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Script;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `target_type`, `target_param1`, `target_param2`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
( @Script, 0, 0, 0, 62, 100, 0, 10343, 0, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 1, 0, 62, 100, 0, 10343, 1, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 2, 0, 62, 100, 0, 10343, 2, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 3, 0, 62, 100, 0, 10343, 3, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 4, 0, 62, 100, 0, 10343, 4, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8541.494, 1083.819, 556.321, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 5, 0, 62, 100, 0, 10343, 5, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 6, 0, 62, 100, 0, 10343, 6, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 7, 0, 62, 100, 0, 10343, 7, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 8, 0, 62, 100, 0, 10343, 8, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 9, 0, 62, 100, 0, 10343, 9, 0, 0, 12, 33707, 1, 300000, 0, 8, 0, 0, 8555.047, 1106.428, 556.788, 1.011, "On gossip select, summons Argent Champion" ),
( @Script, 0, 10, 0, 62, 100, 0, 10343, 0, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 11, 0, 62, 100, 0, 10343, 1, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 12, 0, 62, 100, 0, 10343, 2, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 13, 0, 62, 100, 0, 10343, 3, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 14, 0, 62, 100, 0, 10343, 4, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 15, 0, 62, 100, 0, 10343, 5, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 16, 0, 62, 100, 0, 10343, 6, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 17, 0, 62, 100, 0, 10343, 7, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 18, 0, 62, 100, 0, 10343, 8, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" ),
( @Script, 0, 19, 0, 62, 100, 0, 10343, 9, 0, 0, 72, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, "Squire Danny - On gossip select - Close gossip" );



-- Correct the gossip itself.
-- UPDATE creature_template SET gossip_menu_id=10343 WHERE entry=33707;