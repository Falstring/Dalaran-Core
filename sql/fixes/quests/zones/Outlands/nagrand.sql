-- -------------------------------------------
-- NAGRAND
-- -------------------------------------------



-- Bring me the Egg - http://wotlk.openwow.com/quest=10111
-- Windroc Matriarch SAI
SET @ENTRY := 19055;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,19055,0,0,0,2,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Respawn - Start Waypoint"),
(@ENTRY,0,1,0,1,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - Out of Combat - Say Line 0 (No Repeat)"),
(@ENTRY,0,2,0,40,0,100,0,3,19055,0,0,80,@ENTRY*100+00,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Waypoint 3 Reached - Run Script"),
(@ENTRY,0,3,0,0,0,100,0,4000,4000,6000,6000,11,30285,0,0,0,0,0,2,0,0,0,0,0,0,0,"Windroc Matriarch - In Combat - Cast 'Eagle Claw'"),
(@ENTRY,0,4,0,0,0,100,0,7000,8000,11000,14000,11,32914,0,0,0,0,0,2,0,0,0,0,0,0,0,"Windroc Matriarch - In Combat - Cast 'Wing Buffet'");

-- Actionlist SAI
SET @ENTRY := 1905500;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,54,1000000000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Script - Pause Waypoint"),
(@ENTRY,9,1,0,0,0,100,1,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Script - Set Faction 14 (No Repeat)"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,19,320,0,0,0,0,0,1,0,0,0,0,0,0,0,"Windroc Matriarch - On Script - Remove Flag Immune To Players"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,40,0,0,0,0,0,0,"Windroc Matriarch - On Script - Start Attacking");


-- Ruthless Cunning - [A][H] http://www.wowhead.com/quest=9927/ruthless-cunning

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry=32307;

INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (13, 3, 32307, 0, 0, 31, 0, 3, 17148, 0, 0, 0, 0, '', "Target for Kil'sorrow Banner has to be Kil'sorrow Deathsworn OR"),
    (13, 3, 32307, 0, 1, 31, 0, 3, 18658, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Kil'sorrow Ritualist OR"),
    (13, 3, 32307, 0, 2, 31, 0, 3, 17147, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Kil'sorrow Cultist OR"),
    (13, 3, 32307, 0, 3, 31, 0, 3, 17146, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Kil'sorrow Spellbinder OR"),
    (13, 3, 32307, 0, 4, 31, 0, 3, 18391, 0, 0, 0, 0, '', "...target for Kil'sorrow Banner has to be Giselda the Crone.");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=17 AND SourceEntry=32307;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment)
VALUES
    (17, 0, 32307, 0, 0, 29, 0, 17148, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Deathsworn AND"),
    (17, 0, 32307, 0, 0, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 0, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 1, 29, 0, 18658, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Ritualist AND"),
    (17, 0, 32307, 0, 1, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 1, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 2, 29, 0, 17147, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Cultist AND"),
    (17, 0, 32307, 0, 2, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 2, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 3, 29, 0, 17146, 5, 1, 0, 12, 0, '', "Banner can only be cast on Kil'sorrow Spellbinder AND"),
    (17, 0, 32307, 0, 3, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 3, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present."),
    (17, 0, 32307, 0, 4, 29, 0, 18391, 5, 1, 0, 12, 0, '', "Banner can only be cast on Giselda the Crone AND"),
    (17, 0, 32307, 0, 4, 28, 0, 9927, 0, 0, 1, 0, 0, '', '...can only be cast if user hasn\'t completed the quest AND'),
    (17, 0, 32307, 0, 4, 30, 0, 182353, 5, 0, 1, 12, 0, '', "...can only be cast if no banner is present.");

+-- Kurenai - quest reputation
+UPDATE `reputation_reward_rate` SET `quest_rate`=2 WHERE  `faction`=978;