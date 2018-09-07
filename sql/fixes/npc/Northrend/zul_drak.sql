
-- Corrections for Burr, Gerk and Crusader Dargath Part 2. Position and hover mode for Dargath.
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 29455; 
UPDATE `creature` SET `spawndist` = 0 , `MovementType` = 0 WHERE `guid` = 98405; 
UPDATE `creature_template` SET `dynamicflags` = 32 WHERE `entry` = 29454; 


UPDATE `creature` SET `position_x` = 5950.65 , `position_y` = -1851.12 , `position_z` = 248.392 , `orientation` = 1.65806 WHERE `guid` = 98405; 

DELETE FROM `creature_addon` WHERE `guid`= 98405;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(98405,0,0,33554432,1,0,NULL);