//::///////////////////////////////////////////////
//:: Name     Effect Encapsulation Functions (autogen)
//:: FileName agz_eelibafi_inc
//:://////////////////////////////////////////////
/*
  Automatically generated from parsed nwscript 1.59
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"


object EnxEffectHeal(int nDamageToHeal)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 1);
 SetLocalInt(oResult, "Parm_1", nDamageToHeal);
 return oResult;
}

object EnxEffectDamage(int nDamageAmount, int nDamageType = DAMAGE_TYPE_MAGICAL, int nDamagePower = DAMAGE_POWER_NORMAL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 2);
 SetLocalInt(oResult, "Parm_1", nDamageAmount);
 SetLocalInt(oResult, "Parm_2", nDamageType);
 SetLocalInt(oResult, "Parm_3", nDamagePower);
 return oResult;
}

object EnxEffectAbilityIncrease(int nAbilityToIncrease, int nModifyBy)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 3);
 SetLocalInt(oResult, "Parm_1", nAbilityToIncrease);
 SetLocalInt(oResult, "Parm_2", nModifyBy);
 return oResult;
}

object EnxEffectDamageResistance(int nDamageType, int nAmount, int nLimit = 0)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 4);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nAmount);
 SetLocalInt(oResult, "Parm_3", nLimit);
 return oResult;
}

object EnxEffectResurrection()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 5);
 return oResult;
}

object EnxEffectSummonCreature(string sCreatureResref, int nVisualEffectId = VFX_NONE, float fDelaySeconds = 0.0f, int nUseAppearAnimation = 0)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 6);
 SetLocalString(oResult, "Parm_1", sCreatureResref);
 SetLocalInt(oResult, "Parm_2", nVisualEffectId);
 SetLocalFloat(oResult, "Parm_3", fDelaySeconds);
 SetLocalInt(oResult, "Parm_4", nUseAppearAnimation);
 return oResult;
}

object EnxEffectACIncrease(int nValue, int nModifyType = AC_DODGE_BONUS, int nDamageType = AC_VS_DAMAGE_TYPE_ALL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 7);
 SetLocalInt(oResult, "Parm_1", nValue);
 SetLocalInt(oResult, "Parm_2", nModifyType);
 SetLocalInt(oResult, "Parm_3", nDamageType);
 return oResult;
}

object EnxEffectSavingThrowIncrease(int nSave, int nValue, int nSaveType = SAVING_THROW_TYPE_ALL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 8);
 SetLocalInt(oResult, "Parm_1", nSave);
 SetLocalInt(oResult, "Parm_2", nValue);
 SetLocalInt(oResult, "Parm_3", nSaveType);
 return oResult;
}

object EnxEffectAttackIncrease(int nBonus, int nModifierType = ATTACK_BONUS_MISC)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 9);
 SetLocalInt(oResult, "Parm_1", nBonus);
 SetLocalInt(oResult, "Parm_2", nModifierType);
 return oResult;
}

object EnxEffectDamageReduction(int nAmount, int nDamagePower, int nLimit = 0)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 10);
 SetLocalInt(oResult, "Parm_1", nAmount);
 SetLocalInt(oResult, "Parm_2", nDamagePower);
 SetLocalInt(oResult, "Parm_3", nLimit);
 return oResult;
}

object EnxEffectDamageIncrease(int nBonus, int nDamageType = DAMAGE_TYPE_MAGICAL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 11);
 SetLocalInt(oResult, "Parm_1", nBonus);
 SetLocalInt(oResult, "Parm_2", nDamageType);
 return oResult;
}

object EnxEffectEntangle()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 12);
 return oResult;
}

object EnxEffectDeath(int nSpectacularDeath = FALSE, int nDisplayFeedback = TRUE)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 13);
 SetLocalInt(oResult, "Parm_1", nSpectacularDeath);
 SetLocalInt(oResult, "Parm_2", nDisplayFeedback);
 return oResult;
}

object EnxEffectKnockdown()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 14);
 return oResult;
}

object EnxEffectCurse(int nStrMod = 1, int nDexMod = 1, int nConMod = 1, int nIntMod = 1, int nWisMod = 1, int nChaMod = 1)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 15);
 SetLocalInt(oResult, "Parm_1", nStrMod);
 SetLocalInt(oResult, "Parm_2", nDexMod);
 SetLocalInt(oResult, "Parm_3", nConMod);
 SetLocalInt(oResult, "Parm_4", nIntMod);
 SetLocalInt(oResult, "Parm_5", nWisMod);
 SetLocalInt(oResult, "Parm_6", nChaMod);
 return oResult;
}

object EnxEffectParalyze()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 16);
 return oResult;
}

object EnxEffectSpellImmunity(int nImmunityToSpell = SPELL_ALL_SPELLS)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 17);
 SetLocalInt(oResult, "Parm_1", nImmunityToSpell);
 return oResult;
}

object EnxEffectDeaf()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 18);
 return oResult;
}

object EnxEffectSleep()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 19);
 return oResult;
}

object EnxEffectCharmed()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 20);
 return oResult;
}

object EnxEffectConfused()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 21);
 return oResult;
}

object EnxEffectFrightened()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 22);
 return oResult;
}

object EnxEffectDominated()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 23);
 return oResult;
}

object EnxEffectDazed()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 24);
 return oResult;
}

object EnxEffectStunned()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 25);
 return oResult;
}

object EnxEffectRegenerate(int nAmount, float fIntervalSeconds)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 26);
 SetLocalInt(oResult, "Parm_1", nAmount);
 SetLocalFloat(oResult, "Parm_2", fIntervalSeconds);
 return oResult;
}

object EnxEffectMovementSpeedIncrease(int nPercentChange)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 27);
 SetLocalInt(oResult, "Parm_1", nPercentChange);
 return oResult;
}

object EnxEffectAreaOfEffect(int nAreaEffectId, string sOnEnterScript = "", string sHeartbeatScript = "", string sOnExitScript = "")
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 28);
 SetLocalInt(oResult, "Parm_1", nAreaEffectId);
 SetLocalString(oResult, "Parm_2", sOnEnterScript);
 SetLocalString(oResult, "Parm_3", sHeartbeatScript);
 SetLocalString(oResult, "Parm_4", sOnExitScript);
 return oResult;
}

object EnxEffectVisualEffect(int nVisualEffectId, int nMissEffect = FALSE)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 29);
 SetLocalInt(oResult, "Parm_1", nVisualEffectId);
 SetLocalInt(oResult, "Parm_2", nMissEffect);
 return oResult;
}

object EnxEffectBeam(int nBeamVisualEffect, object oEffector, int nBodyPart, int bMissEffect = FALSE)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 30);
 SetLocalInt(oResult, "Parm_1", nBeamVisualEffect);
 XSetLocalObject(oResult, "Parm_2", oEffector);
 SetLocalInt(oResult, "Parm_3", nBodyPart);
 SetLocalInt(oResult, "Parm_4", bMissEffect);
 return oResult;
}

object EnxEffectSpellResistanceIncrease(int nValue)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 31);
 SetLocalInt(oResult, "Parm_1", nValue);
 return oResult;
}

object EnxEffectPoison(int nPoisonType)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 32);
 SetLocalInt(oResult, "Parm_1", nPoisonType);
 return oResult;
}

object EnxEffectDisease(int nDiseaseType)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 33);
 SetLocalInt(oResult, "Parm_1", nDiseaseType);
 return oResult;
}

object EnxEffectSilence()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 34);
 return oResult;
}

object EnxEffectHaste()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 35);
 return oResult;
}

object EnxEffectSlow()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 36);
 return oResult;
}

object EnxEffectImmunity(int nImmunityType)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 37);
 SetLocalInt(oResult, "Parm_1", nImmunityType);
 return oResult;
}

object EnxEffectDamageImmunityIncrease(int nDamageType, int nPercentImmunity)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 38);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nPercentImmunity);
 return oResult;
}

object EnxEffectTemporaryHitpoints(int nHitPoints)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 39);
 SetLocalInt(oResult, "Parm_1", nHitPoints);
 return oResult;
}

object EnxEffectSkillIncrease(int nSkill, int nValue)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 40);
 SetLocalInt(oResult, "Parm_1", nSkill);
 SetLocalInt(oResult, "Parm_2", nValue);
 return oResult;
}

object EnxEffectTurned()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 41);
 return oResult;
}

object EnxEffectHitPointChangeWhenDying(float fHitPointChangePerRound)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 42);
 SetLocalFloat(oResult, "Parm_1", fHitPointChangePerRound);
 return oResult;
}

object EnxEffectAbilityDecrease(int nAbility, int nModifyBy)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 43);
 SetLocalInt(oResult, "Parm_1", nAbility);
 SetLocalInt(oResult, "Parm_2", nModifyBy);
 return oResult;
}

object EnxEffectAttackDecrease(int nPenalty, int nModifierType = ATTACK_BONUS_MISC)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 44);
 SetLocalInt(oResult, "Parm_1", nPenalty);
 SetLocalInt(oResult, "Parm_2", nModifierType);
 return oResult;
}

object EnxEffectDamageDecrease(int nPenalty, int nDamageType = DAMAGE_TYPE_MAGICAL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 45);
 SetLocalInt(oResult, "Parm_1", nPenalty);
 SetLocalInt(oResult, "Parm_2", nDamageType);
 return oResult;
}

object EnxEffectDamageImmunityDecrease(int nDamageType, int nPercentImmunity)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 46);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nPercentImmunity);
 return oResult;
}

object EnxEffectACDecrease(int nValue, int nModifyType = AC_DODGE_BONUS, int nDamageType = AC_VS_DAMAGE_TYPE_ALL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 47);
 SetLocalInt(oResult, "Parm_1", nValue);
 SetLocalInt(oResult, "Parm_2", nModifyType);
 SetLocalInt(oResult, "Parm_3", nDamageType);
 return oResult;
}

object EnxEffectMovementSpeedDecrease(int nPercentChange)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 48);
 SetLocalInt(oResult, "Parm_1", nPercentChange);
 return oResult;
}

object EnxEffectSavingThrowDecrease(int nSave, int nValue, int nSaveType = SAVING_THROW_TYPE_ALL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 49);
 SetLocalInt(oResult, "Parm_1", nSave);
 SetLocalInt(oResult, "Parm_2", nValue);
 SetLocalInt(oResult, "Parm_3", nSaveType);
 return oResult;
}

object EnxEffectSkillDecrease(int nSkill, int nValue)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 50);
 SetLocalInt(oResult, "Parm_1", nSkill);
 SetLocalInt(oResult, "Parm_2", nValue);
 return oResult;
}

object EnxEffectSpellResistanceDecrease(int nValue)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 51);
 SetLocalInt(oResult, "Parm_1", nValue);
 return oResult;
}

object EnxEffectInvisibility(int nInvisibilityType)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 52);
 SetLocalInt(oResult, "Parm_1", nInvisibilityType);
 return oResult;
}

object EnxEffectConcealment(int nPercentage, int nMissType = MISS_CHANCE_TYPE_NORMAL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 53);
 SetLocalInt(oResult, "Parm_1", nPercentage);
 SetLocalInt(oResult, "Parm_2", nMissType);
 return oResult;
}

object EnxEffectDarkness()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 54);
 return oResult;
}

object EnxEffectDispelMagicAll(int nCasterLevel)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 55);
 SetLocalInt(oResult, "Parm_1", nCasterLevel);
 return oResult;
}

object EnxEffectUltravision()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 56);
 return oResult;
}

object EnxEffectNegativeLevel(int nNumLevels, int bHPBonus = FALSE)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 57);
 SetLocalInt(oResult, "Parm_1", nNumLevels);
 SetLocalInt(oResult, "Parm_2", bHPBonus);
 return oResult;
}

object EnxEffectPolymorph(int nPolymorphSelection, int nLocked = FALSE)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 58);
 SetLocalInt(oResult, "Parm_1", nPolymorphSelection);
 SetLocalInt(oResult, "Parm_2", nLocked);
 return oResult;
}

object EnxEffectSanctuary(int nDifficultyClass)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 59);
 SetLocalInt(oResult, "Parm_1", nDifficultyClass);
 return oResult;
}

object EnxEffectTrueSeeing()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 60);
 return oResult;
}

object EnxEffectSeeInvisible()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 61);
 return oResult;
}

object EnxEffectTimeStop()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 62);
 return oResult;
}

object EnxEffectBlindness()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 63);
 return oResult;
}

object EnxEffectSpellLevelAbsorption(int nMaxSpellLevelAbsorbed, int nTotalSpellLevelsAbsorbed = 0, int nSpellSchool = SPELL_SCHOOL_GENERAL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 64);
 SetLocalInt(oResult, "Parm_1", nMaxSpellLevelAbsorbed);
 SetLocalInt(oResult, "Parm_2", nTotalSpellLevelsAbsorbed);
 SetLocalInt(oResult, "Parm_3", nSpellSchool);
 return oResult;
}

object EnxEffectDispelMagicBest(int nCasterLevel)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 65);
 SetLocalInt(oResult, "Parm_1", nCasterLevel);
 return oResult;
}

object EnxEffectMissChance(int nPercentage, int nMissChanceType = MISS_CHANCE_TYPE_NORMAL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 66);
 SetLocalInt(oResult, "Parm_1", nPercentage);
 SetLocalInt(oResult, "Parm_2", nMissChanceType);
 return oResult;
}

object EnxEffectDisappearAppear(location lLocation, int nAnimation = 1)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 67);
 SetLocalLocation(oResult, "Parm_1", lLocation);
 SetLocalInt(oResult, "Parm_2", nAnimation);
 return oResult;
}

object EnxEffectDisappear(int nAnimation = 1)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 68);
 SetLocalInt(oResult, "Parm_1", nAnimation);
 return oResult;
}

object EnxEffectAppear(int nAnimation = 1)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 69);
 SetLocalInt(oResult, "Parm_1", nAnimation);
 return oResult;
}

object EnxEffectModifyAttacks(int nAttacks)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 70);
 SetLocalInt(oResult, "Parm_1", nAttacks);
 return oResult;
}

object EnxEffectDamageShield(int nDamageAmount, int nRandomAmount, int nDamageType)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 71);
 SetLocalInt(oResult, "Parm_1", nDamageAmount);
 SetLocalInt(oResult, "Parm_2", nRandomAmount);
 SetLocalInt(oResult, "Parm_3", nDamageType);
 return oResult;
}

object EnxEffectSwarm(int nLooping, string sCreatureTemplate1, string sCreatureTemplate2 = "", string sCreatureTemplate3 = "", string sCreatureTemplate4 = "")
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 72);
 SetLocalInt(oResult, "Parm_1", nLooping);
 SetLocalString(oResult, "Parm_2", sCreatureTemplate1);
 SetLocalString(oResult, "Parm_3", sCreatureTemplate2);
 SetLocalString(oResult, "Parm_4", sCreatureTemplate3);
 SetLocalString(oResult, "Parm_5", sCreatureTemplate4);
 return oResult;
}

object EnxEffectTurnResistanceDecrease(int nHitDice)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 73);
 SetLocalInt(oResult, "Parm_1", nHitDice);
 return oResult;
}

object EnxEffectTurnResistanceIncrease(int nHitDice)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 74);
 SetLocalInt(oResult, "Parm_1", nHitDice);
 return oResult;
}

object EnxEffectPetrify()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 75);
 return oResult;
}

object EnxEffectCutsceneParalyze()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 76);
 return oResult;
}

object EnxEffectCutsceneDominated()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 77);
 return oResult;
}

object EnxEffectSpellFailure(int nPercent = 100, int nSpellSchool = SPELL_SCHOOL_GENERAL)
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 78);
 SetLocalInt(oResult, "Parm_1", nPercent);
 SetLocalInt(oResult, "Parm_2", nSpellSchool);
 return oResult;
}

object EnxEffectEthereal()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 79);
 return oResult;
}

object EnxEffectCutsceneGhost()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 80);
 return oResult;
}

object EnxEffectCutsceneImmobilize()
{
 object oResult = CreateAbstractObject(AO_TYPE_EFFECT);
 SetLocalInt(oResult, "agz_effect_code", 81);
 return oResult;
}

effect basicExtractEffect(object oObject)
{
  effect eEffect;
  if (!(GetLocalInt(oObject, "agz_AO") & AO_TYPE_EFFECT))
     return eEffect;
  int nEffectCode = GetLocalInt(oObject, "agz_effect_code");
  switch (nEffectCode & 0xc0) {
    case 0x0:
      switch (nEffectCode & 0x30) {
        case 0x0:
          switch (nEffectCode & 0xc) {
            case 0x0:
              switch (nEffectCode) {
                case 1:
                  eEffect = EffectHeal(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 2:
                  eEffect = EffectDamage(GetLocalInt(oObject, "Parm_1"),
                                         GetLocalInt(oObject, "Parm_2"),
                                         GetLocalInt(oObject, "Parm_3"));
                  break;
                case 3:
                  eEffect = EffectAbilityIncrease(GetLocalInt(oObject, "Parm_1"),
                                                  GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
            case 0x4:
              switch (nEffectCode) {
                case 4:
                  eEffect = EffectDamageResistance(GetLocalInt(oObject, "Parm_1"),
                                                   GetLocalInt(oObject, "Parm_2"),
                                                   GetLocalInt(oObject, "Parm_3"));
                  break;
                case 5:
                  eEffect = EffectResurrection();
                  break;
                case 6:
                  eEffect = EffectSummonCreature(GetLocalString(oObject, "Parm_1"),
                                                 GetLocalInt(oObject, "Parm_2"),
                                                 GetLocalFloat(oObject, "Parm_3"),
                                                 GetLocalInt(oObject, "Parm_4"));
                  break;
                case 7:
                  eEffect = EffectACIncrease(GetLocalInt(oObject, "Parm_1"),
                                             GetLocalInt(oObject, "Parm_2"),
                                             GetLocalInt(oObject, "Parm_3"));
                  break;
              } break;
            case 0x8:
              switch (nEffectCode) {
                case 8:
                  eEffect = EffectSavingThrowIncrease(GetLocalInt(oObject, "Parm_1"),
                                                      GetLocalInt(oObject, "Parm_2"),
                                                      GetLocalInt(oObject, "Parm_3"));
                  break;
                case 9:
                  eEffect = EffectAttackIncrease(GetLocalInt(oObject, "Parm_1"),
                                                 GetLocalInt(oObject, "Parm_2"));
                  break;
                case 10:
                  eEffect = EffectDamageReduction(GetLocalInt(oObject, "Parm_1"),
                                                  GetLocalInt(oObject, "Parm_2"),
                                                  GetLocalInt(oObject, "Parm_3"));
                  break;
                case 11:
                  eEffect = EffectDamageIncrease(GetLocalInt(oObject, "Parm_1"),
                                                 GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
            case 0xc:
              switch (nEffectCode) {
                case 12:
                  eEffect = EffectEntangle();
                  break;
                case 13:
                  eEffect = EffectDeath(GetLocalInt(oObject, "Parm_1"),
                                        GetLocalInt(oObject, "Parm_2"));
                  break;
                case 14:
                  eEffect = EffectKnockdown();
                  break;
                case 15:
                  eEffect = EffectCurse(GetLocalInt(oObject, "Parm_1"),
                                        GetLocalInt(oObject, "Parm_2"),
                                        GetLocalInt(oObject, "Parm_3"),
                                        GetLocalInt(oObject, "Parm_4"),
                                        GetLocalInt(oObject, "Parm_5"),
                                        GetLocalInt(oObject, "Parm_6"));
                  break;
              } break;
          } break;
        case 0x10:
          switch (nEffectCode & 0xc) {
            case 0x0:
              switch (nEffectCode) {
                case 16:
                  eEffect = EffectParalyze();
                  break;
                case 17:
                  eEffect = EffectSpellImmunity(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 18:
                  eEffect = EffectDeaf();
                  break;
                case 19:
                  eEffect = EffectSleep();
                  break;
              } break;
            case 0x4:
              switch (nEffectCode) {
                case 20:
                  eEffect = EffectCharmed();
                  break;
                case 21:
                  eEffect = EffectConfused();
                  break;
                case 22:
                  eEffect = EffectFrightened();
                  break;
                case 23:
                  eEffect = EffectDominated();
                  break;
              } break;
            case 0x8:
              switch (nEffectCode) {
                case 24:
                  eEffect = EffectDazed();
                  break;
                case 25:
                  eEffect = EffectStunned();
                  break;
                case 26:
                  eEffect = EffectRegenerate(GetLocalInt(oObject, "Parm_1"),
                                             GetLocalFloat(oObject, "Parm_2"));
                  break;
                case 27:
                  eEffect = EffectMovementSpeedIncrease(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0xc:
              switch (nEffectCode) {
                case 28:
                  eEffect = EffectAreaOfEffect(GetLocalInt(oObject, "Parm_1"),
                                               GetLocalString(oObject, "Parm_2"),
                                               GetLocalString(oObject, "Parm_3"),
                                               GetLocalString(oObject, "Parm_4"));
                  break;
                case 29:
                  eEffect = EffectVisualEffect(GetLocalInt(oObject, "Parm_1"),
                                               GetLocalInt(oObject, "Parm_2"));
                  break;
                case 30:
                  eEffect = EffectBeam(GetLocalInt(oObject, "Parm_1"),
                                       GetLocalObject(oObject, "Parm_2"),
                                       GetLocalInt(oObject, "Parm_3"),
                                       GetLocalInt(oObject, "Parm_4"));
                  break;
                case 31:
                  eEffect = EffectSpellResistanceIncrease(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
          } break;
        case 0x20:
          switch (nEffectCode & 0xc) {
            case 0x0:
              switch (nEffectCode) {
                case 32:
                  eEffect = EffectPoison(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 33:
                  eEffect = EffectDisease(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 34:
                  eEffect = EffectSilence();
                  break;
                case 35:
                  eEffect = EffectHaste();
                  break;
              } break;
            case 0x4:
              switch (nEffectCode) {
                case 36:
                  eEffect = EffectSlow();
                  break;
                case 37:
                  eEffect = EffectImmunity(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 38:
                  eEffect = EffectDamageImmunityIncrease(GetLocalInt(oObject, "Parm_1"),
                                                         GetLocalInt(oObject, "Parm_2"));
                  break;
                case 39:
                  eEffect = EffectTemporaryHitpoints(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0x8:
              switch (nEffectCode) {
                case 40:
                  eEffect = EffectSkillIncrease(GetLocalInt(oObject, "Parm_1"),
                                                GetLocalInt(oObject, "Parm_2"));
                  break;
                case 41:
                  eEffect = EffectTurned();
                  break;
                case 42:
                  eEffect = EffectHitPointChangeWhenDying(GetLocalFloat(oObject, "Parm_1"));
                  break;
                case 43:
                  eEffect = EffectAbilityDecrease(GetLocalInt(oObject, "Parm_1"),
                                                  GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
            case 0xc:
              switch (nEffectCode) {
                case 44:
                  eEffect = EffectAttackDecrease(GetLocalInt(oObject, "Parm_1"),
                                                 GetLocalInt(oObject, "Parm_2"));
                  break;
                case 45:
                  eEffect = EffectDamageDecrease(GetLocalInt(oObject, "Parm_1"),
                                                 GetLocalInt(oObject, "Parm_2"));
                  break;
                case 46:
                  eEffect = EffectDamageImmunityDecrease(GetLocalInt(oObject, "Parm_1"),
                                                         GetLocalInt(oObject, "Parm_2"));
                  break;
                case 47:
                  eEffect = EffectACDecrease(GetLocalInt(oObject, "Parm_1"),
                                             GetLocalInt(oObject, "Parm_2"),
                                             GetLocalInt(oObject, "Parm_3"));
                  break;
              } break;
          } break;
        case 0x30:
          switch (nEffectCode & 0xc) {
            case 0x0:
              switch (nEffectCode) {
                case 48:
                  eEffect = EffectMovementSpeedDecrease(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 49:
                  eEffect = EffectSavingThrowDecrease(GetLocalInt(oObject, "Parm_1"),
                                                      GetLocalInt(oObject, "Parm_2"),
                                                      GetLocalInt(oObject, "Parm_3"));
                  break;
                case 50:
                  eEffect = EffectSkillDecrease(GetLocalInt(oObject, "Parm_1"),
                                                GetLocalInt(oObject, "Parm_2"));
                  break;
                case 51:
                  eEffect = EffectSpellResistanceDecrease(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0x4:
              switch (nEffectCode) {
                case 52:
                  eEffect = EffectInvisibility(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 53:
                  eEffect = EffectConcealment(GetLocalInt(oObject, "Parm_1"),
                                              GetLocalInt(oObject, "Parm_2"));
                  break;
                case 54:
                  eEffect = EffectDarkness();
                  break;
                case 55:
                  eEffect = EffectDispelMagicAll(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0x8:
              switch (nEffectCode) {
                case 56:
                  eEffect = EffectUltravision();
                  break;
                case 57:
                  eEffect = EffectNegativeLevel(GetLocalInt(oObject, "Parm_1"),
                                                GetLocalInt(oObject, "Parm_2"));
                  break;
                case 58:
                  eEffect = EffectPolymorph(GetLocalInt(oObject, "Parm_1"),
                                            GetLocalInt(oObject, "Parm_2"));
                  break;
                case 59:
                  eEffect = EffectSanctuary(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0xc:
              switch (nEffectCode) {
                case 60:
                  eEffect = EffectTrueSeeing();
                  break;
                case 61:
                  eEffect = EffectSeeInvisible();
                  break;
                case 62:
                  eEffect = EffectTimeStop();
                  break;
                case 63:
                  eEffect = EffectBlindness();
                  break;
              } break;
          } break;
      } break;
    case 0x40:
      switch (nEffectCode & 0x30) {
        case 0x0:
          switch (nEffectCode & 0xc) {
            case 0x0:
              switch (nEffectCode) {
                case 64:
                  eEffect = EffectSpellLevelAbsorption(GetLocalInt(oObject, "Parm_1"),
                                                       GetLocalInt(oObject, "Parm_2"),
                                                       GetLocalInt(oObject, "Parm_3"));
                  break;
                case 65:
                  eEffect = EffectDispelMagicBest(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 66:
                  eEffect = EffectMissChance(GetLocalInt(oObject, "Parm_1"),
                                             GetLocalInt(oObject, "Parm_2"));
                  break;
                case 67:
                  eEffect = EffectDisappearAppear(GetLocalLocation(oObject, "Parm_1"),
                                                  GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
            case 0x4:
              switch (nEffectCode) {
                case 68:
                  eEffect = EffectDisappear(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 69:
                  eEffect = EffectAppear(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 70:
                  eEffect = EffectModifyAttacks(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 71:
                  eEffect = EffectDamageShield(GetLocalInt(oObject, "Parm_1"),
                                               GetLocalInt(oObject, "Parm_2"),
                                               GetLocalInt(oObject, "Parm_3"));
                  break;
              } break;
            case 0x8:
              switch (nEffectCode) {
                case 72:
                  eEffect = EffectSwarm(GetLocalInt(oObject, "Parm_1"),
                                        GetLocalString(oObject, "Parm_2"),
                                        GetLocalString(oObject, "Parm_3"),
                                        GetLocalString(oObject, "Parm_4"),
                                        GetLocalString(oObject, "Parm_5"));
                  break;
                case 73:
                  eEffect = EffectTurnResistanceDecrease(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 74:
                  eEffect = EffectTurnResistanceIncrease(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 75:
                  eEffect = EffectPetrify();
                  break;
              } break;
            case 0xc:
              switch (nEffectCode) {
                case 76:
                  eEffect = EffectCutsceneParalyze();
                  break;
                case 77:
                  eEffect = EffectCutsceneDominated();
                  break;
                case 78:
                  eEffect = EffectSpellFailure(GetLocalInt(oObject, "Parm_1"),
                                               GetLocalInt(oObject, "Parm_2"));
                  break;
                case 79:
                  eEffect = EffectEthereal();
                  break;
              } break;
          } break;
        case 0x10:
          switch (nEffectCode & 0xc) {
            case 0x0:
              switch (nEffectCode) {
                case 80:
                  eEffect = EffectCutsceneGhost();
                  break;
                case 81:
                  eEffect = EffectCutsceneImmobilize();
                  break;
              } break;
          } break;
      } break;
  }
 return eEffect;
}
