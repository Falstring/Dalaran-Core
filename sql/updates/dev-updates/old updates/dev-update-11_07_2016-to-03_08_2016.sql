-- Kill 'em With Sleep Deprivation - [A][H] http://www.wowhead.com/quest=7702/kill-em-with-sleep-deprivation
-- Look at the Size of It! - [A][H] http://www.wowhead.com/quest=7704/look-at-the-size-of-it

SET @EVENTGENGUID := 5517;
SET @DARK_IRON_PILLOW_EVENT_GENERATOR := 179829;
SET @DARK_IRON_PILLOW := 179828;
SET @SLEEPY_DARK_IRON_WORKER := 14635;
SET @CHAMBERMAID_PILLACLENCHER := 14636;

DELETE FROM gameobject WHERE guid=@EVENTGENGUID AND id=@DARK_IRON_PILLOW_EVENT_GENERATOR;
INSERT INTO gameobject (guid, id, map, zoneId, areaId, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state, VerifiedBuild)
VALUES
    (@EVENTGENGUID, @DARK_IRON_PILLOW_EVENT_GENERATOR, 0, 0, 0, 1, 1, -6550.48, -1347.64, 208.931, 0.982185, 0, 0, 0.47159, 0.881818, 300, 0, 1, 0);

DELETE FROM creature_text WHERE entry=@SLEEPY_DARK_IRON_WORKER;
INSERT INTO creature_text VALUES(@SLEEPY_DARK_IRON_WORKER, 0, 0, "Our pillas! Someone has stolen our pillas!", 14, 0, 100, 0, 0, 0, 9799, 0, 'Sleepy Dark Iron Worker');

DELETE FROM creature_text WHERE entry=@CHAMBERMAID_PILLACLENCHER;
INSERT INTO creature_text VALUES(@CHAMBERMAID_PILLACLENCHER, 0, 0, "Thieves! Scallywags! Rapscallions! Come face me gigantic pillas!", 14, 0, 100, 0, 0, 0, 9810, 0, 'Chambermaid Pillaclencher');

DELETE FROM creature_loot_template WHERE Entry=@CHAMBERMAID_PILLACLENCHER AND Item=18950;
INSERT INTO creature_loot_template (Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment)
VALUES
    (@CHAMBERMAID_PILLACLENCHER, 18950, 0, 100, 0, 1, 0, 1, 1, "Starts quest 28058");

UPDATE gameobject_template SET AIName="SmartGameObjectAI", flags=0 WHERE entry=@DARK_IRON_PILLOW; -- Dark Iron Pillow SAI
DELETE FROM smart_scripts WHERE entryorguid=@DARK_IRON_PILLOW AND source_type=1;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@DARK_IRON_PILLOW,1,0,1,70,0,100,0,2,0,0,0,45,1,1,0,0,0,0,14,@EVENTGENGUID,@DARK_IRON_PILLOW_EVENT_GENERATOR,0,0,0,0,0,"Dark Iron Pillow - On Gameobject State Changed - Set Data 1 1"),
    (@DARK_IRON_PILLOW,1,1,2,61,0,100,0,2,0,0,0,70,45,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Pillow - On Gameobject State Changed - Respawn Self in 45 secs");

UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@DARK_IRON_PILLOW_EVENT_GENERATOR; -- Dark Iron Pillow Event Generator SAI
DELETE FROM smart_scripts WHERE entryorguid=@DARK_IRON_PILLOW_EVENT_GENERATOR AND source_type=1;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES    
    (@DARK_IRON_PILLOW_EVENT_GENERATOR,1,0,1,38,0,100,0,1,1,0,0,80,@DARK_IRON_PILLOW_EVENT_GENERATOR*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Run Script"),
    (@DARK_IRON_PILLOW_EVENT_GENERATOR,1,1,0,61,0,100,0,1,1,0,0,12,24110,1,300000,0,0,0,8,0,0,0,-6541.468262,-1352.773804,208.964294,5.211554,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Bunny'");

SET @ENTRY := @DARK_IRON_PILLOW_EVENT_GENERATOR*100+00; -- Actionlist SAI
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,9,0,0,0,0,100,0,30000,30000,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6576.413086,-1307.21350,208.633347,5.172282,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,1,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.531738,-1306.411987,208.677628,5.211554,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,2,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.533691,-1308.259644,208.610107,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,3,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.955566,-1309.820923,208.577423,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,4,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.238281,-1309.668701,208.623535,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,5,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.944336,-1307.367676,208.562149,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,6,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6571.871094,-1309.412842,208.659698,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,7,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.612793,-1311.513184,208.649902,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,8,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.156250,-1312.323364,208.611801,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,9,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.203125,-1312.584473,208.665710,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,10,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,19,@SLEEPY_DARK_IRON_WORKER,100,0,0,0,0,0,"Dark Iron Pillow Event Generator - On Just Summoned - Say Line 0"),
    (@ENTRY,9,11,0,0,0,100,0,45000,45000,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6576.413086,-1307.21350,208.633347,5.172282,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,12,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.531738,-1306.411987,208.677628,5.211554,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,13,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.533691,-1308.259644,208.610107,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,14,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.955566,-1309.820923,208.577423,5.207627,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,15,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6573.238281,-1309.668701,208.623535,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,16,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.944336,-1307.367676,208.562149,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,17,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6571.871094,-1309.412842,208.659698,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,18,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.612793,-1311.513184,208.649902,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,19,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6574.156250,-1312.323364,208.611801,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,20,0,0,0,100,0,0,0,0,0,12,@SLEEPY_DARK_IRON_WORKER,4,30000,0,0,0,8,0,0,0,-6572.203125,-1312.584473,208.665710,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,21,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,19,@SLEEPY_DARK_IRON_WORKER,100,0,0,0,0,0,"Dark Iron Pillow Event Generator - On Just Summoned - Say Line 0"),
    (@ENTRY,9,22,0,0,0,100,0,60000,60000,0,0,12,@CHAMBERMAID_PILLACLENCHER,4,30000,0,0,0,8,0,0,0,-6572.203125,-1312.584473,208.665710,5.195847,"Dark Iron Pillow Event Generator - On Data Set 1 1 - Summon Creature 'Sleepy'"),
    (@ENTRY,9,23,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,19,@CHAMBERMAID_PILLACLENCHER,100,0,0,0,0,0,"Chambermaid Pillaclencher - On Just Summoned - Say Line 0");

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@SLEEPY_DARK_IRON_WORKER; -- Sleepy Dark Iron Worker SAI
DELETE FROM smart_scripts WHERE entryorguid=@SLEEPY_DARK_IRON_WORKER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@SLEEPY_DARK_IRON_WORKER,0,0,0,1,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Sleepy Dark Iron Worker - On Just Summoned - Attack start");

UPDATE creature_template SET AIName="SmartAI", lootid=@CHAMBERMAID_PILLACLENCHER WHERE entry=@CHAMBERMAID_PILLACLENCHER; -- Chambermaid Pillaclencher SAI
DELETE FROM smart_scripts WHERE entryorguid=@CHAMBERMAID_PILLACLENCHER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@CHAMBERMAID_PILLACLENCHER,0,0,0,1,0,100,1,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Chambermaid Pillaclencher - On Just Summoned - Attack start"),
    (@CHAMBERMAID_PILLACLENCHER,0,1,0,0,0,100,0,3000,3000,8000,9000,11,23417,0,0,0,0,0,2,0,0,0,0,0,0,0,"Chambermaid Pillaclencher - In Combat - Cast 'Smother'"),
    (@CHAMBERMAID_PILLACLENCHER,0,2,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,19,24110,100,0,0,0,0,0,"Chambermaid Pillaclencher - Just Died - Despawn Large Bunny");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceGroup IN(0, 1) AND SourceEntry=@DARK_IRON_PILLOW_EVENT_GENERATOR;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (22, 0, @DARK_IRON_PILLOW_EVENT_GENERATOR, 1, 0, 29, 1, 24110, 100, 0, 1, 0, 0, '', 'Dark Iron Pillow Event Generator only Trigger if there is no Large Bunny within 100 Yards'),
    (22, 1, @DARK_IRON_PILLOW_EVENT_GENERATOR, 1, 0, 29, 1, 24110, 100, 0, 1, 0, 0, '', 'Dark Iron Pillow Event Generator only Trigger if there is no Large Bunny within 100 Yards');





-- Timbermaw Ally - [A][H] http://www.wowhead.com/quest=6131/timbermaw-ally

UPDATE quest_template_addon SET RequiredMaxRepFaction=576, RequiredMaxRepValue=0 WHERE ID=6131;




-- Broken Alliances - [H] http://www.wowhead.com/quest=782/broken-alliances

UPDATE gameobject_template SET flags=32 WHERE entry in(2842, 2848, 2858);
UPDATE gameobject SET spawntimesecs=0 WHERE guid IN(10830, 10644, 10643) AND id IN(2842, 2848, 2858);


UPDATE skinning_loot_template SET MaxCount=6, Chance=89 WHERE Entry=70200 AND Item=33567;
UPDATE skinning_loot_template SET MaxCount=5, Chance=10 WHERE Entry=70200 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=7, Chance=79 WHERE Entry=70201 AND Item=33567;
UPDATE skinning_loot_template SET MaxCount=4, Chance=52 WHERE Entry=70202 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=4, Chance=47 WHERE Entry=70202 AND Item=33567;
UPDATE skinning_loot_template SET MaxCount=6, Chance=74 WHERE Entry=70203 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=5, Chance=79 WHERE Entry=70204 AND Item=33567;
UPDATE skinning_loot_template SET MaxCount=6, Chance=74 WHERE Entry=70205 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=6, Chance=74 WHERE Entry=70207 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=6, Chance=74 WHERE Entry=70209 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=8, Chance=74 WHERE Entry=70210 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=5, Chance=99 WHERE Entry=70211 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=3, Chance=96 WHERE Entry=32517 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=4, Chance=98 WHERE Entry=70212 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=13, Chance=88 WHERE Entry=70213 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=17, Chance=93 WHERE Entry=70214 AND Item=33568;
UPDATE skinning_loot_template SET MaxCount=15, Chance=88 WHERE Entry=28860 AND Item=33568;



-- Fuel for the Fire - [A][H] http://www.wowhead.com/quest=12690/fuel-for-the-fire

SET @DRAKKARI_CHIEFTAIN := 28873;
DELETE FROM `creature_text` WHERE `entry`=@DRAKKARI_CHIEFTAIN;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
    (@DRAKKARI_CHIEFTAIN, 0, 0, 'Now you gunna die, mon!', 12, 0, 100, 0, 0, 0, 28993, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 0, 1, 'I come to avenge my bruddas, mon!', 12, 0, 100, 0, 0, 0, 28994, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 0, 2, 'Die, nasty scourge!', 12, 0, 100, 0, 0, 0, 28995, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 0, 3, 'We gunna drive all da scourge outta Zul''Drak, mon - startin'' with you!', 12, 0, 100, 0, 0, 0, 28997, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 0, 'Wha?!...', 12, 0, 100, 0, 0, 0, 28998, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 1, 'Aaah....', 12, 0, 100, 0, 0, 0, 28999, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 2, 'Ooof!', 12, 0, 100, 0, 0, 0, 29000, 0, 'Drakkari Chieftain'),
    (@DRAKKARI_CHIEFTAIN, 1, 3, 'Owww!', 12, 0, 100, 0, 0, 0, 29001, 0, 'Drakkari Chieftain');

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@DRAKKARI_CHIEFTAIN;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@DRAKKARI_CHIEFTAIN AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@DRAKKARI_CHIEFTAIN,0,0,1,54,0,100,0,0,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Just Summoned - Say Line 0"),
    (@DRAKKARI_CHIEFTAIN,0,1,0,61,0,100,0,0,0,0,0,69,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Drakkari Chieftain - On Just Summoned - Move to Player"),
    (@DRAKKARI_CHIEFTAIN,0,2,3,34,0,100,0,0,0,0,0,12,28875,3,5000,1,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Player reached - Summon Shalewing"),
    (@DRAKKARI_CHIEFTAIN,0,3,4,61,0,100,0,0,0,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Player reached - Say Line 1"),
    (@DRAKKARI_CHIEFTAIN,0,4,0,61,0,100,0,1,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drakkari Chieftain - On Player reached- Despawn Self in 3s");

UPDATE creature_template SET unit_flags=256 WHERE entry=@DRAKKARI_CHIEFTAIN;
UPDATE creature_template SET VehicleId=0, InhabitType=7, unit_flags=256 WHERE entry=28875;
UPDATE creature SET spawntimesecs=120 WHERE id=28844;
UPDATE creature SET spawntimesecs=120 WHERE id=28843;


-- -------------------------------------------
-- THE NEXUS
-- -------------------------------------------


-- Crazed Mana-Wyrm
UPDATE creature_template SET unit_flags=32832 WHERE entry IN(26761, 30521);


-- Azure Skyrazor
UPDATE creature_template SET unit_flags=32848, faction=1848 WHERE entry IN(26736, 30518);


-- Parachutes for the Argent Crusade - [A][H] http://www.wowhead.com/quest=12740/parachutes-for-the-argent-crusade

DELETE FROM `smart_scripts` WHERE `entryorguid`=28029 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (28029, 0, 0, 0, 9, 0, 100, 0, 0, 5, 5000, 8000, 11, 14517, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - Within 0-5 Range - Cast \'Crusader Strike\''),
    (28029, 0, 1, 0, 0, 0, 100, 0, 7000, 11000, 20000, 24000, 11, 10326, 1, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - In Combat - Cast \'Turn Evil\''),
    (28029, 0, 2, 3, 8, 0, 100, 0, 53031, 0, 0, 0, 11, 53039, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - On Spellhit \'Crusader Parachute\' - Cast \'Deploy Parachute\''),
    (28029, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 29060, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - On Spellhit \'Crusader Parachute\' - Quest Credit \'Parachutes for the Argent Crusade\''),
    (28029, 0, 4, 0, 1, 0, 100, 0, 10000, 10000, 30000, 30000, 28, 53031, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Argent Crusader - On Spellhit \'Crusader Parachute\' - Remove aura');



-- Return My Remains - [H] http://www.wowhead.com/quest=11638/return-my-remains

SET @SNARLFANG := 25339;
SET @GRIMWALKER := 25461;
SET @REMAINS := 187680;
SET @SPELL_ANCESTRAL_SPIRIT = 45608;

DELETE FROM creature_text WHERE entry=@SNARLFANG;
INSERT INTO creature_text VALUES(@SNARLFANG, 0, 0, "Farseer! I''m so glad to see you again!", 12, 0, 100, 0, 0, 0, 24686, 0, 'Snarlfang');
INSERT INTO creature_text VALUES(@SNARLFANG, 1, 0, "I look forward to further training when you are ready.", 12, 0, 100, 0, 0, 0, 24700, 0, 'Snarlfang');

DELETE FROM creature_text WHERE entry=@GRIMWALKER;
INSERT INTO creature_text VALUES(@GRIMWALKER, 0, 0, "I have been returned to the living.", 12, 0, 100, 0, 0, 0, 24687, 0, 'Snarlfang');
INSERT INTO creature_text VALUES(@GRIMWALKER, 1, 0, "And now, I must rest. Thank you for all that you have done.", 12, 0, 100, 0, 0, 0, 24688, 0, 'Snarlfang');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@SNARLFANG;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SNARLFANG AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@SNARLFANG, 0, 0, 0, 20, 0, 100, 0, 11638, 0, 0, 0, 80, @SNARLFANG*100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Snarlfang - On quest rewarded - Start event');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@SNARLFANG*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@SNARLFANG*100,9,0,0,0,0,100,0,1000,1000,0,0,50,@REMAINS,11,0,0,0,0,8,0,0,0,4521.799805,5669.839844,81.417801,0.767945,"Spirit Talker Snarlfang - On Script - Summon remains"),
(@SNARLFANG*100,9,1,0,0,0,100,0,1000,1000,0,0,11,@SPELL_ANCESTRAL_SPIRIT,0,0,0,0,0,11,23837,20,0,0,0,0,0,"Spirit Talker Snarlfang - On Script - Cast Ancestral Spirit"),
(@SNARLFANG*100,9,2,0,0,0,100,0,11000,11000,0,0,12,@GRIMWALKER,3,10000,0,0,0,8,0,0,0,4521.799805,5669.839844,81.417801,0.767945,"Spirit Talker Snarlfang - On Script - Summon Grimwalker"),
(@SNARLFANG*100,9,3,0,0,0,100,0,1000,1000,0,0,1,0,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit Talker Snarlfang - On Script - Say Line 0"),
(@SNARLFANG*100,9,4,0,0,0,100,0,5000,5000,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,"Spirit Talker Snarlfang - On Script - Say Line 1");

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@GRIMWALKER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GRIMWALKER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@GRIMWALKER, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grimwalker - On Just Summoned - Set walk'),
    (@GRIMWALKER, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 4000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Grimwalker - On Just Summoned - Say Line 0'),
    (@GRIMWALKER, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 4516.423340, 5674.288086, 81.796661, 2.448872, "Grimwalker - On Just Summoned - Move to 1"),
    (@GRIMWALKER, 0, 3, 4, 34, 0, 100, 0, 0, 1, 0, 0, 1, 1, 4000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Grimwalker - On point 1 reached - Say Line 1");



-- Defias Gunpowder SAI
SET @ENTRY := 17155;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,12,4417,3,120000,1,0,0,8,0,0,0,-123.77,-613.586,14.126,6.035,"Defias Gunpowder - On Gossip Hello - Summon Creature 'Defias Taskmaster' (No Repeat)");



-- -------------------------------------------
-- DEADMINES
-- -------------------------------------------
-- DB/Creature: Deadmines Pathing
-- Todesminen - Rufer der Defias - Vorarbeiter der Defias - Zuchtmeister der Defias - Hexer der Defias - Wellenformer der Defias 
SET @NPC := 79139;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -58.1086, -394.012, 54.3026, 0),
(@PATH, 2, -55.9432, -400.184, 54.5487, 0),
(@PATH, 3, -67.441, -401.846, 54.3231, 0),
(@PATH, 4, -65.5066, -395.733, 54.4282, 0),
(@PATH, 5, -59.4698, -391.136, 53.7281, 0),
(@PATH, 6, -57.744, -386.926, 53.9151, 0),
(@PATH, 7, -57.6061, -381.321, 54.0338, 0),
(@PATH, 8, -68.0747, -382.217, 53.8005, 0),
(@PATH, 9, -75.5928, -378.18, 55.1468, 0),
(@PATH, 10, -87.6686, -376.04, 57.5502, 0),
(@PATH, 11, -97.0305, -377.378, 58.0518, 0),
(@PATH, 12, -103.849, -380.893, 57.4528, 0),
(@PATH, 13, -94.3324, -377.236, 57.7877, 0),
(@PATH, 14, -82.0819, -376.835, 56.2085, 0),
(@PATH, 15, -68.3509, -374.365, 55.0867, 0),
(@PATH, 16, -60.5492, -376.377, 54.3032, 0),
(@PATH, 17, -54.3384, -379.355, 54.2581, 0),
(@PATH, 18, -58.7368, -385.684, 53.8661, 0),
(@PATH, 19, -57.8513, -390.019, 53.7836, 0);

SET @NPC := 79144;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -49.1406, -380.152, 54.8732, 0),
(@PATH, 2, -44.0293, -383.437, 55.5099, 0),
(@PATH, 3, -48.0472, -391.257, 55.8773, 0),
(@PATH, 4, -52.4945, -401.038, 55.5619, 0),
(@PATH, 5, -59.1642, -403.186, 53.9912, 0),
(@PATH, 6, -69.0763, -401.558, 54.7464, 0),
(@PATH, 7, -68.6572, -397.85, 55.1056, 0),
(@PATH, 8, -58.4723, -392.667, 54.1193, 0),
(@PATH, 9, -53.6889, -382.146, 54.6699, 0),
(@PATH, 10, -49.8211, -373.639, 55.291, 0),
(@PATH, 11, -57.1299, -367.638, 55.3325, 0),
(@PATH, 12, -62.892, -358.569, 54.3333, 0),
(@PATH, 13, -62.7853, -349.7, 55.955, 0),
(@PATH, 14, -63.644, -358.635, 54.3321, 0),
(@PATH, 15, -63.6918, -366.936, 55.0531, 0),
(@PATH, 16, -68.797, -369.171, 55.6588, 0),
(@PATH, 17, -75.1762, -373.704, 55.0443, 0),
(@PATH, 18, -76.815, -378.574, 55.231, 0),
(@PATH, 19, -67.4685, -383.845, 53.6905, 0),
(@PATH, 20, -60.7481, -384.712, 53.679, 0),
(@PATH, 21, -53.467, -377.178, 54.2938, 0);

SET @NPC := 79152;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -108.408, -401.056, 59.7252, 0),
(@PATH, 2, -118.798, -408.026, 59.1646, 0),
(@PATH, 3, -120.495, -414.875, 58.2067, 0),
(@PATH, 4, -115.331, -424.561, 55.383, 0),
(@PATH, 5, -107.488, -431.728, 55.1959, 0),
(@PATH, 6, -114.273, -441.777, 54.9943, 0),
(@PATH, 7, -119.865, -438.626, 54.718, 0),
(@PATH, 8, -116.703, -429.971, 54.9343, 0),
(@PATH, 9, -118.322, -422.801, 55.9285, 0),
(@PATH, 10, -124.19, -418.18, 57.6147, 0),
(@PATH, 11, -131.87, -410.675, 57.9201, 0),
(@PATH, 12, -125.211, -405.184, 58.613, 0),
(@PATH, 13, -119.058, -408.537, 59.0034, 0);

SET @NPC := 79188;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -106.372, -395.356, 57.7169, 0),
(@PATH, 2, -115.118, -396.449, 56.9909, 0),
(@PATH, 3, -123.272, -404.099, 58.503, 0),
(@PATH, 4, -118.284, -393.568, 56.6597, 0),
(@PATH, 5, -113.248, -383.834, 57.4938, 0),
(@PATH, 6, -110.754, -376.43, 58.3853, 0),
(@PATH, 7, -102.981, -375.647, 58.5188, 0),
(@PATH, 8, -100.981, -385.969, 58.2247, 0),
(@PATH, 9, -95.2868, -395.073, 59.1373, 0),
(@PATH, 10, -91.1278, -400.994, 58.2928, 0);

SET @NPC := 79189;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -94.8127, -396.214, 58.8776, 0),
(@PATH, 2, -103.299, -389.301, 57.3192, 0),
(@PATH, 3, -107.61, -382.619, 56.955, 0),
(@PATH, 4, -122.753, -383.213, 59.2935, 0),
(@PATH, 5, -125.399, -390.451, 58.8986, 0),
(@PATH, 6, -130, -398.722, 59.154, 0),
(@PATH, 7, -125.478, -403.119, 58.6467, 0),
(@PATH, 8, -116.097, -397.341, 57.1664, 0),
(@PATH, 9, -105.905, -394.793, 57.6366, 0),
(@PATH, 10, -100.374, -398.889, 58.6393, 0),
(@PATH, 11, -98.5197, -399.054, 58.4361, 0);

SET @NPC := 79229;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -278.114, -589.212, 50.569, 0),
(@PATH, 2, -283.429, -595.717, 49.8643, 0),
(@PATH, 3, -292.615, -600.322, 47.4784, 0),
(@PATH, 4, -297.727, -600.82, 47.6354, 0),
(@PATH, 5, -301.5, -597.342, 48.1357, 0),
(@PATH, 6, -302.42, -590.862, 47.866, 0),
(@PATH, 7, -296.284, -579.45, 48.5055, 0),
(@PATH, 8, -294.959, -575.836, 48.5461, 0),
(@PATH, 9, -289.625, -569.041, 49.1442, 0),
(@PATH, 10, -289.323, -560.17, 48.915, 0),
(@PATH, 11, -289.52, -548.415, 49.4453, 0),
(@PATH, 12, -288.878, -558.425, 48.9413, 0),
(@PATH, 13, -290.469, -567.745, 49.1461, 0),
(@PATH, 14, -293.706, -574.747, 48.6738, 0),
(@PATH, 15, -299.01, -581.124, 46.9888, 0),
(@PATH, 16, -302.881, -589.499, 47.6864, 0),
(@PATH, 17, -302.658, -595.325, 48.1197, 0),
(@PATH, 18, -298.651, -601.31, 47.7165, 0),
(@PATH, 19, -291.182, -601.608, 47.7367, 0),
(@PATH, 20, -284.572, -597.881, 49.3179, 0),
(@PATH, 21, -279.79, -590.679, 51.0235, 0),
(@PATH, 22, -273.983, -582.924, 50.2455, 0),
(@PATH, 23, -268.471, -578.609, 50.2878, 0),
(@PATH, 24, -264.631, -577.207, 50.572, 0),
(@PATH, 25, -255.102, -576.79, 51.1499, 0),
(@PATH, 26, -264.063, -577.211, 50.6017, 0),
(@PATH, 27, -269.527, -578.503, 50.0964, 0),
(@PATH, 28, -271.887, -581.544, 49.9768, 0);

SET @NPC := 79230;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -268.146, -579.628, 50.2867, 0),
(@PATH, 2, -261.925, -576.253, 50.6762, 0),
(@PATH, 3, -262.645, -581.918, 50.6558, 0),
(@PATH, 4, -269.838, -582.501, 49.7938, 0),
(@PATH, 5, -275.048, -585.149, 50.206, 0),
(@PATH, 6, -279.743, -591.974, 51.1174, 0),
(@PATH, 7, -289.329, -599.613, 47.8713, 0),
(@PATH, 8, -303.126, -591.521, 47.8429, 0),
(@PATH, 9, -306.46, -600.112, 47.9633, 0),
(@PATH, 10, -298.557, -600.93, 47.7391, 0),
(@PATH, 11, -292.697, -604.317, 47.6708, 0),
(@PATH, 12, -283.382, -600.72, 49.8817, 0),
(@PATH, 13, -279.163, -589.875, 50.833, 0),
(@PATH, 14, -271.047, -581.964, 49.9021, 0);

SET @NPC := 79244;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -208.388, -504.123, 51.6638, 0),
(@PATH, 2, -216.747, -496.224, 49.2585, 0),
(@PATH, 3, -223.846, -486.092, 48.5716, 0),
(@PATH, 4, -235.5, -479.669, 49.2839, 0),
(@PATH, 5, -255.621, -480.855, 49.444, 0),
(@PATH, 6, -238.023, -480.745, 49.1653, 0),
(@PATH, 7, -228.454, -484.15, 48.8135, 0),
(@PATH, 8, -221.895, -489.782, 48.5886, 0),
(@PATH, 9, -217.476, -496.934, 49.2432, 0),
(@PATH, 10, -212.497, -501.494, 51.2166, 0),
(@PATH, 11, -206.973, -504.283, 51.9107, 0),
(@PATH, 12, -202.654, -504.281, 52.8393, 0);

