
-- Coilfang Scale-Healer
DELETE FROM `smart_scripts` WHERE `entryorguid` = 21126;
INSERT INTO `smart_scripts` VALUES (21126, 0, 0, 0, 4, 0, 75, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Coilfang Scale-Healer - On Aggro - Say Line 0');
INSERT INTO `smart_scripts` VALUES (21126, 0, 1, 0, 14, 0, 100, 2, 1000, 40, 7000, 10000, 11, 34945, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coilfang Scale-Healer - HP Friendly - Cast Heal');
INSERT INTO `smart_scripts` VALUES (21126, 0, 2, 0, 14, 0, 100, 4, 1000, 40, 7000, 10000, 11, 39378, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coilfang Scale-Healer - HP Friendly - Cast Heal');
INSERT INTO `smart_scripts` VALUES (21126, 0, 3, 0, 0, 0, 100, 2, 6700, 7900, 16000, 18000, 11, 34944, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Coilfang Scale-Healer - In Combat - Cast Holy Nova');
INSERT INTO `smart_scripts` VALUES (21126, 0, 4, 0, 0, 0, 100, 4, 6700, 7900, 16000, 18000, 11, 37669, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Coilfang Scale-Healer - In Combat - Cast Holy Nova');
INSERT INTO `smart_scripts` VALUES (21126, 0, 5, 0, 16, 0, 100, 2, 17139, 40, 7000, 10000, 11, 17139, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coilfang Scale-Healer - Missing Buff - Cast Power Word: Shield');
INSERT INTO `smart_scripts` VALUES (21126, 0, 6, 0, 16, 0, 100, 4, 36052, 40, 7000, 10000, 11, 36052, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Coilfang Scale-Healer - Missing Buff - Cast Power Word: Shield');

UPDATE `creature_template` SET `faction`=35, `unit_flags`=33555266, `flags_extra`=2 WHERE `entry` IN (18206, 19901);