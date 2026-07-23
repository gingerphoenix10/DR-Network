event_inherited();

if (!held && waterduration > 0)
{
    engaged = false;
    
    for (var j = 0; j < (areasize * areasize); j++)
    {
        with (watersplashes[j])
            visible = false;
    }
    
    waterduration = 0;
    exit;
}

if (!init)
{
    init = true;
    
    for (var i = 0; i < (areasize * areasize); i++)
    {
        watersplashes[i] = instance_create(x, y, obj_marker);
        
        with (watersplashes[i])
        {
            visible = 0;
            image_index = 1.5 * i;
            sprite_index = spr_wateringcanspray_ground;
            image_speed = 0.5;
            scr_depth();
            scr_darksize();
        }
    }
}

if (global.interact > 0 || !can_use)
    engaged = false;

if (waterduration > 0)
{
    if (tap_watering)
    {
        waterduration++;
        
        if (waterduration >= 7 && !engaged)
            waterduration = 0;
    }
    else
    {
        waterduration++;
        
        if (waterduration >= 7 && !engaged)
            waterduration = 0;
    }
}

var true_engaged = waterduration > 2;

if (true_engaged)
{
    with (obj_mainchara)
    {
        run = 0;
        twobuffer = 0;
    }
    
    if (!instance_exists(obj_dw_dogballoon))
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
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                other.susie = self;
            
            if (name == "ralsei")
                other.ralsei = self;
        }
    }
    else
    {
        if (i_ex(susie))
            susie.image_alpha = 1;
        
        with (obj_mainchara)
            scr_characterspr();
    }
}

with (obj_mainchara)
{
    if (swordmode == 99)
        swordmode = 0;
}
