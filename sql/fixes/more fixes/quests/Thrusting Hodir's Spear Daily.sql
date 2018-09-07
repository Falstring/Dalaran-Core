-- Quest: Thrusting Hodir's Spear - 13003
SET @entry := 30275;

UPDATE `creature_template` SET `unit_flags` = '32896', `ScriptName` = 'npc_wild_wyrm' WHERE `entry` =@entry;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN(13,17) AND `SourceEntry` IN(56673,56671);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
('13', '1', '56673', '0', '0', '31', '0', '3', @entry, '0', '0', '0', '0', '', 'Fight Wyrm can be casted on Wild Wyrm'),
('17', '0', '56671', '0', '0', '31', '1', '3', @entry, '0', '0', '0', '0', '', 'Spear of Hodir can only casted on Wild Wyrm');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (56689, 60533, 56690, 60586, 60864, 60776, 56705, 60881);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('56689', 'spell_grip'),
('60533', 'spell_grab_on'),
('56690', 'spell_thrust_spear'),
('60586', 'spell_mighty_spear_thrust'),
('60864', 'spell_jaws_of_death_and_spell_claw_swipe_damage'),
('60776', 'spell_jaws_of_death_and_spell_claw_swipe_damage'),
('56705', 'spell_claw_swipe_check'),
('60881', 'spell_fatal_strike');

DELETE FROM `creature_text` WHERE `entry` =@entry;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES
(@entry, '0', '0', '%s swipes at you with his claws!', '42', '0', '100', '0', '0', '0', '', '32763'),
(@entry, '1', '0', 'DODGED!', '42', '0', '100', '0', '0', '0', '', '32794'),
(@entry, '2', '0', '%s shrieks in pain and twists around, grabbing you with his mouth!', '42', '0', '100', '0', '0', '0', '', '32813'),
(@entry, '3', '0', 'Your Grip is Failing!', '42', '0', '100', '0', '0', '0', '', '32784'),
(@entry, '4', '0', 'FATAL STRIKE MISSED! KEEP PRYING!', '42', '0', '100', '0', '0', '0', '', '32795');

DELETE FROM `waypoint_data` WHERE `id`=@entry;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@entry, '1', '7318.73', '-2526.11', '1017.82', '0', '0', '0', '0', '100', '0'),
(@entry, '2', '7232.49', '-2807.07', '1152.16', '0', '0', '0', '0', '100', '0'),
(@entry, '3', '6875.99', '-3078.42', '1092.29', '0', '0', '0', '0', '100', '0'),
(@entry, '4', '7126.63', '-3304.31', '1002.14', '0', '0', '0', '0', '100', '0'),
(@entry, '5', '7303.03', '-3031.33', '1006.74', '0', '0', '0', '0', '100', '0'),
(@entry, '6', '7297.66', '-2765.56', '886.85', '0', '0', '0', '0', '100', '0');