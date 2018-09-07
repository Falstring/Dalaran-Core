-- -------------------------------------------
-- ICECROWN
-- -------------------------------------------

-- Arthur Denny - Spawn - wowhead.com/npc=33603/arthur-denny#screenshots:id=126386
DELETE FROM `creature` WHERE `id`=33603;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES 
(3110518, 33603, 571, 0, 0, 1, 1, 0, 0, 8549.57, 945.324, 547.375, 1.28961, 300, 0, 0, 8508, 7981, 0, 0, 0, 0, 0);

-- Chosen Zealot Combat SAI -- http://www.wowhead.com/npc=@ENTRY/chosen-zealot
SET @ENTRY :=32175;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `id` IN(11,12);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ENTRY, 0, 11, 0, 0, 0, 100, 0, 1000, 2000, 16000, 18000, 11, 13445, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chosen Zealot - IC - Cast Rend'),
(@ENTRY, 0, 12, 0, 0, 0, 100, 0, 0, 2000, 65000, 70000, 11, 12530, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chosen Zealot - IC - Cast Frailty');

-- Chosen Zealot loot table
DELETE FROM `creature_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@ENTRY, 33470, 0, 44, 0, 1, 0, 1, 4, NULL),
(@ENTRY, 33443, 0, 7, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33445, 0, 3, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33447, 0, 2, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33448, 0, 1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 45912, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 37760, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 43297, 0, 0.1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 44309, 0, 0.1, 0, 1, 0, 1, 1, NULL);

DELETE FROM `pickpocketing_loot_template` WHERE `Entry`=@ENTRY;
INSERT INTO `pickpocketing_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(@ENTRY, 43575, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 37467, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 38261, 0, 1, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 33447, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 35950, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 35948, 0, 5, 0, 1, 0, 1, 1, NULL),
(@ENTRY, 35952, 0, 5, 0, 1, 0, 1, 1, NULL);

-- Converted Hero -- http://www.wowhead.com/npc=32255
UPDATE `creature_template` SET `mingold`=900, `maxgold`=1000 WHERE `entry`=32255;


-- Asric and Jadaar

SET @ASRIC := 31898;
SET @JADAAR := 31899;

DELETE FROM creature_text WHERE entry IN(@ASRIC, @JADAAR);
INSERT INTO creature_text VALUES (@ASRIC, 0, 0, 'To your health, windbag.', 12, 0, 100, 0, 0, 0, 36818, 0, 'Asric 0');
INSERT INTO creature_text VALUES (@ASRIC, 1, 0, 'Now comes our chance at redemption, Jadaar. We could become heroes through this tournament!', 12, 0, 100, 0, 0, 0, 36744, 0, 'Asric 1');
INSERT INTO creature_text VALUES (@ASRIC, 2, 0, 'What could be holding you back? You''re hale, hearty... missing an eye perhaps, but that shouldn''t keep you from competing!', 12, 0, 100, 0, 0, 0, 36746, 0, 'Asric 2');
INSERT INTO creature_text VALUES (@ASRIC, 3, 0, 'Ah. That might be a problem.', 12, 0, 100, 0, 0, 0, 36748, 0, 'Asric 3');
INSERT INTO creature_text VALUES (@ASRIC, 4, 0, 'I had a... situation some time back with one of the individuals now heading up the Sunreavers here. A falling out, if you will.', 12, 0, 100, 0, 0, 0, 36750, 0, 'Asric 4');
INSERT INTO creature_text VALUES (@ASRIC, 5, 0, 'Needless to say, when I walked into the pavilion there was something of an altercation.', 12, 0, 100, 0, 0, 0, 36751, 0, 'Asric 5');
INSERT INTO creature_text VALUES (@ASRIC, 6, 0, 'He suggested I do something else with the lance, instead. It''s not my place to repeat vulgarities.', 12, 0, 100, 0, 0, 0, 36753, 0, 'Asric 6');
INSERT INTO creature_text VALUES (@ASRIC, 7, 0, 'There is no doubt in my mind you''d lose. Speed and wit triumphs over brute strength and bullheadedness any day of the week.', 12, 0, 100, 0, 0, 0, 36755, 0, 'Asric 7');
INSERT INTO creature_text VALUES (@ASRIC, 8, 0, 'Typical empty boasting. Still, the stables are rather distant and the drinks here are decent enough.', 12, 0, 100, 0, 0, 0, 36770, 0, 'Asric 8');
INSERT INTO creature_text VALUES (@ASRIC, 9, 0, 'Just as well.', 12, 0, 100, 0, 0, 0, 36772, 0, 'Asric 9');
INSERT INTO creature_text VALUES (@ASRIC, 10, 0, 'The Citadel, correct? Facing the Lich King''s most powerful minions.', 12, 0, 100, 0, 0, 0, 36774, 0, 'Asric 10');
INSERT INTO creature_text VALUES (@ASRIC, 11, 0, 'Indeed.', 12, 0, 100, 0, 0, 0, 36776, 0, 'Asric 11');
INSERT INTO creature_text VALUES (@ASRIC, 12, 0, 'Discretion is the better part of valor, after all.', 12, 0, 100, 0, 0, 0, 36778, 0, 'Asric 12');

INSERT INTO creature_text VALUES (@JADAAR, 0, 0, 'And to yours, brat.', 12, 0, 100, 0, 0, 0, 36819, 0, 'Jadaar 0');
INSERT INTO creature_text VALUES (@JADAAR, 1, 0, 'I don''t know. I am uncertain this is the proper vehicle to heroism.', 12, 0, 100, 0, 0, 0, 36745, 0, 'Jadaar 1');
INSERT INTO creature_text VALUES (@JADAAR, 2, 0, 'I dislike elekks. Strongly.', 12, 0, 100, 0, 0, 0, 36747, 0, 'Jadaar 2');
INSERT INTO creature_text VALUES (@JADAAR, 3, 0, 'Why aren''t you competing?', 12, 0, 100, 0, 0, 0, 36749, 0, 'Jadaar 3');
INSERT INTO creature_text VALUES (@JADAAR, 4, 0, 'They refused to train you?', 12, 0, 100, 0, 0, 0, 36752, 0, 'Jadaar 4');
INSERT INTO creature_text VALUES (@JADAAR, 5, 0, 'You realize, of course, that we would likely have to joust one another should we enter the tournament.', 12, 0, 100, 0, 0, 0, 36754, 0, 'Jadaar 5');
INSERT INTO creature_text VALUES (@JADAAR, 6, 0, 'Bullheadedness? It is my perseverance that has gotten us this far, dandy. You wouldn''t last five seconds.', 12, 0, 100, 0, 0, 0, 36769, 0, 'Jadaar 6');
INSERT INTO creature_text VALUES (@JADAAR, 7, 0, 'I hear those lances are rough-hewn, too. I''m no fan of splinters.', 12, 0, 100, 0, 0, 0, 36771, 0, 'Jadaar 7');
INSERT INTO creature_text VALUES (@JADAAR, 8, 0, 'If we do succeed here, you realize what comes next.', 12, 0, 100, 0, 0, 0, 36773, 0, 'Jadaar 8');
INSERT INTO creature_text VALUES (@JADAAR, 9, 0, 'The two of us against the vast undead sea.', 12, 0, 100, 0, 0, 0, 36775, 0, 'Jadaar 9');
INSERT INTO creature_text VALUES (@JADAAR, 10, 0, '...perhaps we should seek our fortune somewhere less likely to be fatal.', 12, 0, 100, 0, 0, 0, 36777, 0, 'Jadaar 10');

SET @ENTRY := 31898;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,5000,5000,150000,150000,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - Out of Combat - Run Script");

SET @ENTRY := 3189800;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,1,0,100,0,1000,1000,0,0,1,0,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 0 Asric"),
(@ENTRY,9,1,0,1,0,100,0,2000,2000,0,0,1,0,2000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 0 Jadaar"),
(@ENTRY,9,2,0,1,0,100,0,1000,1000,0,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Emote drink Asric"),
(@ENTRY,9,3,0,1,0,100,0,0,0,0,0,5,7,0,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Emote drink Jadaar"),
(@ENTRY,9,4,0,1,0,100,0,4000,4000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 1 Asric"),
(@ENTRY,9,5,0,1,0,100,0,4000,4000,0,0,1,1,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 1 Jadaar"),
(@ENTRY,9,6,0,1,0,100,0,4000,4000,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 2 Asric"),
(@ENTRY,9,7,0,1,0,100,0,4000,4000,0,0,1,2,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 2 Jadaar"),
(@ENTRY,9,8,0,1,0,100,0,4000,4000,0,0,1,3,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 3 Asric"),
(@ENTRY,9,9,0,1,0,100,0,10000,10000,0,0,1,3,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 3 Jadaar"),
(@ENTRY,9,10,0,1,0,100,0,4000,4000,0,0,1,4,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 4 Asric"),
(@ENTRY,9,11,0,1,0,100,0,4000,4000,0,0,1,5,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 5 Asric"),
(@ENTRY,9,12,0,1,0,100,0,4000,4000,0,0,1,4,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 4 Jadaar"),
(@ENTRY,9,13,0,1,0,100,0,4000,4000,0,0,1,6,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 6 Asric"),
(@ENTRY,9,14,0,1,0,100,0,10000,10000,0,0,1,5,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 5 Jadaar"),
(@ENTRY,9,15,0,1,0,100,0,5000,5000,0,0,1,7,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 7 Asric"),
(@ENTRY,9,16,0,1,0,100,0,5000,5000,0,0,1,6,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 6 Jadaar"),
(@ENTRY,9,17,0,1,0,100,0,5000,5000,0,0,1,8,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 8 Asric"),
(@ENTRY,9,18,0,1,0,100,0,5000,5000,0,0,1,7,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 7 Jadaar"),
(@ENTRY,9,19,0,1,0,100,0,5000,5000,0,0,1,9,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 9 Asric"),
(@ENTRY,9,20,0,1,0,100,0,10000,10000,0,0,1,8,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 8 Jadaar"),
(@ENTRY,9,21,0,1,0,100,0,4000,4000,0,0,1,10,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 10 Asric"),
(@ENTRY,9,22,0,1,0,100,0,4000,4000,0,0,1,9,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 9 Jadaar"),
(@ENTRY,9,23,0,1,0,100,0,4000,4000,0,0,1,11,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 11 Asric"),
(@ENTRY,9,24,0,1,0,100,0,4000,4000,0,0,1,10,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 10 Jadaar"),
(@ENTRY,9,25,0,1,0,100,0,4000,4000,0,0,1,12,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 12 Asric");

-- Baelok SAI
SET @ENTRY := 30953;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,7000,9000,13000,11,61094,0,0,0,0,0,2,0,0,0,0,0,0,0,"Baelok - In Combat - Cast 'Death Grip'"),
(@ENTRY,0,1,0,0,0,100,0,15000,20000,18000,25000,11,61090,0,0,0,0,0,2,0,0,0,0,0,0,0,"Baelok - In Combat - Cast 'Draw Soul'"),
(@ENTRY,0,2,0,0,0,100,0,10000,13000,35000,45000,11,61086,1,0,0,0,0,1,0,0,0,0,0,0,0,"Baelok - In Combat - Cast 'Summon Dancing Runeblade'"),
(@ENTRY,0,3,0,6,0,100,1,0,0,0,0,33,31159,0,0,0,0,0,16,0,0,0,0,0,0,0,"Baelok - On Just Died - Quest Credit 'The Rider of Blood' (No Repeat)"),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,39,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Baelok - On Aggro - Call For Help");

-- Rokir questcredit
SET @ENTRY := 30954;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,4000,60000,90000,11,61088,1,0,0,0,0,1,0,0,0,0,0,0,0,"Rokir - In Combat - Cast 'Zombie Horde'"),
(@ENTRY,0,1,0,9,0,100,0,0,5,15000,19000,11,61109,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rokir - Within 0-5 Range - Cast 'Plague Strike'"),
(@ENTRY,0,2,0,0,0,100,0,8000,13000,16000,21000,11,61112,1,0,0,0,0,5,0,0,0,0,0,0,0,"Rokir - In Combat - Cast 'Death and Decay'"),
(@ENTRY,0,3,0,6,0,100,1,0,0,0,0,33,31160,0,0,0,0,0,16,0,0,0,0,0,0,0,"Rokir - On Just Died - Quest Credit 'The Rider of the Unholy' (No Repeat)");
