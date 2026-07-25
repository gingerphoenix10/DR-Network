function scr_get_border(arg0)
{
    var _border_image = _border_image_temp;
    var castle_town_rooms = [room_legend, 1550, PLACE_MENU, PLACE_LOGO, room_dw_castle_area_1, room_castle_tutorial, room_dw_castle_east_door, room_dw_castle_west_cliff, room_dw_ralsei_castle_front, room_dw_castle_restaurant, room_dw_castle_cafe, room_dw_castle_dojo, room_dw_ralsei_castle_1f, room_dw_ralsei_castle_2f, room_dw_ralsei_castle_3f, room_dw_castle_dungeon, room_dw_castle_rooms_kris, room_dw_castle_rooms_susie, room_dw_castle_rooms_ralsei, room_dw_castle_tv_rhythm, room_dw_castle_tv, room_dw_castle_town, room_dw_rhythm, room_dw_rhythm_countdown, room_dw_rhythm_empty, room_dw_ralsei_castle_basketball];
    
    for (var i = 0; i < array_length(castle_town_rooms); i++)
    {
        if (arg0 != castle_town_rooms[i])
            continue;
        
        _border_image = border_dw_castletown;
        break;
    }
    
    var lw_rooms = [18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 107, 104, 44, 45, 46, 47, 49];
    
    for (var i = 0; i < array_length(lw_rooms); i++)
    {
        if (arg0 != lw_rooms[i])
            continue;
        
        _border_image = border_lw_town;
        
        if (scr_flag_get(1324) == 0)
            _border_image = border_lw_town_morning;
        else if (scr_flag_get(1324) == 2)
            _border_image = border_lw_town_sunset;
        else if (scr_flag_get(1324) == 3)
            _border_image = border_lw_town_night;
        
        break;
    }
    
    var garden_rooms = [122, 123, 136, 137, 133, 141, 140, 142, 129, 134, 139, 150, 127, 121, 143, 125, 124, 128, 130, 132, 131, 145, 138, 135, 149, 147, 146, 151, 152, 153, 126];
    
    for (var i = 0; i < array_length(garden_rooms); i++)
    {
        if (arg0 != garden_rooms[i])
            continue;
        
        _border_image = border_dw_garden;
        break;
    }
    
    var garden_dark_rooms = [149, 150, 153, 138, 139, 136, 140, 141, 151, 142, 143, 134];
    
    for (var i = 0; i < array_length(garden_dark_rooms); i++)
    {
        if (arg0 != garden_dark_rooms[i])
            continue;
        
        _border_image = border_dw_garden_cliff;
        break;
    }
    
    if (arg0 == room_dw_garden_finalplatforming)
        _border_image = border_dw_garden_cliff;
    
    if (scr_border_is_cliff_border(arg0))
        _border_image = border_dw_garden_cliff;
    
    var castle_r = [178, 204, 201, 206, 203, 200, 207, 208, 199, 202, 212, 198, 197, 215, 239, 234, 235, 236, 237, 245];
    
    for (var i = 0; i < array_length(castle_r); i++)
    {
        if (arg0 != castle_r[i])
            continue;
        
        _border_image = border_dw_castle_right;
        break;
    }
    
    var castle_l = [177, 187, 182, 192, 186, 183, 181, 189, 185, 180, 184, 188, 214];
    
    for (var i = 0; i < array_length(castle_l); i++)
    {
        if (arg0 != castle_l[i])
            continue;
        
        _border_image = border_dw_castle_left;
        break;
    }
    
    var castle_top_inner = [229, 224, 226, 232, 219, 223, 225];
    
    for (var i = 0; i < array_length(castle_top_inner); i++)
    {
        if (arg0 != castle_top_inner[i])
            continue;
        
        _border_image = border_dw_castle_right_gold;
        break;
    }
    
    var castle_top = [222, 231, 191, 220, 221, 227, 241, 242, 228, 244];
    
    for (var i = 0; i < array_length(castle_top); i++)
    {
        if (arg0 != castle_top[i])
            continue;
        
        _border_image = border_dw_castle_top;
        break;
    }
    
    if (arg0 == room_dw_fcastle_cafe)
        _border_image = border_dw_castle_cafe;
    
    if (arg0 == room_dw_pink_encounter)
        _border_image = border_dw_pink;
        
    if (arg0 == room_truelab_elevator || arg0 == room_truelab_hall1)
        _border_image = border_line_1080; // I'll change this in the future to pure black, as well as removing the fade in
        
    var truelab = [room_truelab_hub, room_truelab_hall2, room_truelab_operatingroom, room_truelab_redlever, room_truelab_prebed, room_truelab_bedroom, room_truelab_mirror, room_truelab_bluelever, room_truelab_hall3, room_truelab_shower]
    
    for (var i = 0; i < array_length(truelab); i++)
    {
        if (arg0 != truelab[i])
            continue;
            
        _border_image = border_truelab;
        break;
    }
    
    return _border_image;
}

function overlay_layer(arg0, arg1, arg2, arg3, arg4) constructor
{
    _color = arg0;
    _alpha = arg1;
    _layer_index = arg4;
    _target_alpha = arg2;
    _time = arg3;
    _timer = 0;
    
    function get_color()
    {
        return _color;
    }
    
    function get_alpha()
    {
        return _alpha;
    }
    
    function get_layer_index()
    {
        return _layer_index;
    }
    
    function fade(arg0)
    {
        _timer++;
        
        if (_target_alpha > 0)
            _alpha = clamp(_timer / _time, 0, 1);
        else
            _alpha = 1 - clamp(_timer / _time, 0, 1);
    }
    
    function update_fade(arg0, arg1)
    {
        _target_alpha = arg0;
        _time = arg1;
        _timer = 0;
    }
}

function scr_border_is_cliff_border(arg0)
{
    var cliff_rooms = [144, 161, 156, 159, 160, 158, 164, 165, 166, 154, 162, 163, 157, 167, 168, 169, 170, 171, 172, 173, 174, 155, 248, 194, 205, 190, 195, 193];
    var is_cliff_room = false;
    
    for (var i = 0; i < array_length(cliff_rooms); i++)
    {
        if (arg0 != cliff_rooms[i])
            continue;
        
        is_cliff_room = true;
        break;
    }
    
    return is_cliff_room;
}
