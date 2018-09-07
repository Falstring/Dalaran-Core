-- To faster database check while testing

-- SET @ENTRYID = XXXXX;
-- SELECT entry, name, mindmg, maxdmg, attackpower, DamageModifier, HealthModifier FROM creature_template WHERE entry=@ENTRYID OR difficulty_entry_1=@ENTRYID;



-- ward of life --> 34275, writhing lasher --> 33387

UPDATE creature_template SET  DamageModifier=12, HealthModifier=7 WHERE entry=33387; -- Writhing Lasher

UPDATE creature_template SET DamageModifier=12,  HealthModifier=7 WHERE entry=34275; -- Writhing Lasher

-- Ignis 10 -> 33118 - Iron construct 10 -> 33121


UPDATE creature_template SET  DamageModifier=100, baseattacktime=1200, HealthModifier=575 WHERE entry=33118; -- Ignis

UPDATE creature_template SET  DamageModifier=40, HealthModifier=405 WHERE entry=33121; -- Iron Construct 10


-- Razorscale --> 33186 - Dark rune guardian -> 33388 - Dark rune sentinel -> 33846 - Dark rune watcher -> 33453

UPDATE creature_template SET  DamageModifier=75, HealthModifier=450 WHERE entry=33186; -- Razorscale

UPDATE creature_template SET  DamageModifier=24, HealthModifier=23 WHERE entry=33388; -- Dark rune guardian 10
UPDATE creature_template SET  DamageModifier=42, HealthModifier=30 WHERE entry=33846; -- Dark rune sentinel 10
UPDATE creature_template SET  DamageModifier=25, HealthModifier=19 WHERE entry=33453; -- Dark rune watcher 10



-- XT --> 33293 - scrapbot -> 33343 	- boombot -> 33346	- pummeller -> 33344	- life spark -> 34004 - heart-> 33329

UPDATE creature_template SET  baseattacktime=1500, DamageModifier=84, HealthModifier=540 WHERE entry=33293; -- XT-002

UPDATE creature_template SET  DamageModifier=30, HealthModifier=1 WHERE entry=33343; -- scrapbot 10
UPDATE creature_template SET  DamageModifier=14, HealthModifier=2.3 WHERE entry=33346; -- boombot 10
UPDATE creature_template SET  DamageModifier=20, HealthModifier=25 WHERE entry=33344; -- pummeller 10
UPDATE creature_template SET  DamageModifier=14, HealthModifier=8.6 WHERE entry=34004; -- life spark

UPDATE creature_template SET HealthModifier=195 WHERE entry=33329; -- Heart


-- Assembly of Iron -> 32857, 32927, 32867,

UPDATE creature_template SET  baseattacktime=1500, HealthModifier=450 WHERE entry=32857; -- Stormcaller Brundir 10
UPDATE creature_template SET  baseattacktime=1500, HealthModifier=450 WHERE entry=32927; -- Runemaster Molgeim 10
UPDATE creature_template SET DamageModifier=75, baseattacktime=1500, HealthModifier=450 WHERE entry=32867; -- Steelbreaker 10



-- Kologarn -> 32930  -Right arm -> 32934 - Left arm -> 32933 - rubble -> 33768-- kologarn 25 -> 33909- Right arm 33911 -Left arm 33910 -rubble 33908

UPDATE creature_template SET  DamageModifier=85, baseattacktime=1500, HealthModifier=475 WHERE entry=32930;  -- Kologarn
UPDATE creature_template SET  DamageModifier=0, HealthModifier=68 WHERE entry=32934; -- Right arm 10
UPDATE creature_template SET  DamageModifier=0, HealthModifier=68 WHERE entry=32933; -- Left arm 10

UPDATE creature_template SET  DamageModifier=16, HealthModifier=7 WHERE entry=33768; -- Rubble 10



-- Auriaya -> 33515 - sanctum sentry -> 34014 - feral defender -> 34035 - swarming guardian -> 34034

