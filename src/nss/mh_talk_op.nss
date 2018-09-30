void main()
{
  object oSeen = GetLastPerceived();

  if(GetIsPC(oSeen)&& GetLastPerceptionSeen())
  {
     ActionSpeakString("Hey! You over there.");
     ActionWait(2.0);
     ActionSpeakString("Come over here and check out the stuff i have for sale.");
  }
}
