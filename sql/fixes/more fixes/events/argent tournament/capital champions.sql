UPDATE creature_template SET damageModifier=6 WHERE entry IN(33748,33744, 33745, 33746, 33740, 33743, 33747, 33738, 33739, 33749);

SET @TB_Champion := 33748;
SET @TB_Champion_gossipmenu := 10461;
SET @Bested_Spell := 64815;
-- Thunder Bluff Champion SAI
SET @ENTRY := 33748;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10461,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10461,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10461,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunder Bluff Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunder Bluff Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunder Bluff Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Thunder Bluff Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64815,0,0,0,0,0,12,1,0,0,0,0,0,0,"Thunder Bluff Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Thunder Bluff' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunder Bluff Champion - On Reset - Set Faction 35");



DELETE FROM conditions WHERE sourcegroup=@TB_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @TB_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @TB_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @TB_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');

DELETE FROM `creature_text` WHERE `entry`= @TB_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@TB_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Valiant', 33757),
(@TB_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Valiant', 33755),
(@TB_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Valiant', 33756),
(@TB_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Valiant', 33758),
(@TB_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Valiant', 33777),
(@TB_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Valiant', 33764),
(@TB_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Valiant', 33779),
(@TB_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Valiant', 33778),
(@TB_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33774),
(@TB_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33776),
(@TB_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Valiant', 33775),
(@TB_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Valiant', 33760);

SET @Orgri_Champion := 33744;
SET @Orgri_Champion_gossipmenu := 10457;
SET @Bested_Spell := 64811;
-- Orgrimmar Champion SAI
SET @ENTRY := 33744;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10457,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orgrimmar Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10457,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orgrimmar Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10457,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orgrimmar Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Orgrimmar Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,6000,7000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Orgrimmar Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Orgrimmar Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Orgrimmar Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64811,0,0,0,0,0,12,1,0,0,0,0,0,0,"Orgrimmar Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Orgrimmar' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Orgrimmar Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@Orgri_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @Orgri_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @Orgri_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @Orgri_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @Orgri_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@Orgri_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Valiant', 33757),
(@Orgri_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Valiant', 33755),
(@Orgri_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Valiant', 33756),
(@Orgri_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Valiant', 33758),
(@Orgri_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Valiant', 33777),
(@Orgri_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Valiant', 33764),
(@Orgri_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Valiant', 33779),
(@Orgri_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Valiant', 33778),
(@Orgri_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33774),
(@Orgri_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33776),
(@Orgri_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Valiant', 33775),
(@Orgri_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Valiant', 33760);





SET @Sen_Champion := 33745;
SET @Sen_Champion_gossipmenu := 10458;
SET @Bested_Spell := 64812;
-- Sen'jin Champion SAI
SET @ENTRY := 33745;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,99,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10458,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sen'jin Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10458,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sen'jin Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10458,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sen'jin Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sen'jin Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sen'jin Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sen'jin Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Sen'jin Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64812,0,0,0,0,0,12,1,0,0,0,0,0,0,"Sen'jin Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Sen'jin' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sen'jin Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@Sen_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @Sen_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @Sen_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @Sen_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @Sen_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@Sen_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Valiant', 33757),
(@Sen_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Valiant', 33755),
(@Sen_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Valiant', 33756),
(@Sen_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Valiant', 33758),
(@Sen_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Valiant', 33777),
(@Sen_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Valiant', 33764),
(@Sen_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Valiant', 33779),
(@Sen_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Valiant', 33778),
(@Sen_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33774),
(@Sen_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33776),
(@Sen_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Valiant', 33775),
(@Sen_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Valiant', 33760);






SET @SM_Champion := 33746;
SET @SM_Champion_gossipmenu := 10459;
SET @Bested_Spell := 64813;
-- Silvermoon Champion SAI
SET @ENTRY := 33746;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10459,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Silvermoon Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10459,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Silvermoon Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10459,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Silvermoon Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Silvermoon Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Silvermoon Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Silvermoon Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Silvermoon Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64813,0,0,0,0,0,12,1,0,0,0,0,0,0,"Silvermoon Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Silvermoon City' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Silvermoon Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@SM_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @SM_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @SM_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @SM_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @SM_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@SM_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Valiant', 33757),
(@SM_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Valiant', 33755),
(@SM_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Valiant', 33756),
(@SM_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Valiant', 33758),
(@SM_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Valiant', 33777),
(@SM_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Valiant', 33764),
(@SM_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Valiant', 33779),
(@SM_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Valiant', 33778),
(@SM_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33774),
(@SM_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33776),
(@SM_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Valiant', 33775),
(@SM_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Valiant', 33760);






SET @GR_Champion := 33740;
SET @GR_Champion_gossipmenu := 10455;
SET @Bested_Spell := 64809;
-- Gnomeregan Champion SAI
SET @ENTRY := 33740;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10455,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gnomeregan Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10455,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gnomeregan Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10455,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gnomeregan Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gnomeregan Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gnomeregan Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gnomeregan Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Gnomeregan Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64809,0,0,0,0,0,12,1,0,0,0,0,0,0,"Gnomeregan Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Gnomeregan' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gnomeregan Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@GR_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @GR_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @GR_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @GR_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');

DELETE FROM `creature_text` WHERE `entry`= @GR_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@GR_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Valiant', 33757),
(@GR_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Valiant', 33755),
(@GR_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Valiant', 33756),
(@GR_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Valiant', 33758),
(@GR_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Valiant', 33777),
(@GR_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Valiant', 33764),
(@GR_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Valiant', 33779),
(@GR_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Valiant', 33778),
(@GR_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33774),
(@GR_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33776),
(@GR_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Valiant', 33775),
(@GR_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Valiant', 33760);





SET @IF_Champion := 33743;
SET @IF_Champion_gossipmenu := 10456;
SET @Bested_Spell := 64810;
-- Ironforge Champion SAI
SET @ENTRY := 33743;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10456,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Ironforge Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10456,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Ironforge Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10456,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Ironforge Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ironforge Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ironforge Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ironforge Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Ironforge Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64810,0,0,0,0,0,12,1,0,0,0,0,0,0,"Ironforge Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Ironforge' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ironforge Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@IF_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @IF_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @IF_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @IF_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @IF_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@IF_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Valiant', 33757),
(@IF_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Valiant', 33755),
(@IF_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Valiant', 33756),
(@IF_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Valiant', 33758),
(@IF_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Valiant', 33777),
(@IF_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Valiant', 33764),
(@IF_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Valiant', 33779),
(@IF_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Valiant', 33778),
(@IF_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33774),
(@IF_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33776),
(@IF_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Valiant', 33775),
(@IF_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Valiant', 33760);



SET @SW_Champion := 33747;
SET @SW_Champion_gossipmenu := 10460;
SET @Bested_Spell := 64814;
-- Stormwind Champion SAI
SET @ENTRY := 33747;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10460,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stormwind Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10460,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stormwind Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10460,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Stormwind Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stormwind Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stormwind Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Stormwind Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Stormwind Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64814,0,0,0,0,0,12,1,0,0,0,0,0,0,"Stormwind Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Stormwind' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stormwind Champion - On Reset - Set Faction 35");



DELETE FROM conditions WHERE sourcegroup=@SW_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @SW_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @SW_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @SW_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @SW_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@SW_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Valiant', 33757),
(@SW_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Valiant', 33755),
(@SW_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Valiant', 33756),
(@SW_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Valiant', 33758),
(@SW_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Valiant', 33777),
(@SW_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Valiant', 33764),
(@SW_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Valiant', 33779),
(@SW_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Valiant', 33778),
(@SW_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33774),
(@SW_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33776),
(@SW_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Valiant', 33775),
(@SW_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Valiant', 33760);







SET @Darn_Champion := 33738;
SET @Darn_Champion_gossipmenu := 10453;
SET @Bested_Spell := 64805;
-- Darnassus Champion SAI
SET @ENTRY := 33738;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10453,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Darnassus Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10453,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Darnassus Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10453,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Darnassus Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Darnassus Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Darnassus Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Darnassus Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Darnassus Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64805,0,0,0,0,0,12,1,0,0,0,0,0,0,"Darnassus Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested Darnassus' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darnassus Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@Darn_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @Darn_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @Darn_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @Darn_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @Darn_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@Darn_Champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Valiant', 33757),
(@Darn_Champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Valiant', 33755),
(@Darn_Champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Valiant', 33756),
(@Darn_Champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Valiant', 33758),
(@Darn_Champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Valiant', 33777),
(@Darn_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Valiant', 33764),
(@Darn_Champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Valiant', 33779),
(@Darn_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Valiant', 33778),
(@Darn_Champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33774),
(@Darn_Champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33776),
(@Darn_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Valiant', 33775),
(@Darn_Champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Valiant', 33760);





SET @Exo_Champion := 33739;
SET @Exo_Champion_gossipmenu := 10454;
SET @Bested_Spell := 64808;
-- Exodar Champion SAI
SET @ENTRY := 33739;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10454,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exodar Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10454,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exodar Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10454,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Exodar Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Exodar Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Exodar Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Exodar Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Exodar Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64808,0,0,0,0,0,12,1,0,0,0,0,0,0,"Exodar Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested the Exodar' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Exodar Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@Exo_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @Exo_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @Exo_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @Exo_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @Exo_champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@Exo_champion,0,0,'Ready yourself!',12,7,100,0,0,0,'Argent Valiant', 33757),
(@Exo_champion,0,1,'Prepare yourself!',12,7,100,0,0,0,'Argent Valiant', 33755),
(@Exo_champion,0,2,'On your guard!',12,7,100,0,0,0,'Argent Valiant', 33756),
(@Exo_champion,0,3,'Let it begin!',12,7,100,0,0,0,'Argent Valiant', 33758),
(@Exo_champion,1,0,'Victory is mine!',12,7,100,0,0,0,'Argent Valiant', 33777),
(@Exo_champion,1,1,'It seems you still need more practice. Perhaps another time.',12,7,100,0,0,0,'Argent Valiant', 33764),
(@Exo_champion,1,2,'I have won. Better luck another time, friend.',12,7,100,0,0,0,'Argent Valiant', 33779),
(@Exo_champion,1,3,'I am afraid you will need more practice to defeat me.',12,7,100,0,0,0,'Argent Valiant', 33778),
(@Exo_champion,2,0,'I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33774),
(@Exo_champion,2,1,'That was a well fought battle. I yield to you.',12,7,100,0,0,0,'Argent Valiant', 33776),
(@Exo_champion,2,2,'It would seem I underestimated your skills. Well done.',12,7,100,0,0,0,'Argent Valiant', 33775),
(@Exo_champion,2,3,'I have been defeated. Good fight!',12,7,100,0,0,0,'Argent Valiant', 33760);


SET @UC_Champion := 33749;
SET @UC_Champion_gossipmenu := 10462;
SET @Bested_Spell := 64816;
-- Undercity Champion SAI
SET @ENTRY := 33749;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,28,64223,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Reset - Remove Aura '[DND] Defend Aura (10 seconds)'"),
(@ENTRY,0,1,2,62,0,100,0,10462,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Undercity Champion - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,2,3,61,0,100,0,10462,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Undercity Champion - On Gossip Option 0 Selected - Store Targetlist"),
(@ENTRY,0,3,0,61,0,100,0,10462,0,0,0,80,3328500,2,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Gossip Option 0 Selected - Run Script"),
(@ENTRY,0,4,0,52,0,100,0,0,33564,0,0,11,63010,0,0,0,0,0,7,0,0,0,0,0,0,0,"Undercity Champion - On Text 0 Over - Cast 'Charge'"),
(@ENTRY,0,5,0,0,0,100,0,0,0,1500,4000,11,62544,0,0,0,0,0,2,0,0,0,0,0,0,0,"Undercity Champion - In Combat - Cast 'Thrust'"),
(@ENTRY,0,6,0,9,0,100,0,5,6,5000,8000,11,62575,0,0,0,0,0,2,0,0,0,0,0,0,0,"Undercity Champion - Within 5-6 Range - Cast 'Shield-Breaker'"),
(@ENTRY,0,7,0,0,0,100,0,5000,10000,6000,7000,46,30,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - In Combat - Move Forward 30 Yards"),
(@ENTRY,0,8,9,9,0,100,0,8,25,4000,6000,11,63010,0,0,0,0,0,2,0,0,0,0,0,0,0,"Undercity Champion - Within 8-25 Range - Cast 'Charge'"),
(@ENTRY,0,10,11,2,0,100,1,1,5,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - Between 1-5% Health - Increment Phase (No Repeat)"),
(@ENTRY,0,11,14,60,2,100,0,1,5,60000,60000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Update - Say Line 2 (Phase 2)"),
(@ENTRY,0,12,13,32,1,100,0,1,15000,60000,60000,85,63596,0,0,0,0,0,7,1,0,0,0,0,0,0,"Undercity Champion - On Damaged Between 1-15000 - Invoker Cast 'Mounted Melee Victory' (Phase 1)"),
(@ENTRY,0,13,18,61,1,100,0,1,15000,60000,60000,85,64816,0,0,0,0,0,12,1,0,0,0,0,0,0,"Undercity Champion - On Damaged Between 1-15000 - Invoker Cast 'Bested the Undercity' (Phase 1)"),
(@ENTRY,0,14,0,60,2,100,0,1,5,60000,60000,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Update - Evade (Phase 2)"),
(@ENTRY,0,15,16,5,0,100,0,60000,60000,1,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Killed Unit - Say Line 1"),
(@ENTRY,0,16,17,61,0,100,0,60000,60000,1,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Killed Unit - Set Visibility Off"),
(@ENTRY,0,17,0,61,0,100,0,60000,60000,1,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Killed Unit - Despawn Instant"),
(@ENTRY,0,18,0,61,1,100,0,1,15000,60000,60000,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Damaged Between 1-15000 - Increment Phase (Phase 1)"),
(@ENTRY,0,19,11,60,2,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Update - Set Faction 35 (Phase 2)"),
(@ENTRY,0,20,0,25,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,"Undercity Champion - On Reset - Set Faction 35");


DELETE FROM conditions WHERE sourcegroup=@UC_Champion_gossipmenu AND ConditionValue1 IN(@Bested_Spell,63034,62853);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, @UC_Champion_gossipmenu, 0, 0, 1, 1, 0, @Bested_Spell, 0, 0, 1, 0, 0, '', 'Show gossip menu only if don\'t have the aura'),
(15, @UC_Champion_gossipmenu, 0, 0, 1, 1, 0, 63034, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura'),
(15, @UC_Champion_gossipmenu, 0, 0, 1, 1, 0, 62853, 0, 0, 0, 0, 0, '', 'Show gossip menu only if the player have the aura');


DELETE FROM `creature_text` WHERE `entry`= @UC_Champion;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`, `BroadcastTextId`) VALUES
(@UC_Champion,0,0,'Ready yourself!',12,1,100,0,0,0,'Argent Valiant', 33757),
(@UC_Champion,0,1,'Prepare yourself!',12,1,100,0,0,0,'Argent Valiant', 33755),
(@UC_Champion,0,2,'On your guard!',12,1,100,0,0,0,'Argent Valiant', 33756),
(@UC_Champion,0,3,'Let it begin!',12,1,100,0,0,0,'Argent Valiant', 33758),
(@UC_Champion,1,0,'Victory is mine!',12,1,100,0,0,0,'Argent Valiant', 33777),
(@UC_Champion,1,1,'It seems you still need more practice. Perhaps another time.',12,1,100,0,0,0,'Argent Valiant', 33764),
(@UC_Champion,1,2,'I have won. Better luck another time, friend.',12,1,100,0,0,0,'Argent Valiant', 33779),
(@UC_Champion,1,3,'I am afraid you will need more practice to defeat me.',12,1,100,0,0,0,'Argent Valiant', 33778),
(@UC_Champion,2,0,'I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33774),
(@UC_Champion,2,1,'That was a well fought battle. I yield to you.',12,1,100,0,0,0,'Argent Valiant', 33776),
(@UC_Champion,2,2,'It would seem I underestimated your skills. Well done.',12,1,100,0,0,0,'Argent Valiant', 33775),
(@UC_Champion,2,3,'I have been defeated. Good fight!',12,1,100,0,0,0,'Argent Valiant', 33760);
