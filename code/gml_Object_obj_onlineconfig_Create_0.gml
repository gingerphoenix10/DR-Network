image_speed = 0.3;
camx = camera_get_view_x(view_camera[0]);
camy = camera_get_view_y(view_camera[0]);
camwd = camera_get_view_width(view_camera[0]);
camhg = camera_get_view_height(view_camera[0]);
configalpha = 0;
offsety = 0;
menudisappear = 0;
savedata = 0;
pressed = 0;
maxsymbols = 100;
depth = -90000;
divide = 1;
settinglayer = -1;
selected = 0;
lockbuttons = 0;
global.blank = "";
topics = ["Controls", "Host Settings", "Client Settings", "Bonus Settings", "Party Settings", "Back"];
settings = [];
version = global.onlineversion;
changemode = 0;

for (var i = 0; i < 10; i++)
{
    offsetsy[i] = offsety;
    offsety += 40;
}

hearty = offsetsy[array_length(topics) - 1];
heartx = 0;
offsety = 0;

if (!global.darkzone)
    divide = 2;

for (var i = 0; i < 1; i++)
{
    with (instance_create(camx + (150 / divide), camy + (40 / divide) + offsety, obj_changingline))
        linetype = i;
    
    offsety += (50 / divide);
}

function acceptableord(arg0)
{
    var acceptablestring = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var acceptable = true;
    
    for (var i = 1; i <= string_length(arg0); i++)
    {
        if (string_pos(string_char_at(arg0, i), acceptablestring) == 0)
        {
            acceptable = false;
            break;
        }
    }
    
    return acceptable;
}
