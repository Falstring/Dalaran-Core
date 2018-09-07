
-- Despawn Koralon / Toravon. 

DELETE FROM creature WHERE id IN(35013, 38433);




-- Emalon's Lightning Nova

DELETE FROM spell_script_names WHERE spell_id=65279;
INSERT INTO spell_script_names (spell_id, scriptname) VALUES (65279, "spell_emalon_lightning_nova");



-- Koralon Spawn.

DELETE FROM creature WHERE id=35013;
INSERT INTO `creature` VALUES (202596, 35013, 624, 0, 0, 3, 1, 0, 0, -218.521, 104.391, 91.8297, 4.69494, 604800, 0, 0, 1, 0, 0, 0, 0, 0, 0);

-- Toravon Spawn.
DELETE FROM creature WHERE id=38433;
INSERT INTO `creature` VALUES (202600, 38433, 624, 0, 0, 3, 1, 0, 1, -43.3316, -288.708, 91.2511, 1.58825, 604800, 0, 0, 1, 0, 0, 0, 0, 0, 0);