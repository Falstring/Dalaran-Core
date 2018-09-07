-- -------------------------------------------
-- DIRE MAUL
-- -------------------------------------------


-- The Madness Within - [A][H]http://www.wowhead.com/quest=27110/the-madness-within
-- Prince Tortheldrin
UPDATE creature_template SET faction=14 WHERE entry=11486;

DELETE FROM `creature` WHERE `guid`=56804;
DELETE FROM `creature_addon` WHERE `guid`=56804;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(56804,14338,429,0,0,1,1,0,0,591.98,598.8,-4.57,3.94,644,0,0,2215,0,0,0,0,0,0);