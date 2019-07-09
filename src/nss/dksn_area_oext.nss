/*******************************************************************************
* Description:  OnExit script for Dark Sun module areas.
  Usage:        This script should be added to all areas in the area's variables
                as follows:

                variable name:  OnAreaExit1
                variable type:  string
                variable value: dksn_area_oext

********************************************************************************
* Created By:   Melanie Graham (Nairn)
* Created On:   2019-04-14
*******************************************************************************/
#include "dksn_h2_addons_i"

void main()
{
    object oPC = GetExitingObject();

    if (GetIsPC(oPC) == TRUE) {

        int iAreaType = GetLocalInt(OBJECT_SELF, H2_HTF_AREATYPE);

        // If we've configured a travel cost for the area, apply the htf penalty as
        // the player leaves the area.  Compare the door they're taking to leave
        // to the door they used when they entered so that they don't get penalized
        // if they backtrack because they made a lame directional mistake.
        if ( iAreaType > 0) {

            string sEntryPoint = GetLocalString(GetItemPossessedBy(oPC, PLAYER_TOKEN), GetResRef(OBJECT_SELF) + "_EntryPoint");
            string sExitPoint = GetLocalString(GetItemPossessedBy(oPC, PLAYER_TOKEN), GetResRef(OBJECT_SELF) + "_ExitPoint");

            if (sEntryPoint != sExitPoint) {

                h2_ApplyHTFTravelCost(oPC, h2_GetAreaTravelCost(iAreaType));

            }

            DeleteLocalString(GetItemPossessedBy(oPC, PLAYER_TOKEN), GetResRef(OBJECT_SELF) + "_EntryPoint");
            DeleteLocalString(GetItemPossessedBy(oPC, PLAYER_TOKEN), GetResRef(OBJECT_SELF) + "_ExitPoint");
        }
    }
}


