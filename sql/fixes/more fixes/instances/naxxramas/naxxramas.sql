-- Naxxramas


-- Frogger

DELETE FROM `smart_scripts` WHERE `entryorguid`=16027 AND `source_type`=0;
DELETE FROM `creature_template_addon` WHERE `entry`=16027;
SET @CGuid := 76311;
DELETE FROM `creature` WHERE `guid` IN (@CGuid, @CGuid+1, @CGuid+2) AND `id`=16027;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN(-@CGuid,-@CGuid-1,-@CGuid-2) AND `source_type`=0;


DELETE FROM creature_template where entry=16027;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (16027, 0, 0, 0, 0, 0, 12349, 0, 0, 0, 'Living Poison', '', NULL, 0, 81, 81, 2, 974, 0, 0.0001, 0.0001, 1, 1, 0, 2500, 0, 1, 33554496, 2048, 8, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 9, 2, 1, 0, 0, 0, 0, 0, 0, 0, 144, 1, 8388624, 0, 'npc_living_poison', 12340);

-- Frogger Manager NPC template
DELETE FROM creature_template where entry=225156;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (225156, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Frogger Manager', '', NULL, 0, 60, 60, 0, 114, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_frogger_manager', 12340);


-- 3 Frogger Manager Spawns
DELETE FROM creature WHERE id=225156;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (261407, 225156, 533, 3, 1, 0, 0, 3175.43, -3134.83, 293.332, 4.04755, 300, 0, 0, 4121, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (262518, 225156, 533, 3, 1, 0, 0, 3154.42, -3125.63, 293.398, 4.25027, 300, 0, 0, 4121, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (262756, 225156, 533, 3, 1, 0, 0, 3128.89, -3120.63, 293.346, 4.8655, 300, 0, 0, 4121, 0, 0, 0, 0, 0);

-- Frogger Despawn Triggers, SPAWN
DELETE FROM creature WHERE id=21987;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (262598, 21987, 533, 3, 1, 0, 0, 3155.73, -3165.62, 293.288, 0.827412, 300, 0, 0, 57, 0, 0, 0, 33554432, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (262539, 21987, 533, 3, 1, 0, 0, 3142.51, -3159.99, 293.324, 1.27972, 300, 0, 0, 57, 0, 0, 0, 33554432, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (262718, 21987, 533, 3, 1, 0, 0, 3129.14, -3157.54, 293.324, 1.55827, 300, 0, 0, 57, 0, 0, 0, 33554432, 0);


-- Faerlina
DELETE FROM creature WHERE id=16505;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (203654, 16505, 533, 2, 1, 0, 1, 3361.95, -3615.36, 260.997, 4.48988, 300, 0, 0, 521320, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (203655, 16505, 533, 2, 1, 0, 1, 3348.2, -3613.26, 260.997, 4.51998, 300, 0, 0, 521320, 0, 0, 0, 0, 0);


-- Maexxna
DELETE FROM creature_text WHERE entry=15952;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 0, 0, 'Maexxna spins her web into a coconn!', 41, 0, 100, 0, 0, 0, 'Maexxna spins her web into a coconn!');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 1, 0, 'Spiderlings appear on the web!', 41, 0, 100, 0, 0, 0, 'Spiderlings appear on the web!');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 2, 0, 'Maexxna sprays strands of web everywhere!', 41, 0, 100, 0, 0, 0, 'Maexxna sprays strands of web everywhere!');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 3, 0, 'Maexxna goes into a frenzy!', 41, 0, 100, 0, 0, 0, 'Maexxna goes into a frenzy!');


-- Kel'Thuzad


 -- Icecrown guadians para el Blood Tap
UPDATE creature_model_info SET bounding_radius=4, combat_reach=4 WHERE modelid=16586;
UPDATE smart_scripts SET event_param3=8000, event_param4=1300 WHERE entryorguid=16441;

-- Full immunity for Guardians of Icecrown and the Four Horsemen.
UPDATE creature_template SET mechanic_immune_mask=0 where entry IN(16441, 30057, 30603, 30601, 30600,30602);

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN(16441, 30057, 30603, 30601, 30600,30602);



 -- Thaddius 

DELETE FROM spell_linked_spell WHERE spell_trigger IN(28059, -28059, 28084, -28084, 39088, -39088, 39091, -39091, 28059, 28084, 28062, 28085, 28059);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28059, -28084, 1, 'Positive Charge - Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-28059, -29659, 0, 'Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28084, -28059, 1, 'Negative Charge - Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-28084, -29660, 0, 'Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39088, -39091, 1, 'Positive Charge - Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-39088, -29659, 0, 'Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (39091, -39088, 1, 'Negative Charge - Positive Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-39091, -39092, 0, 'Negative Charge');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28059, -28062, 2, 'Positive polarity immunity');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28084, -28085, 2, 'Negative polarity immunity');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28062, 29659, 0, 'Positive - Positive = stack');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28085, 29660, 0, 'Negative - Negative = stack');
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (28059, -29660, 2, 'Positive polarity -> Immuni to negative buff stack');

-- Grand Widow Faerlina - Add Widow Embrance 25 players to Naxxramas Worshippers
UPDATE creature_template SET spell2=54097 WHERE entry=29274;


DELETE FROM creature_template WHERE entry IN(225154, 225155);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (225154, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Tesla Stalagg - World Trigger', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_stalagg_tesla_coil', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (225155, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Tesla Feugen - World Trigger', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_feugen_tesla_coil', 12340);

DELETE FROM creature WHERE ID IN(225154, 225155);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (259608, 225154, 533, 3, 1, 0, 0, 3487.65, -2910.56, 319.433, 3.93139, 300, 0, 0, 4121, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (260401, 225155, 533, 3, 1, 0, 0, 3526.34, -2952.86, 318.807, 3.9894, 300, 0, 0, 4121, 0, 0, 0, 0, 0);


DELETE FROM creature_text WHERE entry IN(15930,15929) AND groupid=3;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15930, 3, 0, 'Tesla Coils loses its link!', 41, 0, 100, 0, 0, 0, 'Feugen Tesla Coil unlinked');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15929, 3, 0, 'Tesla Coils loses its link!', 41, 0, 100, 0, 0, 0, 'Stalagg Tesla Coil unlinked');

DELETE FROM creature_text WHERE entry=15928 AND groupid=6;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15928, 6, 0, 'Tesla Coil overloads!', 41, 0, 100, 0, 0, 0, 'Tesla Coil overloads!');




-- Mr. Bigglesworth

DELETE FROM creature_template WHERE entry=381531;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381531, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'Kel\'Thuzad', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, '', 12340);


