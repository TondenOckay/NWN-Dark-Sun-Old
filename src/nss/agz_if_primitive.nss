//::///////////////////////////////////////////////
//:: Name     Primitive Types Encapsulation Functions
//:: FileName agz_if_primitive
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// Make an Object of an Int
object Int(int iValue);
// Return the Int value of an Object
// if oObj is an Int(), Float() or String() encapsulation the original value,
//    converted to an int, is returned
// if it is a Vect() or Loc() encapsulation, the Magnitude of the vector is returned
// if it is an Effect encapsulation or an Executable Object its internal code is returned
// if it is a Collection the current size of the collection is returned
// if it is OBJECT_INVALID the result is 0
// in all other cases the result is 1
int IntValue(object oObj);

// Make an Object of a String
object String(string sValue);
// Return the String value of an Object
// if oObj is OBJECT_INVALID the result is ""
// if oObj is an Int(), Float() or String() encapsulation the original value,
//    converted to a string, is returned
// if it is a Vect() the result is a string in the form "[x, y, z]"
// if it is a Loc() the result is a string in the form "(areatag, [x, y, z], facing)"
// if it is any other Abstract Object the result is "(AO, objid, AOtype, IntValue)"
// in all other cases the result is the Name property of the object
string StringValue(object oObj);

// Make an Object of a Float
object Float(float fValue);
// Return the Float value of an Object
// if oObj is an Int(), Float() or String() encapsulation the original value,
//    converted to a float, is returned
// if it is a Vect() or Loc() encapsulation, the Magnitude of the vector is returned
// if it is an Effect encapsulation or an Executable Object its internal code is returned
// if it is a Collection the current size of the collection is returned
// if it is OBJECT_INVALID the result is 0.0f
// in all other cases the result is 1.0f
float FloatValue(object oObj);

// Return the TruthValue of an Object: TRUE or FALSE
// if oObj is OBJECT_INVALID or an Encapsulated zero (Int or Float) then FALSE is returned
// else TRUE is returned
int TruthValue(object oObj);

// Check if object is not zero
// if oObj is an Encapsulated zero (Int or Float) returns OBJECT_INVALID
// else returns oObj
// note that if oObj is OBJECT_INVALID the result will be OBJECT_INVALID
object NotZero(object oObj);

// Make an Object of a Vector
object Vect(vector vValue);
// Return the Vector value of an Object
// if it is a Vect() or Loc() encapsulation the original vector (position) is returned
// for any other AO, a vector with the object FloatValue() as x and 0 in y, z
// in all other cases (game objects) it will be the vector from the object location
vector VectValue(object oObj);

// Make an Object of a Location
object Loc(location lValue);
// Return the Location value of an Object
// if it is a Loc() encapsulation the original location is returned
// if it is a Vect() a dummy location is returned,
//    with OBJECT_INVALID as area, the vector as position, 0 as facing
// for any other AO a similar dummy location is returned,
//    with a position having the object FloatValue() as x and 0 in y, z
// in all other cases (game objects) it will be the actual Location of the object
location LocValue(object oObj);


