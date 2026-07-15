draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(configalpha - 0.5);
draw_set_color(c_black);
draw_rectangle(camx, camy, camx + camera_get_view_width(view_camera[0]), camy + camera_get_view_height(view_camera[0]), 0);
draw_set_alpha(configalpha);
draw_set_color(c_white);
var scale = 2;
draw_set_font(fnt_mainbig);

if (!global.darkzone)
{
    scale = 1;
    draw_set_font(fnt_main);
}

offsety = 0;
draw_set_valign(fa_bottom);
var i = 0;

if (settinglayer < 0)
{
    draw_sprite_ext(spr_heartsmall, 0, camx + (12 / divide), (camy + camera_get_view_height(view_camera[0])) - (hearty / divide) - (44 / divide), scale, scale, 0, c_white, configalpha);
    
    for (i = 0; i < array_length(topics); i++)
    {
        draw_set_color(c_white);
        
        if (selected == (array_length(topics) - 1 - i) && !lockbuttons)
            draw_set_color(c_yellow);
        
        if ((array_length(topics) - 1 - i) == 1 && (instance_exists(obj_server) || instance_exists(obj_client)))
            draw_set_color(c_gray);
        
        draw_text(camx + (40 / divide), (camy + camera_get_view_height(view_camera[0])) - (20 / divide) - offsety, topics[array_length(topics) - 1 - i]);
        offsety += (40 / divide);
    }
}
else if (settinglayer != array_length(settings))
{
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    
    for (i = 0; i < array_length(settings[settinglayer]); i++)
    {
        draw_set_color(c_white);
        
        if (selected == i)
        {
            draw_set_color(c_yellow);
            
            if (changemode)
                draw_set_color(c_red);
        }
        
        switch (settinglayer)
        {
            default:
                heartx = lerp(heartx, string_width(settings[settinglayer][selected]) / 2, 0.5);
                draw_text(camx + (camera_get_view_width(view_camera[0]) / 2), camy + offsety + (70 / divide), settings[settinglayer][i]);
                offsety += (40 / divide);
                break;
            
            case 0:
            case 1:
                heartx = lerp(heartx, string_width(settings[settinglayer][selected][0] + string(settings[settinglayer][selected][1])) / 2, 0.5);
                draw_text(camx + (camera_get_view_width(view_camera[0]) / 2), camy + offsety + (70 / divide), settings[settinglayer][i][0] + string(settings[settinglayer][i][1]));
                offsety += (40 / divide);
                break;
            
            case 2:
            case 3:
            case 4:
                var condition = "OFF";
                
                if (i != (array_length(settings[settinglayer]) - 1))
                {
                    if (is_string(settings[settinglayer][i][1]) == 0)
                    {
                        if (settings[settinglayer][i][1])
                            condition = "ON";
                    }
                    else
                    {
                        condition = settings[settinglayer][i][1];
                    }
                }
                else
                {
                    condition = "";
                }
                
                if (i == selected)
                    heartx = lerp(heartx, string_width(settings[settinglayer][selected][0] + condition) / 2, 0.5);
                
                draw_text(camx + (camera_get_view_width(view_camera[0]) / 2), camy + offsety + (70 / divide), settings[settinglayer][i][0] + condition);
                offsety += (40 / divide);
                break;
        }
    }
    
    draw_sprite_ext(spr_heartsmall, 0, (camx + (camera_get_view_width(view_camera[0]) / 2)) - heartx - (25 / divide), camy + (hearty / divide) + (78 / divide), scale, scale, 0, c_white, configalpha);
}
else
{
    draw_sprite_ext(spr_heartsmall, 0, (camx + (camera_get_view_width(view_camera[0]) / 2)) - heartx - (25 / divide), camy + (hearty / divide) + (78 / divide), scale, scale, 0, c_white, configalpha);
}

draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(1);
