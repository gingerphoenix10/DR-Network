if (con < 0)
    exit;

if (scr_battlebg_fullalpha())
    exit;

if (instance_number(obj_plat_windcontroller_new) > 1)
{
    instance_destroy();
    exit;
}

var strengthmult = 1;

if (pinwheel_controlled)
{
    var active = false;
    
    with (obj_pinwheel_held)
    {
        if (upright)
        {
            active = true;
            break;
        }
    }
    
    if (!active)
        strengthmult = 0;
}

if (init == 0)
{
    init = 1;
    
    if (flag >= 0)
    {
        winddirection = [global.flag[flag]] - 2;
        change_wind_direction(winddirection, 0);
    }
    
    reference_direction = winddirection;
}

if (!global.pause_plat)
{
    boost_timer--;
    
    if (boost_timer == 0)
    {
        strength = 1;
        update_wind_strength();
    }
    
    flip_timer--;
    
    if (flip_timer == 0)
    {
        strength = 1;
        change_wind_direction(reference_direction, 0);
    }
    
    timer++;
    
    if (strength > 1 && (timer % (30 - (10 * severe))) == 1)
    {
        var dx = lengthdir_x(600, 180 + winddirection);
        var dy = lengthdir_y(600, 180 + winddirection);
        var boost = instance_create(camerax() + 320 + dx, cameray() + 240 + dy, obj_plat_windboost);
        boost.direction = winddirection;
        boost.severe = severe;
        boost.winddir = winddirection;
        boost.image_angle = winddirection;
    }
}
