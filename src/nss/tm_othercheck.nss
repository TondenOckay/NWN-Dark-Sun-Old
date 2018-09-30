// Starting Conditional script: tm_othercheck
// Should only be placed in a henchman conversation file.
// This function returns TRUE if the PC speaking is not the henchman's
// current master.
//
// Written by: Celowin
// Last Updated: 7/25/02
//
int StartingConditional()
{
int nResult;
nResult = GetPCSpeaker() != GetMaster();
return nResult;
}
