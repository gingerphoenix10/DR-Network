global.entrance = 1;
global.interact = 0;
event_user(7);
instance_create(0, 0, 1311);
room_goto(lostlevels[selectedtopic][selected][2]);
if ((selectedtopic == 1 || lostlevels[selectedtopic][selected][2] == 13) && global.darkzone)
{
    scr_become_light();
}
else if (!(selectedtopic == 1 || lostlevels[selectedtopic][selected][2] == 13) && global.darkzone == 0)
{
    scr_become_dark();
}
