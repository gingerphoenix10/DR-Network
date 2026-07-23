global.interact = 3;

if (targetdoor != -4)
    global.targetdoor = targetdoor;

if (musfade == 1)
    mus_volume(global.currentsong[1], 0, 14);

instance_create(0, 0, obj_fadeout);

if (touched == 0)
{
    alarm[2] = 8;
    
    if (musfade == 1)
        alarm[3] = 7;
    
    event_user(8);
    touched = 1;
}
