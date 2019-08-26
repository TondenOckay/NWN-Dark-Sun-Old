/*******************************************************************************
* Description:  Add-on functions for the HCR ruleset, specifically created for
                the Dark Sun module.
  Usage:        Include in scripts where these add-on functions will be called.
********************************************************************************
* Created By:   Melanie Graham (Nairn)
* Created On:   2019-04-13
*******************************************************************************/
#include "h2_hungerthrst_i"
#include "h2_fatigue_i"
#include "h2_core_i"
#include "dksn_core_i"

// String Constants
const string H2_LAST_PC_FINDWATER_TIME = "H2_LAST_PC_FINDWATER_TIME";
const string PLAYER_TOKEN = "h2_playerdata";
const string H2_HTF_AREATYPE = "htf_areatype";

// Applies hunger, thirst, and fatigue to the player character that varies based on the area type
// of their possible HTF points to simulate difficult travel conditions
// through desert terrain.
void h2_ApplyHTFTravelCost(object oPC, int iTravelCost);

// Based on the area type, returns a value for the HTF penalty that should be applied.
int h2_GetAreaTravelCost(int iAreaType);

// Based on the area type, returns a string message to set the area's tone.
string h2_GetAreaTravelMessage(int iAreaType);

// Save the last time the player tried to find water.
void h2_SaveLastFindWaterTime(object oPC);

// Find water
void f2_SearchForWater(object oPC, int iAreaType);

/******************************************************************************/

void h2_ApplyHTFTravelCost(object oPC, int iTravelCost) {

    float fCurrentThirst = GetLocalFloat(oPC, H2_HT_CURR_THIRST);
    float fCurrentHunger = GetLocalFloat(oPC, H2_HT_CURR_HUNGER);
    float fCurrentFatigue = GetLocalFloat(oPC, H2_CURR_FATIGUE);

    float dropHTF = IntToFloat(iTravelCost) / 100;

    // Decrement Thirst
    if (fCurrentThirst > 0.0)
        fCurrentThirst = fCurrentThirst - dropHTF;
    if (fCurrentThirst < 0.0)
        fCurrentThirst = 0.0;

    // Decrement Hunger
    if (fCurrentHunger > 0.0)
        fCurrentHunger = fCurrentHunger - dropHTF;
    if (fCurrentHunger < 0.0)
        fCurrentHunger = 0.0;

    // Decrement Fatigue
    if (fCurrentFatigue > 0.0)
        fCurrentFatigue = fCurrentFatigue - dropHTF;
    if (fCurrentFatigue < 0.0)
        fCurrentFatigue = 0.0;

    // Set new values for hunger, thirst and fatigue.
    SetLocalFloat(oPC, H2_HT_CURR_THIRST, fCurrentThirst);
    SetLocalFloat(oPC, H2_HT_CURR_HUNGER, fCurrentHunger);
    SetLocalFloat(oPC, H2_CURR_FATIGUE, fCurrentFatigue);

    // Check to see if this takes the PC down to 0 on any of these values. If
    // so, do the relevant fortitude checks.
    if (fCurrentThirst == 0.0)
        h2_DoThirstFortitudeCheck(oPC);
    else
        DeleteLocalInt(oPC, H2_HT_THIRST_SAVE_COUNT);
    if (fCurrentHunger == 0.0)
        h2_DoHungerFortitudeCheck(oPC);
    else
    {
        DeleteLocalInt(oPC, H2_HT_HUNGER_HOUR_COUNT);
        DeleteLocalInt(oPC, H2_HT_HUNGER_SAVE_COUNT);
    }
    if (fCurrentFatigue == 0.0)
        h2_DoFatigueFortitudeCheck(oPC);
    else
        DeleteLocalInt(oPC, H2_FATIGUE_SAVE_COUNT);

}

int h2_GetAreaTravelCost(int iAreaType) {

    // Based on the area type, return a different cost for traveling the area.

    int iTravelCost = 0;

    switch (iAreaType) {

        case DKSN_AREATYPE_BOULDERFIELD:
            iTravelCost = 33;
            break;
        case DKSN_AREATYPE_DUSTSINK:
            iTravelCost = 50;
            break;
        case DKSN_AREATYPE_MOUNTAIN:
            iTravelCost = 50;
            break;
        case DKSN_AREATYPE_MUDFLAT:
            iTravelCost = 33;
            break;
        case DKSN_AREATYPE_ROCKYBADLAND:
            iTravelCost = 50;
            break;
        case DKSN_AREATYPE_SALTFLAT:
            iTravelCost = 25;
            break;
        case DKSN_AREATYPE_SALTMARSH:
            iTravelCost = 33;
            break;
        case DKSN_AREATYPE_SANDYWASTE:
            iTravelCost = 25;
            break;
        case DKSN_AREATYPE_SCRUBPLAIN:
            iTravelCost = 25;
            break;
        case DKSN_AREATYPE_STONYBARREN:
            iTravelCost = 33;
            break;
        default:
    }
    return iTravelCost;
}

