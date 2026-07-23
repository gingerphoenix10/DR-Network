var _xx = x;
var _yy = y;

if (shake > 0)
{
    x += irandom_range(-shake, shake);
    y += irandom_range(-shake, shake);
}

x = round(x - (sprite_offset_x * image_xscale));
y = round(y - (sprite_offset_y * image_yscale));

if (!targetmode && instance_number(obj_plat_follower) == 0 && !static_dash)
    scr_afterimage_color(3, 3, 0.09, 8388736);

var _outline_c = 255;
var _outline_alpha = outline_alpha;

if (blue_outline)
{
    _outline_c = merge_color(c_aqua, c_white, 0.8 + (sin(current_time / 100) * 0.2));
    _outline_alpha = 1;
}

if (parry > 0)
{
    _outline_c = 16776960;
    
    if ((parry div 2) == 0)
        _outline_c = 16777215;
}

if (instance_exists(obj_dw_flowerydash))
{
    outline_alpha = 0;
    parry = false;
    blue_outline = false;
}

if ((outline_alpha > 0 || parry || blue_outline) && player_visible && (!targetmode || blue_outline))
{
    var _alpha = outline_alpha;
    
    if (parry)
        _alpha = 1;
    
    if (blue_outline)
    {
        _alpha = 1;
        
        if (targetindex == -1)
            _outline_c = merge_color(c_aqua, c_black, 0.6 + (sin(current_time / 200) * 0.2));
    }
    
    scr_draw_outline(2, _outline_c, _alpha);
}

if (dashing || dashing_end)
{
}

if (petaldrain)
{
    _outline_c = 8388736;
    
    switch (petaldrain % 4)
    {
        default:
            _outline_c = 8388736;
            break;
        
        case 1:
            _outline_c = 16711935;
            break;
        
        case 2:
            _outline_c = 255;
            break;
        
        case 3:
            _outline_c = 16777215;
            break;
        
        case 4:
            _outline_c = 255;
            break;
        
        case 5:
            _outline_c = 16711935;
            break;
    }
    
    scr_draw_outline(2, _outline_c, 1);
}

if (parry > 0)
{
    image_blend = c_aqua;
    parry--;
}
else
{
    image_blend = c_white;
}

if (player_visible)
{
    draw_self();
    draw_set_color(#B4DDFA);
    draw_set_font(fnt_small);
    
    if (instance_exists(obj_server))
        draw_set_color(c_orange);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    var scale = 2;
    
    if (global.showyournickname && mysterycheck() == 1)
        draw_text_transformed(x, y - 42, global.playernickname, scale, scale, 0);
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}

surf_scroll += 0.5;
var _static = false;

if (hurt)
    _static = true;

var _alph_change = 0.5;

if (_static)
{
    lightning_alpha += _alph_change;
    surf_scroll += 0.5;
}
else
{
    lightning_alpha -= _alph_change;
}

lightning_alpha = clamp(lightning_alpha, 0, outline_alpha);

if (surf_scroll >= 64)
    surf_scroll -= 64;

surf_frame += surf_framespeed;

if (surf_frame > 3)
    surf_frame = 0;

if ((_outline_alpha > 0 || _static) && player_visible && !targetmode)
{
    var _sgn = sign(image_xscale);
    var _xoff = sprite_get_xoffset(sprite_index);
    var _yoff = sprite_get_yoffset(sprite_index);
    
    if (!surface_exists(surf))
        surf = surface_create(104, 100);
    
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    var render_anchor_x = 52;
    var render_anchor_y = 52;
    draw_sprite_ext(sprite_index, image_index, render_anchor_x, render_anchor_y, _sgn, 1, image_angle, image_blend, image_alpha);
    gpu_set_colorwriteenable(1, 1, 1, 0);
    
    if (outline_alpha > 0)
        draw_sprite_tiled_ext(spr_plat_heartmode_texture, 0, render_anchor_x - surf_scroll, render_anchor_y - surf_scroll, 1, 1, c_white, outline_alpha);
    
    if (lightning_alpha > 0)
        draw_sprite_tiled_ext(spr_plat_heartmode_texture_red, surf_frame, render_anchor_x - surf_scroll, render_anchor_y - surf_scroll, 1, 1, c_white, lightning_alpha);
    
    gpu_set_colorwriteenable(1, 1, 1, 1);
    surface_reset_target();
    draw_surface_ext(surf, round(x - (render_anchor_x * 2)), round(y - (render_anchor_y * 2)), 2, image_yscale, image_angle, image_blend, image_alpha);
}

var _meter_radius = 50;
var _meter_thickness = 3;

if (jumphovering)
{
    draw_circular_bar(x, y, jumphover_meter, jumphover_max, 255, _meter_radius, 1, _meter_thickness);
}
else
{
    var _max = jumphover_chargevfx_max;
    var _color = make_color_rgb(255 * (jumphover_chargevfx / _max), 255 * ((_max - jumphover_chargevfx) / _max), 0);
    
    if (jumphover_chargevfx > 0)
    {
        draw_circular_bar(x, y, _max - jumphover_chargevfx, _max, _color, _meter_radius, 1, _meter_thickness);
    }
    else if (jumphover_chargevfx_white > 0)
    {
        _color = 16777215;
        draw_circular_bar(x, y, _max, _max, _color, _meter_radius, jumphover_chargevfx_white / jumphover_chargevfx_whitemax, _meter_thickness);
        jumphover_chargevfx_white--;
    }
}

var _show_heart = false;
var _bullet = instance_nearest(x, y, obj_plat_bullet);

if (_bullet != -4)
{
    if (point_distance(x, y, _bullet.x, _bullet.y) < 240)
        _show_heart = true;
}

if (jumphovering)
    _show_heart = true;

if (_show_heart)
    heart_mode = 1;
else
    heart_mode = 0;

if (!targetmode)
{
    var _x_origin, _y_origin;
    
    with (heart)
    {
        _x_origin = owner.x - 10;
        _y_origin = (owner.y - 10) + 6;
        
        if (fixate)
        {
            x = _x_origin + other.heart_xoffset;
            y = _y_origin + other.heart_yoffset;
        }
    }
    
    draw_set_color(c_red);
    d_line_width(_x_origin + 10, _y_origin + 10, heart.x + 10, heart.y + 10, 2);
    draw_set_color(c_white);
}

x = _xx;
y = _yy;

if (show_toggles)
{
    scr_get_vxy(0);
    draw_set_color(c_white);
    draw_set_font(fnt_main);
    draw_set_halign(fa_left);
    draw_set_alpha(0.75);
    draw_set_font(fnt_mainbig);
    draw_set_halign(fa_right);
    draw_text((vx + vw) - 16, vy + 16, "hurt count: " + string(hurt_counter));
    draw_set_alpha(1);
}

draw_set_halign(fa_left);