DELETE FROM creature_text WHERE entry=381531;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) 
VALUES (381531, 0, 0, 'No!!! A curse upon you, interlopers! The armies of the Lich King will hunt you down. You will not escape your fate...', 14, 0, 100, 0, 0, 14484, 'kelthuzad SAY_CAT_DIED');


UPDATE creature_template SET ScriptName="npc_mr_bigglesworth" WHERE entry=16998;


DELETE FROM creature WHERE id=381531;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) 
VALUES (198665, 381531, 533, 0, 0, 3, 1, 0, 0, 3008.24, -3438.99, 315.586, 5.14699, 300, 0, 0, 13945, 0, 0, 0, 0, 0, 0);


-- Dialogue between The Lich King and Kel'Thuzad

DELETE FROM creature_template WHERE entry=381542;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) 
VALUES (381542, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'Controller', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, 'npc_dialog_controller', 12340);

DELETE FROM creature WHERE id=381542;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) 
VALUES (270713, 381542, 533, 3, 1, 0, 0, 3538.84, -5153.51, 166.391, 4.54851, 300, 0, 0, 13945, 0, 0, 0, 0, 0);

DELETE FROM creature_text WHERE entry=381542;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 0, 0, 'Your forces are nearly marshalled to strike back against your enemies, my liege.', 14, 0, 100, 0, 0, 14467, 'kelthuzad SAY_SAPP_DIALOG1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 1, 0, 'Soon we will eradicate the Alliance and Horde, then the rest of Azeroth will fall before the might of my army.', 14, 0, 100, 0, 0, 14768, 'kelthuzad SAY_SAPP_DIALOG2_LICH');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 2, 0, 'Yes, Master. The time of their ultimate demise grows close...What is this?', 14, 0, 100, 0, 0, 14468, 'kelthuzad SAY_SAPP_DIALOG3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 3, 0, 'Invaders...here?! DESTROY them, Kel\'Thuzad! Naxxramas must not fall!', 14, 0, 100, 0, 0, 14769, 'kelthuzad SAY_SAPP_DIALOG4_LICH');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 4, 0, 'As you command, Master!', 14, 0, 100, 0, 0, 14469, 'kelthuzad SAY_SAPP_DIALOG5');




-- Toxic Tunnel combat bug fix
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2  WHERE `entry` IN (16400);



-- Scriptnames.
UPDATE creature_template SET ScriptName="npc_plagued_guardian" WHERE entry=16981;
UPDATE creature_template SET ScriptName="npc_kelthuzad_guardian_icecrown" WHERE entry=16441;
UPDATE creature_template SET ScriptName="npc_shadow_fissure" WHERE entry=16129;
UPDATE creature_template SET ScriptName="npc_faerlina_add" WHERE entry=16506;
UPDATE creature_template SET ScriptName="npc_zombie_chow" WHERE entry=16360;




-- Orb of Naxxramas


