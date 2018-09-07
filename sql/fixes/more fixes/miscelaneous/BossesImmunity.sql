-- FULL IMMUNITY
UPDATE `creature_template` SET `mechanic_immune_mask` = 0 WHERE entry IN
(28860,31311, -- Sartharion, 10 and 25 Man.

26731, -- The Nexus / Grand Magus Telestra. 
26763, -- The Nexus / Anomalus.
26794, -- The Nexus / Ormorok the Tree-Shaper.
26723, -- The Nexus / Keristrasza.
26796, -- The Nexus / Commander Stoutbeard.
26798, -- The Nexus / Commander Kolurg.

28923, -- Halls of Lightning / Loken.
28586, -- Halls of Lightning / General Bjarngrim.
28587, -- Halls of Lightning / Volkhan.
28546, -- Halls of Lightning / Ionar.

36502, -- The Forge of Souls / Devourer of Souls.
36497, -- The Forge of Souls / Bronjahm.

36658, -- The Pit of Saron / Scourgelord Tyrannus.
36494, -- The Pit of Saron / Forgemaster Garfrost.
36476, -- The Pit of Saron / Ick.

27975, -- Halls of Stone / Maiden of Grief.
27977, -- Halls of Stone / Krystallus.
27978, -- Halls of Stone / Sjonnir The Ironshaper.

26529, -- The Culling of Stratholme / Meathook.
26530, -- The Culling of Stratholme / Salramm the Fleshcrafter.
26532, -- The Culling of Stratholme / Chrono-Lord Epoch.
26533, -- The Culling of Stratholme / Mal'Ganis.

27654, -- The Oculus / Drakos the Interrogator
27447, -- The Oculus / Varos Cloudstrider.
27655, -- The Oculus / Mage-Lord Urom.
27656, -- The Oculus / Ley-Guardian Eregos.

29315, -- The Violet Hold / Erekem.
29316, -- The Violet Hold / Moragg
29313, -- The Violet Hold / Ichoron.
29266, -- The Violet Hold / Xevozz.
29312, -- The Violet Hold / Lavanthor.
29314, -- The Violet Hold / Zuramat the Obliterator.
31134, -- The Violet Hold / Cyanigosa.

29304, -- Gundrak / Slad'Ran.
29932, -- Gundrak / Eck the Ferocious.
29307, -- Gundrak / Drakkari Colossus.
29573, -- Gundrak / Drakkari Elemental.
29306, -- Gundrak / Gal'darah.

26630, -- Drak'Tharon / Trollgore.
27483, -- Drak'Tharon / King Dred.
26632, -- Drak'Tharon / The Prophet Tharon'ja.

29311, -- Ahn'kahet / Heralz Volazj. 
30258, -- Ahn'kahet / Amanitar.
29309, -- Ahn'kahet / Elder Nadox. 
29308, -- Ahn'kahet / Prince Taldaram
29310, -- Ahn'kahet / Jedoga Shadowseeker

23953, -- Utgarde Keep / Prince Keleseth.
24200, -- Utgarde Keep / Skarvald The Constructor.
24201, -- Utgarde Keep / Dalronn the Controller.
23954, -- Utgarde Keep / Ingvar the Plunderer.

26668, -- Utgarde Pinnacle / Svala Sorrowgrave.
26687, -- Utgarde Pinnacle / Gortok Palehoof.
26693, -- Utgarde Pinnacle / Skadi the Ruthless.
26861  -- Utgarde Pinnacle / King Ymiron.
);

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN 
(28860,31311, -- Sartharion, 10 and 25 Man.

26731, -- The Nexus / Grand Magus Telestra. 
26763, -- The Nexus / Anomalus.
26794, -- The Nexus / Ormorok the Tree-Shaper.
26723, -- The Nexus / Keristrasza.
26796, -- The Nexus / Commander Stoutbeard.
26798, -- The Nexus / Commander Kolurg.

28923, -- Halls of Lightning / Loken.
28586, -- Halls of Lightning / General Bjarngrim.
28587, -- Halls of Lightning / Volkhan.
28546, -- Halls of Lightning / Ionar.

36502, -- The Forge of Souls / Devourer of Souls.
36497, -- The Forge of Souls / Bronjahm.

36658, -- The Pit of Saron / Scourgelord Tyrannus.
36494, -- The Pit of Saron / Forgemaster Garfrost.
36476, -- The Pit of Saron / Ick.

27975, -- Halls of Stone / Maiden of Grief.
27977, -- Halls of Stone / Krystallus.
27978, -- Halls of Stone / Sjonnir The Ironshaper.

26529, -- The Culling of Stratholme / Meathook.
26530, -- The Culling of Stratholme / Salramm the Fleshcrafter.
26532, -- The Culling of Stratholme / Chrono-Lord Epoch.
26533, -- The Culling of Stratholme / Mal'Ganis.

27654, -- The Oculus / Drakos the Interrogator
27447, -- The Oculus / Varos Cloudstrider.
27655, -- The Oculus / Mage-Lord Urom.
27656, -- The Oculus / Ley-Guardian Eregos.

29315, -- The Violet Hold / Erekem.
29316, -- The Violet Hold / Moragg
29313, -- The Violet Hold / Ichoron.
29266, -- The Violet Hold / Xevozz.
29312, -- The Violet Hold / Lavanthor.
29314, -- The Violet Hold / Zuramat the Obliterator.
31134, -- The Violet Hold / Cyanigosa.

29304, -- Gundrak / Slad'Ran.
29932, -- Gundrak / Eck the Ferocious.
29307, -- Gundrak / Drakkari Colossus.
29573, -- Gundrak / Drakkari Elemental.
29306, -- Gundrak / Gal'darah.

26630, -- Drak'Tharon / Trollgore.
27483, -- Drak'Tharon / King Dred.
26632, -- Drak'Tharon / The Prophet Tharon'ja.

29311, -- Ahn'kahet / Heralz Volazj. 
30258, -- Ahn'kahet / Amanitar.
29309, -- Ahn'kahet / Elder Nadox. 
29308, -- Ahn'kahet / Prince Taldaram
29310, -- Ahn'kahet / Jedoga Shadowseeker

23953, -- Utgarde Keep / Prince Keleseth.
24200, -- Utgarde Keep / Skarvald The Constructor.
24201, -- Utgarde Keep / Dalronn the Controller.
23954, -- Utgarde Keep / Ingvar the Plunderer.

26668, -- Utgarde Pinnacle / Svala Sorrowgrave.
26687, -- Utgarde Pinnacle / Gortok Palehoof.
26693, -- Utgarde Pinnacle / Skadi the Ruthless.
26861  -- Utgarde Pinnacle / King Ymiron.
);

