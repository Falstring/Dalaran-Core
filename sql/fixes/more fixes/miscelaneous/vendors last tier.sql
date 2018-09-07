
-- Arcanist Miluria Triumph vendor Dalaran.
DELETE FROM creature WHERE id=35494;
INSERT INTO `creature` VALUES (85217, 35494, 571, 0, 0, 1, 1, 29832, 1, 5766.38, 738.24, 653.748, 2.94961, 180, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Arcanist Uovril Frost vendor Dalaran.
/*DELETE FROM creature WHERE id=37942;
INSERT INTO `creature` VALUES (4761, 37942, 571, 0, 0, 1, 1, 0, 1, 5765.45, 734.38, 653.748, 2.7227, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);*/

-- Magister Arlan horde frost vendor dalaran.
/*DELETE FROM creature WHERE id=37941;
INSERT INTO `creature` VALUES (202582, 37941, 571, 0, 0, 1, 1, 0, 1, 5936.93, 509.132, 650.263, 2.28638, 300, 0, 0, 10080, 8814, 0, 0, 0, 0, 0);*/

-- Magistrix Vesara horde triumph.
DELETE FROM creature WHERE id=35495;
INSERT INTO `creature` VALUES (86928, 35495, 571, 0, 0, 1, 1, 29831, 1, 5939.31, 513.155, 650.263, 2.56563, 180, 0, 0, 1, 0, 0, 0, 0, 0, 0);


-- Plate vendor Horace
DELETE FROM creature WHERE id=35498;
INSERT INTO `creature` VALUES (85220, 35498, 571, 0, 0, 1, 1, 29833, 0, 5918.86, 662.958, 643.579, 2.54818, 180, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Cloth vendor Rueben Lauren.
DELETE FROM creature WHERE id=35496;
INSERT INTO `creature` VALUES (85218, 35496, 571, 0, 0, 1, 1, 29836, 0, 5798.02, 689.601, 647.182, 4.18879, 180, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Mail vendor Matilda
DELETE FROM creature WHERE id=35500;
INSERT INTO `creature` VALUES (85225, 35500, 571, 0, 0, 1, 1, 29834, 0, 5664.53, 619.177, 648.189, 2.16421, 180, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Leather vendor Rafael.
DELETE FROM creature WHERE id=35497;
INSERT INTO `creature` VALUES (85219, 35497, 571, 0, 0, 1, 1, 29835, 0, 5672.55, 624.063, 648.189, 2.07694, 180, 0, 0, 1, 0, 0, 0, 0, 0, 0);


-- Flags for Paladin / Warrior vendors inside ICC, so they don't fight
 UPDATE creature_template SET unit_flags=768 WHERE entry IN(37688, 37696);
