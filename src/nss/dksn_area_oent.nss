/*******************************************************************************
* Description:  OnEnter script for Dark Sun module areas.
  Usage:        This script should be added to all areas in the area's variables
                as follows:

                variable name:  OnAreaEnter1
                variable type:  string
                variable value: dksn_area_oent

********************************************************************************
* Created By:   Melanie Graham (Nairn)
* Created On:   2019-04-13
*******************************************************************************/
#include "dksn_core_i"
#include "dksn_h2_addons_i"

void main()
{

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == TRUE) {

        int iAreaType = GetLocalInt(OBJECT_SELF, "htf_areatype");

        // If there is an HTF cost associated with travelling this area,
        // Store the tag of the player's point of entry so that it can
        // be used to determine whether or not a penalty should be applied when
        // they leave.
        if (iAreaType > 0) {

            SetLocalString(GetItemPossessedBy(oPC, PLAYER_TOKEN), GetResRef(OBJECT_SELF) + "_EntryPoint", GetTag(GetNearestObject(OBJECT_TYPE_DOOR, oPC)));

            // Send a different message to the PC depending on what kind of terrain they're about to cross.
            string sPCMessage = h2_GetAreaTravelMessage(iAreaType);

            SendMessageToPC(oPC, sPCMessage);

        }
    }
}


