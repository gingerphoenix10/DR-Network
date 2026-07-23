if (strength <= 0)
    exit;

if (scr_battlebg_fullalpha())
    exit;

var winddir = 1;

if (winddirection >= 90 && winddirection <= 180)
    winddir = 0;

wind_animation_timer++;
var wind_animation_frame = floor((wind_animation_timer * strength) / 8);
var windstr = 0;

if (strength > 1)
    windstr = 1;

var wc = self;

with (obj_mainchara)
{
}

with (obj_caterpillarchara)
{
    if (walk == 0)
    {
        if (name == "susie")
        {
            if (sprite_index == dsprite)
            {
                sprite_index = wc.windsprites_susie_ow_down[winddir];
                image_index = wind_animation_frame;
            }
            
            if (sprite_index == lsprite)
            {
                sprite_index = wc.windsprites_susie_ow_left[winddir];
                image_index = wind_animation_frame;
            }
            
            if (sprite_index == rsprite)
            {
                sprite_index = wc.windsprites_susie_ow_right[winddir];
                image_index = wind_animation_frame;
            }
            
            if (sprite_index == usprite)
            {
                sprite_index = wc.windsprites_susie_ow_up[winddir];
                image_index = wind_animation_frame;
            }
        }
        else if (name == "ralsei")
        {
            if (sprite_index == dsprite)
            {
                sprite_index = wc.windsprites_ralsei_ow_down[winddir];
                image_index = wind_animation_frame;
            }
            
            if (sprite_index == lsprite)
            {
                sprite_index = wc.windsprites_ralsei_ow_left[winddir];
                image_index = wind_animation_frame;
            }
            
            if (sprite_index == rsprite)
            {
                sprite_index = wc.windsprites_ralsei_ow_right[winddir];
                image_index = wind_animation_frame;
            }
            
            if (sprite_index == usprite)
            {
                sprite_index = wc.windsprites_ralsei_ow_up[winddir];
                image_index = wind_animation_frame;
            }
        }
    }
    else if (name == "susie")
    {
        if (sprite_index == dsprite)
            sprite_index = wc.windsprites_susie_walk_down[winddir];
        
        if (sprite_index == lsprite)
            sprite_index = wc.windsprites_susie_walk_left[winddir];
        
        if (sprite_index == rsprite)
            sprite_index = wc.windsprites_susie_walk_right[winddir];
        
        if (sprite_index == usprite)
            sprite_index = wc.windsprites_susie_walk_up[winddir];
    }
    else if (name == "ralsei")
    {
        if (sprite_index == dsprite)
            sprite_index = wc.windsprites_ralsei_walk_down[winddir];
        
        if (sprite_index == lsprite)
            sprite_index = wc.windsprites_ralsei_walk_left[winddir];
        
        if (sprite_index == rsprite)
            sprite_index = wc.windsprites_ralsei_walk_right[winddir];
        
        if (sprite_index == usprite)
            sprite_index = wc.windsprites_ralsei_walk_up[winddir];
    }
    
    scr_depth();
}

with (obj_climb_kris)
{
    if (neutralcon == 1)
    {
        var idx = floor(image_index / 2) % 2;
        sprite_index = wc.windsprites_kris_climb[winddir + (2 * idx)];
        image_index = wind_animation_frame;
    }
}

with (obj_climb_susie)
{
    if (name == "susie" && con == 0)
    {
        var idx = floor(image_index / 2) % 2;
        sprite_index = wc.windsprites_susie_climb[winddir + (2 * idx)];
        image_index = wind_animation_frame;
    }
    else if (name == "ralsei" && con == 0)
    {
        var idx = floor(image_index / 2) % 2;
        sprite_index = wc.windsprites_ralsei_climb[winddir + (2 * idx)];
        image_index = wind_animation_frame;
    }
}

with (obj_plat_player)
{
    if (sprite_index == spr_kris_plat_idle)
    {
        var dir = winddir;
        
        if (image_xscale < 0)
            dir = 1 - winddir;
        
        sprite_index = wc.windsprites_kris_plat[(dir * 2) + windstr];
        image_index = wind_animation_frame;
    }
    else if (sprite_index == spr_kris_plat_crouch)
    {
        var dir = winddir;
        
        if (image_xscale < 0)
            dir = 1 - winddir;
        
        sprite_index = wc.windsprites_kris_plat_crouch[(dir * 2) + windstr];
        image_index = wind_animation_frame;
    }
}

with (obj_plat_follower)
{
    if (name == "susie")
    {
        if (sprite_index == spr_idle)
        {
            var dir = winddir;
            
            if (image_xscale < 0)
                dir = 1 - winddir;
            
            sprite_index = wc.windsprites_susie_plat[(dir * 2) + windstr];
            image_index = wind_animation_frame;
        }
    }
    else if (name == "ralsei")
    {
        if (sprite_index == spr_idle)
        {
            var dir = winddir;
            
            if (image_xscale < 0)
                dir = 1 - winddir;
            
            sprite_index = wc.windsprites_ralsei_plat[(dir * 2) + windstr];
            image_index = wind_animation_frame;
        }
    }
}