SET @NPC := 79245;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -213.047, -504.664, 50.9039, 0),
(@PATH, 2, -218.668, -498.713, 49.1948, 0),
(@PATH, 3, -223.364, -491.597, 48.0883, 0),
(@PATH, 4, -233.816, -485.034, 48.8204, 0),
(@PATH, 5, -239.75, -483.76, 49.0921, 0),
(@PATH, 6, -245.689, -483.842, 49.2077, 0),
(@PATH, 7, -254.883, -483.617, 49.4456, 0),
(@PATH, 8, -241.837, -483.706, 48.9397, 0),
(@PATH, 9, -234.516, -485.182, 48.8104, 0),
(@PATH, 10, -225.919, -491.995, 47.9344, 0),
(@PATH, 11, -222.576, -494.121, 48.2125, 0),
(@PATH, 12, -217.75, -498.868, 49.335, 0),
(@PATH, 13, -215.491, -502.696, 50.809, 0),
(@PATH, 14, -209.724, -505.442, 51.3525, 0),
(@PATH, 15, -201.66, -505.78, 52.8074, 0);

SET @NPC := 79260;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -126.057, -637.441, 12.9147, 0),
(@PATH, 2, -131.207, -632.538, 13.5732, 0),
(@PATH, 3, -133.335, -622.248, 13.5651, 0),
(@PATH, 4, -133.871, -610.818, 13.8859, 0),
(@PATH, 5, -133.472, -601.267, 15.7631, 0),
(@PATH, 6, -132.348, -593.642, 17.6534, 0),
(@PATH, 7, -133.976, -587.795, 18.5455, 0),
(@PATH, 8, -138.885, -581.29, 18.3326, 0),
(@PATH, 9, -144.945, -580.472, 18.7264, 0),
(@PATH, 10, -137.154, -584.373, 18.0452, 0),
(@PATH, 11, -134.3, -588.078, 18.6262, 0),
(@PATH, 12, -132.542, -595.351, 16.9984, 0),
(@PATH, 13, -134.872, -606.677, 14.7144, 0),
(@PATH, 14, -134.189, -619.154, 13.7979, 0),
(@PATH, 15, -130.385, -630.688, 13.2223, 0),
(@PATH, 16, -126.983, -636.548, 12.9847, 0),
(@PATH, 17, -119.175, -640.513, 11.1588, 0),
(@PATH, 18, -114.638, -642.051, 10.2214, 0),
(@PATH, 19, -111.363, -646.713, 8.38844, 0);

SET @NPC := 79273;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -181.386, -491.686, 54.0401, 0),
(@PATH, 2, -180.97, -498.254, 53.4632, 0),
(@PATH, 3, -183.791, -502.539, 53.3808, 0),
(@PATH, 4, -193.579, -506.077, 53.1769, 0),
(@PATH, 5, -193.943, -496.426, 53.2004, 0),
(@PATH, 6, -192.361, -490.083, 53.539, 0),
(@PATH, 7, -187.413, -492.182, 53.5523, 0);

SET @NPC := 79280;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -178.516, -501.169, 53.9117, 0),
(@PATH, 2, -170.62, -506.242, 53.6692, 0),
(@PATH, 3, -159.051, -509.527, 53.3194, 0),
(@PATH, 4, -155.555, -512.44, 52.9296, 0),
(@PATH, 5, -153.638, -522.172, 52.0989, 0),
(@PATH, 6, -156.642, -511.144, 53.1215, 0),
(@PATH, 7, -163.563, -507.506, 53.2078, 0),
(@PATH, 8, -170.199, -507.066, 53.6323, 0),
(@PATH, 9, -177.721, -502.582, 53.9113, 0),
(@PATH, 10, -185.891, -502.888, 52.9808, 0),
(@PATH, 11, -192.141, -503.736, 53.1611, 0);

SET @NPC := 79283;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -235.978, -578.03, 51.2275, 0),
(@PATH, 2, -232.709, -566.546, 51.2354, 0),
(@PATH, 3, -226.826, -558.412, 51.2295, 0),
(@PATH, 4, -216.463, -551.683, 51.2295, 0),
(@PATH, 5, -206.377, -549.712, 51.2295, 0),
(@PATH, 6, -190.661, -554.203, 51.2295, 0),
(@PATH, 7, -194.537, -559.695, 51.2295, 0),
(@PATH, 8, -204.265, -556.918, 51.2295, 0),
(@PATH, 9, -212.195, -557.29, 51.2295, 0),
(@PATH, 10, -221.252, -562.377, 51.2295, 0),
(@PATH, 11, -227.049, -571.138, 51.2295, 0),
(@PATH, 12, -228.723, -581.277, 51.2264, 0),
(@PATH, 13, -235.13, -580.892, 51.222, 0);

SET @NPC := 79284;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -228.812, -569.757, 51.2314, 0),
(@PATH, 2, -225.332, -562.401, 51.23, 0),
(@PATH, 3, -220.089, -556.916, 51.23, 0),
(@PATH, 4, -211.182, -553.736, 51.23, 0),
(@PATH, 5, -203.248, -553.507, 51.23, 0),
(@PATH, 6, -194.853, -555.999, 51.23, 0),
(@PATH, 7, -187.356, -561.157, 51.23, 0),
(@PATH, 8, -182.826, -567.105, 51.072, 0),
(@PATH, 9, -179.251, -573.939, 48.0013, 0),
(@PATH, 10, -179.25, -581.854, 45.0103, 0),
(@PATH, 11, -180.508, -588.861, 42.1844, 0),
(@PATH, 12, -185.547, -596.173, 38.7453, 0),
(@PATH, 13, -193.62, -601.311, 34.4809, 0),
(@PATH, 14, -202.36, -605.164, 30.8329, 0),
(@PATH, 15, -212.195, -603.824, 26.463, 0),
(@PATH, 16, -219.832, -602.784, 23.3996, 0),
(@PATH, 17, -226.192, -596.772, 20.6368, 0),
(@PATH, 18, -228.849, -592.655, 19.4674, 0),
(@PATH, 19, -222.017, -602.068, 22.7777, 0),
(@PATH, 20, -215.955, -606.225, 25.5062, 0),
(@PATH, 21, -206.392, -607.716, 28.9385, 0),
(@PATH, 22, -195.975, -605.079, 33.3159, 0),
(@PATH, 23, -190.92, -602.234, 35.448, 0),
(@PATH, 24, -186.186, -599.686, 37.3745, 0),
(@PATH, 25, -181.845, -593.462, 40.1753, 0),
(@PATH, 26, -179.362, -585.189, 43.6891, 0),
(@PATH, 27, -180.207, -574.755, 47.8364, 0),
(@PATH, 28, -183.317, -567.58, 51.0124, 0),
(@PATH, 29, -188.935, -559.687, 51.2296, 0),
(@PATH, 30, -195.706, -554.703, 51.2296, 0),
(@PATH, 31, -204.469, -552.705, 51.2296, 0),
(@PATH, 32, -213.906, -554.141, 51.2296, 0),
(@PATH, 33, -222.241, -558.84, 51.2296, 0),
(@PATH, 34, -227.752, -566.248, 51.2296, 0),
(@PATH, 35, -230.554, -574.552, 51.223, 0),
(@PATH, 36, -230.624, -583.197, 51.2233, 0);

SET @NPC := 79294;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -95.7338, -697.73, 8.60488, 0),
(@PATH, 2, -96.7789, -688.803, 8.02651, 0),
(@PATH, 3, -96.152, -701.601, 8.81298, 0),
(@PATH, 4, -96.7254, -714.553, 8.68129, 0),
(@PATH, 5, -97.0199, -721.203, 8.4492, 0),
(@PATH, 6, -85.5141, -726.596, 8.9113, 0),
(@PATH, 7, -81.3754, -728.198, 8.96114, 0),
(@PATH, 8, -92.5992, -723.622, 8.55044, 0),
(@PATH, 9, -96.1957, -718.586, 8.52734, 0),
(@PATH, 10, -95.9761, -709.85, 8.78773, 0);

SET @NPC := 79302;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -74.2432, -730.129, 8.67827, 0),
(@PATH, 2, -77.1636, -729.474, 8.95225, 0),
(@PATH, 3, -68.9657, -731.816, 8.11165, 0),
(@PATH, 4, -58.8156, -731.452, 8.9764, 0),
(@PATH, 5, -46.8796, -729.33, 9.11806, 0),
(@PATH, 6, -36.0463, -729.314, 8.83626, 0),
(@PATH, 7, -23.478, -732.327, 8.36514, 0),
(@PATH, 8, -16.3456, -736.548, 8.74717, 0),
(@PATH, 9, -9.58846, -743.481, 8.97899, 0),
(@PATH, 10, -3.01404, -752.841, 8.79292, 0),
(@PATH, 11, -12.3875, -740.906, 9.06114, 0),
(@PATH, 12, -22.1426, -731.855, 8.36183, 0),
(@PATH, 13, -30.9523, -727.807, 8.45316, 0),
(@PATH, 14, -43.1824, -726.996, 8.89525, 0),
(@PATH, 15, -53.4473, -729.108, 9.3, 0),
(@PATH, 16, -61.0866, -731.592, 8.76967, 0);

SET @NPC := 79310;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -79.8256, -783.363, 26.461, 0),
(@PATH, 2, -84.7052, -786.976, 26.2062, 0),
(@PATH, 3, -98.3674, -791.023, 27.8132, 0),
(@PATH, 4, -103.96, -792.568, 28.1713, 0),
(@PATH, 5, -92.1138, -786.301, 27.0584, 0),
(@PATH, 6, -83.4001, -782.925, 26.476, 0),
(@PATH, 7, -84.0784, -776.535, 26.7875, 0),
(@PATH, 8, -88.5902, -777.037, 26.4027, 0),
(@PATH, 9, -97.0735, -778.529, 22.3356, 0),
(@PATH, 10, -102.923, -781.45, 22.1074, 0),
(@PATH, 11, -112.949, -786.457, 17.2807, 0),
(@PATH, 12, -118.473, -790.736, 17.1538, 0),
(@PATH, 13, -109.865, -784.406, 18.4495, 0),
(@PATH, 14, -102.652, -780.832, 22.1535, 0),
(@PATH, 15, -95.9249, -778.518, 22.3439, 0),
(@PATH, 16, -86.3046, -776.903, 26.7781, 0),
(@PATH, 17, -82.7019, -776.492, 26.7884, 0);

SET @NPC := 79313;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -47.0207, -783.364, 18.4, 0),
(@PATH, 2, -57.6274, -780.952, 18.0084, 0),
(@PATH, 3, -67.8561, -779.966, 17.6858, 0),
(@PATH, 4, -78.7342, -780.823, 17.4011, 0),
(@PATH, 5, -87.9715, -783.347, 17.2087, 0),
(@PATH, 6, -99.7804, -787.733, 17.0235, 0),
(@PATH, 7, -117.292, -795.731, 16.8259, 0),
(@PATH, 8, -121.205, -790.938, 17.1427, 0),
(@PATH, 9, -128.615, -793.822, 17.1852, 0),
(@PATH, 10, -123.136, -796.65, 16.7944, 0),
(@PATH, 11, -120.107, -799.226, 16.8365, 0),
(@PATH, 12, -107.485, -791.94, 16.9355, 0),
(@PATH, 13, -98.2183, -786.068, 17.0327, 0),
(@PATH, 14, -90.2045, -783.179, 17.1543, 0),
(@PATH, 15, -82.5683, -782.137, 17.3244, 0),
(@PATH, 16, -75.9856, -780.132, 17.4616, 0),
(@PATH, 17, -63.743, -780.858, 17.8108, 0),
(@PATH, 18, -56.1258, -782.532, 18.0567, 0);

SET @NPC := 79322;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -120.628, -803.27, 16.9074, 0),
(@PATH, 2, -108.965, -794.554, 16.9476, 0),
(@PATH, 3, -98.7241, -790.001, 17.0705, 0),
(@PATH, 4, -87.8975, -787.106, 17.236, 0),
(@PATH, 5, -76.0205, -785.218, 17.4743, 0),
(@PATH, 6, -64.5553, -783.844, 17.7829, 0),
(@PATH, 7, -53.9866, -784.947, 18.1333, 0),
(@PATH, 8, -46.1769, -784.534, 18.4305, 0),
(@PATH, 9, -38.5092, -787.698, 18.7604, 0),
(@PATH, 10, -31.5202, -795.86, 19.0579, 0),
(@PATH, 11, -40.4254, -786.469, 18.68, 0),
(@PATH, 12, -47.8866, -784.107, 18.3624, 0),
(@PATH, 13, -57.419, -784.738, 18.0015, 0),
(@PATH, 14, -67.7957, -782.45, 17.6857, 0),
(@PATH, 15, -84.9486, -784.841, 17.2894, 0),
(@PATH, 16, -99.947, -789.274, 17.039, 0),
(@PATH, 17, -111.081, -795.188, 16.9254, 0);

SET @NPC := 79352;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -117.106, -839.009, 16.9045, 0),
(@PATH, 2, -122.192, -831.302, 16.944, 0),
(@PATH, 3, -123.001, -826.456, 16.9273, 0),
(@PATH, 4, -121.999, -834.271, 16.902, 0),
(@PATH, 5, -115.461, -840.748, 16.9072, 0),
(@PATH, 6, -101.85, -849.963, 17.0177, 0),
(@PATH, 7, -87.6209, -854.885, 17.2528, 0),
(@PATH, 8, -78.4275, -856.52, 17.4395, 0),
(@PATH, 9, -66.7588, -856.625, 17.1192, 0),
(@PATH, 10, -56.7404, -856.366, 18.0792, 0),
(@PATH, 11, -44.1896, -853.147, 18.5486, 0),
(@PATH, 12, -36.0581, -849.06, 18.9014, 0),
(@PATH, 13, -28.4667, -841.478, 19.2514, 0),
(@PATH, 14, -24.0773, -834.352, 19.4557, 0),
(@PATH, 15, -20.3287, -825.712, 19.6396, 0),
(@PATH, 16, -25.5192, -835.12, 19.3762, 0),
(@PATH, 17, -34.3872, -844.244, 18.952, 0),
(@PATH, 18, -43.7533, -850.723, 18.5518, 0),
(@PATH, 19, -53.5531, -853.393, 18.1786, 0),
(@PATH, 20, -67.8261, -854.946, 17.0763, 0),
(@PATH, 21, -80.7533, -854.221, 17.4013, 0),
(@PATH, 22, -86.6403, -853.322, 17.2865, 0),
(@PATH, 23, -100.089, -847.089, 17.0872, 0),
(@PATH, 24, -107.973, -842.11, 17.019, 0),
(@PATH, 25, -116.381, -837.35, 16.9481, 0);

SET @NPC := 79361;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -115.531, -640.289, 10.332, 0),
(@PATH, 2, -119.61, -637.165, 11.9972, 0),
(@PATH, 3, -125.722, -634.24, 12.863, 0),
(@PATH, 4, -129.801, -627.561, 13.2444, 0),
(@PATH, 5, -131.164, -621.045, 13.0536, 0),
(@PATH, 6, -130.259, -612.687, 13.65, 0),
(@PATH, 7, -131.342, -604.735, 15.2594, 0),
(@PATH, 8, -131.868, -596.116, 16.6263, 0),
(@PATH, 9, -132.668, -589.162, 18.4356, 0),
(@PATH, 10, -137.081, -581.72, 17.9692, 0),
(@PATH, 11, -144.153, -579.298, 18.7887, 0),
(@PATH, 12, -135.828, -582.273, 18.0063, 0),
(@PATH, 13, -132.765, -587.922, 18.3614, 0),
(@PATH, 14, -131.508, -595.588, 16.8821, 0),
(@PATH, 15, -132.487, -606.489, 14.5759, 0),
(@PATH, 16, -131.772, -617.091, 13.2291, 0),
(@PATH, 17, -130.21, -625.345, 13.0998, 0),
(@PATH, 18, -124.713, -635.075, 12.7965, 0),
(@PATH, 19, -116.702, -640.322, 10.5276, 0),
(@PATH, 20, -110.439, -643.186, 9.0142, 0),
(@PATH, 21, -107.318, -649.43, 6.96608, 0);

SET @NPC := 79360;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -101.323, -648.082, 6.95428, 0),
(@PATH, 2, -106.893, -643.256, 8.25241, 0),
(@PATH, 3, -116.156, -638.283, 10.5795, 0),
(@PATH, 4, -123.216, -635.846, 12.7492, 0),
(@PATH, 5, -127.748, -630.052, 13.1721, 0),
(@PATH, 6, -125.632, -621.187, 12.7552, 0),
(@PATH, 7, -121.634, -617.784, 13.6787, 0),
(@PATH, 8, -112.41, -617.57, 13.3277, 0),
(@PATH, 9, -121.307, -615.05, 14.0148, 0),
(@PATH, 10, -131.972, -613.742, 13.2048, 0),
(@PATH, 11, -135.859, -619.815, 14.3729, 0),
(@PATH, 12, -128.42, -626.904, 13.3199, 0),
(@PATH, 13, -127.534, -633.981, 12.8688, 0),
(@PATH, 14, -121.512, -637.325, 12.6194, 0),
(@PATH, 15, -112.917, -639.004, 10.0211, 0),
(@PATH, 16, -108.466, -642.414, 8.67491, 0),
(@PATH, 17, -110.735, -651.05, 7.17773, 0);

SET @NPC := 79373;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -158.903, -399.895, 56.3324, 0),
(@PATH, 2, -151.984, -402.043, 56.9471, 0),
(@PATH, 3, -144.297, -403.96, 57.6147, 0),
(@PATH, 4, -154.368, -401.496, 56.7647, 0),
(@PATH, 5, -161.632, -400.326, 56.6994, 0),
(@PATH, 6, -167.493, -401.874, 57.0191, 0),
(@PATH, 7, -170.658, -405.778, 57.1812, 0),
(@PATH, 8, -179.541, -417.187, 55.0673, 0),
(@PATH, 9, -172.693, -407.324, 56.4777, 0),
(@PATH, 10, -169.554, -402.835, 57.1019, 0);

SET @NPC := 79374;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -167.042, -399.26, 57.2689, 0),
(@PATH, 2, -157.894, -397.54, 56.2972, 0),
(@PATH, 3, -150.114, -399.496, 56.8607, 0),
(@PATH, 4, -142.306, -402.254, 57.9221, 0),
(@PATH, 5, -152.106, -398.53, 56.6912, 0),
(@PATH, 6, -161.718, -397.32, 56.6253, 0),
(@PATH, 7, -168.749, -400.742, 57.2089, 0),
(@PATH, 8, -173.918, -404.355, 56.7423, 0),
(@PATH, 9, -182.801, -416.518, 54.9347, 0),
(@PATH, 10, -177.175, -408.341, 55.6547, 0),
(@PATH, 11, -172.19, -403.093, 57.0664, 0),
(@PATH, 12, -169.061, -399.799, 57.253, 0);

SET @NPC := 79376;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -272.555, -584.816, 50.3737, 0),
(@PATH, 2, -276.013, -589.511, 50.5626, 0),
(@PATH, 3, -280.155, -596.561, 50.7085, 0),
(@PATH, 4, -284.985, -600.429, 49.1995, 0),
(@PATH, 5, -294.598, -604.058, 47.5833, 0),
(@PATH, 6, -300.205, -604.022, 47.6767, 0),
(@PATH, 7, -303.986, -595.353, 48.1082, 0),
(@PATH, 8, -304.541, -589.661, 47.556, 0),
(@PATH, 9, -299.254, -582.531, 46.9581, 0),
(@PATH, 10, -297.696, -577.169, 47.9851, 0),
(@PATH, 11, -293.229, -569.243, 48.8091, 0),
(@PATH, 12, -292.196, -562.316, 48.993, 0),
(@PATH, 13, -292.548, -549.596, 49.4471, 0),
(@PATH, 14, -292.54, -555.878, 49.4473, 0),
(@PATH, 15, -294.605, -566.301, 48.6513, 0),
(@PATH, 16, -297.839, -573.818, 48.18, 0),
(@PATH, 17, -304.166, -583.905, 48.0411, 0),
(@PATH, 18, -307.088, -591.915, 47.7115, 0),
(@PATH, 19, -304.936, -599.439, 48.0508, 0),
(@PATH, 20, -299.129, -602.931, 47.6307, 0),
(@PATH, 21, -287.287, -601.839, 48.4487, 0),
(@PATH, 22, -283.396, -599.706, 49.8093, 0),
(@PATH, 23, -279.445, -593.227, 50.9235, 0),
(@PATH, 24, -274.212, -587.13, 50.5272, 0),
(@PATH, 25, -268.536, -581.925, 50.0732, 0),
(@PATH, 26, -261.97, -579.867, 50.5795, 0),
(@PATH, 27, -256.205, -579.168, 51.1499, 0),
(@PATH, 28, -264.283, -578.689, 50.5239, 0);

SET @NPC := 79378;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -212.814, -554.361, 19.3065, 0),
(@PATH, 2, -218.746, -556.944, 19.3065, 0),
(@PATH, 3, -223.087, -559.872, 19.3065, 0),
(@PATH, 4, -226.844, -563.376, 19.3065, 0),
(@PATH, 5, -231.155, -571.766, 19.3065, 0),
(@PATH, 6, -232.115, -577.525, 19.3065, 0),
(@PATH, 7, -231.803, -584.413, 19.3065, 0),
(@PATH, 8, -231.942, -577.026, 19.3065, 0),
(@PATH, 9, -229.256, -568.698, 19.3065, 0),
(@PATH, 10, -226.79, -563.796, 19.3065, 0),
(@PATH, 11, -221.51, -559.031, 19.3065, 0),
(@PATH, 12, -215.367, -555.433, 19.3065, 0),
(@PATH, 13, -209.962, -553.943, 19.3065, 0),
(@PATH, 14, -202.732, -554.291, 19.3065, 0),
(@PATH, 15, -195.872, -555.719, 19.3065, 0),
(@PATH, 16, -191.306, -558.311, 19.3065, 0),
(@PATH, 17, -186.76, -561.962, 19.3065, 0),
(@PATH, 18, -183.302, -567.237, 19.3069, 0),
(@PATH, 19, -188.236, -561.17, 19.3069, 0),
(@PATH, 20, -193.608, -557.227, 19.3069, 0),
(@PATH, 21, -199.561, -554.525, 19.3069, 0),
(@PATH, 22, -205.59, -553.829, 19.3069, 0);

SET @NPC := 79379;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -213.462, -552.205, 19.3069, 0),
(@PATH, 2, -218.541, -554.302, 19.3069, 0),
(@PATH, 3, -223.459, -556.979, 19.3069, 0),
(@PATH, 4, -227.632, -561.386, 19.3069, 0),
(@PATH, 5, -231.301, -566.23, 19.3069, 0),
(@PATH, 6, -233.369, -572.188, 19.3069, 0),
(@PATH, 7, -234.456, -578.159, 19.3069, 0),
(@PATH, 8, -234.281, -584.575, 19.3069, 0),
(@PATH, 9, -233.902, -579.447, 19.3069, 0),
(@PATH, 10, -233.019, -572.849, 19.3069, 0),
(@PATH, 11, -231.265, -567.039, 19.3069, 0),
(@PATH, 12, -228.422, -563.335, 19.3069, 0),
(@PATH, 13, -224.399, -558.634, 19.3069, 0),
(@PATH, 14, -218.11, -554.816, 19.3069, 0),
(@PATH, 15, -213.458, -552.633, 19.3069, 0),
(@PATH, 16, -206.749, -551.075, 19.3069, 0),
(@PATH, 17, -200.565, -551.295, 19.3069, 0),
(@PATH, 18, -194.766, -553.086, 19.3069, 0),
(@PATH, 19, -188.36, -557.568, 19.3069, 0),
(@PATH, 20, -183.78, -561.905, 19.3069, 0),
(@PATH, 21, -180.807, -566.232, 19.3072, 0);

