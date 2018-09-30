//::///////////////////////////////////////////////
//:: Name     Primitive Types Encapsulation Functions
//:: FileName agz_pelibbfi_inc
//:://////////////////////////////////////////////
/*

modified 20030727 to create real 0 and "" encapsulations

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "agz_if_basic"
#include "agz_aolibbfi_inc"
#include "agz_if_primitive"

// Create a permanent Int Primitive  (version safe while initializing globals)
object Safe_PrimitiveInt(int iValue)
{
 string sValue = IntToString(iValue);
 object oBase = PrimitivesBaseArea();
 object oResult = GetLocalObject(oBase, sValue);
 if (!GetIsObjectValid(oResult)) // extended test
    {
     oResult = Safe_CreateAbstractObject(AO_SUBTYPE_INT);
     SetLocalObject(oBase, sValue, MakePermanent(oResult));
     SetLocalInt(oResult, AGZ_REF_COUNT, 1); // avoid unneeded GC
     SetLocalInt(oResult, AGZ_PE_PROTECTED, TRUE);
     SetLocalInt(oResult, AGZ_PE_VALUE, iValue);
     SetLocalString(oResult, AGZ_PE_VALUE, sValue);
    }
 return oResult;
}

// set two commonly used constants and also
// optimize number system by pre-instantiating all int between -100 to +100
object EncapsulatedIntZero()
{
 object oResult = GetLocalObject(GetModule(), "agz_PE_pointer_Zero");
 if (!GetIsObjectValid(oResult))
    {
     oResult = Safe_PrimitiveInt(0);
     SetLocalObject(GetModule(), "agz_PE_pointer_Zero", oResult);
    }
 return oResult;
// agz 20030911 0.18.03
// this dead code is here only to foil Torlack's compiler incompatible global
// optimization
 o_ZERO = OBJECT_INVALID;

}

object EncapsulatedIntOne()
{
 object oResult = GetLocalObject(GetModule(), "agz_PE_pointer_One");
 if (!GetIsObjectValid(oResult))
    {
     // pre-load common integer range
     oResult = Safe_PrimitiveInt(1);
     SetLocalObject(GetModule(), "agz_PE_pointer_One", oResult);
     int i;
     for (i = 2; i <= agz_PE_PREINSTANTIATE_INT_HIGH; i++)
        Safe_PrimitiveInt(i);
     for (i = -1; i >= agz_PE_PREINSTANTIATE_INT_LOW; i--)
        Safe_PrimitiveInt(i);
    }
 return oResult;
// agz 20030911 0.18.03
// this dead code is here only to foil Torlack's compiler incompatible global
// optimization
 o_ONE  = OBJECT_INVALID;
 o_TRUE = OBJECT_INVALID;

}
object o_ZERO  = EncapsulatedIntZero();     // Initialize zero  Constant
object o_ONE   = EncapsulatedIntOne();      // Initialize one   Constant
object o_TRUE  = EncapsulatedIntOne();      // Initialize true  Constant
object o_FALSE = OBJECT_INVALID;            // Initialize false Constant

// Make an Object of an Int (Create a Int Primitive)
object Int(int iValue)
{
 if (iValue)
    {
     if (iValue == 1) return o_ONE;  // frequently used, optimize
     string sValue = IntToString(iValue);
     object oResult = GetLocalObject(AO_PE_BASE_AREA, sValue);
     if (oResult == OBJECT_INVALID)
        {
         oResult = CreateAbstractObject(AO_SUBTYPE_INT);
         SetLocalObject(AO_PE_BASE_AREA, sValue, oResult);
         SetLocalInt(oResult, AGZ_PE_VALUE, iValue);
         SetLocalString(oResult, AGZ_PE_VALUE, sValue);
        }
     return oResult;
    }
 return o_ZERO;
}

// Return the Int value of an Object
int IntValue(object oObj)
{
 if (oObj == OBJECT_INVALID)
    return 0;
 int iType = GetLocalInt(oObj, AGZ_AO);
 if (iType == AO_SUBTYPE_INT)
    return GetLocalInt(oObj, AGZ_PE_VALUE);
 if (iType == AO_SUBTYPE_FLOAT)
    return FloatToInt(GetLocalFloat(oObj, AGZ_PE_VALUE));
 if (iType == AO_SUBTYPE_STRING)
    return StringToInt(GetLocalString(oObj, AGZ_PE_VALUE));
 if (iType == AO_SUBTYPE_LOCATION)
    return FloatToInt(VectorMagnitude(VectValue(oObj)));
 if (iType & AO_TYPE_EFFECT)
    return GetEnxEffectCode(oObj);
 if (iType & AO_TYPE_EXECUTABLE)
    return GetExecutableObjectCode(oObj);
 if (iType & AO_TYPE_COLLECTION)
    return SizeOfCollection(oObj);

 return 1;
}

// Make an Object of a Float
object Float(float fValue)
{
 if (fValue == 0.0f)
    return o_ZERO;
 if (fValue == 1.0f) return o_ONE;  // frequently used? optimize
 int iValue = FloatToInt(fValue);
 if (fValue == IntToFloat(iValue))        // no decimals, optimize
    return Int(iValue);
 string sValue  = FloatToString(fValue, 18, 6);
 object oResult = GetLocalObject(AO_PE_BASE_AREA, sValue);
 if (oResult == OBJECT_INVALID)
    {
     oResult = CreateAbstractObject(AO_SUBTYPE_FLOAT);
     SetLocalObject(AO_PE_BASE_AREA, sValue, oResult);
     SetLocalFloat(oResult, AGZ_PE_VALUE, fValue);
     SetLocalString(oResult, AGZ_PE_VALUE, sValue);
    }
 return oResult;
}

// Return the Float value of an Object
float FloatValue(object oObj)
{
 if (oObj == OBJECT_INVALID)
    return 0.0f;
 int iType = GetLocalInt(oObj, AGZ_AO);
 if (iType == AO_SUBTYPE_FLOAT)
    return GetLocalFloat(oObj, AGZ_PE_VALUE);
 if (iType == AO_SUBTYPE_INT)
    return IntToFloat(GetLocalInt(oObj, AGZ_PE_VALUE));
 if (iType == AO_SUBTYPE_STRING)
    return StringToFloat(GetLocalString(oObj, AGZ_PE_VALUE));
 if (iType == AO_SUBTYPE_LOCATION)
    return VectorMagnitude(VectValue(oObj));

 return IntToFloat(IntValue(oObj));  // other object, return same as IntValue
}


// Make an Object of a String
object String(string sValue)
{
// if (sValue == "")
//    return OBJECT_INVALID;
 object oResult = GetLocalObject(AO_PE_BASE_AREA, sValue);
 if (oResult == OBJECT_INVALID)
    {
     oResult = CreateAbstractObject(AO_SUBTYPE_STRING);
     SetLocalObject(AO_PE_BASE_AREA, sValue, oResult);
     SetLocalString(oResult, AGZ_PE_VALUE, sValue);
    }
 return oResult;
}

// Return the String value of an Object
string StringValue(object oObj)
{
 if (oObj == OBJECT_INVALID)
    return "";
 int iType = GetLocalInt(oObj, AGZ_AO);
 if ((iType & AO_TYPE_PRIMITIVE) && (iType & AO_MASK_PRIMITIVE_SIMPLE))
    return GetLocalString(oObj, AGZ_PE_VALUE);
 if (iType == AO_SUBTYPE_LOCATION)
    {
     location lLoc = LocValue(oObj);
     vector vVect = GetPositionFromLocation(lLoc);
     object oArea = GetAreaFromLocation(lLoc);
     string sResult;
     if (oArea != OBJECT_INVALID)
        sResult = "("+GetTag(oArea)+", ";
     sResult += "["+FloatToString(vVect.x, 18, 6)+", "+
                    FloatToString(vVect.y, 18, 6)+", "+
                    FloatToString(vVect.z, 18, 6)+"]";
     if (oArea != OBJECT_INVALID)
        sResult += ", "+FloatToString(GetFacingFromLocation(lLoc), 18, 6)+")";
     return sResult;
    };
 if (iType)
    return "(AO,"+GetFormattedObjectId(oObj)+","+
                  IntToHexString(iType)+","+
                  IntToHexString(IntValue(oObj))+")";

 return GetName(oObj);
}

// Return the Truth value of an Object
int TruthValue(object oObj)
{
 if (oObj == OBJECT_INVALID)
    return FALSE;
 if (oObj == o_ZERO)
    return FALSE;
 return TRUE;
}

// Check if object is not zero
object NotZero(object oObj)
{
 if (oObj == o_ZERO)
    return OBJECT_INVALID;
 return oObj;
}

// Make an Object of a Vector
object Vect(vector vValue)
{
 object oResult = CreateAbstractObject(AO_SUBTYPE_LOCATION);
 SetLocalLocation(oResult, AGZ_PE_LOC,
                    Location(OBJECT_INVALID, vValue, 0.0f));
 return oResult;
}

// Return the Vector value of a Primitive Object
vector VectValue(object oObj)
{
 if (oObj == OBJECT_INVALID)
    return [0.0f, 0.0f, 0.0f];
 int iType = GetLocalInt(oObj, AGZ_AO);
 if (iType == AO_SUBTYPE_LOCATION)
    return GetPositionFromLocation(GetLocalLocation(oObj, AGZ_PE_LOC));
 if (iType)  // other AO, return a vector with the float value on the x axis
    return Vector(FloatValue(oObj));

 return GetPositionFromLocation(GetLocation(oObj)); // real object, return position
}

// Make an Object of a Location
object Loc(location lValue)
{
 object oResult = CreateAbstractObject(AO_SUBTYPE_LOCATION);
 SetLocalLocation(oResult, AGZ_PE_LOC, lValue);
 return oResult;
}

// Return the Location value of a Primitive Object
location LocValue(object oObj)
{
 if (oObj == OBJECT_INVALID)
    return Location(OBJECT_INVALID, [0.0f, 0.0f, 0.0f], 0.0f);
 int iType = GetLocalInt(oObj, AGZ_AO);
 if (iType == AO_SUBTYPE_LOCATION)
    return GetLocalLocation(oObj, AGZ_PE_LOC);
 if (iType)  // other AO, return invalid location with the float value on the x axis
    return Location(OBJECT_INVALID, Vector(FloatValue(oObj)), 0.0f);

 return GetLocation(oObj); // real object, return location
}

// Destroy a Primitive
// void DestroyPrimitive(object oPrimitive)
// implemented in agz_aolibbfi_inc for packaging reasons


