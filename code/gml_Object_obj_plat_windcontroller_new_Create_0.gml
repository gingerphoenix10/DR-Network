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

// TODO: Currently overrides custom characters, but this is painful to edit so I'll fix that another time
reference_direction = winddirection;
windsprites_kris_ow_down = [spr_kris_idled_windl, spr_kris_idled_windr];
windsprites_kris_ow_left = [spr_kris_idlel_windl, spr_kris_idlel_windr];
windsprites_kris_ow_right = [spr_kris_idler_windl, spr_kris_idler_windr];
windsprites_kris_ow_up = [spr_kris_idleu_windl, spr_kris_idleu_windr];
windsprites_susie_ow_down = [spr_susie_idled_windl, spr_susie_idled_windr];
windsprites_susie_ow_left = [spr_susie_idlel_windl, spr_susie_idlel_windr];
windsprites_susie_ow_right = [spr_susie_idler_windl, spr_susie_idler_windr];
windsprites_susie_ow_up = [spr_susie_idleu_windl, spr_susie_idleu_windr];
windsprites_ralsei_ow_down = [spr_ralsei_idled_windl, spr_ralsei_idled_windr];
windsprites_ralsei_ow_left = [spr_ralsei_idlel_windl, spr_ralsei_idlel_windr];
windsprites_ralsei_ow_right = [spr_ralsei_idler_windl, spr_ralsei_idler_windr];
windsprites_ralsei_ow_up = [spr_ralsei_idleu_windl, spr_ralsei_idleu_windr];
windsprites_kris_walk_down = [spr_kris_walkd_windl, spr_kris_walkd_windr];
windsprites_kris_walk_left = [spr_kris_walkl_windl, spr_kris_walkl_windr];
windsprites_kris_walk_right = [spr_kris_walkr_windl, spr_kris_walkr_windr];
windsprites_kris_walk_up = [spr_kris_walku_windl, spr_kris_walku_windr];
windsprites_susie_walk_down = [spr_susie_walkd_windl, spr_susie_walkd_windr];
windsprites_susie_walk_left = [spr_susie_walkl_windl, spr_susie_walkl_windr];
windsprites_susie_walk_right = [spr_susie_walkr_windl, spr_susie_walkr_windr];
windsprites_susie_walk_up = [spr_susie_walku_windl, spr_susie_walku_windr];
windsprites_ralsei_walk_down = [spr_ralsei_walkd_windl, spr_ralsei_walkd_windr];
windsprites_ralsei_walk_left = [spr_ralsei_walkl_windl, spr_ralsei_walkl_windr];
windsprites_ralsei_walk_right = [spr_ralsei_walkr_windl, spr_ralsei_walkr_windr];
windsprites_ralsei_walk_up = [spr_ralsei_walku_windl, spr_ralsei_walku_windr];
windsprites_kris_climb = [spr_kris_climbl_windl, spr_kris_climbl_windr, spr_kris_climbr_windl, spr_kris_climbr_windr];
windsprites_susie_climb = [spr_susie_climbl_windl, spr_susie_climbl_windr, spr_susie_climbr_windl, spr_susie_climbr_windr];
windsprites_ralsei_climb = [spr_ralsei_climbl_windl, spr_ralsei_climbl_windr, spr_ralsei_climbr_windl, spr_ralsei_climbr_windr];
windsprites_kris_plat = [spr_kris_plat_idle_windl, spr_kris_plat_idle_windl_strong, spr_kris_plat_idle_windr, spr_kris_plat_idle_windr_strong];
windsprites_kris_plat_crouch = [spr_kris_plat_crouch_windl, spr_kris_plat_crouch_windl_strong, spr_kris_plat_crouch_windr, spr_kris_plat_crouch_windr_strong];
windsprites_susie_plat = [spr_plat_susie_idle_windl, spr_plat_susie_idle_windl_strong, spr_plat_susie_idle_windr, spr_plat_susie_idle_windr_strong];
windsprites_ralsei_plat = [spr_plat_ralsei_idle_windl, spr_plat_ralsei_idle_windl_strong, spr_plat_ralsei_idle_windr, spr_plat_ralsei_idle_windr_strong];
