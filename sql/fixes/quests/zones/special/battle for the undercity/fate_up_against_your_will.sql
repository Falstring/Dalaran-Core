-- Quest: Fate, Up Against Your Will + A Royal Coup + The Killing Time
-- Jaina in SW
SET @GUID := 3106992;
DELETE FROM `creature` WHERE `guid` = @GUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@GUID, 32346, 0, 1, 1, 0, 0, -8443.1, 331.789, 122.58, 2.31885, 300, 0, 0, 5907158, 746000, 0, 0, 0, 0);

DELETE FROM `creature_text` WHERE `entry`=32346;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(32346, 0, 0, 'Do not do anything that would incite the Horde, $N. The Warchief has agreed to see us on good faith.', 12, 0, 0, 0, 0, 0, 'BftU - Jaina SW', 32799),
(32346, 1, 0, 'Let\'s go.', 12, 0, 0, 0, 0, 0, 'BftU - Jaina SW', 32800);

SET @NPC_GUID := 3106821;
DELETE FROM `creature` WHERE `guid` IN (@NPC_GUID, @NPC_GUID+1);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
-- Thrall 2
(@NPC_GUID, 32363, 1, 1, 128, 0, 0, 1920.36, -4127.6, 43.1426, 4.73984, 300, 0, 0, 23302, 900, 0, 0, 0, 0),
-- Sylvanas 2
(@NPC_GUID+1, 31419, 1, 1, 128, 0, 0, 1920.59, -4130.98, 43.0901, 1.74184, 300, 0, 0, 23302, 900, 0, 0, 0, 0);

UPDATE `creature_template` SET `ScriptName`='npc_thrall_herald_of_war' WHERE  `entry`=32363;
UPDATE `gameobject_template` SET `Data0`=59439 WHERE  `entry`=193955;

SET @NPC := 3106821;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, 1923.388672, -4126.897949, 43.180893, 0),
(@PATH, 2, 1916.156494, -4127.158691, 43.197136, 0);

-- Kor'kron Elite SAI
SET @ENTRY := 31417;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,63,0,100,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'kron Elite - On Just Created - Set Faction 250");

-- Lady Sylvanas Windrunner SAI
SET @ENTRY := 31419;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Sylvanas Windrunner - On Reset - Set Flag Standstate Kneel"),
(@ENTRY,0,1,0,34,0,100,0,8,2,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Sylvanas Windrunner - On Reached Point 2 - Set Flag Standstate Kneel"),
(@ENTRY,0,2,0,63,0,100,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lady Sylvanas Windrunner - On Just Created - Set Faction 250");

DELETE FROM `creature_text` WHERE `entry`=32363;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(32363, 0, 0, 'Kor\'kron, stand down!', 12, 0, 0, 0, 0, 16222, 'BftU - Thrall in OG', 32286),
(32363, 1, 0, 'Jaina...', 12, 0, 0, 0, 0, 16223, 'BftU - Thrall in OG', 32287),
(32363, 2, 0, 'Jaina, what happened at the Wrathgate. It was a betrayal from within...', 12, 0, 0, 0, 0, 16224, 'BftU - Thrall in OG', 32289),
(32363, 3, 0, 'The Horde has lost the Undercity.', 12, 0, 0, 0, 0, 16225, 'BftU - Thrall in OG', 32292),
(32363, 4, 0, 'We now prepare to lay siege to the city and bring in the perpetrators of the unforgivable crime to justice.', 12, 0, 0, 0, 0, 16226, 'BftU - Thrall in OG', 32293),
(32363, 5, 0, 'Know this, Jaina: War with the Alliance is not in our best interests. If we are forced into a conflict, the Lich King will destroy our divided forces in Northrend.', 12, 0, 0, 0, 0, 16227, 'BftU - Thrall in OG', 32294),
(32363, 6, 0, 'We will make this right, Jaina. Tell your king all that you have learned here.', 12, 0, 0, 0, 0, 16228, 'BftU - Thrall in OG', 32295),
(32363, 7, 0, 'Kor\'kron, prepare transport to the Undercity.', 12, 0, 0, 0, 0, 16229, 'BftU - Thrall in OG', 32300);

DELETE FROM `spell_area` WHERE `spell`=60815 AND `area`=85 AND `quest_start`=13371;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(60815, 85, 13371, 13377, 0, 0, 2, 1, 74, 11);
