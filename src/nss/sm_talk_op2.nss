void main()
{
  object oSeen = GetLastPerceived();

  if(GetIsPC(oSeen)&& GetLastPerceptionSeen())
  {
     ActionSpeakString("This is what happen's when you magget's try and run.");
     ActionWait(3.0);
     ActionSpeakString("Your last day's of your pitiful life can either be slowing dieing on this spike or spent dieing in the heat.");
  }
}
