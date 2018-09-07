-- Pilgrims Bounty: Chair
DELETE FROM `creature_template_addon` WHERE `entry` IN (34823,34812,34824,34822,34819);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(34823, 0, 0, 0, 1, 0, '61793 61798'), -- The Cranberry Chair / (Cranberry Server | Can Eat - Cranberries)
(34812, 0, 0, 0, 1, 0, '61796 61801'), -- The Turkey Chair / (Turkey Server | Can Eat - Turkey)
(34824, 0, 0, 0, 1, 0, '61797 61802'), -- The Sweet Potato Chair / (Sweet Potatoes Server | Can Eat - Sweet Potatoes)
(34822, 0, 0, 0, 1, 0, '61794 61799'), -- The Pie Chair / (Pie Server | Can Eat - Pie)
(34819, 0, 0, 0, 1, 0, '61795 61800'); -- The Stuffing Chair / (Stuffing Server | Can Eat - Stuffing)

-- Achievement: The Turkinator
UPDATE `creature_template` SET `ScriptName` = 'npc_wild_turkey' WHERE `entry` =32820; -- Wild Turkey

-- Pilgrims Bounty: Chair
UPDATE `creature_template` SET `spell1`=66261, `spell2`=61784, `spell3`=61785, `spell4`=61788, `spell5`=61786, `spell6`=61787, scriptname="npc_pilgrim_chair" WHERE `entry`=34823; -- The Cranberry Chair
UPDATE `creature_template` SET `spell1`=66250, `spell2`=61784, `spell3`=61785, `spell4`=61788, `spell5`=61786, `spell6`=61787, scriptname="npc_pilgrim_chair" WHERE `entry`=34812; -- The Turkey Chair
UPDATE `creature_template` SET `spell1`=66259, `spell2`=61784, `spell3`=61785, `spell4`=61788, `spell5`=61786, `spell6`=61787, scriptname="npc_pilgrim_chair"  WHERE `entry`=34819; -- The Stuffing Chair
UPDATE `creature_template` SET `spell1`=66260, `spell2`=61784, `spell3`=61785, `spell4`=61788, `spell5`=61786, `spell6`=61787, scriptname="npc_pilgrim_chair"  WHERE `entry`=34822; -- The Pie Chair
UPDATE `creature_template` SET `spell1`=66262, `spell2`=61784, `spell3`=61785, `spell4`=61788, `spell5`=61786, `spell6`=61787, scriptname="npc_pilgrim_chair"  WHERE `entry`=34824; -- The Sweet Potato Chair

-- Item: Turkey Caller
UPDATE `creature_template` SET `faction`=35, `ScriptName` = 'npc_lonely_turkey' WHERE `entry` =32956; -- Lonely Turkey


-- Achievement: The Turkinator
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_turkey_tracker';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(62014, 'spell_gen_turkey_tracker'); -- Turkey Tracker

-- Feast On Spells
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_feast_on';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(61784, 'spell_gen_feast_on'), -- Feast On Turkey
(61785, 'spell_gen_feast_on'), -- Feast On Cranberries
(61786, 'spell_gen_feast_on'), -- Feast On Sweet Potatoes
(61787, 'spell_gen_feast_on'), -- Feast On Pie
(61788, 'spell_gen_feast_on'); -- Feast On Stuffing

DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_gen_well_fed_pilgrims_bounty_ap',
'spell_gen_well_fed_pilgrims_bounty_zm',
'spell_gen_well_fed_pilgrims_bounty_hit',
'spell_gen_well_fed_pilgrims_bounty_haste',
'spell_gen_well_fed_pilgrims_bounty_spirit');

INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(61807, 'spell_gen_well_fed_pilgrims_bounty_ap'),     -- A Serving of Turkey
(61804, 'spell_gen_well_fed_pilgrims_bounty_zm'),     -- A Serving of Cranberries
(61806, 'spell_gen_well_fed_pilgrims_bounty_hit'),    -- A Serving of Stuffing
(61808, 'spell_gen_well_fed_pilgrims_bounty_haste'),  -- A Serving of Sweet Potatoes
(61805, 'spell_gen_well_fed_pilgrims_bounty_spirit'); -- A Serving of Pie

DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_gen_on_plate_pilgrims_bounty_turkey',
'spell_gen_on_plate_pilgrims_bounty_cranberries',
'spell_gen_on_plate_pilgrims_bounty_stuffing',
'spell_gen_on_plate_pilgrims_bounty_sweet_potatoes',
'spell_gen_on_plate_pilgrims_bounty_pie');

INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(66250, 'spell_gen_on_plate_pilgrims_bounty_turkey'),            -- Pass The Turkey
(66261, 'spell_gen_on_plate_pilgrims_bounty_cranberries'),       -- Pass The Cranberries
(66259, 'spell_gen_on_plate_pilgrims_bounty_stuffing'),          -- Pass The Stuffing
(66262, 'spell_gen_on_plate_pilgrims_bounty_sweet_potatoes'),    -- Pass The Sweet Potatoes
(66260, 'spell_gen_on_plate_pilgrims_bounty_pie');               -- Pass The Pie

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_bountiful_feast';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(66477, 'spell_gen_bountiful_feast'); -- Bountiful Feast

DELETE FROM `spell_script_names` WHERE `ScriptName` IN (
'spell_gen_slow_roasted_turkey',
'spell_gen_cranberry_chutney',
'spell_gen_spice_bread_stuffing',
'spell_gen_pumpkin_pie',
'spell_gen_candied_sweet_potato');

INSERT INTO `spell_script_names` (`spell_id` ,`ScriptName`) VALUES
(65422, 'spell_gen_slow_roasted_turkey'),   -- Slow-Roasted Turkey
(65420, 'spell_gen_cranberry_chutney'),     -- Cranberry Chutney
(65419, 'spell_gen_spice_bread_stuffing'),  -- Spice Bread Stuffing
(65421, 'spell_gen_pumpkin_pie'),           -- Pumpkin Pie
(65418, 'spell_gen_candied_sweet_potato');  -- Candied Sweet Potato

-- Temp Hack Fixes
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (32823,32830,32840);
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (32823,32830,32840);

UPDATE `creature_template` SET `modelid2` = '0', `speed_walk` = '0', `speed_run` = '0' WHERE `entry` IN (34823,34812,34824,34822,34819);



-- Correct spawn for the turkeys.
UPDATE creature SET spawntimesecs=200 WHERE id=32820;