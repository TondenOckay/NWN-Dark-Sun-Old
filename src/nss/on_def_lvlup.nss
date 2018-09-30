/*
 OnPlayerLevelUp
 When PC levels up and you have feat defilers power, you will get d100(HD) xp.
*/
const int FEAT_DEFILERS_POWER = 4893; // this is index from feat.2da

void main()
{
 object oPC = GetPCLevellingUp();
 if(GetHasFeat(FEAT_DEFILERS_POWER, oPC) >0)
  ExecuteScript("feat_defilers_po", oPC);
}

