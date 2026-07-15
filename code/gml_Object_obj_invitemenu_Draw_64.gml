var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_font(5);
draw_set_halign(1);
draw_set_alpha(0.5);
draw_set_color(0);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_color(16777215);
draw_set_alpha(1);
if (inviter != -4)
{
    var playerobj = getplayer(inviter, 2, 0);
    if (instance_exists(playerobj))
    {
        draw_set_color(16777215);
        draw_set_valign(0);
        draw_text(guiwd / 2, (guihg / 2) - (string_height(playerobj.nickname) * 2), "You've got a party invite from...");
        draw_set_color(65280);
        draw_set_valign(1);
        draw_text_transformed(guiwd / 2, guihg / 2, playerobj.nickname, 2, 2, 0);
        draw_set_color(16777215);
        draw_set_valign(2);
        draw_text(guiwd / 2, (guihg / 2) + (string_height(playerobj.nickname) * 2), "Do you wanna accept it?");
        var offsety = 0;
        for (var i = 0; i < array_length(buttons); i++)
        {
            draw_set_color(16777215);
            if (selected == i)
            {
                draw_set_color(65535);
            }
            draw_text(guiwd / 2, (guihg / 2) + 100 + offsety, buttons[i]);
            offsety += 40;
        }
    }
}