SET @NPC := 79380;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`) VALUES
(@PATH, 1, -209.205, -552.38, 19.3072, 0),
(@PATH, 2, -213.383, -553.387, 19.3072, 0),
(@PATH, 3, -218.492, -555.682, 19.3072, 0),
(@PATH, 4, -222.232, -557.608, 19.3072, 0),
(@PATH, 5, -225.394, -560.198, 19.3072, 0),
(@PATH, 6, -228.666, -564.743, 19.3072, 0),
(@PATH, 7, -231.182, -568.937, 19.3072, 0),
(@PATH, 8, -232.432, -571.965, 19.3072, 0),
(@PATH, 9, -233.102, -577.876, 19.3072, 0),
(@PATH, 10, -232.975, -582.662, 19.3072, 0),
(@PATH, 11, -232.797, -584.057, 19.3072, 0),
(@PATH, 12, -233.272, -578.126, 19.3072, 0),
(@PATH, 13, -232.335, -572.492, 19.3072, 0),
(@PATH, 14, -229.983, -566.768, 19.3072, 0),
(@PATH, 15, -225.726, -561.212, 19.3072, 0),
(@PATH, 16, -221.409, -557.108, 19.3072, 0),
(@PATH, 17, -215.71, -554.406, 19.3072, 0),
(@PATH, 18, -210.331, -552.845, 19.3072, 0),
(@PATH, 19, -204.152, -552.711, 19.3072, 0),
(@PATH, 20, -198.758, -553.724, 19.3072, 0),
(@PATH, 21, -193.812, -555.45, 19.3072, 0),
(@PATH, 22, -190.047, -557.31, 19.3072, 0),
(@PATH, 23, -186.283, -560.27, 19.3072, 0),
(@PATH, 24, -182.695, -565.735, 19.3072, 0),
(@PATH, 25, -186.463, -560.21, 19.3072, 0),
(@PATH, 26, -191.284, -556.552, 19.3072, 0),
(@PATH, 27, -195.167, -554.404, 19.3072, 0),
(@PATH, 28, -200.723, -553.018, 19.3072, 0),
(@PATH, 29, -205.954, -552.576, 19.3072, 0);



-- Courtyard Door SAI
SET @ENTRY := 18895;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,70,0,100,0,2,0,0,0,104,16,0,0,0,0,0,14,32443,101812,0,0,0,0,0,"Courtyard Door - On Gameobject State Changed - Set Gameobject Flag Not Selectable");



-- Scholomance Necromancer http://wotlk.openwow.com/npc=10477
DELETE FROM `smart_scripts` WHERE  `entryorguid`=10477 AND `source_type`=0 AND `id`=0 AND `link`=0;


-- Wooly Justice - [A][H] http://www.wowhead.com/quest=12707/wooly-justice

UPDATE creature_template SET AIName='', ScriptName='npc_enraged_mammoth', spell1=52601, spell2=52603, npcflag=16777216 WHERE entry=28851;
UPDATE creature SET MovementType=1, spawndist=5 WHERE id=28851;
DELETE FROM smart_scripts WHERE entryorguid=28851 AND source_type=0;

UPDATE creature_template SET AIName='SmartAI' WHERE entry=28861;

DELETE FROM smart_scripts WHERE entryorguid=28861 AND source_type=0;
INSERT INTO smart_scripts VALUES (28861, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 33, 28876, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0,  'Mam''toth desciple - On death - Give credit to invoker,  if Tampered');
INSERT INTO smart_scripts VALUES (28861, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 28, 52607, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,  'Mam''toth desciple - On reset - Remove aura from trample');

DELETE FROM conditions WHERE SourceEntry=52596 AND SourceTypeOrReferenceId=17;
INSERT INTO conditions VALUES (17, 0, 52596, 0, 0, 31, 1, 3, 28851, 0, 0, 0, 0, '',  'Medallion of Mam''toth can hit only Enraged Mammoths');

DELETE FROM conditions WHERE SourceEntry=52603 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions VALUES (13, 1, 52603, 0, 0, 31, 0, 3, 28861, 0, 0, 0, 0, '',  'Trample effect 1 can hit only hit Desciple of Mam''toth');
INSERT INTO conditions VALUES (13, 2, 52603, 0, 0, 31, 0, 3, 28861, 0, 0, 0, 0, '',  'Trample effect 2 can hit only hit Desciple of Mam''toth');

DELETE FROM conditions WHERE SourceEntry=28861 AND SourceTypeOrReferenceId=22;
INSERT INTO conditions VALUES (22, 1, 28861, 0, 0, 1, 1, 52607, 0, 0, 0, 0, 0, '',  'Mam''toth desciple 1st event is valid only,  if has Tampered aura credit');

DELETE FROM conditions WHERE SourceEntry=52607 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions VALUES (13, 1, 52607, 0, 0, 31, 0, 3, 28861, 0, 0, 0, 0, '',  'TAura effect can hit only Desciple of Mam''toth');



-- Time-Lost Proto Drake (32491)
-- Vyragosa (32630)

DELETE FROM pool_creature WHERE pool_entry=60002;
DELETE FROM pool_template WHERE entry=60002;
DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(32630, 32491));
DELETE FROM creature WHERE id IN(32630, 32491);
UPDATE creature_template SET speed_run=3, InhabitType=4, HoverHeight=1, AIName='', ScriptName='npc_time_lost_proto_drake' WHERE entry IN(32630, 32491);
UPDATE creature_model_info SET CombatReach=8 WHERE DisplayID IN(28110, 26711);
REPLACE INTO creature_template_addon VALUES(32491, 0, 0, 50331648, 0, 0, '');
REPLACE INTO creature_template_addon VALUES(32630, 0, 0, 50331648, 0, 0, '');

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
    (202441, 32491, 571, 0, 0, 1, 1, 0, 0, 7095.35, -287.507, 929.642, 1.25586, 3600*4, 0, 0, 18900, 0, 0, 0, 0, 0, 0);

DELETE FROM script_waypoint WHERE entry=32491;
INSERT INTO script_waypoint VALUES (32491, 1, 7075.1, -244.398, 807.095, 0, 'Time-Lost Proto Drake'),(32491, 2, 7058.68, -229.769, 799.321, 0, 'Time-Lost Proto Drake'),(32491, 3, 7015.86, -208.601, 789.023, 0, 'Time-Lost Proto Drake'),(32491, 4, 6983.18, -196.699, 785.172, 0, 'Time-Lost Proto Drake'),(32491, 5, 6918.72, -174.838, 769.05, 0, 'Time-Lost Proto Drake'),(32491, 6, 6886.89, -163.886, 759.534, 0, 'Time-Lost Proto Drake'),(32491, 7, 6842.48, -141.862, 752.487, 0, 'Time-Lost Proto Drake'),(32491, 8, 6813.63, -120.149, 750.958, 0, 'Time-Lost Proto Drake'),(32491, 9, 6769.42, -65.9483, 752.738, 0, 'Time-Lost Proto Drake'),(32491, 10, 6747.93, -38.3491, 753.504, 0, 'Time-Lost Proto Drake'),(32491, 11, 6711.18, -0.905537, 753, 0, 'Time-Lost Proto Drake'),(32491, 12, 6674.33, 17.9824, 749.735, 0, 'Time-Lost Proto Drake'),(32491, 13, 6641.14, 23.042, 747.662, 0, 'Time-Lost Proto Drake'),(32491, 14, 6605.94, 15.8523, 745.188, 0, 'Time-Lost Proto Drake'),(32491, 15, 6544.4, -16.3795, 736.919, 0, 'Time-Lost Proto Drake'),(32491, 16, 6509.91, -41.7824, 726.561, 0, 'Time-Lost Proto Drake'),(32491, 17, 6487.8, -67.0193, 716.598, 0, 'Time-Lost Proto Drake'),(32491, 18, 6460.02, -104.545, 706.726, 0, 'Time-Lost Proto Drake'),(32491, 19, 6426.82, -165.979, 702.346, 0, 'Time-Lost Proto Drake'),(32491, 20, 6411.3, -197.238, 700.276, 0, 'Time-Lost Proto Drake'),(32491, 21, 6393.1, -245.425, 690.299, 0, 'Time-Lost Proto Drake'),(32491, 22, 6379.5, -288.252, 674.026, 0, 'Time-Lost Proto Drake'),(32491, 23, 6362.43, -325.35, 649.373, 0, 'Time-Lost Proto Drake'),(32491, 24, 6349.75, -348.877, 626.786, 0, 'Time-Lost Proto Drake'),(32491, 25, 6338.78, -371.539, 602.488, 0, 'Time-Lost Proto Drake'),(32491, 26, 6321.89, -409.023, 564.587, 0, 'Time-Lost Proto Drake'),(32491, 27, 6306.89, -450.056, 535.427, 0, 'Time-Lost Proto Drake'),(32491, 28, 6295.58, -479.237, 519.789, 0, 'Time-Lost Proto Drake'),(32491, 29, 6275.4, -531.626, 497.103, 0, 'Time-Lost Proto Drake'),(32491, 30, 6262, -575.154, 468.779, 0, 'Time-Lost Proto Drake'),(32491, 31, 6243.06, -607.821, 447.979, 0, 'Time-Lost Proto Drake'),(32491, 32, 6204.34, -649.963, 428.429, 0, 'Time-Lost Proto Drake'),(32491, 33, 6157.96, -679.508, 418.208, 0, 'Time-Lost Proto Drake'),(32491, 34, 6116.93, -715.809, 413.25, 0, 'Time-Lost Proto Drake'),(32491, 35, 6101.08, -754.939, 408.596, 0, 'Time-Lost Proto Drake'),(32491, 36, 6100.15, -789.918, 408.566, 0, 'Time-Lost Proto Drake'),
(32491, 37, 6097.92, -859.818, 411.412, 0, 'Time-Lost Proto Drake'),(32491, 38, 6097.33, -891.273, 413.89, 0, 'Time-Lost Proto Drake'),(32491, 39, 6103.5, -938.345, 419.064, 0, 'Time-Lost Proto Drake'),(32491, 40, 6126.89, -1004.07, 423.88, 0, 'Time-Lost Proto Drake'),(32491, 41, 6140.69, -1031, 425.452, 0, 'Time-Lost Proto Drake'),(32491, 42, 6174.43, -1081.3, 428.453, 0, 'Time-Lost Proto Drake'),(32491, 43, 6220.59, -1126.96, 433.835, 0, 'Time-Lost Proto Drake'),(32491, 44, 6248.67, -1147.08, 439.383, 0, 'Time-Lost Proto Drake'),(32491, 45, 6277.74, -1165.61, 445.361, 0, 'Time-Lost Proto Drake'),(32491, 46, 6329.04, -1194.79, 452.343, 0, 'Time-Lost Proto Drake'),(32491, 47, 6383.55, -1223.81, 453.9, 0, 'Time-Lost Proto Drake'),(32491, 48, 6425.34, -1245.53, 465.955, 0, 'Time-Lost Proto Drake'),(32491, 49, 6454.6, -1260.45, 490.074, 0, 'Time-Lost Proto Drake'),(32491, 50, 6497.36, -1263.91, 528.572, 0, 'Time-Lost Proto Drake'),(32491, 51, 6513.02, -1262.49, 542.487, 0, 'Time-Lost Proto Drake'),(32491, 52, 6564.84, -1243.36, 592.473, 0, 'Time-Lost Proto Drake'),(32491, 53, 6580.48, -1235.79, 608.01, 0, 'Time-Lost Proto Drake'),(32491, 54, 6624.6, -1214.44, 690.166, 0, 'Time-Lost Proto Drake'),(32491, 55, 6637.92, -1207.87, 740.015, 0, 'Time-Lost Proto Drake'),(32491, 56, 6651.86, -1200.79, 759.156, 0, 'Time-Lost Proto Drake'),(32491, 57, 6691.1, -1181.43, 802.911, 0, 'Time-Lost Proto Drake'),(32491, 58, 6722.14, -1167.74, 811.505, 0, 'Time-Lost Proto Drake'),(32491, 59, 6753.37, -1154.48, 820.091, 0, 'Time-Lost Proto Drake'),(32491, 60, 6818.83, -1134.05, 834.004, 0, 'Time-Lost Proto Drake'),(32491, 61, 6851.54, -1124.01, 847.969, 0, 'Time-Lost Proto Drake'),(32491, 62, 6893.41, -1109.47, 862.142, 0, 'Time-Lost Proto Drake'),(32491, 63, 6957.6, -1096.39, 900.375, 0, 'Time-Lost Proto Drake'),(32491, 64, 6989.05, -1089.06, 913.865, 0, 'Time-Lost Proto Drake'),(32491, 65, 7053.54, -1074.56, 936.887, 0, 'Time-Lost Proto Drake'),(32491, 66, 7099.48, -1066.68, 951.718, 0, 'Time-Lost Proto Drake'),(32491, 67, 7154.79, -1069.21, 957.22, 0, 'Time-Lost Proto Drake'),(32491, 68, 7165.23, -1070.09, 957.559, 0, 'Time-Lost Proto Drake'),(32491, 69, 7200.19, -1071.31, 958.613, 0, 'Time-Lost Proto Drake'),(32491, 70, 7268.91, -1082.33, 960.48, 0, 'Time-Lost Proto Drake'),(32491, 71, 7295.74, -1106.03, 960.943, 0, 'Time-Lost Proto Drake'),(32491, 72, 7324.25, -1142.94, 962.878, 0, 'Time-Lost Proto Drake'),
(32491, 73, 7354.7, -1204.13, 968.725, 0, 'Time-Lost Proto Drake'),(32491, 74, 7366.07, -1236.71, 974.457, 0, 'Time-Lost Proto Drake'),(32491, 75, 7386.64, -1273.81, 982.442, 0, 'Time-Lost Proto Drake'),(32491, 76, 7407.8, -1301.28, 992.554, 0, 'Time-Lost Proto Drake'),(32491, 77, 7447.9, -1354.87, 1012.99, 0, 'Time-Lost Proto Drake'),(32491, 78, 7468.28, -1381.03, 1024.16, 0, 'Time-Lost Proto Drake'),(32491, 79, 7509.35, -1431.2, 1050.55, 0, 'Time-Lost Proto Drake'),(32491, 80, 7530.09, -1455.15, 1065.37, 0, 'Time-Lost Proto Drake'),(32491, 81, 7550.81, -1477.1, 1083.09, 0, 'Time-Lost Proto Drake'),(32491, 82, 7587.11, -1515.16, 1115.62, 0, 'Time-Lost Proto Drake'),(32491, 83, 7619.98, -1547.88, 1158.15, 0, 'Time-Lost Proto Drake'),(32491, 84, 7637.2, -1565.58, 1182.96, 0, 'Time-Lost Proto Drake'),(32491, 85, 7668.3, -1601.09, 1231.33, 0, 'Time-Lost Proto Drake'),(32491, 86, 7684.51, -1623.2, 1253.07, 0, 'Time-Lost Proto Drake'),(32491, 87, 7717.26, -1672.47, 1288.12, 0, 'Time-Lost Proto Drake'),(32491, 88, 7717.26, -1672.47, 1288.12, 0, 'Time-Lost Proto Drake'),(32491, 89, 7763.04, -1693.93, 1304.13, 0, 'Time-Lost Proto Drake'),(32491, 90, 7781.53, -1695.46, 1306.18, 0, 'Time-Lost Proto Drake'),(32491, 91, 7846.44, -1692.33, 1305.35, 0, 'Time-Lost Proto Drake'),(32491, 92, 7877.58, -1683.96, 1300.57, 0, 'Time-Lost Proto Drake'),(32491, 93, 7898.07, -1675.74, 1293.12, 0, 'Time-Lost Proto Drake'),(32491, 94, 7956.83, -1649.3, 1265.91, 0, 'Time-Lost Proto Drake'),(32491, 95, 7984.1, -1634.5, 1249.7, 0, 'Time-Lost Proto Drake'),(32491, 96, 8040.35, -1606.79, 1218.68, 0, 'Time-Lost Proto Drake'),(32491, 97, 8069.13, -1592.03, 1205.37, 0, 'Time-Lost Proto Drake'),(32491, 98, 8096.88, -1575.05, 1192.46, 0, 'Time-Lost Proto Drake'),(32491, 99, 8149.59, -1538.56, 1164.41, 0, 'Time-Lost Proto Drake'),(32491, 100, 8175.64, -1520.51, 1149.55, 0, 'Time-Lost Proto Drake'),(32491, 101, 8228.32, -1484.3, 1121.05, 0, 'Time-Lost Proto Drake'),(32491, 102, 8274.75, -1451.98, 1096.24, 0, 'Time-Lost Proto Drake'),(32491, 103, 8291.93, -1410.78, 1085.82, 0, 'Time-Lost Proto Drake'),(32491, 104, 8338.53, -1381.17, 1074.43, 0, 'Time-Lost Proto Drake'),(32491, 105, 8357.98, -1378.58, 1071.42, 0, 'Time-Lost Proto Drake'),(32491, 106, 8406.78, -1427.2, 1059.02, 0, 'Time-Lost Proto Drake'),(32491, 107, 8431.29, -1451.03, 1051.53, 0, 'Time-Lost Proto Drake'),(32491, 108, 8455.86, -1474.61, 1043.48, 0, 'Time-Lost Proto Drake'),
(32491, 109, 8477.97, -1500.25, 1034.6, 0, 'Time-Lost Proto Drake'),(32491, 110, 8522.47, -1551.4, 1013.16, 0, 'Time-Lost Proto Drake'),(32491, 111, 8545, -1567.2, 1008.45, 0, 'Time-Lost Proto Drake'),(32491, 112, 8577.06, -1600.74, 1004.32, 0, 'Time-Lost Proto Drake'),(32491, 113, 8603.9, -1623.21, 1003.84, 0, 'Time-Lost Proto Drake'),(32491, 114, 8655.25, -1663.61, 1003.85, 0, 'Time-Lost Proto Drake'),(32491, 115, 8685.18, -1681.71, 1002.99, 0, 'Time-Lost Proto Drake'),(32491, 116, 8738.88, -1704.03, 1000.54, 0, 'Time-Lost Proto Drake'),(32491, 117, 8772.4, -1714.07, 999.761, 0, 'Time-Lost Proto Drake'),(32491, 118, 8806.42, -1722.27, 1000.34, 0, 'Time-Lost Proto Drake'),(32491, 119, 8879.98, -1731.72, 1005.71, 0, 'Time-Lost Proto Drake'),(32491, 120, 8917.96, -1732.64, 1023.34, 0, 'Time-Lost Proto Drake'),(32491, 121, 8950.7, -1730.39, 1056.4, 0, 'Time-Lost Proto Drake'),(32491, 122, 8999.59, -1714.7, 1094.37, 0, 'Time-Lost Proto Drake'),(32491, 123, 9024.74, -1704.68, 1121.59, 0, 'Time-Lost Proto Drake'),(32491, 124, 9048.7, -1682.13, 1154.6, 0, 'Time-Lost Proto Drake'),(32491, 125, 9067.47, -1659.22, 1184.3, 0, 'Time-Lost Proto Drake'),(32491, 126, 9075.25, -1637.6, 1207.37, 0, 'Time-Lost Proto Drake'),(32491, 127, 9076.85, -1622.84, 1222.22, 0, 'Time-Lost Proto Drake'),(32491, 128, 9078.82, -1581.17, 1218.45, 0, 'Time-Lost Proto Drake'),(32491, 129, 9072.33, -1532.85, 1202.52, 0, 'Time-Lost Proto Drake'),(32491, 130, 9062.77, -1499.62, 1183.33, 0, 'Time-Lost Proto Drake'),(32491, 131, 9053.39, -1476.67, 1167.93, 0, 'Time-Lost Proto Drake'),(32491, 132, 9028.34, -1429.55, 1141.71, 0, 'Time-Lost Proto Drake'),(32491, 133, 9011.75, -1401.13, 1129.83, 0, 'Time-Lost Proto Drake'),(32491, 134, 8994.85, -1372.5, 1118.88, 0, 'Time-Lost Proto Drake'),(32491, 135, 8962.01, -1313.04, 1102.53, 0, 'Time-Lost Proto Drake'),(32491, 136, 8948.24, -1281.31, 1097.32, 0, 'Time-Lost Proto Drake'),(32491, 137, 8936.49, -1248.62, 1093.09, 0, 'Time-Lost Proto Drake'),(32491, 138, 8913.79, -1182.92, 1084.87, 0, 'Time-Lost Proto Drake'),(32491, 139, 8902.18, -1150.22, 1080.41, 0, 'Time-Lost Proto Drake'),(32491, 140, 8889.3, -1118.25, 1074.38, 0, 'Time-Lost Proto Drake'),(32491, 141, 8862.23, -1056.13, 1056.99, 0, 'Time-Lost Proto Drake'),(32491, 142, 8846.6, -1025.66, 1049.8, 0, 'Time-Lost Proto Drake'),(32491, 143, 8832.04, -994.597, 1042.85, 0, 'Time-Lost Proto Drake'),(32491, 144, 8808.22, -929.769, 1031.76, 0, 'Time-Lost Proto Drake'),(32491, 145, 8799.17, -896.237, 1027.53, 0, 'Time-Lost Proto Drake'),
(32491, 146, 8795.93, -869.827, 1024.97, 0, 'Time-Lost Proto Drake'),(32491, 147, 8793.27, -810.831, 1018.03, 0, 'Time-Lost Proto Drake'),(32491, 148, 8792.2, -785.868, 1012.41, 0, 'Time-Lost Proto Drake'),(32491, 149, 8782.54, -753.128, 1004.89, 0, 'Time-Lost Proto Drake'),(32491, 150, 8767.08, -722.565, 997.761, 0, 'Time-Lost Proto Drake'),(32491, 151, 8743.71, -658.167, 983.47, 0, 'Time-Lost Proto Drake'),(32491, 152, 8733.54, -625.462, 976.253, 0, 'Time-Lost Proto Drake'),(32491, 153, 8723.05, -592.93, 968.746, 0, 'Time-Lost Proto Drake'),(32491, 154, 8697.28, -529.857, 952.84, 0, 'Time-Lost Proto Drake'),(32491, 155, 8682.73, -499.347, 943.767, 0, 'Time-Lost Proto Drake'),(32491, 156, 8653.6, -439.174, 923.017, 0, 'Time-Lost Proto Drake'),(32491, 157, 8639.05, -409.12, 912.521, 0, 'Time-Lost Proto Drake'),(32491, 158, 8624.51, -379.066, 902.025, 0, 'Time-Lost Proto Drake'),(32491, 159, 8608.5, -349.7, 891.822, 0, 'Time-Lost Proto Drake'),(32491, 160, 8572.81, -292.825, 872.099, 0, 'Time-Lost Proto Drake'),(32491, 161, 8554.54, -268.499, 863.999, 0, 'Time-Lost Proto Drake'),(32491, 162, 8531.45, -244.556, 858.056, 0, 'Time-Lost Proto Drake'),(32491, 163, 8477.71, -199.896, 855.64, 0, 'Time-Lost Proto Drake'),(32491, 164, 8449.4, -179.482, 857.801, 0, 'Time-Lost Proto Drake'),(32491, 165, 8427.67, -165.955, 859.929, 0, 'Time-Lost Proto Drake'),(32491, 166, 8369.57, -142.067, 865.151, 0, 'Time-Lost Proto Drake'),(32491, 167, 8348.22, -136.499, 866.709, 0, 'Time-Lost Proto Drake'),(32491, 168, 8313.35, -135.584, 869.417, 0, 'Time-Lost Proto Drake'),(32491, 169, 8278.73, -134.74, 874.497, 0, 'Time-Lost Proto Drake'),(32491, 170, 8209.42, -132.09, 883.875, 0, 'Time-Lost Proto Drake'),(32491, 171, 8174.65, -130.431, 887.523, 0, 'Time-Lost Proto Drake'),(32491, 172, 8104.91, -131.052, 892.869, 0, 'Time-Lost Proto Drake'),(32491, 173, 8070.09, -133.489, 895.493, 0, 'Time-Lost Proto Drake'),(32491, 174, 8035.28, -135.939, 898.111, 0, 'Time-Lost Proto Drake'),(32491, 175, 7965.84, -143.094, 902.994, 0, 'Time-Lost Proto Drake'),(32491, 176, 7931.29, -147.699, 905.219, 0, 'Time-Lost Proto Drake'),(32491, 177, 7896.3, -147.547, 904.642, 0, 'Time-Lost Proto Drake'),(32491, 178, 7826.39, -146.512, 907.85, 0, 'Time-Lost Proto Drake'),(32491, 179, 7772.03, -139.953, 909.213, 0, 'Time-Lost Proto Drake'),(32491, 180, 7772.03, -139.953, 909.213, 0, 'Time-Lost Proto Drake'),(32491, 181, 7728.76, -130.667, 908.239, 0, 'Time-Lost Proto Drake'),(32491, 182, 7695.23, -122.319, 902.674, 0, 'Time-Lost Proto Drake'),(32491, 183, 7629.16, -105.502, 886.836, 0, 'Time-Lost Proto Drake'),
(32491, 184, 7596.14, -96.7168, 879.261, 0, 'Time-Lost Proto Drake'),(32491, 185, 7529.33, -82.0064, 864.78, 0, 'Time-Lost Proto Drake'),(32491, 186, 7494.9, -80.22, 858.805, 0, 'Time-Lost Proto Drake'),(32491, 187, 7425.43, -77.6433, 850.66, 0, 'Time-Lost Proto Drake'),(32491, 188, 7390.73, -78.7655, 846.404, 0, 'Time-Lost Proto Drake'),(32491, 189, 7342.27, -83.238, 840.942, 0, 'Time-Lost Proto Drake'),(32491, 190, 7308.4, -90.8958, 836.61, 0, 'Time-Lost Proto Drake'),(32491, 191, 7253.25, -107.745, 828.38, 0, 'Time-Lost Proto Drake'),(32491, 192, 7232.12, -117.173, 825.155, 0, 'Time-Lost Proto Drake'),(32491, 193, 7176.59, -153.975, 814.159, 0, 'Time-Lost Proto Drake'),(32491, 194, 7150.97, -177.367, 810.07, 0, 'Time-Lost Proto Drake'),(32491, 195, 7123.4, -216.146, 805.89, 0, 'Time-Lost Proto Drake'),(32491, 196, 7101.72, -259.97, 803.219, 0, 'Time-Lost Proto Drake'),(32491, 197, 7082.95, -317.595, 800.905, 0, 'Time-Lost Proto Drake'),(32491, 198, 7075.51, -351.755, 799.406, 0, 'Time-Lost Proto Drake'),(32491, 199, 7069.6, -413.003, 793.554, 0, 'Time-Lost Proto Drake'),(32491, 200, 7068.98, -447.804, 789.901, 0, 'Time-Lost Proto Drake'),(32491, 201, 7068.57, -494.162, 785.175, 0, 'Time-Lost Proto Drake'),(32491, 202, 7068.36, -563.799, 791.483, 0, 'Time-Lost Proto Drake'),(32491, 203, 7068.01, -617.454, 808.734, 0, 'Time-Lost Proto Drake'),(32491, 204, 7067.76, -637.643, 814.463, 0, 'Time-Lost Proto Drake'),(32491, 205, 7069.87, -673.033, 849.952, 0, 'Time-Lost Proto Drake'),(32491, 206, 7081.9, -709.672, 888.708, 0, 'Time-Lost Proto Drake'),(32491, 207, 7097.87, -727.207, 912.664, 0, 'Time-Lost Proto Drake'),(32491, 208, 7145.52, -761.609, 931.197, 0, 'Time-Lost Proto Drake'),(32491, 209, 7206.59, -787.404, 953.443, 0, 'Time-Lost Proto Drake'),(32491, 210, 7252.08, -808.621, 963.589, 0, 'Time-Lost Proto Drake'),(32491, 211, 7306.65, -820.093, 967.219, 0, 'Time-Lost Proto Drake'),(32491, 212, 7341.28, -824.97, 968.431, 0, 'Time-Lost Proto Drake'),(32491, 213, 7365.61, -827.774, 969.115, 0, 'Time-Lost Proto Drake'),(32491, 214, 7432.66, -847.542, 971.844, 0, 'Time-Lost Proto Drake'),(32491, 215, 7483.96, -862.629, 971.884, 0, 'Time-Lost Proto Drake'),(32491, 216, 7546.67, -893.277, 966.946, 0, 'Time-Lost Proto Drake'),(32491, 217, 7579.26, -913.575, 966.051, 0, 'Time-Lost Proto Drake'),(32491, 218, 7624.09, -966.939, 964.482, 0, 'Time-Lost Proto Drake'),(32491, 219, 7644.32, -1008.79, 962.966, 0, 'Time-Lost Proto Drake'),(32491, 220, 7650.79, -1051.31, 962.587, 0, 'Time-Lost Proto Drake'),
(32491, 221, 7640.22, -1109.61, 962.742, 0, 'Time-Lost Proto Drake'),(32491, 222, 7620.77, -1142.49, 960.763, 0, 'Time-Lost Proto Drake'),(32491, 223, 7592.68, -1169.73, 955.48, 0, 'Time-Lost Proto Drake'),(32491, 224, 7533.76, -1196.64, 948.685, 0, 'Time-Lost Proto Drake'),(32491, 225, 7488.92, -1202.66, 946.976, 0, 'Time-Lost Proto Drake'),(32491, 226, 7436.2, -1189.74, 946.755, 0, 'Time-Lost Proto Drake'),(32491, 227, 7395.15, -1161.05, 949.099, 0, 'Time-Lost Proto Drake'),(32491, 228, 7345, -1132.69, 954.872, 0, 'Time-Lost Proto Drake'),(32491, 229, 7345, -1132.69, 954.872, 0, 'Time-Lost Proto Drake'),(32491, 230, 7312.13, -1121.95, 960.181, 0, 'Time-Lost Proto Drake'),(32491, 231, 7253.76, -1103.48, 968.416, 0, 'Time-Lost Proto Drake'),(32491, 232, 7220.32, -1093.17, 968.69, 0, 'Time-Lost Proto Drake'),(32491, 233, 7186.87, -1082.86, 968.922, 0, 'Time-Lost Proto Drake'),(32491, 234, 7129.22, -1069.26, 964.391, 0, 'Time-Lost Proto Drake'),(32491, 235, 7090.34, -1063.23, 953.779, 0, 'Time-Lost Proto Drake'),(32491, 236, 7039.43, -1056.37, 928.862, 0, 'Time-Lost Proto Drake'),(32491, 237, 6999.57, -1035.32, 914.206, 0, 'Time-Lost Proto Drake'),(32491, 238, 6975.34, -1012.23, 909.603, 0, 'Time-Lost Proto Drake'),(32491, 239, 6940.44, -973.208, 911.185, 0, 'Time-Lost Proto Drake'),(32491, 240, 6922.11, -949.331, 915.136, 0, 'Time-Lost Proto Drake'),(32491, 241, 6904.15, -915.959, 921.478, 0, 'Time-Lost Proto Drake'),(32491, 242, 6893.51, -878.273, 927.01, 0, 'Time-Lost Proto Drake'),(32491, 243, 6895.81, -846.935, 911.615, 0, 'Time-Lost Proto Drake'),(32491, 244, 6902.51, -824.385, 890.863, 0, 'Time-Lost Proto Drake'),(32491, 245, 6913.04, -807.751, 872.785, 0, 'Time-Lost Proto Drake'),(32491, 246, 6951.24, -775.899, 840.297, 0, 'Time-Lost Proto Drake'),(32491, 247, 6975.51, -757.919, 822.626, 0, 'Time-Lost Proto Drake'),(32491, 248, 7018.21, -726.356, 801.611, 0, 'Time-Lost Proto Drake'),(32491, 249, 7054.51, -685.125, 787.627, 0, 'Time-Lost Proto Drake'),(32491, 250, 7071.25, -634.145, 778.284, 0, 'Time-Lost Proto Drake'),(32491, 251, 7072.41, -586.475, 775.93, 0, 'Time-Lost Proto Drake'),(32491, 252, 7071.22, -546.849, 774.473, 0, 'Time-Lost Proto Drake'),(32491, 253, 7070.4, -531.264, 769.844, 0, 'Time-Lost Proto Drake'),(32491, 254, 7067.16, -492.006, 755.897, 0, 'Time-Lost Proto Drake'),(32491, 255, 7064.75, -471.435, 758.728, 0, 'Time-Lost Proto Drake'),(32491, 256, 7063.02, -453.184, 766.105, 0, 'Time-Lost Proto Drake'),(32491, 257, 7062.67, -447.275, 769.832, 0, 'Time-Lost Proto Drake'),(32491, 258, 7062.24, -433.591, 780.834, 0, 'Time-Lost Proto Drake'),
(32491, 259, 7062.15, -425.009, 788.667, 0, 'Time-Lost Proto Drake'),(32491, 260, 7062.15, -425.009, 788.667, 0, 'Time-Lost Proto Drake'),(32491, 261, 7074.06, -366.064, 795.88, 0, 'Time-Lost Proto Drake'),(32491, 262, 7080.88, -322.35, 794.68, 0, 'Time-Lost Proto Drake');

DELETE FROM smart_scripts WHERE entryorguid IN(32630, 32491) AND source_type=0;

UPDATE `command` SET `help`='Syntax: .cooldown [#spell_id]\r\n\r\nRemove all (if spell_id not provided) or #spel_id spell cooldown from selected character or their pet or you (if no selection).' WHERE `name`='cooldown';

--
UPDATE `creature_template` SET `InhabitType`=`InhabitType`|8 WHERE `entry` IN (1921, 2674, 5674, 8035, 16236, 16400, 16897, 20251, 20561, 21322, 21413, 14697, 18679, 18695, 23076, 23077, 23876, 23996, 24210, 25284, 25534, 27064, 27430, 27894, 28156, 28366, 29475, 29483, 29613, 29747, 29790, 30236, 30475, 31103, 31280, 31424, 32347, 32795, 32938, 33174, 33184, 33229, 33243, 33272, 33342, 33352, 33353, 33651, 34047, 34050, 34068, 34071, 34096, 34108, 34110, 34121, 34149, 34362, 34363);


-- Roar of Sacrifice
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_hun_roar_of_sacrifice';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(53480, 'spell_hun_roar_of_sacrifice');



-- Breaking Through - [H] http://www.wowhead.com/quest=11898/breaking-through

DELETE FROM gameobject WHERE guid=5747 AND id=194026;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
    (5747, 194026, 571, 0, 0, 1, 1, 3739.84, 3567.09, 341.57, 0.00, 0, 0, 0, 1, 300, 100, 0, 0);

DELETE FROM areatrigger_scripts WHERE entry=5339 AND ScriptName='at_last_rites';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`)
VALUES
    (5339, 'at_last_rites');



