var _cntr = 0;
var _prpl_light = 11141290;
var _prpl_dark = 5570645;
var _prpl_darker = 3866683;
var _prpl_darkest = 3342387;
var _prpl_backdrop = 2228258;

if (!can_move)
{
    _prpl_light = merge_color(_prpl_light, c_black, 0.5);
    _prpl_dark = merge_color(_prpl_dark, c_black, 0.5);
    _prpl_darker = merge_color(_prpl_darker, c_black, 0.5);
    _prpl_darkest = merge_color(_prpl_darkest, c_black, 0.5);
}

switch (mode)
{
    case 1:
        var _lane_distance = 56;
        var _arrow_pokethrough = 9;
        var _arrows_height = 27 + _arrow_pokethrough;
        
        if (!surface_exists(surface_effect))
            surface_effect = surface_create(142, _arrows_height);
        
        surface_set_target(surface_effect);
        draw_clear_alpha(c_black, 0);
        var _yy = _arrows_height - bg_y;
        
        do
        {
            _xx = -1;
            
            do
            {
                draw_sprite_ext(spr_pinkarrows, 1, _xx, _yy, 1, 1, 0, _prpl_darker, 1);
                _xx += 32;
            }
            until (_xx >= 142);
            
            _yy += 24;
        }
        until (_yy >= _arrows_height);
        
        gpu_set_blendmode(bm_subtract);
        var _xx = -1;
        
        do
        {
            draw_sprite_ext(spr_pinkarrows, 0, _xx, 0, 1, 1, 0, _prpl_darker, 1);
            _xx += 32;
        }
        until (_xx >= 142);
        
        gpu_set_blendmode(bm_normal);
        surface_reset_target();
        
        if (!surface_exists(surface_box))
            surface_box = surface_create(142, 142);
        
        surface_set_target(surface_box);
        draw_clear_alpha(c_black, 0);
        _xx = 70;
        _yy = 70;
        draw_surface_ext(surface_effect, _xx - 70, _yy - _arrows_height, 1, 1, 0, c_white, 1);
        draw_surface_ext(surface_effect, (_xx - 70) + 142, (_yy - _arrows_height) + (_arrow_pokethrough * 2), 1, 1, 180, c_white, 1);
        draw_surface_ext(surface_effect, (_xx - 70) + 142, _yy + _arrows_height + 2, 1, 1, 180, c_white, 1);
        draw_surface_ext(surface_effect, _xx - 70, ((_yy + _arrows_height) - (_arrow_pokethrough * 2)) + 2, 1, 1, 0, c_white, 1);
        var _ly = -_lane_distance;
        draw_set_color(_prpl_light);
        
        repeat (3)
        {
            d_rectangle((_xx - 70) + _cntr, _yy + _ly + _cntr, _xx + 71 + _cntr, _yy + _ly + _cntr + 1, false);
            _ly += _lane_distance;
        }
        
        surface_reset_target();
        
        with (obj_growtangle)
            draw_surface_ext(other.surface_box, x + lengthdir_x(49.497475 * image_xscale, 135 + image_angle), y + lengthdir_y(49.497475 * image_yscale, 135 + image_angle), image_xscale / 2, image_yscale / 2, image_angle, c_white, 1);
        
        with (obj_pinktrail)
            draw_self();
        
        with (obj_pinkdust)
            event_perform(ev_draw, ev_draw_normal);
        
        break;
    
    case 2:
        if (!surface_exists(surface_box))
            surface_box = surface_create(142, 142);
        
        surface_set_target(surface_box);
        draw_clear(c_black);
        var _xx = 70;
        var _yy = 70;
        var _lane_distance = 40;
        var _lx = -_lane_distance * 1.5;
        var _ly = -_lane_distance * 1.5;
        gpu_set_blendmode(bm_subtract);
        gpu_set_colorwriteenable(0, 0, 0, 1);
        
        repeat (4)
        {
            d_rectangle(_xx + _lx + _cntr, (_yy - (_lane_distance * 1.5)) + _cntr, _xx + _lx + _cntr + 1, _yy + (_lane_distance * 1.5) + _cntr, false);
            _lx += _lane_distance;
        }
        
        repeat (4)
        {
            d_rectangle((_xx - (_lane_distance * 1.5)) + _cntr, _yy + _ly + _cntr, _xx + (_lane_distance * 1.5) + _cntr, _yy + _ly + _cntr + 1, false);
            _ly += _lane_distance;
        }
        
        gpu_set_colorwriteenable(1, 1, 1, 1);
        gpu_set_blendmode_ext(bm_inv_dest_alpha, bm_dest_alpha);
        draw_set_color(_prpl_darker);
        d_rectangle(_xx - 128, _yy - 128, _xx + 128, _yy + 128, false);
        gpu_set_blendmode(bm_normal);
        _ly = -_lane_distance * 1.5;
        draw_set_color(_prpl_light);
        
        repeat (4)
        {
            _lx = -_lane_distance * 1.5;
            
            repeat (4)
            {
                d_circle(_xx + _lx, _yy + _ly, 4, false);
                _lx += _lane_distance;
            }
            
            _ly += _lane_distance;
        }
        
        surface_reset_target();
        
        with (obj_growtangle)
            draw_surface_ext(other.surface_box, x + lengthdir_x(49.497475 * image_xscale, 135 + image_angle), y + lengthdir_y(49.497475 * image_yscale, 135 + image_angle), image_xscale / 2, image_yscale / 2, image_angle, c_white, 1);
        
        with (obj_pinktrail)
            draw_self();
        
        with (obj_pinkdust)
            event_perform(ev_draw, ev_draw_normal);
        
        break;
    
    case 3:
        var _scale = 1;
        
        with (obj_growtangle)
        {
            draw_sprite_ext(sprite_index, 1, x + other.x_shake, y, image_xscale, image_yscale, other.image_angle, image_blend, image_alpha);
            draw_sprite_ext(sprite_index, -1, x + other.x_shake, y, image_xscale, image_yscale, other.image_angle, image_blend, image_alpha);
            _scale = image_xscale / 2;
        }
        
        var _dir = image_angle;
        var _lane_distance = 56 * _scale;
        draw_set_color(_prpl_darker);
        var _xx = -0.5 * _scale;
        
        repeat (3)
        {
            d_line(x + _cntr + lengthdir_x(_lane_distance, _dir) + lengthdir_x(_xx, _dir + 90) + x_shake, y + _cntr + lengthdir_y(_lane_distance, _dir) + lengthdir_y(_xx, _dir + 90), x + _cntr + lengthdir_x(_lane_distance, _dir + 180) + lengthdir_x(_xx, _dir + 90) + x_shake, y + _cntr + lengthdir_y(_lane_distance, _dir + 180) + lengthdir_y(_xx, _dir + 90));
            _xx += (0.5 * _scale);
        }
        
        _dir += 90;
        _xx = -0.5 * _scale;
        
        repeat (3)
        {
            d_line(x + _cntr + lengthdir_x(_lane_distance, _dir) + lengthdir_x(_xx, _dir + 90) + x_shake, y + _cntr + lengthdir_y(_lane_distance, _dir) + lengthdir_y(_xx, _dir + 90), x + _cntr + lengthdir_x(_lane_distance, _dir + 180) + lengthdir_x(_xx, _dir + 90) + x_shake, y + _cntr + lengthdir_y(_lane_distance, _dir + 180) + lengthdir_y(_xx, _dir + 90));
            _xx += (0.5 * _scale);
        }
        
        draw_set_color(_prpl_light);
        
        repeat (4)
        {
            d_circle(x + lengthdir_x(_lane_distance, _dir) + x_shake, y + lengthdir_y(_lane_distance, _dir), 4 * _scale, false);
            _dir += 90;
        }
        
        d_circle(x + x_shake, y, 4 * _scale, false);
        
        if (arrow_alpha > 0)
        {
            draw_sprite_ext(spr_pinkspinarrow, 1, x + 57, y + 18 + abs(lengthdir_y(10, arrow_dir)), 1, 1, 270, c_white, arrow_alpha);
            draw_sprite_ext(spr_pinkspinarrow, 1, x + 57, y - 16 - abs(lengthdir_y(10, arrow_dir)), -1, 1, 270, c_white, arrow_alpha / 3);
        }
        
        with (obj_pinktrail)
            draw_self();
        
        with (obj_pinkdust)
            event_perform(ev_draw, ev_draw_normal);
        
        break;
    
    case 7:
        var _growtanglescale = 1;
        
        with (obj_growtangle)
            _growtanglescale = image_xscale;
        
        if (!surface_exists(surface_effect))
            surface_effect = surface_create(300, 300);
        
        var _heart_move_limit = 35 * _growtanglescale;
        var _layer_movelimit = 0;
        var _layer_last = 0;
        
        repeat (6)
        {
            if ((tunnel_radius[_layer_movelimit + 1] < _heart_move_limit && tunnel_radius[_layer_movelimit + 1] > 0) || tunnel_lane_layer > _layer_movelimit)
                _layer_movelimit++;
            else
                break;
        }
        
        repeat (6)
        {
            if (tunnel_radius[_layer_last + 1] > 0)
                _layer_last++;
            else
                break;
        }
        
        var _cx = 150;
        var _cy = 150;
        surface_set_target(surface_effect);
        draw_clear_alpha(c_black, 0);
        draw_set_color(_prpl_backdrop);
        var i = 0;
        
        repeat (array_length(array_stars_x))
        {
            _dir = point_direction(0, 0, array_stars_x[i], array_stars_y[i]);
            var _dist = point_distance(0, 0, array_stars_x[i], array_stars_y[i]);
            var _scale = 1 + ((tunnel_speed_base - 1.5) * 0.3) + (_dist / 200);
            d_triangle(_cx + lengthdir_x(_dist, _dir) + lengthdir_x(1 * _scale, _dir + 90), _cy + lengthdir_y(_dist, _dir) + lengthdir_y(1 * _scale, _dir + 90), _cx + lengthdir_x(_dist, _dir) + lengthdir_x(1 * _scale, _dir - 90), _cy + lengthdir_y(_dist, _dir) + lengthdir_y(1 * _scale, _dir - 90), _cx + lengthdir_x(_dist - (_dist * _scale * 0.16666666666666666), _dir), _cy + lengthdir_y(_dist - (_dist * _scale * 0.16666666666666666), _dir), 0);
            i++;
        }
        
        draw_set_color(_prpl_darker);
        i = 0;
        
        repeat (6)
        {
            if (tunnel_radius[i] > 0)
                break;
            
            i++;
        }
        
        do
        {
            _dir = tunnel_lane_direction - 270;
            
            repeat (4)
            {
                d_line_width(_cx + lengthdir_x(tunnel_radius[i], _dir), _cy + lengthdir_y(tunnel_radius[i], _dir), _cx + lengthdir_x(tunnel_radius[i + 1], _dir), _cy + lengthdir_y(tunnel_radius[i + 1], _dir), (1 + i) * 1.125);
                _dir += 90;
            }
            
            i++;
        }
        until (i > _layer_movelimit || tunnel_radius[i + 1] <= 0 || i >= 7);
        
        draw_set_color(_prpl_backdrop);
        var _dir = tunnel_lane_direction - 270;
        
        repeat (4)
        {
            d_line_width(_cx + lengthdir_x(tunnel_radius[i], _dir), _cy + lengthdir_y(tunnel_radius[i], _dir), _cx + lengthdir_x(300, _dir), _cy + lengthdir_y(300, _dir), (1 + i) * 1.125);
            _dir += 90;
        }
        
        i = 0;
        
        repeat (8)
        {
            if (i == tunnel_lane_layer)
                draw_set_color(_prpl_dark);
            else
                draw_set_color(_prpl_dark);
            
            if (tunnel_radius[i] > 0)
            {
                var _thick = 0;
                var _thickscore = tunnel_radius[i];
                
                if (i == tunnel_lane_layer)
                    _thickscore += 160;
                
                do
                {
                    d_circle(_cx, _cy, tunnel_radius[i] + _thick, 1);
                    
                    if (_thick >= 0)
                        _thick = -_thick - 0.5;
                    else
                        _thick = -_thick;
                    
                    _thickscore -= 20;
                }
                until (_thickscore <= 0);
                
                if (i == tunnel_lane_layer)
                {
                    draw_set_color(#EE5577);
                    _thick = 0;
                    _thickscore = tunnel_radius[i] * 0.75;
                    
                    do
                    {
                        d_circle(_cx, _cy, tunnel_radius[i] + _thick, 1);
                        
                        if (_thick >= 0)
                            _thick = -_thick - 0.5;
                        else
                            _thick = -_thick;
                        
                        _thickscore -= 20;
                    }
                    until (_thickscore <= 0);
                    
                    draw_set_color(_prpl_dark);
                }
                
                if (i != 0)
                    draw_set_color(_prpl_light);
                
                _dir = tunnel_lane_direction - 270;
                
                repeat (4)
                {
                    d_circle(_cx + lengthdir_x(tunnel_radius[i], _dir), _cy + lengthdir_y(tunnel_radius[i], _dir), 2 + ((tunnel_radius[i] - 12) / 24), false);
                    _dir += 90;
                }
            }
            
            i++;
        }
        
        surface_reset_target();
        var _pixels = _growtanglescale * 71;
        
        if (i_ex(obj_growtangle))
            draw_surface_part(surface_effect, max(0, 150 - (_pixels / 2)) + 2, max(0, 150 - (_pixels / 2)) + 2, _pixels, _pixels, (scr_get_box(4) - 148) + max(0, 150 - (_pixels / 2)), (scr_get_box(5) - 148) + max(0, 150 - (_pixels / 2)));
        
        with (obj_pinktrail)
            draw_self();
        
        with (obj_pinkdust)
            event_perform(ev_draw, ev_draw_normal);
        
        break;
    
    case 8:
        var _cx = camerax();
        var _cy = cameray();
        
        if (!surface_exists(surface_effect))
            surface_effect = surface_create(640, 480);
        
        surface_set_target(surface_effect);
        draw_clear_alpha(c_black, 0);
        draw_set_color(_prpl_dark);
        var _alpha_master = 1;
        
        with (obj_pinknode)
        {
            var i = 0;
            
            repeat (4)
            {
                if (draw_connection[i])
                {
                    if (instance_exists(child[i]))
                    {
                        d_line(x - _cx, y - _cy, child[i].x - _cx, child[i].y - _cy);
                        d_line((x + 0.5) - _cx, (y + 0.5) - _cy, (child[i].x + 0.5) - _cx, (child[i].y + 0.5) - _cy);
                        d_line((x + 1) - _cx, (y + 1) - _cy, (child[i].x + 1) - _cx, (child[i].y + 1) - _cy);
                        
                        if (pulse >= 0)
                        {
                            var _col = merge_color(c_red, _prpl_dark, 0.667);
                            var _dir = point_direction(x, y, child[i].x, child[i].y);
                            var _dist = point_distance(x, y, child[i].x, child[i].y);
                            draw_primitive_begin(pr_trianglestrip);
                            var _drawdist = clamp(pulse - pulse_length, 0, _dist);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 90), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 90), _col, 1);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 270), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 270), _col, 1);
                            _drawdist = clamp((pulse - pulse_length) + 48, 0, _dist);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 90), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 90), _col, 1);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 270), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 270), _col, 1);
                            draw_primitive_end();
                            _col = 255;
                            draw_primitive_begin(pr_trianglestrip);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 90), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 90), _col, 1);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 270), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 270), _col, 1);
                            _drawdist = clamp(pulse - 24, 0, _dist);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 90), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 90), _col, 1);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 270), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 270), _col, 1);
                            draw_primitive_end();
                            _col = merge_color(c_red, _prpl_dark, 0.667);
                            draw_primitive_begin(pr_trianglestrip);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 90), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 90), _col, 1);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 270), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 270), _col, 1);
                            _drawdist = clamp(pulse, 0, _dist);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 90), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 90), _col, 1);
                            draw_vertex_color(x + 1.5 + lengthdir_x(_drawdist, _dir) + lengthdir_x(1, _dir + 270), y + 1.5 + lengthdir_y(_drawdist, _dir) + lengthdir_y(1, _dir + 270), _col, 1);
                            draw_primitive_end();
                        }
                    }
                }
                
                i++;
            }
        }
        
        var lightpink = make_color_rgb(247, 91, 200);
        var _glow_color;
        
        if ((life_time % 60) <= 30)
            _glow_color = merge_color(lightpink, c_white, (0.75 * (life_time % 60)) / 30);
        else
            _glow_color = merge_color(lightpink, c_white, 0.75 - ((0.75 * ((life_time - 30) % 60)) / 30));
        
        with (obj_pinknode)
        {
            if (checkpoint < 1)
            {
                draw_set_color(_prpl_light);
                d_circle(floor((0.5 + x) - _cx), floor((0.5 + y) - _cy), 4, false);
            }
            else if (checkpoint == 2)
            {
                draw_set_color(merge_color(_prpl_light, _glow_color, 0.5));
                draw_set_alpha(0.667);
                d_circle(floor((0.5 + x) - _cx), floor((0.5 + y) - _cy), (5.2 - lengthdir_x(0.5, (other.life_time / 60) * 360)) + 2, false);
                draw_set_alpha(1);
                d_circle(floor((0.5 + x) - _cx), floor((0.5 + y) - _cy), 5.2 - lengthdir_x(0.5, (other.life_time / 60) * 360), false);
            }
            else
            {
                draw_set_color(_glow_color);
                draw_set_alpha(0.667);
                d_circle(floor((0.5 + x) - _cx), floor((0.5 + y) - _cy), (7.3 - lengthdir_x(1, (other.life_time / 60) * 360)) + 2, false);
                draw_set_alpha(1);
                d_circle(floor((0.5 + x) - _cx), floor((0.5 + y) - _cy), 7.3 - lengthdir_x(1, (other.life_time / 60) * 360), false);
            }
        }
        
        with (obj_dokiheart)
        {
            if (visible == 0)
            {
                x -= _cx;
                y -= _cy;
                event_perform(ev_draw, ev_draw_normal);
                x += _cx;
                y += _cy;
            }
        }
        
        with (obj_bulletparent)
        {
            if (sprite_index == spr_finisher_explosion)
            {
                x -= _cx;
                y -= _cy;
                draw_self();
                x += _cx;
                y += _cy;
            }
        }
        
        with (obj_pinknodeact)
        {
            if (life_time > 0)
            {
                x -= _cx;
                y -= _cy;
                event_perform(ev_draw, ev_draw_normal);
                x += _cx;
                y += _cy;
                
                if (fading_away >= 0)
                    _alpha_master = image_alpha;
            }
        }
        
        surface_reset_target();
        
        if (life_time < 30)
            _alpha_master = clamp(life_time / 20, 0, 1);
        
        var _alpha = 0.25 * _alpha_master;
        var _bleed = 4;
        draw_surface_ext(surface_effect, camerax(), cameray() - _bleed, 1, 1, 0, c_black, _alpha);
        draw_surface_ext(surface_effect, camerax(), cameray() + _bleed, 1, 1, 0, c_black, _alpha);
        draw_surface_ext(surface_effect, camerax() - _bleed, cameray(), 1, 1, 0, c_black, _alpha);
        draw_surface_ext(surface_effect, camerax() + _bleed, cameray(), 1, 1, 0, c_black, _alpha);
        _alpha = 0.5 * _alpha_master;
        _bleed = 2;
        draw_surface_ext(surface_effect, camerax() - _bleed, cameray() - _bleed, 1, 1, 0, c_black, _alpha);
        draw_surface_ext(surface_effect, camerax() - _bleed, cameray() + _bleed, 1, 1, 0, c_black, _alpha);
        draw_surface_ext(surface_effect, camerax() + _bleed, cameray() - _bleed, 1, 1, 0, c_black, _alpha);
        draw_surface_ext(surface_effect, camerax() + _bleed, cameray() + _bleed, 1, 1, 0, c_black, _alpha);
        
        if (_alpha_master < 1)
            draw_surface_ext(surface_effect, camerax(), cameray(), 1, 1, 0, c_white, _alpha_master);
        else
            draw_surface(surface_effect, camerax(), cameray());
        
        with (obj_pinktrail)
            draw_self();
        
        with (obj_pinkdust)
            event_perform(ev_draw, ev_draw_normal);
        
        break;
}

if (i_ex(obj_date_controller))
    image_alpha = 1;

with (obj_heart)
{
    draw_battle_players();
    draw_sprite_ext(sprite_index, -1, x + other.x_shake + other.heartshake_x + other.heartbump_x, y + other.heartshake_y + other.heartbump_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
