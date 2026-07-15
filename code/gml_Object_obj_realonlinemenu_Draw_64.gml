var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_alpha(configalpha);
draw_set_color(c_white);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_set_font(fnt_mainbig);
offsety = 0;

for (var i = 0; i < array_length(buttons); i++)
{
    var reali = array_length(buttons) - i - 1;
    presseffect[reali] = lerp(presseffect[reali], 0, 0.5);
    draw_set_color(c_white);
    
    if (selected == reali && !lockbuttons)
        draw_set_color(color);
    
    if (networkvarsget(1) != -4)
    {
        switch (reali)
        {
            case 0:
            case 1:
            case 3:
                if (!pushed || (pushed && selected != reali))
                    draw_set_color(c_gray);
                
                break;
        }
    }
    else if (reali == 2)
    {
        if (!pushed || (pushed && selected != reali))
            draw_set_color(c_gray);
    }
    
    draw_text(40 + presseffect[reali], (guihg - 20 - offsety) + presseffect[reali], buttons[reali]);
    offsety += 40;
}

draw_sprite_ext(spr_heartsmall, 0, 12, (guihg - hearty - 44) + heartoffy, 2, 2, heartangle, c_white, configalpha);
draw_set_valign(fa_top);
draw_set_alpha(1);
