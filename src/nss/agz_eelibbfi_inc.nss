//::///////////////////////////////////////////////
//:: Name     Effect Encapsulation Functions
//:: FileName agz_eelibbfi_inc
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"
#include "agz_eelibafi_inc"

// Get the encapsulated effect internal code
// int GetEnxEffectCode(object oObject)
// implemented in agz_aolibbfi_inc for packaging reasons

// Destroy an Effect Encapsulation
// void DestroyEnxEffect(object oEffect)
// implemented in agz_aolibbfi_inc for packaging reasons

// Link the two supplied encapsulated effects, returning oEnxChildEffect
object EnxEffectLinkEffects(object oEnxChildEffect, object oEnxParentEffect)
{
  if ((GetLocalInt(oEnxChildEffect,  AGZ_AO) & AO_TYPE_EFFECT) &&
      (GetLocalInt(oEnxParentEffect, AGZ_AO) & AO_TYPE_EFFECT))
     XSetLocalObject(oEnxChildEffect, "agz_parenteffect", oEnxParentEffect);
  return oEnxChildEffect;
}

// Set the subtype to Extraordinary
object EnxExtraordinaryEffect(object oEnxEffect)
{
  if (GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT)
     SetLocalInt(oEnxEffect, "agz_effect_subtype", SUBTYPE_EXTRAORDINARY);
  return oEnxEffect;
}

// Set the subtype to Magical
object EnxMagicalEffect(object oEnxEffect)
{
  if (GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT)
     SetLocalInt(oEnxEffect, "agz_effect_subtype", SUBTYPE_MAGICAL);
  return oEnxEffect;
}

// Set the subtype to Supernatural
object EnxSupernaturalEffect(object oEnxEffect)
{
  if (GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT)
     SetLocalInt(oEnxEffect, "agz_effect_subtype", SUBTYPE_SUPERNATURAL);
  return oEnxEffect;
}

// Set Encapsulated Effect to be versus a specific alignment.
object EnxVersusAlignmentEffect(object oEnxEffect, int nLawChaos=ALIGNMENT_ALL, int nGoodEvil=ALIGNMENT_ALL)
{
  if (GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT) {
      SetLocalInt(oEnxEffect, "agz_vs_lawchaos", nLawChaos);
      SetLocalInt(oEnxEffect, "agz_vs_goodevil", nGoodEvil);
     }
  return oEnxEffect;
}

// Set Encapsulated Effect to be versus nRacialType.
object EnxVersusRacialTypeEffect(object oEnxEffect, int nRacialType)
{
  if (GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT)
     SetLocalInt(oEnxEffect, "agz_vs_racial", nRacialType);
  return oEnxEffect;
}

// Set Encapsulated Effect to be versus traps.
object EnxVersusTrapEffect(object oEnxEffect)
{
  if (GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT)
     SetLocalInt(oEnxEffect, "agz_vs_traps", TRUE);
  return oEnxEffect;
}

// Extract the Effect from an Encapsulated Effect Object
// - eventually build an effect chain
effect ExtractEffect(object oEnxEffect)
{
  effect eEffect;
  if (!(GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT))
     return eEffect;

  int nSubtype  = GetLocalInt(oEnxEffect, "agz_effect_subtype");

// following statements added for the "whole chain"-modifiers logic
  int nLawChaos = GetLocalInt(oEnxEffect, "agz_vs_lawchaos");
  int nGoodEvil = GetLocalInt(oEnxEffect, "agz_vs_goodevil");
  int nRacial   = GetLocalInt(oEnxEffect, "agz_vs_racial");
  int bVsTraps  = GetLocalInt(oEnxEffect, "agz_vs_traps");

  effect eParent;
  int bParentSet = FALSE;
  do {
     eEffect = basicExtractEffect(oEnxEffect);

/* following statements dropped in favor of a "whole chain"-modifiers logic
     nLawChaos = GetLocalInt(oEnxEffect, "agz_vs_lawchaos");
     nGoodEvil = GetLocalInt(oEnxEffect, "agz_vs_goodevil");
     if (nLawChaos || nGoodEvil)
         eEffect = VersusAlignmentEffect(eEffect, nLawChaos, nGoodEvil);
     nRacial = GetLocalInt(oEnxEffect, "agz_vs_racial");
     if (nRacial)
         eEffect = VersusRacialTypeEffect(eEffect, nRacial);
     if (GetLocalInt(oEnxEffect, "agz_vs_traps"))
         eEffect = VersusTrapEffect(eEffect);
*/

     if (bParentSet)
        eEffect = EffectLinkEffects(eEffect, eParent);

     eParent = eEffect;
     bParentSet = TRUE;
     oEnxEffect = GetLocalObject(oEnxEffect, "agz_parenteffect");

  } while (GetLocalInt(oEnxEffect, AGZ_AO) & AO_TYPE_EFFECT);

// in a chain the subtype is decided by the head of the chain only
// (BW behaviour is that a new effect is created with each Link and only its subtype
//  matters, so it must be set on the already linked effect)
  switch (nSubtype) {
        case SUBTYPE_EXTRAORDINARY:
            eEffect = ExtraordinaryEffect(eEffect); break;
        case SUBTYPE_SUPERNATURAL:
            eEffect = SupernaturalEffect(eEffect); break;
        case SUBTYPE_MAGICAL:
            eEffect = MagicalEffect(eEffect); break;
  }

// tentatively apply the same logic to the Versus modifiers
  if (nLawChaos || nGoodEvil)
      eEffect = VersusAlignmentEffect(eEffect, nLawChaos, nGoodEvil);
  if (nRacial)
      eEffect = VersusRacialTypeEffect(eEffect, nRacial);
  if (bVsTraps)
      eEffect = VersusTrapEffect(eEffect);

  return eEffect;
}

