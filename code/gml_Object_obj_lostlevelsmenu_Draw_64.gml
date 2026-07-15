var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_font(5);
draw_set_valign(0);
draw_set_halign(0);
draw_set_color(0);
draw_set_alpha(lostalpha - 0.5);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_alpha(lostalpha);
var offsetchange = 40;
var offsety = 0;
draw_set_halign(1);
draw_set_valign(1);
if (lostlayer == 0)
{
    for (var i = 0; i < array_length(lostlevels); i++)
    {
        draw_set_color(8421504);
        if (selected == i)
        {
            draw_set_color(65535);
        }
        draw_text(guiwd / 2, ((guihg / 2) + offsety) - (offsetchange * selected), lostlevels[i][0]);
        offsety += offsetchange;
    }
}
else
{
    for (var i = 2; i < array_length(lostlevels[selectedtopic]); i++)
    {
        draw_set_color(8421504);
        if (selected == i)
        {
            draw_set_color(65535);
        }
        draw_text(guiwd / 2, ((guihg / 2) + offsety) - (offsetchange * (selected - 2)), lostlevels[selectedtopic][i][0]);
        offsety += offsetchange;
    }
}
draw_set_color(16777215);
draw_set_valign(0);
var lostlevelsstring = "Lost Levels";
draw_rectangle((guiwd / 2) - (string_width(lostlevelsstring) / 2) - 25, 0, (guiwd / 2) + (string_width(lostlevelsstring) / 2) + 25, 0 + string_height(lostlevelsstring) + 30);
draw_set_color(0);
draw_rectangle((guiwd / 2) - (string_width(lostlevelsstring) / 2) - 20, 0, (guiwd / 2) + (string_width(lostlevelsstring) / 2) + 20, 0 + string_height(lostlevelsstring) + 25);
draw_set_color(16777215);
draw_text(guiwd / 2, 10, lostlevelsstring);
draw_set_valign(2);
var lostdescription = "";
if (lostlayer == 0)
{
    lostdescription = string_hash_to_newline(lostlevels[selected][1]);
}
else if (lostlayer > 0)
{
    lostdescription = string_hash_to_newline(lostlevels[selectedtopic][selected][1]);
}
if (lostdescription != "")
{
    draw_rectangle((guiwd / 2) - (string_width(lostdescription) / 2) - 25, guihg, (guiwd / 2) + (string_width(lostdescription) / 2) + 25, guihg - string_height(lostdescription) - 30);
    draw_set_color(0);
    draw_rectangle((guiwd / 2) - (string_width(lostdescription) / 2) - 20, guihg, (guiwd / 2) + (string_width(lostdescription) / 2) + 20, guihg - string_height(lostdescription) - 25);
}
draw_set_color(16777215);
draw_text(guiwd / 2, guihg - 10, lostdescription);
draw_set_alpha(1);
draw_set_halign(0);
draw_set_valign(0);
