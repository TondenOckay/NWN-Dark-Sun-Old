//::///////////////////////////////////////////////
//:: Name     Itemproperty Encaps. Functions (autogen)
//:: FileName agz_iplibafi_inc
//:://////////////////////////////////////////////
/*
  agz 20031221 0.20.01

  Automatically generated from parsed nwscript 1.59
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"


object IPnxItemPropertyAbilityBonus(int nAbility, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 1);
 SetLocalInt(oResult, "Parm_1", nAbility);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyACBonus(int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 2);
 SetLocalInt(oResult, "Parm_1", nBonus);
 return oResult;
}

object IPnxItemPropertyACBonusVsAlign(int nAlignGroup, int nACBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 3);
 SetLocalInt(oResult, "Parm_1", nAlignGroup);
 SetLocalInt(oResult, "Parm_2", nACBonus);
 return oResult;
}

object IPnxItemPropertyACBonusVsDmgType(int nDamageType, int nACBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 4);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nACBonus);
 return oResult;
}

object IPnxItemPropertyACBonusVsRace(int nRace, int nACBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 5);
 SetLocalInt(oResult, "Parm_1", nRace);
 SetLocalInt(oResult, "Parm_2", nACBonus);
 return oResult;
}

object IPnxItemPropertyACBonusVsSAlign(int nAlign, int nACBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 6);
 SetLocalInt(oResult, "Parm_1", nAlign);
 SetLocalInt(oResult, "Parm_2", nACBonus);
 return oResult;
}

object IPnxItemPropertyEnhancementBonus(int nEnhancementBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 7);
 SetLocalInt(oResult, "Parm_1", nEnhancementBonus);
 return oResult;
}

object IPnxItemPropertyEnhancementBonusVsAlign(int nAlignGroup, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 8);
 SetLocalInt(oResult, "Parm_1", nAlignGroup);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyEnhancementBonusVsRace(int nRace, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 9);
 SetLocalInt(oResult, "Parm_1", nRace);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyEnhancementBonusVsSAlign(int nAlign, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 10);
 SetLocalInt(oResult, "Parm_1", nAlign);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyEnhancementPenalty(int nPenalty)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 11);
 SetLocalInt(oResult, "Parm_1", nPenalty);
 return oResult;
}

object IPnxItemPropertyWeightReduction(int nReduction)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 12);
 SetLocalInt(oResult, "Parm_1", nReduction);
 return oResult;
}

object IPnxItemPropertyBonusFeat(int nFeat)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 13);
 SetLocalInt(oResult, "Parm_1", nFeat);
 return oResult;
}

object IPnxItemPropertyBonusLevelSpell(int nClass, int nSpellLevel)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 14);
 SetLocalInt(oResult, "Parm_1", nClass);
 SetLocalInt(oResult, "Parm_2", nSpellLevel);
 return oResult;
}

object IPnxItemPropertyCastSpell(int nSpell, int nNumUses)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 15);
 SetLocalInt(oResult, "Parm_1", nSpell);
 SetLocalInt(oResult, "Parm_2", nNumUses);
 return oResult;
}

object IPnxItemPropertyDamageBonus(int nDamageType, int nDamage)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 16);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nDamage);
 return oResult;
}

object IPnxItemPropertyDamageBonusVsAlign(int nAlignGroup, int nDamageType, int nDamage)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 17);
 SetLocalInt(oResult, "Parm_1", nAlignGroup);
 SetLocalInt(oResult, "Parm_2", nDamageType);
 SetLocalInt(oResult, "Parm_3", nDamage);
 return oResult;
}

object IPnxItemPropertyDamageBonusVsRace(int nRace, int nDamageType, int nDamage)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 18);
 SetLocalInt(oResult, "Parm_1", nRace);
 SetLocalInt(oResult, "Parm_2", nDamageType);
 SetLocalInt(oResult, "Parm_3", nDamage);
 return oResult;
}

object IPnxItemPropertyDamageBonusVsSAlign(int nAlign, int nDamageType, int nDamage)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 19);
 SetLocalInt(oResult, "Parm_1", nAlign);
 SetLocalInt(oResult, "Parm_2", nDamageType);
 SetLocalInt(oResult, "Parm_3", nDamage);
 return oResult;
}

object IPnxItemPropertyDamageImmunity(int nDamageType, int nImmuneBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 20);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nImmuneBonus);
 return oResult;
}

object IPnxItemPropertyDamagePenalty(int nPenalty)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 21);
 SetLocalInt(oResult, "Parm_1", nPenalty);
 return oResult;
}

object IPnxItemPropertyDamageReduction(int nEnhancement, int nHPSoak)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 22);
 SetLocalInt(oResult, "Parm_1", nEnhancement);
 SetLocalInt(oResult, "Parm_2", nHPSoak);
 return oResult;
}

object IPnxItemPropertyDamageResistance(int nDamageType, int nHPResist)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 23);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nHPResist);
 return oResult;
}

object IPnxItemPropertyDamageVulnerability(int nDamageType, int nVulnerability)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 24);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 SetLocalInt(oResult, "Parm_2", nVulnerability);
 return oResult;
}

object IPnxItemPropertyDarkvision()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 25);
 return oResult;
}

object IPnxItemPropertyDecreaseAbility(int nAbility, int nModifier)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 26);
 SetLocalInt(oResult, "Parm_1", nAbility);
 SetLocalInt(oResult, "Parm_2", nModifier);
 return oResult;
}

object IPnxItemPropertyDecreaseAC(int nModifierType, int nPenalty)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 27);
 SetLocalInt(oResult, "Parm_1", nModifierType);
 SetLocalInt(oResult, "Parm_2", nPenalty);
 return oResult;
}

object IPnxItemPropertyDecreaseSkill(int nSkill, int nPenalty)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 28);
 SetLocalInt(oResult, "Parm_1", nSkill);
 SetLocalInt(oResult, "Parm_2", nPenalty);
 return oResult;
}

object IPnxItemPropertyContainerReducedWeight(int nContainerType)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 29);
 SetLocalInt(oResult, "Parm_1", nContainerType);
 return oResult;
}

object IPnxItemPropertyExtraMeleeDamageType(int nDamageType)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 30);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 return oResult;
}

object IPnxItemPropertyExtraRangeDamageType(int nDamageType)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 31);
 SetLocalInt(oResult, "Parm_1", nDamageType);
 return oResult;
}

object IPnxItemPropertyHaste()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 32);
 return oResult;
}

object IPnxItemPropertyHolyAvenger()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 33);
 return oResult;
}

object IPnxItemPropertyImmunityMisc(int nImmunityType)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 34);
 SetLocalInt(oResult, "Parm_1", nImmunityType);
 return oResult;
}

object IPnxItemPropertyImprovedEvasion()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 35);
 return oResult;
}

object IPnxItemPropertyBonusSpellResistance(int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 36);
 SetLocalInt(oResult, "Parm_1", nBonus);
 return oResult;
}

object IPnxItemPropertyBonusSavingThrowVsX(int nBonusType, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 37);
 SetLocalInt(oResult, "Parm_1", nBonusType);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyBonusSavingThrow(int nBaseSaveType, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 38);
 SetLocalInt(oResult, "Parm_1", nBaseSaveType);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyKeen()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 39);
 return oResult;
}

object IPnxItemPropertyLight(int nBrightness, int nColor)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 40);
 SetLocalInt(oResult, "Parm_1", nBrightness);
 SetLocalInt(oResult, "Parm_2", nColor);
 return oResult;
}

object IPnxItemPropertyMaxRangeStrengthMod(int nModifier)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 41);
 SetLocalInt(oResult, "Parm_1", nModifier);
 return oResult;
}

object IPnxItemPropertyNoDamage()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 42);
 return oResult;
}

object IPnxItemPropertyOnHitProps(int nProperty, int nSaveDC, int nSpecial = 0)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 43);
 SetLocalInt(oResult, "Parm_1", nProperty);
 SetLocalInt(oResult, "Parm_2", nSaveDC);
 SetLocalInt(oResult, "Parm_3", nSpecial);
 return oResult;
}

object IPnxItemPropertyReducedSavingThrowVsX(int nBaseSaveType, int nPenalty)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 44);
 SetLocalInt(oResult, "Parm_1", nBaseSaveType);
 SetLocalInt(oResult, "Parm_2", nPenalty);
 return oResult;
}

object IPnxItemPropertyReducedSavingThrow(int nBonusType, int nPenalty)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 45);
 SetLocalInt(oResult, "Parm_1", nBonusType);
 SetLocalInt(oResult, "Parm_2", nPenalty);
 return oResult;
}

object IPnxItemPropertyRegeneration(int nRegenAmount)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 46);
 SetLocalInt(oResult, "Parm_1", nRegenAmount);
 return oResult;
}

object IPnxItemPropertySkillBonus(int nSkill, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 47);
 SetLocalInt(oResult, "Parm_1", nSkill);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertySpellImmunitySpecific(int nSpell)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 48);
 SetLocalInt(oResult, "Parm_1", nSpell);
 return oResult;
}

object IPnxItemPropertySpellImmunitySchool(int nSchool)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 49);
 SetLocalInt(oResult, "Parm_1", nSchool);
 return oResult;
}

object IPnxItemPropertyThievesTools(int nModifier)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 50);
 SetLocalInt(oResult, "Parm_1", nModifier);
 return oResult;
}

object IPnxItemPropertyAttackBonus(int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 51);
 SetLocalInt(oResult, "Parm_1", nBonus);
 return oResult;
}

object IPnxItemPropertyAttackBonusVsAlign(int nAlignGroup, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 52);
 SetLocalInt(oResult, "Parm_1", nAlignGroup);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyAttackBonusVsRace(int nRace, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 53);
 SetLocalInt(oResult, "Parm_1", nRace);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyAttackBonusVsSAlign(int nAlignment, int nBonus)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 54);
 SetLocalInt(oResult, "Parm_1", nAlignment);
 SetLocalInt(oResult, "Parm_2", nBonus);
 return oResult;
}

object IPnxItemPropertyAttackPenalty(int nPenalty)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 55);
 SetLocalInt(oResult, "Parm_1", nPenalty);
 return oResult;
}

object IPnxItemPropertyUnlimitedAmmo(int nAmmoDamage = IP_CONST_UNLIMITEDAMMO_BASIC)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 56);
 SetLocalInt(oResult, "Parm_1", nAmmoDamage);
 return oResult;
}

object IPnxItemPropertyLimitUseByAlign(int nAlignGroup)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 57);
 SetLocalInt(oResult, "Parm_1", nAlignGroup);
 return oResult;
}

object IPnxItemPropertyLimitUseByClass(int nClass)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 58);
 SetLocalInt(oResult, "Parm_1", nClass);
 return oResult;
}

object IPnxItemPropertyLimitUseByRace(int nRace)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 59);
 SetLocalInt(oResult, "Parm_1", nRace);
 return oResult;
}

object IPnxItemPropertyLimitUseBySAlign(int nAlignment)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 60);
 SetLocalInt(oResult, "Parm_1", nAlignment);
 return oResult;
}

object IPnxItemPropertyVampiricRegeneration(int nRegenAmount)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 61);
 SetLocalInt(oResult, "Parm_1", nRegenAmount);
 return oResult;
}

object IPnxItemPropertyTrap(int nTrapLevel, int nTrapType)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 62);
 SetLocalInt(oResult, "Parm_1", nTrapLevel);
 SetLocalInt(oResult, "Parm_2", nTrapType);
 return oResult;
}

object IPnxItemPropertyTrueSeeing()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 63);
 return oResult;
}

object IPnxItemPropertyOnMonsterHitProperties(int nProperty, int nSpecial = 0)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 64);
 SetLocalInt(oResult, "Parm_1", nProperty);
 SetLocalInt(oResult, "Parm_2", nSpecial);
 return oResult;
}

object IPnxItemPropertyTurnResistance(int nModifier)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 65);
 SetLocalInt(oResult, "Parm_1", nModifier);
 return oResult;
}

object IPnxItemPropertyMassiveCritical(int nDamage)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 66);
 SetLocalInt(oResult, "Parm_1", nDamage);
 return oResult;
}

object IPnxItemPropertyFreeAction()
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 67);
 return oResult;
}

object IPnxItemPropertyMonsterDamage(int nDamage)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 68);
 SetLocalInt(oResult, "Parm_1", nDamage);
 return oResult;
}

object IPnxItemPropertyImmunityToSpellLevel(int nLevel)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 69);
 SetLocalInt(oResult, "Parm_1", nLevel);
 return oResult;
}

object IPnxItemPropertySpecialWalk(int nWalkType = 0)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 70);
 SetLocalInt(oResult, "Parm_1", nWalkType);
 return oResult;
}

object IPnxItemPropertyHealersKit(int nModifier)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 71);
 SetLocalInt(oResult, "Parm_1", nModifier);
 return oResult;
}

object IPnxItemPropertyWeightIncrease(int nWeight)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 72);
 SetLocalInt(oResult, "Parm_1", nWeight);
 return oResult;
}

object IPnxItemPropertyOnHitCastSpell(int nSpell, int nLevel)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 73);
 SetLocalInt(oResult, "Parm_1", nSpell);
 SetLocalInt(oResult, "Parm_2", nLevel);
 return oResult;
}

object IPnxItemPropertyVisualEffect(int nEffect)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 74);
 SetLocalInt(oResult, "Parm_1", nEffect);
 return oResult;
}

object IPnxItemPropertyArcaneSpellFailure(int nModLevel)
{
 object oResult = CreateAbstractObject(AO_TYPE_ITEMPROPERTY);
 SetLocalInt(oResult, "agz_itemproperty_code", 75);
 SetLocalInt(oResult, "Parm_1", nModLevel);
 return oResult;
}

itemproperty ExtractItemProperty(object oObject)
{
  itemproperty ipItemProperty;
  if (!(GetLocalInt(oObject, "agz_AO") & AO_TYPE_ITEMPROPERTY))
     return ipItemProperty;
  int nItemPropertyCode = GetLocalInt(oObject, "agz_itemproperty_code");
  switch (nItemPropertyCode & 0xc0) {
    case 0x0:
      switch (nItemPropertyCode & 0x30) {
        case 0x0:
          switch (nItemPropertyCode & 0xc) {
            case 0x0:
              switch (nItemPropertyCode) {
                case 1:
                  ipItemProperty = ItemPropertyAbilityBonus(GetLocalInt(oObject, "Parm_1"),
                                                            GetLocalInt(oObject, "Parm_2"));
                  break;
                case 2:
                  ipItemProperty = ItemPropertyACBonus(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 3:
                  ipItemProperty = ItemPropertyACBonusVsAlign(GetLocalInt(oObject, "Parm_1"),
                                                              GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
            case 0x4:
              switch (nItemPropertyCode) {
                case 4:
                  ipItemProperty = ItemPropertyACBonusVsDmgType(GetLocalInt(oObject, "Parm_1"),
                                                                GetLocalInt(oObject, "Parm_2"));
                  break;
                case 5:
                  ipItemProperty = ItemPropertyACBonusVsRace(GetLocalInt(oObject, "Parm_1"),
                                                             GetLocalInt(oObject, "Parm_2"));
                  break;
                case 6:
                  ipItemProperty = ItemPropertyACBonusVsSAlign(GetLocalInt(oObject, "Parm_1"),
                                                               GetLocalInt(oObject, "Parm_2"));
                  break;
                case 7:
                  ipItemProperty = ItemPropertyEnhancementBonus(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0x8:
              switch (nItemPropertyCode) {
                case 8:
                  ipItemProperty = ItemPropertyEnhancementBonusVsAlign(GetLocalInt(oObject, "Parm_1"),
                                                                       GetLocalInt(oObject, "Parm_2"));
                  break;
                case 9:
                  ipItemProperty = ItemPropertyEnhancementBonusVsRace(GetLocalInt(oObject, "Parm_1"),
                                                                      GetLocalInt(oObject, "Parm_2"));
                  break;
                case 10:
                  ipItemProperty = ItemPropertyEnhancementBonusVsSAlign(GetLocalInt(oObject, "Parm_1"),
                                                                        GetLocalInt(oObject, "Parm_2"));
                  break;
                case 11:
                  ipItemProperty = ItemPropertyEnhancementPenalty(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0xc:
              switch (nItemPropertyCode) {
                case 12:
                  ipItemProperty = ItemPropertyWeightReduction(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 13:
                  ipItemProperty = ItemPropertyBonusFeat(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 14:
                  ipItemProperty = ItemPropertyBonusLevelSpell(GetLocalInt(oObject, "Parm_1"),
                                                               GetLocalInt(oObject, "Parm_2"));
                  break;
                case 15:
                  ipItemProperty = ItemPropertyCastSpell(GetLocalInt(oObject, "Parm_1"),
                                                         GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
          } break;
        case 0x10:
          switch (nItemPropertyCode & 0xc) {
            case 0x0:
              switch (nItemPropertyCode) {
                case 16:
                  ipItemProperty = ItemPropertyDamageBonus(GetLocalInt(oObject, "Parm_1"),
                                                           GetLocalInt(oObject, "Parm_2"));
                  break;
                case 17:
                  ipItemProperty = ItemPropertyDamageBonusVsAlign(GetLocalInt(oObject, "Parm_1"),
                                                                  GetLocalInt(oObject, "Parm_2"),
                                                                  GetLocalInt(oObject, "Parm_3"));
                  break;
                case 18:
                  ipItemProperty = ItemPropertyDamageBonusVsRace(GetLocalInt(oObject, "Parm_1"),
                                                                 GetLocalInt(oObject, "Parm_2"),
                                                                 GetLocalInt(oObject, "Parm_3"));
                  break;
                case 19:
                  ipItemProperty = ItemPropertyDamageBonusVsSAlign(GetLocalInt(oObject, "Parm_1"),
                                                                   GetLocalInt(oObject, "Parm_2"),
                                                                   GetLocalInt(oObject, "Parm_3"));
                  break;
              } break;
            case 0x4:
              switch (nItemPropertyCode) {
                case 20:
                  ipItemProperty = ItemPropertyDamageImmunity(GetLocalInt(oObject, "Parm_1"),
                                                              GetLocalInt(oObject, "Parm_2"));
                  break;
                case 21:
                  ipItemProperty = ItemPropertyDamagePenalty(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 22:
                  ipItemProperty = ItemPropertyDamageReduction(GetLocalInt(oObject, "Parm_1"),
                                                               GetLocalInt(oObject, "Parm_2"));
                  break;
                case 23:
                  ipItemProperty = ItemPropertyDamageResistance(GetLocalInt(oObject, "Parm_1"),
                                                                GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
            case 0x8:
              switch (nItemPropertyCode) {
                case 24:
                  ipItemProperty = ItemPropertyDamageVulnerability(GetLocalInt(oObject, "Parm_1"),
                                                                   GetLocalInt(oObject, "Parm_2"));
                  break;
                case 25:
                  ipItemProperty = ItemPropertyDarkvision();
                  break;
                case 26:
                  ipItemProperty = ItemPropertyDecreaseAbility(GetLocalInt(oObject, "Parm_1"),
                                                               GetLocalInt(oObject, "Parm_2"));
                  break;
                case 27:
                  ipItemProperty = ItemPropertyDecreaseAC(GetLocalInt(oObject, "Parm_1"),
                                                          GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
            case 0xc:
              switch (nItemPropertyCode) {
                case 28:
                  ipItemProperty = ItemPropertyDecreaseSkill(GetLocalInt(oObject, "Parm_1"),
                                                             GetLocalInt(oObject, "Parm_2"));
                  break;
                case 29:
                  ipItemProperty = ItemPropertyContainerReducedWeight(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 30:
                  ipItemProperty = ItemPropertyExtraMeleeDamageType(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 31:
                  ipItemProperty = ItemPropertyExtraRangeDamageType(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
          } break;
        case 0x20:
          switch (nItemPropertyCode & 0xc) {
            case 0x0:
              switch (nItemPropertyCode) {
                case 32:
                  ipItemProperty = ItemPropertyHaste();
                  break;
                case 33:
                  ipItemProperty = ItemPropertyHolyAvenger();
                  break;
                case 34:
                  ipItemProperty = ItemPropertyImmunityMisc(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 35:
                  ipItemProperty = ItemPropertyImprovedEvasion();
                  break;
              } break;
            case 0x4:
              switch (nItemPropertyCode) {
                case 36:
                  ipItemProperty = ItemPropertyBonusSpellResistance(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 37:
                  ipItemProperty = ItemPropertyBonusSavingThrowVsX(GetLocalInt(oObject, "Parm_1"),
                                                                   GetLocalInt(oObject, "Parm_2"));
                  break;
                case 38:
                  ipItemProperty = ItemPropertyBonusSavingThrow(GetLocalInt(oObject, "Parm_1"),
                                                                GetLocalInt(oObject, "Parm_2"));
                  break;
                case 39:
                  ipItemProperty = ItemPropertyKeen();
                  break;
              } break;
            case 0x8:
              switch (nItemPropertyCode) {
                case 40:
                  ipItemProperty = ItemPropertyLight(GetLocalInt(oObject, "Parm_1"),
                                                     GetLocalInt(oObject, "Parm_2"));
                  break;
                case 41:
                  ipItemProperty = ItemPropertyMaxRangeStrengthMod(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 42:
                  ipItemProperty = ItemPropertyNoDamage();
                  break;
                case 43:
                  ipItemProperty = ItemPropertyOnHitProps(GetLocalInt(oObject, "Parm_1"),
                                                          GetLocalInt(oObject, "Parm_2"),
                                                          GetLocalInt(oObject, "Parm_3"));
                  break;
              } break;
            case 0xc:
              switch (nItemPropertyCode) {
                case 44:
                  ipItemProperty = ItemPropertyReducedSavingThrowVsX(GetLocalInt(oObject, "Parm_1"),
                                                                     GetLocalInt(oObject, "Parm_2"));
                  break;
                case 45:
                  ipItemProperty = ItemPropertyReducedSavingThrow(GetLocalInt(oObject, "Parm_1"),
                                                                  GetLocalInt(oObject, "Parm_2"));
                  break;
                case 46:
                  ipItemProperty = ItemPropertyRegeneration(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 47:
                  ipItemProperty = ItemPropertySkillBonus(GetLocalInt(oObject, "Parm_1"),
                                                          GetLocalInt(oObject, "Parm_2"));
                  break;
              } break;
          } break;
        case 0x30:
          switch (nItemPropertyCode & 0xc) {
            case 0x0:
              switch (nItemPropertyCode) {
                case 48:
                  ipItemProperty = ItemPropertySpellImmunitySpecific(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 49:
                  ipItemProperty = ItemPropertySpellImmunitySchool(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 50:
                  ipItemProperty = ItemPropertyThievesTools(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 51:
                  ipItemProperty = ItemPropertyAttackBonus(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0x4:
              switch (nItemPropertyCode) {
                case 52:
                  ipItemProperty = ItemPropertyAttackBonusVsAlign(GetLocalInt(oObject, "Parm_1"),
                                                                  GetLocalInt(oObject, "Parm_2"));
                  break;
                case 53:
                  ipItemProperty = ItemPropertyAttackBonusVsRace(GetLocalInt(oObject, "Parm_1"),
                                                                 GetLocalInt(oObject, "Parm_2"));
                  break;
                case 54:
                  ipItemProperty = ItemPropertyAttackBonusVsSAlign(GetLocalInt(oObject, "Parm_1"),
                                                                   GetLocalInt(oObject, "Parm_2"));
                  break;
                case 55:
                  ipItemProperty = ItemPropertyAttackPenalty(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0x8:
              switch (nItemPropertyCode) {
                case 56:
                  ipItemProperty = ItemPropertyUnlimitedAmmo(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 57:
                  ipItemProperty = ItemPropertyLimitUseByAlign(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 58:
                  ipItemProperty = ItemPropertyLimitUseByClass(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 59:
                  ipItemProperty = ItemPropertyLimitUseByRace(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0xc:
              switch (nItemPropertyCode) {
                case 60:
                  ipItemProperty = ItemPropertyLimitUseBySAlign(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 61:
                  ipItemProperty = ItemPropertyVampiricRegeneration(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 62:
                  ipItemProperty = ItemPropertyTrap(GetLocalInt(oObject, "Parm_1"),
                                                    GetLocalInt(oObject, "Parm_2"));
                  break;
                case 63:
                  ipItemProperty = ItemPropertyTrueSeeing();
                  break;
              } break;
          } break;
      } break;
    case 0x40:
      switch (nItemPropertyCode & 0x30) {
        case 0x0:
          switch (nItemPropertyCode & 0xc) {
            case 0x0:
              switch (nItemPropertyCode) {
                case 64:
                  ipItemProperty = ItemPropertyOnMonsterHitProperties(GetLocalInt(oObject, "Parm_1"),
                                                                      GetLocalInt(oObject, "Parm_2"));
                  break;
                case 65:
                  ipItemProperty = ItemPropertyTurnResistance(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 66:
                  ipItemProperty = ItemPropertyMassiveCritical(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 67:
                  ipItemProperty = ItemPropertyFreeAction();
                  break;
              } break;
            case 0x4:
              switch (nItemPropertyCode) {
                case 68:
                  ipItemProperty = ItemPropertyMonsterDamage(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 69:
                  ipItemProperty = ItemPropertyImmunityToSpellLevel(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 70:
                  ipItemProperty = ItemPropertySpecialWalk(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 71:
                  ipItemProperty = ItemPropertyHealersKit(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
            case 0x8:
              switch (nItemPropertyCode) {
                case 72:
                  ipItemProperty = ItemPropertyWeightIncrease(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 73:
                  ipItemProperty = ItemPropertyOnHitCastSpell(GetLocalInt(oObject, "Parm_1"),
                                                              GetLocalInt(oObject, "Parm_2"));
                  break;
                case 74:
                  ipItemProperty = ItemPropertyVisualEffect(GetLocalInt(oObject, "Parm_1"));
                  break;
                case 75:
                  ipItemProperty = ItemPropertyArcaneSpellFailure(GetLocalInt(oObject, "Parm_1"));
                  break;
              } break;
          } break;
      } break;
  }
 return ipItemProperty;
}

