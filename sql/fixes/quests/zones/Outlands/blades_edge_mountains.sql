-- -------------------------------------------
-- BLADES_EDGE_MOUNTAINS
-- -------------------------------------------

-- Guardian of the Monument -- [A][H] http://www.wowhead.com/quest=11059/guardian-of-the-monument

UPDATE creature_loot_template SET Chance=100 WHERE Item=32697 AND entry=22275;


-- Stasis Chambers of Bash'ir -- [A][H] http://www.wowhead.com/quest=10974/stasis-chambers-of-bashir

SET @THUK := 22920;
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@THUK;
DELETE FROM smart_scripts WHERE entryorguid=@THUK AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES 
    (@THUK, 0,0,0,6,0,100,0,0,0,0,0,32,0,0,0,0,0,0,14,47301,185512,0,0,0,0,0,"Thuk the Defiant - On Just Died - Reset Gameobject");

-- Test Flight: Raven\'s Wood -- http://www.wowhead.com/quest=10716/test-flight-ravens-wood-needs-reward
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=10716;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(1, 10716, 0, '', '', 'Deprecated quest: Test Flight: Raven\'s Wood');

-- [Q] Bladespire Kegger - http://www.wowhead.com/quest=10545/bladespire-kegger
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_bloodmaul_brutebane' WHERE  `entry`=21241;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_bloodmaul_brute' WHERE  `entry` IN (19991, 19995, 19998, 20334);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (19991, 19995, 19998, 20334, 21241);


-- The Smallest Creatures - [H] http://www.wowhead.com/quest=10720/the-smallest-creatures

UPDATE gameobject_template SET ScriptName='' WHERE entry IN(185206, 185213, 185214);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=38629;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (13, 1, 38629, 0, 0, 31, 0, 3, 22356, 0, 0, 0, 0, '', ''),
    (13, 1, 38629, 0, 1, 31, 0, 3, 22367, 0, 0, 0, 0, '', ''),
    (13, 1, 38629, 0, 2, 31, 0, 3, 22368, 0, 0, 0, 0, '', '');

DELETE FROM spell_script_names WHERE spell_id IN(38629, 38544);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (38629, "spell_q10720_the_smallest_creature");

REPLACE INTO disables VALUES(7, 185206, 0, '', '', '');
REPLACE INTO disables VALUES(7, 185213, 0, '', '', '');
REPLACE INTO disables VALUES(7, 185214, 0, '', '', '');

-- Showdown - [A] http://www.wowhead.com/quest=10806/showdown - [H] http://www.wowhead.com/quest=10742/showdown

