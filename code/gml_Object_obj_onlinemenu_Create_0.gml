text = ["Config", "Online", "Fun", "Dresser", "Party", "Back"];
depth = -90001;
selected = 0;
boxoffset = -500;
color = 16777215;
menudisappear = 0;
heartoffy = 0;
hearty = 0;
pressed = 0;
presseffect = [];
heartangle = 0;
offsetsy = [];
done = 0;
var offsety = 0;
for (var i = 0; i < array_length(text); i++)
{
    offsetsy[i] = offsety;
    presseffect[i] = 0;
    offsety += 40;
}
