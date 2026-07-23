var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_color(c_black);
draw_set_alpha(dresalpha - 0.4);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_alpha(dresalpha);
draw_set_font(fnt_mainbig);

for (var i = 0; i < array_length(characters); i++)
{
    var truecolor = make_colour_rgb(colors[i], colors[i], colors[i]);
    draw_set_color(truecolor);
    draw_sprite_ext(characters[i][2], 0, ((guiwd / 2) + offsets[i]) - offsetanimx - ((sprite_get_width(characters[i][2]) / 2) * 3), ((guihg / 2) + floatycool) - ((sprite_get_height(characters[i][2]) / 2) * 3), 3, 3, shakey, truecolor, dresalpha);
    draw_set_valign(fa_top);
    draw_set_halign(fa_center);
    draw_text(((guiwd / 2) + offsets[i]) - offsetanimx, guihg - 170, characters[i][1]);
}

draw_set_color(c_white);
draw_set_valign(fa_bottom);
draw_text(guiwd / 2, guihg - 40, string_hash_to_newline("Use arrow keys to switch#between skins."));
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(1);
