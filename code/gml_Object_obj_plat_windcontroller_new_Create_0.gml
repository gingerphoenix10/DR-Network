init = 0;
con = 0;
timer = 0;
wind_animation_timer = 0;
boost_timer = 0;
flip_timer = 0;
strength = 1;
severe = false;

boost_wind = function(arg0)
{
    boost_timer = arg0;
    timer = 0;
    strength = 2;
    scr_vfx_windboost(winddirection);
};

flip_wind = function(arg0, arg1, arg2 = 0, arg3 = false)
{
    with (obj_pinwheel_windspeed)
        boost_timer = 0;
    
    flip_timer = arg0;
    change_wind_direction(arg1, arg2, arg3);
    scr_vfx_windboost(winddirection);
};

update_wind_strength = function()
{
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
    
    if (winddirection == -1)
        strengthmult = 0;
    
    with (obj_plat_wind)
    {
        if (!controllerimmune)
            strength = strengthmult * other.strength;
    }
};

change_wind_direction = function(arg0, arg1, arg2 = false)
{
    if (arg1 <= 0)
        arg1 = 1;
    
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
    
    if (arg0 == -1)
        strengthmult = 0;
    
    winddirection = arg0;
    
    if (flag != -1 && !arg2)
    {
        global.flag[flag] = arg0 + 2;
        reference_direction = arg0;
    }
    
    with (obj_plat_wind)
    {
        if (!controllerimmune)
        {
            strength = strengthmult * other.strength;
            
            if (arg1 > 1)
                scr_lerpvar("winddirection", winddirection, arg0, arg1, 1, "inout");
            else
                winddirection = arg0;
            
            controllable = other.rising_section && arg0 == 90;
        }
    }
};

reference_direction = winddirection;
windsprites_kris_ow_down = [3988, 2635];
windsprites_kris_ow_left = [2008, 3894];
windsprites_kris_ow_right = [7546, 2091];
windsprites_kris_ow_up = [7410, 7749];
windsprites_susie_ow_down = [6156, 2427];
windsprites_susie_ow_left = [6143, 7335];
windsprites_susie_ow_right = [8048, 5419];
windsprites_susie_ow_up = [3209, 7632];
windsprites_ralsei_ow_down = [3859, 5870];
windsprites_ralsei_ow_left = [4814, 7069];
windsprites_ralsei_ow_right = [3438, 5633];
windsprites_ralsei_ow_up = [1630, 8280];
windsprites_kris_walk_down = [7436, 4530];
windsprites_kris_walk_left = [4699, 3466];
windsprites_kris_walk_right = [6841, 7391];
windsprites_kris_walk_up = [2293, 5374];
windsprites_susie_walk_down = [6724, 5600];
windsprites_susie_walk_left = [7298, 6522];
windsprites_susie_walk_right = [4703, 1652];
windsprites_susie_walk_up = [6466, 6404];
windsprites_ralsei_walk_down = [5001, 8014];
windsprites_ralsei_walk_left = [2751, 6102];
windsprites_ralsei_walk_right = [1721, 6978];
windsprites_ralsei_walk_up = [1759, 6219];
windsprites_kris_climb = [3831, 2245, 6082, 5944];
windsprites_susie_climb = [7032, 3746, 5584, 2495];
windsprites_ralsei_climb = [1437, 7294, 6943, 2559];
windsprites_kris_plat = [2917, 5479, 7976, 7652];
windsprites_kris_plat_crouch = [3237, 5060, 2641, 7602];
windsprites_susie_plat = [5741, 6500, 2763, 1569];
windsprites_ralsei_plat = [5373, 5460, 3421, 7915];
