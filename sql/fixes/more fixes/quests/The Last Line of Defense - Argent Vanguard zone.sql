-- Judgment Day Comes! (13227)
DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(19, 20) AND SourceEntry IN(13227);
INSERT INTO conditions VALUES (19, 0, 13227, 0, 0, 8, 0, 13086, 0, 0, 1, 0, 0, '', 'Quest The Last line of Defense Not rewarded');
INSERT INTO conditions VALUES (20, 0, 13227, 0, 0, 8, 0, 13086, 0, 0, 1, 0, 0, '', 'Quest The Last line of Defense Not rewarded');



-- Hack, but it works as temporary way.
-- When a player completes the quest being mounted up on the cannon, the cannon switches his phase to 1, which makes it unusuable until a server restart.
-- This hacky solution will set the correct phase to the cannon (64) each time a player dismounts, so, if the player completes the quest, thus changes the 
-- cannons phase to 1, once he dismounts himself from the cannon it will automatically switch its phase to 64 again.
-- Argent Cannon SAI
SET @ENTRY := 30236;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,28,0,100,0,0,0,0,0,44,64,0,0,0,0,0,1,0,0,0,0,0,0,0,"Argent Cannon - On Passenger Removed - Set Phase 64");



UPDATE spell_area SET quest_end=13157 WHERE spell=57674 and area=4501;