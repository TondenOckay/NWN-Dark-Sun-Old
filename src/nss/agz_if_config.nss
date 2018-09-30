//::///////////////////////////////////////////////
//:: Name     Static Configuration Constants
//:: FileName agz_if_config
//:://////////////////////////////////////////////
/*

 Note: changing these constants requires recompiling
       everything; do it with a module Build

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


// Exception logging control
// turn it on if you want runtime exception messages printed on the log
// default value : TRUE
const int agz_LOG_EXCEPTIONS                       = TRUE;

// Object reuse
// turn it on enable reuse of AO purged by the Garbage Collection
// note: this is a powerful optimization, but not without risk
// default value : TRUE
const int agz_ENABLE_AO_REUSE                      = TRUE;

// Collection GC segmentation
// Limit the number of collection slots freed in a single burst of GC
// Set it lower than 1 to disable GC segmentation and free
// all slots in a single GC intervention, however long
const int   agz_CL_GC_SEGMENT_SIZE                   = 100;
// Specify a delay to introduce between GC segmants
const float agz_CL_GC_SEGMENT_DELAY                  = 0.1f;

// Preistantiated integers range
// used to build and make permanent the encapsulations for
// commonly used integers at the start of the system
// default values : -100 to +100
const int agz_PE_PREINSTANTIATE_INT_LOW            = -100;
const int agz_PE_PREINSTANTIATE_INT_HIGH           =  100;

// agz 20030927 0.19.02 - added Array Collection sub_type
// Default Array Maximum Index
// used to provide a default value for ArrayNew() (see)
const int agz_CL_DEFAULT_ARRAY_MAXINDEX            = 1000;

