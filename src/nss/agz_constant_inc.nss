//::///////////////////////////////////////////////
//:: Name     Common internally used constants
//:: FileName agz_constant_inc
//:://////////////////////////////////////////////
/*
    agz 20030923 0.19.01 - new script
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

//
// AO Type constants
//
const int AO_TYPE_GENERIC                         = 0x00000001;
const int AO_TYPE_PRIMITIVE                       = 0x00000002;
const int AO_SUBTYPE_INT                          = 0x00010002;
const int AO_SUBTYPE_FLOAT                        = 0x00020002;
const int AO_SUBTYPE_STRING                       = 0x00040002;
const int AO_MASK_PRIMITIVE_SIMPLE                = 0x00070000;
const int AO_SUBTYPE_LOCATION                     = 0x00080002;
const int AO_TYPE_EFFECT                          = 0x00000004;
// agz 20031221 0.20.01 added itemproperty encapsulation
const int AO_TYPE_ITEMPROPERTY                    = 0x00000008;
const int AO_TYPE_EXECUTABLE                      = 0x00000040;
const int AO_TYPE_COLLECTION                      = 0x00000080;
const int AO_SUBTYPE_LIST                         = 0x00010080;
const int AO_SUBTYPE_SET                          = 0x00020080;
// agz 20030927 0.19.02 added plain arrays
const int AO_SUBTYPE_ARRAY                        = 0x00040080;
// agz 20031003 0.19.03 added LabeledList
const int AO_SUBTYPE_LABELEDLIST                  = 0x00080080;
const int AO_TYPE_SYS_SERVICE                     = 0x00001000;
const int AO_SUBTYPE_SYS_CURSOR                   = 0x00011000;
// agz 20031008 0.19.04 Custom Object Support
const int AO_SUBTYPE_SYS_COS_TYPE                 = 0x00021000;
// agz 20030922 0.19.01 added raw-array support
const int AO_TYPE_RAW                             = 0x00002000;
const int AO_SUBTYPE_RAW_ARRAY                    = 0x00012000;
// agz 20031008 0.19.04 Custom Object Support
const int AO_TYPE_CUSTOMOBJECT                    = 0x00004000;
// used for AO Reuse optimization
const int AO_EMPTY_CELL                           = 0x80000000;
const int AO_FREE_CELL                            = 0x40000000;


//
// Module-level Local names
//
// agz 20031008 0.19.04 Custom Object Support
const string AGZ_COS_TYPESLIST                  = "agz_COS_Pointer_TypesList";


//
// internally used Local names
//
const string AGZ_AO                             = "agz_AO";
const string AGZ_REF_COUNT                      = "agz_RefCount";
const string AGZ_PERMANENT                      = "agz_Permanent";
const string AGZ_TOP                            = "agz_Top";
const string AGZ_BOTTOM                         = "agz_Bottom";
const string AGZ_RAW_TOP                        = "agz_RawTop";
const string AGZ_RAW_BOTTOM                     = "agz_RawBottom";
const string AGZ_TALLY                          = "agz_Tally";
const string AGZ_CURSOR                         = "agz_Cursor";
const string AGZ_EO_CODE                        = "agz_Code";
const string AGZ_EO_ARGS                        = "agz_Args";
const string AGZ_PE_PROTECTED                   = "agz_Protected";
const string AGZ_PE_VALUE                       = "agz_Value";
const string AGZ_PE_LOC                         = "agz_Loc";
// agz 20030927 0.19.02 added plain arrays
const string AGZ_MAXINDEX                       = "agz_MaxIx";
// agz 20031008 0.19.04 Custom Object Support
const string AGZ_COS_TYPE                       = "agz_COS_Type";
const string AGZ_COS_SUPER                      = "agz_COS_Super";
const string AGZ_COS_FLAGS                      = "agz_COS_Flag";
const string AGZ_COS_FUNCTIONS                  = "agz_COS_Funs";
const string AGZ_COS_FUNCTION_LOCALES           = "agz_COS_FunLocs";
const string AGZ_COS_CONSTRUCT                  = "agz_COS_Constr";
const string AGZ_COS_CONSTRUCT_LOCALE           = "agz_COS_ConLoc";
const string AGZ_COS_DESTRUCT                   = "agz_COS_Destr";
const string AGZ_COS_DESTRUCT_LOCALE            = "agz_COS_DesLoc";


//
// execute script parameters Local names
//
const string AGZ_MESSAGE_CODE                   = "agz_Msg_Code";
const string AGZ_EO_ENG_CALL                    = "agz_EO_EngCall";
const string AGZ_EO_ENG_FUNCTION                = "agz_EO_EngFun";
const string AGZ_EO_ENG_ARG_1                   = "agz_EO_EngArg1";
const string AGZ_EO_ENG_ARG_2                   = "agz_EO_EngArg2";
const string AGZ_EO_ENG_ARG_3                   = "agz_EO_EngArg3";
const string AGZ_EO_ENG_RESULT                  = "agz_EO_EngRes";
// agz 20031008 0.19.04 Custom Object Support
const string AGZ_EO_ENG_COS_LOCALE              = "agz_EO_EngCosLoc";


//
// EO Engine call constants
//
const int EO_ENGINE_CALL_EVALUATE                 =  1;
// agz 20031008 0.19.04 Custom Object Support
const int EO_ENGINE_CALL_COS_FUNCTION             =  2;
const int EO_ENGINE_CALL_EVALUATE_IN_COLLECTION   = 11;
const int EO_ENGINE_CALL_EXECUTE_ON_COLLECTION    = 12;
const int EO_ENGINE_CALL_FIND_IN_COLLECTION       = 13;
const int EO_ENGINE_CALL_SELECT_FROM_COLLECTION   = 14;


//
// Flags
//
const int COS_CUSTOM_OBJECT_IS_REUSABLE           =  1;


//
// Executable scripts name
//
const string AGZ_SCRIPT_EO_ENGINE               = "agz_engine";
const string AGZ_SCRIPT_ALERTER                 = "agz_alerter";


//
// Alert and info msg codes
//
const int AGZ_MSG_ALERT_AO_CREATION_ERROR       = 1;

