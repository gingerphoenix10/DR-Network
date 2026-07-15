if (global.partydata != -4)
{
    if (global.partydata.lightordark == 0)
    {
        scr_become_light();
    }
    else
    {
        scr_become_dark();
    }
    global.entrance = global.partydata.entrance;
    global.start_in_platmode = global.partydata.platformer;
}
event_user(7);
instance_create(0, 0, 1172);
switched = 1;
room_goto(targetroom);
