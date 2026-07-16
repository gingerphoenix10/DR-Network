t++;
event_inherited();

if (!paused && !custom_paused)
{
    if (hurt_timer < 0 && hurt)
    {
        hurt = false;
        hurt_timer = 0;
        var _time = 30;
        invincible = true;
        invincible_timer = _time;
        flicker = true;
        flicker_timer = _time;
    }
    else
    {
        hurt_timer--;
    }
    
    if (invincible_timer < 0 && invincible)
    {
        invincible = false;
        invincible_timer = 0;
    }
    else
    {
        invincible_timer--;
    }
    
    if (flicker_timer <= 0 && flicker)
    {
        flicker = false;
        player_visible = true;
        flicker_timer = 0;
    }
    else
    {
        if (flicker)
        {
            if (player_visible)
                player_visible = false;
            else
                player_visible = true;
        }
        
        flicker_timer--;
    }
    
    if (parry_timer > 0)
    {
        parry_timer--;
        
        if (parry_timer == 0)
            parry_chain = 0;
    }
}
else
{
    player_visible = true;
}

if (instance_exists(heart))
{
    heart.heart_mode = heart_mode;
    
    with (heart)
    {
        if (heart_mode == 0 && other.targetmode == 0 && (instance_number(obj_plat_barrier) == 0 || instance_exists(obj_cutscene_master)))
        {
            if (image_alpha > 0)
                image_alpha -= 0.05;
            else
                image_alpha = 0;
        }
        else if (image_alpha < 1)
        {
            image_alpha += 0.05;
        }
        else
        {
            image_alpha = 1;
        }
    }
    
    if (!targetmode)
    {
        outline_alpha = heart.image_alpha;
        var _darken = outline_alpha * 200;
        image_blend = make_color_rgb(255 - _darken, 255 - _darken, 255 - _darken);
    }
}
