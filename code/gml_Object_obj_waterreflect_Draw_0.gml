ds_list_clear(this_frame_objects);

if (!surface_exists(surf))
    surf = surface_create(sprite_width, sprite_height + 80);

generate_tiles();
surface_set_target(surf);
draw_clear_alpha(c_white, 0);
draw_reflection(obj_wateringcan);
draw_reflection(obj_mainchara);
draw_reflection(obj_mainchara_dash);

if (global.showcompanions)
{
    draw_reflection(obj_caterpillarchara);
    draw_reflection(obj_caterpillar_dash);
}

draw_reflection(obj_actor);
draw_reflection(obj_charafake);

for (var i = 0; i < ds_list_size(this_frame_objects); i++)
{
    with (ds_list_find_value(this_frame_objects, i))
    {
        if (image_alpha <= 0 || !visible)
            continue;
        
        var refl_off = 0;
        
        if (object_index == obj_wateringcan)
        {
            if (waterduration > 2 && can_use)
            {
                draw_sprite_ext(spr_wateringcanspray, (current_time / 100) % 3, (x - other.x) + (20 * image_xscale), (y + 80) - other.y, sign(image_xscale) * -2, image_yscale, 180, image_blend, 1);
                continue;
            }
        }
        
        if (variable_instance_exists(self, "reflection_offset"))
            refl_off = reflection_offset;
        
        draw_sprite_ext(sprite_index, image_index, x - other.x, (y - other.y) + sprite_height + refl_off, -image_xscale, image_yscale, 180, c_white, 1);
    }
}

draw_surface(tilesurf, 0, 0);
surface_reset_target();
draw_set_blend_mode(bm_add);
draw_surface_ext(surf, x, y + shadow_y_offset, 1, 1, 0, c_white, 0.5);
draw_set_blend_mode(bm_normal);