UPDATE creature_template SET  DamageModifier=78, baseattacktime=1500, HealthModifier=360 WHERE entry=33515; -- Auriaya
UPDATE creature_template SET DamageModifier=9, HealthModifier=39 WHERE entry=34014; -- Sanctum Sentry 10
UPDATE creature_template SET  DamageModifier=8, HealthModifier=22 WHERE entry=34035; -- Feral Defender 10
UPDATE creature_template SET DamageModifier=3, HealthModifier=1.5 WHERE entry=34034; -- Swarming Guardian 10



-- Mimiron -> 33350, leviathan - 33432, vx - 33651, aerial command - 33670, emergency bot - 34147, assault bot - 34057, bomb bot - 33836

UPDATE creature_template SET  DamageModifier=69, baseattacktime=1500, HealthModifier=250 WHERE entry=33432; -- 10 Leviathan
UPDATE creature_template SET  DamageModifier=60, HealthModifier=530 WHERE entry=33651; -- 10 VX001
UPDATE creature_template SET  DamageModifier=60, HealthModifier=530 WHERE entry=33670; -- 10 Aerial Unit

UPDATE creature_template SET DamageModifier=3, HealthModifier=2 WHERE entry=34147; -- Emergency Bot.
UPDATE creature_template SET  baseattacktime=1500, DamageModifier=25, HealthModifier=20 WHERE entry=34057; -- 10 Assault Bot. especialmente más vida y daño, más haste.
UPDATE creature_template SET  DamageModifier=8, HealthModifier=2.5 WHERE entry=33836; -- 10 Bomb bot.

UPDATE creature_template SET HealthModifier=8 WHERE entry=33855; -- 10 Junk bot.



-- Freya -> 32906 -elder brightleaf 32915 - elfer stonebark 32914- elder ironbranch 32913 -storm lasher 32919- ancient water spirit 33202 -snaplasher 32916 -detonating lasher 32918 -ancient conservator 33203

UPDATE creature_template SET DamageModifier=70, baseattacktime=1500, HealthModifier=210 WHERE entry=32906; -- Freya 10
UPDATE creature_template SET  DamageModifier=60, HealthModifier=199 WHERE entry=32915; -- Elder Brightleaf 10 




UPDATE creature_template SET DamageModifier=60, HealthModifier=190 WHERE entry=32914; -- Elder Stonebark 10
UPDATE creature_template SET DamageModifier=60, HealthModifier=190 WHERE entry=32913; -- Elder Ironbranch 10


UPDATE creature_template SET  DamageModifier=17, HealthModifier=35 WHERE entry=32919; -- Storm Lasher.
UPDATE creature_template SET  DamageModifier=19, HealthModifier=35 WHERE entry=33202; -- Ancient Water Spirit.
UPDATE creature_template SET  DamageModifier=19, HealthModifier=35 WHERE entry=32916; -- Snaplasher.
UPDATE creature_template SET  DamageModifier=6, HealthModifier=10 WHERE entry=32918; -- Detonating Lasher.

UPDATE creature_template SET  DamageModifier=37, HealthModifier=79 WHERE entry=33203; -- Ancient Conservator.

UPDATE creature_template SET  HealthModifier=5 WHERE entry=33228; -- Eonar's Gift.

-- Thorim -> 32865 - Jormungar Behemoth 32882 - Dark Rune Acolyte 33110 -Captured Mercenary Captain 32907 -Captured Mercenary Soldiers 32885 -Runic Colossus 32872 -Ancient Rune Giant 32873 - Dark Rune Warbringer 32877 - Dark Rune Evoker 32878 -Dark Rune Champion 32876- Dark Rune Commoner 32904 - 

	
UPDATE creature_template SET  DamageModifier=83, HealthModifier=500 WHERE entry=32865; -- Thorim 10


UPDATE creature_template SET  DamageModifier=22, HealthModifier=7 WHERE entry=32875; -- Iron Honor Guard 10 
UPDATE creature_template SET  DamageModifier=22, HealthModifier=3.5 WHERE entry=32874; -- Iron Ring Guard 10 

