void main()
{
    ClearAllActions();
    ActionMoveToObject(GetNearestObjectByTag("CHAIR01"));
    ActionSit(GetNearestObjectByTag("CHAIR01"));
}
