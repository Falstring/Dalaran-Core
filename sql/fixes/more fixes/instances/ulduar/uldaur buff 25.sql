
-- To faster database check while testing

-- SET @ENTRYID = XXXXX;
-- SELECT entry, name, mindmg, maxdmg, attackpower, damagemodifier, healthModifier FROM creature_template WHERE entry=@ENTRYID OR difficulty_entry_1=@ENTRYID;


-- ward of life --> 34275, writhing lasher --> 33387



-- Ignis 25 -> 33190 - Iron construct 25 -> 33191


UPDATE creature_template SET damagemodifier=123, baseattacktime=1200, healthModifier=1810 WHERE entry=33190;-- Ignis 25
UPDATE creature_template SET damagemodifier=46, healthModifier=500 WHERE entry=33191; -- Iron Construct 25



-- Razorscale 25 --> 33724 -Dark rune guardian 33850 - Dark rune sentinel 33852 -Dark rune watcher 33851

UPDATE creature_template SET  damagemodifier=98, healthModifier=1225 WHERE entry=33724;  -- razorscale 25
UPDATE creature_template SET  damagemodifier=29, healthModifier=30 WHERE entry=33850; -- Dark rune guardian 25
UPDATE creature_template SET  damagemodifier=55, healthModifier=43 WHERE entry=33852; -- Dark rune sentinel 25
UPDATE creature_template SET  damagemodifier=28, healthModifier=31 WHERE entry=33851; -- Dark rune watcher 25



-- XT 25 --> 33885 - scrapbot 33887 -boombot 33886- pummeller 33888- life spark 34005 - Heart 33995

UPDATE creature_template SET  damagemodifier=110, baseattacktime=1300, healthModifier=1825 WHERE entry=33885; -- XT-002 25
UPDATE creature_template SET  damagemodifier=30, healthModifier=3 WHERE entry=33887; -- scrapbot 25
UPDATE creature_template SET  damagemodifier=20, healthModifier=7.6 WHERE entry=33886; -- boombot 25
UPDATE creature_template SET  damagemodifier=32, healthModifier=52 WHERE entry=33888; -- pummeller 25
UPDATE creature_template SET  damagemodifier=22, healthModifier=19 WHERE entry=34005; -- life spark 25

UPDATE creature_template SET healthModifier=615 WHERE entry=33995; -- Heart25



-- concilio 25 -> 33694, 33692, 33693

UPDATE creature_template SET damagemodifier=93, baseattacktime=1300, healthModifier=1005 WHERE entry=33694; -- Stormcaller Brundir 25
UPDATE creature_template SET  damagemodifier=93, baseattacktime=1300, healthModifier=1005 WHERE entry=33692; -- Runemaster Molgeim 25
UPDATE creature_template SET  damagemodifier=98, baseattacktime=1300, healthModifier=1005 WHERE entry=33693; -- Steelbreaker 25




-- kologarn 25 -> 33909- Right arm 33911 -Left arm 33910 -rubble 33908

UPDATE creature_template SET  damagemodifier=118, baseattacktime=1300, healthModifier=1560 WHERE entry=33909; -- kologarn 25
UPDATE creature_template SET  damagemodifier=0, healthModifier=255 WHERE entry=33911; -- Right arm 25
UPDATE creature_template SET damagemodifier=0, healthModifier=255 WHERE entry=33910; -- Left arm 25

UPDATE creature_template SET damagemodifier=22, healthModifier=18 WHERE entry=33908; -- Rubble 25



-- auriaya 25 -> 34175- sanctum sentry 34166- feral defender 34171- swarming guardian 34169

UPDATE creature_template SET damagemodifier=94, baseattacktime=1300, healthModifier=1400 WHERE entry=34175; -- auriaya 25
UPDATE creature_template SET  damagemodifier=16, healthModifier=56 WHERE entry=34166; -- Sanctum Sentry 25
UPDATE creature_template SET damagemodifier=9, healthModifier=60 WHERE entry=34171; -- Feral Defender 25
UPDATE creature_template SET  damagemodifier=2.3, healthModifier=2 WHERE entry=34169; -- Swarming Guardian 25