DELETE FROM gameobject_template WHERE entry=202278;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
(202278, 10, 7800, 'Orb of Naxxramas', '', '', '', 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 72617, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

DELETE FROM gameobject WHERE id=202278;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(5222, 202278, 533, 3, 1, 2997.68, -3437.8, 304.2, 1.15192, 0, 0, 0, 1, 7200, 255, 1);



-- Triggers and spawns.
DELETE FROM creature_template where entry in(225154,225155);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(225154, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Tesla Stalagg - World Trigger', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_stalagg_tesla_coil', 12340),
(225155, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Tesla Feugen - World Trigger', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 130, 'npc_feugen_tesla_coil', 12340);

DELETE from creature where id in(225154, 225155);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (259608, 225154, 533, 3, 1, 0, 0, 3487.65, -2910.56, 319.433, 3.93139, 300, 0, 0, 4121, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (260401, 225155, 533, 3, 1, 0, 0, 3526.34, -2952.86, 318.807, 3.9894, 300, 0, 0, 4121, 0, 0, 0, 0, 0);

-- Tesla Coils
DELETE FROM gameobject_template where entry IN(181477, 181478);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `AIName`, `ScriptName`, `VerifiedBuild`) VALUES 
(181477, 1, 6775, 'Doodad_nox_tesla05', '', '', '', 114, 6553632, 1.78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340),
(181478, 1, 6775, 'Doodad_nox_tesla06', '', '', '', 114, 6553632, 1.78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 12340);

-- Tesla Coils Spawn
DELETE FROM gameobject WHERE id IN (181478, 181477);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1035015, 181478, 533, 3, 1, 3526.58, -2952.75, 318.603, 0.744291, 0, 0, 0.363615, 0.931549, 300, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES (1035017, 181477, 533, 3, 1, 3487.71, -2910.48, 319.554, 2.31378, 0, 0, 0.915557, 0.402187, 300, 0, 1);


-- Lamment bunny and spawns.
DELETE FROM creature_template where entry IN(381532, 381533);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(381532, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'Thaddius', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, '', 12340),
(381533, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'Thaddius', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, '', 12340);

DELETE FROM creature WHERE id IN (381532, 381533);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(211001, 381532, 533, 3, 1, 0, 0, 3005.94, -3433.48, 320.486, 4.47028, 300, 0, 0, 13945, 0, 0, 0, 0, 0),
(211002, 381533, 533, 3, 1, 0, 0, 3231.63, -3740.85, 304.713, 3.77212, 300, 0, 0, 13945, 0, 0, 0, 0, 0);



-- Texts
DELETE FROM creature_text WHERE entry IN(381532, 381533);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381532, 1, 0, 'Pleeease!', 14, 0, 100, 0, 0, 8873, 'thaddius SAY_SCREAM1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381532, 1, 1, 'Stop, make it stop!', 14, 0, 100, 0, 0, 8874, 'thaddius SAY_SCREAM2');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381532, 1, 2, 'Help me! Save me!', 14, 0, 100, 0, 0, 8875, 'thaddius SAY_SCREAM3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381532, 1, 3, 'Please, nooo!', 14, 0, 100, 0, 0, 8876, 'thaddius SAY_SCREAM4');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381533, 1, 0, 'Pleeease!', 14, 0, 100, 0, 0, 8873, 'thaddius SAY_SCREAM1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381533, 1, 1, 'Stop, make it stop!', 14, 0, 100, 0, 0, 8874, 'thaddius SAY_SCREAM2');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381533, 1, 2, 'Help me! Save me!', 14, 0, 100, 0, 0, 8875, 'thaddius SAY_SCREAM3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381533, 1, 3, 'Please, nooo!', 14, 0, 100, 0, 0, 8876, 'thaddius SAY_SCREAM4');



-- Gluth texts.

DELETE FROM creature_text WHERE entry=15932;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15932, 0, 0, '%s spots a zombie to devour!', 16, 0, 0, 0, 0, 0, 'Gluth Devour');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15932, 1, 0, '%s becomes enraged!', 41, 0, 0, 0, 0, 0, 'Gluth Enraged');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15932, 2, 0, '%s decimates all nearby flesh!', 41, 0, 0, 0, 0, 0, 'Gluth Decimate');



-- Portals and spawns.


DELETE FROM creature_template where entry IN(381550,381551, 381552, 381553, 381554, 381555, 381556, 381557);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381550, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Plague Quarter Teleport', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_naxxramas_teleport', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381551, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Plague Quarter Ramp portal', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, '', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381552, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Arachnid Quarter teleport', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_naxxramas_teleport', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381553, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Arachnid quarter Ramp portal', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, '', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381554, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Miltary Quarter teleport', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_naxxramas_teleport', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381555, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Miltary Quarter Ramp portal', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, '', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381556, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Construct Quarter teleport', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 'npc_naxxramas_teleport', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381557, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'The Construct Quarter Ramp portal', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, '', 12340);


DELETE FROM creature where id IN(381550,381551, 381552, 381553, 381554, 381555, 381556, 381557);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189765, 381550, 533, 3, 1, 0, 0, 2908.63, -4025.88, 274.682, 1.30171, 300, 0, 0, 13945, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189766, 381551, 533, 3, 1, 0, 0, 2991.97, -3448.15, 302.224, 3.97237, 300, 0, 0, 13945, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189767, 381552, 533, 3, 1, 0, 0, 3465.71, -3939.51, 307.266, 0.982678, 300, 0, 0, 13945, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189768, 381553, 533, 3, 1, 0, 0, 3019.01, -3447.55, 302.293, 5.54164, 300, 0, 0, 13945, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189769, 381554, 533, 3, 1, 0, 0, 2493.13, -2921.67, 241.276, 5.26727, 300, 0, 0, 13945, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189770, 381555, 533, 3, 1, 0, 0, 2992.32, -3420.8, 302.261, 2.41244, 300, 0, 0, 13945, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189771, 381556, 533, 3, 1, 0, 0, 3539.04, -2936.89, 302.572, 3.50201, 300, 0, 0, 13945, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (189772, 381557, 533, 3, 1, 0, 0, 3018.95, -3421.14, 302.294, 0.804602, 300, 0, 0, 13945, 0, 0, 0, 0, 0);




-- Faerlina - Naxxramas Worshippers.


DELETE FROM creature_template WHERE entry IN(16506, 29274);

INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (16506, 29274, 0, 0, 0, 0, 16603, 16604, 0, 0, 'Naxxramas Worshipper', '', NULL, 0, 81, 81, 2, 312, 0, 1, 1.14286, 1, 1, 0, 2000, 0, 8, 32832, 2048, 8, 0, 0, 0, 0, 0, 7, 72, 16506, 0, 0, 0, 0, 0, 0, 0, 0, 54095, 0, 0, 0, 0, 0, 0, 28732, 0, 0, 0, 0, '', 0, 3, 1, 13, 10, 1, 0, 22708, 0, 0, 0, 0, 0, 144, 1, 0, 0, 'npc_faerlina_add', 12340);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (29274, 0, 0, 0, 0, 0, 16603, 16604, 0, 0, 'Naxxramas Worshipper (1)', '', '', 0, 81, 81, 2, 312, 0, 1, 1.14286, 1, 1, 0, 2000, 0, 8, 32832, 2048, 8, 0, 0, 0, 0, 0, 7, 72, 16506, 0, 0, 0, 0, 0, 0, 0, 0, 54096, 54097, 0, 0, 0, 0, 0, 54097, 0, 0, 0, 0, '', 0, 3, 1, 29, 10, 1, 0, 22708, 0, 0, 0, 0, 0, 144, 1, 0, 0, '', 12340);




-- Maexxna texts.

DELETE FROM creature_text WHERE entry=15952;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 0, 0, 'Maexxna spins her web into a coconn!', 41, 0, 100, 0, 0, 0, 'Maexxna spins her web into a coconn!');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 1, 0, 'Spiderlings appear on the web!', 41, 0, 100, 0, 0, 0, 'Spiderlings appear on the web!');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 2, 0, 'Maexxna sprays strands of web everywhere!', 41, 0, 100, 0, 0, 0, 'Maexxna sprays strands of web everywhere!');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (15952, 3, 0, 'Maexxna goes into a frenzy!', 41, 0, 100, 0, 0, 0, 'Maexxna goes into a frenzy!');





-- Remove the AI from the understudies on Razuvious.

UPDATE creature_template SET AIName="" WHERE entry IN(16803,29941);



-- Four Horsemen Intro controller and spawn.

