UPDATE `gameobject_template` SET `flags`=0 WHERE  `entry`=176248;

-- [Q] Eitrigg's Wisdom -- http://wotlk.openwow.com/quest=4941
SET @GOSSIP =2901;
SET @NPC = 3144;
SET @QUEST =4941;
-- Add gossip options for each menu id
DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN @GOSSIP AND @GOSSIP+7;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES 
(@GOSSIP, 0, 0, 'Hello, Eitrigg. I bring news from Blackrock Spire.', 1, 1, @GOSSIP+1, 0, 0, 0, ''),
(@GOSSIP+1, 0, 0, 'There is only one Warchief, Eitrigg!', 1, 1, @GOSSIP+2, 0, 0, 0, ''),
(@GOSSIP+2, 0, 0, 'What do you mean?', 1, 1, @GOSSIP+3, 0, 0, 0, ''),
(@GOSSIP+3, 0, 0, 'Hearthglen? But...', 1, 1, @GOSSIP+4, 0, 0, 0, ''),
(@GOSSIP+4, 0, 0, 'I will take you up on that offer, Eitrigg.', 1, 1, @GOSSIP+5, 0, 0, 0, ''),
(@GOSSIP+5, 0, 0, 'Ah, so that is how they pushed the Dark Iron to the lower parts of the Spire.', 1, 1, @GOSSIP+6, 0, 0, 0, ''),
(@GOSSIP+6, 0, 0, 'Perhaps there exists a way?', 1, 1, @GOSSIP+7, 0, 0, 0, ''),
(@GOSSIP+7, 0, 0, 'As you wish, Eitrigg.', 1, 1, 0, 0, 0, 0, '');
-- Add gossip menus (text values already in db)
DELETE FROM `gossip_menu` WHERE `entry`BETWEEN @GOSSIP+1 AND @GOSSIP+7;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(@GOSSIP+1, 3574),
(@GOSSIP+2, 3575),
(@GOSSIP+3, 3576),
(@GOSSIP+4, 3577),
(@GOSSIP+5, 3578),
(@GOSSIP+6, 3579),
(@GOSSIP+7, 3580);
-- Add Condtion so gossip only shows when on quest
DELETE FROM `conditions` WHERE `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @GOSSIP, 0, 0, 9, 4941, 0, 0, 0, '', NULL);
-- Add SAI for quest complete and close of gossip when last option selected
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@NPC;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC,0,0,1,62,0,100,0,@GOSSIP+7,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Eitrigg - Select As you wish, Eitrigg. - Close gossip'),
(@NPC,0,1,0,61,0,100,0,0,0,0,0,15,@QUEST,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,'Eitrigg - on link - give credit quest(4941)');

-- [Q] What Is Going On? -- http://wotlk.openwow.com/quest=3982
UPDATE `creature_template` SET `ScriptName` = 'npc_commander_gorshak' WHERE `entry` =9020;

-- Precarious Predicament (4121)
UPDATE creature_template SET gossip_menu_id=30200, AIName='SmartAI' WHERE entry=9080;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=30200;
INSERT INTO conditions VALUES (15, 30200, 0, 0, 0, 14, 0, 4122, 0, 0, 1, 0, 0, '', 'First Quest Any state');
INSERT INTO conditions VALUES (15, 30200, 0, 0, 0, 2, 0, 11286, 1, 0, 1, 0, 0, '', 'No Item 11286');
INSERT INTO conditions VALUES (15, 30200, 0, 0, 0, 8, 0, 4121, 0, 0, 1, 0, 0, '', 'Second Quest not rewarded');
DELETE FROM smart_scripts WHERE entryorguid=9080 AND source_type=0;
INSERT INTO smart_scripts VALUES (9080, 0, 0, 1, 62, 0, 100, 0, 30200, 0, 0, 0, 56, 11286, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Add Item');
INSERT INTO smart_scripts VALUES (9080, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Close Gossip');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=14250;
INSERT INTO conditions VALUES (13, 1, 14250, 0, 0, 31, 0, 3, 9520, 0, 0, 0, 0, '', 'Target Grark');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=9520;
DELETE FROM smart_scripts WHERE entryorguid=9520 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(9520*100, 9520*100+1) AND source_type=9;
INSERT INTO smart_scripts VALUES (9520, 0, 0, 1, 19, 0, 100, 0, 4121, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Faction Hostile');
INSERT INTO smart_scripts VALUES (9520, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Attack Start');
INSERT INTO smart_scripts VALUES (9520, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520, 0, 4, 5, 2, 1, 100, 0, 0, 30, 0, 0, 80, 9520*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On HP - Run Script');
INSERT INTO smart_scripts VALUES (9520, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On HP - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On HP - Enter Evade');
INSERT INTO smart_scripts VALUES (9520, 0, 7, 27, 8, 2, 100, 0, 14250, 0, 0, 0, 1, 2, 4000, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 8, 0, 52, 0, 100, 0, 2, 9520, 0, 0, 53, 0, 9520, 0, 4121, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Text Over - Start WP');
INSERT INTO smart_scripts VALUES (9520, 0, 9, 0, 40, 0, 100, 0, 4, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 10, 11, 40, 0, 100, 0, 11, 0, 0, 0, 54, 30000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - WP Pause');
INSERT INTO smart_scripts VALUES (9520, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 107, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 13, 0, 56, 0, 100, 0, 11, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Resumed - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 14, 15, 40, 0, 100, 0, 32, 0, 0, 0, 54, 30000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - WP Pause');
INSERT INTO smart_scripts VALUES (9520, 0, 15, 16, 61, 0, 100, 0, 0, 0, 0, 0, 107, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 16, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 17, 0, 56, 0, 100, 0, 32, 0, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Resumed - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 18, 19, 40, 0, 100, 0, 59, 0, 0, 0, 54, 40000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - WP Pause');
INSERT INTO smart_scripts VALUES (9520, 0, 19, 20, 61, 0, 100, 0, 0, 0, 0, 0, 107, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 20, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 21, 0, 56, 0, 100, 0, 59, 0, 0, 0, 1, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Resumed - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 22, 23, 40, 0, 100, 0, 69, 0, 0, 0, 107, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Summon Creature Group');
INSERT INTO smart_scripts VALUES (9520, 0, 23, 24, 61, 0, 100, 0, 0, 0, 0, 0, 1, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Talk');
INSERT INTO smart_scripts VALUES (9520, 0, 24, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 9520*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reached - Run Script');
INSERT INTO smart_scripts VALUES (9520, 0, 25, 26, 11, 0, 100, 0, 0, 0, 0, 0, 91, 255, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Respawn - Remove Bytes1');
INSERT INTO smart_scripts VALUES (9520, 0, 26, 0, 61, 0, 100, 0, 0, 0, 0, 0, 94, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Respawn - Set Dynflag');
INSERT INTO smart_scripts VALUES (9520, 0, 27, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Spell Hit - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Faction');
INSERT INTO smart_scripts VALUES (9520*100, 9, 1, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Faction');
INSERT INTO smart_scripts VALUES (9520*100, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Event Phase');
INSERT INTO smart_scripts VALUES (9520*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Faction');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 90, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Bytes1');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 3, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 9538, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 4, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 37, 0, 0, 0, 0, 0, 19, 9538, 15, 0, 0, 0, 0, 0, 'Script9 - Play Emote');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 7, 0, 0, 0, 100, 0, 500, 500, 0, 0, 94, 32, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Dynamic Flag');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 255, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove Bytes1');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 90, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Bytes1');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 10, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, 9539, 15, 0, 0, 0, 0, 0, 'Script9 - Talk Target');
INSERT INTO smart_scripts VALUES (9520*100+1, 9, 11, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Despawn');
DELETE FROM creature_summon_groups WHERE summonerId=9520;
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7728.03, -1507.43, 132.84, 0.45, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7745.39, -1511.42, 131.82, 0.43, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7738.19, -1517.31, 132.64, 1.25, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 1, 7027, -7731.36, -1516.09, 133.15, 1.85, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7027, -8018.37, -1234.22, 135.76, 4.45, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7027, -8028.86, -1234.06, 134.50, 4.80, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7043, -8035.70, -1244.65, 133.53, 6.09, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 2, 7043, -8017.37, -1244.61, 134.45, 3.05, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 3, 7042, -7394.30, -1099.77, 278.08, 3.23, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 3, 7042, -7394.24, -1106.84, 278.08, 3.04, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 3, 7042, -7399.23, -1111.12, 278.08, 2.07, 4, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 4, 9539, -7184.77, -1078.76, 240.76, 2.87, 3, 30000);
INSERT INTO creature_summon_groups VALUES (9520, 0, 4, 9538, -7189.04, -1082.20, 240.76, 2.24, 3, 30000);
DELETE FROM waypoints WHERE entry=9520;
INSERT INTO waypoints VALUES (9520, 1, -7694.87, -1446.16, 139.788, 'Grark Lorkrub'),(9520, 2, -7693.1, -1447.1, 140.936, 'Grark Lorkrub'),(9520, 3, -7670.1, -1458.41, 140.742, 'Grark Lorkrub'),(9520, 4, -7675.08, -1464.91, 140.743, 'Grark Lorkrub'),(9520, 5, -7682.24, -1470.96, 140.732, 'Grark Lorkrub'),(9520, 6, -7695.94, -1473.56, 140.794, 'Grark Lorkrub'),(9520, 7, -7708.68, -1472.19, 140.795, 'Grark Lorkrub'),(9520, 8, -7711.3, -1470.41, 140.792, 'Grark Lorkrub'),(9520, 9, -7718.34, -1483.8, 140.127, 'Grark Lorkrub'),(9520, 10, -7726.4, -1499.25, 133.572, 'Grark Lorkrub'),(9520, 11, -7738.77, -1502.96, 131.835, 'Grark Lorkrub'),(9520, 12, -7752.84, -1497.24, 133.278, 'Grark Lorkrub'),(9520, 13, -7768.01, -1491.07, 133.465, 'Grark Lorkrub'),(9520, 14, -7788.9, -1488.91, 133.549, 'Grark Lorkrub'),(9520, 15, -7819.76, -1484.64, 133.606, 'Grark Lorkrub'),(9520, 16, -7828.02, -1480.21, 137.011, 'Grark Lorkrub'),
(9520, 17, -7839.92, -1470.88, 137.256, 'Grark Lorkrub'),(9520, 18, -7849.8, -1470.22, 141.082, 'Grark Lorkrub'),(9520, 19, -7855.2, -1476.25, 143.78, 'Grark Lorkrub'),(9520, 20, -7868.73, -1461.69, 144.758, 'Grark Lorkrub'),(9520, 21, -7888.35, -1431.28, 145.097, 'Grark Lorkrub'),(9520, 22, -7900.4, -1426.93, 150.278, 'Grark Lorkrub'),(9520, 23, -7907.22, -1425.34, 148.423, 'Grark Lorkrub'),(9520, 24, -7922.01, -1421.89, 139.826, 'Grark Lorkrub'),(9520, 25, -7939.55, -1410.33, 134.285, 'Grark Lorkrub'),(9520, 26, -7953.69, -1383.53, 133.842, 'Grark Lorkrub'),(9520, 27, -7970.54, -1358.25, 132.992, 'Grark Lorkrub'),(9520, 28, -7994.28, -1337.43, 133.873, 'Grark Lorkrub'),(9520, 29, -8003.57, -1325.42, 133.722, 'Grark Lorkrub'),(9520, 30, -8006.93, -1297.62, 132.471, 'Grark Lorkrub'),(9520, 31, -8010.01, -1272.19, 133.315, 'Grark Lorkrub'),(9520, 32, -8022.81, -1248.63, 133.66, 'Grark Lorkrub'),
(9520, 33, -8024.27, -1233.51, 135.164, 'Grark Lorkrub'),(9520, 34, -8016.06, -1199.49, 145.809, 'Grark Lorkrub'),(9520, 35, -7998.59, -1162.87, 156.517, 'Grark Lorkrub'),(9520, 36, -7971.62, -1137.03, 169.253, 'Grark Lorkrub'),(9520, 37, -7947.76, -1131.43, 179.178, 'Grark Lorkrub'),(9520, 38, -7916.3, -1132.39, 189.363, 'Grark Lorkrub'),(9520, 39, -7882.57, -1132.1, 198.428, 'Grark Lorkrub'),(9520, 40, -7846.45, -1132.55, 207.448, 'Grark Lorkrub'),(9520, 41, -7817.44, -1129.96, 213.355, 'Grark Lorkrub'),(9520, 42, -7807.09, -1128.75, 214.848, 'Grark Lorkrub'),(9520, 43, -7751.64, -1121.82, 215.085, 'Grark Lorkrub'),(9520, 44, -7743.69, -1097.45, 216.133, 'Grark Lorkrub'),(9520, 45, -7731.51, -1088.48, 217.094, 'Grark Lorkrub'),(9520, 46, -7696.8, -1084.28, 217.778, 'Grark Lorkrub'),(9520, 47, -7677.24, -1058.08, 220.442, 'Grark Lorkrub'),(9520, 48, -7651.64, -1034.11, 228.715, 'Grark Lorkrub'),
(9520, 49, -7620.58, -1020.57, 237.609, 'Grark Lorkrub'),(9520, 50, -7593.13, -1015.04, 244.696, 'Grark Lorkrub'),(9520, 51, -7564.18, -1017.93, 251.451, 'Grark Lorkrub'),(9520, 52, -7541.23, -1031.78, 256.662, 'Grark Lorkrub'),(9520, 53, -7513.8, -1051.44, 262.202, 'Grark Lorkrub'),(9520, 54, -7496.54, -1073.58, 264.806, 'Grark Lorkrub'),(9520, 55, -7476.06, -1068.61, 264.993, 'Grark Lorkrub'),(9520, 56, -7451.15, -1062.45, 268.264, 'Grark Lorkrub'),(9520, 57, -7431.29, -1061.54, 272.873, 'Grark Lorkrub'),(9520, 58, -7415.51, -1073.52, 276.363, 'Grark Lorkrub'),(9520, 59, -7408.22, -1101.78, 278.077, 'Grark Lorkrub'),(9520, 60, -7383.85, -1099.22, 278.076, 'Grark Lorkrub'),(9520, 61, -7359.44, -1101.27, 277.84, 'Grark Lorkrub'),(9520, 62, -7335.16, -1089.9, 277.07, 'Grark Lorkrub'),(9520, 63, -7310.58, -1070.2, 277.07, 'Grark Lorkrub'),
(9520, 64, -7296.4, -1064.74, 277.027, 'Grark Lorkrub'),(9520, 65, -7274.71, -1073.46, 269.059, 'Grark Lorkrub'),(9520, 66, -7263.12, -1072.97, 265.053, 'Grark Lorkrub'),(9520, 67, -7239.82, -1072.43, 251.404, 'Grark Lorkrub'),(9520, 68, -7214.73, -1071.87, 243.273, 'Grark Lorkrub'),(9520, 69, -7190.93, -1078.66, 240.987, 'Grark Lorkrub');

DELETE FROM creature_text WHERE entry IN(9520, 9539, 9538);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(9520, 0, 0, 'You have come to play? Then let us play!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 1, 0, 'Grark Lorkrub submits.', 16, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 2, 0, 'I know the way, insect. There is no need to prod me as if I were cattle.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 3, 0, 'Surely you do not think that you will get away with this incursion. They will come for me and you shall pay for your insolence.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 4, 0, 'RUN THEM THROUGH BROTHERS!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 5, 0, 'I doubt you will be so lucky the next time you encounter my brethren.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 6, 0, 'They come for you, fool!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 7, 0, 'What do you think you accomplish from this, fool? Even now, the Blackrock armies make preparations to destroy your world.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 8, 0, 'On darkest wing they fly. Prepare to meet your end!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 9, 0, 'The worst is yet to come!', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9520, 10, 0, 'Time to make your final stand, insect.', 12, 0, 100, 0, 0, 0, 'Grark Lorkrub'),
(9538, 0, 0, 'High Executioner Nuzrak raises his massive axe over Grark.', 16, 0, 100, 0, 0, 0, 'High Executioner Nuzrak'),
(9539, 0, 0, 'Kneel, Grark.', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 1, 0, 'Grark Lorkrub, you have been charged and found guilty of treason against the Horde. How you plead is unimportant. High Executioner Nuzrak, step forward.', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 2, 0, 'Shadow of Lexlort raises his hand and then lowers it.', 16, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 3, 0, 'End him...', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort'),
(9539, 4, 0, 'You, soldier, report back to Kargath at once!', 12, 0, 100, 0, 0, 0, 'Shadow of Lexlort');
DELETE FROM gossip_menu_option WHERE menu_id=30200;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES (30200, 0, 0, 'I need another Thorium Shackles.', 1, 1, 0, 0, 0, 0, '');


-- GO Blueleaf Tuber (20920)
UPDATE gameobject_template SET faction=0 WHERE entry=20920;

DELETE FROM `spell_script_names` WHERE `spell_id`=8283;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(8283, 'spell_snufflenose_command');

UPDATE `creature_template` SET `AIName` = "", `ScriptName`="npc_snufflenose_gopher" WHERE `entry`=4781;

-- Booty Bay Bruiser should yell - reputation towards Steamwheedle Cartel on kill now
DELETE FROM `creature_onkill_reputation` WHERE `creature_id`= 4624;
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
(4624,87,21,5,0,125,5,1,-625,0);

-- Mai'Zoth
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `guid` = 523; 

-- Commander Jordan delete an extra spawn.
DELETE FROM `creature` WHERE `guid`= 105029;
DELETE FROM `creature_addon` WHERE `guid`= 105029;

-- Goramosh SAI
SET @ENTRY := 26349;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,2,0,0,0,0,10,113473,26298,0,0,0,0,0,"Goramosh - Out of Combat - Cast 'Surge Needle Beam' (No Repeat)"),
(@ENTRY,0,1,0,21,0,100,0,0,0,0,0,11,46906,2,0,0,0,0,10,113473,26298,0,0,0,0,0,"Goramosh - On Reached Home - Cast 'Surge Needle Beam'"),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,20828,0,0,0,0,0,2,0,0,0,0,0,0,0,"Goramosh - Between 0-50% Health - Cast 'Cone of Cold' (No Repeat)"),
(@ENTRY,0,3,0,0,0,100,0,3500,3500,6000,8000,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,"Goramosh - In Combat - Cast 'Frostbolt'"),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Goramosh - On Aggro - Say Line 0");

DELETE FROM `creature_text` WHERE `Entry` IN (26349, 26496);
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(26349,0,0,'You\'re too late! The accord has been negotiated. Only the details remain. Small details... like you!',12,0,100,0,0,0,0,0,'Goramosh'),
(26496,0,0,'What\'s this, more delays?',12,0,100,0,0,0,0,0,'Wind Trader Mu\'fah');

-- Wind Trader Mu'fah SAI
SET @ENTRY := 26496;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,20,6000,8000,11,51817,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wind Trader Mu'fah - Within 0-20 Range - Cast 'Typhoon'"),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Mu'fah - On Aggro - Say Line 0");

-- Corrections for Burr, Gerk and Crusader Dargath Part 2. Position and hover mode for Dargath.
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 29455; 
UPDATE `creature` SET `spawndist` = 0 , `MovementType` = 0 WHERE `guid` = 98405; 
UPDATE `creature_template` SET `dynamicflags` = 32 WHERE `entry` = 29454; 


UPDATE `creature` SET `position_x` = 5950.65 , `position_y` = -1851.12 , `position_z` = 248.392 , `orientation` = 1.65806 WHERE `guid` = 98405; 

DELETE FROM `creature_addon` WHERE `guid`= 98405;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(98405,0,0,33554432,1,0,NULL);

-- Fix for quest chain for The Monogrammed Sash -> The Captain's Cutlass -> Facing Negolash
DELETE FROM `quest_template_addon` WHERE `ID` IN (8553, 8554);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`) VALUES
(8553,0,0,0,8552,0,0,0,0,0,0,0,0,0,0,0,0),
(8554,0,0,0,8553,0,0,0,0,0,0,0,0,0,0,0,0);

