ds_list_clear(this_frame_objects);
if (!surface_exists(surf))
{
    surf = surface_create(sprite_width, sprite_height + 80);
}
generate_tiles();
surface_set_target(surf);
draw_clear_alpha(16777215, 0);
draw_reflection(1008);
draw_reflection(1198);
draw_reflection(1660);
if (global.showcompanions)
{
    draw_reflection(1389);
    draw_reflection(775);
}
draw_reflection(1559);
draw_reflection(obj_charafake);
for (var i = 0; i < ds_list_size(this_frame_objects); i++)
{
    with (ds_list_find_value(this_frame_objects, i))
    {
        if (image_alpha <= 0 || !visible)
        {
            continue;
        }
        var refl_off = 0;
        if (object_index == 1008)
        {
            if (waterduration > 2 && can_use)
            {
                draw_sprite_ext(3819, (current_time / 100) % 3, (x - other.x) + (20 * image_xscale), (y + 80) - other.y, sign(image_xscale) * -2, image_yscale, 180, image_blend, 1);
                continue;
            }
        }
        if (variable_instance_exists(self, "reflection_offset"))
        {
            refl_off = reflection_offset;
        }
        draw_sprite_ext(sprite_index, image_index, x - other.x, (y - other.y) + sprite_height + refl_off, -image_xscale, image_yscale, 180, 16777215, 1);
    }
}
draw_surface(tilesurf, 0, 0);
surface_reset_target();
draw_set_blend_mode(1);
draw_surface_ext(surf, x, y + shadow_y_offset, 1, 1, 0, 16777215, 0.5);
draw_set_blend_mode(0);
