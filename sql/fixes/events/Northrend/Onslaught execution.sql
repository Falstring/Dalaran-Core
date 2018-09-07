-- -------------------------------------------
-- Onslaught Execution
-- -------------------------------------------

-- Insert Game Event
DELETE FROM `game_event` WHERE `eventEntry`=70;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`, `announce`) VALUES 
(70, '2016-01-01 20:01:00', '2020-12-31 20:00:00', 360, 5, 0, 'Forsaken Prisoner Execution', 0, 2);

-- Forsaken Prisoner creature update
UPDATE `creature` SET `unit_flags`='33555200', `dynamicflags`='32' WHERE  `guid`IN(97213,97212);
UPDATE `creature_template` SET `unit_flags`='0', `dynamicflags`='0', `mechanic_immune_mask`='0', `AIName`='SmartAI' WHERE  `entry`=27400;
UPDATE `creature_template` SET `unit_flags`='768', `dynamicflags`='0', `mechanic_immune_mask`='0',`AIName`='SmartAI',`ScriptName`='' WHERE  `entry`=27219;
UPDATE `creature_addon` SET `bytes1`='7', `emote`='65' WHERE `guid`IN(97213,103288);



-- Forsaken Prisoner SAI
SET @ENTRY :=27219;
UPDATE `creature_template` SET `ScriptName`='SmartAI' WHERE  `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@ENTRY,@ENTRY*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 68, 0, 100, 0, 70, 0, 0, 0, 53, 0, @ENTRY, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Event Start - Start WP'),
(@ENTRY, 0, 1, 2, 40, 0, 100, 0, 1, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 1 - Remove FB1 Dead'),
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 1, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 1 - State None'),
(@ENTRY, 0, 3, 0, 40, 0, 100, 0, 2, 0, 0, 0, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 2 - Set FB1 Stand'),
(@ENTRY, 0, 4, 0, 40, 0, 100, 0, 4, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 27203, 5, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 4 - Set Data 0 1 (OF)'),
(@ENTRY, 0, 5, 6, 40, 0, 100, 0, 14, 0, 0, 0, 54, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 14 - Pause WP'),
(@ENTRY, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 27211, 5, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 14 - Set Data 0 1 (OE)'),
(@ENTRY, 0, 7, 8, 40, 0, 100, 0, 17, 0, 0, 0, 54, 40000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - WP 17 - Pause WP'),
(@ENTRY, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2889.193848, -379.011780, 116.388832, 5.6231, 'Forsaken Prisoner - Link - Set Orientation'),
(@ENTRY, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 91, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Remove FB1 Stand'),
(@ENTRY, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set FB1 Kneel'),
(@ENTRY, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Play Emote Kneel'),
(@ENTRY, 0, 12, 0, 38, 0, 100, 0, 0, 2, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On Data 0 2 - Resume WP'),
(@ENTRY, 0, 13, 14, 38, 0, 100, 0, 0, 1, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On Data 0 1 - Remove FB1 Kneel'),
(@ENTRY, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 5, 65, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Play Emote Dead'),
(@ENTRY, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 90, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set FB1 Dead'),
(@ENTRY, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ENTRY*10, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Run Script'),
(@ENTRY, 0, 17, 18, 40, 0, 100, 0, 32, 0, 0, 0, 201, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On WP 32 reached - Go Home'),
(@ENTRY, 0, 18, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Despawn'),
(@ENTRY, 0, 19, 20, 11, 0, 100, 0, 0, 0, 0, 0, 47, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - On Respawn - Go Visible'),
(@ENTRY, 0, 20, 21, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set Data 0 0'),
(@ENTRY, 0, 21, 22, 61, 0, 100, 0, 0, 0, 0, 0, 91, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Remove FB1 Stand'),
(@ENTRY, 0, 22, 23, 61, 0, 100, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - State Dead'),
(@ENTRY, 0, 23, 0, 61, 0, 100, 0, 0, 0, 0, 0, 90, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Link - Set FB1 Dead'),

(@ENTRY*10, 9, 0, 0, 0, 0, 100, 0, 20000, 20000, 0, 0, 47, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Go Invisible'),
(@ENTRY*10, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Remove FB1 Dead'),
(@ENTRY*10, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - State None'),
(@ENTRY*10, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 90, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Set FB1 Stand'),
(@ENTRY*10, 9, 4, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Forsaken Prisoner - Script - Resume WP');

-- Onslaught Executioner SAI
SET @ENTRY :=27211;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(@ENTRY,@ENTRY*10);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 9, 0, 100, 0, 0, 5, 9000, 13000, 11, 9080, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Onslaught Executioner - Within 0-5 Range - Cast 'Hamstring' (No Repeat)"), 
(@ENTRY, 0, 1, 0, 0, 0, 100, 0, 5000, 8000, 12000, 15000, 11, 43673, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Onslaught Executioner - In Combat - Cast 'Mighty Blow' (No Repeat)"), 
(@ENTRY, 0, 2, 0, 8, 0, 100, 0, 48268, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On Spellhit Despawn'),
(@ENTRY, 0, 3, 4, 38, 0, 100, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On Data 0 1 - Say Text 1'),
(@ENTRY, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, @ENTRY, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Start WP'),
(@ENTRY, 0, 5, 6, 61, 0, 100, 0, 9, 0, 0, 0, 54, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Pause WP'),
(@ENTRY, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 33536, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Set Unit Flag'),
(@ENTRY, 0, 7, 8, 40, 0, 100, 0, 3, 0, 0, 0, 54, 15000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On WP 3 - Pause WP'),
(@ENTRY, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 3000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Say Text 2'),
(@ENTRY, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @ENTRY*10, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Run Script'),
(@ENTRY, 0, 10, 0, 40, 0, 100, 0, 4, 0, 0, 0, 45, 0, 2, 0, 0, 0, 0, 19, 27203, 5, 0, 0, 0, 0, 0, 'Onslaught Executioner - On WP 4 - Set Data 0 2 (OF)'),
(@ENTRY, 0, 11, 0, 40, 0, 100, 0, 5, 0, 0, 0, 1, 4, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - On WP 5 - Say Text 5'),
(@ENTRY, 0, 12, 13, 40, 0, 100, 0, 6, 0, 0, 0, 201, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - On WP 6 - Go Home'),
(@ENTRY, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Set Data 0 0'),
(@ENTRY, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 32768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Link - Set Unit Flag'),

(@ENTRY*10, 9, 0, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 2, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executioner - Script - Say Text 3'),
(@ENTRY*10, 9, 1, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 5, 38, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Play Emote (Execute)'),
(@ENTRY*10, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Say Text 4'),
(@ENTRY*10, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 27219, 5, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Set Data 0 1 (FP)'),
(@ENTRY*10, 9, 4, 0, 0, 0, 100, 0, 12000, 12000, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Executionerr - Script - Resume WP');

-- Onslaught Footman SAI
SET @ENTRY :=-102176;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 8, 0, 100, 0, 48268, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Spellhit Despawn'), 
(@ENTRY, 0, 1, 0, 4, 0, 30, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Agro - Say'),
(@ENTRY, 0, 2, 3, 38, 0, 100, 0, 0, 1, 0, 0, 53, 0, 27203, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Data 0 1 - Start WP'),
(@ENTRY, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 18, 33536, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - Link - Set Unit Flag'),
(@ENTRY, 0, 4, 5, 40, 0, 100, 0, 9, 0, 0, 0, 54, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On WP 9 reached - Pause WP'),
(@ENTRY, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2878.271484, -391.718750, 112.461624, 0.7136, 'Onslaught Footman - Link - Set Orientation'),
(@ENTRY, 0, 6, 7, 40, 0, 100, 0, 12, 0, 0, 0, 54, 20000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On WP 12 reached - Pause WP'),
(@ENTRY, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2886.305420, -379.218506,116.388504, 6.000139, 'Onslaught Footman - Link - Set Orientation'),
(@ENTRY, 0, 8, 0, 38, 0, 100, 0, 0, 2, 0, 0, 65, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On Data 0 2 - Resume WP'),
(@ENTRY, 0, 9, 10, 40, 0, 100, 0, 23, 0, 0, 0, 201, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - On WP 23 reached - Go Home'),
(@ENTRY, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 18, 32768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - Link - Set Unit Flag'),
(@ENTRY, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Onslaught Footman - Link - Set Data 0 0');

-- Onslaught Executioner text
SET @ENTRY :=27211;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY, 0, 0, 'About time!', 12, 0, 100, 5, 0, 0, 26292, 0, 'Onslaught Executioner'),
(@ENTRY, 1, 0, 'Any last words you impure mongrel?', 12, 0, 100, 6, 0, 0, 26293, 0, 'Onslaught Executioner'),
(@ENTRY, 2, 0, 'On second thought, I don\'t care. Burn in hell wretch!', 12, 0, 100, 5, 0, 0, 26294, 0, 'Onslaught Executioner'),
(@ENTRY, 3, 0, 'The executioner cuts down the prisoner and walks off the gallows.', 16, 0, 100, 38, 0, 0, 0, 0, 'Onslaught Executioner'),
(@ENTRY, 4, 0, 'Hah! That never gets old.', 12, 0, 100, 0, 0, 0, 26295, 0, 'Onslaught Executioner');

-- Onslaught Executioner waypoints
SET @ENTRY :=27211;
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, 2883.031006, -387.130035, 112.462036, 'Onslaught Executioner'), 
(@ENTRY, 2, 2886.141357, -384.093109, 116.389175, 'Onslaught Executioner'),
(@ENTRY, 3, 2889.506836, -380.807159, 116.389175, 'Onslaught Executioner'),
(@ENTRY, 4, 2886.141357, -384.093109, 116.389175, 'Onslaught Executioner'), 
(@ENTRY, 5, 2883.031006, -387.130035, 112.462036, 'Onslaught Executioner'),
(@ENTRY, 6, 2879.770000, -387.146000, 112.462000, 'Onslaught Executioner');

-- Onslaught Footman waypoints
SET @ENTRY :=27203;
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, 2893.011475, -275.699097, 107.242134, 'Onslaught Footman'),
(@ENTRY, 2, 2893.001953, -287.614807, 114.034653, 'Onslaught Footman'),
(@ENTRY, 3, 2894.372314, -292.698425, 114.034653, 'Onslaught Footman'),
(@ENTRY, 4, 2907.858643, -293.368256, 114.034653, 'Onslaught Footman'),
(@ENTRY, 5, 2907.169434, -304.399536, 114.034653, 'Onslaught Footman'),
(@ENTRY, 6, 2885.362061, -305.039612, 112.536087, 'Onslaught Footman'),
(@ENTRY, 7, 2883.634766, -362.634216, 112.461624, 'Onslaught Footman'),
(@ENTRY, 8, 2866.434326, -380.423492, 112.461624, 'Onslaught Footman'),
(@ENTRY, 9, 2878.271484, -391.718750, 112.461624, 'Onslaught Footman'),
(@ENTRY, 10, 2883.031006, -387.130035, 112.462036, 'Onslaught Footman'), 
(@ENTRY, 11, 2886.141357, -384.093109, 116.389175, 'Onslaught Footman'),
(@ENTRY, 12, 2886.305420, -379.218506, 116.388504, 'Onslaught Footman'),
(@ENTRY, 13, 2886.141357, -384.093109, 116.389175, 'Onslaught Footman'),
(@ENTRY, 14, 2883.031006, -387.130035, 112.462036, 'Onslaught Footman'),
(@ENTRY, 15, 2878.271484, -391.718750, 112.461624, 'Onslaught Footman'), 
(@ENTRY, 16, 2866.434326, -380.423492, 112.461624, 'Onslaught Footman'),
(@ENTRY, 17, 2883.634766, -362.634216, 112.461624, 'Onslaught Footman'),
(@ENTRY, 18, 2885.362061, -305.039612, 112.536087, 'Onslaught Footman'),
(@ENTRY, 19, 2907.169434, -304.399536, 114.034653, 'Onslaught Footman'),
(@ENTRY, 20, 2907.858643, -293.368256, 114.034653, 'Onslaught Footman'),
(@ENTRY, 21, 2894.372314, -292.698425, 114.034653, 'Onslaught Footman'),
(@ENTRY, 22, 2893.001953, -287.614807, 114.034653, 'Onslaught Footman'),
(@ENTRY, 23, 2893.011475, -275.699097, 107.242134, 'Onslaught Footman');

-- Frosaken Prisoner waypoints
SET @ENTRY :=27219;
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@ENTRY, 1, 2876.191650, -281.550446, 106.880356, 'Forsaken Prisoner'),
(@ENTRY, 2, 2877.175781, -280.941956, 106.879684, 'Forsaken Prisoner'),
(@ENTRY, 3, 2890.545410, -274.634338, 106.879684, 'Forsaken Prisoner'),
(@ENTRY, 4, 2893.005615, -274.593140, 107.243553, 'Forsaken Prisoner'),
(@ENTRY, 5, 2893.011475, -275.699097, 107.242134, 'Forsaken Prisoner'),
(@ENTRY, 6, 2893.001953, -287.614807, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 7, 2894.372314, -292.698425, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 8, 2907.858643, -293.368256, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 9, 2907.169434, -304.399536, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 10, 2885.362061, -305.039612, 112.536087, 'Forsaken Prisoner'),
(@ENTRY, 11, 2883.634766, -362.634216, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 12, 2866.434326, -380.423492, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 13, 2878.271484, -391.718750, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 14, 2883.031006, -387.130035, 112.462036, 'Forsaken Prisoner'), 
(@ENTRY, 15, 2886.141357, -384.093109, 116.389175, 'Forsaken Prisoner'),
(@ENTRY, 16, 2889.506836, -380.807159, 116.389175, 'Forsaken Prisoner'),
(@ENTRY, 17, 2890.368148, -379.838684, 116.389015, 'Forsaken Prisoner'),
(@ENTRY, 18, 2889.506836, -380.807159, 116.389175, 'Forsaken Prisoner'),
(@ENTRY, 19, 2886.141357, -384.093109, 116.389175, 'Forsaken Prisoner'), 
(@ENTRY, 20, 2883.031006, -387.130035, 112.462036, 'Forsaken Prisoner'),
(@ENTRY, 21, 2878.271484, -391.718750, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 22, 2866.434326, -380.423492, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 23, 2883.634766, -362.634216, 112.461624, 'Forsaken Prisoner'),
(@ENTRY, 24, 2885.362061, -305.039612, 112.536087, 'Forsaken Prisoner'),
(@ENTRY, 25, 2907.169434, -304.399536, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 26, 2907.858643, -293.368256, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 27, 2894.372314, -292.698425, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 28, 2893.001953, -287.614807, 114.034653, 'Forsaken Prisoner'),
(@ENTRY, 29, 2893.011475, -275.699097, 107.242134, 'Forsaken Prisoner'),
(@ENTRY, 30, 2893.005615, -274.593140, 107.243553, 'Forsaken Prisoner'),
(@ENTRY, 31, 2890.545410, -274.634338, 106.879684, 'Forsaken Prisoner'),
(@ENTRY, 32, 2877.175781, -280.941956, 106.879684, 'Forsaken Prisoner');
