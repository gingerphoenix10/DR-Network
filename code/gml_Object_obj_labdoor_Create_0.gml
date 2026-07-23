depth = 999999;
type = 2;
s_buffer = 10;
o_sound = 0;
c_sound = 0;
s_sound = 0;
open = -1;
ox = 0;
anim = 0;
red = 0;
yel = 0;
gre = 0;
blu = 0;

if (global.doorstage[0] == 2)
    red = 1;

if (global.doorstage[1] == 2)
    blu = 1;

if (global.doorstage[2] == 2)
    gre = 1;

if (global.doorstage[3] == 2)
    yel = 1;

if (room == room_truelab_elevator)
{
    shouldopen = 0;
    type = 0;
}

if (room == room_truelab_hub && x < ((room_width * 2) / 3))
{
    shouldopen = 0;
    type = 1;
    
    if (red == 1 && blu == 1 && gre == 1 && yel == 1)
        shouldopen = 1;
}

if (room == room_truelab_hub && x > ((room_width * 2) / 3))
{
    shouldopen = 0;
    type = 2;
    
    if (red == 1)
        shouldopen = 1;
}

s1 = instance_create(x, y + 40, obj_solidblock);
s2 = instance_create(x + 20, y + 40, obj_solidblock);
myinteract = 0;

if (global.entrance == 19)
    alarm[0] = 1;
