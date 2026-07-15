if (you || (instance_exists(1570) && !global.cutsceneplayers) || platformer != instance_exists(910) || eliminated)
{
    exit;
}
if (state == 2 && instance_exists(1412))
{
    exit;
}
if (object_index == 1771)
{
    if (iframes > 0)
    {
        iframes--;
    }
    if (iframes > 0 && (iframes % 2) == 0)
    {
        draw_set_color(16440756);
        draw_set_font(8);
        draw_set_halign(1);
        draw_set_valign(0);
        scale = 2;
        draw_set_color(16777215);
        if (instance_exists(1737))
        {
            if (ds_list_find_value(obj_client.clientsocketlist, 0) == idthing)
            {
                draw_set_color(4235519);
            }
        }
        if (global.shownicknames && mysterycheck() == 1)
        {
            draw_text_transformed(x, y - 42, nickname, scale, scale, 0);
        }
        draw_set_halign(0);
        draw_set_color(16777215);
        exit;
    }
}
event_inherited();
if (platformer)
{
    draw_self();
    draw_set_color(16440756);
    draw_set_font(8);
    draw_set_halign(1);
    draw_set_valign(0);
    scale = 2;
    draw_set_color(16777215);
    if (instance_exists(1737))
    {
        if (ds_list_find_value(obj_client.clientsocketlist, 0) == idthing)
        {
            draw_set_color(4235519);
        }
    }
    if (global.shownicknames && mysterycheck() == 1)
    {
        draw_text_transformed(x, y - 42, nickname, scale, scale, 0);
    }
    draw_set_halign(0);
    draw_set_color(16777215);
    exit;
}
var divide = 1;
var scale = 2;
if (!global.darkzone)
{
    divide = 2;
    scale = 1;
}
draw_set_color(16777215);
var tilemultx = 0;
var tilemulty = 0;
if (state == 1)
{
    draw_player_updated(character, cutscenewait, state_index);
}
else if (state == 2)
{
    draw_player_updated(character, battlestance, state_index);
}
else if (sprite_exists(sprite_index))
{
    draw_player_updated(character, sprite_index, image_index, x + tower_shake_xoffset);
}
draw_set_font(8);
if (instance_exists(1737))
{
    if (ds_list_find_value(obj_client.clientsocketlist, 0) == idthing)
    {
        draw_set_color(4235519);
    }
}
draw_set_halign(1);
draw_set_valign(0);
if (global.shownicknames && mysterycheck() == 1)
{
    if (state == 3)
    {
        draw_text_transformed(x, y - (sety * 2) - 10, nickname, scale, scale, 0);
    }
    else
    {
        draw_text_transformed(x + (19 / divide), y - (sety / divide), nickname, scale, scale, 0);
    }
}
draw_set_halign(0);
draw_set_color(16777215);
