-- Sigrid Iceborn SAI
SET @ENTRY := 30086;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3500,4100,11,61168,64,0,0,0,0,2,0,0,0,0,0,0,0,"Sigrid Iceborn - In Combat - Cast 'Throw'"),
(@ENTRY,0,1,0,0,0,100,0,3000,7000,13000,16700,11,61164,0,0,0,0,0,2,0,0,0,0,0,0,0,"Sigrid Iceborn - In Combat - Cast 'Impale'"),
(@ENTRY,0,2,0,13,0,100,0,12000,18000,0,0,11,57635,0,0,0,0,0,6,1,0,0,0,0,0,0,"Sigrid Iceborn - On Victim Casting - Cast 'Disengage'"),
(@ENTRY,0,3,13,1,0,100,0,500,1000,600000,600000,11,61165,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - Out of Combat - Cast 'Frostbite Weapon'"),
(@ENTRY,0,4,5,62,0,100,0,9870,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sigrid Iceborn - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,5,6,61,0,100,0,9870,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - On Gossip Option 0 Selected - Set Invincibility Hp 1"),
(@ENTRY,0,6,7,61,0,100,0,9870,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - On Gossip Option 0 Selected - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,7,8,61,0,100,0,9870,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - On Gossip Option 0 Selected - Set Faction 14"),
(@ENTRY,0,8,13,61,0,100,0,9870,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - On Gossip Option 0 Selected - Say Line 0"),
(@ENTRY,0,9,10,2,0,100,0,0,1,0,0,33,30086,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sigrid Iceborn - Between 0-1% Health - Quest Credit ''"),
(@ENTRY,0,10,11,61,0,100,0,0,1,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - Between 0-1% Health - Set Faction 0"),
(@ENTRY,0,11,12,61,0,100,0,0,1,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - Between 0-1% Health - Say Line 1"),
(@ENTRY,0,12,0,61,0,100,0,0,1,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - Between 0-1% Health - Evade"),
(@ENTRY,0,13,14,25,0,100,0,500,1000,600000,600000,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - On Reset - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,14,0,61,0,100,0,500,1000,600000,600000,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sigrid Iceborn - On Reset - Set Faction 190");


-- Onu'zun SAI
SET @ENTRY := 30180;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,18100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - Out of Combat - Cast 'Frost Armor'"),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,15242,64,0,0,0,0,2,0,0,0,0,0,0,0,"Onu'zun - Combat CMC - Cast 'Fireball'"),
(@ENTRY,0,2,0,0,0,100,0,5000,5000,14500,17800,11,15244,0,0,0,0,0,2,0,0,0,0,0,0,0,"Onu'zun - Combat - Cast 'Cone of Cold'"),
(@ENTRY,0,3,0,13,0,100,0,12000,18000,0,0,11,15122,0,0,0,0,0,6,1,0,0,0,0,0,0,"Onu'zun - Target Casting - Cast 'Counterspell'"),
(@ENTRY,0,4,5,62,0,100,0,9878,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Onu'zun - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - On Gossip Option 0 Selected - Set Invincibility Hp 1"),
(@ENTRY,0,6,7,61,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - On Gossip Option 0 Selected - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,7,8,61,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - On Gossip Option 0 Selected - Set Faction 14"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - On Gossip Option 0 Selected - Say Line 0"),
(@ENTRY,0,9,10,2,0,100,0,0,1,0,0,33,30180,0,0,0,0,0,7,0,0,0,0,0,0,0,"Onu'zun - Between 0-1% Health - Quest Credit 'Eliminate the Competition'"),
(@ENTRY,0,10,11,61,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - Between 0-1% Health - Set Faction 0"),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - Between 0-1% Health - Evade"),
(@ENTRY,0,12,13,25,0,100,0,500,1000,600000,600000,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - On Reset - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,13,0,61,0,100,0,500,1000,600000,600000,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onu'zun - On Reset - Set Faction 190");


-- Efrem the Faithful SAI
SET @ENTRY := 30081;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,17232,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - Out of Combat - Cast 'Devotion Aura' (Phase 1) (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,17233,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - Between 0-50% Health - Cast 'Lay on Hands' (Phase 1) (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,3300,5500,16000,17600,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,"Efrem the Faithful - In Combat - Cast 'Crusader Strike' (Phase 1) (No Repeat)"),
(@ENTRY,0,3,0,0,0,80,0,9900,9900,21000,32000,11,13005,0,0,0,0,0,2,0,0,0,0,0,0,0,"Efrem the Faithful - In Combat - Cast 'Hammer of Justice' (Phase 1) (No Repeat)"),
(@ENTRY,0,4,5,62,0,100,0,9869,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Efrem the Faithful - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - On Gossip Option 0 Selected - Set Invincibility Hp 1"),
(@ENTRY,0,6,7,61,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - On Gossip Option 0 Selected - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,7,8,61,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - On Gossip Option 0 Selected - Set Faction 14"),
(@ENTRY,0,8,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - On Gossip Option 0 Selected - Say Line 0"),
(@ENTRY,0,9,10,2,0,100,0,0,1,0,0,33,30081,0,0,0,0,0,7,0,0,0,0,0,0,0,"Efrem the Faithful - Between 0-1% Health - Quest Credit 'Eliminate the Competition'"),
(@ENTRY,0,10,11,61,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - Between 0-1% Health - Set Faction 0"),
(@ENTRY,0,11,0,61,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - Between 0-1% Health - Evade"),
(@ENTRY,0,12,13,25,0,100,0,500,1000,600000,600000,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - On Reset - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,13,0,61,0,100,0,500,1000,600000,600000,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Efrem the Faithful - On Reset - Set Faction 190");


-- Tinky Wickwhistle SAI
SET @ENTRY := 30162;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,15600,17800,11,61552,0,0,0,0,0,2,0,0,0,0,0,0,0,"Tinky Wickwhistle - In Combat - Cast 'Wrench Strike' (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,13000,14000,21300,23400,11,37666,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - In Combat - Cast 'Heavy Dynamite' (No Repeat)"),
(@ENTRY,0,2,3,62,0,100,0,9875,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Tinky Wickwhistle - On Gossip Option 0 Selected - Close Gossip"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - On Gossip Option 0 Selected - Set Invincibility Hp 1"),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - On Gossip Option 0 Selected - Remove Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,5,6,61,0,100,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - On Gossip Option 0 Selected - Set Faction 14"),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - On Gossip Option 0 Selected - Say Line 0"),
(@ENTRY,0,7,8,2,0,100,0,0,1,0,0,33,30162,0,0,0,0,0,7,0,0,0,0,0,0,0,"Tinky Wickwhistle - Between 0-1% Health - Quest Credit 'Eliminate the Competition'"),
(@ENTRY,0,8,9,61,0,100,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - Between 0-1% Health - Set Faction 0"),
(@ENTRY,0,9,10,61,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - Between 0-1% Health - Say Line 1"),
(@ENTRY,0,10,0,61,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - Between 0-1% Health - Evade"),
(@ENTRY,0,11,12,25,0,100,0,500,1000,600000,600000,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - On Reset - Set Flags Immune To Players & Immune To NPC's"),
(@ENTRY,0,12,0,61,0,100,0,500,1000,600000,600000,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,"Tinky Wickwhistle - On Reset - Set Faction 190");
