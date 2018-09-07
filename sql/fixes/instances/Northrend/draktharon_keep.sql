-- -------------------------------------------
-- DRAK'THARON KEEP
-- -------------------------------------------


-- Darkweb Victim (27909)
UPDATE creature_template SET unit_flags=262144|131072|4, flags_extra=2, AIName='SmartAI', ScriptName='' WHERE entry=27909;
DELETE FROM smart_scripts WHERE entryorguid=27909 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=-127420 AND source_type=0;
INSERT INTO smart_scripts VALUES (27909, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 49960, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Darkweb Victim - On Death - Cast Summon Random Drakkari');
INSERT INTO smart_scripts VALUES (-127420, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 49952, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Darkweb Victim - On Death - Cast Summon Kurzel');

-- SPELL Summon Random Drakkari (49960)
DELETE FROM spell_script_names WHERE spell_id IN(49960);
INSERT INTO spell_script_names VALUES(49960, 'spell_dtk_summon_random_drakkari');
