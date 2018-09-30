// Starting Conditional script: tm_henchlev
// Should only be put into a conversation file for a henchman
//
// Returns TRUE if the henchman is ready to level up.
#include "tm_henchlib"
int StartingConditional()
{
int nResult;
object oHench = GetHenchman(GetPCSpeaker());
nResult = GetReadyToLevel(oHench) == TRUE;
return nResult;
}
