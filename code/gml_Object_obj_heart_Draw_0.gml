draw_battle_players();

if (color == 1)
{
    z_charge_nolimit = z_hold - 35;
    
    if (z_charge_nolimit >= 0)
    {
        scale = abs(sin(z_charge_nolimit / 10));
        draw_sprite_ext(sprite_index, 0, x - (scale * 10), y - (scale * 10), 1 + scale, 1 + scale, image_angle, image_blend, 0.3);
        scale = abs(sin(z_charge_nolimit / 14));
        draw_sprite_ext(sprite_index, 0, x - 2 - (scale * 10), y - 2 - (scale * 10), 1.2 + scale, 1.2 + scale, image_angle, image_blend, 0.3);
    }
    
    if (z_hold >= 15)
    {
        z_charge = z_hold - 15;
        
        if (z_charge >= 35)
            z_charge = 35;
        
        for (i = 0; i < 4; i += 1)
        {
            rotx = (i * 90) + (z_charge * 5);
            xx = sin(degtorad(rotx)) * (35 - z_charge);
            yy = cos(degtorad(rotx)) * (35 - z_charge);
            draw_sprite_ext(spr_yheart_charge, 0, (x + 9) - xx, (y + 10) - yy, 4 - ((z_charge * 2) / 35), 4 - ((z_charge * 2) / 35), 0, c_white, z_charge / 5);
        }
    }
}

if (color == 2)
{
    if (dash_act == 1 && dash_t > 45)
    {
        var tx = x;
        var ty = y;
        
        for (i = 0; i < 30; i++)
        {
            draw_sprite_ext(spr_orangeheart_tail, 0, tx + x_offset, ty, image_xscale, image_yscale, 0, c_orange, 0.025);
            tx = x + lengthdir_x(i + 10, point_direction(x, y, xprevious, yprevious));
            ty = y + lengthdir_y(i + 10, point_direction(x, y, xprevious, yprevious));
        }
    }
    
    var _box = -4;
    
    with (collision_point(x + 5, y + 5, obj_flowerybox_parent, false, true))
        _box = id;
    
    if (dash_charge >= 6)
    {
        draw_set_alpha(0.5);
        var al = 2;
        draw_set_colour(merge_colour(c_orange, c_yellow, clamp(0.5 + sin(i + (current_time / 55)), 0, 1)));
        
        for (i = 0; i < (ceil((dash_charge / dash_max) * 120) / 10); i++)
        {
            draw_sprite_ext(spr_aimarrow, 0, x + (i * 16) + aim_x + 16 + x_offset, y + 10, 1, 1, 0, draw_get_colour(), 1);
            al -= 0.1;
        }
        
        draw_set_alpha(1);
    }
    
    var _w = (sprite_width / 2) * (1 - xs);
    var _h = (sprite_height / 2) * (1 - ys);
    
    if (dash_h > 0)
    {
        outline_fade = scr_approach(outline_fade, 1, 0.1);
        
        for (i = 0; i < 6; i++)
        {
            if (i > 3)
                col = merge_colour(c_red, c_orange, (i - 3) / 3);
            else
                col = merge_colour(c_black, c_red, i / 3);
            
            tailx[i] -= 2 * (6 - i);
            taila[i] -= 0.5;
            draw_sprite_ext(spr_orangeheart_tail, 1, x + _w + tailx[i] + x_offset, y + _h, image_xscale * xs, image_yscale * ys, 0, col, taila[i]);
        }
        
        c_dash = scr_approach(c_dash, 6, 1);
    }
    else
    {
        outline_fade = scr_approach(outline_fade, 0, 0.1);
        c_dash = 0;
    }
    
    xs += ((xs2 - xs) * 0.5);
    ys += ((ys2 - ys) * 0.5);
    xs2 += ((1 - xs2) * 0.5);
    ys2 += ((1 - ys2) * 0.5);
    draw_sprite_ext(sprite_index, image_index, x + _w + x_offset, y + _h, image_xscale * xs, image_yscale * ys, image_angle, image_blend, image_alpha);
    
    if (dash_charge > 0 && button1_h())
        draw_sprite_ext(spr_orangeheart2, 3, x + _w + x_offset, y + _h, image_xscale * xs, image_yscale * ys, 0, merge_colour(c_red, c_yellow, clamp(0.5 + (sin(current_time / 50) * 0.5), 0, 1)), 1);
    else if (dash_h == 0 && dash_delay <= 0)
        draw_sprite_ext(spr_orangeheart2, 3, x + _w + x_offset, y + _h, image_xscale * xs, image_yscale * ys, 0, c_red, 1);
}
else
{
    draw_self();
}

if (scr_debug())
{
}
