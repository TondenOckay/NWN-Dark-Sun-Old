//::///////////////////////////////////////////////
//:: Name       Spawn Kit On Area Enter
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The idea here is create a *wrapper* place all of your Area On Enter
    scripts here. This makes it a bit more effecient when attempting to
    update the individual scripts (as I found out trying to update the ACME
    module.

*/
//:://////////////////////////////////////////////
//:: Created By: Donny Wilbanks
//:: Created On: 09/17/04
//:://////////////////////////////////////////////

void main()
{
    ExecuteScript("asg_a_onenter",OBJECT_SELF);
    object oParty;
    object oArea;
    object oTarget;

    // Get the creature who triggered this event.
    object oPC = GetExitingObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // If it is day.
    if ( GetIsDay() )
    {
        // If success on a 20% chance.
        if ( Random(100) < 20 )
        {
               // Find the location to which to teleport.
               oTarget = GetWaypointByTag("Encounter1");

              // Save the PC's current location for the return trip.
              SetLocalLocation(oPC, "ls_stored_loc", GetLocation(oPC));

             // Teleport the PC's party (only those in the same area, though).
             oArea = GetArea(oPC);
            // Loop through the PC's party.
            oParty = GetFirstFactionMember(oPC, FALSE);
           while ( oParty != OBJECT_INVALID )
        {
            // Only teleport those in the same area.
            if ( GetArea(oParty) == oArea )
           {
              AssignCommand(oParty, ClearAllActions());
              AssignCommand(oParty, JumpToObject(oTarget));
           }

             // Update the loop.
             oParty = GetNextFactionMember(oPC, FALSE);
       }
      }
    }
             // If it is night.
             if (  GetIsNight() )
          {
            // If success on a 30% chance.
            if ( Random(100) < 30 )
          {
               // Find the location to which to teleport.
               oTarget = GetWaypointByTag("Encounter1");

              // Save the PC's current location for the return trip.
              SetLocalLocation(oPC, "ls_stored_loc", GetLocation(oPC));

              // Teleport the PC's party (only those in the same area, though).
              oArea = GetArea(oPC);
             // Loop through the PC's party.
             oParty = GetFirstFactionMember(oPC, FALSE);
             while ( oParty != OBJECT_INVALID )
          {
            // Only teleport those in the same area.
            if ( GetArea(oParty) == oArea )
           {
              AssignCommand(oParty, ClearAllActions());
              AssignCommand(oParty, JumpToObject(oTarget));
           }

             // Update the loop.
             oParty = GetNextFactionMember(oPC, FALSE);
       }
      }
    }
    }