-- Mimiron 25 -> 0 - leviathan 34106 - vx 34108- aerial command 34109-emergency bot 0-assault bot 34115 -bomb bot 34218

UPDATE creature_template SET  damagemodifier=94, baseattacktime=1300, healthModifier=780 WHERE entry=34106;  -- 25 Leviathan
UPDATE creature_template SET  damagemodifier=60, healthModifier=1580 WHERE entry=34108; -- 25 VX001
UPDATE creature_template SET  damagemodifier=60, healthModifier=1390 WHERE entry=34109; -- 25 Aerial Unit

UPDATE creature_template SET  damagemodifier=4,  healthModifier=2 WHERE entry=34147; -- Emergency Bot.
UPDATE creature_template SET  damagemodifier=30, baseattacktime=1500, healthModifier=60 WHERE entry=34115; -- 25 Assault Bot. especialmente más vida y daño, más haste.
UPDATE creature_template SET  damagemodifier=19, healthModifier=5.8 WHERE entry=34218; -- 25 Bomb bot.

UPDATE creature_template SET healthModifier=19 WHERE entry=34114; -- 25 Junk bot.



-- Freya 25 -> 33360- elder brightleaf 33391 -elfer stonebark 33393- elder ironbranch 33392- storm lasher 33401 - ancient water spirit 33398 - snaplasher 33400- detonating lasher 33399 -ancient conservator 33376

UPDATE creature_template SET damagemodifier=90, baseattacktime=1300, healthModifier=425 WHERE entry=33360; -- Freya 25
UPDATE creature_template SET  damagemodifier=74, healthModifier=520 WHERE entry=33391; -- Elder Brightleaf 25
UPDATE creature_template SET damagemodifier=74, healthModifier=510 WHERE entry=33393; -- Elder Stonebark 25
UPDATE creature_template SET  damagemodifier=74, healthModifier=510 WHERE entry=33392; -- Elder Ironbranch 25


UPDATE creature_template SET  damagemodifier=16, healthModifier=90 WHERE entry=33401; -- Storm Lasher.25
UPDATE creature_template SET damagemodifier=6, healthModifier=90 WHERE entry=33398; -- Ancient Water Spirit.25
UPDATE creature_template SET  damagemodifier=16, healthModifier=98 WHERE entry=33400; -- Snaplasher.25
UPDATE creature_template SET  damagemodifier=8, healthModifier=11 WHERE entry=33399; -- Detonating Lasher.25

UPDATE creature_template SET  damagemodifier=50, healthModifier=215 WHERE entry=33376; -- Ancient Conservator.25

UPDATE creature_template SET healthModifier=8 WHERE entry=33385; -- Eonar's Gift.



-- thorim 25 -> 33147- Jormungar Behemoth 33154- Dark Rune Acolyte 33161-Captured Mercenary Captain 33150 - Captured Mercenary Soldiers 33153
 -- Runic Colossus  33149 -Ancient Rune Giant  33148- Dark Rune Warbringer 33155- Dark Rune Evoker 33156 - Dark Rune Champion 33158 -Dark Rune Commoner 33157
	
UPDATE creature_template SET damagemodifier=110, healthModifier=1750 WHERE entry=33147; -- Thorim 25

UPDATE creature_template SET  damagemodifier=40, healthModifier=35 WHERE entry=33163; -- Iron Honor Guard
UPDATE creature_template SET damagemodifier=29, healthModifier=17 WHERE entry=33162; -- Iron Ring Guard