DELETE FROM `creature_onkill_reputation` WHERE `creature_id`= 4624;
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
(4624,87,21,5,0,125,5,1,-625,0);

-- [Q] When all else fail -- https://wowgaming.altervista.org/aowow/?search=When+all+else+fail
UPDATE `creature_template` SET `unit_flags`=512, `VehicleId`=240, `InhabitType`=4 WHERE `entry`=30477;
UPDATE `creature_template` SET `minlevel`=80, `maxlevel`=80, `exp`=2, `unit_flags`=512, `VehicleId`=240, `InhabitType`=4 WHERE `entry`=30487;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (29428,30477,30487);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29428,30477,30487) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (30477*100,30487*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29428,0,0,2,62,0,100,0,9917,0,0,0,11,58061,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ricket - On gossip select - Spellcast Forcecast Summon Rocket (Alliance)'),
(29428,0,1,2,62,0,100,0,9917,1,0,0,11,58062,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ricket - On gossip select - Spellcast Forcecast Summon Rocket (Horde)'),
(29428,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Ricket - On gossip select - Close gossip'),
(30477,0,0,0,54,0,100,0,0,0,0,0,80,30477*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - Just summoned - Run script'),
(30477,0,1,2,40,0,100,0,18,30477,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 18 reached - Spellcast Eject All Passengers'),
(30477,0,2,0,61,0,100,0,0,0,0,0,11,42895,0,0,0,0,0,23,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 18 reached - Spellcast Cosmetic - Combat Knockdown Foe'),
(30477,0,3,0,40,0,100,0,24,30477,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 24 reached - Despawn'),
(30487,0,0,0,54,0,100,0,0,0,0,0,80,30487*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - Just summoned - Run script'),
(30487,0,1,2,40,0,100,0,13,30487,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 13 reached - Spellcast Eject All Passengers'),
(30487,0,2,0,61,0,100,0,0,0,0,0,11,42895,0,0,0,0,0,23,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 13 reached - Spellcast Cosmetic - Combat Knockdown Foe'),
(30487,0,3,0,40,0,100,0,17,30487,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device - On WP 17 reached - Despawn'),
(30477*100,9,0,0,0,0,100,0,3000,3000,0,0,53,1,30477,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device script - Start WP movement'),
(30487*100,9,0,0,0,0,100,0,3000,3000,0,0,53,1,30487,0,0,0,0,1,0,0,0,0,0,0,0,'D16 Propelled Delivery Device script - Start WP movement');

DELETE FROM `waypoints` WHERE `entry` IN (30477,30487);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(30477,1,6164.999,-1064.512,422.1189,'D16 Propelled Delivery Device'),
(30477,2,6204.096,-998.4872,457.5628,'D16 Propelled Delivery Device'),
(30477,3,6289.573,-952.1809,504.6187,'D16 Propelled Delivery Device'),
(30477,4,6307.788,-872.7999,541.7296,'D16 Propelled Delivery Device'),
(30477,5,6370.582,-821.9507,653.868,'D16 Propelled Delivery Device'),
(30477,6,6413.268,-660.4708,808.3953,'D16 Propelled Delivery Device'),
(30477,7,6554.813,-550.3772,1018.112,'D16 Propelled Delivery Device'),
(30477,8,6633.265,-419.3159,1173.914,'D16 Propelled Delivery Device'),
(30477,9,6760.503,-364.4665,1277.719,'D16 Propelled Delivery Device'),
(30477,10,6807.88,-427.5194,1399.109,'D16 Propelled Delivery Device'),
(30477,11,6808.07,-471.4465,1419.247,'D16 Propelled Delivery Device'),
(30477,12,6775.634,-529.2309,1394.387,'D16 Propelled Delivery Device'),
(30477,13,6720.645,-535.5529,1328.054,'D16 Propelled Delivery Device'),
(30477,14,6660.31,-486.8651,1238.553,'D16 Propelled Delivery Device'),
(30477,15,6658.937,-417.8409,1186.11,'D16 Propelled Delivery Device'),
(30477,16,6680.49,-329.3087,1098.609,'D16 Propelled Delivery Device'),
(30477,17,6683.783,-220.3454,972.7203,'D16 Propelled Delivery Device'),
(30477,18,6663.772,-192.1261,962.2485,'D16 Propelled Delivery Device'),
(30477,19,6654.82,-180.1689,958.1317,'D16 Propelled Delivery Device'),
(30477,20,6631.467,-171.3305,966.4633,'D16 Propelled Delivery Device'),
(30477,21,6598.223,-162.3664,984.2227,'D16 Propelled Delivery Device'),
(30477,22,6566.67,-155.2077,992.0551,'D16 Propelled Delivery Device'),
(30477,23,6529.651,-154.9363,992.0551,'D16 Propelled Delivery Device'),
(30477,24,6454.417,-152.1311,962.305,'D16 Propelled Delivery Device'),
(30487,1,6169.229,-1069.619,420.6945,'D16 Propelled Delivery Device'),
(30487,2,6232.725,-1031.598,505.7779,'D16 Propelled Delivery Device'),
(30487,3,6339.224,-1035.08,575.3331,'D16 Propelled Delivery Device'),
(30487,4,6431.492,-987.6745,694.8887,'D16 Propelled Delivery Device'),
(30487,5,6632.437,-925.9739,896.1384,'D16 Propelled Delivery Device'),
(30487,6,6822.084,-755.521,1171.194,'D16 Propelled Delivery Device'),
(30487,7,7090.693,-619.4874,1455.639,'D16 Propelled Delivery Device'),
(30487,8,7260.75,-282.75,1513.362,'D16 Propelled Delivery Device'),
(30487,9,7552.502,-334.6509,1657.668,'D16 Propelled Delivery Device'),
(30487,10,7692.301,-509.425,1536.5,'D16 Propelled Delivery Device'),
(30487,11,7799.192,-636.3267,1252.278,'D16 Propelled Delivery Device'),
(30487,12,7841.555,-726.5501,1193.916,'D16 Propelled Delivery Device'),
(30487,13,7844.731,-775.3613,1185.833,'D16 Propelled Delivery Device'),
(30487,14,7842.449,-815.5735,1186.396,'D16 Propelled Delivery Device'),
(30487,15,7838.703,-859.9572,1173.173,'D16 Propelled Delivery Device'),
(30487,16,7865.014,-911.2181,1163.979,'D16 Propelled Delivery Device'),
(30487,17,7856.225,-951.6568,1151.563,'D16 Propelled Delivery Device');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=9917 AND `id`=1;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9917,1,0,'I am ready to head further into Storm Peaks.',32890,1,1,0,0,0,0,'');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9917;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,9917,0,0,28,12862,0,0,0,'','Ricket - Show gossip option only if player has completed but not rewarded quest When All Else Fails'),
(15,9917,1,0,28,13060,0,0,0,'','Ricket - Show gossip option only if player has completed but not rewarded quest When All Else Fails');

UPDATE creature_template SET unit_flags=33685508, ScriptName="npc_void_zone", flags_extra=0 WHERE entry IN(34001);