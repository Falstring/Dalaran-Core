SET @ENTRY := 27924;
UPDATE `creature_template` SET `AIName`="SmartAI", `InhabitType`=4 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,53,1,27924,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Just Summoned - Start Waypoint"),
(@ENTRY,0,1,2,40,0,100,0,6,27924,0,0,15,11436,0,0,0,0,0,23,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 6 Reached - Quest Credit 'Let's Go Surfing Now'"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,28,44140,0,0,0,0,0,23,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 6 Reached - remove aura"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 6 Reached - Eject"),
(@ENTRY,0,4,0,40,0,100,0,1,27924,0,0,75,44140,0,0,0,0,0,23,0,0,0,0,0,0,0,"Dragonflayer Harpoon - On Waypoint 1 Reached - Add aura");

DELETE FROM `waypoints` WHERE `entry`=27924;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(27924, 1, 806.937, -5344.08, 194.417, 'Dragonflayer Harpoon'),
(27924, 2, 803.085, -5333.39, 191.903, 'Dragonflayer Harpoon'),
(27924, 3, 761.183, -5268.77, 152.492, 'Dragonflayer Harpoon'),
(27924, 4, 695.561, -5155.04, 81.2906, 'Dragonflayer Harpoon'),
(27924, 5, 647.533, -5073.72, 29.9669, 'Dragonflayer Harpoon'),
(27924, 6, 621.608, -5027.49, 2.03123, 'Dragonflayer Harpoon');

DELETE FROM `creature_template_addon` WHERE `entry`=27924;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27924,0,0,0x1000000|0x2000000,0x1,0, '43775');
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `guid`=107391;


UPDATE creature_template SET speed_walk=1.8, speed_run=1.8 WHERE entry=27924;