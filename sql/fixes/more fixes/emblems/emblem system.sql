
-- Daily quest RDF 
DELETE FROM quest_template WHERE id IN (24788, 45000, 45001, 45002);
-- Heroism
INSERT INTO `quest_template` VALUES (24788, 2, 80, 80, 0, 0, 0, 0, 0, 0, 0, 0, 8, 222000, 264600, 0, 0, 0, 0, 0, 128, 0, 40752, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Daily Heroic Random (1st)', '', '', '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Conquest
INSERT INTO `quest_template` VALUES (45000, 2, 80, 80, 0, 0, 0, 0, 0, 0, 0, 0, 8, 222000, 264600, 0, 0, 0, 0, 0, 128, 0, 45624, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Daily Heroic Random (1st)', '', '', '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Triumph
INSERT INTO `quest_template` VALUES (45001, 2, 80, 80, 0, 0, 0, 0, 0, 0, 0, 0, 8, 222000, 264600, 0, 0, 0, 0, 0, 128, 0, 47241, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Daily Heroic Random (1st)', '', '', '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);

-- Frost
INSERT INTO `quest_template` VALUES (45002, 2, 80, 80, 0, 0, 0, 0, 0, 0, 0, 0, 8, 222000, 264600, 0, 0, 0, 0, 0, 128, 0, 49426, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Daily Heroic Random (1st)', '', '', '', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 12340);


DELETE FROM quest_template_addon WHERE id IN (24788, 45000, 45001, 45002);
INSERT INTO `quest_template_addon` VALUES (24788, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9);
INSERT INTO `quest_template_addon` VALUES (45000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9);
INSERT INTO `quest_template_addon` VALUES (45001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9);
INSERT INTO `quest_template_addon` VALUES (45002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9);



/*
-- Nexus
(26731, 26763, 26794, 26723); 26796 A hc, 26798 H hc
-- Azjol-Nerub
(28684, 28921, 29120);
-- Ahn'kahet
(29309, 29308, 29310, 29311); 30258 hc
-- Drak'Tharon Keep
(26630, 26631, 27483, 26632);
-- The Violet Hold
(29315, 29316, 29313, 29266, 29312, 29314, 31134);
-- Gundrak
(29304, 29305, 29306, 29307(coloso), 29573 (elemental)); 29932hc
-- Halls of Stone
(27975, 27977, 28234 chest, 27978);
-- Halls of Lighting
(28586, 28587, 28546, 28923);
-- The Culling of Stratholme
(26529, 26530, 26532, 26533); 32273hc
-- The Oculus
(27654, 27447, 27655, 27656, CHEST);
-- Utgarde Pinnacle
(26668, 26687, 26693, 26861);

*/

-- Utgarde Keep
DELETE FROM creature_loot_template WHERE entry IN(30748, 31656, 31679, 31674) AND item IN(40752, 45624, 47241, 49426);
INSERT INTO `creature_loot_template` VALUES (30748, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30748, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30748, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31656, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31656, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31656, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31679, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31679, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31679, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31674, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31674, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31674, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);


-- Nexus 
DELETE FROM creature_loot_template WHERE entry IN(30540,30510,30529,30532,30398,30397) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (30540, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30540, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30540, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30510, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30510, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30510, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30529, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30529, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30529, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30532, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30532, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30532, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30398, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30398, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30398, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30397, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30397, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30397, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Azjol-Nerub
DELETE FROM creature_loot_template WHERE entry IN(31612,31611,31610) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31612, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31612, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31612, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31611, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31611, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31611, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31610, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31610, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31610, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);


-- Ahn'kahet
DELETE FROM creature_loot_template WHERE entry IN(31469,31456,31465,31464,31463) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31469, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31469, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31469, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31456, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31456, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31456, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31465, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31465, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31465, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31464, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31464, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31464, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31463, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31463, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31463, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Drak'Tharon Keep
DELETE FROM creature_loot_template WHERE entry IN(31362,31350,31360,31349) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31362, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31362, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31362, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31350, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31350, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31350, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31360, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31360, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31360, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31349, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31349, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31349, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- The Violet Hold
DELETE FROM creature_loot_template WHERE entry IN(31511,31509,31508,31512,31507,31510,31506) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31511, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31511, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31511, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31509, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31509, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31509, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31508, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31508, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31508, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31512, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31512, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31512, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31507, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31507, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31507, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31510, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31510, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31510, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31506, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31506, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31506, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Gundrak
DELETE FROM creature_loot_template WHERE entry IN(31370,30530,31368,31365,31367, 29932) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31370, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31370, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31370, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30530, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30530, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30530, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31368, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31368, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31368, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31365, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31365, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31365, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31367, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31367, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31367, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (29932, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (29932, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (29932, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Halls of Stone
DELETE FROM creature_loot_template WHERE entry IN(31384,31381,31386) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31384, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31384, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31384, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31381, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31381, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31381, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31386, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31386, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31386, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

DELETE FROM gameobject_loot_template WHERE entry IN(26260) AND item IN(40752, 45624, 47241, 49426);
INSERT INTO `gameobject_loot_template` VALUES (26260, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `gameobject_loot_template` VALUES (26260, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `gameobject_loot_template` VALUES (26260, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Halls of Lighting
DELETE FROM creature_loot_template WHERE entry IN(31537,31533,31536,31538) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31537, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31537, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31537, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31533, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31533, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31533, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31536, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31536, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31536, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31538, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31538, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31538, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- The Culling of Stratholme
DELETE FROM creature_loot_template WHERE entry IN(31211,31212,31215,31217,32313) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31211, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31211, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31211, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31212, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31212, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31212, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31215, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31215, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31215, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31217, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31217, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31217, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (32313, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (32313, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (32313, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- The Oculus
DELETE FROM creature_loot_template WHERE entry IN(31559,31558,31560,31561) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (31559, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31559, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31559, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31558, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31558, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31558, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31560, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31560, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31560, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (31561, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31561, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (31561, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);


DELETE FROM gameobject_loot_template WHERE entry IN(24524) AND item IN(40752, 45624, 47241, 49426);
INSERT INTO `gameobject_loot_template` VALUES (24524, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `gameobject_loot_template` VALUES (24524, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `gameobject_loot_template` VALUES (24524, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

-- Utgarde Pinnacle
DELETE FROM creature_loot_template WHERE entry IN(30810,30774,30807,30788) AND item IN(40752, 45624, 47241, 49426);

INSERT INTO `creature_loot_template` VALUES (30810, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30810, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30810, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30774, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30774, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30774, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30807, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30807, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30807, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);

INSERT INTO `creature_loot_template` VALUES (30788, 40752, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30788, 45624, 0, 100, 0, 1, 0, 1, 1, NULL);
INSERT INTO `creature_loot_template` VALUES (30788, 47241, 0, 100, 0, 1, 0, 1, 1, NULL);










-- 24579,24582,24583,24584,24590,24580,24581,24587,24585,24588,24586,24589

/*
INSERT INTO `quest_template` VALUES (24579, 'Sartharion Must Die!');
INSERT INTO `quest_template` VALUES (24580, 'Anub\'Rekhan Must Die!');
INSERT INTO `quest_template` VALUES (24581, 'Noth the Plaguebringer Must Die!');
INSERT INTO `quest_template` VALUES (24582, 'Instructor Razuvious Must Die!');
INSERT INTO `quest_template` VALUES (24583, 'Patchwerk Must Die!');
INSERT INTO `quest_template` VALUES (24584, 'Malygos Must Die!');
INSERT INTO `quest_template` VALUES (24585, 'Flame Leviathan Must Die!');
INSERT INTO `quest_template` VALUES (24586, 'Razorscale Must Die!');
INSERT INTO `quest_template` VALUES (24587, 'Ignis the Furnace Master Must Die!');
INSERT INTO `quest_template` VALUES (24588, 'XT-002 Deconstructor Must Die!');
INSERT INTO `quest_template` VALUES (24589, 'Lord Jaraxxus Must Die!');
INSERT INTO `quest_template` VALUES (24590, 'Lord Marrowgar Must Die!');
*/




DELETE FROM `creature_queststarter` WHERE id=20735 AND quest in(24579,24582,24583,24584,24590,24580,24581,24587,24585,24588,24586,24589);
INSERT INTO `creature_queststarter` VALUES (20735, 24579);
INSERT INTO `creature_queststarter` VALUES (20735, 24580);
INSERT INTO `creature_queststarter` VALUES (20735, 24581);
INSERT INTO `creature_queststarter` VALUES (20735, 24582);
INSERT INTO `creature_queststarter` VALUES (20735, 24583);
INSERT INTO `creature_queststarter` VALUES (20735, 24584);
INSERT INTO `creature_queststarter` VALUES (20735, 24585);
INSERT INTO `creature_queststarter` VALUES (20735, 24586);
INSERT INTO `creature_queststarter` VALUES (20735, 24587);
INSERT INTO `creature_queststarter` VALUES (20735, 24588);
INSERT INTO `creature_queststarter` VALUES (20735, 24589);
INSERT INTO `creature_queststarter` VALUES (20735, 24590);



DELETE FROM conditions WHERE sourceentry IN(24579,24582,24583,24584,24590,24580,24581,24587,24585,24588,24586,24589) AND SourceTypeOrReferenceId=19;

INSERT INTO `conditions` VALUES (19, 0, 24579, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24579, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24580, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24580, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24581, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24581, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24582, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24582, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24583, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24583, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24584, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24584, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24585, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24585, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24586, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24586, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24587, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24587, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24588, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24588, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24589, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24589, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

INSERT INTO `conditions` VALUES (19, 0, 24590, 0, 0, 17, 0, 3916, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 25');
INSERT INTO `conditions` VALUES (19, 0, 24590, 0, 1, 17, 0, 3917, 0, 0, 0, 0, 0, '', 'Show weekly quest "Must die" if player already done ToC 10');