DELETE FROM creature_template WHERE entry=381540;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Healthmodifier`, `Manamodifier`, `Armormodifier`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (381540, 0, 0, 0, 0, 0, 16480, 21342, 0, 0, 'Four Horsemen Controller', '', '', 0, 83, 83, 2, 35, 0, 1, 1.14286, 1, 0, 0, 0, 0, 1, 33554688, 2048, 8, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 128, 'npc_four_horsemen_intro', 12340);

DELETE FROM creature WHERE id=381540;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (269239, 381540, 533, 3, 1, 0, 0, 2574.7, -3005.64, 241.467, 2.35034, 300, 0, 0, 13945, 0, 0, 0, 0, 0);




-- Four Horseman Chest 25 players
UPDATE gameobject_loot_template SET item=40753 WHERE entry=25193 AND item=47241;




SET @OGUID = 5517;

-- Gluth's decimate.
DELETE FROM spell_script_names WHERE spell_id IN(54426, 28374);
INSERT INTO spell_script_names VALUES (54426, "spell_gluth_decimate"),(28374, "spell_gluth_decimate");

-- Conditions for Decimate (10/25).
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(28374, 54426);
INSERT INTO conditions VALUES(13, 1, 28374, 0, 0, 31, 0, 3, 16360, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 28374, 0, 1, 31, 0, 4, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 28374, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 28374, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 54426, 0, 0, 31, 0, 3, 16360, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 54426, 0, 1, 31, 0, 4, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 54426, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 54426, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, '', '');

-- Zombie Chow.
UPDATE creature_template SET RegenHealth=0, ScriptName="" WHERE entry IN(16360, 30303);



-- Understudies
UPDATE creature_template SET ScriptName="npc_dk_understudy" WHERE entry=16803;









-- Faerlina

-- Delete de followers. 

DELETE FROM creature WHERE id=16505;

-- Naxxramas Follower SAI
SET @ENTRY := 16505;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,16000,21000,11,56107,0,0,0,0,0,17,7,40,0,0,0,0,0,"Cast Spell IC"),
(@ENTRY,0,1,0,0,0,100,0,5000,7000,11000,15000,11,54093,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cast Spell IC"),
(@ENTRY,0,2,0,5,0,100,0,0,0,1,0,34,119,0,0,0,0,0,1,0,0,0,0,0,0,0,"Immortal Achievement - player Kill");



-- Naxxramas Worshipper SAI
SET @ENTRY := 16506;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,4000,5000,7000,9000,11,54095,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cast Spell IC"),
(@ENTRY,0,1,0,0,0,100,4,4000,5000,7000,9000,11,54096,0,0,0,0,0,2,0,0,0,0,0,0,0,"Cast Spell IC"),
(@ENTRY,0,2,0,6,0,100,2,0,0,0,0,11,28732,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cast Spell on Death"),
(@ENTRY,0,3,0,5,0,100,0,0,0,1,0,34,119,0,0,0,0,0,1,0,0,0,0,0,0,0,"Immortal Achievement - player Kill");



DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(28732);
INSERT INTO conditions VALUES(13, 1, 28732, 0, 0, 31, 0, 3, 15953, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES(13, 1, 28732, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', '');




-- Heigan, new version.
UPDATE `creature_template` SET `mechanic_immune_mask`=617299839 WHERE `entry` IN(15936, 29701);

UPDATE `creature_text` SET `probability`=20 WHERE `entry`=15936 AND `groupid`=1;

DELETE FROM `creature_text` WHERE `entry`=15936 AND `groupid` IN (4,5);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`probability`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(15936,4,0,"%s teleports and begins to channel a spell!",41,100,32332,3,"Heigan EMOTE_DANCE"),
(15936,5,0,"%s rushes to attack once more!",41,100,32333,3,"Heigan EMOTE_DANCE_END");




-- ================== --
-- Heigan the Unclean --
-- ================== --
-- Completely re-do eruption fissure spawns
SET @OGUID2 = 84980; -- gameobject GUID (76 objects); needs to match the constant in boss_heigan.cpp
DELETE FROM `gameobject` WHERE `id` between 181510 and 181552;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`) VALUES
    (@OGUID2+0,181510,533,3,1,2787.255000,-3654.130000,274.316700,3.534301,0.000000,0.000000,-0.980784,0.195095,0,0,1,15354),
    (@OGUID2+1,181526,533,3,1,2781.556000,-3670.999000,274.351800,3.153633,0.000000,0.000000,-0.999982,0.006020,0,0,1,15354),
    (@OGUID2+2,181511,533,3,1,2782.403000,-3660.402000,274.314800,2.110888,0.000000,0.000000,0.870119,0.492841,0,0,1,15354),
    (@OGUID2+3,181517,533,3,1,2793.238000,-3664.132000,274.316700,0.635802,0.000000,0.000000,0.312573,0.949894,0,0,1,15354),
    (@OGUID2+4,181518,533,3,1,2802.508000,-3664.726000,274.316700,0.635802,0.000000,0.000000,0.312573,0.949894,0,0,1,15354),
    (@OGUID2+5,181523,533,3,1,2795.809000,-3677.562000,274.072800,2.853153,0.000000,0.000000,0.989618,0.143721,0,0,1,15354),
    (@OGUID2+6,181519,533,3,1,2811.998000,-3671.979000,274.072800,5.809874,0.000000,0.000000,-0.234453,0.972127,0,0,1,15354),
    (@OGUID2+7,181524,533,3,1,2792.327000,-3684.134000,274.316700,4.976158,0.000000,0.000000,-0.607980,0.793952,0,0,1,15354),
    (@OGUID2+8,181520,533,3,1,2810.557000,-3680.581000,274.316700,3.186728,0.000000,0.000000,-0.999745,0.022566,0,0,1,15354),
    (@OGUID2+9,181521,533,3,1,2800.146000,-3682.706000,274.351800,1.038823,0.000000,0.000000,0.496369,0.868111,0,0,1,15354),
    (@OGUID2+10,181523,533,3,1,2795.809000,-3677.562000,274.072800,2.853153,0.000000,0.000000,0.989618,0.143721,0,0,1,15354),
    (@OGUID2+11,181524,533,3,1,2792.327000,-3684.134000,274.316700,4.976158,0.000000,0.000000,-0.607980,0.793952,0,0,1,15354),
    (@OGUID2+12,181520,533,3,1,2810.557000,-3680.581000,274.316700,3.186728,0.000000,0.000000,-0.999745,0.022566,0,0,1,15354),
    (@OGUID2+13,181521,533,3,1,2800.146000,-3682.706000,274.351800,1.038823,0.000000,0.000000,0.496369,0.868111,0,0,1,15354),
    (@OGUID2+14,181522,533,3,1,2805.961000,-3691.666000,274.316700,4.434372,0.000000,0.000000,-0.798264,0.602308,0,0,1,15354),

    (@OGUID2+15,181515,533,3,1,2755.239000,-3649.898000,274.316700,3.396841,0.000000,0.000000,-0.991867,0.127278,0,0,1,15354),
    (@OGUID2+16,181516,533,3,1,2763.548000,-3654.044000,274.316700,3.399228,0.000000,0.000000,-0.991715,0.128462,0,0,1,15354),
    (@OGUID2+17,181531,533,3,1,2749.335000,-3662.211000,274.351800,3.636871,0.000000,0.000000,-0.969494,0.245116,0,0,1,15354),
    (@OGUID2+18,181514,533,3,1,2757.844000,-3659.562000,274.316700,1.971156,0.000000,0.000000,0.833592,0.552381,0,0,1,15354),
    (@OGUID2+19,181512,533,3,1,2778.426000,-3651.314000,274.316700,3.540596,0.000000,0.000000,-0.980166,0.198181,0,0,1,15354),
    (@OGUID2+20,181516,533,3,1,2763.548000,-3654.044000,274.316700,3.399228,0.000000,0.000000,-0.991715,0.128462,0,0,1,15354),
    (@OGUID2+21,181530,533,3,1,2758.163000,-3667.129000,274.351800,3.138830,0.000000,0.000000,0.999999,0.001381,0,0,1,15354),
    (@OGUID2+22,181514,533,3,1,2757.844000,-3659.562000,274.316700,1.971156,0.000000,0.000000,0.833592,0.552381,0,0,1,15354),
    (@OGUID2+23,181512,533,3,1,2778.426000,-3651.314000,274.316700,3.540596,0.000000,0.000000,-0.980166,0.198181,0,0,1,15354),
    (@OGUID2+24,181529,533,3,1,2763.326000,-3680.528000,274.351800,3.146377,0.000000,0.000000,-0.999997,0.002392,0,0,1,15354),
    (@OGUID2+25,181513,533,3,1,2774.297000,-3660.655000,274.316700,6.099252,0.000000,0.000000,-0.091837,0.995774,0,0,1,15354),
    (@OGUID2+26,181528,533,3,1,2769.250000,-3671.420000,274.422200,5.859179,0.000000,0.000000,-0.210419,0.977611,0,0,1,15354),
    (@OGUID2+27,181527,533,3,1,2777.413000,-3677.635000,274.387000,0.791340,0.000000,0.000000,0.385427,0.922739,0,0,1,15354),
    (@OGUID2+28,181527,533,3,1,2777.413000,-3677.635000,274.387000,0.791340,0.000000,0.000000,0.385427,0.922739,0,0,1,15354),
    (@OGUID2+29,181529,533,3,1,2763.326000,-3680.528000,274.351800,3.146377,0.000000,0.000000,-0.999997,0.002392,0,0,1,15354),
    (@OGUID2+30,181525,533,3,1,2783.359000,-3688.357000,274.385100,3.161319,0.000000,0.000000,-0.999951,0.009863,0,0,1,15354),
    (@OGUID2+31,181528,533,3,1,2769.250000,-3671.420000,274.422200,5.859179,0.000000,0.000000,-0.210419,0.977611,0,0,1,15354),
    (@OGUID2+32,181528,533,3,1,2769.250000,-3671.420000,274.422200,5.859179,0.000000,0.000000,-0.210419,0.977611,0,0,1,15354),
    (@OGUID2+33,181529,533,3,1,2763.326000,-3680.528000,274.351800,3.146377,0.000000,0.000000,-0.999997,0.002392,0,0,1,15354),
    (@OGUID2+34,181516,533,3,1,2763.548000,-3654.044000,274.316700,3.399228,0.000000,0.000000,-0.991715,0.128462,0,0,1,15354),
    (@OGUID2+35,181530,533,3,1,2758.163000,-3667.129000,274.351800,3.138830,0.000000,0.000000,0.999999,0.001381,0,0,1,15354),
    (@OGUID2+36,181514,533,3,1,2757.844000,-3659.562000,274.316700,1.971156,0.000000,0.000000,0.833592,0.552381,0,0,1,15354),
    (@OGUID2+37,181515,533,3,1,2755.239000,-3649.898000,274.316700,3.396841,0.000000,0.000000,-0.991867,0.127278,0,0,1,15354),
    (@OGUID2+38,181531,533,3,1,2749.335000,-3662.211000,274.351800,3.636871,0.000000,0.000000,-0.969494,0.245116,0,0,1,15354),
    (@OGUID2+39,181512,533,3,1,2778.426000,-3651.314000,274.316700,3.540596,0.000000,0.000000,-0.980166,0.198181,0,0,1,15354),

    (@OGUID2+40,181532,533,3,1,2743.089000,-3671.320000,274.316700,2.464252,0.000000,0.000000,0.943197,0.332233,0,0,1,15354),
    (@OGUID2+41,181534,533,3,1,2737.166000,-3675.165000,274.316700,4.369651,0.000000,0.000000,-0.817333,0.576165,0,0,1,15354),
    (@OGUID2+42,181532,533,3,1,2743.089000,-3671.320000,274.316700,2.464252,0.000000,0.000000,0.943197,0.332233,0,0,1,15354),
    (@OGUID2+43,181533,533,3,1,2754.007000,-3673.770000,274.387000,0.791340,0.000000,0.000000,0.385427,0.922739,0,0,1,15354),
    (@OGUID2+44,181534,533,3,1,2737.166000,-3675.165000,274.316700,4.369651,0.000000,0.000000,-0.817333,0.576165,0,0,1,15354),
    (@OGUID2+45,181536,533,3,1,2740.491000,-3692.128000,274.387000,0.792787,0.000000,0.000000,0.386094,0.922459,0,0,1,15354),
    (@OGUID2+46,181533,533,3,1,2754.007000,-3673.770000,274.387000,0.791340,0.000000,0.000000,0.385427,0.922739,0,0,1,15354),
    (@OGUID2+47,181535,533,3,1,2747.132000,-3684.353000,274.351800,3.132432,0.000000,0.000000,0.999989,0.004580,0,0,1,15354),
    (@OGUID2+48,181541,533,3,1,2760.581000,-3688.306000,274.387000,0.412781,0.000000,0.000000,0.204928,0.978777,0,0,1,15354),
    (@OGUID2+49,181533,533,3,1,2754.007000,-3673.770000,274.387000,0.791340,0.000000,0.000000,0.385427,0.922739,0,0,1,15354),
    (@OGUID2+50,181532,533,3,1,2743.089000,-3671.320000,274.316700,2.464252,0.000000,0.000000,0.943197,0.332233,0,0,1,15354),
    (@OGUID2+51,181544,533,3,1,2774.958000,-3701.132000,274.316700,0.523547,0.000000,0.000000,0.258794,0.965933,0,0,1,15354),
    (@OGUID2+52,181543,533,3,1,2772.080000,-3692.152000,274.351800,5.018846,0.000000,0.000000,-0.590897,0.806747,0,0,1,15354),
    (@OGUID2+53,181543,533,3,1,2772.080000,-3692.152000,274.351800,5.018846,0.000000,0.000000,-0.590897,0.806747,0,0,1,15354),
    (@OGUID2+54,181544,533,3,1,2774.958000,-3701.132000,274.316700,0.523547,0.000000,0.000000,0.258794,0.965933,0,0,1,15354),
    (@OGUID2+55,181542,533,3,1,2764.288000,-3698.094000,274.422200,5.490798,0.000000,0.000000,-0.385910,0.922536,0,0,1,15354),
    (@OGUID2+56,181541,533,3,1,2760.581000,-3688.306000,274.387000,0.412781,0.000000,0.000000,0.204928,0.978777,0,0,1,15354),
    (@OGUID2+57,181533,533,3,1,2754.007000,-3673.770000,274.387000,0.791340,0.000000,0.000000,0.385427,0.922739,0,0,1,15354),
    (@OGUID2+58,181540,533,3,1,2752.924000,-3693.020000,274.316700,4.099892,0.000000,0.000000,-0.887387,0.461025,0,0,1,15354),
    (@OGUID2+59,181536,533,3,1,2740.491000,-3692.128000,274.387000,0.792787,0.000000,0.000000,0.386094,0.922459,0,0,1,15354),
    (@OGUID2+60,181532,533,3,1,2743.089000,-3671.320000,274.316700,2.464252,0.000000,0.000000,0.943197,0.332233,0,0,1,15354),
    (@OGUID2+61,181534,533,3,1,2737.166000,-3675.165000,274.316700,4.369651,0.000000,0.000000,-0.817333,0.576165,0,0,1,15354),
    (@OGUID2+62,181535,533,3,1,2747.132000,-3684.353000,274.351800,3.132432,0.000000,0.000000,0.999989,0.004580,0,0,1,15354),

    (@OGUID2+63,181552,533,3,1,2784.168000,-3724.730000,274.385100,1.050844,0.000000,0.000000,0.501578,0.865112,0,0,1,15354),
    (@OGUID2+64,181552,533,3,1,2784.168000,-3724.730000,274.385100,1.050844,0.000000,0.000000,0.501578,0.865112,0,0,1,15354),
    (@OGUID2+65,181545,533,3,1,2772.289000,-3711.435000,274.422200,6.022432,0.000000,0.000000,-0.130008,0.991513,0,0,1,15354),
    (@OGUID2+66,181549,533,3,1,2776.160000,-3721.793000,274.387000,3.937367,0.000000,0.000000,-0.921882,0.387472,0,0,1,15354),
    (@OGUID2+67,181551,533,3,1,2774.989000,-3731.793000,274.387000,3.927917,0.000000,0.000000,-0.923702,0.383111,0,0,1,15354),
    (@OGUID2+68,181548,533,3,1,2765.765000,-3718.734000,274.316700,4.807982,0.000000,0.000000,-0.672515,0.740084,0,0,1,15354),
    (@OGUID2+69,181546,533,3,1,2761.821000,-3711.915000,274.314800,3.961473,0.000000,0.000000,-0.917145,0.398554,0,0,1,15354),
    (@OGUID2+70,181550,533,3,1,2765.327000,-3728.606000,274.314800,6.217947,0.000000,0.000000,-0.032614,0.999468,0,0,1,15354),
    (@OGUID2+71,181547,533,3,1,2754.189000,-3718.121000,274.316700,5.370356,0.000000,0.000000,-0.440733,0.897638,0,0,1,15354),
    (@OGUID2+72,181538,533,3,1,2752.927000,-3706.516000,274.316700,1.047839,0.000000,0.000000,0.500278,0.865865,0,0,1,15354),
    (@OGUID2+73,181537,533,3,1,2738.396000,-3703.130000,274.385100,5.746106,0.000000,0.000000,-0.265324,0.964159,0,0,1,15354),
    (@OGUID2+74,181539,533,3,1,2746.133000,-3700.192000,274.316700,5.493282,0.000000,0.000000,-0.384764,0.923015,0,0,1,15354),
    (@OGUID2+75,181549,533,3,1,2776.160000,-3721.793000,274.387000,3.937367,0.000000,0.000000,-0.921882,0.387472,0,0,1,15354);
    
    
    
    
