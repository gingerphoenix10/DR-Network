var offsety = 0;
draw_set_font(6);
draw_set_color(16777215);
draw_set_valign(0);
draw_set_halign(0);
var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
var tabdata = [""];
if (isConnected < 0 || Server < 0)
{
    scr_notificationsend(4, "");
    if (instance_exists(1759))
    {
        with (1759)
        {
            buttons[selected] = "Error";
            snd_play(406);
            color = 255;
        }
    }
    instance_destroy();
    exit;
}
var partythingy = "No party found";
if (partystatus != -4)
{
    partythingy = string(partystatus - 1);
}
try
{
    tabdata = ["Host id: " + string(ds_list_find_value(SocketList, 0) - 1), "Player count: " + string(ds_list_size(SocketList)), "Party creator id: " + partythingy, "Player object: " + string(findplayer()), "State: " + string(global.sendstate)];
}
catch (e)
{
    mysteryman();
}
if (keyboard_check(9))
{
    for (var i = 0; i < array_length(tabdata); i++)
    {
        draw_text(10, 10 + offsety, tabdata[i]);
        offsety += 15;
    }
    draw_set_valign(2);
    offsety = 0;
    var k = ds_map_find_first(global.Parties);
    while (!is_undefined(k))
    {
        draw_text(10, guihg - 10 - offsety, string(ds_map_find_value(global.Parties, k)));
        offsety += 15;
        k = ds_map_find_next(global.Parties, k);
    }
}
draw_set_valign(0);
