-- Oromorok - Crystal Spikes correction.

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2  WHERE `entry` IN (27099, 30539);

-- select * from creature_template where entry IN (27099, 30539);

-- SAI for Crystal Spike (Damage dealer)
DELETE FROM `smart_scripts` WHERE `entryorguid`=27099 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`event_type`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(27099,54,80,2709900,2,1,'Crystal Spike - Is summoned - Call timed action list');

-- Timed action list
DELETE FROM `smart_scripts` WHERE `entryorguid`=2709900 AND `source_type`=9;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`event_param1`,`event_param2`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(2709900,9,1,2100,2100,11,47944,2,1,'Crystal Spike - Timed action list - Cast damage spell'),
(2709900,9,2,0,0,41,0,0,1,'Crystal Spike - Timed action list - Despawn');