-- ======= --
-- Loatheb --
-- ======= --
-- Get rid of the superfluous aurascript for a dummy that's just there to make him talk

DELETE FROM `spell_script_names` WHERE `scriptname`="spell_loatheb_necrotic_aura_warning";

DELETE FROM `smart_scripts` WHERE `entryorguid`=16286 AND `source_type`=0;
UPDATE `creature_template` SET `AIName`="" WHERE `entry`=16286;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (29865,55053);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(29865,"spell_loatheb_deathbloom"),
(55053,"spell_loatheb_deathbloom");

DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (55594);
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`) VALUES
(55594,55594,55601);


DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (29865,-29865,55053,-55053);




-- ========= --
-- Sapphiron --
-- ========= --
DELETE FROM `spell_script_names` WHERE `spell_id` in (24780,28522,28524,28560);
INSERT INTO `spell_script_names` (`spell_id`,`scriptname`) VALUES
(24780,"spell_sapphiron_change_blizzard_target"), -- Periodic aura on the Blizzard npc that handles target switches
(28522,"spell_sapphiron_icebolt"), -- AuraScript for spawning ice block GO once the player has stopped moving
(28524,"spell_sapphiron_frost_breath"), -- We can't get rid of the LoS emulation "hack" on frost breath targeting (yet!), but at least moving it to a spellscript...
(28560,"spell_sapphiron_summon_blizzard"); -- Blizzard is now properly summoned! Yay!
-- DB target position for the anti-cheese frost explosion
DELETE FROM `spell_target_position` WHERE `ID`=29318;
INSERT INTO `spell_target_position` (`ID`,`EffectIndex`,`MapID`,`PositionX`,`PositionY`,`PositionZ`,`VerifiedBuild`) VALUES
(29318,0,533,3493.45,-5375.38,138.168,"15595");
-- Wing Buffet trigger NPC
UPDATE `creature_template` SET `unit_flags`=33554944,`unit_flags2`=2048,`flags_extra`=128,`spell1`=29328,`BaseAttackTime`=1000,`ScriptName`="trigger_periodic" WHERE `entry`=17025;
-- Blizzard bunny NPC
UPDATE `creature_template` SET `speed_run`=0.42857142,`BaseAttackTime`=3000,`InhabitType`=1 WHERE `entry`=16474;
DELETE FROM `creature_template_addon` WHERE `entry`=16474;
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (16474,"24780");
-- Spawn GO is now spawned by DB
DELETE FROM `gameobject` WHERE `guid` between @OGUID+0 and @OGUID+0;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`VerifiedBuild`) VALUES
(@OGUID+0, 181356, 533, 3, 1, 3522.565, -5236.76, 137.6257, 4.485497, 0, 0, -0.782608, 0.6225148,0,0);
UPDATE `gameobject_template` SET `ScriptName`="go_sapphiron_birth" WHERE `entry`=181356;
-- Turn off interactivity on ice blocks
UPDATE `gameobject_template` SET `type`=5,`data2`=0 WHERE `entry`=181247;
-- Text cleanup
UPDATE `creature_text` SET `language`=0, `emote`=0, `textrange`=3 WHERE `entry`=15989;



-- Dialogue 

DELETE FROM creature_text WHERE entry=381542;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 0, 0, 'Your forces are nearly marshalled to strike back against your enemies, my liege.', 14, 0, 100, 0, 0, 14467, 'kelthuzad SAY_SAPP_DIALOG1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 1, 0, 'Soon we will eradicate the Alliance and Horde, then the rest of Azeroth will fall before the might of my army.', 14, 0, 100, 0, 0, 14768, 'kelthuzad SAY_SAPP_DIALOG2_LICH');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 2, 0, 'Yes, Master. The time of their ultimate demise grows close...What is this?', 14, 0, 100, 0, 0, 14468, 'kelthuzad SAY_SAPP_DIALOG3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 3, 0, 'Invaders...here?! DESTROY them, Kel\'Thuzad! Naxxramas must not fall!', 14, 0, 100, 0, 0, 14769, 'kelthuzad SAY_SAPP_DIALOG4_LICH');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (381542, 4, 0, 'As you command, Master!', 14, 0, 100, 0, 0, 14469, 'kelthuzad SAY_SAPP_DIALOG5');

UPDATE creature_text SET textrange=3 WHERE entry=381542;


DELETE FROM `creature_text` WHERE `entry`=15952;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`probability`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(15952,0,0,"Spiderlings appear on the web!",41,100,32305,3,"Maexxna EMOTE_SPIDERS"),
(15952,1,0,"%s spins her web into a cocoon!",41,100,32303,3,"Maexxna EMOTE_WEB_WRAP"),
(15952,2,0,"%s sprays strands of web everywhere!",41,100,32304,3,"Maexxna EMOTE_WEB_SPRAY");







-- delete frogger spawn locations from `creature`, move them to `creature_summon_groups`
SET @FROGGER = 16027;
DELETE FROM `creature` WHERE `id` = @FROGGER;
DELETE FROM `creature_summon_groups` WHERE `summonerId`=533 AND `summonerType`=2;
INSERT INTO `creature_summon_groups` (`summonerType`,`summonerId`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`,`summonTime`) VALUES
(2,533,0,@FROGGER,3175.281,-3134.764,293.4368,4.244924,3,7500),
(2,533,1,@FROGGER,3154.581,-3126.18 ,293.5911,4.430199,3,7500),
(2,533,2,@FROGGER,3128.622,-3119.604,293.4113,4.738929,3,7500);
DELETE FROM `waypoint_data` WHERE `id` BETWEEN @FROGGER*10+0 AND @FROGGER*10+2;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@FROGGER*10+0,1,3158.253,-3163.889,293.3027),
(@FROGGER*10+1,1,3145.881,-3158.563,293.3215),
(@FROGGER*10+2,1,3130.79 ,-3156.624,293.3239);
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN -76313 AND -76311 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@FROGGER AND `source_type`=0 AND `id` BETWEEN 2 AND 5;
UPDATE `creature_template` SET ScriptName="npc_living_poison" WHERE `entry`=@FROGGER;