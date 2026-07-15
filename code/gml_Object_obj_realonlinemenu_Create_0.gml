camx = camera_get_view_x(view_camera[0]);
camy = camera_get_view_y(view_camera[0]);
camwd = camera_get_view_width(view_camera[0]);
camhg = camera_get_view_height(view_camera[0]);
depth = -90000;
savedata = 0;
menudisappear = 0;
offsety = 0;
heartangle = 0;
heartoffy = 0;
hearty = 0;
configalpha = 0;
lockbuttons = 0;
selected = 0;
pushed = 0;
color = c_yellow;
buttons = ["Create Server", "Join a Server", "Disconnect", "Join Official Server", "Back"];
divide = 1;

if (!global.darkzone)
    divide = 2;

for (var i = 1; i < 3; i++)
{
    with (instance_create(camx + (100 / divide), camy + (40 / divide) + offsety, obj_changingline))
        linetype = i;
    
    offsety += (50 / divide);
}

offsety = 0;

for (var i = 0; i < 2; i++)
{
    with (instance_create((camx + camwd) - (40 / divide), camy + (40 / divide) + offsety, obj_clickablebutton))
        type = i;
    
    offsety += (40 / divide);
}

offsety = 0;

for (var i = 0; i < array_length(buttons); i++)
{
    offsetsy[i] = offsety;
    presseffect[i] = 0;
    offsety += 40;
}

hearty = offsetsy[array_length(buttons) - 1];
