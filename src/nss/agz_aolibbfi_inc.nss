//::///////////////////////////////////////////////
//:: Name     Abstract Objects Library Implementation
//:: FileName agz_aolibbf_inc
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// agz 20030923 0.19.01 include added
#include "agz_constant_inc"
#include "agz_if_config"
#include "agz_if_basic"

// agz 20030923 0.19.01 moved constants to "agz_constant_inc"

//
// Some useful private functions
//

// Get a formatted Object Id string
string GetFormattedObjectId(object oObj)
{return ":"+GetStringRight("00000000"+ObjectToString(oObj),8)+":";}

// Print a Message on the Log
void agz_Log(string sMsg)
{WriteTimestampedLogEntry(
     ObjectToString(OBJECT_SELF)+">"+sMsg);}

// agz 20030922 0.19.01 added central alert support
void agz_Alert(int nMsgCode) {
 SetLocalInt(GetModule(), AGZ_MESSAGE_CODE,  nMsgCode);
 ExecuteScript(AGZ_SCRIPT_ALERTER, OBJECT_SELF);
}

//
// non-appearing function prototypes for private forward functions
//

// Increase the target Reference Count used for Garbage Collection
object Reference(
            object oTarget);
// Decrease the target Reference Count used for Garbage Collection
object Dereference(
            object oTarget);
// Destroy a Primitive Encapsulation
void DestroyPrimitive(
            object oPrimitive, int ConsentReuse=FALSE);
// Destroy an Effect Encapsulation
void DestroyEnxEffect(
            object oEffect, int ConsentReuse=FALSE);
// Destroy a Collection
void DestroyCollection(
            object oCollection, int ConsentReuse=FALSE);
// Destroy an Executable Object
void DestroyExecutable(
            object oExecutable, int ConsentReuse=FALSE);
// Destroy a System Service Object
void DestroySysService(
            object oService, int ConsentReuse=FALSE);
// agz 20031009 0.19.04 added Custom Object Support
// Destroy a System Service Object
void DestroyCustomObject(
            object oCustom, int ConsentReuse=FALSE);


//
// Abstract Object specific functions
//

// set the Home Location global
// note: safe while initializing globals
location AOHome()
{
 location lResult = GetLocalLocation(GetModule(), "agz_AO_pointer_Home");
 if (!GetIsObjectValid(GetAreaFromLocation(lResult))) // initialize
    {
     object oArea = GetObjectByTag("agz_ObjectStorage");
     if (GetIsObjectValid(oArea))
        lResult = Location(oArea, [10.0, 10.0, 0.0], 0.0);
     else
        lResult = GetStartingLocation();
     SetLocalLocation(GetModule(), "agz_AO_pointer_Home", lResult);
    }
 return lResult;
// agz 20030911 0.18.03
// this dead code is here only to foil Torlack's compiler incompatible global
// optimization
 AO_HOME_LOCATION = lResult;

}
// Anchor Point
location AO_HOME_LOCATION = AOHome();

// set the Primitives Base Area
// note: safe while initializing globals
object PrimitivesBaseArea()
{
 object oResult = GetLocalObject(GetModule(), "agz_PE_pointer_Base");
 if (!GetIsObjectValid(oResult)) // initialize
    {
     oResult = GetAreaFromLocation(AOHome());
     SetLocalObject(GetModule(), "agz_PE_pointer_Base", oResult);
    }
 return oResult;
// agz 20030911 0.18.03
// this dead code is here only to foil Torlack's compiler incompatible global
// optimization
 AO_PE_BASE_AREA = OBJECT_INVALID;

}
// Primitives Base Area
// note: keep it here to avoid problems with globals initialization
object AO_PE_BASE_AREA = PrimitivesBaseArea();

// Get the Abstract Object type
int GetAbstractObjectType(object oAbstractObject)
{return GetLocalInt(oAbstractObject, AGZ_AO);}

// Check if Object is an Abstract Object
int GetIsAbstractObject(object oAbstractObject)
{return GetLocalInt(oAbstractObject, AGZ_AO);}

