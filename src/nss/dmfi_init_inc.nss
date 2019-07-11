//::///////////////////////////////////////////////
//:: dmfi_init_inc
//:://////////////////////////////////////////////
/*
    initialization DMFI include

    Custom Script Systems incorporated:

    To Do:

*/
//:://////////////////////////////////////////////
//:: Created By: DMFI
//:: Last Modified: The Magus (2011 dec 7) streamlining dmfiInitialize
//::                                        long pause at module load eliminated
//:://////////////////////////////////////////////

#include "dmfi_db_inc"

const int DMFI_DEFAULT_EMOTES_MUTED = FALSE;
// colors
const string YELLOWSERV = "<cþf >";
const string DMBLUE     = "<c#ßþ>"; // DM chat

//DECLARATIONS
int dmfiInitialize(object oUser);
void initVoiceTokens();

//IMPLEMENTATION
int dmfiInitialize(object oUser)
{
//*************************************INITIALIZATION CODE***************************************
//***************************************RUNS ONE TIME ***************************************
//voice stuff is module wide
    object oMod = GetModule();

    SendMessageToPC(oUser,YELLOWSERV+":: DMFI Wands & Widgets System ::");

    if (GetLocalInt(oMod, "dmfi_initialized") != 1)
    {
        initVoiceTokens(); // MAGUS: removed loop with 80 calls to IntToString
        SendMessageToAllDMs(DMBLUE+"DMFI voice custom tokens initialized.");
        SetLocalInt(oMod, "dmfi_initialized", 1);
    }

//remainder of settings are user based

    if ((GetLocalInt(oUser, "dmfi_initialized")!=1) && (GetIsDM(oUser) || GetIsDMPossessed(oUser)))
    {
    //if you have campaign variables set - use those settings
        if (GetDMFIPersistentInt("dmfi", "Settings", oUser)==1)
        {
            FloatingTextStringOnCreature(DMBLUE+"DMFI Settings Restored", oUser, FALSE);
            // SendMessageToPC(oUser, "DMFI Settings Restored");

            int n = GetDMFIPersistentInt("dmfi", "dmfi_alignshift", oUser);
            SetCustomToken(20781, IntToString(n));
            SetLocalInt(oUser, "dmfi_alignshift", n);
            SendMessageToPC(oUser, DMBLUE+"Settings: Alignment shift: "+IntToString(n));

            n = GetDMFIPersistentInt("dmfi", "dmfi_safe_factions", oUser);
            SetLocalInt(oUser, "dmfi_safe_factions", n);
            SendMessageToPC(oUser, DMBLUE+"Settings: Factions (1 is DMFI Safe Faction): "+IntToString(n));

            n = GetDMFIPersistentInt("dmfi", "dmfi_damagemodifier", oUser);
            SetLocalInt(oUser, "dmfi_damagemodifier",n);
            SendMessageToPC(oUser, DMBLUE+"Settings: Damage Modifier: "+IntToString(n));

            n = GetDMFIPersistentInt("dmfi","dmfi_buff_party",oUser);
            SetLocalInt(oUser, "dmfi_buff_party", n);
            if (n==1)
                SetCustomToken(20783, "Party");
            else
                SetCustomToken(20783, "Single Target");

            SendMessageToPC(oUser, DMBLUE+"Settings: Buff Party (1 is Party): "+IntToString(n));

            string sLevel = GetDMFIPersistentString("dmfi", "dmfi_buff_level", oUser);
            SetCustomToken(20782, sLevel);
            SetLocalString(oUser, "dmfi_buff_level", sLevel);
            SendMessageToPC(oUser, DMBLUE+"Settings: Buff Level: "+ sLevel);

            n = GetDMFIPersistentInt("dmfi", "dmfi_dicebag", oUser);
            SetLocalInt(oUser, "dmfi_dicebag", n);

            string sText;
            if (n==0)
            {
                SetCustomToken(20681, "Private");
                sText = "Private";
            }
            else  if (n==1)
            {
                SetCustomToken(20681, "Global");
                sText = "Global";
            }
            else if (n==2)
            {
                SetCustomToken(20681, "Local");
                sText = "Local";
            }
            else if (n==3)
            {
                SetCustomToken(20681, "DM Only");
                sText = "DM Only";
            }
            SendMessageToPC(oUser, DMBLUE+"Settings: Dicebag Reporting: "+sText);

            n = GetDMFIPersistentInt("dmfi", "dmfi_dice_no_animate", oUser);
            SetLocalInt(oUser, "dmfi_dice_no_animate", n);
            SendMessageToPC(oUser, DMBLUE+"Settings: Roll Animations (1 is OFF): "+IntToString(n));

            float f = GetDMFIPersistentFloat("dmfi", "dmfi_reputation", oUser);
            SetLocalFloat(oUser, "dmfi_reputation", f);
            SendMessageToPC(oUser, DMBLUE+"Settings: Reputation Adjustment: "+FloatToString(f));

            f = GetDMFIPersistentFloat("dmfi", "dmfi_effectduration", oUser);
            SetLocalFloat(oUser, "dmfi_effectduration", f);
            SendMessageToPC(oUser, DMBLUE+"Settings: Effect Duration: "+FloatToString(f));

            f = GetDMFIPersistentFloat("dmfi", "dmfi_sound_delay", oUser);
            SetLocalFloat(oUser, "dmfi_sound_delay", f);
            SendMessageToPC(oUser, DMBLUE+"Settings: Sound Delay: "+FloatToString(f));

            f = GetDMFIPersistentFloat("dmfi", "dmfi_beamduration", oUser);
            SetLocalFloat(oUser, "dmfi_beamduration", f);
            SendMessageToPC(oUser, DMBLUE+"Settings: Beam Duration: "+FloatToString(f));

            f = GetDMFIPersistentFloat("dmfi", "dmfi_stunduration", oUser);
            SetLocalFloat(oUser, "dmfi_stunduration", f);
            SendMessageToPC(oUser, DMBLUE+"Settings: Stun Duration: "+FloatToString(f));

            f = GetDMFIPersistentFloat("dmfi", "dmfi_saveamount", oUser);
            SetLocalFloat(oUser, "dmfi_saveamount", f);
            SendMessageToPC(oUser, DMBLUE+"Settings: Save Adjustment: "+FloatToString(f));

            f = GetDMFIPersistentFloat("dmfi", "dmfi_effectdelay", oUser);
            SetLocalFloat(oUser, "dmfi_effectdelay", f);
            SendMessageToPC(oUser, DMBLUE+"Settings: Effect Delay: "+FloatToString(f));
        }
        else
        {
            FloatingTextStringOnCreature(YELLOWSERV+"DMFI Default Settings Initialized", oUser, FALSE);
            // SendMessageToPC(oUser, "DMFI Default Settings Initialized");

            //Setting FOUR campaign variables so 1st use will be slow.
            //Recommend initializing your preferences with no players or
            //while there is NO fighting.
            // SetLocalInt(oUser, "dmfi_initialized", 1);
            SetDMFIPersistentInt("dmfi", "Settings", 1, oUser);

            SetCustomToken(20781, "5");
            SetLocalInt(oUser, "dmfi_alignshift", 5);
            SetDMFIPersistentInt("dmfi", "dmfi_alignshift", 5, oUser);
            SendMessageToPC(oUser, DMBLUE+"Settings: Alignment shift: 5");

            SetCustomToken(20783, "Single Target");
            SetLocalInt(oUser, "dmfi_buff_party", 0);
            SetDMFIPersistentInt("dmfi", "dmfi_buff_party", 0, oUser);
            SendMessageToPC(oUser, DMBLUE+"Settings: Buff set to Single Target: ");

            SetCustomToken(20782, "Low");
            SetLocalString(oUser, "dmfi_buff_level", "LOW");
            SetDMFIPersistentString("dmfi", "dmfi_buff_level", "LOW", oUser);
            SendMessageToPC(oUser, DMBLUE+"Settings: Buff Level set to LOW: ");

            SetLocalInt(oUser, "dmfi_dicebag", 0);
            SetCustomToken(20681, "Private");
            SetDMFIPersistentInt("dmfi", "dmfi_dicebag", 0, oUser);
            SendMessageToPC(oUser, DMBLUE+"Settings: Dicebag Rolls set to PRIVATE");

            SetLocalInt(oUser, "", 0);
            SetDMFIPersistentInt("dmfi", "dmfi_safe_factions", 0, oUser);
            SendMessageToPC(oUser, DMBLUE+"Settings: Factions set to BW base behavior");

            SetLocalFloat(oUser, "dmfi_reputation", 5.0);
            SetCustomToken(20784, "5");
            SetDMFIPersistentFloat("dmfi", "dmfi_reputation", 5.0, oUser);
            SendMessageToPC(oUser, DMBLUE+"Settings: Reputation adjustment: 5");

            SetDMFIPersistentFloat("dmfi", "dmfi_effectduration", 60.0, oUser);
            SetLocalFloat(oUser, "dmfi_effectduration", 60.0);
            SetDMFIPersistentFloat("dmfi", "dmfi_sound_delay", 0.2, oUser);
            SetLocalFloat(oUser, "dmfi_sound_delay", 0.2);
            SetDMFIPersistentFloat("dmfi", "dmfi_beamduration", 5.0, oUser);
            SetLocalFloat(oUser, "dmfi_beamduration", 5.0);
            SetDMFIPersistentFloat("dmfi", "dmfi_stunduration", 1000.0,  oUser);
            SetLocalFloat(oUser, "dmfi_stunduration", 1000.0);
            SetDMFIPersistentFloat("dmfi", "dmfi_saveamount", 5.0, oUser);
            SetLocalFloat(oUser, "dmfi_saveamount", 5.0);
            SetDMFIPersistentFloat("dmfi", "dmfi_effectdelay", 1.0, oUser);
            SetLocalFloat(oUser, "dmfi_effectdelay", 1.0);

            SendMessageToPC(oUser, DMBLUE+"Settings: Effect Duration: 60.0");
            SendMessageToPC(oUser, DMBLUE+"Settings: Effect Delay: 1.0");
            SendMessageToPC(oUser, DMBLUE+"Settings: Beam Duration: 5.0");
            SendMessageToPC(oUser, DMBLUE+"Settings: Stun Duration: 1000.0");
            SendMessageToPC(oUser, DMBLUE+"Settings: Sound Delay: 0.2");
            SendMessageToPC(oUser, DMBLUE+"Settings: Save Adjustment: 5.0");
        }
    }
//********************************END INITIALIZATION***************************

    // inits for all users (DM & player)
    if (GetLocalInt(oUser, "dmfi_initialized")!=1)
    {
        int bEmotesMuted;
        if (GetDMFIPersistentInt("dmfi", "Settings", oUser)==1)
        {
            bEmotesMuted = GetDMFIPersistentInt("dmfi", "dmfi_emotemute", oUser);
        }
        else
        {
            bEmotesMuted = DMFI_DEFAULT_EMOTES_MUTED;
            SetDMFIPersistentInt("dmfi", "dmfi_emotemute", bEmotesMuted, oUser);
        }
        SetLocalInt(oUser, "hls_emotemute", bEmotesMuted);
        SendMessageToPC(oUser, YELLOWSERV+"Settings: Emotes "+(bEmotesMuted ? "muted" : "unmuted"));

        SetLocalObject(oUser, "dmfi_VoiceTarget", OBJECT_INVALID);
        SendMessageToPC(oUser, YELLOWSERV+"Settings: Voice throw target cleared");

        SetLocalObject(oUser, "dmfi_univ_target", oUser);
        SendMessageToPC(oUser, YELLOWSERV+"Settings: Command target set to self");

        SetLocalInt(oUser, "dmfi_initialized", 1);
    }

    return TRUE; // no errors detected
}

