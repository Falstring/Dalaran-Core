-- Inhabyt type for the Val'Kyrs

UPDATE creature_template SET InhabitType=4 WHERE entry IN(34496, 34497, 35347, 35348, 35349, 34497, 35350, 35351, 35352);


-- Bullet/orbs speed.

UPDATE creature_template SET speed_run=0.9 WHERE entry IN(34628, 34630,35353, 35354, 35355, 35356, 35357, 35358);





DELETE FROM `spell_script_names` WHERE spell_id IN(67297, 67298, 67282, 67283);

INSERT INTO `spell_script_names` VALUES (67297, 'spell_twin_valkyr_touchof_light');
INSERT INTO `spell_script_names` VALUES (67298, 'spell_twin_valkyr_touchof_light');

INSERT INTO `spell_script_names` VALUES (67282, 'spell_twin_valkyr_touchof_darkness');
INSERT INTO `spell_script_names` VALUES (67283, 'spell_twin_valkyr_touchof_darkness');
