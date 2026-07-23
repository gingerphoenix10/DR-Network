if (you || (instance_exists(obj_cutscene_master) && !global.cutsceneplayers) || platformer != instance_exists(obj_plat_player) || eliminated)
    exit;

if (state == 2 && instance_exists(obj_battlecontroller))
    exit;

if (object_index == obj_plat_pvp_charafake)
{
    if (iframes > 0)
        iframes--;
    
    if (iframes > 0 && (iframes % 2) == 0)
    {
        draw_set_color(#B4DDFA);
        draw_set_font(fnt_small);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        scale = 2;
        draw_set_color(c_white);
        
        if (instance_exists(obj_client))
        {
            if (ds_list_find_value(obj_client.clientsocketlist, 0) == idthing)
                draw_set_color(c_orange);
        }
        
        if (global.shownicknames && mysterycheck() == 1)
            draw_text_transformed(x, y - 42, nickname, scale, scale, 0);
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        exit;
    }
}

event_inherited();

if (platformer)
{
    draw_self();
    draw_set_color(#B4DDFA);
    draw_set_font(fnt_small);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    scale = 2;
    draw_set_color(c_white);
    
    if (instance_exists(obj_client))
    {
        if (ds_list_find_value(obj_client.clientsocketlist, 0) == idthing)
            draw_set_color(c_orange);
    }
    
    if (global.shownicknames && mysterycheck() == 1)
        draw_text_transformed(x, y - 42, nickname, scale, scale, 0);
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    exit;
}

var divide = 1;
var scale = 2;

if (!global.darkzone)
{
    divide = 2;
    scale = 1;
}

draw_set_color(c_white);
var tilemultx = 0;
var tilemulty = 0;

if (state == 1)
    draw_player_updated(character, cutscenewait, state_index);
else if (state == 2)
    draw_player_updated(character, battlestance, state_index);
else if (sprite_exists(sprite_index))
    draw_player_updated(character, sprite_index, image_index, x + tower_shake_xoffset);

draw_set_font(fnt_small);

if (instance_exists(obj_client))
{
    if (ds_list_find_value(obj_client.clientsocketlist, 0) == idthing)
        draw_set_color(c_orange);
}

draw_set_halign(fa_center);
draw_set_valign(fa_top);

if (global.shownicknames && mysterycheck() == 1)
{
    if (state == 3)
        draw_text_transformed(x, y - (sety * 2) - 10, nickname, scale, scale, 0);
    else
        draw_text_transformed(x + (19 / divide), y - (sety / divide), nickname, scale, scale, 0);
}

draw_set_halign(fa_left);
draw_set_color(c_white);
