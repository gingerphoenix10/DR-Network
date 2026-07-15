event_inherited();
if (!held && waterduration > 0)
{
    engaged = false;
    for (var j = 0; j < (areasize * areasize); j++)
    {
        with (watersplashes[j])
        {
            visible = false;
        }
    }
    waterduration = 0;
    exit;
}
if (!init)
{
    init = true;
    for (var i = 0; i < (areasize * areasize); i++)
    {
        watersplashes[i] = instance_create(x, y, 1238);
        with (watersplashes[i])
        {
            visible = 0;
            image_index = 1.5 * i;
            sprite_index = 3347;
            image_speed = 0.5;
            scr_depth();
            scr_darksize();
        }
    }
}
if (global.interact > 0 || !can_use)
{
    engaged = false;
}
if (waterduration > 0)
{
    if (tap_watering)
    {
        waterduration++;
        if (waterduration >= 7 && !engaged)
        {
            waterduration = 0;
        }
    }
    else
    {
        waterduration++;
        if (waterduration >= 7 && !engaged)
        {
            waterduration = 0;
        }
    }
}
var true_engaged = waterduration > 2;
if (true_engaged)
{
    with (1198)
    {
        run = 0;
        twobuffer = 0;
    }
    if (!instance_exists(3))
    {
        if (soundloop == -4)
        {
            var snd = 9;
            soundloop = snd_loop(snd);
            snd_volume(soundloop, 0.8, 0);
        }
    }
}
else if (soundloop != -4)
{
    snd_stop(soundloop);
    soundloop = -4;
}
if (held && can_switch_to_susie && obj_mainchara.visible && button3_p())
{
    mode = (mode + 1) % 2;
    if (mode == 1)
    {
        with (1389)
        {
            if (name == "susie")
            {
                other.susie = self;
            }
            if (name == "ralsei")
            {
                other.ralsei = self;
            }
        }
    }
    else
    {
        if (i_ex(susie))
        {
            susie.image_alpha = 1;
        }
        with (1198)
        {
            scr_characterspr();
        }
    }
}
with (1198)
{
    if (swordmode == 99)
    {
        swordmode = 0;
    }
}
