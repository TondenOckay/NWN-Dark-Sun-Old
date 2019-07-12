//DMFI Persistence wrapper functions for HCR2
//This include file contains the wrapper functions for the
//persistent settings of the DMFI Wand and Widget package
//Advanced users can adapt this to the database system that
//they want to use for NWN.
//

//:://////////////////////////////////////////////
//:: Created By: aerisarn, The Dark Sun Team
//:: Created On:
//:://////////////////////////////////////////////

#include "h2_persistence_c"


const int DMFI_DB_TYPE = 1; //DMFI_DB_TYPE_BIOWARE;

void FlushDMFIPersistentData(string sDBName)
{
    // no flushing required for Bioware database
}

int IsDMFIPersistentDataDirty(string sDBName)
{
    return FALSE; // bioware database system has no cache, so is never dirty
}

//Int functions
int GetDMFIPersistentInt(string sDBName, string sDBSetting, object oPlayer = OBJECT_INVALID)
{
    return h2_GetExternalInt(sDBSetting, oPlayer);
}

void SetDMFIPersistentInt(string sDBName, string sDBSetting, int iDBValue, object oPlayer = OBJECT_INVALID)
{
	h2_SetExternalInt(sDBSetting, iDBValue, oPlayer);
}

//Float functions
float GetDMFIPersistentFloat(string sDBName, string sDBSetting, object oPlayer = OBJECT_INVALID)
{
    return h2_GetExternalFloat(sDBSetting, oPlayer);
}

void SetDMFIPersistentFloat(string sDBName, string sDBSetting, float fDBValue, object oPlayer = OBJECT_INVALID)
{
	h2_SetExternalFloat(sDBSetting, fDBValue, oPlayer);
}

//String functions
string GetDMFIPersistentString(string sDBName, string sDBSetting, object oPlayer = OBJECT_INVALID)
{
	return h2_GetExternalString(sDBSetting, oPlayer);
}

void SetDMFIPersistentString(string sDBName, string sDBSetting, string sDBValue, object oPlayer = OBJECT_INVALID)
{
	h2_SetExternalString(sDBSetting, sDBValue, oPlayer);
}
