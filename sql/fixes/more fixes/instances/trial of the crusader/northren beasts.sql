-- Snobold copies.


DELETE FROM creature_template WHERE entry IN(50000, 50001, 50002, 50003);
INSERT INTO `creature_template` VALUES (50000, 50001, 50002, 50003, 0, 0, 11686, 0, 0, 0, 'Snobold Vassal', '', '', 0, 78, 78, 2, 14, 0, 1, 1.19048, 1, 1, 0, 2000, 2000, 1, 1, 1, 33554432, 2048, 0, 0, 0, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 10, 1, 1, 7.5, 1, 0, 0, 1, 0, 2, 'npc_snobold_vassal_copy', 12340);
INSERT INTO `creature_template` VALUES (50001, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Snobold Vassal (1)', '', '', 0, 78, 78, 2, 14, 0, 1, 1.19048, 1, 1, 0, 2000, 2000, 1, 1, 1, 33554432, 2048, 0, 0, 0, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 40, 1, 1, 13, 1, 0, 0, 1, 0, 2, '', 12340);
INSERT INTO `creature_template` VALUES (50002, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Snobold Vassal (2)', '', '', 0, 78, 78, 2, 14, 0, 1, 1.19048, 1, 1, 0, 2000, 2000, 1, 1, 1, 33554432, 2048, 0, 0, 0, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 14, 1, 1, 7.5, 1, 0, 0, 1, 0, 2, '', 12340);
INSERT INTO `creature_template` VALUES (50003, 0, 0, 0, 0, 0, 11686, 0, 0, 0, 'Snobold Vassal (3)', '', '', 0, 78, 78, 2, 14, 0, 1, 1.19048, 1, 1, 0, 2000, 2000, 1, 1, 1, 33554432, 2048, 0, 0, 0, 0, 0, 0, 7, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 60, 1, 1, 7.5, 1, 0, 0, 1, 0, 2, '', 12340);

-- Scriptname for the Paralytic Toxin.
DELETE FROM `spell_script_names` WHERE spell_id IN(66823, 67618, 67619, 67620);
INSERT INTO `spell_script_names` VALUES (66823, 'spell_acidmaw_paralysis');
INSERT INTO `spell_script_names` VALUES (67618, 'spell_acidmaw_paralysis');
INSERT INTO `spell_script_names` VALUES (67619, 'spell_acidmaw_paralysis');
INSERT INTO `spell_script_names` VALUES (67620, 'spell_acidmaw_paralysis');


INSERT INTO `spell_linked_spell` VALUES (66870, -66830, 1, 'Remove Paralysis when hit by Burning Bite');
INSERT INTO `spell_linked_spell` VALUES (67621, -66830, 1, 'Remove Paralysis when hit by Burning Bite');
INSERT INTO `spell_linked_spell` VALUES (67622, -66830, 1, 'Remove Paralysis when hit by Burning Bite');
INSERT INTO `spell_linked_spell` VALUES (67623, -66830, 1, 'Remove Paralysis when hit by Burning Bite');



UPDATE creature_template SET mechanic_immune_mask=617299963 WHERE entry IN(34796, 35438);






-- Gormok immunities in order to not have the arctic breath interrupted.

UPDATE creature_template SET mechanic_immune_mask=mechanic_immune_mask
|33554432 -- Interrupt

WHERE entry IN
(34797, 35447, 35448, 35449);


-- Snobolds.
UPDATE creature_template SET unit_flags=0 WHERE entry in(34800, 35441, 35442, 35443);

-- npc Fire Bomb (34854)
UPDATE creature_template SET modelid1=169, modelid2=16946,unit_flags=33554432, scriptname="npc_firebomb", flags_extra=128 WHERE entry=34854;
DELETE FROM creature_template_addon WHERE entry IN(34854);

DELETE FROM  spell_script_names where spell_id=66313;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (66313, 'spell_gormok_fire_bomb');

DELETE FROM spell_dbc WHERE Id IN(66313, 66318, -66313, -66318, 66317, 66320, 67472, 67473, 67475, -66317, -66320, -67472, -67473, -67475, 66319, -66319);
INSERT INTO `spell_dbc` (`Id`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `Stances`, `StancesNot`, `Targets`, `CastingTimeIndex`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectItemType1`, `EffectItemType2`, `EffectItemType3`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `Comment`) VALUES (66319, 0, 0, 256, 268435456, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 42, 13, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 'Summon Fire Bomb');




-- Acidmaw hitbox.

UPDATE creature_model_info SET combatreach=12 WHERE DisplayID IN(29815);