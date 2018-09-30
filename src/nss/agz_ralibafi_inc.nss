//::///////////////////////////////////////////////
//:: Name     Raw Objects Library RawArray Functions
//:: FileName agz_ralibafi_inc
//:://////////////////////////////////////////////
/*
    agz 20030922 0.19.01 - new functions
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"
#include "agz_if_raw"

// Create a RawArray object
object RawArray()
{return CreateAbstractObject(AO_SUBTYPE_RAW_ARRAY);}


// Get top index value of the RawArray
int RawArrayGetTop(object oRawArray)
{return GetLocalInt(oRawArray, AGZ_RAW_TOP);}

// Set top index value of the RawArray, returns nTop
int RawArraySetTop(object oRawArray, int nTop)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY)
    SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArraySetTop 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return nTop;
}

// Get bottom index value of the RawArray
int RawArrayGetBottom(object oRawArray)
{return GetLocalInt(oRawArray, AGZ_RAW_BOTTOM);}

// Set bottom index value of the RawArray, returns nBottom
int RawArraySetBottom(object oRawArray, int nBottom)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY)
    SetLocalInt(oRawArray, AGZ_RAW_BOTTOM, nBottom);
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArraySetBottom 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return nBottom;
}


// Get int at index
int RawArrayGetInt(object oRawArray, int nIndex)
{return GetLocalInt(oRawArray, IntToString(nIndex));}

// Put int at index, returns nValue
int RawArrayPutInt(object oRawArray, int nIndex, int nValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY)
    SetLocalInt(oRawArray, IntToString(nIndex), nValue);
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayPutInt 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return nValue;
}

// Put nValue at top+1, sets top=top+1, returns nValue
int RawArrayAddInt(object oRawArray, int nValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
    SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
    SetLocalInt(oRawArray, IntToString(nTop), nValue);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayAddInt 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return nValue;
}

// Delete int at index, returns deleted value
int RawArrayDelInt(object oRawArray, int nIndex)
{
 int nValue;
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    string sIndex = IntToString(nIndex);
    nValue = GetLocalInt(oRawArray, sIndex);
    DeleteLocalInt(oRawArray, sIndex);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayDelInt 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return nValue;
}


// Get float at index
float RawArrayGetFloat(object oRawArray, int nIndex)
{return GetLocalFloat(oRawArray, IntToString(nIndex));}

// Put float at index, returns fValue
float RawArrayPutFloat(object oRawArray, int nIndex, float fValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY)
    SetLocalFloat(oRawArray, IntToString(nIndex), fValue);
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayPutFloat 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return fValue;
}

// Put fValue at top+1, sets top=top+1, returns fValue
float RawArrayAddFloat(object oRawArray, float fValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
    SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
    SetLocalFloat(oRawArray, IntToString(nTop), fValue);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayAddFloat 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return fValue;
}

// Delete float at index, returns deleted value
float RawArrayDelFloat(object oRawArray, int nIndex)
{
 float fValue;
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    string sIndex = IntToString(nIndex);
    fValue = GetLocalFloat(oRawArray, sIndex);
    DeleteLocalFloat(oRawArray, sIndex);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayDelFloat 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return fValue;
}


// Get string at index
string RawArrayGetString(object oRawArray, int nIndex)
{return GetLocalString(oRawArray, IntToString(nIndex));}

// Put string at index, returns sValue
string RawArrayPutString(object oRawArray, int nIndex, string sValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY)
    SetLocalString(oRawArray, IntToString(nIndex), sValue);
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayPutString 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return sValue;
}

// Put sValue at top+1, sets top=top+1, returns sValue
string RawArrayAddString(object oRawArray, string sValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
    SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
    SetLocalString(oRawArray, IntToString(nTop), sValue);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayAddString 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return sValue;
}

// Delete string at index, returns deleted value
string RawArrayDelString(object oRawArray, int nIndex)
{
 string sValue;
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    string sIndex = IntToString(nIndex);
    sValue = GetLocalString(oRawArray, sIndex);
    DeleteLocalString(oRawArray, sIndex);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayDelString 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return sValue;
}


// Get location at index
location RawArrayGetLocation(object oRawArray, int nIndex)
{return GetLocalLocation(oRawArray, IntToString(nIndex));}

// Put location at index, returns lValue
location RawArrayPutLocation(object oRawArray, int nIndex, location lValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY)
    SetLocalLocation(oRawArray, IntToString(nIndex), lValue);
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayPutLocation 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return lValue;
}

// Put lValue at top+1, sets top=top+1, returns lValue
location RawArrayAddLocation(object oRawArray, location lValue)
{
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
    SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
    SetLocalLocation(oRawArray, IntToString(nTop), lValue);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayAddLocation 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return lValue;
}

// Delete location at index, returns deleted value
location RawArrayDelLocation(object oRawArray, int nIndex)
{
 location lValue;
 if (GetLocalInt(oRawArray, AGZ_AO) == AO_SUBTYPE_RAW_ARRAY) {
    string sIndex = IntToString(nIndex);
    lValue = GetLocalLocation(oRawArray, sIndex);
    DeleteLocalLocation(oRawArray, sIndex);
    }
 else if (agz_LOG_EXCEPTIONS)
         agz_Log("RawArrayDelLocation 1st argument:"+
                    ObjectToString(oRawArray)+" not a RawArray");
 return lValue;
}

//
// no-check implementations
//

// Set top index value of the RawArray, returns nTop
int RawArraySetTopNoCheck(object oRawArray, int nTop)
{
 SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
 return nTop;
}

// Set bottom index value of the RawArray, returns nBottom
int RawArraySetBottomNoCheck(object oRawArray, int nBottom)
{
 SetLocalInt(oRawArray, AGZ_RAW_BOTTOM, nBottom);
 return nBottom;
}


// Put int at index, returns nValue
int RawArrayPutIntNoCheck(object oRawArray, int nIndex, int nValue)
{
 SetLocalInt(oRawArray, IntToString(nIndex), nValue);
 return nValue;
}

// Put nValue at top+1, sets top=top+1, returns nValue
int RawArrayAddIntNoCheck(object oRawArray, int nValue)
{
 int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
 SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
 SetLocalInt(oRawArray, IntToString(nTop), nValue);
 return nValue;
}

// Delete int at index, returns deleted value
int RawArrayDelIntNoCheck(object oRawArray, int nIndex)
{
 string sIndex = IntToString(nIndex);
 int nValue = GetLocalInt(oRawArray, sIndex);
 DeleteLocalInt(oRawArray, sIndex);
 return nValue;
}


// Put float at index, returns fValue
float RawArrayPutFloatNoCheck(object oRawArray, int nIndex, float fValue)
{
 SetLocalFloat(oRawArray, IntToString(nIndex), fValue);
 return fValue;
}

// Put fValue at top+1, sets top=top+1, returns fValue
float RawArrayAddFloatNoCheck(object oRawArray, float fValue)
{
 int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
 SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
 SetLocalFloat(oRawArray, IntToString(nTop), fValue);
 return fValue;
}

// Delete float at index, returns deleted value
float RawArrayDelFloatNoCheck(object oRawArray, int nIndex)
{
 string sIndex = IntToString(nIndex);
 float fValue = GetLocalFloat(oRawArray, sIndex);
 DeleteLocalFloat(oRawArray, sIndex);
 return fValue;
}


// Put string at index, returns sValue
string RawArrayPutStringNoCheck(object oRawArray, int nIndex, string sValue)
{
 SetLocalString(oRawArray, IntToString(nIndex), sValue);
 return sValue;
}

// Put sValue at top+1, sets top=top+1, returns sValue
string RawArrayAddStringNoCheck(object oRawArray, string sValue)
{
 int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
 SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
 SetLocalString(oRawArray, IntToString(nTop), sValue);
 return sValue;
}

// Delete string at index, returns deleted value
string RawArrayDelStringNoCheck(object oRawArray, int nIndex)
{
 string sIndex = IntToString(nIndex);
 string sValue = GetLocalString(oRawArray, sIndex);
 DeleteLocalString(oRawArray, sIndex);
 return sValue;
}


// Put location at index, returns lValue
location RawArrayPutLocationNoCheck(object oRawArray, int nIndex, location lValue)
{
 SetLocalLocation(oRawArray, IntToString(nIndex), lValue);
 return lValue;
}

// Put lValue at top+1, sets top=top+1, returns lValue
location RawArrayAddLocationNoCheck(object oRawArray, location lValue)
{
 int nTop = GetLocalInt(oRawArray, AGZ_RAW_TOP) + 1;
 SetLocalInt(oRawArray, AGZ_RAW_TOP, nTop);
 SetLocalLocation(oRawArray, IntToString(nTop), lValue);
 return lValue;
}

// Delete location at index, returns deleted value
location RawArrayDelLocationNoCheck(object oRawArray, int nIndex)
{
 string sIndex = IntToString(nIndex);
 location lValue = GetLocalLocation(oRawArray, sIndex);
 DeleteLocalLocation(oRawArray, sIndex);
 return lValue;
}


