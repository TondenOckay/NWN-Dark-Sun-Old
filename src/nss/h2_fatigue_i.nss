/*
Filename:           h2_fatigue_i
System:             fatigue
Author:             Edward Beck (0100010)
Date Created:       Sept. 11th, 2006
Summary:
HCR2 h2_fatigue_i script.
This is an include script for the fatigue subsystem.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date: Dec 31st, 2006
Revision Author: 0100010
Revision Summary: v1.5
Adjusted code to deal with changes to timer functions.

*/

#include "h2_fatigue_c"
#include "h2_core_i"

const string H2_CURR_FATIGUE = "H2_CURR_FATIGUE";
const string H2_IS_FATIGUED = "H2_IS_FATIGUED";
const string H2_FATIGUE_INFO_BAR = "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||";
const string H2_FATIGUE_EFFECTS = "H2_FATIGUE_EFFECTS";
const string H2_FATIGUE_TIMER_SCRIPT = "h2_fatiguetimer";
const string H2_FATIGUE_SAVE_COUNT = "H2_FATIGUE_SAVE_COUNT";

void h2_InitFatigueCheck(object oPC)
{
    if (!GetLocalInt(oPC, H2_IS_FATIGUED) && GetLocalFloat(oPC, H2_CURR_FATIGUE) == 0.0)
        SetLocalFloat(oPC, H2_CURR_FATIGUE, 1.0);

    int timerID = h2_CreateTimer(oPC, H2_FATIGUE_TIMER_SCRIPT, HoursToSeconds(1));
    h2_StartTimer(timerID);
}

void h2_DisplayFatigueInfoBar(object oPC)
{
    int fatigueCount = FloatToInt(GetLocalFloat(oPC,  H2_CURR_FATIGUE) * 100.0);
    string greenBar = h2_ColorText(GetSubString(H2_FATIGUE_INFO_BAR, 0, fatigueCount), 0, 255, 0);
    string redBar = h2_ColorText(GetSubString(H2_FATIGUE_INFO_BAR, fatigueCount, 100 - fatigueCount), 255, 0, 0);
    SendMessageToPC(oPC, H2_TEXT_FATIGUE + greenBar + redBar);
}

void h2_DoFatigueFortitudeCheck(object oPC)
{
    SetLocalInt(oPC, H2_IS_FATIGUED, TRUE);
    int saveCount = GetLocalInt(oPC, H2_FATIGUE_SAVE_COUNT);
    SendMessageToPC(oPC, H2_TEXT_NEAR_COLLAPSE);
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 2.0));
    PlayVoiceChat(VOICE_CHAT_REST, oPC);
    int fortCheck = FortitudeSave(oPC, saveCount + 10);
    if (!fortCheck || saveCount >= 10)
    {
        effect eStrLoss = ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_STRENGTH, 1));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eStrLoss, oPC);
        effect eDexLoss = ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_DEXTERITY, 1));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDexLoss, oPC);
        effect eMovement = ExtraordinaryEffect(EffectMovementSpeedDecrease(10));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eMovement, oPC);
        if (saveCount >= 10 && !fortCheck)
        {
            if (GetRacialType(oPC) == RACIAL_TYPE_ELF || GetRacialType(oPC) == RACIAL_TYPE_HALFELF)
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ExtraordinaryEffect(EffectKnockdown()), oPC, 180.0);
            else
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ExtraordinaryEffect(EffectSleep()), oPC, 180.0);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ExtraordinaryEffect(EffectVisualEffect(VFX_IMP_SLEEP)), oPC, 180.0);
            }
            AssignCommand(oPC, SpeakString(H2_TEXT_COLLAPSE));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ExtraordinaryEffect(EffectBlindness()), oPC, 180.0);
            SetLocalFloat(oPC, H2_CURR_FATIGUE, 0.33);
        }
    }
    SetLocalInt(oPC, H2_FATIGUE_SAVE_COUNT, saveCount + 1);
}

void h2_PerformFatigueCheck(object oPC)
{
    if (h2_GetPlayerPersistentInt(oPC, H2_PLAYER_STATE) == H2_PLAYER_STATE_DEAD)
        return;

    float fatigueDrop = 1.0 / H2_FATIGUE_HOURS_WITHOUT_REST;
    float currFatigue = GetLocalFloat(oPC, H2_CURR_FATIGUE);
    if (currFatigue > 0.0)
        currFatigue = currFatigue - fatigueDrop;
    if (currFatigue < 0.0)
        currFatigue = 0.0;
    SetLocalFloat(oPC, H2_CURR_FATIGUE, currFatigue);
    if (H2_FATIGUE_DISPLAY_INFO_BAR)
        h2_DisplayFatigueInfoBar(oPC);

    if (currFatigue < 0.33 && currFatigue > 0.0)
    {
        SendMessageToPC(oPC, H2_TEXT_TIRED1);
        AssignCommand(oPC, SpeakString(H2_TEXT_YAWNS));
        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED));
    }
    if (currFatigue == 0.0)
        h2_DoFatigueFortitudeCheck(oPC);
    else
        DeleteLocalInt(oPC, H2_FATIGUE_SAVE_COUNT);
}