-- FULL IMMUNUTY, NO INTERRUPT
UPDATE creature_template SET mechanic_immune_mask=0 where entry IN(29305, 30530);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|67108864|536870912 
WHERE `entry` IN(
29305, 
30530);


-- SPECIAL IMMUNITY
UPDATE creature_template SET mechanic_immune_mask=0 where entry=26631;
UPDATE `creature_template` SET `mechanic_immune_mask` = 8388624  
WHERE `entry` IN 
(26631 -- Drak'Tharon  / Novos the Summoner
);





UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN(
30810, 
30774, 
30807, 
30788, 
30748, 
31656, 
31679, 
31673, 
30510, 
30529, 
30532,
30540,
30398,
26798,
31612,
31611,
31610,
31456,
31469,
31465,
31463,  
30258,
31464,
31362,
31350,
31349,
31360,
31507,
31510,
31508,
31511,
31509,
31512,
31506,
31370,
31365, 
31367,
30530,
31368,
29932,
31384,
31381,
28234,
31386,
31211,
31212,
31215,
31217,
32313,
31533,
31536,
31537,
31538,
31558,
31559,
31560,
31561
);




-- Malygos


UPDATE creature_template SET mechanic_immune_mask=0 where entry IN(28859, 31734);

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN(28859, 31734);




-- Stoneskin Gargoyle

UPDATE creature_template SET mechanic_immune_mask=0 where entry IN(16168, 29576);

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN(16168, 29576);





-- Full Naxx Immunity

UPDATE creature_template SET mechanic_immune_mask=0 where entry IN(15956, 15953, 15952, 15954, 15936, 16011, 16061, 16060, 16064, 16065, 30549, 16063, 16028, 15931, 15932, 15928, 15989,15990);

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN(15956, 15953, 15952, 15954, 15936, 16011, 16061, 16060, 16064, 16065, 30549, 16063, 16028, 15931, 15932, 15928, 15989,15990);


