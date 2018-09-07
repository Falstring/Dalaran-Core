-- Correct the aura to the Converted Heroes.
DELETE FROM creature_template_addon WHERE entry=32255;
INSERT INTO creature_template_addon (entry, auras) VALUES (32255,45631);



-- Trolls from Grizzly Hills experience removal.

UPDATE creature_template SET ExperienceModifier=0 WHERE entry IN(26570, 26458, 26583, 26582);




-- Fix eternal chasing minions:

-- Voidwalker minion from Tanaris.
UPDATE `creature_template` SET `ainame`='GuardAI' WHERE `entry`=8996;





-- Thrallmar's gryph master should talk in orcish.

UPDATE creature_text SET language=1 WHERE entry=16587;



-- Grunt Kor'ja for the Garments of Spiritualy quest.

UPDATE creature_template SET faction=85 WHERE entry=12430;




DELETE FROM creature_template WHERE entry IN (12429,12423,12427,12430,12428, 17551);

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12423, 0, 0, 0, 0, 0, 3258, 0, 0, 0, 'Guard Roberts', NULL, NULL, 0, 7, 7, 0, 11, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 0, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 'npc_garments_of_quests', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12427, 0, 0, 0, 0, 0, 12474, 0, 0, 0, 'Mountaineer Dolf', NULL, NULL, 0, 7, 7, 0, 55, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 4104, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12428, 0, 0, 0, 0, 0, 12475, 0, 0, 0, 'Deathguard Kel', NULL, NULL, 0, 7, 7, 0, 71, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 36872, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12429, 0, 0, 0, 0, 0, 12476, 0, 0, 0, 'Sentinel Shaya', NULL, NULL, 0, 7, 7, 0, 80, 0, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 4104, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (12430, 0, 0, 0, 0, 0, 12477, 0, 0, 0, 'Grunt Kor\'ja', NULL, NULL, 0, 7, 7, 0, 85, 0, 0.92, 1.14286, 1, 0, 0, 2000, 2134, 1, 4096, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 'npc_garments_of_quests', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (17551, 0, 0, 0, 0, 0, 17082, 0, 0, 0, 'Tavara', '', NULL, 0, 5, 5, 0, 1647, 0, 1.5, 1.14286, 1, 0, 0, 2000, 0, 1, 4096, 2048, 8, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 1, 3, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, '', 12340);

UPDATE creature_template SET scriptname="npc_garments_of_quests" WHERE entry=17551;




-- TEMPORAL HERE, ITS FROM ULDUAR:

-- IMPORTANT: Harpoon fix. Razorscale Controller faction in order it to work properly, Harpoons activables by the players.

UPDATE creature_template SET faction = 35 WHERE entry = 33233;




-- Stable Master Xon'cha has wrong npcflag

UPDATE `creature_template` SET `npcflag`=`npcflag`|1|4194304 WHERE `entry`= 9988;


-- Western Plagueland - mobs do not evade and attacks player corpse
UPDATE `smart_scripts` SET `action_param1`=12787, `target_type`=1 WHERE `action_param1`=3391 AND `action_type`=11 AND `source_type`=0;


-- Comet's Trial wrong internal cooldown.

UPDATE `spell_proc_event` SET `Cooldown`='45' WHERE `entry`='64786';


-- Invisible Stalker Grizzly Hills

UPDATE `creature` SET `modelid`=0 WHERE `id`=27452;

-- Dr. Whitherlimb (22062)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(22062));
DELETE FROM creature WHERE id IN(22062);
INSERT INTO `creature` VALUES (1528, 22062, 530, 0, 0, 1, 1, 0, 0, 7188.17, -6417.2, 59.1657, 3.23113, 28800, 5, 0, 626, 0, 1, 0, 0, 0, 0);



-- [Generic] Argent Pony Bridle
UPDATE creature_template SET npcflag=1+128, ScriptName='npc_pet_gen_argent_pony_bridle' WHERE entry IN(33238, 33239);

-- Rocket Chicken (34492)
REPLACE INTO creature_template_addon VALUES(25109, 0, 0, 0, 0, 0, '45202');
DELETE FROM spell_script_names WHERE spell_id=45202;
INSERT INTO spell_script_names VALUES(45202, "spell_item_rocket_chicken");

-- Remove root flags.
UPDATE `creature_template` SET `InhabitType`=`InhabitType` &~ 8 WHERE `entry` IN (1921, 2674, 5674, 8035, 16236, 16400, 16897, 20251, 20561, 21322, 21413, 14697, 18679, 18695, 23076, 23077, 23876, 23996, 24210, 25284, 25534, 27064, 27430, 27894, 28156, 28366, 29475, 29483, 29613, 29747, 29790, 30236, 30475, 31103, 31280, 31424, 32347, 32795, 32938, 33174, 33184, 33229, 33243, 33272, 33342, 34047, 34050, 34068, 34071, 34096, 34110, 34121, 34149, 34362, 34363);

