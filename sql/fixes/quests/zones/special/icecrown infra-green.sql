-- BEGIN INFRA-GREEN QUESTS ----------------------------------------------
-- Leading the Charge -- (A) http://www.wowhead.com/quest=13380/leading-the-charge (ALLIANCE SHORT)
-- Watts My Target -- (A) http://www.wowhead.com/quest=13381/watts-my-target (ALLIANCE LONG)
-- Static Shock Troops: the Bombardment -- (A) http://www.wowhead.com/quest=13404/static-shock-troops-the-bombardment (ALLIANCE SHORT DAILY)
-- Putting the Hertz: The Valley of Lost Hope -- (A) http://www.wowhead.com/quest=13382/putting-the-hertz-the-valley-of-lost-hope (ALLIANCE LONG DAILY)
-- Fringe Science Benefits -- (H) http://www.wowhead.com/quest=13373/fringe-science-benefits (HORDE SHORT)
-- Amped for Revolt! -- (H) http://www.wowhead.com/quest=13374/amped-for-revolt (HORDE LONG)
-- Riding the Wavelength: The Bombardment -- (H) http://www.wowhead.com/quest=13406/riding-the-wavelength-the-bombardment (HORDE SHORT DAILY)
-- Total Ohmage: The Valley of Lost Hope! -- (H) http://www.wowhead.com/quest=13376/total-ohmage-the-valley-of-lost-hope (HORDE LONG DAILY)
-- -----------------------------------------------------------------------

-- Fix Missing NPCs
-- Rizzy Ratchwiggle (H)
DELETE FROM creature WHERE id=31839 and guid=12571;
INSERT INTO creature VALUES(12571, 31839, 571, 0, 0, 1, 1, 0, 0, 7884.2, 2057.69, 600.26, 3.1196, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0);

-- Kibli Killohertz (A)
DELETE FROM creature_addon WHERE guid IN( SELECT guid FROM creature WHERE id=32444 );
DELETE FROM creature WHERE id=32444 and guid=1528;
INSERT INTO creature VALUES(1528, 32444, 571, 0, 0, 1, 1, 0, 0, 7623.05, 2060.18, 600.258, 0.010155, 300, 0, 0, 12600, 3994, 0, 0, 0, 0, 0);

-- Fringe Engineer Tezzla (H)
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=32430);
DELETE FROM creature WHERE id=32430 and guid=27289;
INSERT INTO creature VALUES(27289, 32430, 571, 0, 0, 1, 1, 0, 0, 7897.96, 2057.59, 600.259, 3.10624, 300, 0, 0, 12600, 3994, 0, 0, 0, 0, 0);

-- Fix Bomber Givers
UPDATE creature_template SET npcflag=npcflag|1, exp=2, minlevel=80, maxlevel=80, gossip_menu_id=10119, AIName='SmartAI', ScriptName='' WHERE entry=31648;
UPDATE creature_template SET npcflag=npcflag|1, exp=2, minlevel=80, maxlevel=80, gossip_menu_id=10120, AIName='SmartAI', ScriptName='' WHERE entry=31839;