UPDATE creature_template SET  damagemodifier=35, healthModifier=75 WHERE entry=33154; -- Jormungar 25
UPDATE creature_template SET  damagemodifier=30, healthModifier=17.5 WHERE entry=33161; -- Dark Rune Acolyte 25
UPDATE creature_template SET  damagemodifier=35, healthModifier=60 WHERE entry=33150; -- Captured Mercenary Captain 25
UPDATE creature_template SET  damagemodifier=35, healthModifier=60 WHERE entry=33153; -- Captured Mercenary Soldiers 25

UPDATE creature_template SET  damagemodifier=60, healthModifier=85 WHERE entry=33149; -- Runic Colossus25
UPDATE creature_template SET damagemodifier=68, healthModifier=91 WHERE entry=33148; -- ancient rune giant 25

UPDATE creature_template SET  damagemodifier=32, healthModifier=17 WHERE entry=33155; -- dark rune warbringer 25
UPDATE creature_template SET  damagemodifier=32, healthModifier=15 WHERE entry=33156; -- dark rune evoker 25
UPDATE creature_template SET  damagemodifier=60, healthModifier=27 WHERE entry=33158; -- dark rune champion 25
UPDATE creature_template SET  damagemodifier=2, healthModifier=3 WHERE entry=33157; -- dark rune commoner 25


-- Hodir -> 32845

UPDATE creature_template SET  damagemodifier=115, baseattacktime=1200, healthModifier=2650 WHERE entry=32846; -- Hodir


-- Vezax 25 -> 33449 - saronite animus 34152 - faceless horror 33773

UPDATE creature_template SET  damagemodifier=115, baseattacktime=1300, healthModifier=2100 WHERE entry=33449; -- vezax 25
UPDATE creature_template SET damagemodifier=88, baseattacktime=1400, healthModifier=930 WHERE entry=34152; -- saronite animus 25
UPDATE creature_template SET  damagemodifier=45, healthModifier=205 WHERE entry=33773; -- faceless horror 25

-- Yogg 25 -> 33955- guardian of yogg saron 33968 -immortal guardian 33989 -crusher tentacle 33967 -corruptor tentacle 33986 -constrictor tentacle 33984

UPDATE creature_template SET  damagemodifier=88, healthModifier=3450 WHERE entry=33955; -- yogg 25

UPDATE creature_template SET healthModifier=560 WHERE entry=33954; -- Brain of Yogg-Saron.


UPDATE creature_template SET damagemodifier=40, healthModifier=85 WHERE entry=33968; -- guardian of yogg saron 25
UPDATE creature_template SET  damagemodifier=8, healthModifier=32 WHERE entry=33989; -- Immortal Guardian.
UPDATE creature_template SET  damagemodifier=36, healthModifier=175 WHERE entry=33967;  -- crusher tentacle 25
UPDATE creature_template SET  damagemodifier=18, healthModifier=60 WHERE entry=33986; -- corruptor tentacle 25
UPDATE creature_template SET damagemodifier=35, healthModifier=15 WHERE entry=33984; -- constrictor tentacle 25


UPDATE creature_template SET healthModifier=5 WHERE entry=33959; -- Influence Tentacle.

-- Algalon 25 -> 33070 -Unleashed Dark Matter 34222 -dark matter 34221

UPDATE creature_template SET  baseattacktime=600, damagemodifier=155, healthModifier=3000 WHERE entry=33070; -- algalon 25  revisar las duald wield
UPDATE creature_template SET  damagemodifier=4, speed_run=1, healthModifier=19 WHERE entry=34222; -- unleashed dark matter 25
UPDATE creature_template SET damagemodifier=7, speed_run=1, healthModifier=10 WHERE entry=34221; -- dark matter 25



-- Trash

UPDATE creature_template SET damagemodifier=18,healthModifier=200 WHERE entry IN(33700, 33723); -- Storm Tempered Keeper 25

UPDATE creature_template SET speed_walk=0.7, speed_run=0.7, healthModifier=15 WHERE entry IN(33756); -- Charged Sphere 25