// Internal Destroy Object: takes care of special Abstract Object types
void internal_DestroyObject(object oObject, int ConsentReuse=FALSE)
{
// agz_Log("Destructor invoked on:"+ObjectToString(oObject));
 int iType = GetLocalInt(oObject, AGZ_AO);
 if (iType & AO_TYPE_PRIMITIVE)                // a Primitive?
    {AssignCommand(oObject, DestroyPrimitive(oObject, ConsentReuse)); return;}
 if (iType & AO_TYPE_EFFECT)                   // an Effect?
    {AssignCommand(oObject, DestroyEnxEffect(oObject, ConsentReuse)); return;}
 if (iType & AO_TYPE_EXECUTABLE)               // an Executable?
    {AssignCommand(oObject, DestroyExecutable(oObject, ConsentReuse)); return;}
 if (iType & AO_TYPE_COLLECTION)               // a Collection?
    {AssignCommand(oObject, DestroyCollection(oObject,ConsentReuse)); return;}
 if (iType & AO_TYPE_SYS_SERVICE)              // a Sys Service?
    {AssignCommand(oObject, DestroySysService(oObject,ConsentReuse)); return;}
// agz 20031009 0.19.04 added Custom Object Support
 if (iType & AO_TYPE_CUSTOMOBJECT)             // a Custom Object?
    {AssignCommand(oObject, DestroyCustomObject(oObject,ConsentReuse)); return;}
// agz 20030922 0.19.01 added comments
// note: AO_TYPE_GENERIC has no destructor and is not reusable
// note: AO_TYPE_RAW has no destructor and is not reusable

// AO reuse optimization logic
 if (agz_ENABLE_AO_REUSE)
    {
     if (iType == AO_FREE_CELL) return;     // never destroy a linked cell
     if (ConsentReuse && iType == AO_EMPTY_CELL) // can be reused
        {
// agz_Log("Destructor pooling:"+ObjectToString(oObject));
         SetLocalInt(oObject, AGZ_REF_COUNT, 0);  // be sure it is not negative
         SetLocalInt(oObject, AGZ_AO, AO_FREE_CELL);
// agz 20031009 0.19.04 optimization
         SetLocalObject(oObject, "agz_AO_Free_Cells_Next",
                        GetLocalObject(GetModule(), "agz_AO_Free_Cells_Chain"));
         SetLocalObject(GetModule(), "agz_AO_Free_Cells_Chain", oObject);
         return;
        }
    }
// agz_Log("Destructor destroying:"+ObjectToString(oObject));
 DeleteLocalInt(oObject, AGZ_AO);
 if (GetIsObjectValid(oObject))
     DestroyObject(oObject);
}

// Auto Garbage Collection
void ConditionallyPurgeSelf()
{
// agz_Log("GC is running on:"+ObjectToString(OBJECT_SELF));
 if (!GetLocalInt(OBJECT_SELF, AGZ_AO))            return;
 if (GetLocalInt(OBJECT_SELF, AGZ_PERMANENT))      return;
 if (GetLocalInt(OBJECT_SELF, AGZ_REF_COUNT) > 0)  return;
// agz_Log("GC is purging:"+ObjectToString(OBJECT_SELF));
 internal_DestroyObject(OBJECT_SELF, TRUE);
}

// Create an Abstract Object
object CreateAbstractObject(int iType=AO_TYPE_GENERIC)
{
 object oAbstractObject;
 if (agz_ENABLE_AO_REUSE)
    {
// agz 20030911 0.18.03 code optimization
     // extended check
     if (GetIsObjectValid(oAbstractObject=GetLocalObject(GetModule(),
                                                "agz_AO_Free_Cells_Chain")))
        {
         SetLocalObject(GetModule(), "agz_AO_Free_Cells_Chain",
                            GetLocalObject(oAbstractObject, "agz_AO_Free_Cells_Next"));
         DeleteLocalObject(oAbstractObject, "agz_AO_Free_Cells_Next");
         SetLocalInt(oAbstractObject, AGZ_AO, iType);
         AssignCommand(oAbstractObject, ConditionallyPurgeSelf());
// agz_Log("Reusing Abstract Object:"+ObjectToString(oAbstractObject)+" for type:"+IntToHexString(iType));
         return oAbstractObject;
        }
    }

// agz 20030911 0.18.03 code optimization
 SetLocalInt(oAbstractObject=CreateObject(OBJECT_TYPE_STORE,
                                          "agz_ao_cell",
                                          AO_HOME_LOCATION),
             AGZ_AO, iType);
 AssignCommand(oAbstractObject, ConditionallyPurgeSelf());
// agz_Log("Created Abstract Object:"+ObjectToString(oAbstractObject)+" of type:"+IntToHexString(iType));
 return oAbstractObject;
}

