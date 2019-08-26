/*
Filename:           h2_mysqldb_c
System:             core  (NWNX persistence)
Author:             aerisarn
Date Created:       Jul. 09, 2019
Summary:
HCR2 core external database function user-configuration script.
This script should be consumed by h2_persistence_c as an include directive, if
the builder desires to use the Bioware database as their means of campaign database storage.

Revision Info should only be included for post-release revisions.
-----------------
Revision Date:
Revision Author:
Revision Summary:

*/

//A user defined constant that specifies the name of the campaign associated
//with external database variable storage. This value will be used whenever
//any of the h2_Get\SetExternal functions are called and the campaign name is not specified.
const string H2_DEFAULT_CAMPAIGN_NAME = "H2_TESTMODULE";

#include "nwnx_sql"
#include "nwnx_object"
#include "nw_i0_plot" //GetIsPlayerCharacter

/*
Utilities
*/

// Problems can arise with SQL commands if variables or values have single quotes
// in their names. These functions are a replace these quote with the tilde character

string SQLEncodeSpecialChars(string sString) {
    if (FindSubString(sString, "'") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++) {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "'")
            sReturn += "~";
        else
            sReturn += sChar;
    }
    return sReturn;
}

string SQLDecodeSpecialChars(string sString) {
    if (FindSubString(sString, "~") == -1)      // not found
        return sString;

    int i;
    string sReturn = "";
    string sChar;

    // Loop over every character and replace special characters
    for (i = 0; i < GetStringLength(sString); i++) {
        sChar = GetSubString(sString, i, 1);
        if (sChar == "~")
            sReturn += "'";
        else
            sReturn += sChar;
    }
    return sReturn;
}

//There are 2 types of store: one related to the player, and one global when the parameter passed is global.
//Each type could be either of these types
/*  TYPE  //COLUMN
    Float                       //1
    Int                         //2
    Location
        area tag Varchar(256)   //3
        //Position
        float                   //4
        float                   //5
        float                   //6
        //Orientation
        float                   //7
    String Varchar(256)         //8
    Vector
        float                   //9
        float                   //10
        float                   //11
    Object -> TEXT              //12
*/

//let's be clean and define an enum; oh wait, we don't have enumerations! Sigh
void PrepareVariableTable(string UniqueID)
{
    string sSQL = "CREATE TABLE IF NOT EXISTS " + UniqueID + "(" +
        "id varchar(64) NOT NULL default '~'," +
        "tag varchar(512) NOT NULL default '~'," +
        "floatValue FLOAT, " +
        "intValue INT, " +
        "locationAreaTagValue varchar(256), " +
        "locationPositionXValue FLOAT, " +
        "locationPositionYValue FLOAT, " +
        "locationPositionZValue FLOAT, " +
        "locationOrientationValue FLOAT, " +
        "stringValue varchar(256), " +
        "vectorXValue FLOAT, " +
        "vectorYValue FLOAT, " +
        "vectorZValue FLOAT, " +
        "objectValue MEDIUMTEXT, " +
        "PRIMARY KEY  (id,tag)" +
        ") ENGINE=MyISAM DEFAULT CHARSET=latin1;";
    NWNX_SQL_ExecuteQuery(sSQL);
}

void h2_InitializeDatabase()
{
    NWNX_SQL_ExecuteQuery("CREATE DATABASE IF NOT EXISTS " + H2_DEFAULT_CAMPAIGN_NAME);
    NWNX_SQL_ExecuteQuery("USE " + H2_DEFAULT_CAMPAIGN_NAME);
    //We might as well create this if we didn't already
    PrepareVariableTable("global_variables");
}

struct DBID {
    string UniqueID;
    string tag;
};

struct DBID GetDBID(object oObject)
{
    struct DBID id;
    if (oObject == OBJECT_INVALID)
    {
        id.UniqueID = "global_variables";
        id.tag = "~";
    } else if (GetIsPC(oObject) || GetIsDM(oObject)) {
        id.UniqueID = GetPCPublicCDKey(oObject);
        id.tag = SQLEncodeSpecialChars(GetName(oObject));
        if (GetLocalInt(oObject, "H2_NWNX_DB_CHECKED") == 0)
        {
            WriteTimestampedLogEntry("Logging "+ id.UniqueID);
            //check for table obly once per login
            PrepareVariableTable(id.UniqueID);
            SetLocalInt(oObject, "H2_NWNX_DB_CHECKED", 1);
        }
    } else {
        id.UniqueID = "global_variables";
        id.tag = GetResRef(oObject);
    }
    return id;
}

