var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_font(fnt_mainbig);
draw_set_halign(fa_center);
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_color(c_white);
draw_set_alpha(1);

if (inviter != -4)
{
    var playerobj = getplayer(inviter, 2, 0);
    
    if (instance_exists(playerobj))
    {
        draw_set_color(c_white);
        draw_set_valign(fa_top);
        draw_text(guiwd / 2, (guihg / 2) - (string_height(playerobj.nickname) * 2), "You've got a party invite from...");
        draw_set_color(c_lime);
        draw_set_valign(fa_middle);
        draw_text_transformed(guiwd / 2, guihg / 2, playerobj.nickname, 2, 2, 0);
        draw_set_color(c_white);
        draw_set_valign(fa_bottom);
        draw_text(guiwd / 2, (guihg / 2) + (string_height(playerobj.nickname) * 2), "Do you wanna accept it?");
        var offsety = 0;
        
        for (var i = 0; i < array_length(buttons); i++)
        {
            draw_set_color(c_white);
            
            if (selected == i)
                draw_set_color(c_yellow);
            
            draw_text(guiwd / 2, (guihg / 2) + 100 + offsety, buttons[i]);
            offsety += 40;
        }
    }
}
