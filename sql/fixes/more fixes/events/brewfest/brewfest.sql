

-- Coren Direbrew.

-- UPDATE quest_template SET PrevQuestId=0 WHERE id IN(12020, 12192);


-- Spawn Coren Direbrew
-- Brewfest Reveler spawn time
DELETE FROM `creature` WHERE id=23872;
DELETE FROM `creature` WHERE id=23795;

INSERT INTO `creature` VALUES (371998, 23795, 230, 0, 0, 1, 1, 0, 1, 895.613, -130.291, -49.7454, 2.87667, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (371994, 23795, 230, 0, 0, 1, 1, 0, 1, 894.708, -131.88, -49.7476, 2.45338, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (371996, 23795, 230, 0, 0, 1, 1, 0, 1, 893.395, -133.003, -49.7476, 2.52542, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (209183, 23872, 230, 0, 0, 1, 1, 0, 0, 891.995, -129.873, -49.7446, 5.06931, 900, 0, 0, 302400, 0, 0, 0, 0, 0, 0);




-- Script names
UPDATE `creature_template` SET `ScriptName` = 'npc_coren_direbrew', `flags_extra` = 0, `damagemodifier` = 20, `lootid` = 23872 WHERE `entry` = 23872;
UPDATE `creature_template` SET `ScriptName` = 'npc_brewmaiden' WHERE `entry` IN (26822,26764);
UPDATE `creature_template` SET `faction` = 736 WHERE `entry` = 26776;

UPDATE `creature_template` SET `faction`=735,`npcflag`=1 WHERE `entry`=23872 LIMIT 1;



-- Keg-Shaped Treasure chest loot

-- Frost emblems removal, put valor.
UPDATE item_loot_template SET item=40753 WHERE entry=54535 AND item=49426;

-- Delete the 226 Tank o terror, due the current content progression.

DELETE FROM item_loot_template WHERE entry=54535 AND item=48663;


-- Insert the brewfest tokens.
DELETE FROM item_loot_template WHERE entry=54535 AND item=37829;
INSERT INTO `item_loot_template` VALUES (54535, 37829, 0, 100, 0, 1, 0, 10, 15, NULL);



-- Dark Iron Event.

-- Make the Dark Iron Mole Machine Wreckage give the quests
 DELETE FROM `gameobject_queststarter` WHERE `id` IN (189990,189989);
 INSERT INTO `gameobject_queststarter` (`id`,`quest`) VALUES
 (189990,12192), -- Horde
 (189989,12020); -- Alliance

DELETE FROM `gameobject` WHERE `id`=186881; -- Dark Iron Sabotage Plans were used for the event in 2007
DELETE FROM `game_event_gameobject` WHERE `guid` IN (11140,18015); -- Dark Iron Sabotage Plans
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|256 WHERE `entry`=23706; -- Gordok Festive Keg
UPDATE `creature_model_info` SET `boundingradius`=0.9,`combatreach`=1.8,`gender`=2 WHERE `displayid`=24860; -- Gordok Festive Keg
UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`=NULL WHERE `entry` IN (23702,23700,23706,24373,24372); -- Festive Kegs

-- Brewfest - Attack Keg can only target kegs
DELETE FROM `conditions` WHERE `SourceEntry` IN (42393) AND `ConditionValue2` IN (23702,23700,23706,24373,24372);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,42393,0,18,1,23702,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Thunderbrew Festive Keg"),
(13,0,42393,0,18,1,23700,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Barleybrew Festive Keg"),
(13,0,42393,0,18,1,23706,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Gordok Festive Keg"),
(13,0,42393,0,18,1,24373,0,0,'',"Spell Brewfest - Attack Keg can only be cast at T'chalis's Festive Keg"),
(13,0,42393,0,18,1,24372,0,0,'',"Spell Brewfest - Attack Keg can only be cast at Drohn's Festive Keg");




/*********************GENERATOR**************************/


-- Fix the equipment templates of the brewers
DELETE FROM `creature_equip_template` WHERE `creatureid`=2478;
INSERT INTO `creature_equip_template` (`creatureid`,`itemid1`,`itemid2`,`itemid3`) VALUES
(2478,33161,33161,0);

-- Update the templates for the Brewmaidens (the golden mugs)
-- UPDATE `creature_template` SET `equipment_id`=2478 WHERE `entry` IN (23684,23683,23685,24493,24492);




-- Add aura 'Brewfest - Dark Iron Attack - Keg Marker' to Thunderbrew/Barleybrew/Gordok/T'chalis's/Drohn's Festive Keg
DELETE FROM `creature_template_addon` WHERE `entry` IN (23702,23700,23706,24373,24372);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(23702,0,0,0,0,'42761'),(23700,0,0,0,0,'42761'),(23706,0,0,0,0,'42761'),
(24373,0,0,0,0,'42761'),(24372,0,0,0,0,'42761');

-- Brewfest Chick Chucks Mug should also add an Complimentary Brewfest Sampler
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=42535 AND `spell_effect`=42518;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(42535,42518,1,'Brewfest Chick Chucks Mug should also add an Complimentary Brewfest Sampler');

-- Add Dark Iron Guzzler's equipment template (taken from sniff)
DELETE FROM `creature_equip_template` WHERE `creatureid`=2477;
INSERT INTO `creature_equip_template` (`creatureid`,`itemid1`,`itemid2`,`itemid3`) VALUES
(2477,33125,0,0);

-- Add aura 'Holiday - Brewfest - Dark Iron Knockback Target Test' to Dark Iron Guzzler
DELETE FROM `creature_template_addon` WHERE `entry`=23709;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(23709,0,0,0,0,'42676');

-- Drunken Master & Dark Iron Retreat
DELETE FROM `conditions` WHERE `SourceEntry` IN (42695,42794,42341) AND `ConditionValue2` IN (23709);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,42695,0,18,1,23709,0,0,'',"Spell Holiday - Brewfest - Dark Iron Knock-down Power-up can only be cast at Dark Iron Guzzler"),
(13,0,42794,0,18,1,23709,0,0,'',"Spell Holiday - Brewfest - Random Mug Fling can only be cast at Dark Iron Guzzler"),
(13,0,42341,0,18,1,23709,0,0,'',"Spell Dark Iron Retreat can only be cast at Dark Iron Guzzler");


DELETE FROM `gameobject_template` WHERE `entry` IN (202401,186462);
INSERT INTO `gameobject_template` VALUES (202401, 1, 7510, 'Dark Iron Mole Machine', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);
INSERT INTO `gameobject_template` VALUES (186462, 1, 7510, 'Dark Iron Mole Machine', '', '', '', 0, 0, 0.6, 0, 0, 0, 0, 0, 0, 1, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1);





-- SET @ENTRY := 24536;
-- SET @SPELL_PLANS_H := 49318;

-- Text

-- Dark Iron Guzzler
-- We are setting AIName because some people applied the SAI for this NPC
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_dark_iron_guzzler',`unit_flags`=33024 WHERE `entry`=23709;
-- Text
DELETE FROM `creature_text` WHERE `entry`=23709;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(23709,0,0,"Did someone say 'Free Brew'?",12,0,20,0,0,0,"Dark Iron Guzzler"),
(23709,0,1,"DRINK! BRAWL! DRINK! BRAWL!",12,0,100,0,0,0,"Dark Iron Guzzler"),
(23709,0,2,"Drink it all boys!",12,0,50,0,0,0,"Dark Iron Guzzler"),
(23709,0,3,"It's not a party without some crashers!",12,0,30,0,0,0,"Dark Iron Guzzler");

-- Festive Keg SAI (creatures)
-- The unit_flags are taken from sniffs - we are setting react state passive so it won't EVER fight back
SET @ENTRY1 := 23702; -- Thunderbrew Festive Keg
SET @ENTRY2 := 23700; -- Barleybrew Festive Keg
SET @ENTRY3 := 23706; -- Gordok Festive Keg
SET @ENTRY4 := 24373; -- T'chalis's Festive Keg
SET @ENTRY5 := 24372; -- Drohn's Festive Keg
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=`unit_flags`|256,`RegenHealth`=0 WHERE `entry` IN (@ENTRY1,@ENTRY2,@ENTRY3,@ENTRY4,@ENTRY5);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY1,@ENTRY2,@ENTRY3,@ENTRY4,@ENTRY5);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Thunderbrew Festive Keg
(@ENTRY1,0,0,0,1,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunderbrew Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY1,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,20,186184,0,0,0,0,0,0,"Thunderbrew Festive Keg - On Death - Set Data Thunderbrew Festive Keg (OBJECT)"),
(@ENTRY1,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thunderbrew Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY1,0,3,0,6,0,100,0,0,0,0,0,45,10,10,0,0,0,0,11,23709,3,0,0,0,0,0,"Thunderbrew Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- Barleybrew Festive Keg
(@ENTRY2,0,0,0,1,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Barleybrew Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY2,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,20,186189,0,0,0,0,0,0,"Barleybrew Festive Keg - On Death - Set Data Barleybrew Festive Keg (OBJECT)"),
(@ENTRY2,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Barleybrew Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY2,0,3,0,6,0,100,0,0,0,0,0,45,11,11,0,0,0,0,11,23709,3,0,0,0,0,0,"Barleybrew Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- Gordok Festive Keg
(@ENTRY3,0,0,0,1,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY3,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,20,186185,0,0,0,0,0,0,"Gordok Festive Keg - On Death - Set Data Gordok Festive Keg (OBJECT)"),
(@ENTRY3,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY3,0,3,0,6,0,100,0,0,0,0,0,45,12,12,0,0,0,0,11,23709,3,0,0,0,0,0,"Gordok Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- T'chalis's Festive Keg
(@ENTRY4,0,0,0,1,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chalis's Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY4,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,20,186187,0,0,0,0,0,0,"T'chalis's Festive Keg - On Death - Set Data T'chalis's Festive Keg (OBJECT)"),
(@ENTRY4,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chalis's Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY4,0,3,0,6,0,100,0,0,0,0,0,45,10,10,0,0,0,0,11,23709,3,0,0,0,0,0,"T'chalis's Festive Keg - On Death - Set Data Dark Iron Guzzler"),
-- Drohn's Festive Keg
(@ENTRY5,0,0,0,1,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Festive Keg - Out of Combat - Set React State Passive"),
(@ENTRY5,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,20,186186,0,0,0,0,0,0,"Drohn's Festive Keg - On Death - Set Data Drohn's Festive Keg (OBJECT)"),
(@ENTRY5,0,2,0,38,0,100,0,5,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Festive Keg - On Data Set - Forced Despawn"),
(@ENTRY5,0,3,0,6,0,100,0,0,0,0,0,45,10,10,0,0,0,0,11,23709,3,0,0,0,0,0,"Drohn's Festive Keg - On Death - Set Data Dark Iron Guzzler");




-- Brewfest Reveler SAI
SET @ENTRY := 24484;
SET @SPELL_THROW_MUG := 50696;
SET @SPELL_CREATE_MUG := 42518;
SET @SPELL_TOAST := 41586;
UPDATE `creature_template` SET `AIName`='',`ScriptName`='npc_brewfest_reveler' WHERE `entry`=@ENTRY;

-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Dark Iron dwarves!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,1,"Run! It's the Dark Iron dwarves!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,2,"They're after the beer!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,3,"Someone has to save the beer!",12,0,100,0,0,0,"Brewfest Reveler"),
(@ENTRY,0,4,"If you value your beer, run for it!",12,0,100,0,0,0,"Brewfest Reveler");




-- Gordok Brew Barker SAI
SET @ENTRY := 23685;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-88864,-88955,@ENTRY);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Dun Morogh version
(-88864,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gordok Brew Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(-88864,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 0 (random)"),
(-88864,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 1"),
(-88864,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Say Line 2 (random) (P1)"),
(-88864,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 1 (P1)"),
(-88864,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5149.791992,-590.198792,397.323730,4.39,"Gordok Brew Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(-88864,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 0"), -- Event is over, so set phase 0

-- Durotar version
(-88955,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gordok Brew Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(-88955,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 0 (random)"),
(-88955,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 1"),
(-88955,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Say Line 2 (random) (P1)"),
(-88955,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - Out of Combat - Yell Line 1 (P1)"),
(-88955,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,1216.599976,-4284.270020,21.290300,3.787360,"Gordok Brew Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(-88955,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gordok Brew Barker - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
-- DELETE FROM `script_texts` WHERE `entry` BETWEEN -717 AND -719; -- Old entries used in EAI
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"YOU TRY DA' BEST, NOW TRY DA' REST! OGRE BREW!",14,0,100,0,0,0,"Gordok Brew Barker"),
(@ENTRY,0,1,"HEY YOU! DRINK OGRE BREWS! MAKE YOU BIG AND STRONG!",14,0,100,0,0,0,"Gordok Brew Barker"),
(@ENTRY,0,2,"YOU WANT DRINK? WE GOT DRINK!",14,0,100,0,0,0,"Gordok Brew Barker"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Gordok Brew Barker");

-- Maeve Barleybrew SAI
SET @ENTRY := 23683;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Maeve Barleybrew - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Maeve Barleybrew - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Maeve Barleybrew - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5161.600586,-611.307861,397.917419,2.39,"Maeve Barleybrew - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Maeve Barleybrew - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Come try our Barleybrew Dark!",12,0,100,0,0,0,"Maeve Barleybrew"),
(@ENTRY,0,1,"Barleybrew, finest brewery in Azeroth!",12,0,100,0,0,0,"Maeve Barleybrew"),
(@ENTRY,0,2,"The Barleybrews have always been leaders in brewery innovation. Check out our newest creation, Barleybrew Clear!",12,0,100,0,0,0,"Maeve Barleybrew"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Maeve Barleybrew"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"Maeve Barleybrew"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"Maeve Barleybrew");

-- Ita Thunderbrew SAI
SET @ENTRY := 23684;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Ita Thunderbrew - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Ita Thunderbrew - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Ita Thunderbrew - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,-5149.791992,-590.198792,397.323730,4.39,"Ita Thunderbrew - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Ita Thunderbrew - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Thunderbrew, finest brewery in all the realms.",12,0,100,0,0,0,"Ita Thunderbrew"),
(@ENTRY,0,1,"THUNDER! THUNDER! THUNDER! THUNDERBREW, HO!",12,0,100,0,0,0,"Ita Thunderbrew"),
(@ENTRY,0,2,"You look like you could use a cold one. Thunderbrew's got ya covered!",12,0,100,0,0,0,"Ita Thunderbrew"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Ita Thunderbrew"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"Ita Thunderbrew"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"Ita Thunderbrew");

-- Drohn's Distillery Barker SAI
SET @ENTRY := 24492;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Distillery Barker - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,3,3,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Distillery Barker - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,1191.014404,-4299.663574,21.381546,4.39,"Drohn's Distillery Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drohn's Distillery Barker - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Drohn's brew is the stuff legends are made of! Come taste the legend!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,1,"We drink for the Horde! Do you drink for the Horde? Come show us at Drohn's Distillery!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,2,"Hey you, the tall one... Want to put some hair on your chest? Drohn's Distillery can help you out!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,0,3,"Hey you! T'chali's Voodoo Brewers have got a brew that won't kill you! But they've also got a brew that might...",12,0,100,0,0,0,"Drohn's Distillery Barker"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"Drohn's Distillery Barker"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"Drohn's Distillery Barker"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"Drohn's Distillery Barker");

-- T'chali's Voodoo Brewery Barker SAI
SET @ENTRY := 24493;
SET @SPELL_DRINK := 42518;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,22,0,100,0,101,5000,5000,0,11,@SPELL_DRINK,2,0,0,0,0,7,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Emote Receive 'Wave' - Cast Create Complimentary Brewfest Sampler"),
(@ENTRY,0,1,0,1,0,100,0,30000,45000,180000,240000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Out of Combat - Yell Line 0 (random)"),

(@ENTRY,0,2,0,38,0,100,0,3,3,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - On Data Set - Set Phase 1"),
(@ENTRY,0,3,0,1,1,100,0,10000,35000,45000,50000,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Out of Combat - Say Line 2 (random) (P1)"),
(@ENTRY,0,4,0,1,1,100,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - Out of Combat - Yell Line 1 (P1)"),
(@ENTRY,0,5,0,52,1,100,0,1,@ENTRY,0,0,50,186471,15000,0,0,0,0,8,0,0,0,1190.705688,-4285.604004,21.193674,4.39,"T'chali's Voodoo Brewery Barker - On Text Over - Summon Super Brew Stein Trap (P1)"),
(@ENTRY,0,6,0,38,0,100,0,4,4,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"T'chali's Voodoo Brewery Barker - On Data Set - Set Phase 0"); -- Event is over, so set phase 0
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"If you wanna live life to the fullest, you gotta try T'chali's Voodoo Brew!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,1,"T'chali's Voodoo Brews helps keep the party going! Check out the party at Brewfest!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,2,"Hey you! T'chali's Voodoo Brewers have got a brew that won't kill you! But they've also got a brew that might...",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,0,3,"T'chali's Voodoo Brewery has the best brew you can find! They were voted 'Best Brew' by the Goblin Brew Weekly!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),

(@ENTRY,1,0,"SOMEONE TRY THIS SUPER BREW!",14,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),

(@ENTRY,2,0,"Chug and chuck! Chug and chuck!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker"),
(@ENTRY,2,1,"Down the free brew and pelt the Guzzlers with your mug!",12,0,100,0,0,0,"T'chali's Voodoo Brewery Barker");

-- Drunken Brewfest Reveler SAI
SET @ENTRY := 23698;
SET @SPELL_VOMIT := 67468;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-88896,-88960);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Alliance
(-88896,0,0,0,1,0,100,0,10000,45000,180000,240000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Say Line 0 (random)"),
(-88896,0,1,0,1,0,100,0,10000,45000,180000,240000,11,@SPELL_VOMIT,2,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Cast Drunken Vomit"),
-- Horde
(-88960,0,0,0,1,0,100,0,10000,45000,180000,240000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Say Line 1 (random)"),
(-88960,0,1,0,1,0,100,0,10000,45000,180000,240000,11,@SPELL_VOMIT,2,0,0,0,0,1,0,0,0,0,0,0,0,"Drunken Brewfest Reveler - Out of Combat - Cast Drunken Vomit");
-- Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
-- Alliance
(@ENTRY,0,0,"Uh oh...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,1,"Good times! <hic>",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,2,"What's all the fuss about here?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,3,"The besht part about drinking is pretending to be drunk... I'm jusht pretending guys.",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,4,"Hey fellas! How's it going?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,5,"Hey! Anyone shee that cute blond dwarf? I shwear they were jusht here...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,0,6,"Hey! Lishten up! I've got... I have something important to talk about! Shee... Wait... What wash I shaying? Something aboutsh boats and floating... Yeah! Sho don't float on a boat... Thank you...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
-- Horde
(@ENTRY,1,0,"Uh oh...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,1,"Good times! <hic>",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,2,"What's all the fuss about here?",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,3,"The besht part about drinking is pretending to be drunk... I'm jusht pretending guys.",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,4,"You guys have gotta try thish...",12,0,100,0,0,0,"Drunken Brewfest Reveler"),
(@ENTRY,1,5,"Hey! You for the Horde? <hic> I'm for the Horde!",12,0,100,0,0,0,"Drunken Brewfest Reveler");


-- Misc.
UPDATE `creature_template_addon` SET `auras`='43905' WHERE `entry`=23698; -- Drunken Brewfest Reveler
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=23698; -- Drunken Brewfest Reveler
UPDATE `creature` SET `spawntimesecs`=300 WHERE `id`=24484; -- Brewfest Reveler had 12 hour respawntime ...



-- Mole Machine spawner.

INSERT INTO `creature_template` VALUES (198722, 0, 0, 0, 0, 0, 169, 11686, 0, 0, 'Dark Iron Event - Spawner', '', '', 0, 80, 80, 2, 14, 0, 1, 1.14286, 1, 1, 0, 2000, 2000, 1, 1, 1, 33554432, 2048, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 7.5, 1, 0, 0, 1, 0, 128, 'npc_dark_iron_mole_spawner', 12340);

UPDATE creature_template SET AIName="", ScriptName="npc_dark_iron_event_generator" WHERE entry=23703;
UPDATE creature_template SET modelid2= 16925, unit_flags=33587200, flags_extra=130 where entry IN(23703, 24536);



-- Text for Dark Iron Herald.

SET @ENTRY := 24536;

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"No one expects the Dark Iron dwarves!",14,0,100,0,0,11832,"Dark Iron Herald"),

(@ENTRY,1,1,"We'll drink yer stout and lager,$BDrain all the pints and kegs!$BWe'll drink and brawl and brawl and drink,$B'til we can't feel our legs!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,2,"So lift a mug to Coren,$BAnd Hurley Blackbreath too!$BThis drink is weak, without much kick,$BBut oi! At least it's brew!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,3,"And when the brew's all missin'$BTa Shadowforge we'll hop,$BA bitter toast ta Ragnaros...$B... but bring him not a drop!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,4,"Oh, we're from Blackrock Mountain,$BWe've come ta drink yer brew!$BDark Iron dwarves, they do not lie,$BAnd so yeh know it's true!",12,0,100,0,0,0,"Dark Iron Herald"),
(@ENTRY,1,5,"Yeh will not try our bitter,$BYeh will not serve our ale!$BBut have Brewfest without our lot?$BJust try it, and ye'll fail!",12,0,100,0,0,0,"Dark Iron Herald"),

(@ENTRY,2,6,"RETREAT! We've taken a beating and had alot casualties! We can't keep taking these losses! FALL BACK!!",14,0,100,0,0,0,"Dark Iron Herald"), -- Alliance
(@ENTRY,3,7,"We did it boys! Now back to the Grim Guzzler and we'll drink to the few that were injured!!",14,0,100,0,0,0,"Dark Iron Herald"); -- Horde



-- Brewfest controller

INSERT INTO `creature_template` VALUES (225161, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Brewfest controller', '', NULL, 0, 60, 60, 0, 114, 0, 1, 0.99206, 1, 0, 0, 2000, 2000, 1, 1, 1, 33555200, 2048, 0, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 7.5, 1, 0, 0, 1, 0, 0, 'npc_brewfest_music_controller', 12340);


-- SPAWN

INSERT INTO `creature` VALUES (372244, 225161, 1, 0, 0, 1, 1, 0, 0, 1285.18, -4413.92, 33.427, 1.90412, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (372230, 225161, 0, 0, 0, 1, 1, 0, 0, -5197.24, -486.574, 394.286, 3.22255, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);


UPDATE creature_template SET modelid1=825, modelid2=16925 WHERE entry=24536;


-- Mekkatorque

UPDATE creature_template SET faction=775, scriptname="npc_brewmaster_mekkatorque" WHERE entry=39271;
UPDATE creature_template SET vehicleId=349 WHERE entry=40057;

DELETE FROM creature_template_addon WHERE entry=39271;

-- Texts

SET @ENTRY := 39271;

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"It's good seeing so many of you here to celebrate this time honored festivity. A celebration of this magnitude is long overdue.",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,1,0,"When King Magni approached me about these festivities I was excited. I began explaining how with a little help from the gnomes, we could really make this a blast to remember. Sadly, King Magni wanted to keep it simple. He wanted to honor the past.",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,2,0,"I can understand that. But the King did allow for a change, letting a gnome tap the keg. So I got a chance to work on a new type of problem; How to efficiently and quickly open the keg and distribute its contents such that all participants will receive equal parts quickly and efficiently.",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,3,0,"So I had my top men and women start working on a machine to do this exact task! We've calculated down to the second how best to dist-",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,4,0,"Wait... uh... I guess the Keg Tapper 74205 will have to wait... but that's okay, I've got some designs for the Keg Tapper 75633...",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,5,0,"Right, right... So let's start the countdown from ten, ready? TEN",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,6,0,"Oh... okay, I'll just wait for zero then...",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,7,0,"The keg is tapped! Now I would like to propose a toast. Don't worry, I'll keep it short and sweet.",14,0,100,0,0,0,"Mekkatorque - 1"),
(@ENTRY,8,0,"Drink and be merry!",14,0,100,0,0,0,"Mekkatorque - 1")
;

SET @ENTRY := 23683;

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Just tap the keg already!",14,0,100,0,0,0,"Maeve"),
(@ENTRY,1,0,"BOOORING!!",14,0,100,0,0,0,"Maeve")
;
-- Just tap the keg already! 0 para Maeve Barleybrew

-- 1 BOOORING!!

-- TODOS FIVE!


-- Brewfest Crowd

SET @ENTRY := 23488;
UPDATE creature_template SET modelid1=16925, modelid2=16925 WHERE entry=@ENTRY;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"FIVE!",14,0,100,0,0,0,"Brewfest Crowd"),
(@ENTRY,1,0,"FOUR!",14,0,100,0,0,0,"Brewfest Crowd"),
(@ENTRY,2,0,"THREE!",14,0,100,0,0,0,"Brewfest Crowd"),
(@ENTRY,3,0,"TWO!",14,0,100,0,0,0,"Brewfest Crowd"),
(@ENTRY,4,0,"ONE!",14,0,100,0,0,0,"Brewfest Crowd")
;


-- Vol'Jin 


SET @ENTRY := 31649;

UPDATE creature_template SET scriptname="npc_brewmaster_voljin" WHERE entry=@ENTRY;


DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"We will learn who the greatest brewmaster is. We know the breweries are up for the challenge. We would not have invited them otherwise.",14,0,100,0,0,0,"Vol'Jin - 1"),
(@ENTRY,1,0,"So now, let us celebrate with our fine warrior brothers!",14,0,100,0,0,0,"Vol'Jin"),
(@ENTRY,2,0,"Let us count from five. Then old Vol'jin will tap this keg and we can all decide who is the greatest of brewmasters.",14,0,100,0,0,0,"Vol'Jin"),
(@ENTRY,3,0,"The keg has been tapped! The battle begins! Now raise your glasses with me, as I toast our combatants...",14,0,100,0,0,0,"Vol'Jin"),
(@ENTRY,4,0,"Brew for the horde! Drink for the horde!",14,0,100,0,0,0,"Vol'Jin")
;



-- Drohn's Distillery Barker yells: Today is a good day to drink!

SET @ENTRY := 24492;

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Today is a good day to drink!",14,0,100,0,0,0,"Drohn - 1")
;



-- Make the quest There and back again (keg one) daily.

UPDATE quest_template SET flags=4096 WHERE id in(11122, 11412);