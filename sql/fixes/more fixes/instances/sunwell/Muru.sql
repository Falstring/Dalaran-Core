-- M'uru (25741)
REPLACE INTO creature_model_info VALUES (23200, 10, 12, 0, 0);
UPDATE creature_template SET unit_flags=4+131072, damagemodifier=70, mechanic_immune_mask=650854271, flags_extra=1|0x200000, AIName='', ScriptName='boss_muru' WHERE entry=25741;

-- Entropius (25840)
UPDATE creature_template SET damagemodifier=70, mechanic_immune_mask=650854271, flags_extra=1|0x200000, AIName='', ScriptName='boss_entropius' WHERE entry=25840;

-- M'uru Portal Target (25770)
UPDATE creature_template SET unit_flags=4, flags_extra=130, AIName='SmartAI', ScriptName='' WHERE entry=25770;
DELETE FROM smart_scripts WHERE entryorguid=25770 AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN(25770*100, 25770*100+1) AND source_type=9;
INSERT INTO smart_scripts VALUES (25770, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Reset - Set React Passive');
INSERT INTO smart_scripts VALUES (25770, 0, 1, 0, 8, 0, 100, 0, 45976, 0, 0, 0, 80, 25770*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Start Script');
INSERT INTO smart_scripts VALUES (25770, 0, 2, 0, 17, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - Just Summoned - Store Target');
INSERT INTO smart_scripts VALUES (25770, 0, 3, 0, 31, 0, 100, 0, 45989, 0, 0, 0, 86, 45988, 2, 12, 1, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - Spell Hit Target - Cross Cast Summon Void Sentinel');
INSERT INTO smart_scripts VALUES (25770, 0, 4, 0, 8, 0, 100, 0, 46177, 0, 0, 0, 80, 25770*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Start Script');
INSERT INTO smart_scripts VALUES (25770*100, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 11, 45977, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Open Portal');
INSERT INTO smart_scripts VALUES (25770*100, 9, 1, 0, 0, 0, 100, 0, 4500, 4500, 0, 0, 11, 45978, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Summon Void Sentinel Summoner');
INSERT INTO smart_scripts VALUES (25770*100, 9, 2, 0, 0, 0, 100, 0, 500, 500, 0, 0, 11, 45989, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Script9 - Cast Summon Void Sentinel Summoner Visual');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 0, 0, 0, 0, 100, 0, 200, 200, 0, 0, 11, 45977, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Open Portal');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 1, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 11, 46178, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 46208, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 3, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 11, 46178, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 46208, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 5, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 11, 46178, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 46208, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 7, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 11, 46178, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 46208, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 9, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 11, 46178, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');
INSERT INTO smart_scripts VALUES (25770*100+1, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 46208, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Muru Portal Target - On Spell Hit - Cast Transform Visual Missile');

-- Dark Fiend (25744)
UPDATE creature_template SET modelid1=23842, modelid2=0, speed_run=0.8, unit_flags=131072, flags_extra=2, AIName='SmartAI', ScriptName='' WHERE entry=25744; 
DELETE FROM smart_scripts WHERE entryorguid=25744 AND source_type=0;
INSERT INTO smart_scripts VALUES (25744, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dark Fiend - On Reset - Set React Passive');
INSERT INTO smart_scripts VALUES (25744, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 45934, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dark Fiend - On Reset - Cast Spell');
INSERT INTO smart_scripts VALUES (25744, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 11, 45936, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dark Fiend - On Reset - Cast Spell');
INSERT INTO smart_scripts VALUES (25744, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 42, 1, 100, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dark Fiend - On Reset - Set Invincibility hp');
INSERT INTO smart_scripts VALUES (25744, 0, 4, 0, 60, 0, 100, 1, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Dark Fiend - On Update - Set Follow');
INSERT INTO smart_scripts VALUES (25744, 0, 5, 6, 9, 0, 100, 1, 0, 4, 0, 0, 11, 45944, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dark Fiend - Within Range 0-5yd - Cast Spell');
INSERT INTO smart_scripts VALUES (25744, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dark Fiend - Within Range 0-5yd - Despawn');

-- Void Sentinel (25772)
UPDATE creature_template SET damagemodifier=70, AIName='SmartAI', ScriptName='' WHERE entry=25772;
DELETE FROM smart_scripts WHERE entryorguid=25772 AND source_type=0;
INSERT INTO smart_scripts VALUES (25772, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 11, 46086, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Reset - Cast Shadow Pulse Periodic');
INSERT INTO smart_scripts VALUES (25772, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Reset - Attack Start');
INSERT INTO smart_scripts VALUES (25772, 0, 2, 0, 0, 0, 100, 0, 20000, 20000, 45000, 45000, 11, 46161, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - In Combat - Cast Void Blast');
INSERT INTO smart_scripts VALUES (25772, 0, 3, 4, 6, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');
INSERT INTO smart_scripts VALUES (25772, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');
INSERT INTO smart_scripts VALUES (25772, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');
INSERT INTO smart_scripts VALUES (25772, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');
INSERT INTO smart_scripts VALUES (25772, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');
INSERT INTO smart_scripts VALUES (25772, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');
INSERT INTO smart_scripts VALUES (25772, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');
INSERT INTO smart_scripts VALUES (25772, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46071, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Sentinel - On Death - Cast Summon Void Spawn');

-- Void Spawn (25824)
UPDATE creature_template SET damagemodifier=10, AIName='SmartAI', ScriptName='' WHERE entry=25824;
DELETE FROM smart_scripts WHERE entryorguid=25824 AND source_type=0;
INSERT INTO smart_scripts VALUES (25824, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Void Spawn - On Reset - Attack Start');
INSERT INTO smart_scripts VALUES (25824, 0, 1, 0, 0, 0, 100, 0, 3000, 12000, 15000, 20000, 11, 46082, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Spawn - In Combat - Cast Shadow Bolt Volley');

-- Shadowsword Fury Mage (25799)
UPDATE creature_template SET damagemodifier=14, AIName='SmartAI', ScriptName='' WHERE entry=25799;
DELETE FROM smart_scripts WHERE entryorguid=25799 AND source_type=0;
INSERT INTO smart_scripts VALUES (25799, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Shadowsword Fury Mage - On Reset - Attack Start');
INSERT INTO smart_scripts VALUES (25799, 0, 1, 0, 0, 0, 100, 0, 1000, 1000, 5000, 5000, 11, 46101, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shadowsword Fury Mage - In Combat - Cast Fel Fireball');
INSERT INTO smart_scripts VALUES (25799, 0, 2, 0, 0, 0, 100, 0, 15000, 15000, 45000, 45000, 11, 46102, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadowsword Fury Mage - In Combat - Cast Spell Fury');

-- Shadowsword Berserker (25798)
UPDATE creature_template SET damagemodifier=14, AIName='SmartAI', ScriptName='' WHERE entry=25798;
DELETE FROM smart_scripts WHERE entryorguid=25798 AND source_type=0;
INSERT INTO smart_scripts VALUES (25798, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Shadowsword Berserker - On Reset - Attack Start');
INSERT INTO smart_scripts VALUES (25798, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 29651, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadowsword Berserker - On Reset - Cast Dual Wield');
INSERT INTO smart_scripts VALUES (25798, 0, 2, 0, 0, 0, 100, 0, 10000, 10000, 20000, 20000, 11, 46160, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Shadowsword Berserker - In Combat - Cast Flurry');

-- Darkness (25879)
UPDATE creature_template SET flags_extra=130, AIName='NullCreatureAI', ScriptName='' WHERE entry=25879;
REPLACE INTO creature_template_addon VALUES (25879, 0, 0, 0, 0, 0, '46262 46265');

-- Singularity (25855)
UPDATE creature_template SET faction=14, flags_extra=130, AIName='', ScriptName='npc_singularity' WHERE entry=25855;
REPLACE INTO creature_template_addon VALUES (25855, 0, 0, 0, 0, 0, '');

-- SPELL Negative Energy (46008)
DELETE FROM spell_script_names WHERE spell_id IN(46008);
INSERT INTO spell_script_names VALUES (46008, 'spell_gen_select_target_count_15_5');

-- SPELL Summon Blood Elves Periodic (46041)
DELETE FROM spell_script_names WHERE spell_id IN(46041);
INSERT INTO spell_script_names VALUES (46041, 'spell_muru_summon_blood_elves_periodic');

-- SPELL Darkness (45996)
DELETE FROM spell_script_names WHERE spell_id IN(45996);
INSERT INTO spell_script_names VALUES (45996, 'spell_muru_darkness');

-- SPELL Open Portal (45976)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=45976;
INSERT INTO conditions VALUES(13, 1, 45976, 0, 0, 31, 0, 3, 25770, 0, 0, 0, 0, '', 'Target Muru Portal Target');
DELETE FROM spell_script_names WHERE spell_id IN(45976);
INSERT INTO spell_script_names VALUES (45976, 'spell_gen_select_target_count_7_1');

-- SPELL Open All Portals (46177)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=46177;
INSERT INTO conditions VALUES(13, 1, 46177, 0, 0, 31, 0, 3, 25770, 0, 0, 0, 0, '', 'Target Muru Portal Target');

-- SPELL Transform Visual Missile (46178)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=46178;
INSERT INTO conditions VALUES(13, 1, 46178, 0, 0, 31, 0, 3, 25741, 0, 0, 0, 0, '', 'Target Muru');

-- SPELL Transform Visual Missile (46208)
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=46208;
INSERT INTO conditions VALUES(13, 1, 46208, 0, 0, 31, 0, 3, 25741, 0, 0, 0, 0, '', 'Target Muru');

-- SPELL Negative Energy (46289)
DELETE FROM spell_script_names WHERE spell_id IN(46289);
INSERT INTO spell_script_names VALUES (46289, 'spell_entropius_negative_energy');

-- SPELL Void Zone Pre-effect Visual (46265)
DELETE FROM spell_script_names WHERE spell_id IN(46265);
INSERT INTO spell_script_names VALUES (46265, 'spell_entropius_void_zone_visual');

-- SPELL Black Hole Effect (46230)
DELETE FROM spell_script_names WHERE spell_id IN(46230);
INSERT INTO spell_script_names VALUES (46230, 'spell_entropius_black_hole_effect');

-- SPELL Summon Berserker (46037)
-- SPELL Summon Fury Mage (46038)
-- SPELL Summon Fury Mage (46039)
-- SPELL Summon Berserker (46040)
DELETE FROM spell_target_position WHERE id IN(46037, 46038, 46039, 46040);
INSERT INTO spell_target_position VALUES (46037, 0, 580, 1780.16, 666.83, 71.19, 5.21);
INSERT INTO spell_target_position VALUES (46038, 0, 580, 1780.16, 666.83, 71.19, 5.21);
INSERT INTO spell_target_position VALUES (46039, 0, 580, 1847.93, 600.30, 71.30, 2.57);
INSERT INTO spell_target_position VALUES (46040, 0, 580, 1847.93, 600.30, 71.30, 2.57);