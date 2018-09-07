DELETE FROM `disables` WHERE entry=616;
INSERT INTO `disables` VALUES (7, 616, 0, '', '', 'Disable mmaps - Eye of Eternity');


-- Inhabit type for sparks.

UPDATE `creature_template` SET `InhabitType`=4 WHERE entry IN (30084, 32187);

-- Surge of Power conditions
INSERT INTO `conditions` VALUES (13, 1, 56505, 0, 0, 31, 0, 3, 30334, 0, 0, 0, 0, '', '');
INSERT INTO `conditions` VALUES (13, 1, 56505, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, '', '');