-- Just Following Orders - [A][H] http://www.wowhead.com/quest=12540/just-following-orders

DELETE FROM smart_scripts WHERE entryorguid IN(28217, 2821700, 2821701) and source_type IN(0, 9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (28217, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 11, 51329, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Cast Feign Death'),
    (28217, 0, 1, 14, 61, 0, 100, 0, 0, 0, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Set NPC Flags (Gossip Only)'),
    (28217, 0, 2, 3, 62, 0, 100, 0, 9677, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Say Line 1'),
    (28217, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 28, 51329, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Remove Aura - Feign Death'),
    (28217, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Remove Aura - Set NPC Flags - Quest + Gossip'),
    (28217, 0, 5, 15, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Close Gossip'),
    (28217, 0, 6, 0, 62, 0, 100, 0, 9677, 0, 0, 0, 85, 51382, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Invoker Cast Forcecast Summon Huge Crocolisk'),
    (28217, 0, 7, 0, 64, 0, 100, 0, 0, 0, 0, 0, 98, 9684, 13124, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Hello - Send Gossip Menu'),
    (28217, 0, 8, 10, 62, 0, 100, 0, 9684, 0, 0, 0, 2, 774, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Set Faction (Alliance)'),
    (28217, 0, 9, 10, 62, 0, 100, 0, 9684, 0, 0, 0, 2, 775, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Set Faction (Horde)'),
    (28217, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Store Targetlist'),
    (28217, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2821700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Option Select - Run Script'),
    (28217, 0, 12, 0, 19, 0, 100, 0, 12570, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On On Quest Accept - Fortunate Misunderstandings - Say Line 2'),
    (28217, 0, 13, 0, 40, 0, 100, 0, 64, 28217, 0, 0, 80, 2821701, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Reached WP80 - Run Script'),
    (28217, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 58806, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Spawn - Add Aura Permanent Feign Death'),
    (28217, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 58806, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - On Gossip Select - Remove Aura Permanent Feign Death');

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2821700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Set NPC Flags'),
    (2821700, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Say Line 3'),
    (2821700, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 53, 1, 28217, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script - Start WP');

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2821701, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Say Line 4'),
    (2821701, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 51448, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Cast Oracle Intro Quest Complete'),
    (2821701, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Say Line 5'),
    (2821701, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 52100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Cast Summon Frenyheart Tracker'),
    (2821701, 9, 4, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Rainspeaker Oracle - Script 2 - Despawn');

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(1, 15) AND SourceGroup=9677 AND SourceEntry IN(0, 11446);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (1, 9677, 11446, 0, 0, 8, 0, 4242, 0, 0, 0, 0, 0, '', NULL),
    (15, 9677, 0, 0, 0, 28, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings complete'),
    (15, 9677, 0, 0, 0, 8, 0, 12570, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Player does not have Fortunate Misunderstandings rewarded'),    
    (15, 9677, 0, 0, 0, 29, 1, 28325, 50, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if not crocodile is near'),
    (15, 9677, 0, 0, 0, 9, 0, 12540, 0, 0, 0, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Just following orders taken'),
    (15, 9677, 0, 0, 0, 8, 0, 12540, 0, 0, 1, 0, 0, '', 'Injured Rainspeaker Oracle only display gossip if Just following orders not rewarded');



-- Everything Must Be Ready - [A] http://www.wowhead.com/quest=11406/everything-must-be-ready

UPDATE quest_template_addon SET PrevQuestID=11332 WHERE ID=11406;

SET @TEROKK := 21838;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=41004;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (17, 0, 41004, 0, 0, 29, 0, @TEROKK, 100, 0, 1, 0, 0, '', 'Cant Summon Terokk if another Terokk is summoned within 100yds.');    




-- --------------------------
-- Ahn'Kahet, Azjol'Nerub
-- --------------------------
-- Ahn'kahar Slasher (30277, 31442)
UPDATE creature_template SET lootid=30277 WHERE entry IN(30277, 31442);
DELETE FROM creature_loot_template WHERE entry=31442;
REPLACE INTO creature_loot_template VALUES(30277, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30277, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30277, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ahn'kahar Spell Flinger (30278, 31443)
UPDATE creature_template SET lootid=30278 WHERE entry IN(30278, 31443);
DELETE FROM creature_loot_template WHERE entry=31443;
REPLACE INTO creature_loot_template VALUES(30278, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30278, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30278, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ahn'kahar Web Winder (30276, 31450)
UPDATE creature_template SET lootid=30276 WHERE entry IN(30276, 31450);
DELETE FROM creature_loot_template WHERE entry=31450;
REPLACE INTO creature_loot_template VALUES(30276, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30276, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30276, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Anub'ar Prime Guard (29128, 31604)
UPDATE creature_template SET lootid=29128 WHERE entry IN(29128, 31604);
DELETE FROM creature_loot_template WHERE entry=31604;
REPLACE INTO creature_loot_template VALUES(29128, 37243, 37243, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29128, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29128, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29128, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Anub'ar Skirmisher (28734, 31606)
UPDATE creature_template SET lootid=28734 WHERE entry IN(28734, 31606);
DELETE FROM creature_loot_template WHERE entry=31606;
REPLACE INTO creature_loot_template VALUES(28734, 37243, 37243, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28734, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28734, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28734, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Anub'ar Warrior (28732, 31608)
UPDATE creature_template SET lootid=28732 WHERE entry IN(28732, 31608);
DELETE FROM creature_loot_template WHERE entry=31608;
REPLACE INTO creature_loot_template VALUES(28732, 37243, 37243, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28732, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28732, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28732, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Anub'ar Webspinner (29335, 31609)
UPDATE creature_template SET lootid=29335 WHERE entry IN(29335, 31609);
DELETE FROM creature_loot_template WHERE entry=31609;
REPLACE INTO creature_loot_template VALUES(29335, 37243, 37243, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29335, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29335, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29335, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Anub'ar Shadowcaster (28733, 31605)
UPDATE creature_template SET lootid=28733 WHERE entry IN(28733, 31605);
DELETE FROM creature_loot_template WHERE entry=31605;
REPLACE INTO creature_loot_template VALUES(28733, 37243, 37243, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28733, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28733, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28733, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Bonegrinder (30284, 31451)
UPDATE creature_template SET lootid=30284 WHERE entry IN(30284, 31451);
DELETE FROM creature_loot_template WHERE entry=31451;
REPLACE INTO creature_loot_template VALUES(30284, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30284, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30284, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Deep Crawler (30279, 31455)
UPDATE creature_template SET lootid=30279 WHERE entry IN(30279, 31455);
DELETE FROM creature_loot_template WHERE entry=31455;
REPLACE INTO creature_loot_template VALUES(30279, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30279, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30279, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Eye of Taldaram (30285, 31457)
UPDATE creature_template SET lootid=30285 WHERE entry IN(30285, 31457);
DELETE FROM creature_loot_template WHERE entry=31457;
REPLACE INTO creature_loot_template VALUES(30285, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30285, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30285, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Forgotten One (30414, 31459)
UPDATE creature_template SET lootid=30414 WHERE entry IN(30414, 31459);
DELETE FROM creature_loot_template WHERE entry=31459;
REPLACE INTO creature_loot_template VALUES(30414, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30414, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30414, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Frostbringer (30286, 31460)
UPDATE creature_template SET lootid=30286 WHERE entry IN(30286, 31460);
DELETE FROM creature_loot_template WHERE entry=31460;
REPLACE INTO creature_loot_template VALUES(30286, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30286, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30286, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Plague Walker (30283, 31466)
UPDATE creature_template SET lootid=30283 WHERE entry IN(30283, 31466);
DELETE FROM creature_loot_template WHERE entry=31466;
REPLACE INTO creature_loot_template VALUES(30283, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30283, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30283, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Plundering Geist (30287, 31468)
UPDATE creature_template SET lootid=30287 WHERE entry IN(30287, 31468);
DELETE FROM creature_loot_template WHERE entry=31468;
REPLACE INTO creature_loot_template VALUES(30287, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30287, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30287, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Savage Cave Beast (30329, 31470)
UPDATE creature_template SET lootid=30329 WHERE entry IN(30329, 31470);
DELETE FROM creature_loot_template WHERE entry=31470;
REPLACE INTO creature_loot_template VALUES(30329, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30329, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30329, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Twilight Apostle (30179, 31471)
UPDATE creature_template SET lootid=30179 WHERE entry IN(30179, 31471);
DELETE FROM creature_loot_template WHERE entry=31471;
REPLACE INTO creature_loot_template VALUES(30179, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30179, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30179, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Twilight Darkcaster (30319, 31472)
UPDATE creature_template SET lootid=30319 WHERE entry IN(30319, 31472);
DELETE FROM creature_loot_template WHERE entry=31472;
REPLACE INTO creature_loot_template VALUES(30319, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30319, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30319, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Twilight Worshipper (30111, 31475)
UPDATE creature_template SET lootid=30111 WHERE entry IN(30111, 31475);
DELETE FROM creature_loot_template WHERE entry=31475;
REPLACE INTO creature_loot_template VALUES(30111, 37624, 37624, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30111, 37625, 37625, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30111, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Drak'Tharon Keep
-- --------------------------
-- Darkweb Recluse (26625, 31336)
UPDATE creature_template SET lootid=26625 WHERE entry IN(26625, 31336);
DELETE FROM creature_loot_template WHERE entry=31336;
REPLACE INTO creature_loot_template VALUES(26625, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26625, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26625, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);

-- Drakkari Bat (26622, 31337)
UPDATE creature_template SET lootid=26622 WHERE entry IN(26622, 31337);
DELETE FROM creature_loot_template WHERE entry=31337;
REPLACE INTO creature_loot_template VALUES(26622, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26622, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26622, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26622, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Commander (27431, 31338)
UPDATE creature_template SET lootid=27431 WHERE entry IN(27431, 31338);
DELETE FROM creature_loot_template WHERE entry=31338;
REPLACE INTO creature_loot_template VALUES(27431, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27431, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27431, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27431, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Guardian (26620, 31339)
UPDATE creature_template SET lootid=26620 WHERE entry IN(26620, 31339);
DELETE FROM creature_loot_template WHERE entry=31339;
REPLACE INTO creature_loot_template VALUES(26620, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26620, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26620, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26620, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Gutripper (26641, 31340)
UPDATE creature_template SET lootid=26641 WHERE entry IN(26641, 31340);
DELETE FROM creature_loot_template WHERE entry=31340;
REPLACE INTO creature_loot_template VALUES(26641, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26641, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26641, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26641, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Scytheclaw (26628, 31343)
UPDATE creature_template SET lootid=26628 WHERE entry IN(26628, 31343);
DELETE FROM creature_loot_template WHERE entry=31343;
REPLACE INTO creature_loot_template VALUES(26628, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26628, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26628, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26628, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Shaman (26639, 31345)
UPDATE creature_template SET lootid=26639 WHERE entry IN(26639, 31345);
DELETE FROM creature_loot_template WHERE entry=31345;
REPLACE INTO creature_loot_template VALUES(26639, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26639, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26639, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26639, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Flesheating Ghoul (27871, 31346)
UPDATE creature_template SET lootid=27871 WHERE entry IN(27871, 31346);
DELETE FROM creature_loot_template WHERE entry=31346;
REPLACE INTO creature_loot_template VALUES(27871, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27871, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27871, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27871, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ghoul Tormentor (26621, 31347)
UPDATE creature_template SET lootid=26621 WHERE entry IN(26621, 31347);
DELETE FROM creature_loot_template WHERE entry=31347;
REPLACE INTO creature_loot_template VALUES(26621, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26621, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26621, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26621, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Risen Drakkari Bat Rider (26638, 31351)
UPDATE creature_template SET lootid=26638 WHERE entry IN(26638, 31351);
DELETE FROM creature_loot_template WHERE entry=31351;
REPLACE INTO creature_loot_template VALUES(26638, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26638, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26638, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26638, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Risen Drakkari Death Knight (26830, 31352)
UPDATE creature_template SET lootid=26830 WHERE entry IN(26830, 31352);
DELETE FROM creature_loot_template WHERE entry=31352;
REPLACE INTO creature_loot_template VALUES(26830, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26830, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26830, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26830, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Risen Drakkari Handler (26637, 31342)
UPDATE creature_template SET lootid=26637 WHERE entry IN(26637, 31342);
DELETE FROM creature_loot_template WHERE entry=31342;
REPLACE INTO creature_loot_template VALUES(26637, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26637, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26637, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26637, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Risen Drakkari Soulmage (26636, 31354)
UPDATE creature_template SET lootid=26636 WHERE entry IN(26636, 31354);
DELETE FROM creature_loot_template WHERE entry=31354;
REPLACE INTO creature_loot_template VALUES(26636, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26636, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26636, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26636, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Risen Drakkari Warrior (26635, 31355)
UPDATE creature_template SET lootid=26635 WHERE entry IN(26635, 31355);
DELETE FROM creature_loot_template WHERE entry=31355;
REPLACE INTO creature_loot_template VALUES(26635, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26635, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26635, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26635, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Scourge Brute (26623, 31357)
UPDATE creature_template SET lootid=26623 WHERE entry IN(26623, 31357);
DELETE FROM creature_loot_template WHERE entry=31357;
REPLACE INTO creature_loot_template VALUES(26623, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26623, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26623, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26623, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Scourge Reanimator (26626, 31359)
UPDATE creature_template SET lootid=26626 WHERE entry IN(26626, 31359);
DELETE FROM creature_loot_template WHERE entry=31359;
REPLACE INTO creature_loot_template VALUES(26626, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26626, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26626, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);

-- Wretched Belcher (26624, 31363)
UPDATE creature_template SET lootid=26624 WHERE entry IN(26624, 31363);
DELETE FROM creature_loot_template WHERE entry=31363;
REPLACE INTO creature_loot_template VALUES(26624, 37799, 37799, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26624, 37800, 37800, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26624, 37801, 37801, 0.1, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Gundrak
-- --------------------------
-- Drakkari Battle Rider (29836, 30925)
UPDATE creature_template SET lootid=29836 WHERE entry IN(29836, 30925);
DELETE FROM creature_loot_template WHERE entry=30925;
REPLACE INTO creature_loot_template VALUES(29836, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29836, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29836, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29836, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Earthshaker (29829, 30926)
UPDATE creature_template SET lootid=29829 WHERE entry IN(29829, 30926);
DELETE FROM creature_loot_template WHERE entry=30926;
REPLACE INTO creature_loot_template VALUES(29829, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29829, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29829, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29829, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Fire Weaver (29822, 30927)
UPDATE creature_template SET lootid=29822 WHERE entry IN(29822, 30927);
DELETE FROM creature_loot_template WHERE entry=30927;
REPLACE INTO creature_loot_template VALUES(29822, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29822, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29822, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29822, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Frenzy (29834, 30928)
UPDATE creature_template SET lootid=29834 WHERE entry IN(29834, 30928);
DELETE FROM creature_loot_template WHERE entry=30928;

-- Drakkari God Hunter (29820, 30929)
UPDATE creature_template SET lootid=29820 WHERE entry IN(29820, 30929);
DELETE FROM creature_loot_template WHERE entry=30929;
REPLACE INTO creature_loot_template VALUES(29820, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29820, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29820, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29820, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Golem (29832, 30930)
UPDATE creature_template SET lootid=29832 WHERE entry IN(29832, 30930);
DELETE FROM creature_loot_template WHERE entry=30930;
REPLACE INTO creature_loot_template VALUES(29832, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29832, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29832, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29832, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Inciter (29874, 30931)
UPDATE creature_template SET lootid=29874 WHERE entry IN(29874, 30931);
DELETE FROM creature_loot_template WHERE entry=30931;
REPLACE INTO creature_loot_template VALUES(29874, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29874, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29874, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29874, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Lancer (29819, 30932)
UPDATE creature_template SET lootid=29819 WHERE entry IN(29819, 30932);
DELETE FROM creature_loot_template WHERE entry=30932;
REPLACE INTO creature_loot_template VALUES(29819, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29819, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29819, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29819, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Medicine Man (29826, 30933)
UPDATE creature_template SET lootid=29826 WHERE entry IN(29826, 30933);
DELETE FROM creature_loot_template WHERE entry=30933;
REPLACE INTO creature_loot_template VALUES(29826, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29826, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29826, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29826, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Rhino (29838, 30935)
UPDATE creature_template SET lootid=29838 WHERE entry IN(29838, 30935);
DELETE FROM creature_loot_template WHERE entry=30935;
REPLACE INTO creature_loot_template VALUES(29838, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29838, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29838, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29838, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Drakkari Rhino (29931, 30936)
UPDATE creature_template SET lootid=29931 WHERE entry IN(29931, 30936);
DELETE FROM creature_loot_template WHERE entry=30936;
REPLACE INTO creature_loot_template VALUES(29931, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29931, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29931, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29931, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Living Mojo (29830, 30938)
UPDATE creature_template SET lootid=29830 WHERE entry IN(29830, 30938);
DELETE FROM creature_loot_template WHERE entry=30938;
REPLACE INTO creature_loot_template VALUES(29830, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29830, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29830, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29830, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ruins Dweller (29920, 30939)
UPDATE creature_template SET lootid=29920 WHERE entry IN(29920, 30939);
DELETE FROM creature_loot_template WHERE entry=30939;
REPLACE INTO creature_loot_template VALUES(29920, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29920, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29920, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29920, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Spitting Cobra (29774, 30941)
UPDATE creature_template SET lootid=29774 WHERE entry IN(29774, 30941);
DELETE FROM creature_loot_template WHERE entry=30941;
REPLACE INTO creature_loot_template VALUES(29774, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29774, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29774, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29774, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Unyielding Constrictor (29768, 30942)
UPDATE creature_template SET lootid=29768 WHERE entry IN(29768, 30942);
DELETE FROM creature_loot_template WHERE entry=30942;
REPLACE INTO creature_loot_template VALUES(29768, 37646, 37646, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29768, 37647, 37647, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29768, 37648, 37648, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(29768, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Halls of Lightning
-- --------------------------
-- Blistering Steamrager (28583, 30964)
UPDATE creature_template SET lootid=28583 WHERE entry IN(28583, 30964);
DELETE FROM creature_loot_template WHERE entry=30964;
REPLACE INTO creature_loot_template VALUES(28583, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28583, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28583, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28583, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Hardened Steel Berserker (28579, 30966)
UPDATE creature_template SET lootid=28579 WHERE entry IN(28579, 30966);
DELETE FROM creature_loot_template WHERE entry=30966;
REPLACE INTO creature_loot_template VALUES(28579, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28579, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28579, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28579, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Hardened Steel Reaver (28578, 30967)
UPDATE creature_template SET lootid=28578 WHERE entry IN(28578, 30967);
DELETE FROM creature_loot_template WHERE entry=30967;
REPLACE INTO creature_loot_template VALUES(28578, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28578, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28578, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28578, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Hardened Steel Skycaller (28580, 30968)
UPDATE creature_template SET lootid=28580 WHERE entry IN(28580, 30968);
DELETE FROM creature_loot_template WHERE entry=30968;
REPLACE INTO creature_loot_template VALUES(28580, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28580, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28580, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28580, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Stormforged Construct (28835, 30971)
UPDATE creature_template SET lootid=28835 WHERE entry IN(28835, 30971);
DELETE FROM creature_loot_template WHERE entry=30971;
REPLACE INTO creature_loot_template VALUES(28835, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28835, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28835, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28835, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Stormforged Giant (28920, 30972)
UPDATE creature_template SET lootid=28920 WHERE entry IN(28920, 30972);
DELETE FROM creature_loot_template WHERE entry=30972;
REPLACE INTO creature_loot_template VALUES(28920, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28920, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28920, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28920, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Stormforged Mender (28582, 30974)
UPDATE creature_template SET lootid=28582 WHERE entry IN(28582, 30974);
DELETE FROM creature_loot_template WHERE entry=30974;
REPLACE INTO creature_loot_template VALUES(28582, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28582, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28582, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28582, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Stormforged Runeshaper (28836, 30975)
UPDATE creature_template SET lootid=28836 WHERE entry IN(28836, 30975);
DELETE FROM creature_loot_template WHERE entry=30975;
REPLACE INTO creature_loot_template VALUES(28836, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28836, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28836, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28836, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Stormforged Sentinel (28837, 30976)
UPDATE creature_template SET lootid=28837 WHERE entry IN(28837, 30976);
DELETE FROM creature_loot_template WHERE entry=30976;
REPLACE INTO creature_loot_template VALUES(28837, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28837, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28837, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28837, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Stormforged Tactician (28581, 30977)
UPDATE creature_template SET lootid=28581 WHERE entry IN(28581, 30977);
DELETE FROM creature_loot_template WHERE entry=30977;
REPLACE INTO creature_loot_template VALUES(28581, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28581, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28581, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28581, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Stormfury Revenant (28826, 30978)
UPDATE creature_template SET lootid=28826 WHERE entry IN(28826, 30978);
DELETE FROM creature_loot_template WHERE entry=30978;
REPLACE INTO creature_loot_template VALUES(28826, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28826, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28826, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28826, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Storming Vortex (28547, 30979)
UPDATE creature_template SET lootid=28547 WHERE entry IN(28547, 30979);
DELETE FROM creature_loot_template WHERE entry=30979;
REPLACE INTO creature_loot_template VALUES(28547, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28547, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28547, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28547, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Titanium Siegebreaker (28961, 30980)
UPDATE creature_template SET lootid=28961 WHERE entry IN(28961, 30980);
DELETE FROM creature_loot_template WHERE entry=30980;
REPLACE INTO creature_loot_template VALUES(28961, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28961, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28961, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28961, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Titanium Thunderer (28965, 30982)
UPDATE creature_template SET lootid=28965 WHERE entry IN(28965, 30982);
DELETE FROM creature_loot_template WHERE entry=30982;
REPLACE INTO creature_loot_template VALUES(28965, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28965, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28965, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28965, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Titanium Vanguard (28838, 30981)
UPDATE creature_template SET lootid=28838 WHERE entry IN(28838, 30981);
DELETE FROM creature_loot_template WHERE entry=30981;
REPLACE INTO creature_loot_template VALUES(28838, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28838, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28838, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28838, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Unbound Firestorm (28584, 30983)
UPDATE creature_template SET lootid=28584 WHERE entry IN(28584, 30983);
DELETE FROM creature_loot_template WHERE entry=30983;
REPLACE INTO creature_loot_template VALUES(28584, 37856, 37856, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28584, 37857, 37857, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28584, 37858, 37858, 0.1, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Halls of Stone
-- --------------------------
-- Dark Rune Controller (27966, 31371)
UPDATE creature_template SET lootid=27966 WHERE entry IN(27966, 31371);
DELETE FROM creature_loot_template WHERE entry=31371;
REPLACE INTO creature_loot_template VALUES(27966, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27966, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27966, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27966, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dark Rune Elementalist (27962, 31372)
UPDATE creature_template SET lootid=27962 WHERE entry IN(27962, 31372);
DELETE FROM creature_loot_template WHERE entry=31372;
REPLACE INTO creature_loot_template VALUES(27962, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27962, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27962, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27962, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dark Rune Giant (27969, 31373)
UPDATE creature_template SET lootid=27969 WHERE entry IN(27969, 31373);
DELETE FROM creature_loot_template WHERE entry=31373;
REPLACE INTO creature_loot_template VALUES(27969, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27969, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27969, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27969, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dark Rune Scholar (27964, 31374)
UPDATE creature_template SET lootid=27964 WHERE entry IN(27964, 31374);
DELETE FROM creature_loot_template WHERE entry=31374;
REPLACE INTO creature_loot_template VALUES(27964, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27964, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27964, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27964, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dark Rune Shaper (27965, 31375)
UPDATE creature_template SET lootid=27965 WHERE entry IN(27965, 31375);
DELETE FROM creature_loot_template WHERE entry=31375;
REPLACE INTO creature_loot_template VALUES(27965, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27965, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27965, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27965, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dark Rune Theurgist (27963, 31376)
UPDATE creature_template SET lootid=27963 WHERE entry IN(27963, 31376);
DELETE FROM creature_loot_template WHERE entry=31376;
REPLACE INTO creature_loot_template VALUES(27963, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27963, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27963, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27963, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dark Rune Warrior (27960, 31377)
UPDATE creature_template SET lootid=27960 WHERE entry IN(27960, 31377);
DELETE FROM creature_loot_template WHERE entry=31377;
REPLACE INTO creature_loot_template VALUES(27960, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27960, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27960, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27960, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dark Rune Worker (27961, 31378)
UPDATE creature_template SET lootid=27961 WHERE entry IN(27961, 31378);
DELETE FROM creature_loot_template WHERE entry=31378;
REPLACE INTO creature_loot_template VALUES(27961, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27961, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27961, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27961, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Lightning Construct (27972, 31383)
UPDATE creature_template SET lootid=27972 WHERE entry IN(27972, 31383);
DELETE FROM creature_loot_template WHERE entry=31383;
REPLACE INTO creature_loot_template VALUES(27972, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27972, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27972, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27972, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Raging Construct (27970, 31385)
UPDATE creature_template SET lootid=27970 WHERE entry IN(27970, 31385);
DELETE FROM creature_loot_template WHERE entry=31385;
REPLACE INTO creature_loot_template VALUES(27970, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27970, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27970, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27970, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Unrelenting Construct (27971, 31387)
UPDATE creature_template SET lootid=27971 WHERE entry IN(27971, 31387);
DELETE FROM creature_loot_template WHERE entry=31387;
REPLACE INTO creature_loot_template VALUES(27971, 37671, 37671, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27971, 37672, 37672, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27971, 37673, 37673, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27971, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- The Nexus
-- --------------------------
-- Azure Magus (26722, 30457)
UPDATE creature_template SET lootid=26722 WHERE entry IN(26722, 30457);
DELETE FROM creature_loot_template WHERE entry=30457;
REPLACE INTO creature_loot_template VALUES(26722, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26722, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26722, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26722, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Warder (26716, 30459)
UPDATE creature_template SET lootid=26716 WHERE entry IN(26716, 30459);
DELETE FROM creature_loot_template WHERE entry=30459;
REPLACE INTO creature_loot_template VALUES(26716, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26716, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26716, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26716, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Mage Slayer (26730, 30473)
UPDATE creature_template SET lootid=26730 WHERE entry IN(26730, 30473);
DELETE FROM creature_loot_template WHERE entry=30473;
REPLACE INTO creature_loot_template VALUES(26730, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26730, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26730, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26730, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Mage Hunter Ascendant (26727, 30460)
UPDATE creature_template SET lootid=26727 WHERE entry IN(26727, 30460);
DELETE FROM creature_loot_template WHERE entry=30460;
REPLACE INTO creature_loot_template VALUES(26727, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26727, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26727, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26727, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Horde Ranger (26801, 30508)
UPDATE creature_template SET lootid=26801 WHERE entry IN(26801, 30508);
DELETE FROM creature_loot_template WHERE entry=30508;
REPLACE INTO creature_loot_template VALUES(26801, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26801, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26801, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26801, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Horde Berserker (26799, 30495)
UPDATE creature_template SET lootid=26799 WHERE entry IN(26799, 30495);
DELETE FROM creature_loot_template WHERE entry=30495;
REPLACE INTO creature_loot_template VALUES(26799, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26799, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26799, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26799, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Horde Cleric (26803, 30497)
UPDATE creature_template SET lootid=26803 WHERE entry IN(26803, 30497);
DELETE FROM creature_loot_template WHERE entry=30497;
REPLACE INTO creature_loot_template VALUES(26803, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26803, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26803, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26803, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Alliance Ranger (26802, 30509)
UPDATE creature_template SET lootid=26802 WHERE entry IN(26802, 30509);
DELETE FROM creature_loot_template WHERE entry=30509;
REPLACE INTO creature_loot_template VALUES(26802, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26802, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26802, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26802, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Alliance Berserker (26800, 30496)
UPDATE creature_template SET lootid=26800 WHERE entry IN(26800, 30496);
DELETE FROM creature_loot_template WHERE entry=30496;
REPLACE INTO creature_loot_template VALUES(26800, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26800, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26800, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26800, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Alliance Cleric (26805, 30498)
UPDATE creature_template SET lootid=26805 WHERE entry IN(26805, 30498);
DELETE FROM creature_loot_template WHERE entry=30498;
REPLACE INTO creature_loot_template VALUES(26805, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26805, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26805, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26805, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Steward (26729, 30485)
UPDATE creature_template SET lootid=26729 WHERE entry IN(26729, 30485);
DELETE FROM creature_loot_template WHERE entry=30485;
REPLACE INTO creature_loot_template VALUES(26729, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26729, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26729, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26729, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Mage Hunter Initiate (26728, 30478)
UPDATE creature_template SET lootid=26728 WHERE entry IN(26728, 30478);
DELETE FROM creature_loot_template WHERE entry=30478;
REPLACE INTO creature_loot_template VALUES(26728, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26728, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26728, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26728, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Enforcer (26734, 30516)
UPDATE creature_template SET lootid=26734 WHERE entry IN(26734, 30516);
DELETE FROM creature_loot_template WHERE entry=30516;
REPLACE INTO creature_loot_template VALUES(26734, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26734, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26734, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26734, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Scale-Binder (26735, 30517)
UPDATE creature_template SET lootid=26735 WHERE entry IN(26735, 30517);
DELETE FROM creature_loot_template WHERE entry=30517;
REPLACE INTO creature_loot_template VALUES(26735, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26735, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26735, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26735, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Crazed Mana-Surge (26737, 30519)
UPDATE creature_template SET lootid=26737 WHERE entry IN(26737, 30519);
DELETE FROM creature_loot_template WHERE entry=30519;
REPLACE INTO creature_loot_template VALUES(26737, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26737, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26737, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26737, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Crystalline Tender (28231, 30525)
UPDATE creature_template SET lootid=28231 WHERE entry IN(28231, 30525);
DELETE FROM creature_loot_template WHERE entry=30525;
REPLACE INTO creature_loot_template VALUES(28231, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28231, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28231, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28231, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Crystalline Keeper (26782, 30526)
UPDATE creature_template SET lootid=26782 WHERE entry IN(26782, 30526);
DELETE FROM creature_loot_template WHERE entry=30526;
REPLACE INTO creature_loot_template VALUES(26782, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26782, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26782, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26782, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- The Nexus: Oculus
-- --------------------------
-- Azure Inquisitor (27633, 30901)
UPDATE creature_template SET lootid=27633 WHERE entry IN(27633, 30901);
DELETE FROM creature_loot_template WHERE entry=30901;
REPLACE INTO creature_loot_template VALUES(27633, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27633, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27633, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27633, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Ley-Whelp (27636, 30902)
UPDATE creature_template SET lootid=27636 WHERE entry IN(27636, 30902);
DELETE FROM creature_loot_template WHERE entry=30902;
REPLACE INTO creature_loot_template VALUES(27636, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27636, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27636, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27636, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Spellbinder (27635, 30904)
UPDATE creature_template SET lootid=27635 WHERE entry IN(27635, 30904);
DELETE FROM creature_loot_template WHERE entry=30904;
REPLACE INTO creature_loot_template VALUES(27635, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27635, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27635, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27635, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Centrifuge Construct (27641, 30905)
UPDATE creature_template SET lootid=27641 WHERE entry IN(27641, 30905);
DELETE FROM creature_loot_template WHERE entry=30905;
REPLACE INTO creature_loot_template VALUES(27641, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27641, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27641, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27641, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Air (27650, 30906)
UPDATE creature_template SET lootid=27650 WHERE entry IN(27650, 30906);
DELETE FROM creature_loot_template WHERE entry=30906;
REPLACE INTO creature_loot_template VALUES(27650, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27650, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27650, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27650, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Cloudscraper (27645, 30907)
UPDATE creature_template SET lootid=27645 WHERE entry IN(27645, 30907);
DELETE FROM creature_loot_template WHERE entry=30907;
REPLACE INTO creature_loot_template VALUES(27645, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27645, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27645, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27645, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Fire (27651, 30908)
UPDATE creature_template SET lootid=27651 WHERE entry IN(27651, 30908);
DELETE FROM creature_loot_template WHERE entry=30908;
REPLACE INTO creature_loot_template VALUES(27651, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27651, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27651, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27651, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Mammoth (27642, 30909)
UPDATE creature_template SET lootid=27642 WHERE entry IN(27642, 30909);
DELETE FROM creature_loot_template WHERE entry=30909;
REPLACE INTO creature_loot_template VALUES(27642, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27642, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27642, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27642, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Murloc (27649, 30910)
UPDATE creature_template SET lootid=27649 WHERE entry IN(27649, 30910);
DELETE FROM creature_loot_template WHERE entry=30910;
REPLACE INTO creature_loot_template VALUES(27649, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27649, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27649, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27649, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Naga (27648, 30911)
UPDATE creature_template SET lootid=27648 WHERE entry IN(27648, 30911);
DELETE FROM creature_loot_template WHERE entry=30911;
REPLACE INTO creature_loot_template VALUES(27648, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27648, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27648, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27648, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Ogre (27647, 30912)
UPDATE creature_template SET lootid=27647 WHERE entry IN(27647, 30912);
DELETE FROM creature_loot_template WHERE entry=30912;
REPLACE INTO creature_loot_template VALUES(27647, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27647, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27647, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27647, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Water (27653, 30913)
UPDATE creature_template SET lootid=27653 WHERE entry IN(27653, 30913);
DELETE FROM creature_loot_template WHERE entry=30913;
REPLACE INTO creature_loot_template VALUES(27653, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27653, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27653, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27653, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Phantasmal Wolf (27644, 30914)
UPDATE creature_template SET lootid=27644 WHERE entry IN(27644, 30914);
DELETE FROM creature_loot_template WHERE entry=30914;
REPLACE INTO creature_loot_template VALUES(27644, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27644, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27644, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27644, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ring-Lord Conjurer (27640, 30915)
UPDATE creature_template SET lootid=27640 WHERE entry IN(27640, 30915);
DELETE FROM creature_loot_template WHERE entry=30915;
REPLACE INTO creature_loot_template VALUES(27640, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27640, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27640, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27640, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ring-Lord Sorceress (27639, 30916)
UPDATE creature_template SET lootid=27639 WHERE entry IN(27639, 30916);
DELETE FROM creature_loot_template WHERE entry=30916;
REPLACE INTO creature_loot_template VALUES(27639, 37364, 37364, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27639, 37365, 37365, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27639, 37366, 37366, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(27639, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Utgarde Keep
-- --------------------------
-- Dragonflayer Bonecrusher (24069, 31658)
UPDATE creature_template SET lootid=24069 WHERE entry IN(24069, 31658);
DELETE FROM creature_loot_template WHERE entry=31658;
REPLACE INTO creature_loot_template VALUES(24069, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24069, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24069, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24069, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Forge Master (24079, 31659)
UPDATE creature_template SET lootid=24079 WHERE entry IN(24079, 31659);
DELETE FROM creature_loot_template WHERE entry=31659;
REPLACE INTO creature_loot_template VALUES(24079, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24079, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24079, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24079, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Heartsplitter (24071, 31660)
UPDATE creature_template SET lootid=24071 WHERE entry IN(24071, 31660);
DELETE FROM creature_loot_template WHERE entry=31660;
REPLACE INTO creature_loot_template VALUES(24071, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24071, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24071, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24071, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Ironhelm (23961, 30747)
UPDATE creature_template SET lootid=23961 WHERE entry IN(23961, 30747);
DELETE FROM creature_loot_template WHERE entry=30747;
REPLACE INTO creature_loot_template VALUES(23961, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23961, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23961, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23961, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Metalworker (24078, 31661)
UPDATE creature_template SET lootid=24078 WHERE entry IN(24078, 31661);
DELETE FROM creature_loot_template WHERE entry=31661;
REPLACE INTO creature_loot_template VALUES(24078, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24078, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24078, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24078, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Overseer (24085, 31662)
UPDATE creature_template SET lootid=24085 WHERE entry IN(24085, 31662);
DELETE FROM creature_loot_template WHERE entry=31662;
REPLACE INTO creature_loot_template VALUES(24085, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24085, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24085, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24085, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Runecaster (23960, 31663)
UPDATE creature_template SET lootid=23960 WHERE entry IN(23960, 31663);
DELETE FROM creature_loot_template WHERE entry=31663;
REPLACE INTO creature_loot_template VALUES(23960, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23960, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23960, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23960, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Strategist (23956, 31666)
UPDATE creature_template SET lootid=23956 WHERE entry IN(23956, 31666);
DELETE FROM creature_loot_template WHERE entry=31666;
REPLACE INTO creature_loot_template VALUES(23956, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23956, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23956, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(23956, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Weaponsmith (24080, 31667)
UPDATE creature_template SET lootid=24080 WHERE entry IN(24080, 31667);
DELETE FROM creature_loot_template WHERE entry=31667;
REPLACE INTO creature_loot_template VALUES(24080, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24080, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24080, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24080, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Enslaved Proto-Drake (24083, 31669)
UPDATE creature_template SET lootid=24083 WHERE entry IN(24083, 31669);
DELETE FROM creature_loot_template WHERE entry=31669;
REPLACE INTO creature_loot_template VALUES(24083, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24083, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24083, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24083, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Proto-Drake Handler (24082, 31675)
UPDATE creature_template SET lootid=24082 WHERE entry IN(24082, 31675);
DELETE FROM creature_loot_template WHERE entry=31675;
REPLACE INTO creature_loot_template VALUES(24082, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24082, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24082, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24082, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Savage Worg (29735, 31678) - not overwrite
REPLACE INTO creature_loot_template VALUES(31678, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(31678, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(31678, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);

-- Tunneling Ghoul (24084, 31681)
UPDATE creature_template SET lootid=24084 WHERE entry IN(24084, 31681);
DELETE FROM creature_loot_template WHERE entry=31681;
REPLACE INTO creature_loot_template VALUES(24084, 37196, 37196, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24084, 37197, 37197, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24084, 37290, 37290, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(24084, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Utgarde Pinnace
-- --------------------------
-- Bloodthirsty Tundra Wolf (26672, 30762)
UPDATE creature_template SET lootid=26672 WHERE entry IN(26672, 30762);
DELETE FROM creature_loot_template WHERE entry=30762;
REPLACE INTO creature_loot_template VALUES(26672, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26672, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26672, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Deathseeker (26550, 30764)
UPDATE creature_template SET lootid=26550 WHERE entry IN(26550, 30764);
DELETE FROM creature_loot_template WHERE entry=30764;
REPLACE INTO creature_loot_template VALUES(26550, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26550, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26550, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Fanatic (26553, 30765)
UPDATE creature_template SET lootid=26553 WHERE entry IN(26553, 30765);
DELETE FROM creature_loot_template WHERE entry=30765;
REPLACE INTO creature_loot_template VALUES(26553, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26553, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26553, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Dragonflayer Seer (26554, 30766)
UPDATE creature_template SET lootid=26554 WHERE entry IN(26554, 30766);
DELETE FROM creature_loot_template WHERE entry=30766;
REPLACE INTO creature_loot_template VALUES(26554, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26554, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26554, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Scourge Hulk (26555, 30806)
UPDATE creature_template SET lootid=26555 WHERE entry IN(26555, 30806);
DELETE FROM creature_loot_template WHERE entry=30806;
REPLACE INTO creature_loot_template VALUES(26555, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26555, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26555, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ymirjar Berserker (26696, 30816)
UPDATE creature_template SET lootid=26696 WHERE entry IN(26696, 30816);
DELETE FROM creature_loot_template WHERE entry=30816;
REPLACE INTO creature_loot_template VALUES(26696, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26696, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26696, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ymirjar Dusk Shaman (26694, 30817)
UPDATE creature_template SET lootid=26694 WHERE entry IN(26694, 30817);
DELETE FROM creature_loot_template WHERE entry=30817;
REPLACE INTO creature_loot_template VALUES(26694, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26694, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26694, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ymirjar Flesh Hunter (26670, 30818)
UPDATE creature_template SET lootid=26670 WHERE entry IN(26670, 30818);
DELETE FROM creature_loot_template WHERE entry=30818;
REPLACE INTO creature_loot_template VALUES(26670, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26670, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26670, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ymirjar Necromancer (28368, 30820)
UPDATE creature_template SET lootid=28368 WHERE entry IN(28368, 30820);
DELETE FROM creature_loot_template WHERE entry=30820;
REPLACE INTO creature_loot_template VALUES(28368, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28368, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(28368, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Ymirjar Savage (26669, 30821)
UPDATE creature_template SET lootid=26669 WHERE entry IN(26669, 30821);
DELETE FROM creature_loot_template WHERE entry=30821;
REPLACE INTO creature_loot_template VALUES(26669, 37587, 37587, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26669, 37590, 37590, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(26669, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Violet Hold
-- --------------------------
-- Azure Captain (30666, 31486)
UPDATE creature_template SET lootid=30666 WHERE entry IN(30666, 31486);
DELETE FROM creature_loot_template WHERE entry=31486;
REPLACE INTO creature_loot_template VALUES(30666, 37889, 37889, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30666, 37890, 37890, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30666, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Raider (30668, 31490)
UPDATE creature_template SET lootid=30668 WHERE entry IN(30668, 31490);
DELETE FROM creature_loot_template WHERE entry=31490;
REPLACE INTO creature_loot_template VALUES(30668, 37889, 37889, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30668, 37890, 37890, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30668, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Sorceror (30667, 31493)
UPDATE creature_template SET lootid=30667 WHERE entry IN(30667, 31493);
DELETE FROM creature_loot_template WHERE entry=31493;
REPLACE INTO creature_loot_template VALUES(30667, 37889, 37889, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30667, 37890, 37890, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30667, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Azure Stalker (32191, 32192)
UPDATE creature_template SET lootid=32191 WHERE entry IN(32191, 32192);
DELETE FROM creature_loot_template WHERE entry=32192;
REPLACE INTO creature_loot_template VALUES(32191, 37889, 37889, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(32191, 37890, 37890, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(32191, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Portal Guardian (30892, 31502)
UPDATE creature_template SET lootid=30892 WHERE entry IN(30892, 31502);
DELETE FROM creature_loot_template WHERE entry=31502;
REPLACE INTO creature_loot_template VALUES(30892, 37889, 37889, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30892, 37890, 37890, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30892, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);

-- Portal Keeper (30893, 31504)
UPDATE creature_template SET lootid=30893 WHERE entry IN(30893, 31504);
DELETE FROM creature_loot_template WHERE entry=31504;
REPLACE INTO creature_loot_template VALUES(30893, 37889, 37889, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30893, 37890, 37890, 0.1, 0, 1, 0, 1, 1, NULL);
REPLACE INTO creature_loot_template VALUES(30893, 43624, 43624, 0.02, 0, 1, 0, 1, 1, NULL);


-- --------------------------
-- Icecrown
-- --------------------------


-- Retest Now NPCs

DELETE FROM creature_loot_template WHERE Entry=32349 AND Item=44301;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (32349, 44301, 0, 100, 1, 1, 0, 1, 1, NULL);

UPDATE creature_loot_template SET Chance=100 WHERE Item=44301 AND Entry IN(32236, 32259, 32262, 32268, 32276, 32279, 32289, 32290, 32297, 32349);



-- Changing the Wind's Course - [H] http://www.wowhead.com/quest=13058/changing-the-winds-course

SET @ENTRY := 30388;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,0,0,0,0,0,28,56900,0,0,0,0,0,23,0,0,0,0,0,0,0,"Stormhoof - On Just Died - Remove Aura 'Power of the Lorehammer'");



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


-- The Lost Mistwhisper Treasure - [A][H] http://www.wowhead.com/quest=12575/the-lost-mistwhisper-treasure

SET @TARTEK := 28105;
SET @ZEPTEK := 28399;

DELETE FROM smart_scripts WHERE entryorguid=@TARTEK AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@TARTEK, 0, 0, 1, 11, 0, 100, 0, 0, 0, 0, 0, 2, 2061, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Set Faction 2061'),
    (@TARTEK, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 18, 756, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Set Flags Disable Movement & Rename & Preparation & Not Attackable & Immune To NPC\'s'),
    (@TARTEK, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 12, @ZEPTEK, 1, 100000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Summon Creature \'Zeptek the Destroyer\''),
    (@TARTEK, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46598, 2, 0, 0, 0, 0, 11, @ZEPTEK, 10, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Cast \'Ride Vehicle Hardcoded\''),
    (@TARTEK, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Respawn - Say Line 0'),
    (@TARTEK, 0, 5, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Aggro - Say Line 1'),
    (@TARTEK, 0, 6, 0, 8, 0, 100, 0, 46598, 0, 0, 0, 19, 756, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Spellhit \'Ride Vehicle Hardcoded\' - Remove Flags Disable Movement & Rename & Preparation & Not Attackable & Immune To NPC\'s'),
    (@TARTEK, 0, 7, 0, 9, 0, 100, 0, 5000, 8000, 5000, 8000, 11, 29426, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - Within 5000-8000 Range - Cast \'Heroic Strike\''),
    (@TARTEK, 0, 8, 0, 0, 0, 100, 0, 5000, 15000, 5000, 15000, 11, 35429, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - In Combat - Cast \'Sweeping Strikes\''),
    (@TARTEK, 0, 9, 0, 0, 0, 100, 0, 6000, 15000, 6000, 15000, 11, 15572, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - In Combat - Cast \'Sunder Armor\''),
    (@TARTEK, 0, 10, 11, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 9, 28121, 0, 50, 0, 0, 0, 0, 'Warlord Tartek - On Just Died - Set Data 1 1'),
    (@TARTEK, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 15, 12575, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Warlord Tartek - On Just Died - Quest Credit \'The Lost Mistwhisper Treasure\''),
    (@TARTEK, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 11, @ZEPTEK, 50, 0, 0, 0, 0, 0, 'Warlord Tartek - On Just Died - Despawn Zeptek');



-- Infesting Jormungar 30148

SET @INFESTING_JORMUNGAR_GUID := 86240;
DELETE FROM creature WHERE id=30148;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
    (@INFESTING_JORMUNGAR_GUID, 30148, 571, 0, 0, 1, 1, 26263, 0, 7990.3, -1559.1, 904.997, 2.82743, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+1, 30148, 571, 0, 0, 1, 1, 26263, 0, 7996.98, -1608.36, 908.772, 4.2586, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+2, 30148, 571, 0, 0, 1, 1, 26263, 0, 7957.04, -1610.1, 908.131, 0.20944, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+3, 30148, 571, 0, 0, 1, 1, 26263, 0, 7920.24, -1625.21, 910.852, -1.9338, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+4, 30148, 571, 0, 0, 1, 1, 26263, 0, 7606.6, -1522.91, 974.029, 3.7887, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+5, 30148, 571, 0, 0, 1, 1, 26263, 0, 7615.32, -1550.68, 972.753, 4.02432, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+6, 30148, 571, 0, 0, 1, 1, 26263, 0, 7645.64, -1533.16, 973.012, 4.99036, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+7, 30148, 571, 0, 0, 1, 1, 26263, 0, 7631.37, -1591.72, 972.049, 1.12227, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+8, 30148, 571, 0, 0, 1, 1, 26263, 0, 7710.24, -1635.46, 952.952, 2.84622, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+9, 30148, 571, 0, 0, 1, 1, 26263, 0, 7737.69, -1625.75, 950.588, 1.43251, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+10, 30148, 571, 0, 0, 1, 1, 26263, 0, 7791.33, -1564.27, 941.703, 1.46392, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+11, 30148, 571, 0, 0, 1, 1, 26263, 0, 7820.32, -1549.61, 935.184, 3.57664, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+12, 30148, 571, 0, 0, 1, 1, 26263, 0, 7868.22, -1521.16, 925.599, 5.97211, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+13, 30148, 571, 0, 0, 1, 1, 26263, 0, 7894.05, -1547.91, 920.607, 4.99429, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+14, 30148, 571, 0, 0, 1, 1, 26263, 0, 7905.25, -1579.47, 915.558, 5.92105, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0),
    (@INFESTING_JORMUNGAR_GUID+15, 30148, 571, 0, 0, 1, 1, 26263, 0, 7580.26, -1470.25, 974.674, 3.75728, 300, 5, 0, 12600, 0, 1, 0, 0, 0, 0);


-- Cavedweller Worg 30164

SET @CAVEDWELLET_WORG_GUID := 94777;
DELETE FROM creature WHERE id=30164;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
    (@CAVEDWELLET_WORG_GUID, 30164, 571, 0, 0, 1, 1, 22042, 0, 8029.98, -1589.47, 903.184, 3.36848, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+1, 30164, 571, 0, 0, 1, 1, 22611, 0, 8029.42, -1596.67, 903.312, 3.03687, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+2, 30164, 571, 0, 0, 1, 1, 22042, 0, 7995.35, -1605.57, 908.536, 5.18363, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+3, 30164, 571, 0, 0, 1, 1, 22611, 0, 7993.44, -1610.69, 908.332, 0.418879, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+4, 30164, 571, 0, 0, 1, 1, 22042, 0, 7959.13, -1606.12, 907.662, 4.36332, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+5, 30164, 571, 0, 0, 1, 1, 22611, 0, 7951.54, -1607.11, 908.721, 5.74213, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+6, 30164, 571, 0, 0, 1, 1, 22611, 0, 7987.4, -1561.01, 905.209, 0.506145, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+7, 30164, 571, 0, 0, 1, 1, 22611, 0, 7989.47, -1554.61, 905.15, 4.95674, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+8, 30164, 571, 0, 0, 1, 1, 22042, 0, 7918.38, -1630.09, 911.414, 4.17355, 300, 5, 0, 8522, 0, 1, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+9, 30164, 571, 0, 0, 1, 1, 22611, 0, 7920.12, -1630.42, 911.431, 1.54768, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+10, 30164, 571, 0, 0, 1, 1, 22042, 0, 7924.59, -1628.15, 910.836, 2.54659, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+11, 30164, 571, 0, 0, 1, 1, 22611, 0, 7923.33, -1629.44, 911.088, 2.20218, 300, 0, 0, 8522, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+12, 30164, 571, 0, 0, 1, 1, 22611, 0, 7601.32, -1527.01, 974.217, 0.427199, 300, 0, 0, 8820, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+13, 30164, 571, 0, 0, 1, 1, 22042, 0, 7603.8, -1566.06, 972.708, 0.635327, 300, 0, 0, 8820, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+14, 30164, 571, 0, 0, 1, 1, 22611, 0, 7742.93, -1605.62, 947.645, 4.55446, 300, 0, 0, 8820, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+15, 30164, 571, 0, 0, 1, 1, 22042, 0, 7846.2, -1518.94, 929.342, 6.12919, 300, 0, 0, 8523, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+16, 30164, 571, 0, 0, 1, 1, 22611, 0, 7888.94, -1522.08, 921.393, 3.30176, 300, 0, 0, 8820, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+17, 30164, 571, 0, 0, 1, 1, 22042, 0, 7909.72, -1525.18, 918.712, 3.31747, 300, 0, 0, 8820, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+18, 30164, 571, 0, 0, 1, 1, 22611, 0, 7914.54, -1578.14, 914.215, 3.41956, 300, 0, 0, 8820, 0, 0, 0, 0, 0, 0),
    (@CAVEDWELLET_WORG_GUID+19, 30164, 571, 0, 0, 1, 1, 22042, 0, 7575.7, -1474.36, 977.123, 0.768835, 300, 0, 0, 8820, 0, 0, 0, 0, 0, 0);



-- Stoic Mammoth - 30260
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30260) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=29402 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30260);


-- Ravenous Jormungar - 30291
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30291) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=29605 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30291);


-- Roaming Jormungar - 30422
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30422) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=29605 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30422);




-- Harp on This! - [A][H] http://www.wowhead.com/quest=12052/harp-on-this
    
SET @ENTRY := 27061;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,85,47920,0,0,0,0,0,1,0,0,0,0,0,0,0,"Xink's Shredder - On Just Summoned - Invoker Cast 'Xink's Shredder'"),
(@ENTRY,0,1,0,16,0,100,0,47920,10,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Xink's Shredder - On Friendly Unit Missing Buff 'Xink's Shredder' - Despawn In 1000 ms");


DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceGroup=0 AND SourceEntry=47921;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (17, 0, 47921, 0, 0, 29, 0, 26316, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Harpy'),
    (17, 0, 47921, 0, 1, 29, 0, 26577, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Elemental'),
    (17, 0, 47921, 0, 2, 29, 0, 26575, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Harpy'),
    (17, 0, 47921, 0, 3, 29, 0, 26578, 30, 0, 0, 0, 0, '', 'Launch Saw Blades can be casted within 30 yards of Harpy Boss');




-- What the Cold Wind Brings... - [H] http://www.wowhead.com/quest=11632/what-the-cold-wind-brings

DELETE FROM creature_template_addon WHERE entry=25446;
UPDATE creature_addon SET mount=0, bytes2=258 WHERE guid=125432;

SET @ENTRY := 25446; -- Warsong Captain SAI
UPDATE `creature_template` SET `AIName`="SmartAI", type_flags=0 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,0,2,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Data Set 0 2 - Run Script"),
(@ENTRY,0,1,0,14,0,100,0,2000,40,10000,15000,11,15799,0,0,0,0,0,7,0,0,0,0,0,0,0,'Warsong Captain - Friendly At 2000 Health - Cast \'Chain Heal\''),
(@ENTRY,0,2,0,0,0,100,0,7000,9000,16000,20000,11,45584,1,0,0,0,0,2,0,0,0,0,0,0,0,'Warsong Captain - In Combat - Cast \'Bloodlust\''),
(@ENTRY,0,3,0,0,0,100,0,1000,2000,3000,3000,11,31717,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Warsong Captain - In Combat - Cast Chain Lightning'),
(@ENTRY,0,4,0,38,0,100,0,0,3,0,0,80,@ENTRY*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Data Set 0 3 - Run Script");

SET @ENTRY := 25244; -- Warsong Marksman SAI
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@ENTRY, 0, 0, 0, 0, 0, 100, 0, 0, 0, 2300, 3900, 11, 48854, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Warsong Marksman - In Combat - Cast \'Shoot\'');

SET @ENTRY := 2544600; -- Actionlist SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,100,100,0,0,45,2,2,0,0,0,0,19,23837,100,0,0,0,0,0,"Warsong Captain - On Script - Set data 2 2"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,500,500,0,0,53,1,25446,0,0,0,2,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Start Waypoint"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,4,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,5,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,6,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,7,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,8,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,9,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,10,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,11,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,12,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,13,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,14,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,15,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,16,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,17,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,18,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,19,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,20,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,21,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,22,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,23,0,0,0,100,0,1000,1000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 1"),
(@ENTRY,9,24,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,25,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,26,0,0,0,100,0,30000,30000,0,0,107,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Summon Creature Group 1"),
(@ENTRY,9,27,0,0,0,100,0,30000,30000,0,0,12,25453,4,20000,1,0,0,8,0,0,0,2705.965576, 6079.490234, 77.662964, 0.467981,"Warsong Captain - On Script - Summon Boss");

SET @ENTRY := 2544601; -- Actionlist SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,500,500,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,1,0,0,0,100,0,4000,4000,0,0,1,3,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,2,0,0,0,100,0,4000,4000,0,0,1,4,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Warsong Captain - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,50,187674,300,0,0,0,0,8,0,0,0,2719.454102,6085.813965,70.320084,0.541261,"Nerub'ar Sky Darkener - On Death - Summon caparace");

SET @ENTRY := 25446;
DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@ENTRY, 1, 2713.618, 6082.417, 67.779, 'Warsong Captain');

SET @WARSONG_CAPTAIN := 25446;
DELETE FROM creature_text WHERE entry=@WARSONG_CAPTAIN;
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 0, 0, "Marksmen! Front and center! Scourge attack incoming!", 14, 0, 100, 0, 0, 0, 24657, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 1, 0, "Marksmen, lock and load!", 14, 0, 100, 0, 0, 0, 24659, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 2, 0, "The Nerub'ar have been punished for their transgression!", 14, 0, 100, 0, 0, 0, 24660, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 3, 0, "Let the forces of the Lich King gaze upon the carcass of this wretch and know that the Horde will not relent!", 14, 0, 100, 0, 0, 0, 24673, 0, 'Warsong Captain');
INSERT INTO creature_text VALUES(@WARSONG_CAPTAIN, 4, 0, "Gather, soldiers! Gather and take your trophies from the carapace of the enemy!", 14, 0, 100, 0, 0, 0, 24674, 0, 'Warsong Captain');

SET @NERUBAR_SKY_DARKENER := 25451; -- Nerub'ar Sky Darkener
DELETE FROM creature_summon_groups WHERE summonerId=@WARSONG_CAPTAIN AND summonerType=0;
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2725.887939, 6056.259277, 79.065804, 1.120098, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2715.777832, 6066.867676, 81.215187, 0.103007, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2707.340088, 6090.684570, 79.129250, 1.292644, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2696.666260, 6068.134766, 70.117683, 4.481363, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2705.701660, 6060.605957, 70.117683, 3.644915, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2722.030518, 6078.456543, 78.617699, 5.254986, 4, 20000);
INSERT INTO creature_summon_groups VALUES (@WARSONG_CAPTAIN, 0, 1, @NERUBAR_SKY_DARKENER, 2698.852051, 6074.931641, 71.713753, 4.544197, 4, 20000);

UPDATE `creature_template` SET `AIName`="SmartAI", InhabitType=4, ExperienceModifier=0 WHERE `entry`=@NERUBAR_SKY_DARKENER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@NERUBAR_SKY_DARKENER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NERUBAR_SKY_DARKENER,0,0,0,54,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - On Just Summoned - Set Fly Off"),
(@NERUBAR_SKY_DARKENER,0,1,0,0,0,100,0,300,300,2000,3000,11,45577,64,0,0,0,0,2,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - In Combat - Cast 'Venom Spit'"),
(@NERUBAR_SKY_DARKENER,0,2,0,0,0,100,0,3000,5000,30000,40000,11,45587,65,0,0,0,0,2,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - In Combat - Cast 'Web Bolt'");

DELETE FROM creature WHERE guid=3110525 AND id=23837; -- EVENT TRIGGER BUNNY
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
    (3110525, 23837, 571, 0, 0, 1, 1, 0, 0, 2723.07, 6096.58, 74.4098, 5.09263, 1800, 0, 0, 42, 0, 0, 0, 0, 0, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid`=23837 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (23837, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 52388, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Just Summoned - Cast \'You Reap What You Sow: Ritual Bunny Channel\''),
    (23837, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 28671, 30, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Just Summoned - Set Data 0 1'),
    (23837, 0, 2, 0, 1, 0, 100, 0, 5000, 5000, 180000, 180000, 45, 0, 2, 0, 0, 0, 0, 19, 25446, 100, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Just Summoned - Set Data 0 2'),
    (23837, 0, 3, 0, 38, 0, 100, 1, 32, 32, 0, 0, 11, 9010, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 32 32 - Cast \'Create Filled Containment Coffer\' (No Repeat)'),
    (23837, 0, 4, 0, 38, 0, 100, 0, 31, 31, 0, 0, 87, 1636401, 1636403, 1636404, 1636406, 1636407, 1636408, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 31 31 - Run Random Script'),
    (23837, 0, 5, 0, 38, 0, 100, 0, 30, 30, 0, 0, 87, 1636401, 1636402, 1636403, 1636405, 1636406, 1636408, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 30 30 - Run Random Script'),
    (23837, 0, 6, 0, 11, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 27249, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Respawn - Set Data 1 1'),
    (23837, 0, 7, 0, 38, 0, 100, 0, 2, 2, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'ELM General Purpose Bunny - On Data Set 2 2 - Despawn Instant');

SET @ITHRIX := 25453; -- Ith'rix the Harvester
DELETE FROM creature_text WHERE entry=@ITHRIX;
INSERT INTO creature_text VALUES(@ITHRIX, 0, 0, "I will take great pleasure in tearing the forces of the Horde apart... limb from limb and piece by piece...", 14, 0, 100, 0, 0, 0, 24672, 0, 'Ith''rix the Harvester');
UPDATE `creature_template` SET `AIName`="SmartAI", InhabitType=4 WHERE `entry`=@ITHRIX;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ITHRIX AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ITHRIX,0,0,0,54,0,100,0,0,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Ith'rix the Harvester - Just Summoned - Say Line 0"),
(@ITHRIX,0,1,0,0,0,100,0,300,300,2000,3000,11,25748,64,0,0,0,0,2,0,0,0,0,0,0,0,"Ith'rix the Harvester - In Combat - Cast 'Poison Stinger'"),
(@ITHRIX,0,2,0,0,0,100,0,10000,10000,30000,30000,11,34392,65,0,0,0,0,2,0,0,0,0,0,0,0,"Ith'rix the Harvester - In Combat - Cast 'Stinger Rage'"),
(@ITHRIX,0,3,0,0,0,100,0,300,300,2000,3000,11,45592,64,0,0,0,0,2,0,0,0,0,0,0,0,"Nerub'ar Sky Darkener - In Combat - Cast 'Venom Spit'"),
(@ITHRIX,0,4,0,6,0,100,0,0,0,0,0,45,0,3,0,0,0,0,19,25446,100,0,0,0,0,0,"Nerub'ar Sky Darkener - On Death - Set Data 0 3");



UPDATE `creature` SET `phaseMask`=1|2|4 WHERE `guid` IN (152010,152011,152012,152013) and `id`=32500;


-- Gluttonous Lurkers - [A][H] http://www.wowhead.com/quest=12527/gluttonous-lurkers

UPDATE creature_template SET AIName='SmartAI', npcflag=16777217 WHERE entry=28202;
DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=28202;
INSERT INTO smart_scripts VALUES(28202, 0, 0, 0, 8, 0, 100, 0, 50926, 0, 1000, 1000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28202, 0, 1, 2, 64, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28202, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 85, 50926, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28202, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 56, 38380, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Zul''Drak Rat - Add item Zul''drak Rat');

UPDATE creature_template SET AIName='SmartAI' WHERE entry=28145;
DELETE FROM smart_scripts WHERE entryorguid IN (28145,28203) AND source_type=0;
INSERT INTO smart_scripts VALUES(28145, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 17000, 27000, 11, 54470, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'In Combat - Cast Venemous Bite');
INSERT INTO smart_scripts VALUES(28145, 0, 1, 2, 23, 0, 100, 1, 50894, 5, 100, 200, 41, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On 5 stacks of 50894 - Despawn');
INSERT INTO smart_scripts VALUES(28145, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 50928, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Link With Event 1 - Summon Gorged Basilisk');


UPDATE creature_template SET AIName='SmartAI', npcflag=16777217 WHERE entry=28203;
INSERT INTO smart_scripts VALUES(28203, 0, 0, 0, 8, 0, 100, 0, 50918, 0, 1000, 1000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28203, 0, 1, 2, 64, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28203, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 85, 50918, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Despawn on Spell Dummy');
INSERT INTO smart_scripts VALUES(28203, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 56, 38382, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gorged Basilisk - Add item Basilisk Crystals');

DELETE FROM spell_script_names WHERE spell_id=50894;



UPDATE creature_template SET flags_extra=2 WHERE entry IN(26653, 26662);




-- Rabid Grizzly and Blighted Elk

DELETE FROM creature WHERE guid IN(97981, 119442, 97955, 97973, 119466, 119430, 97948, 119436, 119494, 97976, 97946, 97947, 97950, 119431, 119475, 119441, 97974, 119496, 119462, 119461, 97969, 97959, 97958, 119497, 119455, 97971, 119493, 119433, 97951, 119439, 119439, 97965, 97964, 119468, 97963, 119465, 97952, 119432) AND id IN(26643, 26616);



-- -------------------------------------------
-- GRIZZLY_HILLS
-- -------------------------------------------


-- Jesse Masters

SET @JESSE_MASTERS := 29244;
DELETE FROM conditions WHERE SourceTypeOrReferenceId=23 AND SourceGroup=@JESSE_MASTERS AND SourceEntry IN(33454, 40202);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (23, @JESSE_MASTERS, 33454, 0, 0, 8, 0, 12212, 0, 0, 0, 0, 0, '', 'Jesse Masters - Only sell item 33454 if 12212 quest is rewarded'),
    (23, @JESSE_MASTERS, 40202, 0, 0, 8, 0, 12216, 0, 0, 0, 0, 0, '', 'Jesse Masters - Only sell item 40202 if 12216 quest is rewarded');


-- Fix requisites for:
-- Secrets of the Flamebinders - [A] http://www.wowhead.com/quest=12222/secrets-of-the-flamebinders
-- Thinning the ranks - [A] http://www.wowhead.com/quest=12223/thinning-the-ranks
-- The Thane of Voldrune - [A] http://www.wowhead.com/quest=12255/the-thane-of-voldrune

UPDATE quest_template_addon SET PrevQuestID=12292, NextQuestID=12255, ExclusiveGroup=-12222 WHERE ID IN(12222, 12223);


-- Load'er Up! - [H] http://www.wowhead.com/quest=11881/loader-up

DELETE FROM smart_scripts WHERE entryorguid=25969 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (25969, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 46340, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Just Summoned - Cast Crates Carried'),
    (25969, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Just Summoned - Set Passive'),
    (25969, 0, 2, 0, 32, 0, 100, 0, 50, 20000, 3000, 5000, 11, 46342, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Damage - Cast Drop Crate'),
    (25969, 0, 3, 0, 23, 0, 100, 0, 46340, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - On Has No Aura (Crates Carried) - Despawn'),
    (25969, 0, 4, 5, 75, 0, 100, 0, 0, 25849, 30, 0, 11, 46358, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Jenny - Within 30 yards of Fezzix Geartwist - Give Kill credit'),
    (25969, 0, 5, 6, 61, 0, 100, 0, 0, 25849, 30, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - Within 30 yards of Fezzix Geartwist - Die'),
    (25969, 0, 6, 0, 61, 0, 100, 0, 0, 25849, 30, 0, 41, 200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Jenny - Within 30 yards of Fezzix Geartwist - Despawn');



-- Fordragon Battle Steed

DELETE FROM `creature` WHERE id=27535;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27761;
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (27761);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, seat_id, `minion`, `description`, `summontype`, summontimer)
VALUES
    (27761, 27535, 0, 1, "Fordragon Battle Steed", 7, 0);
    




-- Asric and Jadaar

SET @ASRIC := 31898;
SET @JADAAR := 31899;

DELETE FROM creature_text WHERE entry IN(@ASRIC, @JADAAR);
INSERT INTO creature_text VALUES (@ASRIC, 0, 0, 'To your health, windbag.', 12, 0, 100, 0, 0, 0, 36818, 0, 'Asric 0');
INSERT INTO creature_text VALUES (@ASRIC, 1, 0, 'Now comes our chance at redemption, Jadaar. We could become heroes through this tournament!', 12, 0, 100, 0, 0, 0, 36744, 0, 'Asric 1');
INSERT INTO creature_text VALUES (@ASRIC, 2, 0, 'What could be holding you back? You''re hale, hearty... missing an eye perhaps, but that shouldn''t keep you from competing!', 12, 0, 100, 0, 0, 0, 36746, 0, 'Asric 2');
INSERT INTO creature_text VALUES (@ASRIC, 3, 0, 'Ah. That might be a problem.', 12, 0, 100, 0, 0, 0, 36748, 0, 'Asric 3');
INSERT INTO creature_text VALUES (@ASRIC, 4, 0, 'I had a... situation some time back with one of the individuals now heading up the Sunreavers here. A falling out, if you will.', 12, 0, 100, 0, 0, 0, 36750, 0, 'Asric 4');
INSERT INTO creature_text VALUES (@ASRIC, 5, 0, 'Needless to say, when I walked into the pavilion there was something of an altercation.', 12, 0, 100, 0, 0, 0, 36751, 0, 'Asric 5');
INSERT INTO creature_text VALUES (@ASRIC, 6, 0, 'He suggested I do something else with the lance, instead. It''s not my place to repeat vulgarities.', 12, 0, 100, 0, 0, 0, 36753, 0, 'Asric 6');
INSERT INTO creature_text VALUES (@ASRIC, 7, 0, 'There is no doubt in my mind you''d lose. Speed and wit triumphs over brute strength and bullheadedness any day of the week.', 12, 0, 100, 0, 0, 0, 36755, 0, 'Asric 7');
INSERT INTO creature_text VALUES (@ASRIC, 8, 0, 'Typical empty boasting. Still, the stables are rather distant and the drinks here are decent enough.', 12, 0, 100, 0, 0, 0, 36770, 0, 'Asric 8');
INSERT INTO creature_text VALUES (@ASRIC, 9, 0, 'Just as well.', 12, 0, 100, 0, 0, 0, 36772, 0, 'Asric 9');
INSERT INTO creature_text VALUES (@ASRIC, 10, 0, 'The Citadel, correct? Facing the Lich King''s most powerful minions.', 12, 0, 100, 0, 0, 0, 36774, 0, 'Asric 10');
INSERT INTO creature_text VALUES (@ASRIC, 11, 0, 'Indeed.', 12, 0, 100, 0, 0, 0, 36776, 0, 'Asric 11');
INSERT INTO creature_text VALUES (@ASRIC, 12, 0, 'Discretion is the better part of valor, after all.', 12, 0, 100, 0, 0, 0, 36778, 0, 'Asric 12');

INSERT INTO creature_text VALUES (@JADAAR, 0, 0, 'And to yours, brat.', 12, 0, 100, 0, 0, 0, 36819, 0, 'Jadaar 0');
INSERT INTO creature_text VALUES (@JADAAR, 1, 0, 'I don''t know. I am uncertain this is the proper vehicle to heroism.', 12, 0, 100, 0, 0, 0, 36745, 0, 'Jadaar 1');
INSERT INTO creature_text VALUES (@JADAAR, 2, 0, 'I dislike elekks. Strongly.', 12, 0, 100, 0, 0, 0, 36747, 0, 'Jadaar 2');
INSERT INTO creature_text VALUES (@JADAAR, 3, 0, 'Why aren''t you competing?', 12, 0, 100, 0, 0, 0, 36749, 0, 'Jadaar 3');
INSERT INTO creature_text VALUES (@JADAAR, 4, 0, 'They refused to train you?', 12, 0, 100, 0, 0, 0, 36752, 0, 'Jadaar 4');
INSERT INTO creature_text VALUES (@JADAAR, 5, 0, 'You realize, of course, that we would likely have to joust one another should we enter the tournament.', 12, 0, 100, 0, 0, 0, 36754, 0, 'Jadaar 5');
INSERT INTO creature_text VALUES (@JADAAR, 6, 0, 'Bullheadedness? It is my perseverance that has gotten us this far, dandy. You wouldn''t last five seconds.', 12, 0, 100, 0, 0, 0, 36769, 0, 'Jadaar 6');
INSERT INTO creature_text VALUES (@JADAAR, 7, 0, 'I hear those lances are rough-hewn, too. I''m no fan of splinters.', 12, 0, 100, 0, 0, 0, 36771, 0, 'Jadaar 7');
INSERT INTO creature_text VALUES (@JADAAR, 8, 0, 'If we do succeed here, you realize what comes next.', 12, 0, 100, 0, 0, 0, 36773, 0, 'Jadaar 8');
INSERT INTO creature_text VALUES (@JADAAR, 9, 0, 'The two of us against the vast undead sea.', 12, 0, 100, 0, 0, 0, 36775, 0, 'Jadaar 9');
INSERT INTO creature_text VALUES (@JADAAR, 10, 0, '...perhaps we should seek our fortune somewhere less likely to be fatal.', 12, 0, 100, 0, 0, 0, 36777, 0, 'Jadaar 10');

SET @ENTRY := 31898;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,5000,5000,150000,150000,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - Out of Combat - Run Script");

SET @ENTRY := 3189800;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,1,0,100,0,1000,1000,0,0,1,0,2000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 0 Asric"),
(@ENTRY,9,1,0,1,0,100,0,2000,2000,0,0,1,0,2000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 0 Jadaar"),
(@ENTRY,9,2,0,1,0,100,0,1000,1000,0,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Emote drink Asric"),
(@ENTRY,9,3,0,1,0,100,0,0,0,0,0,5,7,0,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Emote drink Jadaar"),
(@ENTRY,9,4,0,1,0,100,0,4000,4000,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 1 Asric"),
(@ENTRY,9,5,0,1,0,100,0,4000,4000,0,0,1,1,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 1 Jadaar"),
(@ENTRY,9,6,0,1,0,100,0,4000,4000,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 2 Asric"),
(@ENTRY,9,7,0,1,0,100,0,4000,4000,0,0,1,2,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 2 Jadaar"),
(@ENTRY,9,8,0,1,0,100,0,4000,4000,0,0,1,3,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 3 Asric"),
(@ENTRY,9,9,0,1,0,100,0,10000,10000,0,0,1,3,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 3 Jadaar"),
(@ENTRY,9,10,0,1,0,100,0,4000,4000,0,0,1,4,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 4 Asric"),
(@ENTRY,9,11,0,1,0,100,0,4000,4000,0,0,1,5,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 5 Asric"),
(@ENTRY,9,12,0,1,0,100,0,4000,4000,0,0,1,4,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 4 Jadaar"),
(@ENTRY,9,13,0,1,0,100,0,4000,4000,0,0,1,6,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 6 Asric"),
(@ENTRY,9,14,0,1,0,100,0,10000,10000,0,0,1,5,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 5 Jadaar"),
(@ENTRY,9,15,0,1,0,100,0,5000,5000,0,0,1,7,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 7 Asric"),
(@ENTRY,9,16,0,1,0,100,0,5000,5000,0,0,1,6,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 6 Jadaar"),
(@ENTRY,9,17,0,1,0,100,0,5000,5000,0,0,1,8,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 8 Asric"),
(@ENTRY,9,18,0,1,0,100,0,5000,5000,0,0,1,7,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 7 Jadaar"),
(@ENTRY,9,19,0,1,0,100,0,5000,5000,0,0,1,9,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 9 Asric"),
(@ENTRY,9,20,0,1,0,100,0,10000,10000,0,0,1,8,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 8 Jadaar"),
(@ENTRY,9,21,0,1,0,100,0,4000,4000,0,0,1,10,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 10 Asric"),
(@ENTRY,9,22,0,1,0,100,0,4000,4000,0,0,1,9,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 9 Jadaar"),
(@ENTRY,9,23,0,1,0,100,0,4000,4000,0,0,1,11,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 11 Asric"),
(@ENTRY,9,24,0,1,0,100,0,4000,4000,0,0,1,10,3000,0,0,0,0,10,84752,@JADAAR,0,0,0,0,0,"Asric - On Script - Say 10 Jadaar"),
(@ENTRY,9,25,0,1,0,100,0,4000,4000,0,0,1,12,3000,0,0,0,0,1,0,0,0,0,0,0,0,"Asric - On Script - Say 12 Asric");



-- Stormforged Ambusher - 30208
INSERT INTO creature_loot_template (Entry,`Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
SELECT (30208) AS Entry, Item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment FROM creature_loot_template AS clt2
WHERE clt2.Entry=30222 AND clt2.Item NOT IN(SELECT clt3.Item From creature_loot_template AS clt3 WHERE clt3.Entry=30208);


-- --------------------------
-- Fishing
-- --------------------------


-- Pygmy Suckerfish - http://www.wowhead.com/item=40199/pygmy-suckerfish

DELETE FROM gameobject_loot_template WHERE Entry IN (25665, 25664, 25663, 25662, 25669, 25668, 25671, 25670, 25673, 25674) AND Item=40199;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (25665, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25664, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25663, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25662, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25669, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25668, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25671, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25670, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25673, 40199, 0, 65, 0, 1, 2, 1, 1, NULL),
    (25674, 40199, 0, 65, 0, 1, 2, 1, 1, NULL);


DELETE FROM `spell_script_names` WHERE `spell_id` IN (45043, 45044);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
('45043', 'spell_item_shifting_naaru_silver'),
('45044', 'spell_item_shifting_naaru_silver');


-- Troll Patrol: The Alchemist's Apprentice - [A][H] http://www.wowhead.com/quest=12541/troll-patrol-the-alchemists-apprentice
-- Lab Work - [A][H] http://www.wowhead.com/quest=12557/lab-work

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(14, 15) AND SourceGroup=9668;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (14, 9668, 13097, 0, 0, 9, 0, 12541, 0, 0, 1, 0, 0, '', 'Alchemist Finklestein - Show gossip 13097 if player has NOT taken quest Troll Patrol: The Alchemist\'s Apprentice AND'),
    (14, 9668, 13097, 0, 0, 9, 0, 12557, 0, 0, 1, 0, 0, '', 'Alchemist Finklestein - Show gossip 13097 if player has NOT taken quest Lab Work'),
    (14, 9668, 13098, 0, 0, 9, 0, 12541, 0, 0, 0, 0, 0, '', 'Alchemist Finklestein - Show gossip 13098 if player has taken quest Lab Work'),
    (14, 9668, 13119, 0, 0, 9, 0, 12557, 0, 0, 0, 0, 0, '', 'Alchemist Finklestein - Show gossip 13119 if player has taken quest Troll Patrol: The Alchemist\'s Apprentice'),
    (15, 9668, 0, 0, 0, 9, 0, 12541, 0, 0, 0, 0, 0, '', 'Alchemist Finklestein - Show gossip option only if player has taken quest Troll Patrol: The Alchemist\'s Apprentice AND'),
    (15, 9668, 0, 0, 0, 1, 0, 51216, 0, 0, 1, 0, 0, '', 'Alchemist Finklestein - Show gossip option only if player does NOT have aura 51216');





-- Soulstone Ressurection
DELETE FROM `spell_ranks` WHERE (`first_spell_id`='20707');
INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
('20707', '20707', '1'),
('20707', '20762', '2'),
('20707', '20763', '3'),
('20707', '20764', '4'),
('20707', '20765', '5'),
('20707', '27239', '6'),
('20707', '47883', '7');




-- All Hail Roanauk! - [H] http://www.wowhead.com/quest=12140/all-hail-roanauk

DELETE FROM smart_scripts WHERE entryorguid=26379 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (26379, 0, 0, 1, 19, 0, 100, 0, 12140, 0, 0, 0, 81, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Set Npc Flags'),
    (26379, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 91, 257, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Set Bytes 1'),
    (26379, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Say Line 1'),
    (26379, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 0, 26379, 0, 0, 60000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Quest Accept (All Hail Roanauk!) - Start WP'),
    (26379, 0, 4, 0, 40, 0, 100, 0, 10, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 26810, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On reached WP10 - Set Orientation'),
    (26379, 0, 5, 0, 38, 0, 100, 0, 1, 1, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Data Set - Despawn instant'),
    (26379, 0, 6, 0, 36, 0, 100, 0, 0, 0, 0, 0, 70, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Overlord Agmar - On Corpse removed - Respawn');


-- Into the World of Spirits - [A] http://www.wowhead.com/quest=11333/into-the-world-of-spirits

SET @GO_REAGENT_POUCH := 6409;
DELETE FROM gameobject WHERE id=186662;
DELETE FROM gameobject WHERE guid IN(@GO_REAGENT_POUCH, @GO_REAGENT_POUCH+1, @GO_REAGENT_POUCH+2) AND id=186662;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
    (@GO_REAGENT_POUCH, 186662, 571, 0, 0, 1, 1, 1032.58, -5153.86, -51.1602, -1.64061, 0, 0, 0, 1, 180, 100, 1, 0),
    (@GO_REAGENT_POUCH+1, 186662, 571, 0, 0, 1, 1, 725.215, -5169.55, -73.8399, 6.24164, 0, 0, 0.0207709, -0.999784, 180, 0, 1, 0),
    (@GO_REAGENT_POUCH+2, 186662, 571, 0, 0, 1, 1, 793.38, -5150.03, -82.557, 0.54751, 0, 0, 0.270348, 0.962763, 180, 0, 1, 0);

SET @REAGENT_POUCH_POOL_ENTRY := 369;
DELETE FROM pool_template WHERE entry IN(@REAGENT_POUCH_POOL_ENTRY);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
    (@REAGENT_POUCH_POOL_ENTRY, 1, 'Reagent Pouch');

DELETE FROM pool_gameobject WHERE guid IN(@GO_REAGENT_POUCH, @GO_REAGENT_POUCH+1, @GO_REAGENT_POUCH+2) AND pool_entry=@REAGENT_POUCH_POOL_ENTRY;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
    (@GO_REAGENT_POUCH, @REAGENT_POUCH_POOL_ENTRY, 34, ''),
    (@GO_REAGENT_POUCH+1, @REAGENT_POUCH_POOL_ENTRY, 33, ''),
    (@GO_REAGENT_POUCH+2, @REAGENT_POUCH_POOL_ENTRY, 33, '');



-- Anub'ar Blightbeast
DELETE FROM `creature_addon` WHERE `guid` IN (
118459,
118460,
118461,
118462,
118463,
118464,
118465,
118466,
118467,
118468,
118469,
118470,
118471,
118472,
118473,
118474,
118475,
118476,
118477,
118478,
118479,
118480,
118481,
118482,
118483,
118484,
118485,
118486,
118487,
118488,
118489,
118490,
118494,
118495,
118496,
131831,
131832,
131833,
131834,
131835,
131836,
131837);

DELETE FROM `creature_template_addon` WHERE `entry`=26607;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(26607, 0, 0, 50331648, 1, 0, NULL);

-- Baelok SAI
SET @ENTRY := 30953;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,7000,9000,13000,11,61094,0,0,0,0,0,2,0,0,0,0,0,0,0,"Baelok - In Combat - Cast 'Death Grip'"),
(@ENTRY,0,1,0,0,0,100,0,15000,20000,18000,25000,11,61090,0,0,0,0,0,2,0,0,0,0,0,0,0,"Baelok - In Combat - Cast 'Draw Soul'"),
(@ENTRY,0,2,0,0,0,100,0,10000,13000,35000,45000,11,61086,1,0,0,0,0,1,0,0,0,0,0,0,0,"Baelok - In Combat - Cast 'Summon Dancing Runeblade'"),
(@ENTRY,0,3,0,6,0,100,1,0,0,0,0,33,31159,0,0,0,0,0,16,0,0,0,0,0,0,0,"Baelok - On Just Died - Quest Credit 'The Rider of Blood' (No Repeat)"),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,39,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Baelok - On Aggro - Call For Help");


-- Rokir questcredit
SET @ENTRY := 30954;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,4000,60000,90000,11,61088,1,0,0,0,0,1,0,0,0,0,0,0,0,"Rokir - In Combat - Cast 'Zombie Horde'"),
(@ENTRY,0,1,0,9,0,100,0,0,5,15000,19000,11,61109,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rokir - Within 0-5 Range - Cast 'Plague Strike'"),
(@ENTRY,0,2,0,0,0,100,0,8000,13000,16000,21000,11,61112,1,0,0,0,0,5,0,0,0,0,0,0,0,"Rokir - In Combat - Cast 'Death and Decay'"),
(@ENTRY,0,3,0,6,0,100,1,0,0,0,0,33,31160,0,0,0,0,0,16,0,0,0,0,0,0,0,"Rokir - On Just Died - Quest Credit 'The Rider of the Unholy' (No Repeat)");


-- Abbey Bell Rope SAI
SET @ENTRY := 188713;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,1,70,0,100,0,2,0,0,0,45,1,1,0,0,0,0,10,105877,27245,0,0,0,0,0,"Abbey Bell Rope - On Gameobject State Changed - Set Data 1 1"),
(@ENTRY,1,1,2,61,0,100,0,2,0,0,0,85,48753,0,0,0,0,0,7,0,0,0,0,0,0,0,"Abbey Bell Rope - On Gameobject State Changed - Invoker Cast 'A Fall from Grace: Bell Rung Dummy Aura'"),
(@ENTRY,1,2,0,61,0,100,0,2,0,0,0,45,10,10,0,0,0,0,19,27202,10,0,0,0,0,0,"Abbey Bell Rope - On Gameobject State Changed - Set Data 10 10");

DELETE FROM `creature_text` WHERE `entry` = 27202 AND `groupid` = 3;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `BroadcastTextID`) VALUES 
(27202, 3, 0, 'Gah! What are you doing?', 12, 0, 100, 5, 0, 7256, 'Onslaught Raven Priest', 26637);

-- Onslaught Raven Priest SAI
SET @ENTRY := 27202;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id`=16;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,16,0,38,0,100,0,10,10,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Onslaught Raven Priest - On Data Set 10 10 - Say Line 3");



-- Ethereum Stasis Chamber - Respawntimer
UPDATE `gameobject_template` SET `data2`=180000 WHERE  `entry` IN (
185465,
185465,
185466,
185467,
184595,
185461,
185462,
185463,
185464,
185468,
185469,
185470);


-- Fueling the Demolishers
-- [H] - Attack - http://www.wowhead.com/quest=13200/fueling-the-demolishers
-- [H] - Defend - http://www.wowhead.com/quest=13191/fueling-the-demolishers
-- [A] - Attack - http://www.wowhead.com/quest=13197/fueling-the-demolishers
-- [A] - Defend - http://www.wowhead.com/quest=236/fueling-the-demolishers

DELETE FROM creature_questender WHERE quest=13191; -- HORDE
DELETE FROM creature_queststarter WHERE quest=13191;
DELETE FROM creature_queststarter WHERE id=31106 AND quest=13200;
INSERT INTO `creature_queststarter` (`id`, `quest`)
VALUES
    (31106, 13191),
    (31106, 13200);

DELETE FROM creature_questender WHERE id=31091 AND quest=13200;
DELETE FROM creature_questender WHERE id=31106 AND quest=13200;
INSERT INTO `creature_questender` (`id`, `quest`)
VALUES
    (31106, 13191),
    (31106, 13200),
    (31091, 13191),
    (31091, 13200);

DELETE FROM creature_questender WHERE quest=236; -- ALLIANCE
DELETE FROM creature_queststarter WHERE quest=236;
DELETE FROM creature_queststarter WHERE id=31108 AND quest=13197;
INSERT INTO `creature_queststarter` (`id`, `quest`)
VALUES
    (31108, 236),
    (31108, 13197);

DELETE FROM creature_questender WHERE id IN(31036, 31108) AND quest=13197;
DELETE FROM creature_questender WHERE id IN(31036, 31108) AND quest=236;
INSERT INTO `creature_questender` (`id`, `quest`)
VALUES
    (31108, 236),
    (31108, 13197),
    (31036, 236),
    (31036, 13197);

UPDATE quest_template_addon SET ExclusiveGroup=13197 WHERE ID IN(13197, 236);

UPDATE quest_template SET LogDescription='Siege Master Stouthandle in Wintergrasp wants you to retrieve 10 Eternal Embers from Horde players at the Cauldron of Flames.' WHERE ID=13197;
UPDATE quest_template SET AllowableRaces=1101 WHERE ID=236;

UPDATE creature_template SET ScriptName="npc_wg_quest_giver" WHERE entry=31108;


-- High Commander Halford Wyrmbane - [A] http://www.wowhead.com/quest=12298/high-commander-halford-wyrmbane

DELETE FROM smart_scripts WHERE entryorguid=23859 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (23859, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 80, 2385900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Greer Orehammer - On aggro - Run Script'),
    (23859, 0, 1, 0, 62, 0, 100, 0, 9546, 1, 0, 0, 56, 33634, 10, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Greer Orehammer - On gossip option select - give player 10 Orehammer\'s Precision Bombs'),
    (23859, 0, 2, 0, 62, 0, 100, 0, 9546, 1, 0, 0, 52, 745, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Greer Orehammer - On gossip option select - Plague This Taxi Start'),
    (23859, 0, 3, 0, 19, 0, 100, 0, 0, 0, 0, 0, 11, 48862, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Greer Orehammer - On Quest Accepted - Activate Taxi to Wintergarde Keep");


-- Yulda the Stormspeaker 30046

DELETE FROM creature WHERE guid=104495 AND id=30046;


-- Just Around the Corner - [A][H] http://www.wowhead.com/quest=12819/just-around-the-corner

UPDATE creature_template SET AIName='', ScriptName='npc_sparksocket_AA_cannon' WHERE entry=29399;


-- Enchanted Tiki Warriors - [A][H] http://wotlk.openwow.com/quest=12708


DELETE FROM spell_script_names WHERE spell_id=54651;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (54651, 'spell_spirit_burn_aura');


-- Winterhoof Emblem 33340
-- The Conqueror of Skorn! - [H] http://wotlk.openwow.com/quest=11261

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=8898;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (15, 8898, 0, 0, 0, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 0, 8, 0, 11258, 0, 0, 1, 0, 0, '', 'Gossip Option requires Burn, Skorn, Burn not Rewarded'),
    (15, 8898, 0, 0, 0, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 1, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 1, 8, 0, 11257, 0, 0, 1, 0, 0, '', 'Gossip Option requires Gruesome but Necessary not Rewarded'),
    (15, 8898, 0, 0, 1, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 2, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 2, 8, 0, 11259, 0, 0, 1, 0, 0, '', 'Gossip Option requires Towers of Certain Doom not Rewarded'),
    (15, 8898, 0, 0, 2, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 3, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 3, 8, 0, 11261, 0, 0, 1, 0, 0, '', 'Gossip Option requires The Conqueror of Skorn! not Rewarded'),
    (15, 8898, 0, 0, 3, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 4, 8, 0, 11256, 0, 0, 1, 0, 0, '', 'Gossip Option requires Skorn Must Fall not Rewarded AND'),
    (15, 8898, 0, 0, 4, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem');

UPDATE quest_template_addon SET PrevQuestID=0 WHERE ID=11261;


-- Winterhoof Emblem 33340
-- The Conqueror of Skorn! - [H] http://wotlk.openwow.com/quest=11261
-- Operation: Skornful Wrath - [A] http://wotlk.openwow.com/quest=11248

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=8898;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (15, 8898, 0, 0, 0, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 0, 8, 0, 11258, 0, 0, 1, 0, 0, '', 'Gossip Option requires Burn, Skorn, Burn not Rewarded'),
    (15, 8898, 0, 0, 0, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 1, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 1, 8, 0, 11257, 0, 0, 1, 0, 0, '', 'Gossip Option requires Gruesome but Necessary not Rewarded'),
    (15, 8898, 0, 0, 1, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 2, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 2, 8, 0, 11259, 0, 0, 1, 0, 0, '', 'Gossip Option requires Towers of Certain Doom not Rewarded'),
    (15, 8898, 0, 0, 2, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 3, 8, 0, 11256, 0, 0, 0, 0, 0, '', 'Gossip Option requires Skorn Must Fall Rewarded'),
    (15, 8898, 0, 0, 3, 8, 0, 11261, 0, 0, 1, 0, 0, '', 'Gossip Option requires The Conqueror of Skorn! not Rewarded'),
    (15, 8898, 0, 0, 3, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem'),
    (15, 8898, 0, 0, 4, 8, 0, 11256, 0, 0, 1, 0, 0, '', 'Gossip Option requires Skorn Must Fall not Rewarded AND'),
    (15, 8898, 0, 0, 4, 8, 0, 11281, 0, 0, 0, 0, 0, '', 'Gossip Option requires Mimicking Nature''s Call Rewarded AND'),
    (15, 8898, 0, 0, 4, 2, 0, 33340, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Winterhoof Emblem');

UPDATE quest_template_addon SET PrevQuestID=0 WHERE ID=11261;

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=8852;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (15, 8852, 0, 0, 0, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath Rewarded'),
    (15, 8852, 0, 0, 0, 8, 0, 11247, 0, 0, 1, 0, 0, '', 'Gossip Option requires Burn, Skorn, Burn not Rewarded'),
    (15, 8852, 0, 0, 0, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Westguard Command Insignia'),
    (15, 8852, 0, 0, 1, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath Rewarded'),
    (15, 8852, 0, 0, 1, 8, 0, 11246, 0, 0, 1, 0, 0, '', 'Gossip Option requires Gruesome but Necessary not Rewarded'),
    (15, 8852, 0, 0, 1, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Have Westguard Command Insignia'),
    (15, 8852, 0, 0, 2, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath Rewarded'),
    (15, 8852, 0, 0, 2, 8, 0, 11245, 0, 0, 1, 0, 0, '', 'Gossip Option requires Towers of Certain Doom not Rewarded'),
    (15, 8852, 0, 0, 2, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Westguard Command Insignia'),
    (15, 8852, 0, 0, 3, 8, 0, 11248, 0, 0, 0, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath'),
    (15, 8852, 0, 0, 3, 8, 0, 11250, 0, 0, 1, 0, 0, '', 'Gossip Option requires All Hail the Conqueror of Skorn! not Rewarded'),
    (15, 8852, 0, 0, 3, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not have Westguard Command Insignia'),
    (15, 8852, 0, 0, 4, 8, 0, 11248, 0, 0, 1, 0, 0, '', 'Gossip Option requires Operation: Skornful Wrath NOT Rewarded AND'),
    (15, 8852, 0, 0, 4, 8, 0, 11332, 0, 0, 0, 0, 0, '', 'Gossip Option requires Mission: Plague This! Rewarded AND'),
    (15, 8852, 0, 0, 4, 2, 0, 33311, 1, 0, 1, 0, 0, '', 'Gossip Option requires Player does not Westguard Command Insignia');


-- Serendipity
DELETE FROM `spell_proc_event` WHERE (`entry`='-63730');
INSERT INTO `spell_proc_event` (`entry`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `Cooldown`) VALUES ('-63730', '6', '2048', '4', '0');
DELETE FROM `spell_script_names` WHERE (`spell_id`='-63730');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES ('-63730', 'spell_pri_serendipity');


-- --------------------------
-- Enchanting
-- --------------------------


-- Pristine Glowbear Pelt
UPDATE `item_template` SET `DisenchantID`='54' WHERE (`entry`='51958');


-- Convocation at Zol'Heb - [A][H] http://www.wowhead.com/quest=12730/convocation-at-zolheb

DELETE FROM smart_scripts WHERE entryorguid=29028 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (29028, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Set Flag Immune To Players'),
    (29028, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 34427, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Cast \'Ethereal Teleport\''),
    (29028, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Store Targetlist'),
    (29028, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2902800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Just Summoned - Run Script'),
    (29028, 0, 4, 0, 0, 1, 100, 0, 10000, 12000, 14000, 16000, 11, 53496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - In Combat - Cast \'Darting Flames\''),
    (29028, 0, 5, 0, 0, 1, 100, 0, 16000, 18000, 12000, 15000, 11, 53493, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - In Combat - Cast \'Incinerate\''),
    (29028, 0, 6, 7, 2, 0, 100, 1, 0, 70, 0, 0, 11, 52989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Cast \'Akali\'s Stun\' (No Repeat)'),
    (29028, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 11, 52982, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Cast \'Akali\'s Immunity\''),
    (29028, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Stop Attacking (No Repeat)'),
    (29028, 0, 9, 10, 61, 0, 100, 0, 0, 0, 0, 0, 18, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Set pacified flag (No Repeat)'),
    (29028, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Set Event Phase 2 (No Repeat)'),
    (29028, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2902801, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Run Script (No Repeat)'),
    (29028, 0, 12, 13, 34, 4, 100, 0, 0, 1, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0.802851, 'Prophet of Akali - On Reached Point 1 - Set Orientation 1 (Phase 4)'),
    (29028, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Reached Point 1 - Set Event Phase 0 (Phase 4)'),
    (29028, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 19, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - Between 0-70% Health - Remove pacified flag (No Repeat)'),
    (29028, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 2902802, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Reached Point 1 - Run Script (Phase 4)');


DELETE FROM smart_scripts WHERE entryorguid=2902800 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2902800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 13, 190594, 0, 20, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 20, 191123, 20, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 13, 191365, 0, 20, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 20, 300221, 20, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902800, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Invoker'),
    (2902800, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 0'),
    (2902800, 9, 6, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Invoker'),
    (2902800, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 1'),
    (2902800, 9, 8, 0, 0, 0, 100, 0, 3600, 3600, 0, 0, 19, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Remove Flag Immune To Players'),
    (2902800, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Start Attacking'),
    (2902800, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Event Phase 1');


DELETE FROM smart_scripts WHERE entryorguid=2902801 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2902801, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6448.36, -4475.49, 451.076, 0, 'Prophet of Akali - On Script - Move To Position'),
    (2902801, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Event Phase 3');


DELETE FROM smart_scripts WHERE entryorguid=2902802 AND source_type=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (2902802, 9, 0, 0, 0, 0, 100, 0, 800, 800, 0, 0, 1, 2, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 2'),
    (2902802, 9, 1, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 3'),
    (2902802, 9, 2, 0, 0, 0, 100, 0, 2400, 2400, 0, 0, 11, 52993, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Cast \'Akali\'s Ritual of Annihilation\''),
    (2902802, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 4'),
    (2902802, 9, 4, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 12, 29050, 1, 300000, 0, 0, 0, 8, 0, 0, 0, 6355.08, -4494.31, 458.179, 0, 'Prophet of Akali - On Script - Summon Creature \'Har\'koa\''),
    (2902802, 9, 5, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 1'),
    (2902802, 9, 6, 0, 0, 0, 100, 0, 4600, 4600, 0, 0, 45, 0, 2, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Data 0 2'),
    (2902802, 9, 7, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Closest Creature \'Har\'koa\''),
    (2902802, 9, 8, 0, 0, 0, 100, 0, 1300, 1300, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 5'),
    (2902802, 9, 9, 0, 0, 0, 100, 0, 7100, 7100, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 29050, 100, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Orientation Closest Creature \'Har\'koa\''),
    (2902802, 9, 10, 0, 0, 0, 100, 0, 100, 100, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 6'),
    (2902802, 9, 11, 0, 0, 0, 100, 0, 9500, 9500, 0, 0, 92, 0, 52993, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Interrupt Spell \'Akali\'s Ritual of Annihilation\''),
    (2902802, 9, 12, 0, 0, 0, 100, 0, 300, 300, 0, 0, 11, 53010, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Cast \'Convocation at Zol\'Heb: Removef Akali\'s Stun\''),
    (2902802, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 52982, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Remove Aura \'Akali\'s Immunity\''),
    (2902802, 9, 14, 0, 0, 0, 100, 0, 100, 100, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Say Line 7'),
    (2902802, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Remove Flag Immune To NPC\'s'),
    (2902802, 9, 16, 0, 0, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Set Event Phase 1'),
    (2902802, 9, 17, 0, 0, 0, 100, 0, 0, 0, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Enable Combat Movement'),
    (2902802, 9, 18, 0, 0, 0, 100, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prophet of Akali - On Script - Start Attacking');



-- "Crowleg" Dan - [A][H] http://www.wowhead.com/quest=11479/crowleg-dan

DELETE FROM `smart_scripts` WHERE `entryorguid`=24713 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (24713, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Agro - Say'),
    (24713, 0, 1, 0, 9, 0, 100, 0, 0, 5, 5000, 8000, 11, 50311, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Range - Cast Thrash Kick'),
    (24713, 0, 2, 3, 62, 0, 100, 0, 9335, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Gossip Option Select - Close Gossip'),
    (24713, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Gossip Option Select - Set faction 14'),
    (24713, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Gossip Option Select - Start Attack'),
    (24713, 0, 5, 0, 25, 0, 100, 0, 0, 0, 0, 0, 2, 1888, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, '\"Crowleg\" Dan - On Reset - Set faction 1888');


DELETE FROM `gossip_menu_option` WHERE `menu_id`=9335;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES 
(9335, 0, 0, 'Ummm... the frog says you''re a traitor, "matey."', 25738, 1, 1, 0, 0, 0, 0, NULL, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=9335;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 9335, 0, 0, 0, 9, 0, 11479, 0, 0, 0, 0, 0, '', 'Crowleg" Dan - Only show Gossip if player has quest active');


-- Northsea Force Reaction 44017 

DELETE FROM spell_script_names WHERE spell_id=44017;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (44017, 'spell_northsea_force_reaction');



-- Ravenous Jormungar - loot Worm Meat 29605
UPDATE `creature_loot_template` SET `Chance`=70 WHERE  `Entry`=29605 AND `Item`=43010;



SET @GUID  =6028;
UPDATE `gameobject` SET `spawnMask`=3, `spawntimesecs`=604800 WHERE `guid`=55974;
DELETE FROM `gameobject` WHERE `guid`=@GUID;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)VALUES 
(@GUID, 195036, 603, 3, 1, 1757.896, 87.201, 342.384, 0.649495, 0, 0, 0, 1, 604800, 255, 1);


UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `ID`=6962;


UPDATE `skill_fishing_base_level` SET `skill`=430 WHERE `entry`=4197;


UPDATE `creature_template` SET `VehicleId`=732, `unit_flags`=33554432, `InhabitType`=4 WHERE `entry`=40246;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (74890, -75731);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(74890, 75055, 0, "Instant Statue"),
(-75731, -75055, 0, "Instant Statue"),
(-75731, -74890, 0, "Instant Statue");

DELETE FROM `spell_custom_attr` WHERE `entry`=75731;
INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES
(75731, 4096);


DELETE FROM `creature_queststarter` WHERE `quest`=10888;

DELETE FROM `quest_template_addon` WHERE `ID` IN (10888, 13430);
INSERT INTO `quest_template_addon` (`ID`, `ExclusiveGroup`) VALUES
(10888, 10888),
(13430, 10888);

UPDATE `quest_template_addon` SET `NextQuestID`=13430 WHERE `ID` IN (10884, 10885, 10886);

DELETE FROM `creature_queststarter` WHERE `quest` IN (11520, 11532, 11535, 11538, 11539, 11542, 11545);

DELETE FROM `creature_queststarter` WHERE `quest`=11534;
INSERT INTO `creature_queststarter` VALUES
(25034, 11534);



UPDATE `quest_template_addon` SET `PrevQuestId`=0 WHERE `Id`=11875;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19, 20) AND `SourceEntry`=11875;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 11875, 0, 0, 25, 0, 29354, 0, 0, 0, 0, 0, "", "Quest Gaining the Advantage requires Master Mining learned OR"),
(20, 0, 11875, 0, 0, 25, 0, 29354, 0, 0, 0, 0, 0, "", "Quest Gaining the Advantage requires Master Mining learned OR"),

(19, 0, 11875, 0, 1, 25, 0, 32678, 0, 0, 0, 0, 0, "", "Quest Gaining the Advantage requires Master Skinning learned OR"),
(20, 0, 11875, 0, 1, 25, 0, 32678, 0, 0, 0, 0, 0, "", "Quest Gaining the Advantage requires Master Skinning learned OR"),

(19, 0, 11875, 0, 2, 25, 0, 28695, 0, 0, 0, 0, 0, "", "Quest Gaining the Advantage requires Master Herbalism learned"),
(20, 0, 11875, 0, 2, 25, 0, 28695, 0, 0, 0, 0, 0, "", "Quest Gaining the Advantage requires Master Herbalism learned");



DELETE FROM `conditions` WHERE `SourceEntry` IN (22777, 22776, 22775) AND `SourceTypeOrReferenceId`=23;
INSERT INTO `conditions` VALUES
(23, 16444, 22777, 0, 0, 9, 0, 9067, 0, 0, 0, 0, 0, "", "Bundle of Fireworks can be bought only if on quest 'The Party Never Ends'"),
(23, 16443, 22776, 0, 0, 9, 0, 9067, 0, 0, 0, 0, 0, "", "Springpaw Appetizers can be bought only if on quest 'The Party Never Ends'"),
(23, 16442, 22775, 0, 0, 9, 0, 9067, 0, 0, 0, 0, 0, "", "Suntouched Special Reserve can be bought only if on quest 'The Party Never Ends'");

DELETE FROM `conditions` WHERE `SourceEntry` IN (1939, 1941, 1942) AND `SourceTypeOrReferenceId`=23;
INSERT INTO `conditions` VALUES
(23, 465, 1939, 0, 0, 9, 0, 116, 0, 0, 0, 0, 0, "", "Skin of Sweet Rum can be bought only if on quest 'Dry Times'"),
(23, 277, 1941, 0, 0, 9, 0, 116, 0, 0, 0, 0, 0, "", "Cask of Merlot can be bought only if on quest 'Dry Times'"),
(23, 274, 1942, 0, 0, 9, 0, 116, 0, 0, 0, 0, 0, "", "Bottle of Moonshine can be bought only if on quest 'Dry Times'");


UPDATE `quest_template_addon` SET `SpecialFlags`=0 WHERE `Id`=75;


SET @ENTRY_THE_LICH_KING := 25462;
SET @QUEST_IN_SERVICE_OF_THE_LICH_KING := 12593;

-- The Lich King Timed Actionlist
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = @ENTRY_THE_LICH_KING * 100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY_THE_LICH_KING * 100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 4, 14970, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'The Lich King - On Script - Play Sound 14970'),
(@ENTRY_THE_LICH_KING * 100, 9, 1, 0, 0, 0, 100, 0, 21000, 21000, 0, 0, 4, 14971, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'The Lich King - On Script - Play Sound 14971'),
(@ENTRY_THE_LICH_KING * 100, 9, 2, 0, 0, 0, 100, 0, 26000, 26000, 0, 0, 4, 14972, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'The Lich King - On Script - Play Sound 14972');

-- The Lich King Timed Actionlist Trigger
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = @ENTRY_THE_LICH_KING);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY_THE_LICH_KING, 0, 0, 0, 19, 0, 100, 0, @QUEST_IN_SERVICE_OF_THE_LICH_KING, 0, 0, 0, 80, 2546200, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Lich King - On Quest \'In service of The Lich King Taken\' - Run Script');

-- 'In service of The Lich King' quest details
DELETE FROM `quest_details` WHERE `ID` = @QUEST_IN_SERVICE_OF_THE_LICH_KING;
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `EmoteDelay1`, `VerifiedBuild`) VALUES
(@QUEST_IN_SERVICE_OF_THE_LICH_KING, 396, 397, 396, 396, 500, 1000, 1000, 1000, 20886);


-- Add sniffed gossip text to menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8356, 8371);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(8356, 0, 0, 'Reclaim Flanis\'s pack.', 19326,1,1,0,0,0,0,'',0),
(8371, 0, 0, 'Search the corpse for Kagrosh\'s pack.', 19400,1,1,0,0,0,0,'',0);

-- Migrate NPCs to use SmartAI / remove from C++ script
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (21727, 21725, 22112);
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 23489;

-- Create SmartAI
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid IN (21727, 21725, 22112));
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(21727, 0, 0, 1, 62, 0, 100, 0, 8356, 0, 0, 0, 11, 37244, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Flanis Swiftwing - On Gossip Option 0 Selected - Cast Spell'),
(21727, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Flanis Swiftwing - On Linked Action - Close Gossip'),
(21725, 0, 0, 1, 62, 0, 100, 0, 8371, 0, 0, 0, 11, 37245, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kagrosh - On Gossip Option 0 Selected - Cast Spell'),
(21725, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Kagrosh - On Linked Action - Close Gossip'),
(22112, 0, 0, 0, 19, 0, 100, 0, 10866, 0, 0, 0, 12, 11980, 1, 300000, 0, 0, 0, 8, 0, 0, 0, -4204.94, 316.397, 122.508, 1.309, 'Karynaku - On Quest Accepted - Summon Creature \'Zuluhed the Whacked\''),
(22112, 0, 1, 0, 19, 0, 100, 0, 10870, 0, 0, 0, 52, 649, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Karynaku - On Quest Accepted - Activate Taxi Path 649');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (8356, 8371, 8754);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,8356,0,0,0,2,0,30658,1,0,1,0,'','Flanis Swiftwing - Show gossip option 0 if player does not have item 30658 in inventory'),
(15,8356,0,0,0,9,0,10583,0,0,0,0,'','Flanis Swiftwing - Show gossip option 0 if player has accepted quest 10583'),
(15,8371,0,0,0,2,0,30659,1,0,1,0,'','Kagrosh - Show gossip option 0 if player does not have item 30659 in inventory'),
(15,8371,0,0,0,9,0,10601,0,0,0,0,'','Kagrosh - Show gossip option 0 if player has accepted quest 10601'),
(15,8754,0,0,0,5,0,1015,128,0,0,0,'','Drake Dealer Hurlunk - Show gossip option 0 if player is exalted with faction 1015');


SET @GUID := 12459;
DELETE FROM `creature` WHERE `guid` IN (@GUID);
INSERT INTO `creature` (`guid`, `id`, `map`, `SpawnMask`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@GUID, 6491, 571, 1, 0, 4105.362, -4818.6, 76.074, 0.149361, 7200, 0, 0);


UPDATE `creature_addon` SET `bytes1`=0, `auras`=45787 WHERE  `guid`=97150;

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128, `unit_flags`=`unit_flags`|768  WHERE  `entry` IN (26468, 26469, 26470);


UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE  `entry`IN(15186,16069,15358,16445,15361);

DELETE FROM `smart_scripts` WHERE `entryorguid`IN(15186,16069,15358,16445,15361) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=1518600 AND `source_type`=9;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(15186, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 450000, 900000, 80, 1518600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murky - OOC - Run Script'),
(15186, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 11, 24983, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murky - On Reset - Cast Baby Murloc Passive'),
(15186, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murky - On Reset - Set Emote State'),
(16069, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 450000, 900000, 80, 1518600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gurky - OOC - Run Script'),
(16069, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 11, 24983, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gurky - On Reset - Cast Baby Murloc Passive'),
(16069, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gurky - On Reset - Set Emote State'),
(15358, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 450000, 900000, 80, 1518600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lurky - OOC - Run Script'),
(15358, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 11, 24983, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lurky - On Reset - Cast Baby Murloc Passive'),
(15358, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lurky - On Reset - Set Emote State'),
(16445, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 450000, 900000, 80, 1518600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Terky - OOC - Run Script'),
(16445, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 11, 24983, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Terky - On Reset - Cast Baby Murloc Passive'),
(16445, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Terky - On Reset - Set Emote State'),
(15361, 0, 1, 0, 1, 0, 100, 0, 180000, 300000, 450000, 900000, 80, 1518600, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murki - OOC - Run Script'),
(15361, 0, 2, 3, 25, 0, 100, 0, 0, 0, 0, 0, 11, 24983, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murki - On Reset - Cast Baby Murloc Passive'),
(15361, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murki - On Reset - Set Emote State'),
(1518600, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baby Murloc - Script - Set Emote State'),
(1518600, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 25165, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baby Murloc - Script - Cast Baby Murloc Dance'),
(1518600, 9, 2, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Baby Murloc - Script - Set Emote State');


UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (1986, 1994);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1986, 1994) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1986, 0, 0, 0, 0, 0, 100, 0, 3000, 7000, 3000, 7000, 11, 6751, 32, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Webwood Spider - In Combat - Cast \'Weak Poison\''), 
(1994, 0, 0, 0, 0, 0, 100, 0, 4000, 9000, 4000, 9000, 11, 11918, 32, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Githyiss the Vile - In Combat - Cast \'Poison\'');

DELETE FROM `conditions` WHERE `SourceEntry`=4170 AND `SourceTypeOrReferenceId`=13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 4170, 0, 0, 31, 0, 3, 2775, 0, 0, 0, 0, "", "Cannon Ball can only hit \'Daggerspine Marauder\'");


DELETE FROM `creature_queststarter` WHERE `quest` IN (3763, 3789, 3790, 3803);
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES
(6735, 3763),
(6740, 3789),
(5111, 3790),
(4217, 3803);


ALTER TABLE `gossip_menu` ADD COLUMN `VerifiedBuild` SMALLINT(5) NOT NULL DEFAULT '0';
ALTER TABLE `gossip_menu_option` ADD COLUMN `VerifiedBuild` SMALLINT(5) NOT NULL DEFAULT '0';
UPDATE `gossip_menu` SET `VerifiedBuild`=-1 where `entry` >49999;


UPDATE `creature_template` SET `InhabitType`=1 WHERE `entry` IN (25613, 23665);


-- Meet Lieutenant Icehammer... - [A] http://wotlk.openwow.com/quest=11427

SET @GRYPHON:= 27886;

UPDATE creature_template SET AIName="SmartAI", InhabitType=5, speed_run=3 WHERE entry=@GRYPHON;
DELETE FROM smart_scripts WHERE entryorguid=@GRYPHON AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@GRYPHON,0,0,0,27,0,100,0,0,0,0,0,53,1,@GRYPHON,0,0,0,0,1,0,0,0,0,0,0,0,"Valgarde Gryphon - On Passenger Boarded - Start Waypoint"),
    (@GRYPHON,0,1,2,40,0,100,0,15,@GRYPHON,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Valgarde Gryphon - On Waypoint 15 Reached - Dismount"),
    (@GRYPHON,0,2,0,61,0,100,0,15,@GRYPHON,0,0,75,44795,0,0,0,0,0,17,0,30,0,0,0,0,0,"Valgarde Gryphon - On Waypoint 15 Reached - Add Aura 'Parachute'");

DELETE FROM waypoints WHERE entry=@GRYPHON;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@GRYPHON, 1, 611.694153, -5049.680176, 24.236082, 'Valgarde Gryphon'),
    (@GRYPHON, 2, 645.473206, -5088.019531, 30.966393, 'Valgarde Gryphon'),
    (@GRYPHON, 3, 712.810547, -5091.938965, 35.150776, 'Valgarde Gryphon'),
    (@GRYPHON, 4, 943.164795, -5001.226074, 51.646461, 'Valgarde Gryphon'),
    (@GRYPHON, 5, 1043.208984, -4975.551270, 42.536732, 'Valgarde Gryphon'),
    (@GRYPHON, 6, 1105.994263, -4981.366699, 44.616421, 'Valgarde Gryphon'),
    (@GRYPHON, 7, 1168.691772, -4956.152344, 43.580040, 'Valgarde Gryphon'),
    (@GRYPHON, 8, 1188.284546, -4949.069336, 43.889103, 'Valgarde Gryphon'),
    (@GRYPHON, 9, 1224.690918, -5034.330566, 45.493435, 'Valgarde Gryphon'),
    (@GRYPHON, 10, 1284.036011, -5064.889160, 70.936272, 'Valgarde Gryphon'),
    (@GRYPHON, 11, 1299.864014, -5123.960449, 92.312981, 'Valgarde Gryphon'),
    (@GRYPHON, 12, 1268.888550, -5172.307129, 125.225029, 'Valgarde Gryphon'),
    (@GRYPHON, 13, 1204.625854, -5202.031250, 162.438080, 'Valgarde Gryphon'),
    (@GRYPHON, 14, 1264.150391, -5293.074707, 194.687225, 'Valgarde Gryphon'),
    (@GRYPHON, 15, 1250.924927, -5318.654297, 202.334183, 'Valgarde Gryphon');

SET @ZOREK := 23728;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ZOREK;
DELETE FROM smart_scripts WHERE entryorguid=@ZOREK AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (@ZOREK, 0, 0, 0, 10, 0, 100, 0, 1, 50, 120000, 300000, 80, 2372800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Guard Captain Zorek - OOC LOS - Run Script'),
    (@ZOREK, 0, 1, 0, 19, 0, 100, 0, 11427, 0, 0, 0, 85, 49845, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Guard Captain Zorek - On quest accepted - Cast Valgarde Gryphon on Player');


-- Pushed Too Far -- [A] http://www.wowhead.com/quest=12869/pushed-too-far

SET @STORMPEAK_WYRM := 29753;
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@STORMPEAK_WYRM;
DELETE FROM smart_scripts WHERE entryorguid=@STORMPEAK_WYRM AND source_type=0;
INSERT INTO smart_scripts VALUES (@STORMPEAK_WYRM, 0, 0, 0, 0, 0, 100, 0, 2000, 3000, 6000, 6000, 11, 57833, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - Cast ''Frost Spit''');



-- Let Them Eat Crow - [H] http://www.wowhead.com/quest=11227/let-them-eat-crow

SET @PLAGUEHOUND := 23943;
UPDATE creature_template SET AIName='SmartAI' WHERE entry=@PLAGUEHOUND;
DELETE FROM smart_scripts WHERE entryorguid=@PLAGUEHOUND AND source_type=0;
INSERT INTO smart_scripts
VALUES    
    (@PLAGUEHOUND, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Just Summoned - Follow invoker'),
    (@PLAGUEHOUND, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 180000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Just Summoned - Follow invoker');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=42769;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (17, 0, 42769, 0, 0, 29, 0, @PLAGUEHOUND, 50, 0, 1, 0, 0, '', 'Hungry Plaguehound cannot be summoned near another Plaguehound');


-- Not On Our Watch -- [A][H] http://www.wowhead.com/quest=11871/not-on-our-watch

UPDATE `creature_template` SET `AIName`="SmartAI", lootid=25844, pickpocketloot=25844 WHERE `entry`=25844;
DELETE FROM smart_scripts WHERE entryorguid=25844 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (25844, 0, 0, 0, 2, 0, 100, 1, 0, 30, 0, 0, 11, 5915, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Northsea Thug - Between 0-30% Health - Cast \'Crazed\'');

DELETE FROM creature_loot_template WHERE Entry=25844 AND Item=35222;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
    (25844, 35222, 0, 100, 1, 1, 0, 1, 1, NULL);

-- Feeding Arngrim - [A][H] http://www.wowhead.com/quest=13046/feeding-arngrim

DELETE FROM smart_scripts WHERE entryorguid=30423 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (30423, 0, 0, 1, 2, 0, 100, 1, 0, 30, 0, 0, 11, 56732, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On 30% HP - Summon Arngrim'),
    (30423, 0, 1, 0, 61, 0, 100, 1, 0, 0, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On 30% HP - Set Root'),
    (30423, 0, 2, 3, 38, 0, 100, 0, 1, 1, 0, 0, 11, 56731, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - On Data Set 1 1 - Cast Kill Credit'),
    (30423, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Disembodied Jormungar - Linked with Previous Event - Despawn');

DELETE FROM smart_scripts WHERE entryorguid=30425 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
    (30425, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 19, 30423, 200, 0, 0, 0, 0, 0, 'Arngrim - On Spawn - Move to closest disembodied jormungar'),
    (30425, 0, 1, 2, 1, 0, 100, 0, 5000, 5000, 10000, 10000, 45, 1, 1, 0, 0, 0, 0, 19, 30423, 20, 0, 0, 0, 0, 0, 'Arngrim - OOC - Cast Ping Jormungar'),
    (30425, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Arngrim - OOC - Linked with Previous Event - Despawn After 5 seconds');





-- Vision of Air - [H] http://www.wowhead.com/quest=11631/vision-of-air

SET @SNARLFANG := 25339;
SET @TOTEM := 25455;
SET @BLUE_AURA := 2903;
SET @VISION_OF_GRIMWALKER := 25424;
SET @VISION_OF_KAGANISHU := 25456;
SET @VISION_OF_GRIMWALKER_SPIRIT := 25458;

UPDATE creature_template SET unit_flags=770 WHERE entry IN(@VISION_OF_GRIMWALKER_SPIRIT, @VISION_OF_GRIMWALKER, @VISION_OF_KAGANISHU);

DELETE FROM creature_text WHERE entry=@SNARLFANG AND groupid=2;
INSERT INTO creature_text VALUES(@SNARLFANG, 2, 0, "Oh no... they''ve shackled his spirit!", 12, 0, 100, 0, 0, 0, 24683, 0, 'Snarlfang');

DELETE FROM creature_text WHERE entry=@VISION_OF_KAGANISHU;
INSERT INTO creature_text VALUES(@VISION_OF_KAGANISHU, 0, 0, "KAGANISHU!", 12, 0, 100, 0, 0, 0, 24658, 0, 'Vision of Kaganishu');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@TOTEM;
DELETE FROM smart_scripts WHERE entryorguid=@TOTEM AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@TOTEM, 0, 0, 0, 8, 0, 100, 0, 45594, 0, 0, 0, 80, @TOTEM*100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Totem - On Spellhit - Start event'),
    (@TOTEM, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Totem - On Despawn - Respawn');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@TOTEM*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
    (@TOTEM*100,9,0,0,0,0,100,0,1000,1000,0,0,50,@BLUE_AURA,15,0,0,0,0,8,0,0,0,4523.73,5681.58,81.9056,5.15615,"Totam - On Script - Summon Blue aura"),
    (@TOTEM*100,9,1,0,0,0,100,0,500,500,0,0,12,@VISION_OF_GRIMWALKER,3,10000,0,0,0,8,0,0,0,4524.47,5682.17,81.9157,3.8092,"Totam - On Script - Summon Vision of Grimwalker"),
    (@TOTEM*100,9,2,0,0,0,100,0,0,0,0,0,12,@VISION_OF_KAGANISHU,3,10000,0,0,0,8,0,0,0,4522.75,5680.81,81.8933,0.73044,"Totam - On Script - Summon Vision of Kaganishu"),
    (@TOTEM*100,9,3,0,0,0,100,0,3000,3000,0,0,51,0,0,0,0,0,0,9,@VISION_OF_GRIMWALKER,0,30,0,0,0,0,"Totam - On Script - Spiritwalker dies"),
    (@TOTEM*100,9,4,0,0,0,100,0,0,0,0,0,1,0,4000,0,0,0,0,9,@VISION_OF_KAGANISHU,0,30,0,0,0,0,"Totam - On Script - Kaganishu Say Line 0"),
    (@TOTEM*100,9,5,0,0,0,100,0,2000,2000,0,0,12,@VISION_OF_GRIMWALKER_SPIRIT,3,10000,0,0,0,8,0,0,0,4524.47,5682.17,81.9157,3.8092,"Totam - On Script - Summon Vision of Grimwalker's spirit"),
    (@TOTEM*100,9,6,0,0,0,100,0,5000,5000,0,0,1,2,4000,0,0,0,0,9,@SNARLFANG,0,30,0,0,0,0,"Totam - On Script - Say Line 2");


-- -------------------------------------------
-- THE VIOLET HOLD
-- -------------------------------------------


-- Add missing reputation to creatures in heroic mode.

DELETE FROM creature_onkill_reputation WHERE creature_id IN(31502, 31501, 31503, 31504, 31493, 31486, 31490, 31491, 32192);
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`)
VALUES
    (31502, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31501, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31503, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31504, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31493, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31486, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31490, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31491, 1037, 1052, 7, 0, 15, 7, 0, 15, 1),
    (31492, 1037, 1052, 7, 0, 15, 7, 0, 15, 1);


DELETE FROM conditions WHERE SourceTypeOrReferenceId=23 AND SourceGroup=10857 AND SourceEntry IN(18169, 18170, 18171, 18172, 18173, 18182);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (23, 10857, 18169, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18169, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18169, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18170, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18170, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18170, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18171, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18171, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18171, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18172, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18172, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18172, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18173, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 10857, 18173, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 10857, 18173, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 10857, 18182, 0, 0, 8, 0, 5524, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5524 quest is rewarded OR'),
    (23, 10857, 18182, 0, 1, 8, 0, 5521, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5521 quest is rewarded OR'),
    (23, 10857, 18182, 0, 2, 8, 0, 5517, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5517 quest is rewarded');


DELETE FROM conditions WHERE SourceTypeOrReferenceId=23 AND SourceGroup=11536 AND SourceEntry IN(18169, 18170, 18171, 18172, 18173, 18182);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (23, 11536, 18169, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18169, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18169, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18170, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18170, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18170, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18171, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18171, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18171, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18172, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18172, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18172, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18173, 0, 0, 8, 0, 5504, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5504 quest is rewarded OR'),
    (23, 11536, 18173, 0, 1, 8, 0, 5507, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5507 quest is rewarded OR'),
    (23, 11536, 18173, 0, 2, 8, 0, 5513, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5513 quest is rewarded'),
    (23, 11536, 18182, 0, 0, 8, 0, 5524, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5524 quest is rewarded OR'),
    (23, 11536, 18182, 0, 1, 8, 0, 5521, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5521 quest is rewarded OR'),
    (23, 11536, 18182, 0, 2, 8, 0, 5517, 0, 0, 0, 0, 0, '', 'Lightspark - Only sell item if 5517 quest is rewarded');


UPDATE quest_template_addon SET ExclusiveGroup=5504 WHERE ID IN(5504, 5507, 5513);
UPDATE quest_template_addon SET ExclusiveGroup=5517 WHERE ID IN(5517, 5521, 5524);


-- The Storm King's Vengeance - [A][H] http://www.wowhead.com/quest=12919/the-storm-kings-vengeance

SET @GYMER := 29647;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@GYMER;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GYMER AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GYMER,0,0,1,62,0,100,0,9852,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gymer - On Gossip Option 2 Selected - Close Gossip"),
(@GYMER,0,1,2,61,0,100,0,9852,2,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Gossip Option 2 Selected - Say Line 7"),
(@GYMER,0,2,0,61,0,100,0,9852,2,0,0,85,55568,2,0,0,0,0,7,0,0,0,0,0,0,0,"Gymer - On Gossip Option 2 Selected - Invoker Cast 'Summon Gymer (Force)'"),
(@GYMER,0,3,0,1,0,100,0,10000,20000,30000,40000,1,1,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - Out of Combat - Say Line 1");

SET @GYMER_MOUNT := 29884;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@GYMER_MOUNT;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GYMER_MOUNT AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GYMER_MOUNT,0,0,1,27,0,100,1,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Passenger Boarded - Say Line 8 (No Repeat)"),
(@GYMER_MOUNT,0,1,0,61,0,100,0,0,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Passenger Boarded - Say Line 9 (No Repeat)"),
(@GYMER_MOUNT,0,2,0,28,0,100,1,0,0,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Passenger Removed - Say Line 10 (No Repeat)"),
(@GYMER_MOUNT,0,3,4,54,0,100,1,0,0,0,0,11,55461,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Just Summoned - Cast 'Storm's Fury' (No Repeat)"),
(@GYMER_MOUNT,0,4,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gymer - On Just Summoned - Set Reactstate Passive (No Repeat)");

DELETE FROM smart_scripts WHERE entryorguid=29647*100 AND source_type=9;

DELETE FROM spell_script_names WHERE spell_id=55430;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (55430, 'spell_gen_gymers_buddy');


-- Fire At Will! (10911)

DELETE FROM creature_addon WHERE guid IN(SELECT guid FROM creature WHERE id IN(22474, 22500));
DELETE FROM creature WHERE id IN(22474, 22500);
UPDATE creature_template SET unit_flags=0, modelid2=0, flags_extra=0 WHERE entry IN(22474, 22500); 
UPDATE creature_template SET modelid1=15880, modelid2=0, ScriptName="npc_deaths_door_wrap_gate" WHERE entry IN(22471, 22472);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39221;
INSERT INTO conditions VALUES (13, 1, 39221, 0, 0, 31, 0, 3, 22471, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 1, 39221, 0, 1, 31, 0, 3, 22472, 0, 0, 0, 0, '', '');


DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39219;
INSERT INTO conditions VALUES (13, 1, 39219, 0, 0, 29, 0, 22443, 15, 0, 0, 0, 0, '', '');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=39222;
INSERT INTO conditions VALUES (13, 1, 39222, 0, 0, 31, 0, 3, 22474, 0, 0, 0, 0, '', '');
INSERT INTO conditions VALUES (13, 1, 39222, 0, 1, 31, 0, 3, 22501, 0, 0, 0, 0, '', '');

DELETE FROM spell_script_names WHERE spell_id=39219;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
    (39219, 'spell_deaths_door_fel_cannon');

UPDATE creature SET spawntimesecs=20 WHERE id=22443;
UPDATE creature SET orientation=3.306122 WHERE guid=78793;
UPDATE creature SET orientation=5.952941 WHERE guid=78794;