void NWNX_SQL_ExecuteQueryOrLog(string query)
{
   if (0 == NWNX_SQL_ExecuteQuery(query))
   {
        WriteTimestampedLogEntry("FAILED: " + query);
   }
}

float h2_GetExternalFloat(string sVarName, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("SELECT floatValue FROM "+id.UniqueID+" WHERE id='"+sVarName+"' AND tag='"+id.tag+"'");
    if (NWNX_SQL_ReadyToReadNextRow())
    {
        NWNX_SQL_ReadNextRow();
        return StringToFloat(NWNX_SQL_ReadDataInActiveRow(0));
    }
    return 0.0;
}

int h2_GetExternalInt(string sVarName, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("SELECT intValue FROM "+id.UniqueID+" WHERE id='"+sVarName+"' AND tag='"+id.tag+"'");
    if (NWNX_SQL_ReadyToReadNextRow())
    {
        NWNX_SQL_ReadNextRow();
        return StringToInt(NWNX_SQL_ReadDataInActiveRow(0));
    }
    return 0;
}

location h2_GetExternalLocation(string sVarName, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    location lReturnValue;
    object oArea;
    vector vPosition;
    float fOrientation, fX, fY, fZ;

    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("SELECT locationAreaTagValue,locationPositionXValue,locationPositionYValue,locationPositionZValue,locationOrientationValue FROM "+id.UniqueID+" WHERE id='"+sVarName+"' AND tag='"+id.tag+"'");
    if (NWNX_SQL_ReadyToReadNextRow())
    {
        NWNX_SQL_ReadNextRow();
        oArea = GetObjectByTag(SQLDecodeSpecialChars(NWNX_SQL_ReadDataInActiveRow(0)));
        fX = StringToFloat(NWNX_SQL_ReadDataInActiveRow(1));
        fY = StringToFloat(NWNX_SQL_ReadDataInActiveRow(2));
        fZ = StringToFloat(NWNX_SQL_ReadDataInActiveRow(3));
        fOrientation = StringToFloat(NWNX_SQL_ReadDataInActiveRow(4));
        vPosition = Vector(fX, fY, fZ);
        lReturnValue = Location(oArea, vPosition, fOrientation);
    }
    return lReturnValue;
}

string h2_GetExternalString(string sVarName, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("SELECT stringValue FROM "+id.UniqueID+" WHERE id='"+sVarName+"' AND tag='"+id.tag+"'");
    if (NWNX_SQL_ReadyToReadNextRow())
    {
        NWNX_SQL_ReadNextRow();
        return SQLDecodeSpecialChars(NWNX_SQL_ReadDataInActiveRow(0));
    }
    return "";
}

vector h2_GetExternalVector(string sVarName, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    vector vPosition;
    float fX, fY, fZ;

    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("SELECT vectorXValue,vectorYValue,vectorZValue FROM "+id.UniqueID+" WHERE id='"+sVarName+"' AND tag='"+id.tag+"'");
    if (NWNX_SQL_ReadyToReadNextRow())
    {
        NWNX_SQL_ReadNextRow();
        fX = StringToFloat(NWNX_SQL_ReadDataInActiveRow(0));
        fY = StringToFloat(NWNX_SQL_ReadDataInActiveRow(1));
        fZ = StringToFloat(NWNX_SQL_ReadDataInActiveRow(2));
        vPosition = Vector(fX, fY, fZ);
    }
    return vPosition;
}

