//::///////////////////////////////////////////////
//:: Name       Spawn Kit On Area Enter
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
// Put this script OnEnter.


// Clears all actions and jumps the caller to the provided object.
// (Useful when this needs to be delayed.)
void ClearAndJumpToObject(object oDestination);
void ClearAndJumpToObject(object oDestination)
{
    ClearAllActions();
    JumpToObject(oDestination);
}


void main()
{
    effect eVFX;
    object oTarget;

    // Get the creature who triggered this event.
    object oPC = GetEnteringObject();

 // Only fire once per PC.
    if ( GetLocalInt(oPC, "DO_ONCE__" + GetTag(OBJECT_SELF)) )
        return;
    SetLocalInt(oPC, "DO_ONCE__" + GetTag(OBJECT_SELF), TRUE);

    // Abort if the PC is not a certain race.
    if ( GetRacialType(oPC) != RACIAL_TYPE_HALFELF )
        return;

    // Find the location to which to teleport.
    oTarget = GetWaypointByTag("THRI_KREEN");

    // Save the PC's current location for the return trip.
    SetLocalLocation(oPC, "ls_stored_loc", GetLocation(oPC));

    // Teleport the PC.
    eVFX = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, oPC);
    DelayCommand(1.0, AssignCommand(oPC, ClearAndJumpToObject(oTarget)));


//:://////////////////////////////////////////////
//:: Created By: Donny Wilbanks
//:: Created On: 09/17/04
//:://////////////////////////////////////////////


{
    ExecuteScript("asg_a_onenter",OBJECT_SELF);
}}
