-- -------------------------------------------
-- ZANGARMARSH
-- -------------------------------------------


-- Fhwoor Smash! - [A][H] http://www.wowhead.com/quest=9729/fhwoor-smash

SET @FHWOOR := 17877;
DELETE FROM creature_text WHERE entry=@FHWOOR;

INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES 
    (@FHWOOR, 0, 0, 'Fhwoor go now, $N. Get ark, come back.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor'),
    (@FHWOOR, 1, 0, 'Take moment... Get ready.', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor'),
    (@FHWOOR, 2, 0, 'Uh oh...', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor'),
    (@FHWOOR, 3, 0, 'Fhwoor do good!', 12, 0, 100, 0, 0, 0, 0, 0, 'Fhwoor');

DELETE FROM waypoints WHERE entry=@FHWOOR;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES 
    (@FHWOOR, 1, 231.403, 8479.94, 17.9319, 'Fhwoor'),
    (@FHWOOR, 2, 215.654, 8469.71, 22.7522, 'Fhwoor'),
    (@FHWOOR, 3, 207.395, 8459.58, 25.083, 'Fhwoor'),
    (@FHWOOR, 4, 197.541, 8444.16, 24.9263, 'Fhwoor'),
    (@FHWOOR, 5, 188.792, 8428.69, 22.4734, 'Fhwoor'),
    (@FHWOOR, 6, 183.095, 8419.25, 23.4617, 'Fhwoor'),
    (@FHWOOR, 7, 170.883, 8406.63, 21.95, 'Fhwoor'),
    (@FHWOOR, 8, 167.028, 8394.64, 23.6626, 'Fhwoor'),
    (@FHWOOR, 9, 168.177, 8383.75, 20.5654, 'Fhwoor'),
    (@FHWOOR, 10, 171.686, 8359.03, 19.8141, 'Fhwoor'),
    (@FHWOOR, 11, 177.082, 8326.46, 20.7596, 'Fhwoor'),
    (@FHWOOR, 12, 170.066, 8301.61, 20.8413, 'Fhwoor'),
    (@FHWOOR, 13, 174.167, 8290.19, 18.5382, 'Fhwoor'),
    (@FHWOOR, 14, 192.921, 8262.22, 18.615, 'Fhwoor'),
    (@FHWOOR, 15, 211.22, 8245.58, 22.2009, 'Fhwoor'),
    (@FHWOOR, 16, 226.538, 8231.74, 20.0313, 'Fhwoor'),
    (@FHWOOR, 17, 239.977, 8219.84, 20.8419, 'Fhwoor'),
    (@FHWOOR, 18, 252.502, 8210.68, 18.7755, 'Fhwoor'),
    (@FHWOOR, 19, 271.605, 8205.75, 19.6679, 'Fhwoor'),
    (@FHWOOR, 20, 283.234, 8202.8, 22.1166, 'Fhwoor'),
    (@FHWOOR, 21, 318.232, 8180.02, 18.1585, 'Fhwoor'),
    (@FHWOOR, 22, 335.458, 8177.15, 18.1603, 'Fhwoor'),
    (@FHWOOR, 23, 352.245, 8180.53, 18.4126, 'Fhwoor'),
    (@FHWOOR, 24, 367.487, 8185.88, 22.213, 'Fhwoor'),
    (@FHWOOR, 25, 376.03, 8188.09, 23.8872, 'Fhwoor'),
    (@FHWOOR, 26, 387.559, 8188.89, 21.8357, 'Fhwoor'),
    (@FHWOOR, 27, 399.78, 8183.96, 18.2193, 'Fhwoor'),
    (@FHWOOR, 28, 413.746, 8171.34, 18.2933, 'Fhwoor'),
    (@FHWOOR, 29, 426.026, 8158.55, 19.1386, 'Fhwoor'),
    (@FHWOOR, 30, 444.048, 8152.09, 23.3402, 'Fhwoor'),
    (@FHWOOR, 31, 465.283, 8151.99, 22.213, 'Fhwoor'),
    (@FHWOOR, 32, 482.497, 8150.01, 20.1239, 'Fhwoor'),
    (@FHWOOR, 33, 521.832, 8154.16, 22.3108, 'Fhwoor'),
    (@FHWOOR, 34, 558.243, 8158.7, 23.6964, 'Fhwoor'),
    (@FHWOOR, 35, 550.27, 8161.78, 22.9976, 'Fhwoor'),
    (@FHWOOR, 36, 533.254, 8141.06, 22.2215, 'Fhwoor'),
    (@FHWOOR, 37, 505.911, 8135.08, 19.9296, 'Fhwoor'),
    (@FHWOOR, 38, 473.615, 8128.02, 22.5122, 'Fhwoor'),
    (@FHWOOR, 39, 445.697, 8128.57, 20.4449, 'Fhwoor'),
    (@FHWOOR, 40, 399.292, 8123.93, 18.1522, 'Fhwoor'),
    (@FHWOOR, 41, 363.179, 8107.19, 18.4227, 'Fhwoor'),
    (@FHWOOR, 42, 343.39, 8108.69, 17.3774, 'Fhwoor'),
    (@FHWOOR, 43, 327.772, 8134.22, 18.3628, 'Fhwoor'),
    (@FHWOOR, 44, 313.609, 8144.49, 21.2908, 'Fhwoor'),
    (@FHWOOR, 45, 295.733, 8153.19, 18.3259, 'Fhwoor'),
    (@FHWOOR, 46, 255.729, 8172.25, 17.3989, 'Fhwoor'),
    (@FHWOOR, 47, 242.091, 8178.74, 17.9129, 'Fhwoor'),
    (@FHWOOR, 48, 220.303, 8182.56, 19.5001, 'Fhwoor'),
    (@FHWOOR, 49, 206, 8202.45, 22.1064, 'Fhwoor'),
    (@FHWOOR, 50, 203.072, 8224.38, 25.2776, 'Fhwoor'),
    (@FHWOOR, 51, 200.892, 8237.23, 24.2757, 'Fhwoor'),
    (@FHWOOR, 52, 198.027, 8254.11, 19.9855, 'Fhwoor'),
    (@FHWOOR, 53, 176.841, 8285.87, 18.7444, 'Fhwoor'),
    (@FHWOOR, 54, 178.973, 8300.77, 18.6603, 'Fhwoor'),
    (@FHWOOR, 55, 181.472, 8318.23, 21.679, 'Fhwoor'),
    (@FHWOOR, 56, 184.381, 8335.63, 18.9092, 'Fhwoor'),
    (@FHWOOR, 57, 176.647, 8349.99, 18.6098, 'Fhwoor'),
    (@FHWOOR, 58, 173.367, 8370.8, 18.0483, 'Fhwoor'),
    (@FHWOOR, 59, 185.332, 8389.98, 18.5659, 'Fhwoor'),
    (@FHWOOR, 60, 200.3, 8408.49, 18.8142, 'Fhwoor'),
    (@FHWOOR, 61, 219.306, 8431.98, 20.4219, 'Fhwoor'),
    (@FHWOOR, 62, 227.407, 8442, 22.7788, 'Fhwoor'),
    (@FHWOOR, 63, 229.474, 8466.41, 18.564, 'Fhwoor'),
    (@FHWOOR, 64, 236.484, 8479.62, 18.1411, 'Fhwoor'),
    (@FHWOOR, 65, 246.831, 8482.4, 22.1621, 'Fhwoor'),
    (@FHWOOR, 66, 231.403, 8479.94, 17.9319, 'Fhwoor');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@FHWOOR;
DELETE FROM smart_scripts WHERE entryorguid=@FHWOOR AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@FHWOOR*100 AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@FHWOOR,0,0,1,19,0,100,0,9729,0,0,0,53,1,17877,0,9729,5000,2,7,0,0,0,0,0,0,0,"Fhwoor - On Quest '' Taken - Start Waypoint"),
    (@FHWOOR,0,1,0,61,0,100,0,9729,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Fhwoor - On Quest '' Taken - Say Line 0"),
    (@FHWOOR,0,2,0,40,0,100,0,1,0,0,0,54,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 1 Reached - Pause Waypoint"),
    (@FHWOOR,0,3,4,40,0,100,0,20,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 20 Reached - Pause Waypoint"),
    (@FHWOOR,0,4,5,61,0,100,0,20,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 20 Reached - Say Line 1"),
    (@FHWOOR,0,5,0,61,0,100,0,20,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 20 Reached - Set Run Off"),
    (@FHWOOR,0,6,0,40,0,100,0,34,0,0,0,54,13000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 34 Reached - Pause Waypoint"),
    (@FHWOOR,0,7,8,40,0,100,0,48,0,0,0,54,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 48 Reached - Pause Waypoint"),
    (@FHWOOR,0,8,9,61,0,100,0,48,0,0,0,66,2,0,0,0,0,0,8,0,0,0,0,0,0,3.07,"Fhwoor - On Waypoint 48 Reached - Set Orientation 3,07"),
    (@FHWOOR,0,9,10,61,0,100,0,48,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 48 Reached - Say Line 2"),
    (@FHWOOR,0,10,11,61,0,100,0,48,0,0,0,12,18154,1,240000,1,0,0,8,0,0,0,198.25,8184.2,22.68,6.26,"Fhwoor - On Waypoint 48 Reached - Summon Creature 'Ssslith'"),
    (@FHWOOR,0,11,12,61,0,100,0,48,0,0,0,12,18088,1,240000,1,0,0,8,0,0,0,198.18,8180.06,22.92,6.26,"Fhwoor - On Waypoint 48 Reached - Summon Creature 'Bloodscale Enchantress'"),
    (@FHWOOR,0,12,13,61,0,100,0,48,0,0,0,12,18089,1,240000,1,0,0,8,0,0,0,198.37,8190.78,22.28,6.26,"Fhwoor - On Waypoint 48 Reached - Summon Creature 'Bloodscale Slavedriver'"),
    (@FHWOOR,0,13,0,61,0,100,0,48,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 48 Reached - Set Run On"),
    (@FHWOOR,0,14,15,40,0,100,0,65,0,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 65 Reached - Pause Waypoint"),
    (@FHWOOR,0,15,0,61,0,100,0,65,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 65 Reached - Set Run Off"),
    (@FHWOOR,0,16,17,40,0,100,0,66,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 66 Reached - Set Orientation Home Position"),
    (@FHWOOR,0,17,18,61,0,100,0,66,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 66 Reached - Set Run On"),
    (@FHWOOR,0,18,0,61,0,100,0,66,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - On Waypoint 66 Reached - Say Line 3"),
    (@FHWOOR,0,19,0,56,0,100,0,34,0,0,0,99,3,0,0,0,0,0,20,182082,20,0,0,0,0,0,"Fhwoor - On Waypoint Resumed - Set Lootstate Deactivated"),
    (@FHWOOR,0,20,0,56,0,100,0,65,0,0,0,50,182082,60,0,0,0,0,8,0,0,0,252.56,8479.38,22.975,0,"Fhwoor - On Waypoint Resumed - Summon Gameobject 'The Ark of Ssslith'"),
    (@FHWOOR,0,21,0,0,0,100,0,4000,7000,10000,20000,11,31277,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - In Combat - Cast 'Stomp'"),
    (@FHWOOR,0,22,0,0,0,100,0,11000,12000,15000,25000,11,31964,0,0,0,0,0,1,0,0,0,0,0,0,0,"Fhwoor - In Combat - Cast 'Thundershock'");


-- Lost in Action - [A][H] http://www.wowhead.com/quest=9738/lost-in-action

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(7520, 7540);
UPDATE creature_template SET AIName='', ScriptName='npc_natrualist_bite' WHERE entry=17893;
DELETE FROM smart_scripts WHERE entryorguid=17893 AND source_type=0;

-- Quest: WANTED: Boss Grog'ak -- http://wotlk.openwow.com/quest=9820
UPDATE `quest_template` SET `AllowableRaces`=690 WHERE  `ID`=9820;

