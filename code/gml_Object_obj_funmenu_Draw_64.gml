var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_valign(0);
draw_set_halign(0);
draw_set_alpha(funalpha - 0.5);
draw_set_color(0);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_alpha(funalpha);
draw_set_color(16777215);
draw_set_font(5);
if (selected != -1)
{
    draw_set_valign(2);
    draw_set_halign(1);
    draw_text(guiwd / 2, guihg - 10, string_hash_to_newline(modes[selected][1]));
}
for (var i = -1; i < array_length(modes); i++)
{
    if (i == -1)
    {
        draw_set_valign(2);
        draw_set_halign(0);
        draw_set_color(16777215);
        if (selected == -1)
        {
            draw_set_color(65535);
        }
        draw_text(10, guihg - 10, "Back");
    }
    var color = 0;
    if (i != -1)
    {
        color = make_colour_rgb(colors[i], colors[i], colors[i]);
    }
    else
    {
        color = make_colour_rgb(colors[0], colors[0], colors[0]);
    }
    draw_set_color(color);
    draw_set_valign(1);
    draw_set_halign(1);
    if (i == 0)
    {
        draw_sprite_ext(8523, minigameframe, 160, (guihg / 2) - 40, 1, 1, 0, color, funalpha);
        draw_text(160, guihg - 120, modes[i][0]);
    }
    if (i == 1)
    {
        draw_sprite_ext(8523, 0, guiwd - 160, (guihg / 2) - 40, 1, 1, 0, color, funalpha);
        draw_text(guiwd - 160, guihg - 120, modes[i][0]);
    }
}
draw_set_valign(0);
draw_set_halign(0);
draw_set_color(16777215);
draw_set_alpha(1);
