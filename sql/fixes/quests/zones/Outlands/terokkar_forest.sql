-- -------------------------------------------
-- TEROKKAR FOREST
-- -------------------------------------------


-- Skywing -- http://wotlk.openwow.com/quest=10898
DELETE FROM `script_waypoint` WHERE `entry`=22424;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`) VALUES 
(22424, 1, -3620.54, 4164.57, 1.81, 0, 'SKYWING_START'),
(22424, 2, -3624.78, 4149.65, 7.44, 0, ''),
(22424, 3, -3630.3, 4124.84, 21.28, 0, ''),
(22424, 4, -3629.14, 4093.65, 44.35, 0, ''),
(22424, 5, -3626.34, 4080.29, 52.39, 0, ''),
(22424, 6, -3619.35, 4063.86, 60.86, 3000, 'SAY_SKYWING_TREE_DOWN'),
(22424, 7, -3615.09, 4054.17, 62.46, 0, ''),
(22424, 8, -3611.39, 4046.6, 65.07, 0, ''),
(22424, 9, -3606.68, 4040.5, 66, 0, ''),
(22424, 10, -3600.88, 4038.69, 67.14, 0, ''),
(22424, 11, -3597.88, 4033.84, 68.53, 0, ''),
(22424, 12, -3602.19, 4027.89, 69.36, 0, ''),
(22424, 13, -3609.85, 4028.37, 70.78, 0, ''),
(22424, 14, -3613.01, 4031.1, 72.14, 0, ''),
(22424, 15, -3613.18, 4035.63, 73.52, 0, ''),
(22424, 16, -3609.84, 4039.73, 75.25, 0, ''),
(22424, 17, -3604.55, 4040.12, 77.01, 0, ''),
(22424, 18, -3600.61, 4036.03, 78.84, 0, ''),
(22424, 19, -3602.63, 4029.99, 81.01, 0, ''),
(22424, 20, -3608.87, 4028.64, 83.27, 0, ''),
(22424, 21, -3612.53, 4032.74, 85.24, 0, ''),
(22424, 22, -3611.08, 4038.13, 87.31, 0, ''),
(22424, 23, -3605.09, 4039.35, 89.55, 0, ''),
(22424, 24, -3601.87, 4035.44, 91.64, 0, ''),
(22424, 25, -3603.08, 4030.58, 93.66, 0, ''),
(22424, 26, -3608.47, 4029.23, 95.91, 0, ''),
(22424, 27, -3611.68, 4033.35, 98.09, 0, ''),
(22424, 28, -3609.51, 4038.25, 100.45, 0, ''),
(22424, 29, -3604.54, 4038.01, 102.72, 0, ''),
(22424, 30, -3602.4, 4033.48, 105.12, 0, ''),
(22424, 31, -3606.17, 4029.69, 107.63, 0, ''),
(22424, 32, -3609.93, 4031.26, 109.53, 0, ''),
(22424, 33, -3609.38, 4035.86, 110.67, 0, ''),
(22424, 34, -3603.58, 4043.03, 112.89, 0, ''),
(22424, 35, -3600.99, 4046.49, 111.81, 0, ''),
(22424, 36, -3602.32, 4051.77, 111.81, 3000, 'SAY_SKYWING_TREE_UP'),
(22424, 37, -3609.55, 4055.95, 112, 0, ''),
(22424, 38, -3620.93, 4043.77, 111.99, 0, ''),
(22424, 39, -3622.44, 4038.95, 111.99, 0, ''),
(22424, 40, -3621.64, 4025.39, 111.99, 0, ''),
(22424, 41, -3609.62, 4015.2, 111.99, 0, ''),
(22424, 42, -3598.37, 4017.72, 111.99, 0, ''),
(22424, 43, -3590.21, 4026.62, 111.99, 0, ''),
(22424, 44, -3586.55, 4034.13, 112, 0, ''),
(22424, 45, -3580.39, 4033.46, 112, 0, ''),
(22424, 46, -3568.83, 4032.53, 107.16, 0, ''),
(22424, 47, -3554.81, 4031.23, 105.31, 0, ''),
(22424, 48, -3544.39, 4030.1, 106.58, 0, ''),
(22424, 49, -3531.91, 4029.25, 111.7, 0, ''),
(22424, 50, -3523.5, 4030.24, 112.47, 0, ''),
(22424, 51, -3517.48, 4037.42, 112.66, 0, ''),
(22424, 52, -3510.4, 4040.77, 112.92, 0, ''),
(22424, 53, -3503.83, 4041.35, 113.17, 0, ''),
(22424, 54, -3498.31, 4040.65, 113.11, 0, ''),
(22424, 55, -3494.05, 4031.67, 113.11, 0, ''),
(22424, 56, -3487.71, 4025.58, 113.12, 0, ''),
(22424, 57, -3500.42, 4012.93, 113.11, 0, ''),
(22424, 58, -3510.86, 4010.15, 113.1, 0, ''),
(22424, 59, -3518.07, 4008.62, 112.97, 0, ''),
(22424, 60, -3524.74, 4014.55, 112.41, 2000, 'SAY_SKYWING_JUMP'),
(22424, 61, -3537.81, 4008.59, 92.53, 0, ''),
(22424, 62, -3546.25, 4008.81, 92.79, 0, ''),
(22424, 63, -3552.07, 4006.48, 92.84, 0, ''),
(22424, 64, -3556.29, 4000.14, 92.92, 0, ''),
(22424, 65, -3556.16, 3991.24, 92.92, 0, ''),
(22424, 66, -3551.48, 3984.28, 92.91, 0, ''),
(22424, 67, -3542.9, 3981.64, 92.91, 0, ''),
(22424, 68, -3534.82, 3983.98, 92.92, 0, ''),
(22424, 69, -3530.58, 3989.91, 92.85, 0, ''),
(22424, 70, -3529.85, 3998.77, 92.59, 0, ''),
(22424, 71, -3534.15, 4008.45, 92.34, 0, ''),
(22424, 72, -3532.87, 4012.97, 91.64, 0, ''),
(22424, 73, -3530.57, 4023.42, 86.82, 0, ''),
(22424, 74, -3528.24, 4033.91, 85.69, 0, ''),
(22424, 75, -3526.22, 4043.75, 87.26, 0, ''),
(22424, 76, -3523.84, 4054.29, 92.42, 0, ''),
(22424, 77, -3522.44, 4059.06, 92.92, 0, ''),
(22424, 78, -3514.26, 4060.72, 92.92, 0, ''),
(22424, 79, -3507.76, 4065.21, 92.92, 0, ''),
(22424, 80, -3503.24, 4076.63, 92.92, 0, 'SAY_SKYWING_SUMMON'),
(22424, 81, -3504.23, 4080.47, 92.92, 7000, 'SPELL_TRANSFORM'),
(22424, 82, -3504.23, 4080.47, 92.92, 20000, 'SAY_SKYWING_END');

DELETE FROM `creature_text` WHERE `entry`=22424;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(22424, 0, 0, '%s squawks and heads toward Veil Shalas. Hurry and follow!', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 1, 0, '%s pauses briefly before the tree and then heads inside.', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 2, 0, '%s seems to be looking for something. He wants you to follow.', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 3, 0, '%s flies to the platform below! You\'d better jump if you want to keep up. Hurry!', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 4, 0, '%s bellows a loud squawk!', 16, 0, 100, 0, 0, 0, 'SKYWING'),
(22424, 5, 0, 'Free at last from that horrible curse! Thank you! Please send word to Rilak the Redeemed that I am okay. My mission lies in Skettis. Terokk must be defeated!', 12, 0, 100, 0, 0, 0, 'SKYWING');

UPDATE `creature_template` SET `ScriptName`='npc_bird_skywing' WHERE  `entry`=22424;

-- Luanga the Imprisoner
SET @ENTRY := 18533;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32924,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Power of Kran\'aish on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,1000,3000,40000,45000,11,6535,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Lightning Cloud'),
(@ENTRY,0,2,0,0,0,100,0,9000,11000,9000,12000,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shock'),
(@ENTRY,0,3,0,0,0,100,0,4000,9000,9000,14000,11,12058,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Chain Lightning');

-- The Stones of Vekh'nir - http://wotlk.openwow.com/quest=10565
DELETE FROM `spell_script_names` WHERE `spell_id`=37172;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(37172, 'spell_q10565_imbue_crystal');


-- Someone Else's Hard Work Pays Off - [A][H] http://www.wowhead.com/quest=10218/someone-elses-hard-work-pays-off

SET @SHAHEEN := 19671;
SET @XIRAXIS := 19666;
SET @LABORER := 19672;
SET @CONTROLPANEL := 183877;

DELETE FROM creature_text WHERE entry IN(@SHAHEEN, @XIRAXIS);
INSERT INTO creature_text (entry, groupid, id, text, type, language, probability, emote, duration, sound, BroadcastTextId, TextRange, comment)
VALUES    
    (@SHAHEEN, 0, 0, 'This should\'t take very long. Just watch my back as I empty these nether collectors.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 1, 0, 'Fantastic! Let\'s move on, shall we?', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 2, 0, 'Looking at these energy levels, Shaffar was set to make a killing!', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 3, 0, 'That should do it...', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 4, 0, 'Hrm, now where is the next collector?', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 5, 0, 'Ah, there it is. Follow me, fleshling.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 6, 0, 'There can\'t be too many more of these collectors. Just keep me safe as I do my job.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 7, 0, 'What do we have here? I thought you said the area was secure? This is now the third attack? If we make it out of here, I will definitely be deducting this from your reward. Now don\'t just stand there, destroy them so I can get to that collector.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 8, 0, 'We\'re close to the exit. I\'ll let you rest for about thirty seconds, but then we\'re out of here.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 9, 0, 'Are you ready to go?', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 10, 0, 'Ok break time is OVER. Let\'s go!', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 11, 0, 'Oh really? And what might that be?', 12, 0, 100, 1, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 12, 0, 'He was right, you know. I\'ll have to take that tag-line for my own... It\'s not like he\'ll have a use for it anymore!', 12, 0, 100, 1, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 13, 0, 'Thanks and good luck!', 12, 0, 100, 1, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 20, 0, '%s checks to make sure his body is intact.', 16, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 21, 0, 'You made it! Well done, $r. Now if you\'ll excuse me, I have to get the rest of our crew inside.', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 22, 0, '%s expertly manipulates the control panel.', 16, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 23, 0, 'Let\'s not waste any time! Take anything that isn\'t nailed down to the floor and teleport directly to Stormspire! Chop chop!', 12, 0, 100, 0, 0, 0, 0, 0, 'Cryo-Engineer Sha\'heen'),
    (@XIRAXIS, 0, 0, 'Bravo! Bravo! Good show… I couldn\'t convince you to work for me, could I? No, I suppose the needless slaughter of my employees might negatively impact your employment application.', 14, 0, 100, 0, 0, 0, 0, 0, 'Shadow Lord Xiraxis'),
    (@XIRAXIS, 1, 0, 'Your plan was a good one, Sha\'heen, and you would have gotten away with it if not for one thing...', 12, 0, 100, 1, 0, 0, 0, 0, 'Shadow Lord Xiraxis'),
    (@XIRAXIS, 2, 0, 'Never underestimate the other ethereal\'s greed!', 12, 0, 100, 15, 0, 0, 0, 0, 'Shadow Lord Xiraxis');

UPDATE gameobject_template SET AIName='SmartGameObjectAI', ScriptName='' WHERE entry=@CONTROLPANEL;
DELETE FROM smart_scripts WHERE entryorguid=@CONTROLPANEL AND source_type=1;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@CONTROLPANEL, 1, 0, 0, 62, 0, 100, 1, 8023, 0, 0, 0, 12, @SHAHEEN, 8, 0, 0, 0, 0, 8, 0, 0, 0, -351.345, -69.7118, -0.875432, 4.34587, 'Ethereal Transporter Control Panel - On Gossip Option 0 Selected - Summon Cryo-Engineer Sha heen'),
    (@CONTROLPANEL, 1, 1, 0, 62, 0, 100, 0, 8023, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Ethereal Transporter Control Panel - On Gossip Option 0 Selected - Close Gossip');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@SHAHEEN;
UPDATE creature_template SET speed_walk=2, speed_run=3 WHERE entry=@SHAHEEN;
DELETE FROM smart_scripts WHERE entryorguid=@SHAHEEN AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid IN (@SHAHEEN*100+00,@SHAHEEN*100+01,@SHAHEEN*100+02,@SHAHEEN*100+03,@SHAHEEN*100+04,@SHAHEEN*100+05,@SHAHEEN*100+06,@SHAHEEN*100+07) AND source_type=9;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@SHAHEEN,0,0,0,37,0,100,0,0,0,0,0,80,@SHAHEEN*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Initialize - Run Script"),
    (@SHAHEEN,0,1,0,17,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Summoned Unit - Store Targetlist"),
    (@SHAHEEN,0,2,0,19,0,100,0,10218,0,0,0,53,0,19671,0,0,0,1,7,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Quest '' Taken - Start Waypoint"),
    (@SHAHEEN,0,3,4,40,0,100,0,1,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 1 Reached - Pause Waypoint"),
    (@SHAHEEN,0,4,0,61,0,100,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 1 Reached - Say Line 0"),
    (@SHAHEEN,0,5,6,40,0,100,0,3,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 3 Reached - Pause Waypoint"),
    (@SHAHEEN,0,6,0,61,0,100,0,3,0,0,0,80,@SHAHEEN*100+01,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 3 Reached - Run Script"),
    (@SHAHEEN,0,7,8,40,0,100,0,15,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 15 Reached - Pause Waypoint"),
    (@SHAHEEN,0,8,0,61,0,100,0,15,0,0,0,80,@SHAHEEN*100+02,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 15 Reached - Run Script"),
    (@SHAHEEN,0,9,10,40,0,100,0,28,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 28 Reached - Pause Waypoint"),
    (@SHAHEEN,0,10,0,61,0,100,0,28,0,0,0,80,@SHAHEEN*100+03,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 28 Reached - Run Script"),
    (@SHAHEEN,0,11,12,40,0,100,0,37,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 37 Reached - Pause Waypoint"),
    (@SHAHEEN,0,12,0,61,0,100,0,37,0,0,0,80,@SHAHEEN*100+04,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 37 Reached - Run Script"),
    (@SHAHEEN,0,13,14,40,0,100,0,52,0,0,0,12,19307,4,120000,0,0,0,8,0,0,0,-20.72,-227.29,0.532,3.14,"Cryo-Engineer Sha'heen - On Waypoint 52 Reached - Summon Creature 'Nexus Terror'"),
    (@SHAHEEN,0,14,0,61,0,100,0,52,0,0,0,12,19307,4,120000,0,0,0,8,0,0,0,-15.28,-218.56,0.4,3.17,"Cryo-Engineer Sha'heen - On Waypoint 52 Reached - Summon Creature 'Nexus Terror'"),
    (@SHAHEEN,0,15,16,40,0,100,0,66,0,0,0,54,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 66 Reached - Pause Waypoint"),
    (@SHAHEEN,0,16,0,61,0,100,0,66,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 66 Reached - Say Line 7"),
    (@SHAHEEN,0,17,18,40,0,100,0,73,0,0,0,54,40000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 73 Reached - Pause Waypoint"),
    (@SHAHEEN,0,18,0,61,0,100,0,73,0,0,0,80,@SHAHEEN*100+05,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 73 Reached - Run Script"),
    (@SHAHEEN,0,19,0,40,0,100,0,93,0,0,0,80,@SHAHEEN*100+06,2,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Waypoint 93 Reached - Run Script"),
    (@SHAHEEN,0,20,0,0,0,100,0,0,1000,3500,4500,11,13901,64,0,0,0,0,2,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - In Combat - Cast 'Arcane Bolt'"),
    (@SHAHEEN,0,21,0,0,0,100,0,7000,10000,13500,24500,11,22938,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - In Combat - Cast 'Arcane Explosion'"),
    (@SHAHEEN,0,22,23,38,0,100,0,2,2,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Say Line 12"),
    (@SHAHEEN,0,23,24,61,0,100,0,2,2,0,0,1,13,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Say Line 13"),
    (@SHAHEEN,0,24,25,61,0,100,0,2,2,0,0,15,10218,0,0,0,0,0,17,0,100,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Quest Credit ''"),
    (@SHAHEEN,0,25,26,61,0,100,0,2,2,0,0,69,0,0,0,0,0,0,8,0,0,0,-67.82,-21.77,-0.954,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Move To Position"),
    (@SHAHEEN,0,26,0,61,0,100,0,2,2,0,0,41,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Data Set 2 2 - Despawn In 6000 ms"),
    (@SHAHEEN*100+00,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Npc Flag "),
    (@SHAHEEN*100+00,9,1,0,0,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Run Off"),
    (@SHAHEEN*100+00,9,2,0,0,0,100,0,0,0,0,0,1,20,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 20"),
    (@SHAHEEN*100+00,9,3,0,0,0,100,0,3000,3000,0,0,1,21,0,0,0,0,0,21,40,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 21"),
    (@SHAHEEN*100+00,9,4,0,0,0,100,0,1000,1000,0,0,69,1,0,0,0,0,0,8,0,0,0,-354.75,-65.6,-0.96,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,5,0,0,0,100,0,3000,3000,0,0,1,22,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 22"),
    (@SHAHEEN*100+00,9,6,0,0,0,100,0,3000,3000,0,0,12,19672,4,60000,0,0,0,8,0,0,0,-351.345,-69.7118,-0.875432,4.34587,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Consortium Laborer'"),
    (@SHAHEEN*100+00,9,7,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,-378.07,-48,-0.96,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,8,0,0,0,100,0,0,0,0,0,12,19672,4,60000,0,0,0,8,0,0,0,-351.345,-69.7118,-0.875432,4.34587,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Consortium Laborer'"),
    (@SHAHEEN*100+00,9,9,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,-378.56,-97.69,-0.96,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,10,0,0,0,100,0,0,0,0,0,12,19672,4,60000,0,0,0,8,0,0,0,-351.345,-69.7118,-0.875432,4.34587,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Consortium Laborer'"),
    (@SHAHEEN*100+00,9,11,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,-386.85,-76.48,-0.958,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+00,9,12,0,0,0,100,0,500,500,0,0,1,23,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 23"),
    (@SHAHEEN*100+00,9,13,0,0,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Npc Flag Questgiver"),
    (@SHAHEEN*100+01,9,0,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+01,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+01,9,2,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+01,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+01,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 1"),
    (@SHAHEEN*100+02,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 2"),
    (@SHAHEEN*100+02,9,1,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+02,9,2,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+02,9,3,0,0,0,100,0,0,0,0,0,12,18315,4,30000,0,1,0,8,0,0,0,-369.96,-137.83,-0.957,4.7,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Theurgist'"),
    (@SHAHEEN*100+02,9,4,0,0,0,100,0,0,0,0,0,12,18312,4,30000,0,1,0,8,0,0,0,-374.96,-137.83,-0.957,4.7,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Spellbinder'"),
    (@SHAHEEN*100+02,9,5,0,0,0,100,0,0,0,0,0,12,18315,4,30000,0,1,0,8,0,0,0,-369.96,-193.83,-0.957,1.57,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Theurgist'"),
    (@SHAHEEN*100+02,9,6,0,0,0,100,0,0,0,0,0,12,18312,4,30000,0,1,0,8,0,0,0,-374.96,-193.83,-0.957,1.57,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Spellbinder'"),
    (@SHAHEEN*100+02,9,7,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+02,9,8,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+02,9,9,0,0,0,100,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 3"),
    (@SHAHEEN*100+03,9,0,0,0,0,100,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 4"),
    (@SHAHEEN*100+03,9,1,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 5"),
    (@SHAHEEN*100+03,9,2,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.8,"Cryo-Engineer Sha'heen - On Script - Set Orientation 0,8"),
    (@SHAHEEN*100+04,9,0,0,0,0,100,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 6"),
    (@SHAHEEN*100+04,9,1,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+04,9,2,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+04,9,3,0,0,0,100,0,0,0,0,0,12,18311,4,30000,0,1,0,8,0,0,0,-288.02,-184.01,-1.28,0,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Crypt Raider'"),
    (@SHAHEEN*100+04,9,4,0,0,0,100,0,0,0,0,0,12,18313,4,30000,0,1,0,8,0,0,0,-287.41,-187.46,-0.93,0,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Sorcerer'"),
    (@SHAHEEN*100+04,9,5,0,0,0,100,0,0,0,0,0,12,18311,4,30000,0,1,0,8,0,0,0,-234.94,-199.88,-0.95,2,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Crypt Raider'"),
    (@SHAHEEN*100+04,9,6,0,0,0,100,0,0,0,0,0,12,18313,4,30000,0,1,0,8,0,0,0,-232.64,-194.52,-0.95,1.94,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Ethereal Sorcerer'"),
    (@SHAHEEN*100+04,9,7,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+04,9,8,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+05,9,0,0,0,0,100,0,0,0,0,0,17,173,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 173"),
    (@SHAHEEN*100+05,9,1,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Passive"),
    (@SHAHEEN*100+05,9,2,0,0,0,100,0,10000,10000,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Reactstate Defensive"),
    (@SHAHEEN*100+05,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Emote State 0"),
    (@SHAHEEN*100+05,9,4,0,0,0,100,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 8"),
    (@SHAHEEN*100+05,9,5,0,0,0,100,0,0,0,0,0,66,8,0,0,0,0,0,21,40,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Orientation Closest Player"),
    (@SHAHEEN*100+05,9,6,0,0,0,100,0,20000,20000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 9"),
    (@SHAHEEN*100+05,9,7,0,0,0,100,0,9000,9000,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 10"),
    (@SHAHEEN*100+06,9,0,0,0,0,100,0,0,0,0,0,12,19666,4,30000,0,1,0,8,0,0,0,-67.82,-21.77,-0.954,4.67,"Cryo-Engineer Sha'heen - On Script - Summon Creature 'Shadow Lord Xiraxis'"),
    (@SHAHEEN*100+06,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 0"),
    (@SHAHEEN*100+06,9,2,0,0,0,100,0,5000,5000,0,0,69,1,0,0,0,0,0,8,1,0,0,-67.05,-74.83,-0.81,0,"Cryo-Engineer Sha'heen - On Script - Move To Position"),
    (@SHAHEEN*100+06,9,3,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 1"),
    (@SHAHEEN*100+06,9,4,0,0,0,100,0,7000,7000,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 11"),
    (@SHAHEEN*100+06,9,5,0,0,0,100,0,4000,4000,0,0,1,2,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Say Line 2"),
    (@SHAHEEN*100+06,9,6,0,0,0,100,0,2000,2000,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Data 1 1"),
    (@SHAHEEN*100+06,9,7,0,0,0,100,0,0,0,0,0,2,14,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Set Faction 14"),
    (@SHAHEEN*100+06,9,8,0,0,0,100,0,500,500,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"Cryo-Engineer Sha'heen - On Script - Start Attacking");

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=@LABORER;
DELETE FROM smart_scripts WHERE entryorguid=@LABORER AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@LABORER, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Is Summoned - Set Event Phase'),
    (@LABORER, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 145, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Is Summoned - No Event Phase Reset'),
    (@LABORER, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Is Summoned - Set Emote State'),
    (@LABORER, 0, 3, 4, 60, 1, 100, 257, 13000, 25000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - On Update - Set Emote State'),
    (@LABORER, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 24, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - On Update - Evade'),
    (@LABORER, 0, 5, 6, 21, 1, 100, 0, 0, 0, 0, 0, 11, 34442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Just Reached Home - Cast Despawn Consortium Laborer'),
    (@LABORER, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Consortium Laborer - Just Reached Home - Despawn');

UPDATE creature_template SET AIName="SmartAI" WHERE entry=@XIRAXIS;
DELETE FROM smart_scripts WHERE entryorguid=@XIRAXIS AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (@XIRAXIS,0,0,0,54,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Just Summoned - Set Flags Immune To Players & Immune To NPC's"),
    (@XIRAXIS,0,1,2,38,0,100,0,1,1,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Data Set 1 1 - Remove Flags Immune To Players & Immune To NPC's"),
    (@XIRAXIS,0,2,3,61,0,100,0,1,1,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Data Set 1 1 - Set Faction 14"),
    (@XIRAXIS,0,3,0,61,0,100,0,1,1,0,0,49,0,0,0,0,0,0,21,30,0,0,0,0,0,0,"Shadow Lord Xiraxis - On Data Set 1 1 - Start Attacking"),
    (@XIRAXIS,0,4,5,6,0,100,0,0,0,0,0,45,2,2,0,0,0,0,19,19671,100,0,0,0,0,0,"Shadow Lord Xiraxis - On Just Died - Set Data 2 2"),
    (@XIRAXIS,0,5,0,61,0,100,0,0,0,0,0,15,10218,0,0,0,0,0,17,0,100,0,0,0,0,0,"Shadow Lord Xiraxis - On Just Died - Quest Credit ''");

DELETE FROM waypoints WHERE entry=@SHAHEEN;
INSERT INTO waypoints (entry, pointid, position_x, position_y, position_z, point_comment)
VALUES
    (@SHAHEEN, 1, -351.789, -69.8332, -0.960246, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 2, -366.06, -71.81, -0.958, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 3, -370.07, -72.54, 0.55, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 4, -362.02, -71.05, -0.958, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 5, -372.478, -93.9698, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 6, -372.956, -102.076, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 7, -373.017, -113.626, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 8, -372.988, -125.175, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 9, -372.931, -139.675, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 10, -373.605, -151.226, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 11, -377.447, -154.805, -0.958742, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 12, -380.818, -159.285, -0.954232, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 13, -381.165, -164.186, -0.957979, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 14, -379.066, -164.216, -0.113683, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 15, -375.111, -164.235, 0.715806, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 16, -379.775, -164.71, -0.165154, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 17, -382.273, -165.565, -0.958753, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 18, -379.523, -174.58, -0.958753, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 19, -375.329, -184.594, -0.97348, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 20, -373.631, -193.17, -0.962749, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 21, -373.4, -200.517, -0.959759, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 22, -373.059, -211.368, -0.959759, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 23, -372.674, -223.626, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 24, -362.175, -223.75, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 25, -346.425, -223.679, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 26, -334.183, -223.583, -0.958623, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 27, -322.276, -223.677, -0.958344, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 28, -312.918, -220.998, -0.94947, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 29, -307.607, -213.182, -0.933042, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 30, -301.831, -202.365, -0.97953, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 31, -294.812, -194.082, -0.94909, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 32, -291.029, -189.044, -1.00723, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 33, -284.51, -180.362, -1.33409, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 34, -280.377, -173.049, -1.8534, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 35, -273.836, -161.477, -2.48206, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 36, -267.396, -159.877, -1.79642, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 37, -260.544, -158.374, -1.17304, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 38, -260.4, -160.827, -1.15989, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 39, -254.832, -161.486, -0.953236, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 40, -246.845, -162.432, -0.953236, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 41, -242.399, -164.477, -0.867038, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 42, -240.562, -169.012, -0.953709, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 43, -238.44, -173.021, -0.953709, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 44, -234.175, -181.075, -0.953709, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 45, -228.82, -190.903, -0.953759, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 46, -222.477, -197.448, -0.398852, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 47, -217.363, -202.727, 0.287965, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 48, -212.248, -208.005, 0.713021, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 49, -205.189, -215.289, 0.20156, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 50, -198.861, -221.819, -0.729239, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 51, -191.275, -223.174, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 52, -179.389, -223.268, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 53, -174.475, -223.287, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 54, -166.411, -223.319, -0.955504, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 55, -155.911, -223.271, -0.947958, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 56, -147.87, -223.209, -0.756992, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 57, -138.064, -223.132, 0.0706656, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 58, -132.457, -223.066, 0.889542, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 59, -125.465, -222.984, 1.3118, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 60, -120.551, -222.945, 0.271436, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 61, -111.458, -222.903, 0.22694, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 62, -101.672, -222.865, -0.578372, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 63, -94.6789, -222.838, -0.67855, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 64, -85.2324, -222.578, -0.392579, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 65, -74.0211, -222.339, -0.169972, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 66, -69.8212, -222.307, -0.225875, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 67, -59.7134, -222.863, 0.121823, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 68, -48.1808, -223.498, -0.118748, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 69, -37.6942, -224.026, -0.370049, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 70, -26.4821, -224.059, 0.183233, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 71, -17.0706, -223.207, 0.688721, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 72, -14.0612, -222.818, 1.01445, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 73, -17.9018, -222.954, 0.620031, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 74, -28.0595, -223.313, 0.0938897, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 75, -38.0775, -221.726, -0.303824, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 76, -48.0824, -220.058, -0.0237211, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 77, -59.6136, -217.254, 0.17109, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 78, -68.7573, -211.4, -0.272352, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 79, -67.9993, -203.035, -0.507698, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 80, -67.8879, -199.887, -0.644729, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 81, -67.7765, -196.739, -1.96199, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 82, -67.5291, -189.75, -1.91727, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 83, -67.2564, -182.048, -1.49876, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 84, -67.2302, -173.313, -0.975207, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 85, -67.2919, -168.063, -0.955841, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 86, -67.4233, -156.871, -0.955752, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 87, -67.5877, -142.865, -0.955752, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 88, -67.476, -131.316, -1.1366, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 89, -67.4755, -120.102, -1.32219, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 90, -67.5068, -112.059, -0.653647, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 91, -67.2435, -105.785, -1.65685, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 92, -66.9464, -97.3905, -1.20982, 'Cryo-Engineer Sha\'heen'),
    (@SHAHEEN, 93, -66.5686, -88.659, -1.2151, 'Cryo-Engineer Sha\'heen');


-- The Big Bone Worm - [A][H] http://www.wowhead.com/quest=10930/the-big-bone-worm

DELETE FROM spell_script_names WHERE spell_id=39238;
INSERT INTO spell_script_names VALUES (39238, 'spell_q10929_fumping');

DELETE FROM conditions WHERE SourceTypeOrReferenceId IN(13, 17) AND SourceEntry=39246;
INSERT INTO conditions VALUES (17, 0, 39246, 0, 0, 29, 0, 22105, 5, 1, 0, 0, 0, '', 'Requires Dead Clefthoof');
INSERT INTO conditions VALUES (13, 4, 39246, 0, 0, 31, 0, 3, 22105, 0, 0, 0, 0, '', 'Target Dead Clefthoof');
DELETE FROM spell_script_names WHERE spell_id=39246;
INSERT INTO spell_script_names VALUES (39246, 'spell_q10930_big_bone_worm');
DELETE FROM creature_template_addon WHERE entry IN(22038, 22482);
INSERT INTO creature_template_addon
VALUES
    (22038, 0, 0, 9, 0, 0, ''),
    (22482, 0, 0, 9, 0, 0, '');

UPDATE creature_template SET modelid1=11686, mechanic_immune_mask=mechanic_immune_mask|0x20, flags_extra=0x200000, AIName='SmartAI', ScriptName='' WHERE entry IN(22038, 22482);
DELETE FROM smart_scripts WHERE entryorguid IN(22038, 22482) AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (22038, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 18, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Set Unit Flag'),
    (22038, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Remove Unit Flag'),
    (22038, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37989, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On AI Init - Cast Tunnel Bore Passive'),
    (22038, 0, 4, 5, 4, 0, 100, 0, 0, 0, 0, 0, 19, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Remove Unit Flag'),
    (22038, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 18, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Set Unit Flag'),
    (22038, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 28, 37989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Remove Aura Tunnel Bore Passive'),
    (22038, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 147, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Aggro - Stop Motion'),
    (22038, 0, 8, 0, 0, 0, 100, 1, 0, 0, 0, 0, 3, 0, 20746, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Change Model'),
    (22038, 0, 9, 0, 0, 0, 100, 1, 500, 500, 0, 0, 91, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Remove Bytes0'),
    (22038, 0, 10, 0, 0, 0, 100, 0, 1000, 6000, 8000, 11000, 11, 32738, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - In Combat - Cast Bore'),
    (22038, 0, 11, 0, 9, 0, 100, 0, 4, 50, 2000, 3500, 11, 31747, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - Within Range 5-50yd - Cast Poison'),
    (22038, 0, 12, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hai''shulud - On Evade - Despawn'),
    (22482, 0, 0, 1, 37, 0, 100, 0, 0, 0, 0, 0, 18, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Set Unit Flag'),
    (22482, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 19, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Remove Unit Flag'),
    (22482, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 37989, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On AI Init - Cast Tunnel Bore Passive'),
    (22482, 0, 4, 5, 4, 0, 100, 0, 0, 0, 0, 0, 19, 33554432, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Remove Unit Flag'),
    (22482, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 18, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Set Unit Flag'),
    (22482, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 28, 37989, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Remove Aura Tunnel Bore Passive'),
    (22482, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 147, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Aggro - Stop Motion'),
    (22482, 0, 8, 0, 0, 0, 100, 1, 0, 0, 0, 0, 3, 0, 20617, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Change Model'),
    (22482, 0, 9, 0, 0, 0, 100, 1, 500, 500, 0, 0, 91, 9, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Remove Bytes0'),
    (22482, 0, 10, 0, 0, 0, 100, 0, 1000, 6000, 8000, 11000, 11, 32738, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - In Combat - Cast Bore'),
    (22482, 0, 11, 0, 9, 0, 100, 0, 4, 50, 2000, 3500, 11, 31747, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - Within Range 5-50yd - Cast Poison'),
    (22482, 0, 12, 0, 7, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Mature Bone Sifter - On Evade - Despawn');

DELETE FROM creature_text WHERE entry=22483;
INSERT INTO creature_text VALUES (22483, 0, 0, 'AHHHHHH-YAAA-YAAA-YAAA!!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');
INSERT INTO creature_text VALUES (22483, 0, 1, 'AYYAYAAYAA!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');
INSERT INTO creature_text VALUES (22483, 0, 2, 'AAAAAAAAEEEEEEEEEE!!!!!!!!', 12, 0, 100, 0, 0, 0, 0, 0, 'Sand Gnome');

UPDATE creature_template SET AIName='SmartAI', ScriptName='' WHERE entry=22483;
DELETE FROM smart_scripts WHERE entryorguid=22483 AND source_type=0;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment)
VALUES
    (22483, 0, 0, 1, 25, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Sand Gnome - On Reset - Say Line 0'),
    (22483, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 30, 0, 0, 0, 0, 0, 0, 'Sand Gnome - On Reset - Attack Start');


-- Terokk's Downfall - [A][H] http://www.wowhead.com/quest=11073/terokks-downfall

SET @TEROKK := 21838;
SET @SKYGUARD := 23377;
SET @TARGET := 23277;
SET @SKULLPIE := 185928;

UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@SKULLPIE;
DELETE FROM gossip_menu_option WHERE menu_id=8687;
INSERT INTO gossip_menu_option VALUES(8687, 1, 0, "<Call forth Terokk.>", 0, 1, 1, 0, 0, 0, 0, "", 0);

DELETE FROM event_scripts WHERE id=15014;
INSERT INTO event_scripts VALUES(15014, 4, 10, @TEROKK, 600000, 1, -3788, 3509, 287, 5.7);

DELETE FROM smart_scripts WHERE entryorguid=@SKULLPIE AND source_type=1;
INSERT INTO smart_scripts VALUES (@SKULLPIE, 1, 0, 1, 62, 0, 100, 0, 8687, 1, 0, 0, 85, 41004, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Terokk summon');
INSERT INTO smart_scripts VALUES (@SKULLPIE, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Terokk summon - linked close gossip');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN(8687);

DELETE FROM creature_text WHERE entry=@TEROKK;
INSERT INTO creature_text VALUES (@TEROKK, 0, 0, "Who calls me to this world? The stars are not yet aligned... my powers fail me! You will pay for this!", 12, 0, 100, 0, 0, 0, 0, 0, 'Terokk');
INSERT INTO creature_text VALUES (@TEROKK, 1, 0, "You cannot kill me, I am immortal!", 14, 0, 100, 0, 0, 0, 0, 0, 'Terokk');
INSERT INTO creature_text VALUES (@TEROKK, 2, 0, "%s becomes enraged as his shield shatters.", 41, 0, 100, 0, 0, 0, 0, 0, 'Terokk');

DELETE FROM smart_scripts WHERE entryorguid=@TEROKK AND source_type=0;
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 0, 0, 0, 0, 100, 0, 4000, 7000, 10000, 15000, 11, 40721, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Terokk - In Combat - Cast 'Shadow Bolt Volley'");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 1, 0, 0, 0, 100, 0, 6000, 9000, 7000, 9000, 11, 15284, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Terokk - In Combat - Cast 'Cleave'");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 2, 3, 2, 0, 100, 1, 0, 30, 120000, 120000, 11, 40733, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Cast 'Divine Shield' (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Say Line 0 (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - Between 0-30% Health - Set Data");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 5, 6, 23, 0, 100, 0, 40657, 1, 600000, 600000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Talk 2");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 11, 28747, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Cast Frenzy");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 28, 40733, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - Has Aura - Remove Aura Divine Shield");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 8, 0, 6, 0, 100, 1, 0, 0, 0, 0, 11, 40722, 7, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Just Died - Cast 'Will of the Arakkoa God' (No Repeat)");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 9, 10, 4, 0, 100, 1, 0, 0, 0, 0, 12, @SKYGUARD, 3, 240000, 0, 0, 0, 8, 0, 0, 0, -3771.60, 3499.32, 317.88, 2.5, "Terokk - On Aggro - Summon Creature");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - On Aggro - Talk Target 0");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 11, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Respawn - Talk 0");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 12, 13, 7, 0, 100, 0, 0, 0, 0, 0, 28, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Evade - Remove All Auras");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @SKYGUARD, 90, 0, 0, 0, 0, 0, "Terokk - On Evade - Despawn Target");
INSERT INTO smart_scripts VALUES (@TEROKK, 0, 14, 0, 60, 0, 100, 1, 0, 0, 0, 0, 11, 39579, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Terokk - On Update - Cast Shadowform");

DELETE FROM creature_text WHERE entry=@SKYGUARD;
INSERT INTO creature_text VALUES (@SKYGUARD, 0, 0, "Enemy sighted! Fall into formation and prepare for bombing maneuvers!", 14, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Ace');
INSERT INTO creature_text VALUES (@SKYGUARD, 1, 0, "Quickly! Use the flames and support ground troops. Its ancient magic should cleanse Terokk's shield.", 14, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Ace');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=40657;
INSERT INTO conditions VALUES(13, 6, 40657, 0, 0, 31, 0, 3, @TARGET, 0, 0, 0, 0, '', 'Requires Skyguard Target');

DELETE FROM creature_template_addon WHERE entry IN(@SKYGUARD,@TARGET);
INSERT INTO creature_template_addon VALUES (@SKYGUARD, 0, 21152, 0, 1, 0, '');
INSERT INTO creature_template_addon VALUES (@TARGET, 0, 0, 0, 1, 0, '40656');

UPDATE creature_template SET InhabitType=4, AIName='NullCreatureAI', ScriptName='', flags_extra=128 WHERE entry=@TARGET;
UPDATE creature_template SET faction=1856, InhabitType=4, AIName='SmartAI', ScriptName='' WHERE entry=@SKYGUARD;
DELETE FROM smart_scripts WHERE entryorguid=@SKYGUARD AND source_type=0;
DELETE FROM smart_scripts WHERE entryorguid=@SKYGUARD*100 AND source_type=9;
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Update - Despawn");
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 1, 2, 38, 0, 100, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Data Set - Talk 1");
INSERT INTO smart_scripts VALUES (@SKYGUARD, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @SKYGUARD*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Data Set - Start Script");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 0, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3805, 3515, 287.2, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 1, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3797, 3489, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 3, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3770, 3501, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 5, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 6, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3805, 3515, 287.2, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 7, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 8, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3797, 3489, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 9, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 10, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 12, @TARGET, 3, 22000, 0, 0, 0, 8, 0, 0, 0, -3770, 3501, 287.1, 0, "Script9 - Summon Creature");
INSERT INTO smart_scripts VALUES (@SKYGUARD*100, 9, 11, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 40657, 2, 0, 0, 0, 0, 19, @TARGET, 50, 0, 0, 0, 0, 0, "Script9 - Cast Spell");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=22 AND SourceEntry=@SKYGUARD;
INSERT INTO conditions VALUES(22, 1, @SKYGUARD, 0, 0, 29, 1, @TEROKK, 100, 0, 1, 0, 0, '', 'Run action if no npc nearby');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=41004;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
    (17, 0, 41004, 0, 0, 29, 0, @TEROKK, 100, 0, 1, 0, 0, '', 'Cant Summon Terokk if another Terokk is summoned within 100yds.');


-- Discovering Your Roots - [A][H] http://www.wowhead.com/quest=11520/discovering-your-roots
-- Rediscovering Your Roots - [A][H] http://www.wowhead.com/quest=11521/rediscovering-your-roots

DELETE FROM spell_script_names WHERE spell_id=44935;
INSERT INTO spell_script_names (spell_id, ScriptName)
VALUES
    (44935, 'spell_q11520_discovering_your_roots');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=44941;
INSERT INTO conditions VALUES (13, 1, 44941, 0, 0, 31, 0, 5, 187073, 0, 0, 0, 0, '', 'Target Razorthorn Dirt Mound');


-- Escape from Skettis - [A][H] http://www.wowhead.com/quest=11085/escape-from-skettis

SET @PRISONER := 23383;
UPDATE quest_template_addon SET SpecialFlags=3 WHERE Id=11085;

DELETE FROM creature WHERE id=@PRISONER;
DELETE FROM creature WHERE id=@PRISONER and guid=12548;
INSERT INTO creature VALUES (12548, @PRISONER, 530, 0, 0, 1, 1, 0, 0, -4106.62, 3029.94, 344.877, 0.827394, 300, 0, 0, 6986, 0, 0, 0, 0, 0, 0);

DELETE FROM creature_text WHERE entry=@PRISONER;
INSERT INTO creature_text VALUES(@PRISONER, 0, 0, "Thanks for your help. Let's get out of here!", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');
INSERT INTO creature_text VALUES(@PRISONER, 1, 0, "Let's keep moving. I don't like this place.", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');
INSERT INTO creature_text VALUES(@PRISONER, 2, 0, "Thanks again. Sergeant Doryn will be glad to hear he has one less scout to replace this week.", 12, 0, 100, 0, 0, 0, 0, 0, 'Skyguard Prisoner');

UPDATE creature_template SET speed_run=1, AIName='SmartAI' WHERE entry=@PRISONER;
DELETE FROM smart_scripts WHERE entryorguid=@PRISONER AND source_type=0;
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 0, 1, 19, 0, 100, 0, 11085, 0, 0, 0, 53, 0, @PRISONER, 0, 11085, 5000, 2, 7, 0, 0, 0, 0, 0, 0, 0, 'On Quest Accept - Start WP');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 15, 185952, 10, 0, 0, 0, 0, 0, 'On Quest Accept - Activate GO');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 2, 3, 40, 0, 100, 0, 1, 0, 0, 0, 54, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Pause Path');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 4, 0, 25, 0, 30, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Reset - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 5, 6, 40, 0, 100, 0, 22, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Talk');
INSERT INTO smart_scripts VALUES (@PRISONER, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP Reach - Despawn');

DELETE FROM waypoints WHERE entry=@PRISONER;
INSERT INTO waypoints 
VALUES 
    (@PRISONER, 1, -4108.06, 3031.46, 344.879, 'Skyguard Prisoner'),
    (@PRISONER, 2, -4110.58, 3034.34, 344.121, 'Skyguard Prisoner'),
    (@PRISONER, 3, -4116.37, 3033.79, 344.083, 'Skyguard Prisoner'),
    (@PRISONER, 4, -4122.83, 3027.09, 344.149, 'Skyguard Prisoner'),
    (@PRISONER, 5, -4126.33, 3027.21, 344.158, 'Skyguard Prisoner'),
    (@PRISONER, 6, -4128.94, 3026.88, 344.021, 'Skyguard Prisoner'),
    (@PRISONER, 7, -4135.6, 3028.52, 339.992, 'Skyguard Prisoner'),
    (@PRISONER, 8, -4144.75, 3030.27, 337.474, 'Skyguard Prisoner'),
    (@PRISONER, 9, -4157.26, 3032.66, 337.446, 'Skyguard Prisoner'),
    (@PRISONER, 10, -4171.01, 3035.29, 342.801, 'Skyguard Prisoner'),
    (@PRISONER, 11, -4172.98, 3035.67, 343.267, 'Skyguard Prisoner'),
    (@PRISONER, 12, -4175.09, 3039.7, 343.64, 'Skyguard Prisoner'),
    (@PRISONER, 13, -4176.68, 3049.94, 344.072, 'Skyguard Prisoner'),
    (@PRISONER, 14, -4182.15, 3056.03, 344.146, 'Skyguard Prisoner'),
    (@PRISONER, 15, -4185.25, 3060.86, 344.157, 'Skyguard Prisoner'),
    (@PRISONER, 16, -4184.97, 3062.4, 344.152, 'Skyguard Prisoner'),
    (@PRISONER, 17, -4183.71, 3065.44, 342.625, 'Skyguard Prisoner'),
    (@PRISONER, 18, -4181.35, 3071.13, 336.977, 'Skyguard Prisoner'),
    (@PRISONER, 19, -4179.91, 3079.19, 329.741, 'Skyguard Prisoner'),
    (@PRISONER, 20, -4178.71, 3085.91, 325.563, 'Skyguard Prisoner'),
    (@PRISONER, 21, -4178.18, 3088.9, 324.177, 'Skyguard Prisoner'),
    (@PRISONER, 22, -4175.07, 3094.67, 323.426, 'Skyguard Prisoner');

-- [Q] The Raven Stones -- http://wotlk.openwow.com/quest=10988
-- Cenarion Sparrowhawk SAI
SET @ENTRY := 22972;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,3,54,0,100,0,0,0,0,0,29,1,0,0,0,0,0,23,0,0,0,0,0,0,0,"Cenarion Sparrowhawk - On Just Summoned - Start Follow Owner Or Summoner"),
(@ENTRY,0,1,0,38,0,100,0,1,1,10000,10000,69,1,0,0,0,0,0,19,22986,50,0,0,0,0,0,"Cenarion Sparrowhawk - On Data Set 1 1 - Move To Closest Creature 'Skettis - Invis Raven Stone'"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cenarion Sparrowhawk - On Just Summoned - Set Reactstate Passive"),
(@ENTRY,0,4,5,34,0,100,0,8,1,0,0,45,2,2,0,0,0,0,19,22986,50,0,0,0,0,0,"Cenarion Sparrowhawk - On Reached Point 1 - Set Data 2 2"),
(@ENTRY,0,5,6,61,0,100,0,8,1,0,0,29,1,0,0,0,0,0,23,0,0,0,0,0,0,0,"Cenarion Sparrowhawk - On Reached Point 1 - Start Follow Owner Or Summoner"),
(@ENTRY,0,6,0,61,0,100,0,8,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cenarion Sparrowhawk - On Reached Point 1 - Say Line 0");

-- Skettis - Invis Raven Stone SAI
SET @ENTRY := 22986;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,2000,2000,2000,45,1,1,0,0,0,0,19,22972,50,0,0,0,0,0,"Skettis - Invis Raven Stone - Out of Combat - Set Data 1 1"),
(@ENTRY,0,1,2,38,0,100,0,2,2,0,0,50,185541,60,0,0,0,0,1,0,0,0,0,0,0,0,"Skettis - Invis Raven Stone - On Data Set 2 2 - Summon Gameobject 'Raven Stone Fragment'"),
(@ENTRY,0,2,0,61,0,100,0,2,2,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Skettis - Invis Raven Stone - On Data Set 2 2 - Despawn Instant");

-- Actionlist SAI
SET @ENTRY := 2297200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,1000,1000,0,0,29,1,0,0,0,0,0,23,0,0,0,0,0,0,0,"Cenarion Sparrowhawk - On Script - Start Follow Owner Or Summoner");

UPDATE `creature_template` SET `speed_walk`=3, `speed_run`=3 WHERE  `entry`=22972;

DELETE FROM `creature_text` WHERE `entry`=22972;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(22972, 0, 0, '%s locates a buried raven stone.', 16, 0, 100, 0, 0, 0, 20676, 'Cenarion Sparrowhawk');
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=22972;

DELETE FROM `gameobject` WHERE `id`=185541;