-- Wind Rider Cub (49663)
REPLACE INTO creature_template_addon VALUES(36909, 0, 0, 0, 0, 0, '');
UPDATE creature_template SET InhabitType=5, AIName='', ScriptName='npc_pet_gen_wind_rider_cub_gryphon_hatch' WHERE entry=36909;

-- Gryphon Hatchling (36908)
REPLACE INTO creature_template_addon VALUES(36908, 0, 0, 0, 0, 0, '');
UPDATE creature_template SET InhabitType=5, AIName='', ScriptName='npc_pet_gen_wind_rider_cub_gryphon_hatch' WHERE entry=36908;

-- Turkey Cage (44810)
REPLACE INTO creature_text VALUES(32818, 0, 0, '%s senses his destiny!', 16, 0, 100, 0, 0, 0, 0, 0, 'Plump Turkey');
UPDATE creature_template SET AIName='', ScriptName='npc_pet_gen_plump_turkey' WHERE entry=32818;

-- Lil' XT (54847)
REPLACE INTO creature_text VALUES(40703, 0, 0, "I'm ready to play!", 12, 0, 100, 0, 0, 15726, 0, 0,'Lil XT');
REPLACE INTO creature_text VALUES(40703, 1, 0, "So tired... I'll rest for just a moment...", 12, 0, 100, 0, 0, 15725, 0, 0, 'Lil XT');
REPLACE INTO creature_text VALUES(40703, 2, 0, "I guess it doesn't bend that way!", 12, 0, 100, 0, 0, 15729, 0, 0, 'Lil XT');
REPLACE INTO creature_text VALUES(40703, 2, 1, "I think I broke it...", 12, 0, 100, 0, 0, 15728, 0, 0, 'Lil XT');
REPLACE INTO creature_text VALUES(40703, 3, 0, "New toys? For me?", 12, 0, 100, 0, 0, 15724, 0, 0, 'Lil XT');
REPLACE INTO creature_template_addon VALUES(40703, 0, 0, 0, 0, 0, '76099');
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=40703;
DELETE FROM smart_scripts WHERE entryorguid=40703 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=40703*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (40703, 0, 0, 1, 25, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Talk');
INSERT INTO smart_scripts VALUES (40703, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Set Phase');
INSERT INTO smart_scripts VALUES (40703, 0, 2, 3, 60, 1, 100, 0, 35000, 45000, 120000, 120000, 11, 76116, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell Sleep');
INSERT INTO smart_scripts VALUES (40703, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 'On Update - Talk');
INSERT INTO smart_scripts VALUES (40703, 0, 4, 0, 60, 1, 100, 0, 100000, 105000, 120000, 120000, 11, 76114, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Cast Spell Dance');
INSERT INTO smart_scripts VALUES (40703, 0, 5, 0, 60, 0, 100, 0, 5000, 5000, 30000, 30000, 80, 40703*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Update - Script9');

INSERT INTO smart_scripts VALUES (40703*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Phase');
INSERT INTO smart_scripts VALUES (40703*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
INSERT INTO smart_scripts VALUES (40703*100, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 97, 10, 10, 1, 0, 0, 0, 20, 193963, 15, 0, 0, 0, 0, 0, 'Script9 - Jump To Target');
INSERT INTO smart_scripts VALUES (40703*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 11, 76092, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (40703*100, 9, 4, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Set Phase');
INSERT INTO smart_scripts VALUES (40703*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 29, 1, 1.57, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Follow');
INSERT INTO smart_scripts VALUES (40703*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Talk');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=76098;
INSERT INTO conditions VALUES(13, 1, 76098, 0, 0, 31, 0, 3, 32345, 0, 0, 0, 0, "", "Lil' XT find Grindgear Toy Gorilla");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 1, 31, 0, 3, 17299, 0, 0, 0, 0, "", "Lil' XT find Crashin Trashin Robot");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 2, 31, 0, 3, 27664, 0, 0, 0, 0, "", "Lil' XT find Crashin Trashin Racer");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 3, 31, 0, 3, 40281, 0, 0, 0, 0, "", "Lil' XT find Crashin Trashin Racer Blue");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 4, 31, 0, 3, 24968, 0, 0, 0, 0, "", "Lil' XT find Clockwork Rocket Bot");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 5, 31, 0, 3, 40295, 0, 0, 0, 0, "", "Lil' XT find Blue Clockwork Rocket Bot");
INSERT INTO conditions VALUES(13, 1, 76098, 0, 6, 31, 0, 3, 32247, 0, 0, 0, 0, "", "Lil' XT find Zippy Copper Racer");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=76092;
INSERT INTO conditions VALUES(13, 1, 76092, 0, 0, 31, 0, 5, 193963, 0, 0, 0, 0, "", "Lil' XT target Toy Train Set");
DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND sourceEntry=40703;
INSERT INTO conditions VALUES(22, 6, 40703, 0, 0, 30, 1, 193963, 10, 0, 0, 0, 0, "", "Run Action if GO Near");
DELETE FROM spell_script_names WHERE spell_id IN(76098, 76096);
INSERT INTO spell_script_names VALUES(76096, "spell_item_lil_xt");
INSERT INTO spell_script_names VALUES(76098, "spell_item_lil_xt");


-- Lil' Phylactery (49693)
REPLACE INTO creature_template_addon VALUES(36979, 0, 0, 0, 0, 0, '69683');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=69682;
INSERT INTO conditions VALUES(13, 1, 69682, 0, 0, 31, 0, 3, 0, 0, 0, 0, 0, "", "Lil' K.T find target");
DELETE FROM spell_script_names WHERE spell_id IN(69682);
INSERT INTO spell_script_names VALUES(69682, "spell_item_sleepy_willy");
DELETE FROM spell_script_names WHERE spell_id IN(69732);
INSERT INTO spell_script_names VALUES(69732, "spell_item_lil_phylactery");
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=36979;
DELETE FROM smart_scripts WHERE entryorguid=36979 AND source_type=0;
-- Lil' K.T. SAI
SET @ENTRY := 36979;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,60,0,100,1,0,0,0,0,86,69732,2,23,0,0,0,23,0,0,0,0,0,0,0,"On Update - Cross Cast (Never Repeat)"),
(@ENTRY,0,1,0,60,0,100,0,20000,60000,120000,120000,5,402,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Update - Play Emote"),
(@ENTRY,0,2,0,5,0,100,0,0,0,0,0,4,16493,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Kill Unit - Play Sound"),
(@ENTRY,0,3,0,8,0,100,0,69731,0,0,0,4,16493,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Spell Hit - Play Sound");

-- Elwynn Lamb (44974)
REPLACE INTO creature_template_addon VALUES (33200, 0, 0, 0, 0, 0, '62703'); -- Lamb With Periodic Summon Aura
UPDATE creature_template SET unit_flags=2, AIName='SmartAI', flags_extra=2, ScriptName='' WHERE entry=33286;
DELETE FROM smart_scripts WHERE entryorguid=33286 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=33286*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (33286, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 19, 33200, 50, 0, 2, 2, 0, 0, 'On Rest - Move Point');
INSERT INTO smart_scripts VALUES (33286, 0, 1, 0, 34, 0, 100, 0, 8, 1, 0, 0, 80, 33286*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Movement Inform - Script9');
INSERT INTO smart_scripts VALUES (33286, 0, 2, 0, 31, 0, 100, 0, 62701, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Spellhit Target - Kill Unit');
INSERT INTO smart_scripts VALUES (33286*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 33200, 10, 0, 0, 0, 0, 0, 'Script9 - Set Facing');
INSERT INTO smart_scripts VALUES (33286*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 62701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (33286*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 11, 46765, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell');
INSERT INTO smart_scripts VALUES (33286*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 5500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Despawn');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=62701;
INSERT INTO conditions VALUES(13, 1, 62701, 0, 0, 31, 0, 3, 33200, 0, 0, 0, 0, "", "Target Closest Elwynn Lamb");

-- Sleepy Willy (32617)
REPLACE INTO creature_template_addon VALUES(23231, 0, 0, 0, 0, 0, '40619');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND sourceEntry=40638;
INSERT INTO conditions VALUES(13, 1, 40638, 0, 0, 31, 0, 3, 0, 0, 0, 0, 0, "", "Sleepy Willy laser");
DELETE FROM spell_script_names WHERE spell_id=40638;
INSERT INTO spell_script_names VALUES(40638, "spell_item_sleepy_willy");

-- Teldrassil Sproutling (44965)
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=33188;
DELETE FROM smart_scripts WHERE entryorguid=33188 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(33188*100, 33188*100+1) AND source_type=9;
INSERT INTO smart_scripts VALUES (33188, 0, 0, 0, 60, 0, 40, 0, 30000, 30000, 30000, 30000, 87, 33188*100, 33188*100+1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Update - Random Action List');
INSERT INTO smart_scripts VALUES (33188*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 62504, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell Dance');
INSERT INTO smart_scripts VALUES (33188*100, 9, 1, 0, 0, 0, 100, 0, 10000, 25000, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove All Auras');
INSERT INTO smart_scripts VALUES (33188*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 62499, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Spell Sleep');
INSERT INTO smart_scripts VALUES (33188*100+1, 9, 1, 0, 0, 0, 100, 0, 10000, 25000, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Remove All Auras');