-- Reanimated Abomination SAI
SET @ENTRY := 31692;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,3,31,0,100,0,59576,0,0,0,33,31743,0,0,0,0,0,23,0,0,0,0,0,0,0,"Reanimated Abomination - Spell Hit Target - Killedmonster credit"),
(@ENTRY,0,1,3,31,0,100,0,59576,0,0,0,33,32168,0,0,0,0,0,23,0,0,0,0,0,0,0,"Reanimated Abomination - Spell Hit Target - Killedmonster credit"),
(@ENTRY,0,2,3,31,0,100,0,59576,0,0,0,33,32167,0,0,0,0,0,23,0,0,0,0,0,0,0,"Reanimated Abomination - Spell Hit Target - Killedmonster credit"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,85,52516,2,0,0,0,0,7,0,0,0,0,0,0,0,"Reanimated Abomination - Linked - Invoker Cast Burst at the Seams:Bone"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,41,200,0,0,0,0,0,7,0,0,0,0,0,0,0,"Reanimated Abomination - Linked - Despawn"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,11,52523,2,0,0,0,0,1,0,0,0,0,0,0,0,"Reanimated Abomination - Linked - Cast Explode Abomination:Bloody Meat"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,11,59580,2,0,0,0,0,1,0,0,0,0,0,0,0,"Reanimated Abomination - Linked - Cast Burst at the Seams");


UPDATE creature_template SET minlevel=80, maxlevel=80, spell1=59564, spell2=59576, AIName='SmartAI', ScriptName='' WHERE entry=31692;
DELETE FROM spell_linked_spell WHERE spell_trigger IN(59576, -59576, 59579, -59579);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(59564, 59576, 59579);
INSERT INTO conditions VALUES (13, 3, 59564, 0, 0, 31, 0, 3, 31142, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 3, 59564, 0, 1, 31, 0, 3, 31147, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 3, 59564, 0, 2, 31, 0, 3, 31205, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 2, 59576, 0, 0, 31, 0, 3, 31142, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 2, 59576, 0, 1, 31, 0, 3, 31147, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 2, 59576, 0, 2, 31, 0, 3, 31205, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 1, 59579, 0, 0, 31, 0, 3, 31142, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 1, 59579, 0, 1, 31, 0, 3, 31147, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 1, 59579, 0, 2, 31, 0, 3, 31205, 0, 0, 0, 0, '', '');
DELETE FROM smart_scripts WHERE entryorguid=31692 AND source_type=0;
INSERT INTO smart_scripts VALUES (31692, 0, 0, 3, 31, 0, 100, 0, 59576, 0, 0, 0, 33, 31743, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Abomination - Spell Hit Target - Killedmonster credit');
INSERT INTO smart_scripts VALUES (31692, 0, 1, 3, 31, 0, 100, 0, 59576, 0, 0, 0, 33, 32168, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Abomination - Spell Hit Target - Killedmonster credit');
INSERT INTO smart_scripts VALUES (31692, 0, 2, 3, 31, 0, 100, 0, 59576, 0, 0, 0, 33, 32167, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Abomination - Spell Hit Target - Killedmonster credit');
INSERT INTO smart_scripts VALUES (31692, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 85, 52516, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Abomination - Linked - Invoker Cast Burst at the Seams:Bone');
INSERT INTO smart_scripts VALUES (31692, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 41, 200, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Abomination - Linked - Despawn');
INSERT INTO smart_scripts VALUES (31692, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 11, 52523, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Abomination - Linked - Cast Explode Abomination:Bloody Meat');
INSERT INTO smart_scripts VALUES (31692, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 59580, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Reanimated Abomination - Linked - Cast Burst at the Seams');
DELETE FROM conditions WHERE SourceEntry=31692 AND SourceTypeOrReferenceId=22;
INSERT INTO conditions VALUES(22, 1, 31692, 0, 0, 31, 0, 3, 31142, 0, 0, 0, 0, '', 'Only execute SAI if invoker has entry 31142');
INSERT INTO conditions VALUES(22, 2, 31692, 0, 0, 31, 0, 3, 31147, 0, 0, 0, 0, '', 'Only execute SAI if invoker has entry 31147');
INSERT INTO conditions VALUES(22, 3, 31692, 0, 0, 31, 0, 3, 31205, 0, 0, 0, 0, '', 'Only execute SAI if invoker has entry 31205');