-- Four Horsemen immunities.


UPDATE creature_template SET mechanic_immune_mask=0 where entry IN(16064, 16065,30549,16063, 30602, 30603, 30601, 30600);


UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN(16064, 16065,30549,16063, 30602, 30603, 30601, 30600);



-- 

UPDATE creature_template SET mechanic_immune_mask=0 where entry IN(16441, 30057);

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask`|1|2|4|8|32|16|64|256|512|1024|2048|4096|8192|65536|131072|524288|4194304|8388608|33554432|67108864|536870912 
WHERE `entry` IN(16441, 30057);





-- Chech this out:
/*
UPDATE `creature_template` SET `mechanic_immune_mask`= mechanic_immune_mask
|1 -- CHARM
|2 -- DISORIENTED
|4 -- DISARM
|8 -- DISTRACT
|16 -- FEAR
|32 -- GRIP
|64 -- ROOT
|256 -- SILENCE
|512 -- SLEEP
|1024 -- SNARE
|2048 -- STUN
|4096 -- FREEZE
|8192 -- KNOCKOUT
|65536 -- POLYMORPH
|131072 -- BANISH
|524288 -- SHACKLE
|4194304 -- TURN
|8388608 -- HORROR
|67108864 -- DAZE
|536870912 -- SAPPED
WHERE `entry` IN
-- Utgarde Keep
(23953,30748, -- Prince Keleseth
27390,31680, -- Skarvald the Constructor
27389,31657, -- Dalronn the Controller
23954,31673, -- Ingvar the Plunderer

-- The Nexus
26731,30510, -- Grand Magus Telestra
26763,30529, -- Anomalus
26794,30532, -- Ormorok the Tree-Shaper
26723,30540, -- Keristrasza
26796,30398, -- Commander Stoutbeard
26798,30397, -- Commander Kolurg

-- Azjol-Nerub
28684,31612, -- Krik'thir the Gatewatcher
28921,31611, -- Hadronox
29120,31610, -- Anub'arak

-- Ahn'kahet: The Old Kingdom
29309,31456, -- Elder Nadox
29308,31469, -- Prince Taldaram
29310,31465, -- Jedoga Shadowseeker
29311,31464, -- Herald Volazj
30258,31463, -- Amanitar

-- Drak'Tharon Keep
26630,31362, -- Trollgore
26631,31350, -- Novos the Summoner
27483,31349, -- King Dred
26632,31360, -- The Prophet Tharon'ja

-- The Violet Hold
29315,31507, -- Erekem
29316,31510, -- Moragg
29313,31508, -- Ichoron
29266,31511, -- Xevozz
29312,31509, -- Lavanthor
29314,31512, -- Zuramat the Obliterator
31134,31506, -- Cyanigosa

-- Gundrak
29304,31370, -- Slad'ran
29307,31365, -- Drakkari Colossus
29573,31367, -- Drakkari Elemental
29305,30530, -- Moorabi
29306,31368, -- Gal'darah
29932, -- Eck the Ferocious

-- Halls of Stone
27975,31384, -- Maiden of Grief
27977,31381, -- Krystallus
27978,31386, -- Sjonnir The Ironshaper

-- The Culling of Stratholme
26529,31211, -- Meathook
26530,31212, -- Salramm the Fleshcrafter
26532,31215, -- Chrono-Lord Epoch
26533,31217, -- Mal'Ganis
32273,32313, -- Infinite Corruptor

-- Halls of Lightning
28586,31533, -- General Bjarngrim
28587,31536, -- Volkhan
28546,31537, -- Ionar
28923,31538, -- Loken

-- The Oculus
27654,31558, -- Drakos the Interrogator
27447,31559, -- Varos Cloudstrider
27655,31560, -- Mage-Lord Urom
27656,31561, -- Ley-Guardian Eregos

-- Utgarde Pinnacle
26668,30810, -- Svala Sorrowgrave
26687,30774, -- Gortok Palehoof
26693,30807, -- Skadi the Ruthless
26861,30788, -- King Ymiron

-- The Forge of Souls
36497,36498); -- Bronjahm*/