SET @GOC := 20555;
SET @SABELLIAN := 22496;
SET @REXXAR := 22448;
SET @SABLEMANE := 22473;
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(@SABELLIAN, @GOC));
DELETE FROM creature WHERE id IN(@SABELLIAN, @GOC);
DELETE FROM event_scripts WHERE id IN(14462, 14525);
INSERT INTO event_scripts VALUES (14462, 0, 10, @GOC, 300000, 0, 3703.51, 5387.74, -4.37, 5.9);
INSERT INTO event_scripts VALUES (14462, 0, 10, @REXXAR, 300000, 0, 3688, 5353, 25, 0);
INSERT INTO event_scripts VALUES (14525, 0, 10, @GOC, 300000, 0, 3703.51, 5387.74, -4.37, 5.9);
INSERT INTO event_scripts VALUES (14525, 0, 10, @SABLEMANE, 300000, 0, 3718.36, 5361.27, -8.0, 2.14);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=39224;
INSERT INTO conditions VALUES(17, 0, 39224, 0, 0, 29, 0, 14462, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
INSERT INTO conditions VALUES(17, 0, 39224, 0, 0, 29, 0, @GOC, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=39223;
INSERT INTO conditions VALUES(17, 0, 39223, 0, 0, 29, 0, 14462, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
INSERT INTO conditions VALUES(17, 0, 39223, 0, 0, 29, 0, @GOC, 150, 0, 1, 22, 0, '', 'Require no Goc nearby');
DELETE FROM creature_text WHERE entry=@GOC;
INSERT INTO creature_text VALUES (@GOC, 0, 0, 'Who dares place this affront upon the altar of Goc?', 14, 0, 100, 53, 0, 0, 0, 0, 'Goc');
INSERT INTO creature_text VALUES (@GOC, 1, 0, 'Who dares rouse Goc from his restful slumber?', 14, 0, 100, 53, 0, 0, 0, 0, 'Goc');
INSERT INTO creature_text VALUES (@GOC, 2, 0, 'Your name is as insignificant to me as the names of the thousands who have died under the might of Goc. I will crush you and $N.', 14, 0, 100, 53, 0, 0, 0, 0, 'Goc');
UPDATE creature_template SET faction=14, AIName='SmartAI', ScriptName='' WHERE entry=@GOC;
DELETE FROM smart_scripts WHERE entryorguid=@GOC AND source_type=0;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@GOC, 0, 0, 0, 38, 0, 100, 0, 1, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @REXXAR, 100, 0, 0, 0, 0, 0, 'Goc - On Data Set - Set Orientation'),
    (@GOC, 0, 1, 0, 38, 0, 100, 0, 1, 1, 0, 0, 1, 2, 0, 0, 0, 0, 0, 21, 100, 0, 0, 0, 0, 0, 0, 'Goc - On Data Set - Say Line 2'),
    (@GOC, 0, 2, 9, 38, 0, 100, 0, 1, 2, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 100, 0, 0, 0, 0, 0, 0, 'Goc - On Data Set - Attack Start'),
    (@GOC, 0, 3, 12, 6, 0, 100, 0, 0, 0, 0, 0, 11, 45106, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Death - Cast Showdown: Goc Kill Credit'),
    (@GOC, 0, 4, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Evade - Despawn'),
    (@GOC, 0, 5, 0, 0, 0, 100, 0, 9000, 12000, 11000, 15000, 11, 38784, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - In Combat - Cast Ground Smash'),
    (@GOC, 0, 6, 0, 0, 0, 100, 0, 3000, 6000, 11000, 15000, 11, 38783, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Goc - In Combat - Cast Boulder Volley'),
    (@GOC, 0, 7, 8, 25, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Set Unit Flags'),
    (@GOC, 0, 8, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Set React Passive'),
    (@GOC, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Remove Unit Flags'),
    (@GOC, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Goc - On Reset - Set React Aggressive'),
    (@GOC, 0, 11, 0, 38, 0, 100, 0, 1, 3, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SABLEMANE, 100, 0, 0, 0, 0, 0, 'Goc - On Data Set - Set Orientation'),
    (@GOC, 0, 12, 13, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, @SABLEMANE, 0, 100, 0, 0, 0, 0, "Goc - On Just Died - Despawn Instant"),
    (@GOC, 0, 13, 0, 6, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 9, @REXXAR, 0, 100, 0, 0, 0, 0, "Goc - On Just Died - Despawn Instant");

DELETE FROM creature_text WHERE entry=@SABLEMANE;
INSERT INTO creature_text VALUES (@SABLEMANE, 0, 0, 'It''s only right that you know the name of the one who will take your life.', 14, 0, 100, 1, 0, 0, 0, 0, 'Baron Sablemane');
INSERT INTO creature_text VALUES (@SABLEMANE, 1, 0, 'Baron Sablemane. It will be on your lips as you gasp your dying breath.', 14, 0, 100, 1, 0, 0, 0, 0, 'Baron Sablemane');
INSERT INTO creature_text VALUES (@SABLEMANE, 2, 0, 'Let us begin.', 14, 0, 100, 15, 0, 0, 0, 0, 'Baron Sablemane');
INSERT INTO creature_text VALUES (@SABLEMANE, 3, 0, 'We will speak again, but away from here.', 14, 0, 100, 1, 0, 0, 0, 0, 'Baron Sablemane');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@SABLEMANE;
DELETE FROM smart_scripts WHERE entryorguid=@SABLEMANE AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(@SABLEMANE*100, @SABLEMANE*100+1) AND source_type=9;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@SABLEMANE, 0, 0, 0, 37, 0, 100, 1, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On AI Init - Set Active'),
    (@SABLEMANE, 0, 1, 0, 60, 0, 100, 1, 0, 0, 0, 0, 80, @SABLEMANE*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Start Script'),
    (@SABLEMANE, 0, 2, 0, 7, 0, 100, 1, 0, 0, 0, 0, 80, @SABLEMANE*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Evade - Start Script'),
    (@SABLEMANE, 0, 3, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 11, 17290, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - In Combat - Cast Fireball'),
    (@SABLEMANE, 0, 4, 0, 0, 0, 100, 0, 4000, 7000, 11000, 20000, 11, 39268, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - In Combat - Cast Chains of Ice'),
    (@SABLEMANE*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Unit Flags'),
    (@SABLEMANE*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 41232, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Cast Teleport Visual Only'),
    (@SABLEMANE*100, 9, 2, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 1 Target'),
    (@SABLEMANE*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 0'),
    (@SABLEMANE*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 3, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Data'),
    (@SABLEMANE*100, 9, 5, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 1'),
    (@SABLEMANE*100, 9, 6, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Data'),
    (@SABLEMANE*100, 9, 7, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 1'),
    (@SABLEMANE*100, 9, 8, 0, 0, 0, 100, 0, 500, 500, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Set Data'),
    (@SABLEMANE*100, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Attack Start'),
    (@SABLEMANE*100, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Remove Unit Flags'),
    (@SABLEMANE*100+1, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Say Line 3'),
    (@SABLEMANE*100+1, 9, 1, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 11, 41232, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Cast Teleport Visual Only'),
    (@SABLEMANE*100+1, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - On Update - Despawn');

DELETE FROM creature_text WHERE entry=@REXXAR;
INSERT INTO creature_text VALUES (@REXXAR, 0, 0, 'I am Rexxar, son of the Mok''Nathal, champion of the Horde.', 14, 0, 100, 397, 0, 0, 0, 0, 'Rexxar');
INSERT INTO creature_text VALUES (@REXXAR, 1, 0, 'And their torment at your hands is at an end. By my name, I shall put an end to your life.', 14, 0, 100, 113, 0, 0, 0, 0, 'Rexxar');
INSERT INTO creature_text VALUES (@REXXAR, 2, 0, 'Prepare yourself for the end.', 14, 0, 100, 15, 0, 0, 0, 0, 'Rexxar');
INSERT INTO creature_text VALUES (@REXXAR, 3, 0, 'I could not have achieved this victory without you. We will speak back at Thunderlord Stronghold.', 14, 0, 100, 397, 0, 0, 0, 0, 'Rexxar');

UPDATE creature_template SET InhabitType=3, AIName='SmartAI', ScriptName='' WHERE entry=@REXXAR;
DELETE FROM creature_template_addon WHERE entry=@REXXAR;
DELETE FROM smart_scripts WHERE entryorguid=@REXXAR AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(@REXXAR*100, @REXXAR*100+1) AND source_type=9;
INSERT INTO smart_scripts (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES 
    (@REXXAR, 0, 0, 1, 37, 0, 100, 1, 0, 0, 0, 0, 43, 0, 20964, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - Mount'),
    (@REXXAR, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - Set Active'),
    (@REXXAR, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 60, 1, 200, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - Set Flying'),
    (@REXXAR, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 148, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On AI Init - No Environment Update'),
    (@REXXAR, 0, 4, 0, 60, 0, 100, 1, 0, 0, 0, 0, 80, @REXXAR*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Start Script'),
    (@REXXAR, 0, 5, 0, 7, 0, 100, 1, 0, 0, 0, 0, 80, @REXXAR*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Evade - Start Script'),
    (@REXXAR, 0, 6, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 11, 39269, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - In Combat - Cast Summon Misha'),
    (@REXXAR, 0, 7, 0, 0, 0, 100, 1, 16000, 16000, 0, 0, 11, 39251, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - In Combat - Cast Summon Huffer'),
    (@REXXAR, 0, 8, 0, 0, 0, 100, 1, 30000, 30000, 0, 0, 11, 39253, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - In Combat - Cast Summon Spirit'),
    (@REXXAR*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Unit Flags'),
    (@REXXAR*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 27, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Emote State'),
    (@REXXAR*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3718.36, 5361.27, -6.5, 0, 'Rexxar - On Update - Move Point'),
    (@REXXAR*100, 9, 3, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 0 Target'),
    (@REXXAR*100, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 43, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Dismount'),
    (@REXXAR*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Fly off'),
    (@REXXAR*100, 9, 6, 0, 0, 0, 100, 0, 500, 500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Orientation'),
    (@REXXAR*100, 9, 7, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 0'),
    (@REXXAR*100, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Data'),
    (@REXXAR*100, 9, 9, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 1'),
    (@REXXAR*100, 9, 10, 0, 0, 0, 100, 0, 8000, 8000, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Data'),
    (@REXXAR*100, 9, 11, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 2'),
    (@REXXAR*100, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Home Position'),
    (@REXXAR*100, 9, 13, 0, 0, 0, 100, 0, 500, 500, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Data'),
    (@REXXAR*100, 9, 14, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Remove Unit Flags'),
    (@REXXAR*100, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, @GOC, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Attack Start'),
    (@REXXAR*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, 22492, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn Target'),
    (@REXXAR*100+1, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, 22498, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn Target'),
    (@REXXAR*100+1, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, 22490, 100, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn Target'),
    (@REXXAR*100+1, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Say Line 3'),
    (@REXXAR*100+1, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 43, 0, 20964, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Mount'),
    (@REXXAR*100+1, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 60, 1, 300, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Set Fly'),
    (@REXXAR*100+1, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 2, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3625, 5468, 104, 0, 'Rexxar - On Update - Move To Position'),
    (@REXXAR*100+1, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 8000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - On Update - Despawn');

-- Wildlord Antelarion (22127) 
SET @ENTRY:=22127;
UPDATE `creature_template` SET `gossip_menu_id`=8523, `AIName`='SmartAI' WHERE `entry`=@ENTRY;

-- Gossip insert
DELETE FROM `gossip_menu` WHERE `entry`=8523;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES 
(8523,10657),
(8523,10655);

-- Gossip option 
DELETE FROM `gossip_menu_option` WHERE `menu_id`=8523;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(8523, 0, 0, 'The Felsworn Gas Mask was destroyed, do you have another one?', 0, 1, 1, 0, 0, 0, 0, '',0),
(8523, 1, 0, 'Wildlord, I seem to have lost my druid signal.', 20299, 1, 1, 0, 0, 0, 0, '', 0);

-- Gossip option conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=8523;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- Felsworn Gas Mask quest taken
(15, 8523, 0, 0, 0, 2, 0, 31366, 1, 0, 1, 0, 0, '', 'Show gossip only if player doesnt have Felsworn Gas Mask'), 
(15, 8523, 0, 0, 0, 9, 0, 10819, 0, 0, 0, 0, 0, '', 'Show gossip if Felsworn Gas Mask quest taken'), 
-- Felsworn Gas Mask quest rewarded and You're Fired! quest not rewarded
(15, 8523, 0, 0, 1, 2, 0, 31366, 1, 0, 1, 0, 0, '', 'Show gossip only if player doesnt have Felsworn Gas Mask'), 
(15, 8523, 0, 0, 1, 8, 0, 10819, 0, 0, 0, 0, 0,'', 'Show gossip if Felsworn Gas Mask quest rewarded'), 
(15, 8523, 0, 0, 1, 8, 0, 10821, 0, 0, 1, 0, 0,'', 'Hide gossip when You\'re Fired! quest rewarded'), 
-- Deaths Door quest  Rewarded and The Hound-Master quest  not Rewarded
(15, 8523, 1, 0, 2, 8, 0, 10910, 0, 0, 0, 0, 0, '', 'Gossip Option requires Deaths Door Rewarded'),
(15, 8523, 1, 0, 2, 8, 0, 10912, 0, 0, 1, 0, 0, '', 'Gossip Option requires The Hound-Master not Rewarded'),
(15, 8523, 1, 0, 2, 2, 0, 31763, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Druid Signal');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=38448;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17, 0, 38448, 0, 0, 3, 0, 31366, 0, 0, 0, 0, '', 'Felsworn Gas Mask spell only if the mask is equiped');

-- SAI for Wildlord Antelarion
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY, 0, 0, 1, 62, 0, 100, 0, 8523, 0, 0, 0, 11, 39101, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip option select - Cast Create Felsword Gas Mask'), 
(@ENTRY, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip option select - Close Gossip'), 
(@ENTRY, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip option select - Say 0'),
(@ENTRY, 0, 3, 4, 62, 0, 100, 0, 8523, 1, 0, 0, 11, 39203, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip Option 1 Selected - Cast \'Create Druid Signal\''),
(@ENTRY, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 72, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip Option 1 Selected - Close Gossip'),
(@ENTRY, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wildlord Antelarion - On Gossip Option 1 Selected - Say Line 1');

--  Wildlord Antelarion text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES 
(@ENTRY, 0, 0, 'It\'s a good thing I was able to make duplicates of the Felsworn Gas Mask.', 12, 0, 100, 0, 0, 0, 0, 0, 'Wildlord Antelarion'),
(@ENTRY, 1, 0, 'Very well, here is your replacement.', 12, 0, 100, 0, 0, 0, 20300, 0, 'Wildlord Antelarion ');


-- Fire At Will! (10911)

DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(22474, 22500));
DELETE FROM creature WHERE id IN(22474, 22500);
UPDATE creature_template SET unit_flags=0, modelid2=0, flags_extra=0 WHERE entry IN(22474, 22500); 
UPDATE creature_template SET modelid1=15880, modelid2=0, ScriptName="npc_deaths_door_wrap_gate" WHERE entry IN(22471, 22472);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39221;
INSERT INTO conditions VALUES (13, 1, 39221, 0, 0, 31, 0, 3, 22471, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 1, 39221, 0, 1, 31, 0, 3, 22472, 0, 0, 0, 0, '', '');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39219;
INSERT INTO conditions VALUES (13, 1, 39219, 0, 0, 29, 0, 22443, 15, 0, 0, 0, 0, '', '');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=39219;
INSERT INTO conditions VALUES (17, 0, 39219, 0, 0, 28, 0, 10911, 0, 0, 1, 0, 0, '', '');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39222;
INSERT INTO conditions VALUES (13, 1, 39222, 0, 0, 31, 0, 3, 22474, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 1, 39222, 0, 1, 31, 0, 3, 22501, 0, 0, 0, 0, '', '');

DELETE FROM spell_script_names WHERE spell_id=39219;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (39219, 'spell_deaths_door_fel_cannon');

UPDATE creature SET spawntimesecs=20 WHERE id=22443;
UPDATE creature SET orientation=3.306122 WHERE guid=78793;
UPDATE creature SET orientation=5.952941 WHERE guid=78794;



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

-- [Quest][Outalnd] Test Flight: Ruuan Weald -- http://wotlk.openwow.com/quest=10712
DELETE FROM `spell_script_names` WHERE `spell_id`=38170;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(38170, 'spell_q10712_spin_nether_weather_vane');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=-37968 AND `spell_effect`=79404;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(-37968, 79404, 0, 'Soaring - on remove - cast Parachute');