event_inherited();

with (obj_mainchara)
{
    scr_characterspr();
}

for (var j = 0; j < (areasize * areasize); j++)
{
    with (watersplashes[j])
        visible = false;
}
