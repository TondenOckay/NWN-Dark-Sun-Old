//::///////////////////////////////////////////////
//:: FileName testquest1_inv
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/18/2016 12:45:15 PM
//:://////////////////////////////////////////////
#include "nw_i0_tool"

int StartingConditional()
{

    // Make sure the PC speaker has these items in their inventory
    if(!HasItem(GetPCSpeaker(), "NW_IT_BOOK001"))
        return FALSE;

    return TRUE;
}