// Create an Abstract Object (version safe while initializing globals)
object Safe_CreateAbstractObject(int iType=AO_TYPE_GENERIC)
{
 object oAbstractObject = CreateObject(OBJECT_TYPE_STORE,
                                       "agz_ao_cell",
                                       AOHome());
// agz 20030922 0.19.01 added check of AO availability
if (!GetIsObjectValid(oAbstractObject)) {  // scream loudly!
    agz_Alert(AGZ_MSG_ALERT_AO_CREATION_ERROR);
    return OBJECT_INVALID;
    }

// agz 20030911 0.18.03 removed comment about SoU bypass
 SetLocalInt(oAbstractObject, AGZ_AO, iType);
// agz_Log("Created Abstract Object:"+ObjectToString(oAbstractObject)+" of type:"+IntToHexString(iType));
 return oAbstractObject;
}

// Create a Generic Abstract Object
object CreateGenericAbstractObject()
{return CreateAbstractObject(AO_TYPE_GENERIC);}

// Increase the  target Reference Count used for Garbage Collection
object Reference(object oTarget)
{
 if (oTarget == OBJECT_INVALID)         return oTarget;
 if (!GetLocalInt(oTarget, AGZ_AO))   return oTarget;
 SetLocalInt(oTarget, AGZ_REF_COUNT,GetLocalInt(oTarget, AGZ_REF_COUNT) + 1);
 return oTarget;
}

// Decrease the target Reference Count used for Garbage Collection
object Dereference(object oTarget)
{
 if (oTarget == OBJECT_INVALID)         return oTarget;
 if (!GetLocalInt(oTarget, AGZ_AO))   return oTarget;
 int iCount = GetLocalInt(oTarget, AGZ_REF_COUNT) - 1;
 SetLocalInt(oTarget, AGZ_REF_COUNT, iCount);
 if (iCount < 1)
     AssignCommand(oTarget, ConditionallyPurgeSelf());
 return oTarget;
}

// Flag an Object as Permanent (not subject to Garbage Collection)
object MakePermanent(object oObject)
{SetLocalInt(oObject, AGZ_PERMANENT, TRUE);
 return oObject;}

