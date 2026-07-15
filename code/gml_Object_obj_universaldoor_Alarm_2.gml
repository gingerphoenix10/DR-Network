instance_create(0, 0, 1172);
event_user(7);
if (!mystery)
{
    if (targetroom >= 0)
    {
        room_goto(targetroom);
    }
    else if (targetroom == -4 && !mysterycheck())
    {
        mysterymanback();
    }
}
else
{
    mysterymanback();
}
