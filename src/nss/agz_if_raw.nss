//::///////////////////////////////////////////////
//:: Name     Raw Objects Library Functions Prototypes
//:: FileName agz_if_raw
//:://////////////////////////////////////////////
/*
    agz 20030922 0.19.01 - new functions
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//////////////////////////////////////////////////
// RawArray functions
//////////////////////////////////////////////////

// Create a RawArray object
object RawArray();

// Get int at index
int RawArrayGetInt(object oRawArray, int nIndex);
// Put int at index, returns nValue
int RawArrayPutInt(object oRawArray, int nIndex, int nValue);
// Put nValue at top+1, sets top=top+1, returns nValue
int RawArrayAddInt(object oRawArray, int nValue);
// Delete int at index, returns deleted int
int RawArrayDelInt(object oRawArray, int nIndex);

// Get float at index
float RawArrayGetFloat(object oRawArray, int nIndex);
// Put float at index, returns fValue
float RawArrayPutFloat(object oRawArray, int nIndex, float fValue);
// Put fValue at top+1, sets top=top+1, returns fValue
float RawArrayAddFloat(object oRawArray, float fValue);
// Delete float at index, returns deleted float
float RawArrayDelFloat(object oRawArray, int nIndex);

// Get string at index
string RawArrayGetString(object oRawArray, int nIndex);
// Put string at index, returns sValue
string RawArrayPutString(object oRawArray, int nIndex, string sValue);
// Put sValue at top+1, sets top=top+1, returns sValue
string RawArrayAddString(object oRawArray, string sValue);
// Delete string at index, returns deleted string
string RawArrayDelString(object oRawArray, int nIndex);

// Get location at index
location RawArrayGetLocation(object oRawArray, int nIndex);
// Put location at index, returns lValue
location RawArrayPutLocation(object oRawArray, int nIndex, location lValue);
// Put lValue at top+1, sets top=top+1, returns lValue
location RawArrayAddLocation(object oRawArray, location lValue);
// Delete location at index, returns deleted location
location RawArrayDelLocation(object oRawArray, int nIndex);

// Get top index value of the RawArray
// note: top index is maintained only by the Add functions
int RawArrayGetTop(object oRawArray);
// Set top index value of the RawArray, returns nTop
// note: top index is maintained only by the Add functions
int RawArraySetTop(object oRawArray, int nTop);
// Get bottom index value of the RawArray
// note: bottom index is not automatically maintained
int RawArrayGetBottom(object oRawArray);
// Set bottom index value of the RawArray, returns nBottom
// note: bottom index is not automatically maintained
int RawArraySetBottom(object oRawArray, int nBottom);

// Put int at index, returns nValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
int RawArrayPutIntNoCheck(object oRawArray, int nIndex, int nValue);
// Put nValue at top+1, sets top=top+1, returns nValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
int RawArrayAddIntNoCheck(object oRawArray, int nValue);
// Delete int at index, returns deleted int
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
int RawArrayDelIntNoCheck(object oRawArray, int nIndex);

// Put float at index, returns fValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
float RawArrayPutFloatNoCheck(object oRawArray, int nIndex, float fValue);
// Put fValue at top+1, sets top=top+1, returns fValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
float RawArrayAddFloatNoCheck(object oRawArray, float fValue);
// Delete float at index, returns deleted float
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
float RawArrayDelFloatNoCheck(object oRawArray, int nIndex);

// Put string at index, returns sValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
string RawArrayPutStringNoCheck(object oRawArray, int nIndex, string sValue);
// Put sValue at top+1, sets top=top+1, returns sValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
string RawArrayAddStringNoCheck(object oRawArray, string sValue);
// Delete string at index, returns deleted string
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
string RawArrayDelStringNoCheck(object oRawArray, int nIndex);

// Put location at index, returns lValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
location RawArrayPutLocationNoCheck(object oRawArray, int nIndex, location lValue);
// Put lValue at top+1, sets top=top+1, returns lValue
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
location RawArrayAddLocationNoCheck(object oRawArray, location lValue);
// Delete location at index, returns deleted location
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
location RawArrayDelLocationNoCheck(object oRawArray, int nIndex);

// Set top index value of the RawArray, returns nTop
// note: top index is maintained only by the Add functions
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
int RawArraySetTopNoCheck(object oRawArray, int nTop);
// Set bottom index value of the RawArray, returns nBottom
// note: bottom index is not automatically maintained
// warning!: no check on the validity of oRawArray is done
//           be sure of what you are doing!
int RawArraySetBottomNoCheck(object oRawArray, int nBottom);
