var offsety = 0;
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
var tabdata = [""];

if (isConnected < 0 || Server < 0)
{
    scr_notificationsend(4, "");
    
    if (instance_exists(obj_realonlinemenu))
    {
        with (obj_realonlinemenu)
        {
            buttons[selected] = "Error";
            snd_play(snd_error);
            color = c_red;
        }
    }
    
    instance_destroy();
    exit;
}

var partythingy = "No party found";

if (partystatus != -4)
    partythingy = string(partystatus - 1);

try
{
    tabdata = ["Host id: " + string(ds_list_find_value(SocketList, 0) - 1), "Player count: " + string(ds_list_size(SocketList)), "Party creator id: " + partythingy, "Player object: " + string(findplayer()), "State: " + string(global.sendstate)];
}
catch (e)
{
    mysteryman();
}

if (keyboard_check(vk_tab))
{
    for (var i = 0; i < array_length(tabdata); i++)
    {
        draw_text(10, 10 + offsety, tabdata[i]);
        offsety += 15;
    }
    
    draw_set_valign(fa_bottom);
    offsety = 0;
    var k = ds_map_find_first(global.Parties);
    
    while (!is_undefined(k))
    {
        draw_text(10, guihg - 10 - offsety, string(ds_map_find_value(global.Parties, k)));
        offsety += 15;
        k = ds_map_find_next(global.Parties, k);
    }
}

draw_set_valign(fa_top);
