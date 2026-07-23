var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_font(fnt_mainbig);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_set_alpha(lostalpha - 0.5);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_alpha(lostalpha);
var offsetchange = 40;
var offsety = 0;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (lostlayer == 0)
{
    for (var i = 0; i < array_length(lostlevels); i++)
    {
        draw_set_color(c_gray);
        
        if (selected == i)
            draw_set_color(c_yellow);
        
        draw_text(guiwd / 2, ((guihg / 2) + offsety) - (offsetchange * selected), lostlevels[i][0]);
        offsety += offsetchange;
    }
}
else
{
    for (var i = 2; i < array_length(lostlevels[selectedtopic]); i++)
    {
        draw_set_color(c_gray);
        
        if (selected == i)
            draw_set_color(c_yellow);
        
        draw_text(guiwd / 2, ((guihg / 2) + offsety) - (offsetchange * (selected - 2)), lostlevels[selectedtopic][i][0]);
        offsety += offsetchange;
    }
}

draw_set_color(c_white);
draw_set_valign(fa_top);
var lostlevelsstring = "Lost Levels";
draw_rectangle((guiwd / 2) - (string_width(lostlevelsstring) / 2) - 25, 0, (guiwd / 2) + (string_width(lostlevelsstring) / 2) + 25, 0 + string_height(lostlevelsstring) + 30);
draw_set_color(c_black);
draw_rectangle((guiwd / 2) - (string_width(lostlevelsstring) / 2) - 20, 0, (guiwd / 2) + (string_width(lostlevelsstring) / 2) + 20, 0 + string_height(lostlevelsstring) + 25);
draw_set_color(c_white);
draw_text(guiwd / 2, 10, lostlevelsstring);
draw_set_valign(fa_bottom);
var lostdescription = "";

if (lostlayer == 0)
    lostdescription = string_hash_to_newline(lostlevels[selected][1]);
else if (lostlayer > 0)
    lostdescription = string_hash_to_newline(lostlevels[selectedtopic][selected][1]);

if (lostdescription != "")
{
    draw_rectangle((guiwd / 2) - (string_width(lostdescription) / 2) - 25, guihg, (guiwd / 2) + (string_width(lostdescription) / 2) + 25, guihg - string_height(lostdescription) - 30);
    draw_set_color(c_black);
    draw_rectangle((guiwd / 2) - (string_width(lostdescription) / 2) - 20, guihg, (guiwd / 2) + (string_width(lostdescription) / 2) + 20, guihg - string_height(lostdescription) - 25);
}

draw_set_color(c_white);
draw_text(guiwd / 2, guihg - 10, lostdescription);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
