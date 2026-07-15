var offsety = 0;
draw_set_font(6);
draw_set_color(16777215);
draw_set_valign(0);
draw_set_halign(0);
var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
var textthingy = "Yes";
if (Result < 0)
{
    textthingy = "No";
}
var partythingy = "No party found";
if (partystatus != -4)
{
    partythingy = string(partystatus - 1);
}
var tabdata;
try
{
    tabdata = ["Client id: " + string(socketid - 1), "Player count: " + string(ds_list_size(clientsocketlist)), "Server found: " + textthingy, "Party creator id: " + partythingy, "Player object: " + string(findplayer())];
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
    if (global.Parties != -4)
    {
        draw_text(10, guihg - 10, string(variable_struct_get(global.Parties, string(socketid))));
    }
}
draw_set_valign(0);