-- Fix Quests
DELETE from quest_template_addon WHERE ID=13404;
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`)
VALUES
    (13404, 0, 0, 0, 13381, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

DELETE FROM smart_scripts WHERE entryorguid IN(31648, 31839) AND source_type=0;
INSERT INTO smart_scripts VALUES(31648, 0, 0, 2, 62, 0, 100, 0, 10119, 0, 0, 0, 85, 59552, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31648, 0, 1, 2, 62, 0, 100, 0, 10119, 1, 0, 0, 85, 61151, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31648, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Close gossip');
INSERT INTO smart_scripts VALUES(31839, 0, 0, 2, 62, 0, 100, 0, 10120, 0, 0, 0, 85, 59780, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31839, 0, 1, 2, 62, 0, 100, 0, 10120, 1, 0, 0, 85, 61152, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Invoker cast');
INSERT INTO smart_scripts VALUES(31839, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Gossip Select - Close gossip');

DELETE FROM conditions WHERE SourceTypeOrReferenceID=15 AND SourceGroup IN(10119, 10120);
INSERT INTO conditions VALUES (15, 10120, 0, 0, 0, 9, 0, 13373, 0, 0, 0, 0, 0, '', 'show gossip on quest 13373 taken');
INSERT INTO conditions VALUES (15, 10120, 0, 0, 1, 9, 0, 13406, 0, 0, 0, 0, 0, '', 'show gossip on quest 13406 taken');
INSERT INTO conditions VALUES (15, 10120, 1, 0, 0, 9, 0, 13374, 0, 0, 0, 0, 0, '', 'show gossip on quest 13374 taken');
INSERT INTO conditions VALUES (15, 10120, 1, 0, 1, 9, 0, 13376, 0, 0, 0, 0, 0, '', 'show gossip on quest 13376 taken');
INSERT INTO conditions VALUES (15, 10119, 0, 0, 0, 9, 0, 13404, 0, 0, 0, 0, 0, '', 'show gossip on quest 13404 taken');
INSERT INTO conditions VALUES (15, 10119, 0, 0, 1, 9, 0, 13380, 0, 0, 0, 0, 0, '', 'show gossip on quest 13380 taken');
INSERT INTO conditions VALUES (15, 10119, 1, 0, 0, 9, 0, 13381, 0, 0, 0, 0, 0, '', 'show gossip on quest 13381 taken');
INSERT INTO conditions VALUES (15, 10119, 1, 0, 1, 9, 0, 13382, 0, 0, 0, 0, 0, '', 'show gossip on quest 13382 taken');

DELETE FROM gossip_menu_option WHERE menu_id IN(10120, 10119);
INSERT INTO gossip_menu_option VALUES (10119, 0, 0, 'Give me a bomber for a short ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10119, 1, 0, 'Give me a bomber for a long ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10120, 0, 0, 'Give me a bomber for a short ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);
INSERT INTO gossip_menu_option VALUES (10120, 1, 0, 'Give me a bomber for a long ride!', 0, 1, 1, 0, 0, 0, 0, '', 0);

-- Correct spawn trigger positions
UPDATE creature_template SET InhabitType=4, flags_extra=130 WHERE entry=31690;
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=31690 AND position_z < 610);
DELETE FROM creature WHERE id=31690 AND position_z < 610;
UPDATE creature SET position_z=620, spawndist=0, MovementType=0 WHERE id=31690;

-- Summoning spells target conditions
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(59552, 59780, 61151, 61152);
INSERT INTO conditions VALUES (13, 1, 59552, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');
INSERT INTO conditions VALUES (13, 1, 59780, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');
INSERT INTO conditions VALUES (13, 1, 61151, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');
INSERT INTO conditions VALUES (13, 1, 61152, 0, 0, 31, 0, 3, 31690, 0, 0, 0, 0, '', 'Target Infra-Green Flight Master');

-- Fix switching spells
DELETE FROM spell_script_names WHERE spell_id IN(59196, 59194, 59193);
INSERT INTO spell_script_names VALUES(59196, 'spell_switch_infragreen_bomber_station');
INSERT INTO spell_script_names VALUES(59194, 'spell_switch_infragreen_bomber_station');
INSERT INTO spell_script_names VALUES(59193, 'spell_switch_infragreen_bomber_station');
DELETE FROM spell_script_names WHERE spell_id IN(59061, 59288);
INSERT INTO spell_script_names VALUES(59061, 'spell_charge_shield_bomber');
INSERT INTO spell_script_names VALUES(59288, 'spell_charge_shield_bomber');
DELETE FROM spell_script_names WHERE spell_id IN(61093);
INSERT INTO spell_script_names VALUES(61093, 'spell_fight_fire_bomber');
DELETE FROM spell_script_names WHERE spell_id IN(59622);
INSERT INTO spell_script_names VALUES(59622, 'spell_anti_air_rocket_bomber');

-- Fix Quest creatures
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id=32769);
DELETE FROM creature_formations WHERE leaderGUID IN(SELECT guid FROM creature WHERE id=32769);
DELETE FROM creature WHERE id=32769 AND guid IN(78842,78843,78844,78845,78846,78847,78848,78849,78850,78851,78852,78853,78854,78855,78856,78857,78858,78859,78860,78861,78862,78863,78864);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES 
    (78842, 32769, 571, 0, 0, 1, 1, 25753, 0, 7523.09, 1852.78, 491.641, 1.16008, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78843, 32769, 571, 0, 0, 1, 1, 25753, 0, 7523.09, 1852.78, 491.641, 3.23212, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78844, 32769, 571, 0, 0, 1, 1, 25753, 0, 7703.2, 1822.89, 469.378, 3.47223, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78845, 32769, 571, 0, 0, 1, 1, 25753, 0, 7703.2, 1822.89, 469.378, 3.94286, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78846, 32769, 571, 0, 0, 1, 1, 25753, 0, 7770.85, 1626.59, 469.378, 4.35007, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78847, 32769, 571, 0, 0, 1, 1, 25753, 0, 7770.85, 1626.59, 469.378, 0.010103, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78848, 32769, 571, 0, 0, 1, 1, 25753, 0, 7733.55, 1578.02, 469.378, 3.23125, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78849, 32769, 571, 0, 0, 1, 1, 25753, 0, 7733.55, 1578.02, 469.378, 2.51066, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78850, 32769, 571, 0, 0, 1, 1, 25753, 0, 7700.71, 1866.03, 464.062, 0.0335467, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78851, 32769, 571, 0, 0, 1, 1, 25753, 0, 7634.01, 1863.8, 453.321, 0.100306, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78852, 32769, 571, 0, 0, 1, 1, 25753, 0, 7735.12, 1823.7, 464.062, 0.0335467, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78853, 32769, 571, 0, 0, 1, 1, 25753, 0, 7783.46, 1783.04, 469.012, 0.0335467, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78854, 32769, 571, 0, 0, 1, 1, 25753, 0, 7838.73, 1761.25, 466.425, 4.96978, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78855, 32769, 571, 0, 0, 1, 1, 25753, 0, 7763.36, 1704.4, 459.294, 3.89379, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78856, 32769, 571, 0, 0, 1, 1, 25753, 0, 7685.98, 1708.66, 460.417, 3.89379, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78857, 32769, 571, 0, 0, 1, 1, 25753, 0, 7711.54, 1636.03, 447.492, 4.85589, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78858, 32769, 571, 0, 0, 1, 1, 25753, 0, 7630.44, 1601.94, 445.692, 2.12271, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78859, 32769, 571, 0, 0, 1, 1, 25753, 0, 7559.02, 1547.51, 435.682, 1.52973, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78860, 32769, 571, 0, 0, 1, 1, 25753, 0, 7695.42, 1557.94, 483.848, 2.97487, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78861, 32769, 571, 0, 0, 1, 1, 25753, 0, 7681.77, 1636.37, 491.285, 2.97487, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78862, 32769, 571, 0, 0, 1, 1, 25753, 0, 7651.87, 1722.94, 495.997, 2.97487, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78863, 32769, 571, 0, 0, 1, 1, 25753, 0, 7725.34, 1767.48, 510.085, 6.28139, 10, 60, 0, 12600, 3994, 1, 0, 0, 0, 0),
    (78864, 32769, 571, 0, 0, 1, 1, 25753, 0, 7791.85, 1708.06, 518.138, 6.28139, 300, 60, 0, 12600, 3994, 1, 0, 0, 0, 0);

UPDATE creature SET MovementType=1 WHERE id=32769;

UPDATE creature_template SET KillCredit2=32188, AIName='', ScriptName='npc_gargoyle_ambusher' WHERE entry=32769; -- Gargoyle Ambusher
DELETE FROM smart_scripts WHERE entryorguid=32769 AND source_type=0;

DELETE FROM creature_template_addon WHERE entry=32767;
INSERT INTO creature_template_addon VALUES (32767, 0, 0, 50331648, 0, 0, '');
DELETE FROM creature WHERE id=32767 AND guid IN(76053,76054,76055,76056,76057,76058,76059,76060);
INSERT INTO creature VALUES
    (76053, 32767, 571, 0, 0, 1, 1, 27064, 0, 7244.55, 1285.52, 416.07, 2.71176, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (76054, 32767, 571, 0, 0, 1, 1, 27064, 0, 7134.18, 1373.87, 408.537, 5.90048, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (76055, 32767, 571, 0, 0, 1, 1, 27064, 0, 7155.42, 1211.4, 386.189, 5.49993, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (76056, 32767, 571, 0, 0, 1, 1, 27064, 0, 7302.18, 1240.95, 390.122, 0.418399, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (76057, 32767, 571, 0, 0, 1, 1, 27064, 0, 7333.87, 1348.77, 393.362, 0.418399, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (76058, 32767, 571, 0, 0, 1, 1, 27064, 0, 7239.56, 1441.97, 384.094, 4.94622, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (76059, 32767, 571, 0, 0, 1, 1, 27064, 0, 7407.94, 1436.64, 390.421, 0.300584, 10, 60, 0, 25200, 0, 1, 0, 0, 0, 0),
    (76060, 32767, 571, 0, 0, 1, 1, 27064, 0, 7526.03, 1354.32, 401.356, 0.300584, 300, 60, 0, 25200, 0, 1, 0, 0, 0, 0);

UPDATE creature_template SET KillCredit1=31721, AIName='', ScriptName='npc_frostbrood_sentry' WHERE entry=32767; -- Frostbrood Sentry
DELETE FROM smart_scripts WHERE entryorguid=32767 AND source_type=0;

UPDATE creature_template SET KillCredit1=32410 WHERE entry=32771; -- Bombardment Captain
UPDATE creature_template SET KillCredit1=32399 WHERE entry=31812; -- Decomposed Ghoul
UPDATE creature_template SET KillCredit1=32410 WHERE entry=31815; -- Bone Giant

UPDATE creature_template SET minlevel=80, maxlevel=80, faction=21, AIName='SmartAI', ScriptName='' WHERE entry=32154;
DELETE FROM smart_scripts WHERE entryorguid=32154 AND source_type=0;
INSERT INTO smart_scripts VALUES(32154, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 52324, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Death - Cast Spell Scourgewagon Explosion');
UPDATE creature_template SET modelid1=15958, modelid2=12818, modelid3=15962, minlevel=80, maxlevel=80, faction=21, mechanic_immune_mask=8388624 WHERE entry=32410;
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(32154, 32410));
DELETE FROM creature WHERE id IN(32154, 32410) and guid IN(134849,134850,134851,134852,134853,134854,134855,134856,134857,134858,134859,134860,134861,134862,134863,134864,134865,134866,134867,134868,134869,134870,134871,134872,134873,134874,134875,134876,134877,134878,134879,134880,134881,134882,134883,134884,134885,134886,134887,134888,134889);
INSERT INTO creature VALUES
    (134849, 32154, 571, 0, 0, 1, 1, 0, 0, 7707.46, 1695.11, 341.05, 4.43793, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134850, 32154, 571, 0, 0, 1, 1, 0, 0, 7724.26, 1771.43, 348.847, 1.70868, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134851, 32154, 571, 0, 0, 1, 1, 0, 0, 7826.99, 1768.44, 358.238, 2.96924, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134852, 32154, 571, 0, 0, 1, 1, 0, 0, 7851.09, 1955.81, 367.002, 1.97571, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134853, 32154, 571, 0, 0, 1, 1, 0, 0, 7842.81, 1840.36, 365.721, 4.29656, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134854, 32154, 571, 0, 0, 1, 1, 0, 0, 7795.76, 1835.98, 362.766, 4.24158, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134855, 32154, 571, 0, 0, 1, 1, 0, 0, 7813.27, 1662.84, 356.26, 6.26398, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134856, 32154, 571, 0, 0, 1, 1, 0, 0, 7202.76, 1316.63, 305.442, 3.29517, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134857, 32154, 571, 0, 0, 1, 1, 0, 0, 7220.64, 1216.06, 307.663, 1.15889, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134858, 32154, 571, 0, 0, 1, 1, 0, 0, 7129.91, 1155.77, 305.815, 1.17067, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134859, 32154, 571, 0, 0, 1, 1, 0, 0, 7144.89, 1115.43, 314.937, 5.51785, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134860, 32154, 571, 0, 0, 1, 1, 0, 0, 7172.32, 1152.7, 309.25, 6.03229, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134861, 32154, 571, 0, 0, 1, 1, 0, 0, 7173.22, 1185.4, 308.278, 6.03229, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134862, 32154, 571, 0, 0, 1, 1, 0, 0, 7153.32, 1234.99, 301.82, 4.89346, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134863, 32154, 571, 0, 0, 1, 1, 0, 0, 7737.62, 1637.87, 346.603, 4.43793, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134864, 32154, 571, 0, 0, 1, 1, 0, 0, 7611.61, 1651.27, 342.069, 1.94822, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134865, 32154, 571, 0, 0, 1, 1, 0, 0, 7616.57, 1716.3, 344.036, 1.94822, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134866, 32154, 571, 0, 0, 1, 1, 0, 0, 7232.34, 1365.87, 309.911, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134867, 32154, 571, 0, 0, 1, 1, 0, 0, 7179.8, 1368.87, 310.435, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134868, 32154, 571, 0, 0, 1, 1, 0, 0, 7163.97, 1335.66, 307.248, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134869, 32154, 571, 0, 0, 1, 1, 0, 0, 7142.1, 1313.45, 303.877, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134870, 32154, 571, 0, 0, 1, 1, 0, 0, 7124.12, 1286.83, 299.649, 3.61719, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134871, 32154, 571, 0, 0, 1, 1, 0, 0, 7119.05, 1254.62, 297.911, 4.89346, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134872, 32154, 571, 0, 0, 1, 1, 0, 0, 7553.98, 2091.65, 500.312, 3.96984, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134873, 32154, 571, 0, 0, 1, 1, 0, 0, 7540, 2101.52, 500.312, 4.12692, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134874, 32154, 571, 0, 0, 1, 1, 0, 0, 7534.32, 2014.59, 500.312, 1.81785, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134875, 32154, 571, 0, 0, 1, 1, 0, 0, 7515.71, 2002.49, 500.273, 2.21054, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134876, 32154, 571, 0, 0, 1, 1, 0, 0, 7494.5, 2011.03, 500.273, 0.561207, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134877, 32154, 571, 0, 0, 1, 1, 0, 0, 7512.02, 2044.56, 499.729, 2.22232, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134878, 32154, 571, 0, 0, 1, 1, 0, 0, 7488.65, 2092.86, 499.729, 1.20523, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134879, 32154, 571, 0, 0, 1, 1, 0, 0, 7471.24, 2101.12, 499.729, 1.03637, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134880, 32154, 571, 0, 0, 1, 1, 0, 0, 7513.48, 2121.57, 500.311, 3.50645, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134881, 32154, 571, 0, 0, 1, 1, 0, 0, 7471.66, 2146.02, 500.311, 4.16618, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134882, 32154, 571, 0, 0, 1, 1, 0, 0, 7459.63, 2151.93, 500.311, 4.22509, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134883, 32154, 571, 0, 0, 1, 1, 0, 0, 7446.16, 2156.28, 500.311, 4.29577, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134884, 32154, 571, 0, 0, 1, 1, 0, 0, 7457.32, 2110.68, 499.729, 1.0992, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134885, 32154, 571, 0, 0, 1, 1, 0, 0, 7426.65, 2167.64, 500.312, 4.42536, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134886, 32154, 571, 0, 0, 1, 1, 0, 0, 7421.56, 2149.44, 500.312, 6.19643, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134887, 32154, 571, 0, 0, 1, 1, 0, 0, 7530.32, 2108.52, 500.312, 4.19759, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134888, 32154, 571, 0, 0, 1, 1, 0, 0, 7600.73, 2060.82, 500.068, 3.10982, 60, 0, 0, 31500, 0, 0, 0, 0, 0, 0),
    (134889, 32154, 571, 0, 0, 1, 1, 0, 0, 7741.72, 1968.48, 367.425, 0.935059, 300, 0, 0, 31500, 0, 0, 0, 0, 0, 0);

-- Alliance Infra-green Bomber (31406), short
-- Alliance Infra-green Bomber (32512), long
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=273, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=31406;
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=273, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=32512;
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31406, 32512);
INSERT INTO npc_spellclick_spells VALUES (31406, 46598, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (32512, 46598, 1, 0);
DELETE FROM vehicle_template_accessory WHERE entry IN(31406, 32512);
INSERT INTO vehicle_template_accessory VALUES (31406, 31408, 0, 1, 'Alliance Bomber Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 31407, 1, 1, 'Alliance Turret Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 31409, 2, 1, 'Alliance Engineering Seat on rides Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32217, 3, 1, 'Banner Bunny, Hanging, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32221, 4, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32221, 5, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32256, 6, 1, 'Shield Visual Loc Bunny on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31406, 32274, 7, 1, 'Alliance Bomber Pilot rides Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 31408, 0, 1, 'Alliance Bomber Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 31407, 1, 1, 'Alliance Turret Seat on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 31409, 2, 1, 'Alliance Engineering Seat on rides Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32217, 3, 1, 'Banner Bunny, Hanging, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32221, 4, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32221, 5, 1, 'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32256, 6, 1, 'Shield Visual Loc Bunny on Alliance Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32512, 32274, 7, 1, 'Alliance Bomber Pilot rides Alliance Infra-green Bomber', 8, 0);
DELETE FROM waypoints WHERE entry=31406;
INSERT INTO waypoints VALUES (31406, 1, 7753.45, 2044.47, 592.04, 'Alliance Infra-green Bomber - Short'),(31406, 2, 7766.17, 2004.16, 575.364, 'Alliance Infra-green Bomber - Short'),(31406, 3, 7804.4, 1951.74, 549.136, 'Alliance Infra-green Bomber - Short'),(31406, 4, 7825.09, 1928.68, 532.879, 'Alliance Infra-green Bomber - Short'),(31406, 5, 7866.31, 1885.58, 496.232, 'Alliance Infra-green Bomber - Short'),(31406, 6, 7895.59, 1845.43, 466.525, 'Alliance Infra-green Bomber - Short'),(31406, 7, 7883.56, 1804.89, 449.938, 'Alliance Infra-green Bomber - Short'),(31406, 8, 7837, 1801.84, 435.217, 'Alliance Infra-green Bomber - Short'),(31406, 9, 7815.85, 1813.61, 431.672, 'Alliance Infra-green Bomber - Short'),(31406, 10, 7772.53, 1841.07, 431.172, 'Alliance Infra-green Bomber - Short'),(31406, 11, 7739.59, 1852.73, 430.873, 'Alliance Infra-green Bomber - Short'),(31406, 12, 7701.6, 1856.26, 428.418, 'Alliance Infra-green Bomber - Short'),
(31406, 13, 7658.51, 1855.49, 430.772, 'Alliance Infra-green Bomber - Short'),(31406, 14, 7634.45, 1847.34, 432.35, 'Alliance Infra-green Bomber - Short'),(31406, 15, 7587.81, 1815.65, 431.884, 'Alliance Infra-green Bomber - Short'),(31406, 16, 7577.23, 1780.84, 425.398, 'Alliance Infra-green Bomber - Short'),(31406, 17, 7588.97, 1748.31, 416.64, 'Alliance Infra-green Bomber - Short'),(31406, 18, 7606.15, 1728.53, 411.093, 'Alliance Infra-green Bomber - Short'),(31406, 19, 7635.87, 1700.63, 410.406, 'Alliance Infra-green Bomber - Short'),(31406, 20, 7661.84, 1677.63, 415.037, 'Alliance Infra-green Bomber - Short'),(31406, 21, 7683.93, 1657.1, 418.071, 'Alliance Infra-green Bomber - Short'),(31406, 22, 7730.4, 1647.6, 420.767, 'Alliance Infra-green Bomber - Short'),(31406, 23, 7760.93, 1663.64, 426.739, 'Alliance Infra-green Bomber - Short'),(31406, 24, 7817.86, 1688.59, 436.1, 'Alliance Infra-green Bomber - Short'),(31406, 25, 7857.05, 1734.45, 413.059, 'Alliance Infra-green Bomber - Short'),
(31406, 26, 7865.85, 1752.09, 411.13, 'Alliance Infra-green Bomber - Short'),(31406, 27, 7873.44, 1803.01, 416.629, 'Alliance Infra-green Bomber - Short'),(31406, 28, 7853.76, 1838.35, 425.217, 'Alliance Infra-green Bomber - Short'),(31406, 29, 7816.59, 1856.3, 430.695, 'Alliance Infra-green Bomber - Short'),(31406, 30, 7778.95, 1853.29, 432.243, 'Alliance Infra-green Bomber - Short'),(31406, 31, 7750.59, 1828.18, 431.892, 'Alliance Infra-green Bomber - Short'),(31406, 32, 7735.12, 1799.6, 429.134, 'Alliance Infra-green Bomber - Short'),(31406, 33, 7720.96, 1767.72, 426.263, 'Alliance Infra-green Bomber - Short'),(31406, 34, 7709.29, 1745.03, 423.882, 'Alliance Infra-green Bomber - Short'),(31406, 35, 7687.72, 1717.87, 419.22, 'Alliance Infra-green Bomber - Short'),(31406, 36, 7663.97, 1692.6, 414.53, 'Alliance Infra-green Bomber - Short'),(31406, 37, 7639.08, 1668.44, 409.85, 'Alliance Infra-green Bomber - Short'),(31406, 38, 7606.57, 1637.13, 404.108, 'Alliance Infra-green Bomber - Short'),(31406, 39, 7614.29, 1603.57, 397.91, 'Alliance Infra-green Bomber - Short'),
(31406, 40, 7624.51, 1570.93, 390.542, 'Alliance Infra-green Bomber - Short'),(31406, 41, 7634.43, 1530.19, 382.105, 'Alliance Infra-green Bomber - Short'),(31406, 42, 7613.33, 1494.48, 381.294, 'Alliance Infra-green Bomber - Short'),(31406, 43, 7584.1, 1491.31, 387.931, 'Alliance Infra-green Bomber - Short'),(31406, 44, 7555.27, 1497.66, 401.862, 'Alliance Infra-green Bomber - Short'),(31406, 45, 7523.53, 1511.46, 421.102, 'Alliance Infra-green Bomber - Short'),(31406, 46, 7489.08, 1510.24, 431.514, 'Alliance Infra-green Bomber - Short'),(31406, 47, 7477.76, 1486.37, 435.962, 'Alliance Infra-green Bomber - Short'),(31406, 48, 7498.74, 1445.82, 440.44, 'Alliance Infra-green Bomber - Short'),(31406, 49, 7532.11, 1412.9, 448.849, 'Alliance Infra-green Bomber - Short'),(31406, 50, 7563.08, 1404.79, 453.795, 'Alliance Infra-green Bomber - Short'),(31406, 51, 7601.4, 1415.79, 458.653, 'Alliance Infra-green Bomber - Short'),(31406, 52, 7626.93, 1435.78, 461.89, 'Alliance Infra-green Bomber - Short'),(31406, 53, 7641.68, 1453.63, 464.418, 'Alliance Infra-green Bomber - Short'),(31406, 54, 7660.38, 1501.85, 472.969, 'Alliance Infra-green Bomber - Short'),
(31406, 55, 7668.88, 1535.63, 476.438, 'Alliance Infra-green Bomber - Short'),(31406, 56, 7676.59, 1569.65, 479.256, 'Alliance Infra-green Bomber - Short'),(31406, 57, 7685.44, 1599.73, 482.085, 'Alliance Infra-green Bomber - Short'),(31406, 58, 7698.4, 1631.93, 486.528, 'Alliance Infra-green Bomber - Short'),(31406, 59, 7713.19, 1663.23, 491.681, 'Alliance Infra-green Bomber - Short'),(31406, 60, 7743.51, 1725.39, 502.409, 'Alliance Infra-green Bomber - Short'),(31406, 61, 7760.73, 1755.16, 508.887, 'Alliance Infra-green Bomber - Short'),(31406, 62, 7777.56, 1785.01, 515.946, 'Alliance Infra-green Bomber - Short'),(31406, 63, 7787.84, 1815.11, 522.388, 'Alliance Infra-green Bomber - Short'),(31406, 64, 7788.78, 1851.14, 531.797, 'Alliance Infra-green Bomber - Short'),(31406, 65, 7785.71, 1884.7, 541.23, 'Alliance Infra-green Bomber - Short'),(31406, 66, 7783.92, 1918.17, 551.305, 'Alliance Infra-green Bomber - Short'),(31406, 67, 7782.55, 1974.89, 569.197, 'Alliance Infra-green Bomber - Short'),
(31406, 68, 7779.93, 2000.37, 585.416, 'Alliance Infra-green Bomber - Short'),(31406, 69, 7633.95, 2061.49, 618.75, 'Alliance Infra-green Bomber - Short');
DELETE FROM waypoints WHERE entry=32512;
INSERT INTO waypoints VALUES (32512, 1, 7740.12, 2037.47, 594.088, 'Alliance Infra-green Bomber - Long'),(32512, 2, 7742.67, 2023.95, 583.412, 'Alliance Infra-green Bomber - Long'),(32512, 3, 7740.06, 1991.28, 559.206, 'Alliance Infra-green Bomber - Long'),(32512, 4, 7728.47, 1976.46, 540.522, 'Alliance Infra-green Bomber - Long'),(32512, 5, 7710.74, 1968.24, 523.864, 'Alliance Infra-green Bomber - Long'),(32512, 6, 7684.83, 1956.37, 503.568, 'Alliance Infra-green Bomber - Long'),(32512, 7, 7633.76, 1925.8, 466.762, 'Alliance Infra-green Bomber - Long'),(32512, 8, 7608.49, 1909.46, 448.915, 'Alliance Infra-green Bomber - Long'),(32512, 9, 7583.64, 1878.65, 428.868, 'Alliance Infra-green Bomber - Long'),(32512, 10, 7594.58, 1848.98, 417.143, 'Alliance Infra-green Bomber - Long'),(32512, 11, 7623.07, 1838.43, 407.831, 'Alliance Infra-green Bomber - Long'),(32512, 12, 7660.62, 1844.98, 397.19, 'Alliance Infra-green Bomber - Long'),(32512, 13, 7678.44, 1849.78, 394.788, 'Alliance Infra-green Bomber - Long'),(32512, 14, 7709.07, 1857.01, 393.746, 'Alliance Infra-green Bomber - Long'),(32512, 15, 7736.76, 1861.04, 395.752, 'Alliance Infra-green Bomber - Long'),(32512, 16, 7787.22, 1866.39, 403.213, 'Alliance Infra-green Bomber - Long'),(32512, 17, 7837.2, 1851.71, 409.706, 'Alliance Infra-green Bomber - Long'),(32512, 18, 7852.85, 1828.93, 411.219, 'Alliance Infra-green Bomber - Long'),(32512, 19, 7853.23, 1800.17, 412.38, 'Alliance Infra-green Bomber - Long'),
(32512, 20, 7829.07, 1770.52, 406.956, 'Alliance Infra-green Bomber - Long'),(32512, 21, 7811.85, 1768.51, 404.165, 'Alliance Infra-green Bomber - Long'),(32512, 22, 7799.06, 1768.1, 403.979, 'Alliance Infra-green Bomber - Long'),(32512, 23, 7766.45, 1769.32, 405.503, 'Alliance Infra-green Bomber - Long'),(32512, 24, 7731.83, 1774.18, 407.213, 'Alliance Infra-green Bomber - Long'),(32512, 25, 7672.1, 1781.93, 409.652, 'Alliance Infra-green Bomber - Long'),(32512, 26, 7636.9, 1764.66, 408.927, 'Alliance Infra-green Bomber - Long'),(32512, 27, 7622.94, 1733.91, 407.852, 'Alliance Infra-green Bomber - Long'),(32512, 28, 7637.13, 1701.48, 401.798, 'Alliance Infra-green Bomber - Long'),(32512, 29, 7656.35, 1687.47, 392.133, 'Alliance Infra-green Bomber - Long'),(32512, 30, 7683.72, 1664.33, 389.155, 'Alliance Infra-green Bomber - Long'),(32512, 31, 7704.89, 1644.36, 391.315, 'Alliance Infra-green Bomber - Long'),(32512, 32, 7723.43, 1616.93, 396.226, 'Alliance Infra-green Bomber - Long'),(32512, 33, 7725.81, 1591.86, 400.687, 'Alliance Infra-green Bomber - Long'),(32512, 34, 7715.29, 1556.66, 405.374, 'Alliance Infra-green Bomber - Long'),(32512, 35, 7700.13, 1537.58, 406.834, 'Alliance Infra-green Bomber - Long'),(32512, 36, 7669.18, 1514.83, 407.87, 'Alliance Infra-green Bomber - Long'),(32512, 37, 7645.32, 1502.62, 408.244, 'Alliance Infra-green Bomber - Long'),(32512, 38, 7597.58, 1487.31, 407.425, 'Alliance Infra-green Bomber - Long'),
(32512, 39, 7563.26, 1480.56, 406.112, 'Alliance Infra-green Bomber - Long'),(32512, 40, 7530.64, 1468.65, 404.426, 'Alliance Infra-green Bomber - Long'),(32512, 41, 7509.13, 1449.03, 402.95, 'Alliance Infra-green Bomber - Long'),(32512, 42, 7486.21, 1414.11, 401.32, 'Alliance Infra-green Bomber - Long'),(32512, 43, 7477.96, 1391.06, 401.176, 'Alliance Infra-green Bomber - Long'),(32512, 44, 7468.21, 1357.44, 401.054, 'Alliance Infra-green Bomber - Long'),(32512, 45, 7454.79, 1315.26, 400.386, 'Alliance Infra-green Bomber - Long'),(32512, 46, 7441.42, 1292.08, 399.426, 'Alliance Infra-green Bomber - Long'),(32512, 47, 7413.4, 1266.08, 397.33, 'Alliance Infra-green Bomber - Long'),(32512, 48, 7384.47, 1254.93, 393.811, 'Alliance Infra-green Bomber - Long'),(32512, 49, 7352.79, 1259.18, 387.868, 'Alliance Infra-green Bomber - Long'),(32512, 50, 7330.17, 1269.94, 382.371, 'Alliance Infra-green Bomber - Long'),(32512, 51, 7313.91, 1280.48, 377.967, 'Alliance Infra-green Bomber - Long'),(32512, 52, 7287.94, 1302.62, 370.212, 'Alliance Infra-green Bomber - Long'),(32512, 53, 7247.12, 1334.65, 357.074, 'Alliance Infra-green Bomber - Long'),(32512, 54, 7222.75, 1346.71, 350.44, 'Alliance Infra-green Bomber - Long'),(32512, 55, 7191.05, 1359.21, 342.487, 'Alliance Infra-green Bomber - Long'),(32512, 56, 7146.12, 1365.7, 334.615, 'Alliance Infra-green Bomber - Long'),(32512, 57, 7118.05, 1354.57, 333.155, 'Alliance Infra-green Bomber - Long'),
(32512, 58, 7095.1, 1336.85, 333.92, 'Alliance Infra-green Bomber - Long'),(32512, 59, 7082.05, 1313.63, 335.456, 'Alliance Infra-green Bomber - Long'),(32512, 60, 7081.52, 1280.37, 338.251, 'Alliance Infra-green Bomber - Long'),(32512, 61, 7098.09, 1251.42, 340.588, 'Alliance Infra-green Bomber - Long'),(32512, 62, 7115.06, 1235.56, 342.192, 'Alliance Infra-green Bomber - Long'),(32512, 63, 7140.75, 1236.72, 344.987, 'Alliance Infra-green Bomber - Long'),(32512, 64, 7147.52, 1246.17, 345.62, 'Alliance Infra-green Bomber - Long'),(32512, 65, 7161.72, 1280.15, 359.42, 'Alliance Infra-green Bomber - Long'),(32512, 66, 7182.57, 1286.26, 358.761, 'Alliance Infra-green Bomber - Long'),(32512, 67, 7190.92, 1275.2, 359.311, 'Alliance Infra-green Bomber - Long'),(32512, 68, 7202, 1246.16, 364.335, 'Alliance Infra-green Bomber - Long'),(32512, 69, 7228.05, 1205.15, 374.81, 'Alliance Infra-green Bomber - Long'),(32512, 70, 7257.44, 1201, 379.775, 'Alliance Infra-green Bomber - Long'),(32512, 71, 7283.25, 1207.12, 383.432, 'Alliance Infra-green Bomber - Long'),(32512, 72, 7313.53, 1231.6, 386.708, 'Alliance Infra-green Bomber - Long'),(32512, 73, 7320.05, 1252.78, 386.454, 'Alliance Infra-green Bomber - Long'),(32512, 74, 7325.5, 1287.34, 385.663, 'Alliance Infra-green Bomber - Long'),(32512, 75, 7336.36, 1325.32, 386.77, 'Alliance Infra-green Bomber - Long'),
(32512, 76, 7358.37, 1348.92, 389.222, 'Alliance Infra-green Bomber - Long'),(32512, 77, 7377.21, 1357.82, 390.506, 'Alliance Infra-green Bomber - Long'),(32512, 78, 7411, 1366.82, 391.944, 'Alliance Infra-green Bomber - Long'),(32512, 79, 7478.71, 1383.7, 396.844, 'Alliance Infra-green Bomber - Long'),(32512, 80, 7508.38, 1396.75, 399.75, 'Alliance Infra-green Bomber - Long'),(32512, 81, 7549.64, 1435.9, 402.703, 'Alliance Infra-green Bomber - Long'),(32512, 82, 7579.53, 1488.62, 405.454, 'Alliance Infra-green Bomber - Long'),(32512, 83, 7594.04, 1530.21, 405.995, 'Alliance Infra-green Bomber - Long'),(32512, 84, 7597.78, 1580.15, 406.863, 'Alliance Infra-green Bomber - Long'),(32512, 85, 7599.84, 1629.51, 398.177, 'Alliance Infra-green Bomber - Long'),(32512, 86, 7600.09, 1641.16, 397.327, 'Alliance Infra-green Bomber - Long'),(32512, 87, 7601.76, 1706.16, 392.187, 'Alliance Infra-green Bomber - Long'),(32512, 88, 7609.87, 1734.02, 391.214, 'Alliance Infra-green Bomber - Long'),(32512, 89, 7629.48, 1766.95, 392.821, 'Alliance Infra-green Bomber - Long'),(32512, 90, 7654.89, 1787.01, 394.78, 'Alliance Infra-green Bomber - Long'),(32512, 91, 7687.36, 1798.35, 400.772, 'Alliance Infra-green Bomber - Long'),(32512, 92, 7723.2, 1803.61, 409.558, 'Alliance Infra-green Bomber - Long'),(32512, 93, 7739.02, 1803.96, 413.524, 'Alliance Infra-green Bomber - Long'),(32512, 94, 7772.81, 1801.73, 422.254, 'Alliance Infra-green Bomber - Long'),
(32512, 95, 7806.51, 1798.3, 431.083, 'Alliance Infra-green Bomber - Long'),(32512, 96, 7839.75, 1795.2, 441.564, 'Alliance Infra-green Bomber - Long'),(32512, 97, 7880.53, 1792.37, 458.585, 'Alliance Infra-green Bomber - Long'),(32512, 98, 7915.31, 1795.76, 477.234, 'Alliance Infra-green Bomber - Long'),(32512, 99, 7948.23, 1808.57, 499.45, 'Alliance Infra-green Bomber - Long'),(32512, 100, 7966.47, 1831.04, 518.671, 'Alliance Infra-green Bomber - Long'),(32512, 101, 7971.64, 1849.81, 531.481, 'Alliance Infra-green Bomber - Long'),(32512, 102, 7972.72, 1865.6, 541.284, 'Alliance Infra-green Bomber - Long'),(32512, 103, 7960.29, 1916.23, 549.119, 'Alliance Infra-green Bomber - Long'),(32512, 104, 7938.55, 1934.97, 553.812, 'Alliance Infra-green Bomber - Long'),(32512, 105, 7889.36, 1953.47, 563.336, 'Alliance Infra-green Bomber - Long'),(32512, 106, 7855.36, 1959.24, 569.281, 'Alliance Infra-green Bomber - Long'),(32512, 107, 7821.29, 1965.55, 574.228, 'Alliance Infra-green Bomber - Long'),(32512, 108, 7812.15, 1967.28, 575.42, 'Alliance Infra-green Bomber - Long'),
(32512, 109, 7774.67, 1986.76, 580.059, 'Alliance Infra-green Bomber - Long'),(32512, 110, 7633.95, 2061.49, 618.75, 'Alliance Infra-green Bomber - Long');
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31407, 31408, 31409);
INSERT INTO npc_spellclick_spells VALUES (31407, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (31408, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (31409, 59060, 1, 0);
-- Alliance Turret Seat (31407)
REPLACE INTO creature_template_addon VALUES (31407, 0, 0, 0, 0, 0, '59458');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=59622, spell2=0,spell4=59196, spell5=59194, spell6=59193, VehicleId=277, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31407;
-- Alliance Bomber Seat (31408)
REPLACE INTO creature_template_addon VALUES (31408, 0, 0, 0, 0, 0, '59443');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=60523, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=274, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31408;
-- Alliance Engineering Seat (31409)
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=1, unit_flags=33554432, spell1=59061, spell2=61093, spell4=59196, spell5=59194, spell6=59193, VehicleId=278, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31409;
-- Banner Bunny, Hanging, Alliance (32217)
REPLACE INTO creature_template_addon VALUES (32217, 0, 0, 0, 0, 0, '60161');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32217;
-- Banner Bunny, Side, Alliance (32221)
REPLACE INTO creature_template_addon VALUES (32221, 0, 0, 0, 0, 0, '60189');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32221;
-- Alliance Bomber Pilot (32274)
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, AIName='NullCreatureAI' WHERE entry=32274;

-- Horde Infra-green Bomber (31838), short
-- Horde Infra-green Bomber (32513), long
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=287, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=31838;
UPDATE creature_template SET exp=2, npcflag=16777216, speed_walk=1.2, speed_run=1.14286, VehicleId=287, InhabitType=4, RegenHealth=0, AIName='', ScriptName='npc_infra_green_bomber_generic' WHERE entry=32513;
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31838, 32513);
INSERT INTO npc_spellclick_spells VALUES (31838, 46598, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (32513, 46598, 1, 0);
DELETE FROM vehicle_template_accessory WHERE entry IN(31838, 32513);
INSERT INTO vehicle_template_accessory VALUES (31838, 31856, 0, 1, 'Horde Bomber Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 31840, 1, 1, 'Horde Turret Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32152, 2, 1, 'Horde Engineering Seat on rides Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32214, 3, 1, 'Banner Bunny, Hanging, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32215, 4, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32215, 5, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32256, 6, 1, 'Shield Visual Loc Bunny on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (31838, 32317, 7, 1, 'Horde Bomber Pilot rides Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 31856, 0, 1, 'Horde Bomber Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 31840, 1, 1, 'Horde Turret Seat on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32152, 2, 1, 'Horde Engineering Seat on rides Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32214, 3, 1, 'Banner Bunny, Hanging, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32215, 4, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32215, 5, 1, 'Banner Bunny, Side, Horde on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32256, 6, 1, 'Shield Visual Loc Bunny on Horde Infra-green Bomber', 8, 0);
INSERT INTO vehicle_template_accessory VALUES (32513, 32317, 7, 1, 'Horde Bomber Pilot rides Horde Infra-green Bomber', 8, 0);
DELETE FROM waypoints WHERE entry=31838;
INSERT INTO waypoints VALUES (31838, 1, 7753.45, 2044.47, 592.04, 'Horde Infra-green Bomber - Short'),(31838, 2, 7766.17, 2004.16, 575.364, 'Horde Infra-green Bomber - Short'),(31838, 3, 7804.4, 1951.74, 549.136, 'Horde Infra-green Bomber - Short'),(31838, 4, 7825.09, 1928.68, 532.879, 'Horde Infra-green Bomber - Short'),(31838, 5, 7866.31, 1885.58, 496.232, 'Horde Infra-green Bomber - Short'),(31838, 6, 7895.59, 1845.43, 466.525, 'Horde Infra-green Bomber - Short'),(31838, 7, 7883.56, 1804.89, 449.938, 'Horde Infra-green Bomber - Short'),(31838, 8, 7837, 1801.84, 435.217, 'Horde Infra-green Bomber - Short'),(31838, 9, 7815.85, 1813.61, 431.672, 'Horde Infra-green Bomber - Short'),(31838, 10, 7772.53, 1841.07, 431.172, 'Horde Infra-green Bomber - Short'),(31838, 11, 7739.59, 1852.73, 430.873, 'Horde Infra-green Bomber - Short'),(31838, 12, 7701.6, 1856.26, 428.418, 'Horde Infra-green Bomber - Short'),(31838, 13, 7658.51, 1855.49, 430.772, 'Horde Infra-green Bomber - Short'),(31838, 14, 7634.45, 1847.34, 432.35, 'Horde Infra-green Bomber - Short'),
(31838, 15, 7587.81, 1815.65, 431.884, 'Horde Infra-green Bomber - Short'),(31838, 16, 7577.23, 1780.84, 425.398, 'Horde Infra-green Bomber - Short'),(31838, 17, 7588.97, 1748.31, 416.64, 'Horde Infra-green Bomber - Short'),(31838, 18, 7606.15, 1728.53, 411.093, 'Horde Infra-green Bomber - Short'),(31838, 19, 7635.87, 1700.63, 410.406, 'Horde Infra-green Bomber - Short'),(31838, 20, 7661.84, 1677.63, 415.037, 'Horde Infra-green Bomber - Short'),(31838, 21, 7683.93, 1657.1, 418.071, 'Horde Infra-green Bomber - Short'),(31838, 22, 7730.4, 1647.6, 420.767, 'Horde Infra-green Bomber - Short'),(31838, 23, 7760.93, 1663.64, 426.739, 'Horde Infra-green Bomber - Short'),(31838, 24, 7817.86, 1688.59, 436.1, 'Horde Infra-green Bomber - Short'),(31838, 25, 7857.05, 1734.45, 413.059, 'Horde Infra-green Bomber - Short'),(31838, 26, 7865.85, 1752.09, 411.13, 'Horde Infra-green Bomber - Short'),(31838, 27, 7873.44, 1803.01, 416.629, 'Horde Infra-green Bomber - Short'),(31838, 28, 7853.76, 1838.35, 425.217, 'Horde Infra-green Bomber - Short'),
(31838, 29, 7816.59, 1856.3, 430.695, 'Horde Infra-green Bomber - Short'),(31838, 30, 7778.95, 1853.29, 432.243, 'Horde Infra-green Bomber - Short'),(31838, 31, 7750.59, 1828.18, 431.892, 'Horde Infra-green Bomber - Short'),(31838, 32, 7735.12, 1799.6, 429.134, 'Horde Infra-green Bomber - Short'),(31838, 33, 7720.96, 1767.72, 426.263, 'Horde Infra-green Bomber - Short'),(31838, 34, 7709.29, 1745.03, 423.882, 'Horde Infra-green Bomber - Short'),(31838, 35, 7687.72, 1717.87, 419.22, 'Horde Infra-green Bomber - Short'),(31838, 36, 7663.97, 1692.6, 414.53, 'Horde Infra-green Bomber - Short'),(31838, 37, 7639.08, 1668.44, 409.85, 'Horde Infra-green Bomber - Short'),(31838, 38, 7606.57, 1637.13, 404.108, 'Horde Infra-green Bomber - Short'),(31838, 39, 7614.29, 1603.57, 397.91, 'Horde Infra-green Bomber - Short'),(31838, 40, 7624.51, 1570.93, 390.542, 'Horde Infra-green Bomber - Short'),(31838, 41, 7634.43, 1530.19, 382.105, 'Horde Infra-green Bomber - Short'),
(31838, 42, 7613.33, 1494.48, 381.294, 'Horde Infra-green Bomber - Short'),(31838, 43, 7584.1, 1491.31, 387.931, 'Horde Infra-green Bomber - Short'),(31838, 44, 7555.27, 1497.66, 401.862, 'Horde Infra-green Bomber - Short'),(31838, 45, 7523.53, 1511.46, 421.102, 'Horde Infra-green Bomber - Short'),(31838, 46, 7489.08, 1510.24, 431.514, 'Horde Infra-green Bomber - Short'),(31838, 47, 7477.76, 1486.37, 435.962, 'Horde Infra-green Bomber - Short'),(31838, 48, 7498.74, 1445.82, 440.44, 'Horde Infra-green Bomber - Short'),(31838, 49, 7532.11, 1412.9, 448.849, 'Horde Infra-green Bomber - Short'),(31838, 50, 7563.08, 1404.79, 453.795, 'Horde Infra-green Bomber - Short'),(31838, 51, 7601.4, 1415.79, 458.653, 'Horde Infra-green Bomber - Short'),(31838, 52, 7626.93, 1435.78, 461.89, 'Horde Infra-green Bomber - Short'),(31838, 53, 7641.68, 1453.63, 464.418, 'Horde Infra-green Bomber - Short'),(31838, 54, 7660.38, 1501.85, 472.969, 'Horde Infra-green Bomber - Short'),(31838, 55, 7668.88, 1535.63, 476.438, 'Horde Infra-green Bomber - Short'),(31838, 56, 7676.59, 1569.65, 479.256, 'Horde Infra-green Bomber - Short'),(31838, 57, 7685.44, 1599.73, 482.085, 'Horde Infra-green Bomber - Short'),
(31838, 58, 7698.4, 1631.93, 486.528, 'Horde Infra-green Bomber - Short'),(31838, 59, 7713.19, 1663.23, 491.681, 'Horde Infra-green Bomber - Short'),(31838, 60, 7743.51, 1725.39, 502.409, 'Horde Infra-green Bomber - Short'),(31838, 61, 7760.73, 1755.16, 508.887, 'Horde Infra-green Bomber - Short'),(31838, 62, 7777.56, 1785.01, 515.946, 'Horde Infra-green Bomber - Short'),(31838, 63, 7787.84, 1815.11, 522.388, 'Horde Infra-green Bomber - Short'),(31838, 64, 7788.78, 1851.14, 531.797, 'Horde Infra-green Bomber - Short'),(31838, 65, 7785.71, 1884.7, 541.23, 'Horde Infra-green Bomber - Short'),(31838, 66, 7783.92, 1918.17, 551.305, 'Horde Infra-green Bomber - Short'),(31838, 67, 7782.55, 1974.89, 569.197, 'Horde Infra-green Bomber - Short'),
(31838, 68, 7779.93, 2000.37, 585.416, 'Horde Infra-green Bomber - Short'),(31838, 69, 7887.33, 2057.64, 618.75, 'Horde Infra-green Bomber - Short');
DELETE FROM waypoints WHERE entry=32513;
INSERT INTO waypoints VALUES (32513, 1, 7740.12, 2037.47, 594.088, 'Horde Infra-green Bomber - Long'),(32513, 2, 7742.67, 2023.95, 583.412, 'Horde Infra-green Bomber - Long'),(32513, 3, 7740.06, 1991.28, 559.206, 'Horde Infra-green Bomber - Long'),(32513, 4, 7728.47, 1976.46, 540.522, 'Horde Infra-green Bomber - Long'),(32513, 5, 7710.74, 1968.24, 523.864, 'Horde Infra-green Bomber - Long'),(32513, 6, 7684.83, 1956.37, 503.568, 'Horde Infra-green Bomber - Long'),(32513, 7, 7633.76, 1925.8, 466.762, 'Horde Infra-green Bomber - Long'),(32513, 8, 7608.49, 1909.46, 448.915, 'Horde Infra-green Bomber - Long'),(32513, 9, 7583.64, 1878.65, 428.868, 'Horde Infra-green Bomber - Long'),(32513, 10, 7594.58, 1848.98, 417.143, 'Horde Infra-green Bomber - Long'),(32513, 11, 7623.07, 1838.43, 407.831, 'Horde Infra-green Bomber - Long'),(32513, 12, 7660.62, 1844.98, 397.19, 'Horde Infra-green Bomber - Long'),(32513, 13, 7678.44, 1849.78, 394.788, 'Horde Infra-green Bomber - Long'),(32513, 14, 7709.07, 1857.01, 393.746, 'Horde Infra-green Bomber - Long'),(32513, 15, 7736.76, 1861.04, 395.752, 'Horde Infra-green Bomber - Long'),(32513, 16, 7787.22, 1866.39, 403.213, 'Horde Infra-green Bomber - Long'),(32513, 17, 7837.2, 1851.71, 409.706, 'Horde Infra-green Bomber - Long'),(32513, 18, 7852.85, 1828.93, 411.219, 'Horde Infra-green Bomber - Long'),(32513, 19, 7853.23, 1800.17, 412.38, 'Horde Infra-green Bomber - Long'),
(32513, 20, 7829.07, 1770.52, 406.956, 'Horde Infra-green Bomber - Long'),(32513, 21, 7811.85, 1768.51, 404.165, 'Horde Infra-green Bomber - Long'),(32513, 22, 7799.06, 1768.1, 403.979, 'Horde Infra-green Bomber - Long'),(32513, 23, 7766.45, 1769.32, 405.503, 'Horde Infra-green Bomber - Long'),(32513, 24, 7731.83, 1774.18, 407.213, 'Horde Infra-green Bomber - Long'),(32513, 25, 7672.1, 1781.93, 409.652, 'Horde Infra-green Bomber - Long'),(32513, 26, 7636.9, 1764.66, 408.927, 'Horde Infra-green Bomber - Long'),(32513, 27, 7622.94, 1733.91, 407.852, 'Horde Infra-green Bomber - Long'),(32513, 28, 7637.13, 1701.48, 401.798, 'Horde Infra-green Bomber - Long'),(32513, 29, 7656.35, 1687.47, 392.133, 'Horde Infra-green Bomber - Long'),(32513, 30, 7683.72, 1664.33, 389.155, 'Horde Infra-green Bomber - Long'),(32513, 31, 7704.89, 1644.36, 391.315, 'Horde Infra-green Bomber - Long'),(32513, 32, 7723.43, 1616.93, 396.226, 'Horde Infra-green Bomber - Long'),(32513, 33, 7725.81, 1591.86, 400.687, 'Horde Infra-green Bomber - Long'),(32513, 34, 7715.29, 1556.66, 405.374, 'Horde Infra-green Bomber - Long'),(32513, 35, 7700.13, 1537.58, 406.834, 'Horde Infra-green Bomber - Long'),(32513, 36, 7669.18, 1514.83, 407.87, 'Horde Infra-green Bomber - Long'),(32513, 37, 7645.32, 1502.62, 408.244, 'Horde Infra-green Bomber - Long'),(32513, 38, 7597.58, 1487.31, 407.425, 'Horde Infra-green Bomber - Long'),
(32513, 39, 7563.26, 1480.56, 406.112, 'Horde Infra-green Bomber - Long'),(32513, 40, 7530.64, 1468.65, 404.426, 'Horde Infra-green Bomber - Long'),(32513, 41, 7509.13, 1449.03, 402.95, 'Horde Infra-green Bomber - Long'),(32513, 42, 7486.21, 1414.11, 401.32, 'Horde Infra-green Bomber - Long'),(32513, 43, 7477.96, 1391.06, 401.176, 'Horde Infra-green Bomber - Long'),(32513, 44, 7468.21, 1357.44, 401.054, 'Horde Infra-green Bomber - Long'),(32513, 45, 7454.79, 1315.26, 400.386, 'Horde Infra-green Bomber - Long'),(32513, 46, 7441.42, 1292.08, 399.426, 'Horde Infra-green Bomber - Long'),(32513, 47, 7413.4, 1266.08, 397.33, 'Horde Infra-green Bomber - Long'),(32513, 48, 7384.47, 1254.93, 393.811, 'Horde Infra-green Bomber - Long'),(32513, 49, 7352.79, 1259.18, 387.868, 'Horde Infra-green Bomber - Long'),(32513, 50, 7330.17, 1269.94, 382.371, 'Horde Infra-green Bomber - Long'),(32513, 51, 7313.91, 1280.48, 377.967, 'Horde Infra-green Bomber - Long'),(32513, 52, 7287.94, 1302.62, 370.212, 'Horde Infra-green Bomber - Long'),(32513, 53, 7247.12, 1334.65, 357.074, 'Horde Infra-green Bomber - Long'),(32513, 54, 7222.75, 1346.71, 350.44, 'Horde Infra-green Bomber - Long'),(32513, 55, 7191.05, 1359.21, 342.487, 'Horde Infra-green Bomber - Long'),(32513, 56, 7146.12, 1365.7, 334.615, 'Horde Infra-green Bomber - Long'),(32513, 57, 7118.05, 1354.57, 333.155, 'Horde Infra-green Bomber - Long'),
(32513, 58, 7095.1, 1336.85, 333.92, 'Horde Infra-green Bomber - Long'),(32513, 59, 7082.05, 1313.63, 335.456, 'Horde Infra-green Bomber - Long'),(32513, 60, 7081.52, 1280.37, 338.251, 'Horde Infra-green Bomber - Long'),(32513, 61, 7098.09, 1251.42, 340.588, 'Horde Infra-green Bomber - Long'),(32513, 62, 7115.06, 1235.56, 342.192, 'Horde Infra-green Bomber - Long'),(32513, 63, 7140.75, 1236.72, 344.987, 'Horde Infra-green Bomber - Long'),(32513, 64, 7147.52, 1246.17, 345.62, 'Horde Infra-green Bomber - Long'),(32513, 65, 7161.72, 1280.15, 359.42, 'Horde Infra-green Bomber - Long'),(32513, 66, 7182.57, 1286.26, 358.761, 'Horde Infra-green Bomber - Long'),(32513, 67, 7190.92, 1275.2, 359.311, 'Horde Infra-green Bomber - Long'),(32513, 68, 7202, 1246.16, 364.335, 'Horde Infra-green Bomber - Long'),(32513, 69, 7228.05, 1205.15, 374.81, 'Horde Infra-green Bomber - Long'),(32513, 70, 7257.44, 1201, 379.775, 'Horde Infra-green Bomber - Long'),(32513, 71, 7283.25, 1207.12, 383.432, 'Horde Infra-green Bomber - Long'),(32513, 72, 7313.53, 1231.6, 386.708, 'Horde Infra-green Bomber - Long'),(32513, 73, 7320.05, 1252.78, 386.454, 'Horde Infra-green Bomber - Long'),(32513, 74, 7325.5, 1287.34, 385.663, 'Horde Infra-green Bomber - Long'),(32513, 75, 7336.36, 1325.32, 386.77, 'Horde Infra-green Bomber - Long'),(32513, 76, 7358.37, 1348.92, 389.222, 'Horde Infra-green Bomber - Long'),
(32513, 77, 7377.21, 1357.82, 390.506, 'Horde Infra-green Bomber - Long'),(32513, 78, 7411, 1366.82, 391.944, 'Horde Infra-green Bomber - Long'),(32513, 79, 7478.71, 1383.7, 396.844, 'Horde Infra-green Bomber - Long'),(32513, 80, 7508.38, 1396.75, 399.75, 'Horde Infra-green Bomber - Long'),(32513, 81, 7549.64, 1435.9, 402.703, 'Horde Infra-green Bomber - Long'),(32513, 82, 7579.53, 1488.62, 405.454, 'Horde Infra-green Bomber - Long'),(32513, 83, 7594.04, 1530.21, 405.995, 'Horde Infra-green Bomber - Long'),(32513, 84, 7597.78, 1580.15, 406.863, 'Horde Infra-green Bomber - Long'),(32513, 85, 7599.84, 1629.51, 398.177, 'Horde Infra-green Bomber - Long'),(32513, 86, 7600.09, 1641.16, 397.327, 'Horde Infra-green Bomber - Long'),(32513, 87, 7601.76, 1706.16, 392.187, 'Horde Infra-green Bomber - Long'),(32513, 88, 7609.87, 1734.02, 391.214, 'Horde Infra-green Bomber - Long'),(32513, 89, 7629.48, 1766.95, 392.821, 'Horde Infra-green Bomber - Long'),(32513, 90, 7654.89, 1787.01, 394.78, 'Horde Infra-green Bomber - Long'),(32513, 91, 7687.36, 1798.35, 400.772, 'Horde Infra-green Bomber - Long'),(32513, 92, 7723.2, 1803.61, 409.558, 'Horde Infra-green Bomber - Long'),(32513, 93, 7739.02, 1803.96, 413.524, 'Horde Infra-green Bomber - Long'),(32513, 94, 7772.81, 1801.73, 422.254, 'Horde Infra-green Bomber - Long'),(32513, 95, 7806.51, 1798.3, 431.083, 'Horde Infra-green Bomber - Long'),
(32513, 96, 7839.75, 1795.2, 441.564, 'Horde Infra-green Bomber - Long'),(32513, 97, 7880.53, 1792.37, 458.585, 'Horde Infra-green Bomber - Long'),(32513, 98, 7915.31, 1795.76, 477.234, 'Horde Infra-green Bomber - Long'),(32513, 99, 7948.23, 1808.57, 499.45, 'Horde Infra-green Bomber - Long'),(32513, 100, 7966.47, 1831.04, 518.671, 'Horde Infra-green Bomber - Long'),(32513, 101, 7971.64, 1849.81, 531.481, 'Horde Infra-green Bomber - Long'),(32513, 102, 7972.72, 1865.6, 541.284, 'Horde Infra-green Bomber - Long'),(32513, 103, 7960.29, 1916.23, 549.119, 'Horde Infra-green Bomber - Long'),(32513, 104, 7938.55, 1934.97, 553.812, 'Horde Infra-green Bomber - Long'),(32513, 105, 7889.36, 1953.47, 563.336, 'Horde Infra-green Bomber - Long'),(32513, 106, 7855.36, 1959.24, 569.281, 'Horde Infra-green Bomber - Long'),(32513, 107, 7821.29, 1965.55, 574.228, 'Horde Infra-green Bomber - Long'),(32513, 108, 7812.15, 1967.28, 575.42, 'Horde Infra-green Bomber - Long'),
(32513, 109, 7774.67, 1986.76, 580.059, 'Horde Infra-green Bomber - Long'),(32513, 110, 7887.33, 2057.64, 618.75, 'Horde Infra-green Bomber - Long');
DELETE FROM npc_spellclick_spells WHERE npc_entry IN(31840, 31856, 32152);
INSERT INTO npc_spellclick_spells VALUES (31840, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (31856, 59060, 1, 0);
INSERT INTO npc_spellclick_spells VALUES (32152, 59060, 1, 0);
-- Horde Turret Seat (31840)
REPLACE INTO creature_template_addon VALUES (31840, 0, 0, 0, 0, 0, '59458');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=59622, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=277, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31840;
-- Horde Bomber Seat (31856)
REPLACE INTO creature_template_addon VALUES (31856, 0, 0, 0, 0, 0, '59443');
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=8, unit_flags=33554432, unit_flags2=0, spell1=60523, spell2=0, spell4=59196, spell5=59194, spell6=59193, VehicleId=274, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=31856;
-- Horde Engineering Seat (32152)
UPDATE creature_template SET exp=2, npcflag=16777216, unit_class=1, unit_flags=33554432, spell1=59061, spell2=61093, spell4=59196, spell5=59194, spell6=59193, VehicleId=278, RegenHealth=0, InhabitType=7, AIName='NullCreatureAI' WHERE entry=32152;
-- Banner Bunny, Hanging, Horde (32214)
REPLACE INTO creature_template_addon VALUES (32214, 0, 0, 0, 0, 0, '60070');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=0, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32214;
-- Banner Bunny, Side, Horde (32215)
REPLACE INTO creature_template_addon VALUES (32215, 0, 0, 0, 0, 0, '60151');
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=0, flags_extra=128, AIName='NullCreatureAI' WHERE entry=32215;
-- Horde Bomber Pilot (32317)
UPDATE creature_template SET exp=2, unit_flags=33554432, RegenHealth=1, AIName='NullCreatureAI' WHERE entry=32317;

DELETE from spell_scripts WHERE id IN(59622, 60287);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry IN(60287, 59622);

DELETE FROM `gameobject` WHERE id IN(193763,
193582,
193757,
193982,
193758,
193756,
193579,
193762,
193764,
193754,
193759,
193761,
193760,
193748,
193755,
193753,
193752,
193750,
193751,
193747,
193749,
193744,
193746,
193736,
193745,
193796,
193731,
193742,
193741,
193730,
193738,
193743,
193765,
193732,
193735,
193733,
193722,
193734,
193984,
193723,
193721,
193720,
193737,
193739,
193984,
193740,
193718,
193715,
193717,
193714,
193716,
193713,
193707,
193705,
193712,
193766,
193698,
193719,
193708,
193706,
193729,
193728,
193699,
193727,
193704,
193724,
193703,
193701,
193697,
193726,
193725,
193696,
193702, 
193700,
193710, 
193709, 
193711, 
193984, 
193984);

INSERT INTO `gameobject` VALUES (268839, 193697, 571, 0, 0, 1, 1, 7895.76, 2072.58, 600.27, -2.94959, 0, 0, -0.995395, 0.0958539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268838, 193698, 571, 0, 0, 1, 1, 7896.03, 2071.15, 600.233, -1.92896, 0, 0, -0.821753, 0.569844, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268837, 193699, 571, 0, 0, 1, 1, 7897.21, 2071.01, 601.419, -1.93571, 0, 0, -0.823671, 0.567068, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268836, 193700, 571, 0, 0, 1, 1, 7898.75, 2071.19, 600.251, 1.24791, 0, 0, 0.584249, 0.811574, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268835, 193701, 571, 0, 0, 1, 1, 7902.83, 2065.02, 600.257, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268834, 193702, 571, 0, 0, 1, 1, 7903.08, 2065.35, 601.462, -2.97579, 0, 0, -0.996566, 0.0828064, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268833, 193703, 571, 0, 0, 1, 1, 7902.85, 2064.88, 601.479, 2.18166, 0, 0, 0.88701, 0.461749, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268832, 193704, 571, 0, 0, 1, 1, 7902.36, 2065.16, 601.459, -2.8873, 0, 0, -0.991928, 0.126804, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268831, 193705, 571, 0, 0, 1, 1, 7901.54, 2064.54, 601.473, 0.401427, 0, 0, 0.199369, 0.979925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268830, 193706, 571, 0, 0, 1, 1, 7902.22, 2064.3, 601.473, -0.56723, 0, 0, -0.279828, 0.96005, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268829, 193707, 571, 0, 0, 1, 1, 7899.48, 2067.53, 600.657, 2.34747, 0, 0, 0.922201, 0.38671, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268828, 193708, 571, 0, 0, 1, 1, 7896.18, 2071.19, 601.443, -2.86232, 0, 0, -0.990267, 0.139183, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268827, 193709, 571, 0, 0, 1, 1, 7905.86, 2057.76, 601.122, -1.64058, 0, 0, -0.731344, 0.682009, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268826, 193710, 571, 0, 0, 1, 1, 7905.79, 2056.77, 600.253, -1.03847, 0, 0, -0.496216, 0.868199, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268825, 193711, 571, 0, 0, 1, 1, 7905.84, 2058.81, 600.253, -2.43473, 0, 0, -0.938191, 0.346119, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268824, 193712, 571, 0, 0, 1, 1, 7902.72, 2049.29, 600.261, 1.71042, 0, 0, 0.754709, 0.65606, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268823, 193713, 571, 0, 0, 1, 1, 7902.54, 2049.58, 600.25, 1.84476, 0, 0, 0.797041, 0.603925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268822, 193714, 571, 0, 0, 1, 1, 7902.29, 2049.42, 600.264, -1.42244, 0, 0, -0.652758, 0.757566, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268821, 193715, 571, 0, 0, 1, 1, 7902.14, 2049.52, 600.262, -0.93375, 0, 0, -0.450098, 0.892979, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268820, 193716, 571, 0, 0, 1, 1, 7902.39, 2049.29, 600.24, -2.64417, 0, 0, -0.96923, 0.246155, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268819, 193717, 571, 0, 0, 1, 1, 7902.18, 2049.3, 600.461, -1.10828, 0, 0, -0.526212, 0.850353, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268818, 193718, 571, 0, 0, 1, 1, 7901.95, 2049.21, 600.24, 2.92342, 0, 0, 0.994056, 0.10887, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268817, 193719, 571, 0, 0, 1, 1, 7902.19, 2063.95, 601.511, -1.96349, 0, 0, -0.831468, 0.555572, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268816, 193720, 571, 0, 0, 1, 1, 7899.41, 2047.68, 600.681, 0.750491, 0, 0, 0.366501, 0.930418, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268815, 193721, 571, 0, 0, 1, 1, 7896.48, 2044.01, 600.13, 2.09439, 0, 0, 0.866024, 0.500002, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268814, 193722, 571, 0, 0, 1, 1, 7894.41, 2047.29, 601.309, 3.01067, 0, 0, 0.997858, 0.0654146, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268813, 193723, 571, 0, 0, 1, 1, 7896.35, 2044, 601.35, 0.575958, 0, 0, 0.284015, 0.95882, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268812, 193724, 571, 0, 0, 1, 1, 7904.04, 2050.09, 600.233, 0.706858, 0, 0, 0.346117, 0.938191, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268811, 193725, 571, 0, 0, 1, 1, 7904.38, 2050.16, 600.238, -1.68424, 0, 0, -0.746056, 0.665883, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268810, 193726, 571, 0, 0, 1, 1, 7904.18, 2049.76, 600.239, 2.08567, 0, 0, 0.863836, 0.503773, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268809, 193727, 571, 0, 0, 1, 1, 7889.88, 2074.63, 600.247, 0.584686, 0, 0, 0.288197, 0.957571, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268808, 193728, 571, 0, 0, 1, 1, 7888.88, 2074.65, 601.116, -0.017419, 0, 0, -0.00870939, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268807, 193729, 571, 0, 0, 1, 1, 7887.84, 2074.57, 600.247, -0.811576, 0, 0, -0.394743, 0.918792, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268806, 193730, 571, 0, 0, 1, 1, 7873.63, 2065.22, 600.23, 2.80997, 0, 0, 0.986285, 0.165053, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268805, 193731, 571, 0, 0, 1, 1, 7873.7, 2064.57, 600.339, -0.549681, 0, 0, -0.271393, 0.962469, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268804, 193732, 571, 0, 0, 1, 1, 7873.58, 2065.55, 600.361, 0.759044, 0, 0, 0.370477, 0.928842, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268803, 193733, 571, 0, 0, 1, 1, 7874.12, 2066.33, 600.244, 2.86233, 0, 0, 0.990267, 0.139178, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268802, 193734, 571, 0, 0, 1, 1, 7874.18, 2066.85, 600.269, 2.27762, 0, 0, 0.908136, 0.418675, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268801, 193735, 571, 0, 0, 1, 1, 7873.96, 2066.1, 600.263, -0.872663, 0, 0, -0.422618, 0.906308, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268800, 193736, 571, 0, 0, 1, 1, 7878.23, 2068.07, 600.557, -2.3911, 0, 0, -0.930417, 0.366502, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268799, 193737, 571, 0, 0, 1, 1, 7880.95, 2071.65, 600.217, -1.02974, 0, 0, -0.492422, 0.870357, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268798, 193738, 571, 0, 0, 1, 1, 7881.41, 2070.34, 601.433, 1.95477, 0, 0, 0.829038, 0.559192, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268797, 193739, 571, 0, 0, 1, 1, 7881.29, 2071.99, 601.419, 0.157079, 0, 0, 0.0784588, 0.996917, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268796, 193740, 571, 0, 0, 1, 1, 7880.1, 2072.08, 601.421, -0.270523, 0, 0, -0.134849, 0.990866, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268795, 193741, 571, 0, 0, 1, 1, 7888.47, 2041.05, 601.082, 3.09799, 0, 0, 0.999762, 0.0217996, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268794, 193742, 571, 0, 0, 1, 1, 7887.47, 2041.1, 600.216, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268793, 193743, 571, 0, 0, 1, 1, 7889.51, 2041.1, 600.216, 2.30383, 0, 0, 0.913544, 0.406739, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268792, 193744, 571, 0, 0, 1, 1, 7871.47, 2057.94, 601.099, 1.47483, 0, 0, 0.672377, 0.740209, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268791, 193745, 571, 0, 0, 1, 1, 7871.44, 2059.16, 600.23, 2.07694, 0, 0, 0.861629, 0.507539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268790, 193746, 571, 0, 0, 1, 1, 7871.34, 2057.12, 600.23, 0.680679, 0, 0, 0.333807, 0.942641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268789, 193747, 571, 0, 0, 1, 1, 7879.74, 2044.7, 600.14, -2.15548, 0, 0, -0.88089, 0.47332, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268788, 193748, 571, 0, 0, 1, 1, 7881.17, 2045.81, 600.035, -3.08918, 0, 0, -0.999657, 0.0262033, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268787, 193749, 571, 0, 0, 1, 1, 7881.34, 2043.52, 600.008, -0.418879, 0, 0, -0.207912, 0.978148, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268786, 193750, 571, 0, 0, 1, 1, 7874.78, 2050.18, 600.129, 0.759219, 0, 0, 0.370558, 0.928809, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268785, 193751, 571, 0, 0, 1, 1, 7874.74, 2050.31, 601.349, -0.759215, 0, 0, -0.370556, 0.92881, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268784, 193752, 571, 0, 0, 1, 1, 7874.64, 2050.93, 601.321, -2.1293, 0, 0, -0.874619, 0.48481, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268783, 193753, 571, 0, 0, 1, 1, 7875, 2050.97, 601.319, -1.44862, 0, 0, -0.662619, 0.748957, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268782, 193754, 571, 0, 0, 1, 1, 7890.59, 2057.9, 600.165, 0.017454, 0, 0, 0.00872689, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268781, 193755, 571, 0, 0, 1, 1, 7877.74, 2047.84, 600.669, -0.802851, 0, 0, -0.390731, 0.920505, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268780, 193756, 571, 0, 0, 1, 1, 7888.6, 2057.9, 598.534, -0.139624, 0, 0, -0.0697553, 0.997564, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268779, 193758, 571, 0, 0, 1, 1, 7888.88, 2057.81, 600.495, -1.56207, 0, 0, -0.704015, 0.710185, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268778, 193759, 571, 0, 0, 1, 1, 7889.98, 2059.47, 600.244, -2.93214, 0, 0, -0.994521, 0.104535, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268777, 193760, 571, 0, 0, 1, 1, 7890.54, 2060.25, 600.248, -2.0333, 0, 0, -0.85035, 0.526218, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268776, 193761, 571, 0, 0, 1, 1, 7889.73, 2060.41, 600.258, 2.95833, 0, 0, 0.995805, 0.0915032, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268774, 193763, 571, 0, 0, 1, 1, 7885.77, 2057.76, 600.887, 0.063894, 0, 0, 0.0319416, 0.99949, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268770, 193796, 571, 0, 0, 1, 1, 7888.96, 2058.19, 586.427, -2.57972, 0, 0, -0.960796, 0.277255, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268768, 193982, 571, 0, 0, 1, 1, 7888.73, 2057.92, 599.815, 0, 0, 0, 0, 1, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268767, 193579, 571, 0, 0, 1, 1, 7889.04, 2057.88, 599.815, -0.698131, 0, 0, -0.34202, 0.939693, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268766, 193696, 571, 0, 0, 1, 1, 7637.64, 2074.04, 600.272, 2.60926, 0, 0, 0.964786, 0.263035, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268765, 193697, 571, 0, 0, 1, 1, 7635.76, 2074.88, 600.27, -2.94959, 0, 0, -0.995395, 0.0958539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268764, 193698, 571, 0, 0, 1, 1, 7636.03, 2073.45, 600.233, -1.92896, 0, 0, -0.821753, 0.569844, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268763, 193699, 571, 0, 0, 1, 1, 7637.21, 2073.31, 601.419, -1.93571, 0, 0, -0.823671, 0.567068, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268762, 193700, 571, 0, 0, 1, 1, 7638.75, 2073.49, 600.251, 1.24791, 0, 0, 0.584249, 0.811574, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268761, 193701, 571, 0, 0, 1, 1, 7642.83, 2067.32, 600.257, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268760, 193702, 571, 0, 0, 1, 1, 7643.08, 2067.65, 601.462, -2.97579, 0, 0, -0.996566, 0.0828064, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268759, 193703, 571, 0, 0, 1, 1, 7642.85, 2067.18, 601.479, 2.18166, 0, 0, 0.88701, 0.461749, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268758, 193704, 571, 0, 0, 1, 1, 7642.36, 2067.46, 601.459, -2.8873, 0, 0, -0.991928, 0.126804, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268757, 193705, 571, 0, 0, 1, 1, 7641.54, 2066.84, 601.473, 0.401427, 0, 0, 0.199369, 0.979925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268756, 193706, 571, 0, 0, 1, 1, 7642.22, 2066.7, 601.473, -0.56723, 0, 0, -0.279828, 0.96005, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268755, 193707, 571, 0, 0, 1, 1, 7639.48, 2069.83, 600.657, 2.34747, 0, 0, 0.922201, 0.38671, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268754, 193708, 571, 0, 0, 1, 1, 7636.18, 2073.49, 601.443, -2.86232, 0, 0, -0.990267, 0.139183, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268753, 193709, 571, 0, 0, 1, 1, 7645.86, 2060.06, 601.122, -1.64058, 0, 0, -0.731344, 0.682009, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268752, 193710, 571, 0, 0, 1, 1, 7645.79, 2059.07, 600.253, -1.03847, 0, 0, -0.496216, 0.868199, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268751, 193711, 571, 0, 0, 1, 1, 7645.84, 2061.11, 600.253, -2.43473, 0, 0, -0.938191, 0.346119, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268750, 193712, 571, 0, 0, 1, 1, 7642.72, 2051.59, 600.261, 1.71042, 0, 0, 0.754709, 0.65606, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268749, 193713, 571, 0, 0, 1, 1, 7642.54, 2051.88, 600.25, 1.84476, 0, 0, 0.797041, 0.603925, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268748, 193714, 571, 0, 0, 1, 1, 7642.29, 2051.72, 600.264, -1.42244, 0, 0, -0.652758, 0.757566, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268747, 193715, 571, 0, 0, 1, 1, 7642.14, 2051.82, 600.262, -0.93375, 0, 0, -0.450098, 0.892979, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268746, 193716, 571, 0, 0, 1, 1, 7642.39, 2051.59, 600.24, -2.64417, 0, 0, -0.96923, 0.246155, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268745, 193717, 571, 0, 0, 1, 1, 7642.18, 2051.6, 600.461, -1.10828, 0, 0, -0.526212, 0.850353, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268744, 193718, 571, 0, 0, 1, 1, 7641.95, 2051.51, 600.24, 2.92342, 0, 0, 0.994056, 0.10887, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268743, 193719, 571, 0, 0, 1, 1, 7642.19, 2066.25, 601.511, -1.96349, 0, 0, -0.831468, 0.555572, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268742, 193720, 571, 0, 0, 1, 1, 7639.41, 2049.98, 600.681, 0.750491, 0, 0, 0.366501, 0.930418, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268741, 193721, 571, 0, 0, 1, 1, 7636.48, 2046.31, 600.13, 2.09439, 0, 0, 0.866024, 0.500002, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268740, 193722, 571, 0, 0, 1, 1, 7636.71, 2047.29, 601.309, 3.01067, 0, 0, 0.997858, 0.0654146, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268739, 193723, 571, 0, 0, 1, 1, 7636.35, 2046.3, 601.35, 0.575958, 0, 0, 0.284015, 0.95882, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268738, 193724, 571, 0, 0, 1, 1, 7644.04, 2052.39, 600.233, 0.706858, 0, 0, 0.346117, 0.938191, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268737, 193725, 571, 0, 0, 1, 1, 7644.38, 2052.46, 600.238, -1.68424, 0, 0, -0.746056, 0.665883, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268736, 193726, 571, 0, 0, 1, 1, 7644.18, 2052.06, 600.239, 2.08567, 0, 0, 0.863836, 0.503773, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268735, 193727, 571, 0, 0, 1, 1, 7629.88, 2076.93, 600.247, 0.584686, 0, 0, 0.288197, 0.957571, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268734, 193728, 571, 0, 0, 1, 1, 7628.88, 2076.95, 601.116, -0.017419, 0, 0, -0.00870939, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268733, 193729, 571, 0, 0, 1, 1, 7627.84, 2076.87, 600.247, -0.811576, 0, 0, -0.394743, 0.918792, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268732, 193730, 571, 0, 0, 1, 1, 7613.63, 2067.52, 600.23, 2.80997, 0, 0, 0.986285, 0.165053, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268731, 193731, 571, 0, 0, 1, 1, 7613.7, 2066.87, 600.339, -0.549681, 0, 0, -0.271393, 0.962469, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268730, 193732, 571, 0, 0, 1, 1, 7613.58, 2067.85, 600.361, 0.759044, 0, 0, 0.370477, 0.928842, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268729, 193733, 571, 0, 0, 1, 1, 7614.12, 2068.63, 600.244, 2.86233, 0, 0, 0.990267, 0.139178, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268728, 193734, 571, 0, 0, 1, 1, 7614.18, 2069.15, 600.269, 2.27762, 0, 0, 0.908136, 0.418675, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268727, 193735, 571, 0, 0, 1, 1, 7613.96, 2068.4, 600.263, -0.872663, 0, 0, -0.422618, 0.906308, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268726, 193736, 571, 0, 0, 1, 1, 7618.23, 2070.37, 600.557, -2.3911, 0, 0, -0.930417, 0.366502, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268725, 193737, 571, 0, 0, 1, 1, 7620.95, 2073.95, 600.217, -1.02974, 0, 0, -0.492422, 0.870357, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268724, 193738, 571, 0, 0, 1, 1, 7621.41, 2072.64, 601.433, 1.95477, 0, 0, 0.829038, 0.559192, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268723, 193739, 571, 0, 0, 1, 1, 7621.29, 2074.29, 601.419, 0.157079, 0, 0, 0.0784588, 0.996917, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268722, 193740, 571, 0, 0, 1, 1, 7620.1, 2074.38, 601.421, -0.270523, 0, 0, -0.134849, 0.990866, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268721, 193741, 571, 0, 0, 1, 1, 7628.47, 2043.35, 601.082, 3.09799, 0, 0, 0.999762, 0.0217996, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268720, 193742, 571, 0, 0, 1, 1, 7627.47, 2043.4, 600.216, -2.58308, 0, 0, -0.961261, 0.275641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268719, 193743, 571, 0, 0, 1, 1, 7629.51, 2043.4, 600.216, 2.30383, 0, 0, 0.913544, 0.406739, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268718, 193744, 571, 0, 0, 1, 1, 7611.47, 2060.24, 601.099, 1.47483, 0, 0, 0.672377, 0.740209, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268717, 193745, 571, 0, 0, 1, 1, 7611.44, 2061.46, 600.23, 2.07694, 0, 0, 0.861629, 0.507539, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268716, 193746, 571, 0, 0, 1, 1, 7611.34, 2059.42, 600.23, 0.680679, 0, 0, 0.333807, 0.942641, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268715, 193747, 571, 0, 0, 1, 1, 7619.74, 2047, 600.14, -2.15548, 0, 0, -0.88089, 0.47332, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268714, 193748, 571, 0, 0, 1, 1, 7621.17, 2048.11, 600.035, -3.08918, 0, 0, -0.999657, 0.0262033, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268713, 193749, 571, 0, 0, 1, 1, 7621.34, 2045.82, 600.008, -0.418879, 0, 0, -0.207912, 0.978148, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268712, 193750, 571, 0, 0, 1, 1, 7614.78, 2052.48, 600.129, 0.759219, 0, 0, 0.370558, 0.928809, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268711, 193751, 571, 0, 0, 1, 1, 7614.74, 2052.61, 601.349, -0.759215, 0, 0, -0.370556, 0.92881, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268710, 193752, 571, 0, 0, 1, 1, 7614.64, 2053.23, 601.321, -2.1293, 0, 0, -0.874619, 0.48481, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268709, 193753, 571, 0, 0, 1, 1, 7615, 2053.27, 601.319, -1.44862, 0, 0, -0.662619, 0.748957, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268708, 193754, 571, 0, 0, 1, 1, 7630.59, 2060.2, 600.165, 0.017454, 0, 0, 0.00872689, 0.999962, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268707, 193755, 571, 0, 0, 1, 1, 7617.74, 2050.14, 600.669, -0.802851, 0, 0, -0.390731, 0.920505, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268706, 193756, 571, 0, 0, 1, 1, 7628.6, 2060.2, 598.534, -0.139624, 0, 0, -0.0697553, 0.997564, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268705, 193757, 571, 0, 0, 1, 1, 7628.6, 2060.2, 599.632, -1.66679, 0, 0, -0.740218, 0.672367, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268704, 193758, 571, 0, 0, 1, 1, 7628.88, 2060.11, 600.495, -1.56207, 0, 0, -0.704015, 0.710185, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268703, 193759, 571, 0, 0, 1, 1, 7629.98, 2061.77, 600.244, -2.93214, 0, 0, -0.994521, 0.104535, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268702, 193760, 571, 0, 0, 1, 1, 7630.54, 2062.55, 600.248, -2.0333, 0, 0, -0.85035, 0.526218, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268701, 193761, 571, 0, 0, 1, 1, 7629.73, 2062.71, 600.258, 2.95833, 0, 0, 0.995805, 0.0915032, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268700, 193762, 571, 0, 0, 1, 1, 7625.66, 2060.04, 604.195, -3.05428, 0, 0, -0.999047, 0.0436424, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268699, 193763, 571, 0, 0, 1, 1, 7625.77, 2060.06, 600.887, 0.063894, 0, 0, 0.0319416, 0.99949, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268698, 193764, 571, 0, 0, 1, 1, 7625.87, 2060.05, 604.27, 0.07854, 0, 0, 0.0392599, 0.999229, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268697, 193765, 571, 0, 0, 1, 1, 7635.56, 2046.72, 601.668, 1.26947, 0, 0, 0.592964, 0.805229, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268692, 193579, 571, 0, 0, 1, 1, 7629.04, 2060.18, 599.815, -0.698131, 0, 0, -0.34202, 0.939693, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268695, 193796, 571, 0, 0, 1, 1, 7628.96, 2060.49, 586.427, -2.57972, 0, 0, -0.960796, 0.277255, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268694, 193582, 571, 0, 0, 1, 1, 7628.51, 2059.91, 600.259, -1.41372, 0, 0, -0.649449, 0.760405, 300, 100, 1, 0);
INSERT INTO `gameobject` VALUES (268693, 193982, 571, 0, 0, 1, 1, 7628.73, 2060.22, 599.815, 0, 0, 0, 0, 1, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268696, 193766, 571, 0, 0, 1, 1, 7637.41, 2072.36, 600.272, 1.24824, 0, 0, 0.584383, 0.811478, 180, 255, 1, 0);
INSERT INTO `gameobject` VALUES (268691, 193984, 571, 0, 0, 1, 1, 7610.18, 2065.31, 599.426, 2.87979, 0, 0, 0.991445, 0.130528, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268690, 193984, 571, 0, 0, 1, 1, 7609.86, 2055.53, 599.494, -2.86234, 0, 0, -0.990268, 0.139173, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268689, 193984, 571, 0, 0, 1, 1, 7647.42, 2065.23, 599.308, 0.279252, 0, 0, 0.139173, 0.990268, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268688, 193984, 571, 0, 0, 1, 1, 7647.47, 2055.55, 599.399, -0.279252, 0, 0, -0.139173, 0.990268, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (268840, 193696, 571, 0, 0, 1, 1, 7897.64, 2071.74, 600.272, 2.60926, 0, 0, 0.964786, 0.263035, 180, 255, 1, 0);


-- END OF INFRA-GREEN QUESTS -----------------