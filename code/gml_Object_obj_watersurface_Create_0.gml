surf = -4;
disruption = 1;

generate_surface = function()
{
    surf = surface_create(sprite_width / 2, sprite_height / 2);
    tex = surface_get_texture(surf);
    tw = 1 / surface_get_width(surf);
    th = 1 / surface_get_height(surf);
    show_debug_message_concat("texel width ", string_format(tw, 1, 10));
};

time = 0;
spd = 1;
u_texel = shader_get_uniform(shd_waterreflect, "texel");
u_time = shader_get_uniform(shd_waterreflect, "timer");
u_freq = shader_get_uniform(shd_waterreflect, "frequency");
u_amp = shader_get_uniform(shd_waterreflect, "amp");
u_col = shader_get_uniform(shd_waterreflect, "watercol");
cl_col = 9669262;
cl_red = color_get_red(cl_col) / 255;
cl_green = color_get_green(cl_col) / 255;
cl_blue = color_get_blue(cl_col) / 255;
tmap = -4;

if (layer_exists(layer_get_id("REFLECTBASE")))
{
    tmap = scr_layer_tilemap_get_id_fixed(layer_get_id("REFLECTBASE"));
    show_debug_message_concat("reflect base found");
}
else
{
    show_debug_message_concat("reflect base NOT found");
}

draw_reflection = function()
{
    if (instance_exists(owner))
    {
        if (owner.object_index == obj_charafake && (owner.you || owner.roomin != room))
            exit;
        else if (owner.object_index == obj_caterpillarchara && !global.showcompanions)
            exit;
        
        if (owner.visible)
        {
            scr_spritematch(owner);
            var _scale = 1;
            x = owner.x;
            y = (owner.y - (owner.sprite_yoffset * 2)) + (owner.sprite_height * 2);
            
            if (variable_instance_exists(owner, "scale"))
            {
                _scale = owner.scale;
                y = owner.y;
            }
            
            depth = mindepth + owner.depth;
            image_yscale = -owner.image_yscale;
            image_xscale = owner.image_xscale;
            image_alpha = 1;
            
            if (bbox_top > 240)
                draw_sprite_ext(sprite_index, image_index, x, y - offset, image_xscale * _scale, image_yscale * _scale, image_angle, image_blend, image_alpha);
        }
    }
    else
    {
        instance_destroy();
    }
};

make_reflection = function(arg0)
{
    if (arg0.object_index == obj_charafake && (arg0.you || arg0.roomin != room))
        exit;
    else if (arg0.object_index == obj_caterpillarchara && !global.showcompanions)
        exit;
    
    var _reflectionmarker = instance_create_layer(x, y, layer_get_id("REFLECTSURF"), obj_marker_fancy);
    
    with (_reflectionmarker)
    {
        show_debug_message_concat("making reflection for obj");
        mindepth = depth;
        owner = arg0.id;
        wave = 0;
        offset = 0;
        draw_func = method(id, obj_watersurface.draw_reflection);
    }
    
    return _reflectionmarker;
};