object h2_GetExternalObject(string sVarName, location locLocation, object oOwner = OBJECT_INVALID, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("SELECT objectValue FROM "+id.UniqueID+" WHERE id='"+sVarName+"' AND tag='"+id.tag+"'");
    if (NWNX_SQL_ReadyToReadNextRow())
    {
        NWNX_SQL_ReadNextRow();
        vector   vPosition   = GetPositionFromLocation (locLocation);
        if (oOwner == OBJECT_INVALID)
        {
            return NWNX_SQL_ReadFullObjectInActiveRow(0, GetAreaFromLocation(locLocation), vPosition.x, vPosition.y, vPosition.z);
        }
        return NWNX_SQL_ReadFullObjectInActiveRow(0, oOwner, vPosition.x, vPosition.y, vPosition.z);
    }
    return OBJECT_INVALID;
}

void h2_DeleteExternalVariable(string sVarName, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("DELETE FROM "+id.UniqueID+" WHERE id='"+sVarName+"' AND tag='"+id.tag+"'");
}

void h2_SetExternalFloat(string sVarName, float flFloat, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("INSERT INTO "+id.UniqueID+"(id,tag,floatValue) VALUES ('"+sVarName+"','"+id.tag+"',"+FloatToString(flFloat)+") ON DUPLICATE KEY UPDATE floatValue = "+FloatToString(flFloat));
}

void h2_SetExternalInt(string sVarName, int nInt, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    NWNX_SQL_ExecuteQueryOrLog("INSERT INTO "+id.UniqueID+"(id,tag,intValue) VALUES ('"+sVarName+"','"+id.tag+"',"+IntToString(nInt)+") ON DUPLICATE KEY UPDATE intValue = "+IntToString(nInt));
}

void h2_SetExternalLocation(string sVarName, location locLocation, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    string sArea       = SQLEncodeSpecialChars(GetTag(GetAreaFromLocation (locLocation)));
    vector vPosition   = GetPositionFromLocation (locLocation);
    string fx = FloatToString(vPosition.x);
    string fy = FloatToString(vPosition.y);
    string fz = FloatToString(vPosition.z);
    string fFacing     = FloatToString(GetFacingFromLocation(locLocation));
    NWNX_SQL_ExecuteQueryOrLog("INSERT INTO "+id.UniqueID+"(id,tag,locationAreaTagValue,locationPositionXValue,locationPositionYValue,locationPositionZValue,locationOrientationValue) VALUES ('"+sVarName+"','"+id.tag+"','"+sArea+"',"+fx+","+fy+","+fz+","+fFacing+") ON DUPLICATE KEY UPDATE locationAreaTagValue = '"+sArea+"', locationPositionXValue = "+fx+",locationPositionYValue = "+fy+",locationPositionZValue = "+fz+",locationOrientationValue = "+fFacing);

}

void h2_SetExternalString(string sVarName, string sString, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    string value = SQLEncodeSpecialChars(sString);
    NWNX_SQL_ExecuteQueryOrLog("INSERT INTO "+id.UniqueID+"(id,tag,stringValue) VALUES ('"+sVarName+"','"+id.tag+"','"+value+"') ON DUPLICATE KEY UPDATE stringValue = '"+value+"'");
}

void h2_SetExternalVector(string sVarName, vector vVector, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    string fx = FloatToString(vVector.x);
    string fy = FloatToString(vVector.y);
    string fz = FloatToString(vVector.z);
    NWNX_SQL_ExecuteQueryOrLog("INSERT INTO "+id.UniqueID+"(id,tag,vectorXValue,vectorYValue,vectorZValue) VALUES ('"+sVarName+"','"+id.tag+"',"+fx+","+fy+","+fz+") ON DUPLICATE KEY UPDATE vectorXValue = "+fx+",vectorYValue = "+fy+",vectorZValue = "+fz);
}

int h2_SetExternalObject(string sVarName, object oObject, object oPlayer=OBJECT_INVALID, string sCampaignName=H2_DEFAULT_CAMPAIGN_NAME)
{
    struct DBID id = GetDBID(oPlayer);
    string value = NWNX_Object_Serialize(oObject);
    NWNX_SQL_ExecuteQueryOrLog("INSERT INTO "+id.UniqueID+"(id,tag,objValue) VALUES ('"+sVarName+"','"+id.tag+"','"+value+"') ON DUPLICATE KEY UPDATE objValue = "+value);
    return 1;
}

