with (obj_mainchara)
{
    if (holding_item == other.id)
    {
        swordmode = 0;
        scr_characterspr();
        set_facing();
        reflection_offset = -4;
    }
}

with (reticle_draw_marker)
    instance_destroy();

event_inherited();

for (var i = 0; i < array_length(watersplashes); i++)
{
    with (watersplashes[i])
        instance_destroy();
}

if (soundloop != -4)
    snd_stop(soundloop);
