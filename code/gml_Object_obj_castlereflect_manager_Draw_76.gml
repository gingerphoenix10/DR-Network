if (array_get(scr_platswap_yscale(), 0) == 1)
{
    exit;
}
ds_list_clear(castlereflects);
ds_list_clear(this_frame_objects);
with (234)
{
    if (!is_culled)
    {
        ds_list_add(other.castlereflects, id);
    }
}
num_reflects = ds_list_size(castlereflects);
_cx = camera_get_view_x(view_camera[0]);
_cy = camera_get_view_y(view_camera[0]);
bound_left = _cx - 100;
bound_right = bound_left + 840;
bound_top = _cy - 100;
bound_bottom = bound_top + 680;
var reflectables = array_length(reflectable_objects);
for (var n = 0; n < reflectables; n++)
{
    if (global.showcompanions || reflectable_objects[n] != 1389)
    {
        sort_reflectable_objects(reflectable_objects[n]);
    }
}
while (!ds_priority_empty(render_queue))
{
    ds_list_add(this_frame_objects, ds_priority_delete_max(render_queue));
}
