dresalpha = 0;
floatycool = 0;
shakey = 0;
chosencharacter = 0;
characters = [["kris", "Kris", 380], ["susie", "Susie", 981], ["ralsei", "Ralsei", 497], ["noelle", "Noelle", 409]];
if (global.unlockchapter5)
{
    array_push(characters, ["aqua", "Aqua", 3541]);
    array_push(characters, ["seth", "Seth", 2001]);
    array_push(characters, ["yellow", "Yellow", 6206]);
    array_push(characters, ["pink", "Pink", 4099]);
}
if (global.charactersunlocked[0])
{
    array_push(characters, ["frisk", "Frisk", 8539]);
}
krisname = "";
if (irandom_range(0, 100) > 80)
{
    krisname = "Kris";
}
if (global.charactersunlocked[1])
{
    array_push(characters, ["chara", krisname, 8536]);
}
offsets = [];
colors = [];
ready = 0;
offsetanimx = 0;
var offsetx = 0;
for (var i = 0; i < array_length(characters); i++)
{
    colors[i] = 0;
    offsets[i] = offsetx;
    offsetx += 150;
}
for (var i = 0; i < array_length(characters); i++)
{
    if (global.character == characters[i][0])
    {
        chosencharacter = i;
        offsetanimx = offsets[i];
    }
}
