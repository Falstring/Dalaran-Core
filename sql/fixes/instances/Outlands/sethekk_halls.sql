-- Anzu Intro
INSERT IGNORE INTO `creature_text`(`entry`, `groupid`, `text`, `type`, `probability`, `comment`) VALUES (23035, 3, 'No! How can this be?', 14, 100, 'Anzu - Intro 1');
INSERT IGNORE INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `type`, `probability`, `comment`) VALUES (23035, 3, 0, 'Pain will be the price for your insolence! You cannot stop me from claiming the Emerald Dream as my own!', 14, 100, 'Anzu - Intro 2');

-- Anzu Size
UPDATE `creature_template` SET `scale` = 1 WHERE `entry` = 23035;

-- Brood of Anzu (23132)
UPDATE creature_template SET InhabitType=4, AIName='SmartAI', ScriptName='' WHERE entry=23132;
DELETE FROM smart_scripts WHERE entryorguid=23132 AND source_type=0;
INSERT INTO smart_scripts VALUES (23132, 0, 0, 0, 0, 0, 100, 0, 4000, 6000, 10000, 15000, 11, 31273, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Brood of Anzu - In Combat - Cast Screech');

-- Invis Raven God Portal (23046)
UPDATE creature_template SET modelid1=19595, modelid2=0, unit_flags=33554432, InhabitType=4, flags_extra=130 WHERE entry=23046;
DELETE FROM smart_scripts WHERE entryorguid=23046 AND source_type=0;
DELETE FROM creature WHERE id=23046;
INSERT INTO `creature` VALUES (NULL, 23046, 556, 0, 0, 2, 1, 0, 0, -87.5742, 287.856, 26.4832, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);

-- Invis Raven God Target (23057)
UPDATE creature_template SET modelid1=21072, modelid2=0, speed_walk=0.6, speed_run=0.3, unit_flags=33554432, InhabitType=4, flags_extra=130 WHERE entry=23057;
DELETE FROM smart_scripts WHERE entryorguid=23057 AND source_type=0;
DELETE FROM creature WHERE id=23057;
INSERT INTO `creature` VALUES (NULL, 23057, 556, 0, 0, 2, 1, 0, 0, -87.5742, 287.856, 72.1732, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);

-- Invis Raven God Caster (23058)
UPDATE creature_template SET modelid1=19595, modelid2=0, unit_flags=33554432, InhabitType=4, flags_extra=130 WHERE entry=23058;
DELETE FROM smart_scripts WHERE entryorguid=23058 AND source_type=0;
DELETE FROM creature WHERE id=23058;

INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -78.6406, 314.065, 50.6387, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -55.7182, 259.118, 52.0431, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -59.9812, 259.033, 51.1026, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -108.501, 259.119, 51.9147, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -112.741, 259.033, 51.113, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -113.93, 314.073, 51.9899, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -109.626, 314.156, 51.0432, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -54.6649, 314.158, 51.2, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -58.9482, 314.073, 51.9842, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -82.6343, 314.15, 49.8822, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -88.0673, 259.12, 50.7045, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -79.9473, 259.116, 50.7386, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -84.1384, 258.797, 49.4472, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (NULL, 23058, 556, 0, 0, 2, 1, 0, 0, -86.8518, 314.041, 50.8063, 0, 86400, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0);

-- Beam Spell
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39978;
INSERT INTO conditions VALUES(13, 1, 39978, 0, 0, 31, 0, 3, 23057, 0, 0, 0, 0, '', '');

-- Anzu Spirits
UPDATE `creature_template` SET `unit_flags`=4104, `ScriptName`='npc_anzu_spirit' WHERE `Entry` IN (23134, 23136, 23135);

-- The Raven's Claw (185554)
UPDATE gameobject_template SET data3=60000 WHERE entry=185554;
DELETE FROM event_scripts WHERE id=14797;
UPDATE gameobject_template SET ScriptName='go_ravens_claw' WHERE entry=185554;