string h2_GetAreaTravelMessage(int iAreaType) {

    string sMessage = "";

    // Based on the area type, return a different string to display to the player.
    switch (iAreaType) {

        case DKSN_AREATYPE_BOULDERFIELD:
            sMessage = "Test Message.";
            break;
        case DKSN_AREATYPE_DUSTSINK:
            sMessage = "";
            break;
        case DKSN_AREATYPE_MOUNTAIN:
            sMessage = "";
            break;
        case DKSN_AREATYPE_MUDFLAT:
            sMessage = "";
            break;
        case DKSN_AREATYPE_ROCKYBADLAND:
            sMessage = "";
            break;
        case DKSN_AREATYPE_SALTFLAT:
            sMessage = "";
            break;
        case DKSN_AREATYPE_SALTMARSH:
            sMessage = "";
            break;
        case DKSN_AREATYPE_SANDYWASTE:
            sMessage = "";
            break;
        case DKSN_AREATYPE_SCRUBPLAIN:
            sMessage = "";
            break;
        case DKSN_AREATYPE_STONYBARREN:
            sMessage = "";
            break;
        default:
            sMessage = "";
    }
    return sMessage;
}

void h2_SaveLastFindWaterTime(object oPC)
{
    int findWaterTime = h2_GetSecondsSinceServerStart();
    string uniquePCID = h2_GetPlayerPersistentString(oPC, H2_UNIQUE_PC_ID);
    h2_SetModLocalInt(uniquePCID + H2_LAST_PC_FINDWATER_TIME, findWaterTime);
}


void h2_SearchForWater(object oPC, int iAreaType) {

    int iAreaTravelCost = h2_GetAreaTravelCost(iAreaType);
    float fFailureChance = iAreaTravelCost * 2.0 / 15.0;
    int nWaterPresent = Random(100);

    ///Skill check to search for water
    int iSkillRoll = h2_SkillCheck(SKILL_TUMBLE, oPC, 2);

    if (iSkillRoll > 10) {

        // Test to see if there is water available to be found.
        if (fFailureChance > IntToFloat(nWaterPresent)) {

            SendMessageToPC(oPC, "Unfortunately, there doesn't seem to be any water here.");

        }
        // If successful, display message and give "water" to the PC
        else {

            // Determine how much water the PC actually found based on skill check and area type
            int iWaterFound = (iAreaTravelCost + iSkillRoll) / 33;

            if (iWaterFound > 0) {
                // Success Message
                SendMessageToPC(oPC, "Success! You found " + IntToString(iWaterFound) + " units of water!");

                // Get the first item in the player's inventory. It's likely not a canteen, but it could be!
                // We have to cycle through all the inventory items because the player might be carrying
                // multiple canteens and no one at Bioware or Beamdog has been thoughtful enough
                // to help us grab the Nth instance of an item in a player's pack
                object oCanteen = GetFirstItemInInventory(oPC);
                int iCanteenSpace = GetLocalInt(oCanteen, H2_HT_MAX_CHARGES) - GetLocalInt(oCanteen, H2_HT_CURR_CHARGES);
                int iCanteenFound = FALSE;

                while ((oCanteen != OBJECT_INVALID) && (iWaterFound != 0)){

                    if ((GetTag(oCanteen) == "h2_canteen") && (iCanteenSpace > 0)){

                        iCanteenFound = TRUE;

                        if (iWaterFound > iCanteenSpace) {
                            SetLocalInt(oCanteen, H2_HT_CURR_CHARGES, iCanteenSpace);
                            iWaterFound = iWaterFound - iCanteenSpace;
                        }
                        else {
                            SetLocalInt(oCanteen, H2_HT_CURR_CHARGES, iWaterFound);
                            iWaterFound = 0;
                        }
                    }

                    GetNextItemInInventory(oPC);
                    iCanteenSpace = GetLocalInt(oCanteen, H2_HT_MAX_CHARGES) - GetLocalInt(oCanteen, H2_HT_CURR_CHARGES);
                }
                // If the PC has canteens but not enough space for all the water, fill them, and tell the PC how much water they are wasting
                if ((iWaterFound > 0) && (iCanteenFound = TRUE)) {

                    SendMessageToPC(oPC, "You have no remaining canteen space, so the extra " + IntToString(iWaterFound) + " units of water you found are reabsorbed into the ground at your feet.");
                }
                // If the PC doesn't have any canteens, tell them how dumb that was and that the water was wasted
                if (iCanteenFound = FALSE) {

                    SendMessageToPC(oPC, "You are not carrying a canteen, so the " + IntToString(iWaterFound) + " units of water you found are reabsorbed into the ground at your feet.");
                }
            }

           else {
            SendMessageToPC(oPC, "Unfortunately, there is no water here.");
           }
       }
    }

    //If failure, send failure message
    else {
       SendMessageToPC(oPC, "You failed to find water!");
    }

}


