var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(funalpha - 0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_alpha(funalpha);
draw_set_color(c_white);
draw_set_font(fnt_mainbig);

if (selected != -1)
{
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_center);
    draw_text(guiwd / 2, guihg - 10, string_hash_to_newline(modes[selected][1]));
}

for (var i = -1; i < array_length(modes); i++)
{
    if (i == -1)
    {
        draw_set_valign(fa_bottom);
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        
        if (selected == -1)
            draw_set_color(c_yellow);
        
        draw_text(10, guihg - 10, "Back");
    }
    
    var color = c_black;
    
    if (i != -1)
        color = make_colour_rgb(colors[i], colors[i], colors[i]);
    else
        color = make_colour_rgb(colors[0], colors[0], colors[0]);
    
    draw_set_color(color);
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    
    if (i == 0)
    {
        draw_sprite_ext(spr_wip, minigameframe, 160, (guihg / 2) - 40, 1, 1, 0, color, funalpha);
        draw_text(160, guihg - 120, modes[i][0]);
    }
    
    if (i == 1)
    {
        draw_sprite_ext(spr_wip, 0, guiwd - 160, (guihg / 2) - 40, 1, 1, 0, color, funalpha);
        draw_text(guiwd - 160, guihg - 120, modes[i][0]);
    }
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);
