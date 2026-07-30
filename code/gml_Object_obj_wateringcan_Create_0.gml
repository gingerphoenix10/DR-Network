event_inherited();

if (!i_ex(obj_tutorial_text))
    instance_create(0, 0, obj_tutorial_text);

engaged = false;
hitbox_length = 30;
can_cut = false;
cut_sprite_cooldown = 0;
can_switch_to_susie = false;
waterduration = 0;
special_reticle_draw_function = -4;
special_reticle_draw_object = -4;
reticle_draw_marker = instance_create(0, 0, obj_marker_fancy);
reticle_draw_marker.owner = id;

reticle_draw_marker.draw_func = function()
{
    with (reticle_draw_marker.owner)
    {
        if (special_reticle_draw_function != -4)
        {
            if (instance_exists(special_reticle_draw_object) && special_reticle_draw_object.can_water())
                special_reticle_draw_function();
        }
        else if (held && show_reticle >= 4 && obj_mainchara.visible && !obj_mainchara.cutscene)
        {
            draw_sprite_part(spr_watering_reticle, 0, 0, 0, 9, 9, reticle_bounds[0], reticle_bounds[1]);
            draw_sprite_part(spr_watering_reticle, 0, 31, 0, 9, 9, reticle_bounds[2] - 8, reticle_bounds[1]);
            draw_sprite_part(spr_watering_reticle, 0, 31, 31, 9, 9, reticle_bounds[2] - 8, reticle_bounds[3] - 8);
            draw_sprite_part(spr_watering_reticle, 0, 0, 31, 9, 9, reticle_bounds[0], reticle_bounds[3] - 8);
        }
    }
};

init = false;
left_idle_sprite = spr_kris_bow_left_can;
right_idle_sprite = spr_kris_bow_right_can;
left_walk_bow_sprite = spr_kris_walk_bow_left_can;
right_walk_bow_sprite = spr_kris_walk_bow_right_can;
useCustomCharacter = true;
if (useCustomCharacter)
{
    left_idle_sprite = obj_mainchara.lsprite;
    right_idle_sprite = obj_mainchara.rsprite;
    left_walk_bow_sprite = obj_mainchara.lsprite;
    right_walk_bow_sprite = obj_mainchara.rsprite;
}
ralsei_watering_timer = 0;
flowermarker = -4;
soundloop = -4;
watersplashes = [];
mode = 0;
susie = -4;
ralsei = -4;
timer = 0;
facing = 1;
tap_watering = false;

on_press = function()
{
    if (waterduration == 0)
    {
        engaged = true;
        waterduration = 1;
        
        if (tap_watering)
        {
            waterduration = 8;
            snd_play(snd_whip_crack_only);
            scr_shakescreen();
        }
    }
    
    return tap_watering;
};

on_release = function()
{
    engaged = false;
};

scale = 2;
dont_draw = false;
xoffset = 4;
yoffset = -6;
areasize = 1;
show_reticle = false;
reticle_bounds = [0, 0, 0, 0];
dodraw = true;
