this_frame_objects = ds_list_create();
depth = 999990;
cachelist = ds_list_create();

draw_reflection = function(arg0)
{
    if (arg0 == obj_caterpillarchara && !global.showcompanions)
        exit;
    
    ds_list_clear(cachelist);
    var yy = 0;
    
    if (arg0 == obj_wateringcan)
        yy = -80;
    
    var _num = instance_place_list(x, y + yy, arg0, cachelist, false);
    
    if (_num > 0)
    {
        for (var i = 0; i < _num; i++)
        {
            var added = false;
            reflectInstance = ds_list_find_value(cachelist, i);
            
            for (var j = 0; j < ds_list_size(this_frame_objects); j++)
            {
                if (arg0 == obj_charafake && (reflectInstance.you || reflectInstance.roomin != room))
                {
                    added = true;
                }
                else if (reflectInstance.depth > ds_list_find_value(this_frame_objects, j).depth)
                {
                    added = true;
                    ds_list_insert(this_frame_objects, j, reflectInstance);
                    break;
                }
            }
            
            if (!added)
                ds_list_add(this_frame_objects, reflectInstance);
        }
    }
};

generate_tiles = function()
{
    if (tilesurf == undefined || !surface_exists(tilesurf))
        tilesurf = surface_create(sprite_width, sprite_height + 80);
    else
        exit;
    
    draw_set_color(c_white);
    surface_set_target(tilesurf);
    draw_clear_alpha(c_white, 0);
    
    for (var i = 0; i < array_length(reflect_tiles); i++)
    {
        var _lay = layer_get_id(reflect_tiles[i]);
        
        if (layer_exists(_lay))
        {
            var map_id = scr_layer_tilemap_get_id_fixed(_lay);
            var xx = floor(x / 40);
            
            while (xx < floor((x + sprite_width) / 40))
            {
                var yy = floor(y / 40);
                
                while (yy < floor((y + sprite_height + 80) / 40))
                {
                    var _tiledata = tilemap_get(map_id, xx, yy);
                    
                    if (_tiledata >= 0)
                    {
                        var _tileset = tilemap_get_tileset(map_id);
                        var b = !tile_get_flip(_tiledata);
                        _tiledata = tile_set_flip(_tiledata, b);
                        draw_tile(_tileset, _tiledata, 0, (xx * 40) - x, (y + sprite_height) - (yy * 40) - 40);
                    }
                    
                    yy++;
                }
                
                xx++;
            }
        }
    }
    
    surface_reset_target();
};

surf = surface_create(sprite_width, sprite_height + 80);
tilesurf = -4;
