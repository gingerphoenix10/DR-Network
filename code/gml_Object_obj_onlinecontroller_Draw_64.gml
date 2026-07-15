depth = -2500;
var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_color(c_white);
draw_set_font(fnt_small);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
var offsety = 0;

for (var i = 0; i < array_length(notifications); i++)
{
    var nottype = notifications[i][0];
    var strheight = 0;
    
    if (i > 0)
        strheight = string_height(string_hash_to_newline(nottext[notifications[i - 1][0]])) * 2;
    
    offsety += strheight;
    draw_set_color(colors[nottype]);
    
    if (nottype == 0 || nottype == 1 || nottype == 7)
    {
        draw_text_transformed(5, 5 + offsety, string_hash_to_newline(notifications[i][1]), 2, 2, 0);
        draw_set_color(c_white);
        draw_text_transformed(5 + (string_width(notifications[i][1]) * 2), 5 + offsety, string_hash_to_newline(nottext[nottype]), 2, 2, 0);
    }
    else if (nottype > 1)
    {
        draw_text_transformed(5, 5 + offsety, string_hash_to_newline(nottext[nottype]), 2, 2, 0);
    }
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
var networkobj = networkvarsget(1);

if (networkobj == -4)
    exit;

draw_set_valign(fa_bottom);
draw_set_font(fnt_main);
offsety = 0;
var chatarray = [];
var nickarray = [];

if (global.interact == 10)
{
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(5, guihg - 19, 10 + (string_width(keyboard_string) * 1.25) + 4, guihg - 20 - (string_height(keyboard_string) * 1.25));
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text_transformed(10, guihg - 20, keyboard_string + typo, 1.25, 1.25, 0);
    chatarray = global.chatstay;
    nickarray = global.chatsenders;
}
else
{
    chatarray = global.chattemp;
    nickarray = global.chatsenderstemp;
}

if (global.interact == 10 || (global.interact == 0 && global.showchatmessages))
{
    for (var i = 0; i < array_length(chatarray); i++)
    {
        var reali = array_length(chatarray) - i - 1;
        var completemes = chatarray[reali];
        
        if (nickarray[reali][0] != "")
            completemes = nickarray[reali][0] + ": " + chatarray[reali];
        
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_rectangle(5, (guihg - 49) + offsety, 10 + (string_width(completemes) * 1.25) + 4, ((guihg - 50) + offsety) - (string_height(completemes) * 1.25));
        draw_set_alpha(1);
        draw_set_color(nickarray[reali][1]);
        draw_text_transformed(10, (guihg - 50) + offsety, nickarray[reali][0], 1.25, 1.25, 0);
        draw_set_color(c_white);
        
        if (nickarray[reali][0] != "")
            draw_text_transformed(10 + (string_width(nickarray[reali][0]) * 1.25), (guihg - 50) + offsety, ": " + chatarray[reali], 1.25, 1.25, 0);
        else
            draw_text_transformed(10, (guihg - 50) + offsety, chatarray[reali], 1.25, 1.25, 0);
        
        offsety -= 20;
    }
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
