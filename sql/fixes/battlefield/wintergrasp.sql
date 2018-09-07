-- npc_wintergrasp_vehicle
UPDATE `creature_template` SET `ScriptName`='npc_wintergrasp_vehicle', `KillCredit1`=0 WHERE  `entry` IN (27838, 27850, 27881, 27883, 28094, 28312, 32627, 32898);

-- RP-GG
DELETE FROM spell_script_names WHERE spell_id IN (49761);
INSERT INTO spell_script_names VALUES(49761, 'spell_wintergrasp_rp_gg');

-- RP-GG script
-- tracking spell
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(49761);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 0, 31, 0, 3, 28312, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 0, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 1, 31, 0, 3, 32627, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 1, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 2, 31, 0, 3, 28094, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 2, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 2, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 3, 31, 0, 3, 27881, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 3, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 1, 49761, 0, 3, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);
-- damage spell
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(49760);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 0, 31, 0, 3, 28312, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 0, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 1, 31, 0, 3, 32627, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 1, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 1, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 2, 31, 0, 3, 28094, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 2, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 2, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 3, 31, 0, 3, 27881, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 3, 36, 0, 0, 0, 0, 0, 0, 0, '', NULL);
REPLACE INTO `conditions` VALUES (13, 2, 49760, 0, 3, 34, 0, 1, 7, 0, 0, 0, 0, '', NULL);

-- triggered cast (creature->player)
DELETE FROM spell_script_names WHERE spell_id IN (56575, 56661, 56663, 61408);
INSERT INTO spell_script_names VALUES (56575, 'spell_wintergrasp_create_vehicle');
INSERT INTO spell_script_names VALUES (56661, 'spell_wintergrasp_create_vehicle');
INSERT INTO spell_script_names VALUES (56663, 'spell_wintergrasp_create_vehicle');
INSERT INTO spell_script_names VALUES (61408, 'spell_wintergrasp_create_vehicle');

SET @SPELL_HORDE := 56618;
SET @SPELL_ALLIANCE := 56617;

SET @AREA_SUNKEN_RING := 4538;
SET @AREA_BROKEN_TEMPLE := 4539;
SET @AREA_CHILLED_QUAGMIRE := 4589; -- chilled quagmire
SET @AREA_W_WORKSHOP := 4611;
SET @AREA_E_WORKSHOP := 4612;

DELETE FROM `spell_area` WHERE `spell` IN (@SPELL_HORDE, @SPELL_ALLIANCE);
INSERT INTO `spell_area` (`spell`,`area`,`autocast`) VALUES
(@SPELL_HORDE, @AREA_SUNKEN_RING, 1),(@SPELL_ALLIANCE, @AREA_SUNKEN_RING, 1),
(@SPELL_HORDE, @AREA_BROKEN_TEMPLE, 1),(@SPELL_ALLIANCE, @AREA_BROKEN_TEMPLE, 1),
(@SPELL_HORDE, @AREA_CHILLED_QUAGMIRE, 1),(@SPELL_ALLIANCE, @AREA_CHILLED_QUAGMIRE, 1),
(@SPELL_HORDE, @AREA_W_WORKSHOP, 1),(@SPELL_ALLIANCE, @AREA_W_WORKSHOP, 1),
(@SPELL_HORDE, @AREA_E_WORKSHOP, 1),(@SPELL_ALLIANCE, @AREA_E_WORKSHOP, 1);

-- fix spirit guids phasemask!
UPDATE creature SET phaseMask=16 WHERE id=31841;
UPDATE creature SET phaseMask=32 WHERE id=31842;
UPDATE creature SET phaseMask=64 WHERE guid=88314; -- fortress - needs horde control
UPDATE creature SET phaseMask=128+64 WHERE guid=88315; -- Horde outside
UPDATE creature SET phaseMask=128 WHERE guid=88320; -- fortress - needs alliance control
UPDATE creature SET phaseMask=64+128 WHERE guid=88321; -- Ally outside


-- Delete banners from DB, they will be spawned via core.
DELETE from gameobject WHERE id in(190475,194962,194959, 190487);

-- Delete every Tower's spawn on database, they are already being spawned via core.
DELETE FROM `gameobject` where `id` in (190221, 190373, 190377, 190378, 190356, 190357, 190358);