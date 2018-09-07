UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE  `entry`=192262;
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=192262;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(192262, 1, 0 ,0, 70, 0, 100, 0, 2, 0, 0,0,85,56537,0,0,0,0,0,7,0,0,0,0, 0, 0, 0, 'Jormungar Control Orb - On State Changed - Invoker Cast Force Cast Mount Tamed Jormungar');

UPDATE `creature_template` SET `spell1`=56504, `spell2`=56513, `spell3`=56524,`unit_flags`=256 WHERE  `entry`=30301;

/*This is as far as I ever got as there was a number of issues with some spells (ie submerge which does not appear to work and acid splash which can be spammed making killing the iron colossus very easy) when it should have 6 second cd)
And unit flags should be 768*/