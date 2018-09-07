-- -------------------------------------------
-- NETHERSTORM
-- -------------------------------------------


-- Captain Tyralius -- [A][H] http://www.wowhead.com/quest=10422/captain-tyralius


UPDATE gameobject_template SET data2=180000 WHERE entry=184588;


-- Dr. Boom! -- [A][H] http://www.wowhead.com/quest=10221/dr-boom

UPDATE creature_template SET unit_flags=33284 WHERE entry=20284;


-- Troublesome Distractions -- [A][H] http://www.wowhead.com/quest=10273/troublesome-distractions

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup=8071;
INSERT INTO conditions VALUES (15, 8071, 0, 0, 0, 9, 0, 10273, 0, 0, 0, 0, 0, '', 'Only show gossip menu if player has Troublesome Distractions quest log.');

DELETE FROM gossip_menu_option WHERE menu_id=8071;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, action_menu_id, action_poi_id, box_coded, box_money, box_text, BoxBroadcastTextID)
VALUES
    (8071, 0, 0, 'Wind Trader Marid, I\'ve returned with more information on the nether drakes. I\'m prepared to be your business partner, and for an extra sum, I\'ll take care of that troublesome elf and her human friend.', 0, 1, 1, 0, 0, 0, 0, '', 0);

SET @ENTRY := 20071;
UPDATE creature_template SET flags_extra=0, speed_walk=1.5 WHERE entry=@ENTRY;

DELETE FROM creature_text WHERE entry=@ENTRY AND groupid IN(0, 1);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (@ENTRY, 0, 0, 'Let us hold our discussion in a more... private place. Follow me, $N.', 12, 0, 100, 0, 0, 0, 0, 0, 'Wind Trader Marid'),
    (@ENTRY, 1, 0, 'You didn\'t really think I\'d do business with you again, did you? Sometimes, the best way to return to profitability is to know when to cut your losses.', 12, 0, 100, 0, 0, 0, 0, 0, 'Wind Trader Marid');

DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES
    (@ENTRY, 1, 4283.52, 2226.99, 124.217, 'Wind Trader Marid'),
    (@ENTRY, 2, 4289.39, 2217.21, 124.098, 'Wind Trader Marid'),
    (@ENTRY, 3, 4291.87, 2212.83, 121.275, 'Wind Trader Marid'),
    (@ENTRY, 4, 4295.08, 2207.17, 119.304, 'Wind Trader Marid'),
    (@ENTRY, 5, 4302.43, 2205.13, 120.59, 'Wind Trader Marid'),
    (@ENTRY, 6, 4307.42, 2196.81, 119.483, 'Wind Trader Marid'),
    (@ENTRY, 7, 4313.26, 2192.73, 117.658, 'Wind Trader Marid'),
    (@ENTRY, 8, 4316.16, 2187.62, 114.884, 'Wind Trader Marid'),
    (@ENTRY, 9, 4318.19, 2181.1, 116.967, 'Wind Trader Marid'),
    (@ENTRY, 10, 4315.18, 2173.19, 118.304, 'Wind Trader Marid'),
    (@ENTRY, 11, 4313.72, 2167.93, 118.03, 'Wind Trader Marid'),
    (@ENTRY, 12, 4316.97, 2162.18, 120.626, 'Wind Trader Marid'),
    (@ENTRY, 13, 4316.23, 2156.77, 123.907, 'Wind Trader Marid'),
    (@ENTRY, 14, 4310.42, 2147.52, 127.422, 'Wind Trader Marid'),
    (@ENTRY, 15, 4307.3, 2140.1, 129.336, 'Wind Trader Marid');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,25,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Reset - Set Flags Immune To Players & Immune To NPCs"),
    (@ENTRY,0,1,2,25,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Reset - Set Npc Flags Gossip & Questgiver"),
    (@ENTRY,0,2,0,25,0,100,0,0,0,0,0,2,1731,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Reset - Set Faction 1731"),
    (@ENTRY,0,3,4,62,0,100,0,8071,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Say Line 0"),
    (@ENTRY,0,4,5,61,0,100,0,8071,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Close Gossip"),
    (@ENTRY,0,5,6,61,0,100,0,8071,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Store Targetlist"),
    (@ENTRY,0,6,7,61,0,100,0,8071,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Set Npc Flag "),
    (@ENTRY,0,7,8,61,0,100,0,8071,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Remove Flags Immune To Players & Immune To NPCs"),
    (@ENTRY,0,8,0,61,0,100,0,8071,0,0,0,67,1,3000,3000,0,0,100,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Gossip Option 0 Selected - Create Timed Event"),
    (@ENTRY,0,9,0,59,0,100,0,1,0,0,0,53,0,20071,0,0,0,1,12,1,0,0,0,0,0,0,"Wind Trader Marid - On Timed Event 1 Triggered - Start Waypoint"),
    (@ENTRY,0,10,11,40,0,100,0,15,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,"Wind Trader Marid - On Waypoint 15 Reached - Set Orientation 0"),
    (@ENTRY,0,11,12,61,0,100,0,15,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Waypoint 15 Reached - Say Line 1"),
    (@ENTRY,0,12,0,61,0,100,0,15,0,0,0,67,2,4000,4000,0,0,100,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Waypoint 15 Reached - Create Timed Event"),
    (@ENTRY,0,13,14,59,0,100,0,2,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wind Trader Marid - On Timed Event 2 Triggered - Set Faction 14"),
    (@ENTRY,0,14,15,61,0,100,0,2,0,0,0,12,20101,4,10000,0,0,0,8,0,0,0,4327.28,2133.79,126.42,2.88,"Wind Trader Marid - On Timed Event 2 Triggered - Summon Creature 'Nether-Stalker'"),
    (@ENTRY,0,15,16,61,0,100,0,2,0,0,0,12,20101,4,10000,0,0,0,8,0,0,0,4328.97,2140.08,124.66,2.88,"Wind Trader Marid - On Timed Event 2 Triggered - Summon Creature 'Nether-Stalker'"),
    (@ENTRY,0,16,0,61,0,100,0,2,0,0,0,8,2,0,0,0,0,0,1,20,0,0,0,0,0,0,"Wind Trader Marid - On Timed Event 2 Triggered - Set Reactstate Aggressive"),
    (@ENTRY,0,17,0,17,0,100,1,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wind Trader Marid - On Summoned Unit - Say Line 0 (No Repeat)");


-- Building a Perimeter -- [A][H] http://www.wowhead.com/quest=10240/building-a-perimeter

SET @ENTRY := 19866;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,8,0,100,0,34646,0,0,0,33,19866,0,0,0,0,0,7,0,0,0,0,0,0,0,"Invis East KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Quest Credit ''"),
    (@ENTRY,0,1,2,61,0,100,0,34646,0,0,0,99,3,0,0,0,0,0,20,183947,10,0,0,0,0,0,"Invis East KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Set Lootstate Deactivated"),
    (@ENTRY,0,2,0,61,0,100,0,34646,0,0,0,50,183948,180,0,0,0,0,1,0,0,0,0,0,0,0,"Invis East KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Summon Gameobject 'Ward Effect'");

SET @ENTRY := 19867;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,8,0,100,0,34646,0,0,0,33,19867,0,0,0,0,0,7,0,0,0,0,0,0,0,"Invis NE KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Quest Credit ''"),
    (@ENTRY,0,1,2,61,0,100,0,34646,0,0,0,99,3,0,0,0,0,0,20,183947,10,0,0,0,0,0,"Invis NE KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Set Lootstate Deactivated"),
    (@ENTRY,0,2,0,61,0,100,0,34646,0,0,0,50,183948,180,0,0,0,0,1,0,0,0,0,0,0,0,"Invis NE KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Summon Gameobject 'Ward Effect'");

SET @ENTRY := 19868;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,1,8,0,100,0,34646,0,0,0,33,19868,0,0,0,0,0,7,0,0,0,0,0,0,0,"Invis West KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Quest Credit ''"),
    (@ENTRY,0,1,2,61,0,100,0,34646,0,0,0,99,3,0,0,0,0,0,20,183947,10,0,0,0,0,0,"Invis West KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Set Lootstate Deactivated"),
    (@ENTRY,0,2,0,61,0,100,0,34646,0,0,0,50,183948,180,0,0,0,0,1,0,0,0,0,0,0,0,"Invis West KV Rune - On Spellhit 'Activate Kirin'Var Rune' - Summon Gameobject 'Ward Effect'");


-- You, Robot -- [A][H] http://www.wowhead.com/quest=10248/you-robot

DELETE FROM creature_text WHERE entry IN(19832, 19851);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (19832, 0, 0, 'Oh no! What\'s that? Quickly, defend us with the Scrap Reaver X6000!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Doctor Vomisa, Ph.T.'),
    (19851, 0, 0, 'I AM DEATH! PREPARE YOUR TOWN FOR ANNIHILATION!', 14, 0, 100, 0, 0, 0, 0, 0, 'Negatron');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=34630;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorTextId, ScriptName, Comment)
VALUES
    (17,0,34630,0,0,23,0,3873,0,0,0,0,'','Scrap Reaver X6000 can only be active inside the Proving Grounds (Netherstorm)');

UPDATE creature_template SET unit_flags=0 WHERE entry=19849;
UPDATE gameobject_template SET displayId=0 WHERE entry=183982;

SET @ENTRY := 19832;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Doctor Vomisa, Ph.T. - On Data Set 1 1 - Say Line 0");

SET @ENTRY := 19851;
UPDATE creature_template SET unit_flags=256+512 WHERE entry=@ENTRY;
UPDATE creature_template SET speed_run=2.5 WHERE entry=@ENTRY;
DELETE FROM waypoints WHERE entry=@ENTRY;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES
    (@ENTRY, 1, 3131.96, 3274.67, 110.71, 'Negatron'),
    (@ENTRY, 2, 3125.74, 3290.35, 108.03, 'Negatron'),
    (@ENTRY, 3, 3116.73, 3312.99, 110.34, 'Negatron'),
    (@ENTRY, 4, 3108.58, 3340.73, 106.56, 'Negatron'),
    (@ENTRY, 5, 3097.43, 3385.81, 105.35, 'Negatron');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,0,9,0,100,0,8,25,15000,21000,11,35570,0,0,0,0,0,2,0,0,0,0,0,0,0,"Negatron - Within 8-25 Range - Cast 'Charge'"),
    (@ENTRY,0,1,0,9,0,100,0,0,5,15000,21000,11,34625,0,0,0,0,0,2,0,0,0,0,0,0,0,"Negatron - Within 0-5 Range - Cast 'Demolish'"),
    (@ENTRY,0,2,0,0,0,100,0,15000,19000,21000,25000,11,35565,0,0,0,0,0,2,0,0,0,0,0,0,0,"Negatron - In Combat - Cast 'Earthquake'"),
    (@ENTRY,0,3,0,2,0,100,0,0,50,16000,22000,11,34624,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - Between 0-50% Health - Cast 'Frenzy'"),
    (@ENTRY,0,4,0,6,0,100,0,0,0,0,0,15,10248,0,0,0,0,0,7,0,0,0,0,0,0,0,"Negatron - On Just Died - Quest Credit ''"),
    (@ENTRY,0,5,6,38,0,100,0,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Data Set 1 0 - Set Active On"),
    (@ENTRY,0,6,0,61,0,100,0,1,0,0,0,53,1,19851,0,0,0,1,1,0,0,0,0,0,0,0,"Negatron - On Data Set 1 0 - Start Waypoint"),
    (@ENTRY,0,7,8,40,0,100,0,5,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Waypoint 5 Reached - Remove Flags Immune To Players & Immune To NPC's"),
    (@ENTRY,0,8,0,61,0,100,0,5,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Waypoint 5 Reached - Say Line 0"),
    (@ENTRY,0,9,10,25,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Reset - Set Active Off"),
    (@ENTRY,0,10,0,25,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Negatron - On Reset - Set Flags Immune To Players & Immune To NPC's");

SET @ENTRY := 19849;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,8,0,100,0,34630,0,0,0,45,1,0,0,0,0,100,19,19851,200,0,0,0,0,0,"Scrap Reaver X6000 - On Spellhit 'Scrap Reaver X6000' - Set Data 1 0"),
    (@ENTRY,0,1,0,61,0,100,0,34630,0,0,0,45,1,1,0,0,0,0,19,19832,200,0,0,0,0,0,"Scrap Reaver X6000 - On Spellhit 'Scrap Reaver X6000' - Set Data 1 1");


-- Fel Reavers, No Thanks! -- [A][H] http://www.wowhead.com/quest=10855/fel-reavers-no-thanks

UPDATE quest_template_addon SET PrevQuestID=-10855 WHERE id=10850;

DELETE FROM `creature_text` WHERE `entry` = 22293;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `TextRange`, `comment`, `BroadcastTextId`) VALUES
(22293, 0, 0, "%s begins to sputter as its engine malfunctions.", 16, 0, 100, 0, 0, 0, 0, "Inactive Fel Reaver", 20103);

-- Creature Script - Inactive Fel Reaver
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 22293);
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 2229300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(22293, 0, 0, 0, 20, 0, 100, 0, 10850, 0, 0, 0, 80, 2229300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Quest complete - Action list'),
(2229300, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Say text'),
(2229300, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list  - Remove npc flag'),
(2229300, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Random Move'),
(2229300, 9, 3, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 33, 22293, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Give Credit'),
(2229300, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Kill Itself');
    

-- Fel Reavers, No Thanks! -- [A][H] http://www.wowhead.com/quest=10855/fel-reavers-no-thanks
-- Quest items required for the repeatable (can't be picked up): Nether Gas In a Fel Fire Engine

UPDATE creature_loot_template SET Chance=60 WHERE Item=31653 AND entry=16949;


-- Dimensius the All-Devouring -- [A][H] http://www.wowhead.com/quest=10439/dimensius-the-all-devouring

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(8230, 8228);
INSERT INTO conditions
VALUES 
    (15, 8230, 0, 0, 0, 9, 0, 10439, 0, 0, 0, 0, 0, '', 'Only show gossip menu 0 if player has Dimensius the All-Devouring quest log.'),
    (15, 8228, 0, 0, 0, 9, 0, 10439, 0, 0, 0, 0, 0, '', 'Only show gossip menu 1 if player has Dimensius the All-Devouring quest log.');

DELETE FROM gossip_menu WHERE (entry=8230 AND text_id=10232) OR (entry=8228 AND text_id=10229);
INSERT INTO gossip_menu (entry, text_id) VALUES
(8230, 10232),
(8228, 10229);

DELETE FROM gossip_menu_option WHERE (menu_id=8230 AND OptionBroadcastTextID=18641) OR (menu_id=8228 AND OptionBroadcastTextID=18639);
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, OptionBroadcastTextID, option_id, npc_option_npcflag, action_menu_id, action_poi_id, box_coded, box_money, box_text, BoxBroadcastTextID)
VALUES    
    (8230, 0, 0, 'I am ready. Let\'s make history!', 18641, 1, 1, 0, 0, 0, 0, '', 0),
    (8228, 0, 0, 'I am that fleshling, Saeed. Let\'s go!', 18639, 1, 1, 0, 0, 0, 0, '', 0);

SET @SAEED := 20985;
UPDATE creature_template SET AIName='', ScriptName='npc_captain_saeed' WHERE entry=@SAEED;
DELETE FROM script_waypoint WHERE entry=@SAEED;
INSERT INTO script_waypoint (entry, pointid, location_x, location_y, location_z, waittime, point_comment)
VALUES
    (@SAEED, 1, 4254.23, 2108.69, 144.247, 0, ""),
    (@SAEED, 2, 4239.06, 2114.86, 146.952, 0, ""),
    (@SAEED, 3, 4225.45, 2118.14, 152.244, 0, ""),
    (@SAEED, 4, 4211.32, 2107.93, 156.698, 0, ""),
    (@SAEED, 5, 4206.56, 2104.48, 160.319, 0, ""),
    (@SAEED, 6, 4178.02, 2075.21, 163.157, 0, ""),
    (@SAEED, 7, 4175.38, 2061.21, 167.984, 0, ""),
    (@SAEED, 8, 4188.63, 2023.8, 184.663, 0, ""),
    (@SAEED, 9, 4173.8, 1993.33, 204.116, 0, ""),
    (@SAEED, 10, 4142.52, 1973.01, 218.002, 0, ""),
    (@SAEED, 11, 4101.52, 2007.56, 230.967, 0, ""),
    (@SAEED, 12, 4092.63, 2026.51, 236.429, 0, ""),
    (@SAEED, 13, 4059.49, 2060.78, 250.161, 0, ""),
    (@SAEED, 14, 4032.52, 2077.06, 254.449, 0, ""),
    (@SAEED, 15, 4001.34, 2099.2, 254.212, 0, ""),
    (@SAEED, 16, 3993.95, 2090.21, 254.32, 0, ""),
    (@SAEED, 17, 3989.37, 2083.43, 256.391, 0, ""),
    (@SAEED, 18, 3951.24, 2024.99, 257.005, 0, ""),
    (@SAEED, 19, 3936.40, 2003.0, 255.68, 0, "");

SET @DIMENSIUS := 19554;
SET @SPAWN := 21780;
DELETE FROM creature_text WHERE entry IN(@DIMENSIUS, @SAEED, @SPAWN);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (@DIMENSIUS, 0, 0, 'You only hasten the inevitable. In time, all will be devoured!', 14, 0, 100, 0, 0, 0, 0, 1, 'Dimensius the All-Devouring'),
    (@DIMENSIUS, 1, 0, 'Time only has meaning to mortals, insect. Dimensius is infinite!', 14, 0, 100, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring'),
    (@SAEED, 0, 0, 'You heard the fleshling! MOVE OUT!', 12, 0, 100, 15, 0, 0, 0, 0, 'Captain Saeed'),
    (@SAEED, 1, 0, 'Tell me when you are ready. We will attack on your command.', 12, 0, 100, 0, 0, 0, 0, 0, 'Captain Saeed'),
    (@SAEED, 2, 0, 'It\'s now or never, soldiers! Let\'s do this! For K\'aresh! For the Protectorate!', 12, 0, 100, 0, 0, 0, 0, 0, 'Captain Saeed'),
    (@SAEED, 3, 0, 'The time for your destruction has finally come, Dimensius!', 12, 0, 100, 0, 0, 0, 0, 0, 'Captain Saeed'),
    (@SPAWN, 0, 0, '%s begins channeling power into Dimensius.', 16, 0, 100, 0, 0, 0, 0, 0, 'Spawn of Dimensius');

DELETE FROM spell_script_names WHERE spell_id=36500;
INSERT INTO spell_script_names (spell_id, ScriptName)
VALUES
    (36500, 'spell_gen_throw_back');

UPDATE creature_template SET unit_flags=unit_flags|4, AIName='SmartAI', ScriptName='' WHERE entry=@SPAWN;
DELETE FROM smart_scripts WHERE entryorguid =@SPAWN AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@SPAWN, 0, 0, 0, 37, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On AI Init - Set React Passive'),
    (@SPAWN, 0, 1, 2, 60, 0, 100, 257, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 100, 0, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On Update - Attack Start'),
    (@SPAWN, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37450, 2, 0, 0, 0, 0, 19, @DIMENSIUS, 50, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On Update - Cast Dimensius Feeding'),
    (@SPAWN, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn of Dimensius - On Update - Say Line 0');

SET @AVENGER := 21805;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@AVENGER;
DELETE FROM smart_scripts WHERE entryorguid=@AVENGER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@AVENGER, 0, 0, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 11, 36500, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Avenger - In Combat - Cast Glaive');

SET @DEFENDER := 20984;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@DEFENDER;
DELETE FROM smart_scripts WHERE entryorguid=@DEFENDER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@DEFENDER, 0, 0, 0, 0, 0, 100, 0, 0, 1000, 3000, 4000, 11, 36500, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Defender - In Combat - Cast Glaive'),
    (@DEFENDER, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 10000, 20000, 11, 31553, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Defender - In Combat - Cast Hamstring');

SET @REGENERATOR := 21783;
UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@REGENERATOR;
DELETE FROM smart_scripts WHERE entryorguid=@REGENERATOR AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@REGENERATOR,0,0,0,0,0,100,0,0,1000,3000,4000,11,34232,0,0,0,0,0,2,0,0,0,0,0,0,0,"Protectorate Regenerator - In Combat - Cast 'Holy Bolt'");

UPDATE creature_model_info SET CombatReach=7 WHERE DisplayID=18988;
UPDATE creature SET id=@DIMENSIUS WHERE id=21035;
UPDATE creature_template SET unit_flags=unit_flags|4, AIName='NullCreatureAI', ScriptName='' WHERE entry=21035;
UPDATE creature_template SET unit_flags=unit_flags|4, AIName='SmartAI', ScriptName='' WHERE entry=@DIMENSIUS;
DELETE FROM smart_scripts WHERE entryorguid IN(@DIMENSIUS, 21035) AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@DIMENSIUS, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 35939, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring - On Reset - Cast Dimensius Transform'),
    (@DIMENSIUS, 0, 1, 0, 0, 0, 100, 0, 3000, 4000, 7000, 10000, 11, 37500, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring - In Combat - Cast Shadow Spiral'),
    (@DIMENSIUS, 0, 2, 0, 0, 0, 100, 0, 5000, 7000, 10000, 16000, 11, 37412, 0, 0, 0, 0, 0, 5, 50, 1, 0, 0, 0, 0, 0, 'Dimensius the All-Devouring - In Combat - Cast Shadow Vault'),
    (@DIMENSIUS, 0, 3, 4, 2, 0, 100, 1, 0, 75, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 28, 0, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature'),
    (@DIMENSIUS, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, -28, 0, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature'),
    (@DIMENSIUS, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 28, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature'),
    (@DIMENSIUS, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, @SPAWN, 4, 30000, 0, 0, 0, 1, 0, 0, 0, 0, -28, 0, 0, 'Dimensius the All-Devouring - Between Health 0-75% - Summon Creature');

UPDATE creature SET spawntimesecs=120 WHERE id IN(@AVENGER, @DEFENDER, @REGENERATOR, @SAEED, @DIMENSIUS);


-- Electro-Shock Goodness! -- [A][H] http://www.wowhead.com/quest=10411/electro-shock-goodness

DELETE FROM spell_dbc WHERE Id IN(35687, 35688);
INSERT INTO spell_dbc (Id, Dispel, Mechanic, Attributes, AttributesEx, AttributesEx2, AttributesEx3, AttributesEx4, AttributesEx5, AttributesEx6, AttributesEx7, Stances, StancesNot, Targets, CastingTimeIndex, AuraInterruptFlags, ProcFlags, ProcChance, ProcCharges, MaxLevel, BaseLevel, SpellLevel, DurationIndex, RangeIndex, StackAmount, EquippedItemClass, EquippedItemSubClassMask, EquippedItemInventoryTypeMask, Effect1, Effect2, Effect3, EffectDieSides1, EffectDieSides2, EffectDieSides3, EffectRealPointsPerLevel1, EffectRealPointsPerLevel2, EffectRealPointsPerLevel3, EffectBasePoints1, EffectBasePoints2, EffectBasePoints3, EffectMechanic1, EffectMechanic2, EffectMechanic3, EffectImplicitTargetA1, EffectImplicitTargetA2, EffectImplicitTargetA3, EffectImplicitTargetB1, EffectImplicitTargetB2, EffectImplicitTargetB3, EffectRadiusIndex1, EffectRadiusIndex2, EffectRadiusIndex3, EffectApplyAuraName1, EffectApplyAuraName2, EffectApplyAuraName3, EffectAmplitude1, EffectAmplitude2, EffectAmplitude3, EffectMultipleValue1, EffectMultipleValue2, EffectMultipleValue3, EffectItemType1, EffectItemType2, EffectItemType3, EffectMiscValue1, EffectMiscValue2, EffectMiscValue3, EffectMiscValueB1, EffectMiscValueB2, EffectMiscValueB3, EffectTriggerSpell1, EffectTriggerSpell2, EffectTriggerSpell3, EffectSpellClassMaskA1, EffectSpellClassMaskA2, EffectSpellClassMaskA3, EffectSpellClassMaskB1, EffectSpellClassMaskB2, EffectSpellClassMaskB3, EffectSpellClassMaskC1, EffectSpellClassMaskC2, EffectSpellClassMaskC3, MaxTargetLevel, SpellFamilyName, SpellFamilyFlags1, SpellFamilyFlags2, SpellFamilyFlags3, MaxAffectedTargets, DmgClass, PreventionType, DmgMultiplier1, DmgMultiplier2, DmgMultiplier3, AreaGroupId, SchoolMask, Comment)
VALUES
    (35687, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 101, 0, 0, 0, 0, 25, 1, 0, -1, 0, 0, 28, 0, 0, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20806, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'Summon Seeping Sludge Globule'),
    (35688, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 101, 0, 0, 0, 0, 25, 1, 0, -1, 0, 0, 28, 0, 0, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20805, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'Summon Void Waste Globule');

SET @VOIDWASTE := 20778;
SET @SEEPINGSLUDGE := 20501;
SET @VWGLOBULE := 20805;
SET @SSGLOBULE := 20806;
SET @SEEPINGOOZE := 21264;

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=35686;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES 
    (17, 0, 35686, 0, 0, 31, 1, 3, @VOIDWASTE, 0, 0, 0, 0, '', 'Requires Void Waste'),
    (17, 0, 35686, 0, 1, 31, 1, 3, @SEEPINGSLUDGE, 0, 0, 0, 0, '', 'Requires Seeping Sludge');

DELETE FROM creature_text WHERE entry IN(@VOIDWASTE, @SEEPINGSLUDGE);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES
    (@VOIDWASTE, 0, 0, '%s breaks down into globules!', 16, 0, 100, 0, 0, 0, 0, 0, 'Void Waste'),
    (@SEEPINGSLUDGE, 0, 0, '%s breaks down into globules!', 16, 0, 100, 0, 0, 0, 0, 0, 'Seeping Sludge'),
    (@SEEPINGSLUDGE, 1, 0, '%s attempts to split in two!', 16, 0, 100, 0, 0, 0, 0, 0, 'Seeping Sludge');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN(@VOIDWASTE, @SEEPINGSLUDGE, @VWGLOBULE, @SSGLOBULE, @SEEPINGOOZE);
DELETE FROM smart_scripts WHERE entryorguid IN(@VOIDWASTE, @SEEPINGSLUDGE, @VWGLOBULE, @SSGLOBULE, @SEEPINGOOZE) AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@VOIDWASTE, 0, 0, 0, 0, 0, 100, 0, 3000, 10000, 19000, 30000, 11, 36519, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - In Combat - Cast Toxic Burst'),
    (@VOIDWASTE, 0, 1, 2, 8, 0, 100, 0, 35686, 0, 0, 0, 11, 35688, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - On Spell Hit - Cast Summon Void Waste Globule'),
    (@VOIDWASTE, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - On Spell Hit - Say Line 0'),
    (@VOIDWASTE, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste - On Spell Hit - Die'),
    (@SEEPINGSLUDGE, 0, 0, 0, 11, 0, 100, 0, 0, 0, 0, 0, 11, 35242, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Respawn - Cast Darkstalker Birth'),
    (@SEEPINGSLUDGE, 0, 1, 2, 2, 0, 50, 1, 0, 30, 0, 0, 11, 36465, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - Between Health 0-30% - Cast Seeping Split'),
    (@SEEPINGSLUDGE, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - Between Health 0-30% - Say Line 1'),
    (@SEEPINGSLUDGE, 0, 3, 0, 17, 0, 100, 1, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - Just Summoned - Despawn'),
    (@SEEPINGSLUDGE, 0, 4, 5, 8, 0, 100, 0, 35686, 0, 0, 0, 11, 35687, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Spell Hit - Cast Summon Seeping Sludge Globule'),
    (@SEEPINGSLUDGE, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Spell Hit - Say Line 0'),
    (@SEEPINGSLUDGE, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge - On Spell Hit - Die'),
    (@SEEPINGOOZE, 0, 0, 0, 1, 0, 100, 1, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 'Seeping Ooze - Out of Combat - Attack Start'),
    (@SEEPINGOOZE, 0, 1, 0, 1, 0, 100, 1, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Ooze - Out of Combat - Despawn'),
    (@VWGLOBULE, 0, 0, 0, 1, 0, 100, 1, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 'Void Waste Globule - Out of Combat - Attack Start'),
    (@VWGLOBULE, 0, 1, 0, 1, 0, 100, 1, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Waste Globule - Out of Combat - Despawn'),
    (@SSGLOBULE, 0, 0, 0, 1, 0, 100, 1, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 40, 0, 0, 0, 0, 0, 0, 'Seeping Sludge Globule - Out of Combat - Attack Start'),
    (@SSGLOBULE, 0, 1, 0, 1, 0, 100, 1, 10000, 10000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Seeping Sludge Globule - Out of Combat - Despawn');


-- On Nethery Wings - [A][H] http://www.wowhead.com/quest=10438/on-nethery-wings

SET @VOIDCONDUIT := 20899;
UPDATE creature_template SET RegenHealth=0 WHERE entry=@VOIDCONDUIT;
UPDATE gameobject_template SET data1=90 WHERE entry=184643;

UPDATE creature_template SET unit_flags=unit_flags|4, AIName='SmartAI', ScriptName='' WHERE entry=@VOIDCONDUIT;
DELETE FROM smart_scripts WHERE entryorguid=@VOIDCONDUIT AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@VOIDCONDUIT, 0, 0, 1, 8, 0, 100, 0, 35734, 0, 0, 0, 33, @VOIDCONDUIT, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Void Conduit - On Spell Hit - Kill Credit'),
    (@VOIDCONDUIT, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 10, 69964, 19554, 1, 0, 0, 0, 0, 'Void Conduit - On Spell Hit - Say Line 0 Target'),
    (@VOIDCONDUIT, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Void Conduit - On Spell Hit - Die');

-- Sabotage the Warp-Gate! - http://www.wowhead.com/quest=10310
UPDATE `creature_template` SET `ScriptName`='npc_drijya' WHERE  `entry`=20281;
DELETE FROM `script_waypoint` WHERE entry=20281;
INSERT INTO `script_waypoint` VALUES
(20281, 0, 3096.416, 2801.408, 118.149, 7000, 'SAY_DRIJYA_START'),
(20281, 1, 3096.516, 2801.065, 118.128, 0, 'SAY_DRIJYA_1'),
(20281, 2, 3099.995, 2796.665, 118.118, 0, ''),
(20281, 3, 3098.759, 2786.174, 117.125, 0, ''),
(20281, 4, 3087.792, 2754.602, 115.441, 0, ''),
(20281, 5, 3080.718, 2730.793, 115.930, 9000, 'SAY_DRIJYA_2'),
(20281, 6, 3060.235, 2731.306, 115.122, 0, ''),
(20281, 7, 3050.863, 2727.388, 114.054, 0, ''),
(20281, 8, 3050.863, 2727.388, 114.054, 8000, 'SAY_DRIJYA_4'),
(20281, 9, 3055.008, 2724.972, 113.687, 0, ''),
(20281, 10, 3053.777, 2718.427, 113.684, 0, ''),
(20281, 11, 3028.622, 2693.375, 114.670, 0, ''),
(20281, 12, 3022.430, 2695.297, 113.406, 0, ''),
(20281, 13, 3022.430, 2695.297, 113.406, 8000, 'SAY_DRIJYA_5'),
(20281, 14, 3025.463, 2700.755, 113.514, 0, ''),
(20281, 15, 3011.336, 2716.782, 113.691, 0, ''),
(20281, 16, 3010.882, 2726.991, 114.239, 0, ''),
(20281, 17, 3009.178, 2729.083, 114.324, 0, ''),
(20281, 18, 3009.178, 2729.083, 114.324, 15000, 'SAY_DRIJYA_6'),
(20281, 19, 3009.178, 2729.083, 114.324, 6000, 'SPELL_EXPLOSION_VISUAL'),
(20281, 20, 3009.178, 2729.083, 114.324, 8000, 'SAY_DRIJYA_7'),
(20281, 21, 3033.888, 2736.437, 114.369, 0, ''),
(20281, 22, 3071.492, 2741.502, 116.462, 0, ''),
(20281, 23, 3087.792, 2754.602, 115.441, 0, ''),
(20281, 24, 3094.505, 2770.198, 115.744, 0, ''),
(20281, 25, 3103.510, 2784.362, 116.857, 0, ''),
(20281, 26, 3099.995, 2796.665, 118.118, 0, ''),
(20281, 27, 3096.290, 2801.027, 118.096, 0, 'SAY_DRIJYA_COMPLETE');

DELETE FROM `creature_text` WHERE `entry`=20281;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(20281, 0, 0, 'Very well.  Before we head down there, take a moment to prepare yourself.', 12, 0, 100, 1, 0, 0, 17940, 'Drijya'),
(20281, 1, 0, 'Let\'s proceed at a brisk pace.', 12, 0, 100, 0, 0, 0, 17941, 'Drijya'),
(20281, 2, 0, 'We\'ll start at that first energy pylon, straight ahead.  Remember, try to keep them off of me.', 12, 0, 100, 1, 0, 0, 17942, 'Drijya'),
(20281, 3, 0, 'Keep them off me!', 12, 0, 100, 0, 0, 0, 17950, 'Drijya'),
(20281, 4, 0, 'I\'m done with this pylon.  On to the next.', 12, 0, 100, 1, 0, 0, 17943, 'Drijya'),
(20281, 5, 0, 'Alright, pylon two down.  Now for the heat manifold.', 12, 0, 100, 1, 0, 0, 17944, 'Drijya'),
(20281, 6, 0, 'That should do it.  The teleporter should blow any second now!', 12, 0, 100, 5, 0, 0, 17945, 'Drijya'),
(20281, 7, 0, 'Ok, now let\'s get out of here!', 12, 0, 100, 1, 0, 0, 1617, 'Drijya'),
(20281, 8, 0, 'Thank you, $n!  I couldn''t have done it without you.  You''ll let Gahruj know?', 12, 0, 100, 1, 0, 0, 17949, 'Drijya');


-- Escape from the Staging Grounds - [A][H] http://www.wowhead.com/quest=10425/escape-from-the-staging-grounds

SET @ENTRY := 20763;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY;
UPDATE creature SET spawntimesecs=300 WHERE id=@ENTRY;
DELETE FROM smart_scripts WHERE entryorguid=@ENTRY AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@ENTRY,0,0,1,19,0,100,0,10425,0,0,0,1,0,0,0,0,0,0,21,10,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Say Line 0"),
    (@ENTRY,0,1,2,61,0,100,0,10425,0,0,0,53,0,20763,0,0,0,2,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Start Waypoint"),
    (@ENTRY,0,2,14,61,0,100,0,10425,0,0,0,64,1,0,0,0,0,0,21,10,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Store Targetlist"),
    (@ENTRY,0,7,0,40,0,100,0,16,20763,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 16 Reached - Pause Waypoint"),
    (@ENTRY,0,8,10,40,0,100,0,17,20763,0,0,15,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 17 Reached - Quest Credit ''"),
    (@ENTRY,0,9,0,6,0,100,0,0,0,0,0,6,10425,0,0,0,0,0,12,1,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Just Died - Fail Quest ''"),
    (@ENTRY,0,10,0,61,0,100,0,17,20763,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 17 Reached - Say Line 1"),
    (@ENTRY,0,11,12,40,0,100,0,18,20763,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Say Line 2"),
    (@ENTRY,0,12,13,61,0,100,0,18,20763,0,0,11,35517,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Cast 'Teleport'"),
    (@ENTRY,0,13,0,61,0,100,0,18,20763,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Waypoint 18 Reached - Despawn In 3000 ms"),
    (@ENTRY,0,14,0,61,0,100,0,10425,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Quest '' Taken - Set Npc Flag "),
    (@ENTRY,0,15,0,11,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - On Respawn - Set Npc Flag Questgiver"),
    (@ENTRY,0,16,0,0,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - In Combat - Remove Npc Flag Questgiver"),
    (@ENTRY,0,17,0,1,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Captured Protectorate Vanguard - Out of Combat - Add Npc Flag Questgiver");


-- Delivering the Message - [A][H] http://www.wowhead.com/quest=10406/delivering-the-message

SET @DEMOLITIONIST := 20802;
SET @COMMANDER := 20482;
SET @ENERGYCELL := 20755;
UPDATE creature_template_addon SET bytes2=0, auras=35681 WHERE entry=@ENERGYCELL;
DELETE FROM creature_text WHERE entry IN(@DEMOLITIONIST, 20474);
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 0, 0, 'Let''s do this... Just keep me covered and I''ll deliver the package.', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 1, 0, 'I''m under attack! I repeat, I am under attack!', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 2, 0, 'By the second sun of K''aresh, look at this place! I can only imagine what Salhadaar is planning. Come on, let''s keep going.', 12, 0, 100, 5, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 3, 0, 'Look there, fleshling! Salhadaar''s conduits! He''s keeping well fed...', 12, 0, 100, 25, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 4, 0, 'Alright, keep me protected while I plant this disruptor. This shouldn''t take very long...', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 5, 0, 'Done! Back up! Back up!', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (@DEMOLITIONIST, 6, 0, 'Looks like my work here is done. Report to the holo-image of Ameer over at the transporter.', 12, 0, 100, 0, 0, 0, 0, 0, 'Protectorate Demolitionist');
INSERT INTO creature_text VALUES (20474, 0, 0, 'Protect the conduit! Stop the intruders!', 12, 0, 100, 0, 0, 0, 0, 0, 'Ethereum Nexus-Stalker');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry IN(@COMMANDER, @DEMOLITIONIST, @ENERGYCELL);
UPDATE creature_template SET speed_walk=1.5, speed_run=1, RegenHealth=0 WHERE entry=@DEMOLITIONIST;
UPDATE creature_template SET scale=2 WHERE entry=@ENERGYCELL;
DELETE FROM smart_scripts WHERE entryorguid IN(@COMMANDER, @DEMOLITIONIST, @ENERGYCELL) AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@DEMOLITIONIST*100 AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES 
    (@COMMANDER, 0, 0, 0, 19, 0, 100, 0, 10406, 0, 0, 0, 85, 35679, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Quest Accept - Invoker Cast'),
    (@DEMOLITIONIST, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 53, 0, @DEMOLITIONIST, 0, 10406, 5000, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On AI Init - Start WP'),
    (@DEMOLITIONIST, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On AI Init - Talk'),
    (@DEMOLITIONIST, 0, 2, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Aggro - Talk'),
    (@DEMOLITIONIST, 0, 3, 0, 40, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reach - Set Home Pos'),
    (@DEMOLITIONIST, 0, 4, 5, 40, 0, 100, 0, 6, 0, 0, 0, 54, 6000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 6, 7, 40, 0, 100, 0, 11, 0, 0, 0, 54, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 8, 9, 40, 0, 100, 0, 14, 0, 0, 0, 54, 30000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - WP Pause'),
    (@DEMOLITIONIST, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @DEMOLITIONIST*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Script9'),
    (@DEMOLITIONIST, 0, 10, 11, 56, 0, 100, 0, 14, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Resume - Talk'),
    (@DEMOLITIONIST, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Resume - Remove Emote State'),
    (@DEMOLITIONIST, 0, 12, 13, 40, 0, 100, 0, 15, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Talk'),
    (@DEMOLITIONIST, 0, 13, 14, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, @ENERGYCELL, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Set Data'),
    (@DEMOLITIONIST, 0, 14, 15, 61, 0, 100, 0, 0, 0, 0, 0, 11, 35682, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Cast Spell'),
    (@DEMOLITIONIST, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 15, 10406, 0, 0, 0, 0, 0, 17, 0, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On WP Reached - Complete quest'),
    (@DEMOLITIONIST*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 469, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Set Emote State'),
    (@DEMOLITIONIST*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Talk'),
    (@DEMOLITIONIST*100, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3864, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@DEMOLITIONIST*100, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3867, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@DEMOLITIONIST*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 20474, 50, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - Script9 - Talk'),
    (@DEMOLITIONIST*100, 9, 5, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 12, 20474, 4, 40000, 0, 1, 0, 8, 0, 0, 0, 3870, 2341.1, 115.4, 4.9, 'Protectorate Demolitionist - Script9 - Summon Creature'),
    (@ENERGYCELL, 0, 0, 0, 38, 0, 100, 0, 1, 1, 0, 0, 11, 40799, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Protectorate Demolitionist - On Spell Hit - Cast Spell');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@COMMANDER;
INSERT INTO conditions VALUES (22, 1, @COMMANDER, 0, 0, 1, 0, 35679, 1, 0, 1, 0, 0, '', 'Requires Player without aura');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=35682;
INSERT INTO conditions VALUES (13, 1, 35682, 0, 0, 31, 0, 3, @ENERGYCELL, 0, 0, 0, 0, '', 'Target Ethereum Energy Cell');
INSERT INTO conditions VALUES (13, 1, 35682, 0, 1, 31, 0, 3, 20769, 0, 0, 0, 0, '', 'Target Salaadin Energy Ball');

DELETE FROM waypoints WHERE entry=@DEMOLITIONIST;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@DEMOLITIONIST, 1, 4015.68, 2322.49, 113.825, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 2, 4007.63, 2323.53, 111.428, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 3, 3998.41, 2324.73, 113.084, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 4, 3973, 2328.02, 114.082, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 5, 3951.87, 2328.36, 113.983, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 6, 3939.16, 2330.01, 112.224, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 7, 3931.58, 2332.9, 110.878, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 8, 3922.88, 2336.22, 112.603, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 9, 3910.8, 2345.43, 114.132, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 10, 3885.74, 2364.52, 114.827, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 11, 3874.4, 2383.68, 113.784, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 12, 3871.9, 2360.65, 114.97, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 13, 3866.8, 2341.7, 115.65, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 14, 3872.97, 2321.61, 114.52, 'Protectorate Demolitionist'),
    (@DEMOLITIONIST, 15, 3866.8, 2341.7, 115.65, 'Protectorate Demolitionist');


-- It's a Fel Reaver, But with Heart - [A][H] http://www.wowhead.com/quest=10309/its-a-fel-reaver-but-with-heart

SET @FEL := 20243; -- Scrapped Fel Reaver
SET @Zaxxis := 20287; -- Zaxxis Ambusher

DELETE FROM `creature_text` WHERE `entry` = @FEL;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(@FEL,0,0,"The %s's mechanical heart begins to beat softly.",16,0,100,0,0,0,18271,0,"Scrapped Fel Reaver - Zapped Emote");

DELETE FROM `smart_scripts` WHERE `entryorguid` = @FEL AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@FEL,0, 0,1,  8, 0,100,0, 35282,     0,     0,     0, 19,    256,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Remove Flags Immune To Players"),
(@FEL,0, 1,2, 61, 0,100,0,     0,     0,     0,     0,  1,      0, 1000,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Say Line 0"),
(@FEL,0, 2,0, 61, 0,100,0,     0,     0,     0,     0, 18, 131076,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Spellhit 'Fel Zapper' - Set Flags Disable Movement & Pacified"),
(@FEL,0, 3,0,  0, 0,100,0,  2000,  2000, 30000, 30000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2547.08, 3982.24, 131.39, 2.01, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 4,0,  0, 0,100,0, 17000, 17000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2537.70, 3975.96, 130.40, 1.58, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 5,0,  0, 0,100,0, 32000, 32000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2506.46, 4008.93, 133.80, 6.19, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 6,0,  0, 0,100,0, 60000, 60000, 45000, 45000, 12,@Zaxxis,    2, 180000, 1,0,0, 8,      0, 0,   0, 2537.30, 4027.11, 135.50, 4.30, "Scrapped Fel Reaver - In Combat - Summon Creature 'Zaxxis Ambusher'"),
(@FEL,0, 7,0,  6, 0,100,0,     0,     0,     0,     0, 51,      0,    0,      0, 0,0,0, 9,@Zaxxis, 0, 150,       0,       0,      0,    0, "Scrapped Fel Reaver - On Just Died - Kill Target"),
(@FEL,0, 8,0,  7, 0,100,0,     0,     0,     0,     0, 51,      0,    0,      0, 0,0,0, 9,@Zaxxis, 0, 150,       0,       0,      0,    0, "Scrapped Fel Reaver - On Evade - Kill Target"),
(@FEL,0, 9,0, 11, 0,100,0,     0,     0,     0,     0, 75,  39311,    0,      0, 0,0,0, 1,      0, 0,   0,       0,       0,      0,    0, "Scrapped Fel Reaver - On Respawn - Add Aura 'Scrapped Fel Reaver Transform'");

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @Zaxxis;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Zaxxis AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@Zaxxis,0, 0,0, 54, 0,100,0, 0,0,0,0, 49, 0,0,0,0,0,0, 21, 85, 0,0,0,0,0,0, 'Zaxxis Ambusher - On Just Summoned - Start Attacking');


-- Socrethar
UPDATE `creature_template` SET `unit_flags`=32832 WHERE  `entry`=20132;

-- Becoming a Spellfire Tailor, re-assing the script to the quest item.
UPDATE `item_template` SET `Scriptname`="item_nether_wraith_beacon" WHERE `entry`=31742;