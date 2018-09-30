//::///////////////////////////////////////////////
//:: Name     Basic Functions
//:: FileName agz_if_basic
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//////////////////////////////////////////////////
// Creating a generic Abstract Object
//////////////////////////////////////////////////

// Create a Generic Abstract Object
// - returns a brand new Abstract Object to play with
object CreateGenericAbstractObject();

//////////////////////////////////////////////////
// Extended format of basic Object manipulation
//////////////////////////////////////////////////

// Extended form of SetLocalObject, tracks references for Garbage Collection
void XSetLocalObject(object oObject, string sVarName, object oTarget);

// Extended form of DeleteLocalObject, tracks references for Garbage Collection
void XDeleteLocalObject(object oObject, string sVarName);

// Extended form of GetLocalObject (same as regular form)
object XGetLocalObject(object oObject, string sVarName);

// Extended Destroy Object: takes care of special Object types
void XDestroyObject(object oObject, float fDelay=0.0f);

// Flag an Object as Permanent (not subject to Garbage Collection)
// -  returns oObject
object MakePermanent(object oObject);

//////////////////////////////////////////////////
// Creating a generic Abstract Object
//////////////////////////////////////////////////

//
// Functions displaced here for packaging reasons
//

// Get size (numerosity) of a Collection
// should be in agz_if_collect
int SizeOfCollection(object oCollection);

// agz 20040103 0.20.02 - EO reflective features added

// extract the code of an Executable Object
int GetExecutableObjectCode(object oExecutable);

