//  gen_harm_pots
////////////////////////////////////////////////////////////////////////////////
// Created By: Genisys / Guile
// Created On: 12/3/2016
////////////////////////////////////////////////////////////////////////////////
// Copyright © 2016
////////////////////////////////////////////////////////////////////////////////
/*  This is only the OnActivate event for a tag based scripted item!
//////////////////////////////////////////////////////////////////////////////*/
//Required Include (DO NOT TOUCH!)
#include "x2_inc_switches"
//------------------------------------------------------------------------------

// oItem was activated ("activate item" or "unique power").
// Run by the module.
void OnActivate(object oItem, object oTarg, location lTarg, object oPC){
  object oTarget = oPC;
  int nDamage, nHeal;
  effect eHeal, eDam;
  effect eVis = EffectVisualEffect(246);
  effect eVis2 = EffectVisualEffect(VFX_IMP_HEALING_G);
  if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD) {
        //Figure out the amount of damage to heal
        nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        //Set the heal effect
        eHeal = EffectHeal(nHeal);
        //Apply heal effect and VFX impact
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oTarget);
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(oTarget, SPELL_HARM, FALSE));
  }
  else {
        nDamage = GetCurrentHitPoints(oTarget) - d4(1);
        eDam = EffectDamage(nDamage,DAMAGE_TYPE_NEGATIVE);
        //Apply the VFX impact and effects
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
  }
}

//////////////////////////////////////////////////////////////////////////////
// ##### WARNINING:: DON'T TOUCH ANYTHING BELOW THIS LINE!!! #### ///////////
////////////////////////////////////////////////////////////////////////////

// The main function.
void main()
{
    int nEvent = GetUserDefinedItemEventNumber();

    // Spells might continue to their spell scripts. All other events are
    // completely handled by this script.
    if ( nEvent != X2_ITEM_EVENT_SPELLCAST_AT )
        SetExecutedScriptReturnValue();

    // Determine which event triggered this script's execution.
    switch ( nEvent )
    {
        // Item was activated ("activate item" or "unique power").
        case X2_ITEM_EVENT_ACTIVATE:
                OnActivate(GetItemActivated(), GetItemActivatedTarget(),
                           GetItemActivatedTargetLocation(), GetItemActivator());
                break;
    }
}