void initVoiceTokens()
{
    SetCustomToken(20610, GetDMFIPersistentString("dmfi", "hls20610") );
    SetCustomToken(20611, GetDMFIPersistentString("dmfi", "hls20611") );
    SetCustomToken(20612, GetDMFIPersistentString("dmfi", "hls20612") );
    SetCustomToken(20613, GetDMFIPersistentString("dmfi", "hls20613") );
    SetCustomToken(20614, GetDMFIPersistentString("dmfi", "hls20614") );
    SetCustomToken(20615, GetDMFIPersistentString("dmfi", "hls20615") );
    SetCustomToken(20616, GetDMFIPersistentString("dmfi", "hls20616") );
    SetCustomToken(20617, GetDMFIPersistentString("dmfi", "hls20617") );
    SetCustomToken(20618, GetDMFIPersistentString("dmfi", "hls20618") );
    SetCustomToken(20619, GetDMFIPersistentString("dmfi", "hls20619") );
    SetCustomToken(20620, GetDMFIPersistentString("dmfi", "hls20620") );
    SetCustomToken(20621, GetDMFIPersistentString("dmfi", "hls20621") );
    SetCustomToken(20622, GetDMFIPersistentString("dmfi", "hls20622") );
    SetCustomToken(20623, GetDMFIPersistentString("dmfi", "hls20623") );
    SetCustomToken(20624, GetDMFIPersistentString("dmfi", "hls20624") );
    SetCustomToken(20625, GetDMFIPersistentString("dmfi", "hls20625") );
    SetCustomToken(20626, GetDMFIPersistentString("dmfi", "hls20626") );
    SetCustomToken(20627, GetDMFIPersistentString("dmfi", "hls20627") );
    SetCustomToken(20628, GetDMFIPersistentString("dmfi", "hls20628") );
    SetCustomToken(20629, GetDMFIPersistentString("dmfi", "hls20629") );
    SetCustomToken(20630, GetDMFIPersistentString("dmfi", "hls20630") );
    SetCustomToken(20631, GetDMFIPersistentString("dmfi", "hls20631") );
    SetCustomToken(20632, GetDMFIPersistentString("dmfi", "hls20632") );
    SetCustomToken(20633, GetDMFIPersistentString("dmfi", "hls20633") );
    SetCustomToken(20634, GetDMFIPersistentString("dmfi", "hls20634") );
    SetCustomToken(20635, GetDMFIPersistentString("dmfi", "hls20635") );
    SetCustomToken(20636, GetDMFIPersistentString("dmfi", "hls20636") );
    SetCustomToken(20637, GetDMFIPersistentString("dmfi", "hls20637") );
    SetCustomToken(20638, GetDMFIPersistentString("dmfi", "hls20638") );
    SetCustomToken(20639, GetDMFIPersistentString("dmfi", "hls20639") );
    SetCustomToken(20640, GetDMFIPersistentString("dmfi", "hls20640") );
    SetCustomToken(20641, GetDMFIPersistentString("dmfi", "hls20641") );
    SetCustomToken(20642, GetDMFIPersistentString("dmfi", "hls20642") );
    SetCustomToken(20643, GetDMFIPersistentString("dmfi", "hls20643") );
    SetCustomToken(20644, GetDMFIPersistentString("dmfi", "hls20644") );
    SetCustomToken(20645, GetDMFIPersistentString("dmfi", "hls20645") );
    SetCustomToken(20646, GetDMFIPersistentString("dmfi", "hls20646") );
    SetCustomToken(20647, GetDMFIPersistentString("dmfi", "hls20647") );
    SetCustomToken(20648, GetDMFIPersistentString("dmfi", "hls20648") );
    SetCustomToken(20649, GetDMFIPersistentString("dmfi", "hls20649") );
    SetCustomToken(20650, GetDMFIPersistentString("dmfi", "hls20650") );
    SetCustomToken(20651, GetDMFIPersistentString("dmfi", "hls20651") );
    SetCustomToken(20652, GetDMFIPersistentString("dmfi", "hls20652") );
    SetCustomToken(20653, GetDMFIPersistentString("dmfi", "hls20653") );
    SetCustomToken(20654, GetDMFIPersistentString("dmfi", "hls20654") );
    SetCustomToken(20655, GetDMFIPersistentString("dmfi", "hls20655") );
    SetCustomToken(20656, GetDMFIPersistentString("dmfi", "hls20656") );
    SetCustomToken(20657, GetDMFIPersistentString("dmfi", "hls20657") );
    SetCustomToken(20658, GetDMFIPersistentString("dmfi", "hls20658") );
    SetCustomToken(20659, GetDMFIPersistentString("dmfi", "hls20659") );
    SetCustomToken(20660, GetDMFIPersistentString("dmfi", "hls20660") );
    SetCustomToken(20661, GetDMFIPersistentString("dmfi", "hls20661") );
    SetCustomToken(20662, GetDMFIPersistentString("dmfi", "hls20662") );
    SetCustomToken(20663, GetDMFIPersistentString("dmfi", "hls20663") );
    SetCustomToken(20664, GetDMFIPersistentString("dmfi", "hls20664") );
    SetCustomToken(20665, GetDMFIPersistentString("dmfi", "hls20665") );
    SetCustomToken(20666, GetDMFIPersistentString("dmfi", "hls20666") );
    SetCustomToken(20667, GetDMFIPersistentString("dmfi", "hls20667") );
    SetCustomToken(20668, GetDMFIPersistentString("dmfi", "hls20668") );
    SetCustomToken(20669, GetDMFIPersistentString("dmfi", "hls20669") );
    SetCustomToken(20670, GetDMFIPersistentString("dmfi", "hls20670") );
    SetCustomToken(20671, GetDMFIPersistentString("dmfi", "hls20671") );
    SetCustomToken(20672, GetDMFIPersistentString("dmfi", "hls20672") );
    SetCustomToken(20673, GetDMFIPersistentString("dmfi", "hls20673") );
    SetCustomToken(20674, GetDMFIPersistentString("dmfi", "hls20674") );
    SetCustomToken(20675, GetDMFIPersistentString("dmfi", "hls20675") );
    SetCustomToken(20676, GetDMFIPersistentString("dmfi", "hls20676") );
    SetCustomToken(20677, GetDMFIPersistentString("dmfi", "hls20677") );
    SetCustomToken(20678, GetDMFIPersistentString("dmfi", "hls20678") );
    SetCustomToken(20679, GetDMFIPersistentString("dmfi", "hls20679") );
}

//void main(){}
