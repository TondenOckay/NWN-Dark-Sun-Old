void main()
{
//get the current time
int current_hour = GetTimeHour();
    int nMinute = GetTimeMinute();
    int nSecond = GetTimeSecond();
    int nMillisecond = GetTimeMillisecond();

    //advance the time by 4 hours
    int new_hour = current_hour + 4 ;
    SetTime(new_hour,nMinute,nSecond,nMillisecond);
}

