sprite_offsets = ds_map_create();
sprite_subs = ds_map_create();
cachelist = ds_list_create();
castlereflects = ds_list_create();
surf = -4;
precreate_surf = -4;
masking_surf = -4;
surface_uvs = -4;
this_frame_objects = ds_list_create();

refresh_masking_surf = function()
{
    if (surface_exists(masking_surf))
        surface_free(masking_surf);
};

add_sprite_offset = function(arg0, arg1, arg2, arg3 = 0)
{
    if (ds_map_exists(sprite_offsets, arg0))
        ds_map_set(sprite_offsets, arg0, [arg1, arg2, arg3]);
    else
        ds_map_add(sprite_offsets, arg0, [arg1, arg2, arg3]);
};

substitute_sprite = function(arg0, arg1)
{
    if (ds_map_exists(sprite_subs, arg0))
        ds_map_set(sprite_subs, arg0, arg1);
    else
        ds_map_add(sprite_subs, arg0, arg1);
};

bound_left = 0;
bound_right = 0;
bound_top = 0;
bound_bottom = 0;
num_reflects = 0;
render_queue = ds_priority_create();

sort_reflectable_objects = function(arg0)
{
    var i = 0;
    
    with (arg0)
    {
        if (object_index == obj_charafake && (you || roomin != room))
            continue;
        
        if (image_alpha <= 0 || !visible)
            continue;
        
        if ((bbox_right + 40) > other.bound_left && (bbox_left - 40) < other.bound_right && (bbox_top - 40) < other.bound_bottom && (bbox_bottom + 40) > other.bound_top)
        {
            if (variable_instance_exists(id, "refl_idx"))
                i = -refl_idx;
            
            ds_priority_add(other.render_queue, id, (depth * 1000) + i);
        }
        
        i++;
    }
};

reflectable_objects = [1198, 1660, 1389, 775, 1559, 512, 171, 373, 954, 1611, 1058, 309, 152, 1735];
shadow_falloff = 160;
depth = 20000;
u_uvs = shader_get_uniform(shd_castlereflect, "uvs");
u_falloff = shader_get_uniform(shd_castlereflect, "shadowheight");
u_y = shader_get_uniform(shd_castlereflect, "pos_y");
_cx = 0;
_cy = 0;

add_reflection = function(arg0)
{
    if (arg0 == -4)
        exit;
    
    array_push(reflectable_objects, arg0);
};
