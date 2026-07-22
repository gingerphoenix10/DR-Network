dresalpha = 0;
floatycool = 0;
shakey = 0;
chosencharacter = 0;
characters = [["kris", "Kris", spr_krisd], ["susie", "Susie", spr_susied], ["ralsei", "Ralsei", spr_ralsei_down], ["noelle", "Noelle", spr_noelle_walk_down_lw]];

if (global.unlockchapter5)
{
    array_push(characters, ["aqua", "Aqua", spr_aqua_walk_down]);
    array_push(characters, ["seth", "Seth", spr_seth_walk_down]);
    array_push(characters, ["yellow", "Yellow", spr_yellow_walk_down]);
    array_push(characters, ["pink", "Pink", spr_pink_angle]);
}

if (global.charactersunlocked[0])
    array_push(characters, ["frisk", "Frisk", spr_maincharad]);

krisname = "";

if (irandom_range(0, 100) > 80)
    krisname = "Kris";

if (global.charactersunlocked[1])
    array_push(characters, ["chara", krisname, spr_charad]);

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
