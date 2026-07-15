var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
if (battleinitiated)
{
    draw_set_font(5);
    draw_set_alpha(1);
    draw_set_halign(0);
    draw_set_valign(0);
    draw_set_color(0);
    draw_rectangle(0, 0, guiwd, guihg);
    draw_set_alpha(alpha);
    draw_sprite_ext(8609, 0, 0, 0, 1, 1, 0, 32768, alpha);
    draw_sprite(8610, 0, guiwd / 2, guihg / 2);
    draw_set_font(16);
    draw_set_color(16777215);
    var statheight = guihg - 77;
    draw_text_transformed(35, statheight, "=)", 1, 1, 0);
    draw_text_transformed(155, statheight, "LV 1", 1, 1, 0);
    draw_sprite_ext(8616, 0, 275, statheight, 1, 1, 0, 16777215, alpha);
    draw_set_color(65535);
    draw_rectangle(275, statheight, 275 + (hp * 1.2), statheight + 20, 0);
    draw_set_color(16777215);
    draw_text_transformed(290 + (hp * 1.2), statheight, string(hp) + " / " + string(hp), 1, 1, 0);
    var offsetx = 0;
    var boxsizex = actualboxsizex;
    var boxsizey = actualboxsizey;
    var startingpointx = (guiwd - boxsizex) / 2;
    var startingpointy = 250;
    var innersize = 5;
    draw_rectangle(startingpointx, startingpointy, startingpointx + boxsizex, startingpointy + boxsizey, 0);
    draw_set_color(0);
    draw_rectangle(startingpointx + innersize, startingpointy + innersize, (startingpointx + boxsizex) - innersize, (startingpointy + boxsizey) - innersize, 0);
    draw_set_color(16777215);
    if (battleturn > 0)
    {
        draw_sprite(4850, 0, ((guiwd / 2) - 8) + fakex, 314 + fakey);
    }
    draw_set_font(6);
    if (battleturn == 0)
    {
        draw_text_ext_transformed(56, guihg - 208, string_hash_to_newline(message_draw), 16, 300, 2, 2, 0);
    }
    draw_set_font(6);
    for (var i = 0; i < array_length(buttonsorder); i++)
    {
        var indexthingy = 0;
        if (choice == i && layerchoice == 0 && act == 0 && battleturn == 0)
        {
            indexthingy = 1;
        }
        draw_sprite(buttonsorder[i], indexthingy, 95 + offsetx, guihg - 5);
        if (choice == i && layerchoice == 0 && act == 0 && battleturn == 0)
        {
            draw_sprite_ext(4850, 0, (55 + offsetx) - 8, guihg - 25 - 8, 1, 1, 0, 16777215, 1);
        }
        offsetx += 150;
    }
    if (layerchoice > 0)
    {
        var offsety = 0;
        switch (choice)
        {
            case 1:
                if (layerchoice == 1)
                {
                    draw_text_transformed(96, guihg - 205, "* Suspicious Book", 2, 2, 0);
                    draw_sprite_ext(4850, 0, 64, ((guihg - 205) + 11) - 4, 1, 1, 0, 16777215, alpha);
                }
                else if (layerchoice == 2)
                {
                    choices = ["* Check", "* Just take it already"];
                    for (var i = 0; i < 2; i++)
                    {
                        draw_text_transformed(96, (guihg - 205) + offsety, choices[i], 2, 2, 0);
                        if (i == choicelayer)
                        {
                            draw_sprite_ext(4850, 0, 64, (((guihg - 205) + 11) - 4) + offsety, 1, 1, 0, 16777215, alpha);
                        }
                        offsety += 32;
                    }
                }
                break;
        }
    }
}