UPDATE creature_template SET  DamageModifier=22, HealthModifier=35 WHERE entry=32882; -- Jormungar 10
UPDATE creature_template SET  DamageModifier=18, HealthModifier=4 WHERE entry=33110; -- Dark Rune Acolyte 10
UPDATE creature_template SET  DamageModifier=19, HealthModifier=49 WHERE entry=32907; -- Captured Mercenary Captain 10
UPDATE creature_template SET DamageModifier=19, HealthModifier=20 WHERE entry=32885; -- Captured Mercenary Soldiers 10

UPDATE creature_template SET  DamageModifier=45, HealthModifier=28 WHERE entry=32872; -- Runic Colossus
UPDATE creature_template SET  DamageModifier=53, HealthModifier=36 WHERE entry=32873; -- Ancient Rune Giant


UPDATE creature_template SET  DamageModifier=25, HealthModifier=4 WHERE entry=32877; -- Dark Rune Warbringer
UPDATE creature_template SET  DamageModifier=26, HealthModifier=4 WHERE entry=32878; -- Dark Rune Evoker
UPDATE creature_template SET DamageModifier=36, HealthModifier=7 WHERE entry=32876; -- Dark Rune Champion
UPDATE creature_template SET  DamageModifier=2, HealthModifier=1.3 WHERE entry=32904; -- Dark Rune Commoner


UPDATE creature_template SET  DamageModifier=60, HealthModifier=460 WHERE entry=33196; -- Sif


-- Hodir -> 32845
UPDATE creature_template SET  DamageModifier=94, baseattacktime=1400, HealthModifier=875 WHERE entry=32845; -- Hodir 10



-- Vezax -> 33271 - saronite animus 33524 - faceless horror 33772

UPDATE creature_template SET  DamageModifier=83, baseattacktime=1400, HealthModifier=680 WHERE entry=33271; -- Vezax
UPDATE creature_template SET  DamageModifier=63, baseattacktime=1500, HealthModifier=235 WHERE entry=33524; -- Saronite Animus

UPDATE creature_template SET DamageModifier=30, HealthModifier=75 WHERE entry=33772; -- Faceless Horror




-- Yogg -> 33288 - guardian of yogg saron 33136 - immortal guardian 33988 -crusher tentacle 33966 -corruptor tentacle 33985 -constrictor tentacle 33983 

UPDATE creature_template SET  DamageModifier=75, HealthModifier=1100 WHERE entry=33288; -- Yogg-Saron.
UPDATE creature_template SET HealthModifier=145 WHERE entry=33890; -- Brain of Yogg-Saron.

UPDATE creature_template SET  DamageModifier=28, HealthModifier=26 WHERE entry=33136; -- Guardian of Yogg Saron.
UPDATE creature_template SET DamageModifier=4.5, HealthModifier=20 WHERE entry=33988; -- Immortal Guardian.

UPDATE creature_template SET  DamageModifier=28, HealthModifier=42 WHERE entry=33966; -- Crusher Tentacle.
UPDATE creature_template SET  DamageModifier=25, HealthModifier=17 WHERE entry=33985; -- Corruptor Tentacle.
UPDATE creature_template SET  DamageModifier=20, HealthModifier=4.3 WHERE entry=33983; -- Constrictor Tentacle.


UPDATE creature_template SET HealthModifier=1.2 WHERE entry=33943; -- Influence Tentacle.

-- Algalon -> 32871 -Unleashed Dark Matter 34097 -dark matter 33089
-- Algalon 25 -> 33070 -Unleashed Dark Matter 34222 -dark matter 34221

UPDATE creature_template SET  DamageModifier=105, baseattacktime=600, HealthModifier=780 WHERE entry=32871; -- Algalon.
UPDATE creature_template SET  DamageModifier=5, speed_run=1, HealthModifier=7 WHERE entry=34097; -- Unleashed Dark Matter.

UPDATE creature_template SET  DamageModifier=5, speed_run=1, HealthModifier=4 WHERE entry=33089; -- Dark matter.





-- Trash

UPDATE creature_template SET DamageModifier=13, HealthModifier=75 WHERE entry IN(33699, 33722); -- Storm Tempered Keeper 10

UPDATE creature_template SET speed_walk=0.7, speed_run=0.7, HealthModifier=6 WHERE entry IN(33715); -- Charged Sphere 10