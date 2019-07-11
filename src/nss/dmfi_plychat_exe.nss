//::///////////////////////////////////////////////
//:: DMFI - OnPlayerChat functions processor
//:: dmfi_plychat_exe
//:://////////////////////////////////////////////
/*
    Processor for the OnPlayerChat-triggered DMFI functions.
    All subfunctions moved to an include: dmfi_plychat_fnc
*/
//:://////////////////////////////////////////////
//:: Created By: The DMFI Team
//:: __Modifications__
//:: 2007.12.12 Merle
//::    - revisions for NWN patch 1.69
//:: 2008.03.24 tsunami282
//::    - renamed from dmfi_voice_exe, updated to work with event hooking system
//:: 2008.06.23 Prince Demetri & Night Journey
//::    - added languages: Sylvan, Mulhorandi, Rashemi
//:: 2008.07.30 morderon
//::    - better emote processing, allow certain dot commands for PC's
//:: 2011.12.29 magus
//::    - Extracted DMFI includes and subfunctions to dmfi_plychat_fnc
//::    - Purpose is to isolate DMFI chat functions so that they can be used by
//::        builders in their own custom OnChat event modifications


#include "dmfi_plychat_fnc"

////////////////////////////////////////////////////////////////////////
void main()
{
    int bScriptEnd = X2_EXECUTE_SCRIPT_CONTINUE;
    int nVolume = GetPCChatVolume();
    object oShouter = GetPCChatSpeaker();
    string sSaid = GetPCChatMessage();

// SpawnScriptDebugger();
// DMFISendMessageToPC(oShouter, IntToString(nVolume)+">> "+sSaid, FALSE, "737");

    // pass on any heard text to registered listeners
    // since listeners are set by DM's, pass the raw unprocessed command text to them
    bScriptEnd = RelayTextToEavesdropper(oShouter, nVolume, sSaid);

    if (bScriptEnd == X2_EXECUTE_SCRIPT_CONTINUE)
    {
        // see if we're supposed to listen on this channel
        if ((nVolume == TALKVOLUME_TALK && DMFI_LISTEN_ON_CHANNEL_TALK) ||
            (nVolume == TALKVOLUME_SILENT_SHOUT && DMFI_LISTEN_ON_CHANNEL_DM) ||
            (nVolume == TALKVOLUME_WHISPER && DMFI_LISTEN_ON_CHANNEL_WHISPER) ||
            (nVolume == TALKVOLUME_PARTY && DMFI_LISTEN_ON_CHANNEL_PARTY) ||
            (nVolume == TALKVOLUME_SHOUT && DMFI_LISTEN_ON_CHANNEL_SHOUT))
        {
            // yes we are
            // now see if we have a command to parse
            // special chars:
            //     [ = speak in alternate language
            //     * = perform emote
            //     : = throw voice to last designated target
            //     ; = throw voice to master / animal companion / familiar / henchman / summon
            //     , = throw voice summon / henchman / familiar / animal companion / master
            //     . = command to execute

            int bChangedText = 0;
            object oTarget = OBJECT_INVALID;
            int iTargetType = 0;

            // eat leading whitespace
            while (GetStringLeft(sSaid, 1) == " ")
            {
                sSaid = GetStringRight(sSaid, GetStringLength(sSaid)-1);
            }

            string sLeadChar = GetStringLeft(sSaid, 1);
            string s2ndChar = GetStringRight(GetStringLeft(sSaid, 2), 1);

            // check for target selection
            if (s2ndChar != sLeadChar) // doubled leadins should be ignored
            {
                if (sLeadChar == ":")
                {
                    if (GetIsDM(oShouter) || GetIsDMPossessed(oShouter))
                    {
                        // last creature targeted with DMFI Voice Widget
                        iTargetType = 1;
                        oTarget = GetLocalObject(oShouter, "dmfi_VoiceTarget");
                    }
                    else
                    {
                        // non-DM's can't target others
                        iTargetType = -1;
                        oTarget = OBJECT_INVALID;
                    }
                }
                else if (sLeadChar == ";")
                {
                    // master / animal companion / familiar / henchman / summon
                    iTargetType = 2;
                    oTarget = GetMaster(oShouter);
                    if (!GetIsObjectValid(oTarget))
                    {
                        oTarget = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oShouter);
                        if (!GetIsObjectValid(oTarget))
                        {
                            oTarget = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oShouter);
                            if (!GetIsObjectValid(oTarget))
                            {
                                oTarget = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oShouter);
                                if (!GetIsObjectValid(oTarget))
                                {
                                    oTarget = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oShouter);
                                }
                            }
                        }
                    }
                }
                else if (sLeadChar == ",")
                {
                    // summon / henchman / familiar / animal companion / master
                    iTargetType = 3;
                    oTarget = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oShouter);
                    if (!GetIsObjectValid(oTarget))
                    {
                        oTarget = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oShouter);
                        if (!GetIsObjectValid(oTarget))
                        {
                            oTarget = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oShouter);
                            if (!GetIsObjectValid(oTarget))
                            {
                                oTarget = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oShouter);
                                if (!GetIsObjectValid(oTarget))
                                {
                                    oTarget = GetMaster(oShouter);
                                }
                            }
                        }
                    }
                }

                if (iTargetType != 0)
                {
                    // eat the targeting character and any whitespace following it
                    sSaid = GetStringRight(sSaid, GetStringLength(sSaid)-1);
                    while (GetStringLeft(sSaid, 1) == " ")
                    {
                        sSaid = GetStringRight(sSaid, GetStringLength(sSaid)-1);
                    }
                    sLeadChar = GetStringLeft(sSaid, 1);
                }

                // now parse special command char (.command, *emote, [lang)
                if (sLeadChar == ".")
                {
                    bChangedText = 1;
                    if (oTarget == OBJECT_INVALID)
                    {
                        // 2008.05.29 tsunami282 - no target set, so dot command uses DMFI targeting wand
                        oTarget = GetLocalObject(oShouter, "dmfi_univ_target");
                    }

                    if (GetIsObjectValid(oTarget))
                    {
                        ParseCommand(oTarget, oShouter, sSaid);
                        sSaid = "";
                    }
                    else
                    {
                        // target invalid
                        bChangedText = 1;
                        DMFISendMessageToPC(oShouter, "Invalid command target - not processed.", FALSE, DMFI_MESSAGE_COLOR_ALERT);
                        sSaid = "";
                    }
                }
                else
                {
                    // parse special speech/chats

                    // alternate languages
                    if (sLeadChar == "[")
                    {
                        bChangedText = 1;
                        if (oTarget == OBJECT_INVALID) oTarget = oShouter; // untargeted languages spoken by self
                        if (GetIsObjectValid(oTarget))
                        {
                            sSaid = TranslateToLanguage(sSaid, oTarget, nVolume, oShouter);
                        }
                        else
                        {
                            // target invalid
                            bChangedText = 1;
                            DMFISendMessageToPC(oShouter, "Invalid language target - not processed.", FALSE, DMFI_MESSAGE_COLOR_ALERT);
                            sSaid = "";
                        }
                    }
                    // emotes
                    if (FindSubString(sSaid, "*")!=-1)
                    {
                        bChangedText = 1;
                        if (oTarget == OBJECT_INVALID) oTarget = oShouter; // untargeted emotes apply to self
                        if (GetIsObjectValid(oTarget))
                        {
                            ParseEmote(sSaid, oTarget);
                        }
                        else
                        {
                            // target invalid
                            bChangedText = 1;
                            DMFISendMessageToPC(oShouter, "Invalid emote target - not processed.", FALSE, DMFI_MESSAGE_COLOR_ALERT);
                            sSaid = "";
                        }
                    }
                }
            }

            if (iTargetType != 0)
            {
                // throw the message
                if (sSaid != "")
                {
                    bChangedText = 1;
                    AssignCommand(oTarget, SpeakString(sSaid, nVolume));
                    if (DMFI_LOG_CONVERSATION)
                    {
                        WriteTimestampedLogEntry(" ["+GetName(GetArea(oTarget))+ "] " + GetName(oTarget) + ": " + sSaid);
                    }
                    sSaid = "";
                }
            }
            else
            {
                // log what was said
                if (DMFI_LOG_CONVERSATION && (sSaid != ""))
                {
                    WriteTimestampedLogEntry(" ["+GetName(GetArea(oShouter))+ "] " + GetName(oShouter) + ": " + sSaid);
                }
            }

            if (bChangedText)
            {
                SetPCChatMessage(sSaid);
                bScriptEnd = X2_EXECUTE_SCRIPT_END;
            }
        }
    }

    SetExecutedScriptReturnValue(bScriptEnd);
}
