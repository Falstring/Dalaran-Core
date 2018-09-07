DELETE FROM spell_script_names WHERE spell_id=24930;
INSERT INTO `spell_script_names` VALUES (24930, 'spell_hallowsend_candy');





-- Fire triggers, scriptname and reduce the spawn time.

UPDATE creature_template SET scriptname="npc_fire_brigade" WHERE entry=23537;

-- Effigy
DELETE FROM gameobject WHERE id=186720;
INSERT INTO `gameobject` VALUES (43071, 186720, 530, 0, 0, 1, 1, -4192.38, -12268.1, 1.53389, -1.72788, 0, 0, 0.760406, -0.649448, 2, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43068, 186720, 530, 0, 0, 1, 1, -4207.84, -12276.7, 3.82085, -0.069813, 0, 0, 0.034899, -0.999391, 2, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43073, 186720, 0, 0, 0, 1, 1, -5753.24, -533.652, 404.022, 1.15192, 0, 0, 0.544639, 0.838671, 2, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43080, 186720, 0, 0, 0, 1, 1, -5761.17, -528.193, 403.855, 1.16937, 0, 0, 0.551937, 0.833886, 2, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43081, 186720, 0, 0, 0, 1, 1, -5747.52, -527.634, 400.297, 0.610865, 0, 0, 0.300706, 0.953717, 2, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43049, 186720, 1, 0, 0, 1, 1, 286.565, -4561.45, 27.5742, 2.42601, 0, 0, 0.936672, 0.350207, 5, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43050, 186720, 530, 0, 0, 1, 1, 9235.05, -6783.4, 25.4426, 1.5708, 0, 0, 0.707107, 0.707107, 5, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43056, 186720, 0, 0, 0, 1, 1, 2240.44, 459.159, 38.2838, 0.820305, 0, 0, 0.398749, 0.91706, 5, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43057, 186720, 0, 0, 0, 1, 1, 2239.49, 487.861, 37.3446, -0.715585, 0, 0, 0.350207, -0.936672, 5, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43061, 186720, 0, 0, 0, 1, 1, -9328.25, 56.2778, 62.2509, 2.60054, 0, 0, 0.96363, 0.267238, 180, 100, 1, 0);
INSERT INTO `gameobject` VALUES (43062, 186720, 0, 0, 0, 1, 1, -9314.1, 52.4562, 76.7343, 2.93215, 0, 0, 0.994522, 0.104528, 180, 100, 1, 0);
INSERT INTO `gameobject` VALUES (1035218, 186720, 0, 0, 0, 1, 1, -9324.04, 32.5246, 61.7379, 3.08274, 0, 0, 0.999567, 0.0294243, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035219, 186720, 0, 0, 0, 1, 1, -9317, 87.6567, 60.7713, 2.77736, 0, 0, 0.983462, 0.181112, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035220, 186720, 0, 0, 0, 1, 1, -9283.85, 23.5708, 71.0064, 3.09348, 0, 0, 0.999711, 0.0240541, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035221, 186720, 0, 0, 0, 1, 1, -9291.64, 90.6565, 69.0446, 3.21255, 0, 0, 0.999371, -0.0354731, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035222, 186720, 0, 0, 0, 1, 1, 2276.14, 504.402, 35.3195, 4.12927, 0, 0, 0.88052, -0.474009, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035223, 186720, 0, 0, 0, 1, 1, 2307.5, 477.839, 35.0541, 3.53075, 0, 0, 0.981129, -0.193355, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035224, 186720, 0, 0, 0, 1, 1, 2216.9, 471.454, 46.8839, 0.137833, 0, 0, 0.0688622, 0.997626, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035225, 186720, 0, 0, 0, 1, 1, 2243.61, 509.87, 35.2904, 4.94992, 0, 0, 0.618342, -0.785909, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035226, 186720, 0, 0, 0, 1, 1, 2265.77, 444.659, 34.5152, 5.09356, 0, 0, 0.560352, -0.828255, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035227, 186720, 0, 0, 0, 1, 1, 2309.3, 450.608, 34.3177, 3.44296, 0, 0, 0.988669, -0.150115, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035228, 186720, 0, 0, 0, 1, 1, -5735.53, -536.194, 400.147, 1.99647, 0, 0, 0.840516, 0.541786, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (1035229, 186720, 0, 0, 0, 1, 1, -5769.23, -521.757, 401.139, 0.155549, 0, 0, 0.0776961, 0.996977, 300, 0, 1, 0);

-- Fire DND
DELETE FROM creature WHERE id=23537;
INSERT INTO `creature` VALUES (86849, 23537, 530, 0, 0, 1, 1, 11686, 0, -4148.74, -12485.3, 53.2607, 1.44862, 15, 0, 0, 1, 6443, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (86850, 23537, 530, 0, 0, 1, 1, 11686, 0, -4123.58, -12481.3, 44.8596, 1.11701, 15, 0, 0, 1, 6443, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85702, 23537, 530, 0, 0, 1, 1, 0, 0, -4207.84, -12276.7, 4.82085, -0.069813, 15, 0, 0, 45780, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85703, 23537, 0, 0, 0, 1, 1, 0, 0, -5753.24, -533.652, 405.022, 1.15192, 15, 0, 0, 45780, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85701, 23537, 530, 0, 0, 1, 1, 0, 0, -4192.38, -12268.1, 2.53389, -1.72788, 15, 0, 0, 45780, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85704, 23537, 0, 0, 0, 1, 1, 0, 0, -5761.17, -528.193, 404.855, 1.16937, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85705, 23537, 0, 0, 0, 1, 1, 0, 0, -5747.52, -527.634, 401.297, 0.610865, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85706, 23537, 1, 0, 0, 1, 1, 0, 0, 286.565, -4561.45, 28.5742, 2.42601, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85707, 23537, 530, 0, 0, 1, 1, 0, 0, 9235.05, -6783.4, 26.4426, 1.5708, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85708, 23537, 0, 0, 0, 1, 1, 0, 0, 2240.44, 459.159, 39.2838, 0.820305, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85709, 23537, 0, 0, 0, 1, 1, 0, 0, 2239.49, 487.861, 38.3446, -0.715585, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85710, 23537, 0, 0, 0, 1, 1, 0, 0, -9328.25, 56.2778, 63.2509, 2.60054, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (85711, 23537, 0, 0, 0, 1, 1, 0, 0, -9314.1, 52.4562, 77.7343, 2.93215, 15, 0, 0, 15260, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422381, 23537, 0, 0, 0, 1, 1, 0, 0, -9324.04, 32.5246, 61.7379, 3.08274, 300, 0, 0, 2835, 7196, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422382, 23537, 0, 0, 0, 1, 1, 0, 0, -9317, 87.6567, 60.7713, 2.77736, 300, 0, 0, 2759, 7031, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422383, 23537, 0, 0, 0, 1, 1, 0, 0, -9283.85, 23.5708, 71.0064, 3.09348, 300, 0, 0, 2684, 6882, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422384, 23537, 0, 0, 0, 1, 1, 0, 0, -9291.64, 90.6565, 69.0446, 3.21255, 300, 0, 0, 2552, 6588, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422385, 23537, 0, 0, 0, 1, 1, 0, 0, 2276.14, 504.402, 35.3195, 4.12927, 300, 0, 0, 2552, 6588, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422386, 23537, 0, 0, 0, 1, 1, 0, 0, 2307.5, 477.839, 35.0541, 3.53075, 300, 0, 0, 2467, 6443, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422387, 23537, 0, 0, 0, 1, 1, 0, 0, 2216.9, 471.454, 46.8839, 0.137833, 300, 0, 0, 2552, 6588, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422388, 23537, 0, 0, 0, 1, 1, 0, 0, 2243.61, 509.87, 35.2904, 4.94992, 300, 0, 0, 2610, 6749, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422389, 23537, 0, 0, 0, 1, 1, 0, 0, 2265.77, 444.659, 34.5152, 5.09356, 300, 0, 0, 2610, 6749, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422390, 23537, 0, 0, 0, 1, 1, 0, 0, 2309.3, 450.608, 34.3177, 3.44296, 300, 0, 0, 2610, 6749, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422391, 23537, 0, 0, 0, 1, 1, 0, 0, -5735.53, -536.194, 400.147, 1.99647, 300, 0, 0, 2759, 7031, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422392, 23537, 0, 0, 0, 1, 1, 0, 0, -5769.23, -521.757, 401.139, 0.155549, 300, 0, 0, 2467, 6443, 0, 0, 0, 0, 0);




UPDATE creature SET spawntimesecs=15 WHERE id=23537;


-- Headless Horseman NPC for the events.

DELETE FROM creature_template WHERE entry=255000;
INSERT INTO `creature_template` VALUES (255000, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Headless Horseman event controller', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 1, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 1, 1, 0, 0, 1, 0, 128, 'npc_hallowsend_event_controller', 12340);


-- Spawn

DELETE FROM creature WHERE id IN(255000);
INSERT INTO `creature` VALUES (280011, 255000, 0, 0, 0, 1, 1, 0, 0, -9465.54, 63.2228, 55.8587, 6.25841, 300, 0, 0, 7185, 7196, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421865, 255000, 0, 0, 0, 1, 1, 0, 0, 2258.61, 292.038, 34.1138, 3.89801, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);



DELETE FROM creature_template WHERE entry=255001;
INSERT INTO `creature_template` VALUES (255001, 0, 0, 0, 0, 0, 169, 16925, 0, 0, 'Fire spot', '', NULL, 0, 60, 60, 0, 14, 0, 1, 0.99206, 1, 0, 0, 2000, 0, 1, 1, 1, 33555200, 2048, 8, 0, 0, 0, 0, 0, 10, 16778240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 4, 1, 1.35, 1, 1, 1, 1, 0, 0, 1, 0, 128, '', 12340);

-- Spawn

DELETE FROM creature WHERE id=255001;
INSERT INTO `creature` VALUES (7421531, 255001, 0, 0, 0, 1, 1, 0, 0, -9451.73, 34.9444, 70.6721, 1.53919, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421532, 255001, 0, 0, 0, 1, 1, 0, 0, -9471.31, 41.5561, 75.2567, 1.34908, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421533, 255001, 0, 0, 0, 1, 1, 0, 0, -9458.96, 43.0257, 64.1366, 1.44856, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421534, 255001, 0, 0, 0, 1, 1, 0, 0, -9463.85, 36.0097, 71.1758, 1.19265, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421535, 255001, 0, 0, 0, 1, 1, 0, 0, -9449.94, 70.6833, 56.5116, 3.30454, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421536, 255001, 0, 0, 0, 1, 1, 0, 0, -9453.2, 84.5229, 66.5073, 5.70307, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421537, 255001, 0, 0, 0, 1, 1, 0, 0, -9462.25, 82.7316, 68.3859, 4.69448, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421538, 255001, 0, 0, 0, 1, 1, 0, 0, -9442.83, 89.7918, 57.7092, 4.65927, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7421539, 255001, 0, 0, 0, 1, 1, 0, 0, -9479.58, 46.6745, 57.2062, 0.599853, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422022, 255001, 0, 0, 0, 1, 1, 0, 0, 2250.2, 254.591, 48.7218, 2.62516, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422023, 255001, 0, 0, 0, 1, 1, 0, 0, 2241.07, 241.701, 51.2932, 2.0866, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422024, 255001, 0, 0, 0, 1, 1, 0, 0, 2269.34, 256.65, 50.9031, 0.894668, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422025, 255001, 0, 0, 0, 1, 1, 0, 0, 2280.69, 246.513, 52.2755, 6.1197, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422026, 255001, 0, 0, 0, 1, 1, 0, 0, 2255.14, 237.603, 51.8582, 2.94019, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422027, 255001, 0, 0, 0, 1, 1, 0, 0, 2264.65, 285.547, 34.4232, 1.90774, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422028, 255001, 0, 0, 0, 1, 1, 0, 0, 2280.26, 270.51, 35.1781, 5.95302, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422029, 255001, 0, 0, 0, 1, 1, 0, 0, 2287.34, 275.861, 49.9121, 1.22087, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422030, 255001, 0, 0, 0, 1, 1, 0, 0, 2297.65, 266.51, 51.9939, 6.18436, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422031, 255001, 0, 0, 0, 1, 1, 0, 0, 2286.6, 287.21, 49.1137, 4.2998, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422032, 255001, 0, 0, 0, 1, 1, 0, 0, 2238.66, 309.982, 46.9046, 4.54703, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422033, 255001, 0, 0, 0, 1, 1, 0, 0, 2234.28, 301.883, 44.8039, 4.95596, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422034, 255001, 0, 0, 0, 1, 1, 0, 0, 2232.71, 296.394, 35.1889, 5.29303, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (7422035, 255001, 0, 0, 0, 1, 1, 0, 0, 2253.76, 266.536, 36.4839, 2.06068, 300, 0, 0, 4121, 0, 0, 0, 0, 0, 0);

-- Water barrels

DELETE FROM gameobject WHERE id=186234;
INSERT INTO `gameobject` VALUES (2134533, 186234, 0, 0, 0, 1, 1, 2292.61, 429.089, 35.323, 1.91571, 0, 0, 0.81796, 0.575275, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (2134532, 186234, 0, 0, 0, 1, 1, 2230.87, 276.912, 35.0742, 0.611079, 0, 0, 0.300808, 0.953685, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (2134531, 186234, 0, 0, 0, 1, 1, -9373.46, 52.6322, 61.0714, 6.20813, 0, 0, 0.037517, -0.999296, 300, 0, 1, 0);
INSERT INTO `gameobject` VALUES (2134530, 186234, 0, 0, 0, 1, 1, -9427.99, 60.3054, 57.0056, 3.43599, 0, 0, 0.989186, -0.146665, 300, 0, 1, 0);


-- Hallow's End Black cat spawn.

DELETE FROM creature WHERE id=22816;
INSERT INTO `creature` VALUES (8535719, 22816, 571, 0, 0, 1, 1, 0, 0, 5791, 633.639, 647.497, 2.55106, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535720, 22816, 571, 0, 0, 1, 1, 0, 0, 5807.59, 657.895, 647.926, 2.69714, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535722, 22816, 571, 0, 0, 1, 1, 0, 0, 5905.74, 541.837, 649.873, 2.47395, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535723, 22816, 571, 0, 0, 1, 1, 0, 0, 5883.66, 531.483, 641.566, 4.92439, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535724, 22816, 571, 0, 0, 1, 1, 0, 0, 5975.91, 623.729, 650.627, 0.153097, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535725, 22816, 571, 0, 0, 1, 1, 0, 0, 5961.65, 601.148, 650.627, 3.84839, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535726, 22816, 571, 0, 0, 1, 1, 0, 0, 5923.6, 642.526, 645.346, 2.70957, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535727, 22816, 571, 0, 0, 1, 1, 0, 0, 5907.17, 627.351, 646.867, 4.15077, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535728, 22816, 571, 0, 0, 1, 1, 0, 0, 5885.92, 684.39, 642.985, 2.11958, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535729, 22816, 571, 0, 0, 1, 1, 0, 0, 5854.88, 720.355, 639.771, 1.03966, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535730, 22816, 571, 0, 0, 1, 1, 0, 0, 5815.48, 752.958, 640.399, 2.26488, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535731, 22816, 571, 0, 0, 1, 1, 0, 0, 5793.29, 771.263, 661.279, 1.29099, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535732, 22816, 571, 0, 0, 1, 1, 0, 0, 5767.63, 710.535, 641.696, 1.96643, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535733, 22816, 571, 0, 0, 1, 1, 0, 0, 5719.32, 736.119, 641.768, 3.30946, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535734, 22816, 571, 0, 0, 1, 1, 0, 0, 5755.1, 744.053, 653.665, 0.20321, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535735, 22816, 571, 0, 0, 1, 1, 0, 0, 5740.53, 669.313, 644.604, 3.87102, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535736, 22816, 571, 0, 0, 1, 1, 0, 0, 5693.68, 670.847, 645.912, 0.250334, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535737, 22816, 571, 0, 0, 1, 1, 0, 0, 5635.85, 676.232, 651.993, 3.30161, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535738, 22816, 571, 0, 0, 1, 1, 0, 0, 5634.85, 697.192, 651.993, 1.6719, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535739, 22816, 571, 0, 0, 1, 1, 0, 0, 5702.25, 639.664, 646.249, 5.47716, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535740, 22816, 571, 0, 0, 1, 1, 0, 0, 5727.52, 542.129, 652.757, 4.17733, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535741, 22816, 571, 0, 0, 1, 1, 0, 0, 5815.71, 542.621, 651.127, 5.35543, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535742, 22816, 571, 0, 0, 1, 1, 0, 0, 5818.06, 470.404, 658.777, 4.29906, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535743, 22816, 571, 0, 0, 1, 1, 0, 0, 5826.19, 416.69, 657.598, 0.372066, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535744, 22816, 0, 0, 0, 1, 1, 0, 0, 2241.83, 271.558, 34.1139, 1.01097, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535745, 22816, 0, 0, 0, 1, 1, 0, 0, 2278.37, 304.075, 34.8616, 0.669325, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535746, 22816, 0, 0, 0, 1, 1, 0, 0, 2277.7, 345.853, 34.5082, 1.5097, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535747, 22816, 0, 0, 0, 1, 1, 0, 0, 2264.48, 483.986, 33.7626, 1.84742, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535748, 22816, 0, 0, 0, 1, 1, 0, 0, -9466.27, 71.714, 56.4604, 2.92046, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535749, 22816, 0, 0, 0, 1, 1, 0, 0, -9458.92, 50.9385, 56.5062, 4.42843, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535750, 22816, 0, 0, 0, 1, 1, 0, 0, -9427.74, 74.4454, 56.5108, 0.642806, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535751, 22816, 0, 0, 0, 1, 1, 0, 0, -9346.79, 35.7747, 62.0876, 0.913766, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535752, 22816, 0, 0, 0, 1, 1, 0, 0, -8813.42, 645.799, 94.229, 0.590184, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535753, 22816, 0, 0, 0, 1, 1, 0, 0, -8861.27, 640.235, 96.1488, 3.20556, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535754, 22816, 0, 0, 0, 1, 1, 0, 0, -8915.25, 626.218, 99.5228, 3.49223, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535755, 22816, 0, 0, 0, 1, 1, 0, 0, -8835.95, 544.761, 96.8225, 4.2305, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535756, 22816, 0, 0, 0, 1, 1, 0, 0, -8765.12, 652.536, 103.498, 5.43786, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535757, 22816, 1, 0, 0, 1, 1, 0, 0, 1669.35, -4420.5, 17.7313, 2.85017, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535758, 22816, 1, 0, 0, 1, 1, 0, 0, 1605.2, -4389.34, 10.1936, 1.46787, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535759, 22816, 1, 0, 0, 1, 1, 0, 0, 1567.93, -4427, 7.12268, 4.29137, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535760, 22816, 1, 0, 0, 1, 1, 0, 0, 1663.88, -4351.78, 30.5681, 0.870966, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature` VALUES (8535761, 22816, 1, 0, 0, 1, 1, 0, 0, 1617.82, -4432.07, 10.5188, 5.84252, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0);


-- Daily quests min level requirement.

 UPDATE quest_template SET MinLevel=10 WHERE id IN(11360, 11439, 11440, 11131, 11219, 12135, 12139);

-- Matron spawn.
UPDATE creature_template SET scriptname="npc_hallowsend_orphan_matron" where entry IN(24519, 23973);



UPDATE creature_template SET minlevel=11, maxlevel=11, InhabitType=4, flags_extra=0, scriptname="npc_shade_horseman" where entry=23543;


UPDATE quest_template SET RewardItem1=34077, RewardAmount1=1 WHERE id IN(12155, 12133);


-- Delete the quest to avoid dobule spawn on the instance.

-- DELETE FROM gameobject_queststarter where quest IN(11404, 11401, 11405, 11392);

-- Headless Horseman Inhabyttype.

UPDATE creature_template SET minlevel=80, maxlevel=80 WHERE entry=23545;

UPDATE creature_template SET InhabitType=4 WHERE entry=23682;

-- Fiends

-- UPDATE creature_template SET modelid1=11686 WHERE entry=23686;

UPDATE creature_template SET scriptname="npc_hh_pumpkin_fiend", healthmodifier=1.3, damagemodifier=2 WHERE entry=23545;
-- Textos

DELETE FROM creature_text WHERE entry=23543;
INSERT INTO `creature_text` VALUES (23543, 0, 0, 'Prepare yourselves, the bells have tolled! Shelter your weak, your young and your old! Each of you shall pay the final sum! Cry for mercy; the reckoning has come!', 14, 0, 100, 0, 0, 11966, 0, 0, 'HH Event Start');
INSERT INTO `creature_text` VALUES (23543, 1, 0, 'Harken, cur! Tis you I spurn! Now feel... the burn!', 14, 0, 100, 0, 0, 12573, 0, 0, 'HH ');
INSERT INTO `creature_text` VALUES (23543, 2, 0, 'The sky is dark. The fire burns. You strive in vain as Fate\'s wheel turns.', 14, 0, 100, 0, 0, 12570, 0, 0, 'HH ');
INSERT INTO `creature_text` VALUES (23543, 3, 0, '', 14, 0, 100, 0, 0, 11965, 0, 0, 'HH just laugh ');
INSERT INTO `creature_text` VALUES (23543, 4, 0, 'My flames have died, left not a spark! I shall send you myself to the lifeless dark!', 14, 0, 100, 0, 0, 11968, 0, 0, 'HH ');
INSERT INTO `creature_text` VALUES (23543, 5, 0, 'So eager you are, for my blood to spill. Yet to vanquish me, \'tis my head you must kill!', 14, 0, 100, 0, 0, 11969, 0, 0, 'HH ');

 
-- Remove the faction fromt he Wickerman ember so both factions can bennefit from 

UPDATE gameobject_template SET faction=0 WHERE entry=180437;



-- Horseman Loot removal.

DELETE FROM creature_loot_template WHERE entry=23682 AND item=33277;

-- Wands

-- Pirate.
 UPDATE item_template SET spellid_1=24717 WHERE entry=20397;

 UPDATE item_template SET spellid_1=24718 WHERE entry=20398;

 UPDATE item_template SET spellid_1=24719 WHERE entry=20399;

  UPDATE item_template SET spellid_1=24737 WHERE entry=20409;

DELETE FROM spell_linked_spell WHERE spell_trigger IN(24717, 24718, 24719, 24737);
INSERT INTO `spell_linked_spell` VALUES (24717, 24708, 0, 'Pirate custom triggered');
INSERT INTO `spell_linked_spell` VALUES (24718, 24711, 0, 'Ninja costume triggered');
INSERT INTO `spell_linked_spell` VALUES (24719, 24713, 0, 'Lepper gnome costume');
INSERT INTO `spell_linked_spell` VALUES (24737, 24735, 0, 'Ghost costume');
-- Cat and debuff.
UPDATE creature_template SET scriptname="npc_hallowsend_cat" WHERE entry=22816;
  













/*         HACER UN BACK UP ANTES SIN FALTA DE LA TABLA CHARACTERS_QUESTSTATUS_REWARDED */
-- Reset past years Candy bucket quests.

/*DELETE FROM character_queststatus_rewarded  where quest in(12286,12331,12332,12333,12334,12335,12336,12337,12338,12339,12340,12341,12342,12343,12344,12345,12346,12347,12348,12349,12350,12351,12352,12353,12354,12355,12356,12357,12358,12359,12360,12361,12362,12363,12364,12365,12366,12367,12368,12369,12370,12371,12373,12374,12375,12376,12377,12378,12379,12380,12381,12382,12383,12384,12385,12386,12387,12388,12389,12390,12391,12392,12393,12394,12395,12396,12397,12398,12399,12400,12401,12402,12403,12404,12405,12406,12407,12408,12409,12410,12940,12941,12944,12945,12946,12947,12950,13463,13433,13434,13435,13436,13437,13438,13439,13448,13452,13456,13459,13460,13461,13462,13464,13465,13466,13467,13468,13469,13470,13471,13472,13473,13474,13501,13548);*/