// Extended form of SetLocalObject, tracks references for Garbage Collection
void XSetLocalObject(object oObject, string sVarName, object oTarget)
{
 object oOld = GetLocalObject(oObject, sVarName);  // previously stored object
// if (oTarget == oOld) return;   // same object optimization (how often?)
 if  (GetLocalInt(oOld, AGZ_AO))
    {
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 if (oTarget == OBJECT_INVALID)
    {
     DeleteLocalObject(oObject, sVarName);
     return;
    }
 SetLocalObject(oObject, sVarName, oTarget);
 if (!GetLocalInt(oTarget, AGZ_AO))   return;
 SetLocalInt(oTarget, AGZ_REF_COUNT,GetLocalInt(oTarget, AGZ_REF_COUNT) + 1);
}

// Extended form of DeleteLocalObject, tracks references for Garbage Collection
void XDeleteLocalObject(object oObject, string sVarName)
{
 object oOld = GetLocalObject(oObject, sVarName);
 if  (GetLocalInt(oOld, AGZ_AO))
    {
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 DeleteLocalObject(oObject, sVarName);
}

// Extended form of GetLocalObject (same as regular form)
object XGetLocalObject(object oObject, string sVarName)
{return GetLocalObject(oObject, sVarName);}

// Extended Destroy Object: takes care of special Abstract Object types
void XDestroyObject(object oObject, float fDelay=0.0f)
{
 if (oObject == OBJECT_INVALID)  return;

 if (GetLocalInt(oObject, AGZ_AO))
     {internal_DestroyObject(oObject, FALSE); return;}

 if (GetIsObjectValid(oObject))
     DestroyObject(oObject, fDelay);
}

//
// Private functions for Indexable Object Pointers
//

// Basic top
int BasicTop(object oObject)
{return GetLocalInt(oObject, AGZ_TOP);}
// Basic bottom
int BasicBottom(object oObject)
{return GetLocalInt(oObject, AGZ_BOTTOM);}
// Basic access
object BasicAt(object oObject, int iIndex)
{return GetLocalObject(oObject, IntToString(iIndex));}
// Basic set value (upward moving only)
void BasicAtPutUpward(object oObject, int iIndex, object oNew)
{string sVarName = IntToString(iIndex);
 object oOld = GetLocalObject(oObject, sVarName);  // previously stored object
 if (GetLocalInt(oOld, AGZ_AO))
    {                                               // dereference old object
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 int iTop = GetLocalInt(oObject, AGZ_TOP);
 SetLocalObject(oObject, sVarName, oNew);
 if (iIndex > iTop)
    SetLocalInt(oObject, AGZ_TOP, iIndex);
 if (!GetLocalInt(oNew, AGZ_AO))   return;
 SetLocalInt(oNew, AGZ_REF_COUNT,GetLocalInt(oNew, AGZ_REF_COUNT) + 1);
}
// Basic set value (downward moving only)
void BasicAtPutDownward(object oObject, int iIndex, object oNew)
{string sVarName = IntToString(iIndex);
 object oOld = GetLocalObject(oObject, sVarName);  // previously stored object
 if (GetLocalInt(oOld, AGZ_AO))
    {                                               // dereference old object
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 int iBot = GetLocalInt(oObject, AGZ_BOTTOM);
 SetLocalObject(oObject, sVarName, oNew);
 if (iIndex < iBot)
    SetLocalInt(oObject, AGZ_BOTTOM, iIndex);
 if (!GetLocalInt(oNew, AGZ_AO))   return;
 SetLocalInt(oNew, AGZ_REF_COUNT,GetLocalInt(oNew, AGZ_REF_COUNT) + 1);
}
// Basic remove value (upward moving only)
void BasicAtRemoveUpward(object oObject, int iIndex)
{string sVarName = IntToString(iIndex);
 object oOld = GetLocalObject(oObject, sVarName);  // previously stored object
 if (GetLocalInt(oOld, AGZ_AO))
    {                                               // dereference old object
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 int iTop = GetLocalInt(oObject, AGZ_TOP);
 DeleteLocalObject(oObject, sVarName);
 if (iIndex == iTop)    // shrink down
    {
     while (iTop && GetLocalObject(oObject, IntToString(iTop)) == OBJECT_INVALID)
            iTop--;
     SetLocalInt(oObject, AGZ_TOP, iTop);
    }
 return;
}
// Basic remove value (downward moving only)
void BasicAtRemoveDownward(object oObject, int iIndex)
{string sVarName = IntToString(iIndex);
 object oOld = GetLocalObject(oObject, sVarName);  // previously stored object
 if (GetLocalInt(oOld, AGZ_AO))
    {                                               // dereference old object
     int iCount = GetLocalInt(oOld, AGZ_REF_COUNT) - 1;
     SetLocalInt(oOld, AGZ_REF_COUNT, iCount);
     if (iCount < 1)
        AssignCommand(oOld, ConditionallyPurgeSelf());
    }
 int iBot = GetLocalInt(oObject, AGZ_BOTTOM);
 DeleteLocalObject(oObject, sVarName);
 if (iIndex == iBot)    // shrink up
    {
     while (iBot && GetLocalObject(oObject, IntToString(iBot)) == OBJECT_INVALID)
            iBot++;
     SetLocalInt(oObject, AGZ_BOTTOM, iBot);
    }
 return;
}
// Basic delete all
void BasicDeleteAll(object oObject)
{object oOld;
 int iCount;
 int iX = GetLocalInt(oObject, AGZ_TOP);
 string sVarName;
 while (iX)
// agz 20030911 0.18.03 code optimization
    {oOld = GetLocalObject(oObject, sVarName=IntToString(iX));  // stored object
     if (oOld != OBJECT_INVALID)
        {DeleteLocalObject(oObject, sVarName);
         if (GetLocalInt(oOld, AGZ_AO))
// agz 20030911 0.18.03 code optimization
            {SetLocalInt(oOld, AGZ_REF_COUNT,
                    iCount=(GetLocalInt(oOld, AGZ_REF_COUNT) - 1));
             if (iCount < 1)
                AssignCommand(oOld, ConditionallyPurgeSelf());
            }
        }
     iX--;
     SetLocalInt(oObject, AGZ_TOP, iX);  // ... if TMI ...
    }
 iX = GetLocalInt(oObject, AGZ_BOTTOM);
 while (iX)
// agz 20030911 0.18.03 code optimization
    {oOld = GetLocalObject(oObject, sVarName=IntToString(iX));  // stored object
     if (oOld != OBJECT_INVALID)
        {DeleteLocalObject(oObject, sVarName);
         if (GetLocalInt(oOld, AGZ_AO))
// agz 20030911 0.18.03 code optimization
            {SetLocalInt(oOld, AGZ_REF_COUNT,
                    iCount=(GetLocalInt(oOld, AGZ_REF_COUNT) - 1));
             if (iCount < 1)
                AssignCommand(oOld, ConditionallyPurgeSelf());
            }
        }
     iX++;
     SetLocalInt(oObject, AGZ_BOTTOM, iX);  // .... if TMI ...
    }
}


//
// Functions displaced here for packaging reasons
//

// Get size (numerosity) of a Collection
// should be in agz_clibbfi_inc, implemented here for packaging reasons
int SizeOfCollection(object oCollection)
{
 if (GetLocalInt(oCollection, AGZ_AO) & AO_TYPE_COLLECTION)
    return GetLocalInt(oCollection,AGZ_TALLY);
 if (oCollection == OBJECT_INVALID) return 0;
 return 1;
}

// Get the encapsulated effect internal code
// should be in agz_eelibbfi_inc, implemented here for packaging reasons
int GetEnxEffectCode(object oObject)
{return GetLocalInt(oObject, "agz_effect_code");}

// Get the executable internal code
// should be in agz_eolibdex_inc, implemented here for packaging reasons
int GetExecutableObjectCode(object oExecutable)
{return GetLocalInt(oExecutable, AGZ_EO_CODE);}


//
// Destructors
//

// Destroy a Collection
// should be in agz_clibbfi_inc, implemented here for packaging reasons
void DestroyCollection(object oCollection, int ConsentReuse=FALSE)
{
 int iAO = GetLocalInt(oCollection, AGZ_AO);
 if (iAO & AO_TYPE_COLLECTION)
    {
     // manage segmentation and also survive TMI for very large collections
     // warning, an additional run of destroy always happens
     if (oCollection == OBJECT_SELF)
        DelayCommand(agz_CL_GC_SEGMENT_DELAY, DestroyCollection(oCollection, ConsentReuse));
     else
        AssignCommand(oCollection, DestroyCollection(oCollection, ConsentReuse));

     int iCountDown = agz_CL_GC_SEGMENT_SIZE > 0 ? agz_CL_GC_SEGMENT_SIZE : -1;
     int bHasInvK = (iAO == AO_SUBTYPE_SET);
// agz 20031003 0.19.03 - added to manage LabeledList
     int bHasLabels = (iAO == AO_SUBTYPE_LABELEDLIST);
     int iX;
     object oOld;
     string sVarName;
     for (; iCountDown; iCountDown--)
        {
         iX = GetLocalInt(oCollection, AGZ_TOP);
         if (iX)
            {sVarName = IntToString(iX);
             oOld = GetLocalObject(oCollection, sVarName);
             if (oOld != OBJECT_INVALID) {
                 XDeleteLocalObject(oCollection, sVarName);
                 if (bHasInvK)
                    DeleteLocalInt(oCollection,"agz_InvK_"+ObjectToString(oOld));
// agz 20031003 0.19.03 - added to manage LabeledList
                 if (bHasLabels) {
                     DeleteLocalInt(oCollection, GetLocalString(oCollection, sVarName)); // remove label
                     DeleteLocalString(oCollection, sVarName); // remove label backreference
                    }
             }
             iX--;
             SetLocalInt(oCollection, AGZ_TOP, iX);
             continue;
            }

/* not yet used, recode if needed
         iX = GetLocalInt(oCollection, AGZ_BOTTOM);
         if (iX)
            {sVarName = IntToString(iX);
             XDeleteLocalObject(oCollection, sVarName);  // stored object
             iX++;
             SetLocalInt(oCollection, AGZ_BOTTOM, iX);
             continue;
            }
   not yet used */

         DeleteLocalInt(oCollection, AGZ_CURSOR);
         DeleteLocalInt(oCollection, AGZ_TALLY);
         DeleteLocalInt(oCollection, AGZ_TOP);
         DeleteLocalInt(oCollection, AGZ_BOTTOM);
// agz 20030927 0.19.02 new subtype Array
         DeleteLocalInt(oCollection, AGZ_MAXINDEX);

         SetLocalInt(oCollection, AGZ_AO, AO_EMPTY_CELL); // no more a Collection

         break;

        } // end for
    }
 else  // actually release the ex-Collection
    internal_DestroyObject(oCollection, ConsentReuse);
}


// Destroy an Executable
// should be in agz_eolibdex_inc, implemented here for packaging reasons
void DestroyExecutable(object oExecutable, int ConsentReuse=FALSE)
{
 int iAO = GetLocalInt(oExecutable, AGZ_AO);
 if (iAO & AO_TYPE_EXECUTABLE)
    {
     int iCode = GetLocalInt(oExecutable, AGZ_EO_CODE);
     if (iCode < 256) return;                 // don't destroy Function-Constant

     int iTop = GetLocalInt(oExecutable, AGZ_EO_ARGS);
     while (iTop >= 1)
         {
//        XDeleteLocalObject(oExecutable, "Value_"+IntToString(iTop));   // 20031009 0.19.04
//        SetLocalInt(oExecutable, AGZ_EO_ARGS, --iTop);                 // 20031009 0.19.04
          XDeleteLocalObject(oExecutable, "Value_"+IntToString(iTop--)); // 20031009 0.19.04
         }
     if (iCode & 0x1000000)                 // special: value_0 is set
         XDeleteLocalObject(oExecutable, "Value_0");

     DeleteLocalInt(oExecutable, AGZ_EO_CODE);
     DeleteLocalInt(oExecutable, AGZ_EO_ARGS);  // 20031009 0.19.04
     DeleteLocalInt(oExecutable, "Parm_1");
     DeleteLocalInt(oExecutable, "Parm_2");
     DeleteLocalInt(oExecutable, "Parm_3");
     DeleteLocalFloat(oExecutable, "Parm_1");
     DeleteLocalFloat(oExecutable, "Parm_2");
     DeleteLocalFloat(oExecutable, "Parm_3");
     DeleteLocalString(oExecutable, "Parm_1");
     DeleteLocalString(oExecutable, "Parm_2");
     DeleteLocalString(oExecutable, "Parm_3");

     SetLocalInt(oExecutable, AGZ_AO, AO_EMPTY_CELL); // no more an Executable
    }
 internal_DestroyObject(oExecutable, ConsentReuse);
}


// Destroy a Primitive Encapsulation
// should be in agz_pelibbfi_inc, implemented here for packaging reasons
void DestroyPrimitive(object oPrimitive, int ConsentReuse=FALSE)
{
 int iAO = GetLocalInt(oPrimitive, AGZ_AO);
 if (iAO & AO_TYPE_PRIMITIVE)
    {
     if (iAO & AO_MASK_PRIMITIVE_SIMPLE)
        {
         if (GetLocalInt(oPrimitive, AGZ_PE_PROTECTED)) return; // protected optimization
         string sValue = GetLocalString(oPrimitive, AGZ_PE_VALUE);
         DeleteLocalObject(AO_PE_BASE_AREA, sValue);
         DeleteLocalInt(oPrimitive, AGZ_PE_VALUE);
         DeleteLocalFloat(oPrimitive, AGZ_PE_VALUE);
         DeleteLocalString(oPrimitive, AGZ_PE_VALUE);
        }
     else
         DeleteLocalLocation(oPrimitive, AGZ_PE_LOC);
     SetLocalInt(oPrimitive, AGZ_AO, AO_EMPTY_CELL); // no more a Primitive
    }
 internal_DestroyObject(oPrimitive, ConsentReuse);
}


// Destroy an Effect Encapsulation
// should be in agz_eelibbfi_inc, implemented here for packaging reasons
void DestroyEnxEffect(object oEffect, int ConsentReuse=FALSE)
{
 int iAO = GetLocalInt(oEffect, AGZ_AO);
 if (iAO & AO_TYPE_EFFECT)
    {
     XDeleteLocalObject(oEffect, "agz_parenteffect");
     DeleteLocalInt(oEffect, "agz_effect_code");
     DeleteLocalInt(oEffect, "agz_effect_subtype");
     DeleteLocalInt(oEffect, "agz_vs_lawchaos");
     DeleteLocalInt(oEffect, "agz_vs_goodevil");
     DeleteLocalInt(oEffect, "agz_vs_racial");
     DeleteLocalInt(oEffect, "agz_vs_traps");
     int iP;
     for (iP = 1; iP < 7; iP++) {
         DeleteLocalInt(oEffect, "Parm_"+IntToString(iP));
         DeleteLocalFloat(oEffect, "Parm_"+IntToString(iP));
         DeleteLocalString(oEffect, "Parm_"+IntToString(iP));
         XDeleteLocalObject(oEffect, "Parm_"+IntToString(iP));
         DeleteLocalLocation(oEffect, "Parm_"+IntToString(iP));
        }
     SetLocalInt(oEffect, AGZ_AO, AO_EMPTY_CELL); // no more an Effect
    }
 internal_DestroyObject(oEffect, ConsentReuse);
}


// Destroy a System Service Object
void DestroySysService(object oService, int ConsentReuse=FALSE)
{
 int iAO = GetLocalInt(oService, AGZ_AO);
 if (iAO & AO_TYPE_SYS_SERVICE)
    {
     if (iAO == AO_SUBTYPE_SYS_CURSOR)
        DeleteLocalInt(oService, AGZ_CURSOR);
     SetLocalInt(oService, AGZ_AO, AO_EMPTY_CELL); // no more a Sys Service
    }
 internal_DestroyObject(oService, ConsentReuse);
}


// agz 20031009 0.19.04 added Custom Object Support
// Destroy a System Service Object
void DestroyCustomObject(object oCustom, int ConsentReuse=FALSE)
{
 int iAO = GetLocalInt(oCustom, AGZ_AO);
 if (iAO & AO_TYPE_CUSTOMOBJECT)
    {
     object oType = GetLocalObject(oCustom, AGZ_COS_TYPE);
     // run the Destructor
     object oDestructor = GetLocalObject(oType, AGZ_COS_DESTRUCT);
     if (oDestructor != OBJECT_INVALID) {
         SetLocalInt(GetModule(), AGZ_EO_ENG_CALL, EO_ENGINE_CALL_COS_FUNCTION);
         SetLocalObject(GetModule(), AGZ_EO_ENG_FUNCTION,  oDestructor);
         SetLocalObject(GetModule(), AGZ_EO_ENG_COS_LOCALE,
                                GetLocalObject(oType, AGZ_COS_DESTRUCT_LOCALE));
         SetLocalObject(GetModule(), AGZ_EO_ENG_ARG_1, OBJECT_INVALID);
         SetLocalObject(GetModule(), AGZ_EO_ENG_ARG_2, OBJECT_INVALID);
         SetLocalObject(GetModule(), AGZ_EO_ENG_ARG_3, OBJECT_INVALID);
         ExecuteScript(AGZ_SCRIPT_EO_ENGINE, oCustom);
        }
     SetLocalInt(oCustom, AGZ_AO, AO_EMPTY_CELL); // no more a Sys Service
     if (GetLocalInt(oType, AGZ_COS_FLAGS) != COS_CUSTOM_OBJECT_IS_REUSABLE)
        ConsentReuse = FALSE;
    }
 internal_DestroyObject(oCustom, ConsentReuse);
}

