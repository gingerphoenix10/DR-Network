var shadcolor = #060B3C;
var shadalph = 0.65;
var shadoff = 2;
var _x = 0;
var _y = 0;
star_anim += star_anim_speed;
bg_speed -= bg_speed_max;
bg_speed_y += bg_speed_y_max;

if (bg_speed < -640)
    bg_speed += 640;

if (bg_speed_y > -480)
    bg_speed_y -= 480;

draw_sprite_tiled_ext(spr_dw_tv_starbgtile, star_anim, bg_speed, bg_speed_y, 2, 2, c_white, 1);
yy = 96 + yyscroll;
mspace = 32;
draw_set_font(fnt_8bit);
draw_set_halign(fa_center);
var songname = "{{songname}}";
var buttons = [["SELECT MAP < " + maps[global.pvpmap][0] + " >", array_length(global.participants) == 0 || global.participants[0] == networkvarsget(2)], ["SELECT MUSIC < " + songname + " >", true], ["", false], ["", false], ["", false], ["", false], ["", false]];
var prevSelected = selected;

if (down_p() || !buttons[selected][1])
{
    selected = (selected + 1) % array_length(buttons);
    
    while (!buttons[selected][1])
    {
        selected = (selected + 1) % array_length(buttons);
        
        if (selected == prevSelected)
            break;
    }
}

if (up_p())
{
    selected = (selected - 1) % array_length(buttons);
    
    if (selected < 0)
        selected = array_length(buttons) - 1;
    
    while (!buttons[selected][1])
    {
        selected = (selected - 1) % array_length(buttons);
        
        if (selected < 0)
            selected = array_length(buttons) - 1;
        
        if (selected == prevSelected)
            break;
    }
}

selected %= array_length(buttons);

if (selected != prevSelected)
    snd_play(snd_menumove);

if (selected == 0)
{
    var prevMapIndex = global.reqmap;
    
    if (right_p())
        global.reqmap = (global.reqmap + 1) % array_length(maps);
    
    if (left_p())
        global.reqmap = (global.reqmap - 1) % array_length(maps);
    
    if (global.reqmap < 0)
        global.reqmap = array_length(maps) - 1;
    
    if (global.reqmap != prevMapIndex)
    {
        snd_play(snd_menumove);
        
        if (instance_exists(obj_pvpcontroller))
            global.pvpmap = global.reqmap;
    }
}

for (i = 0; i < array_length(buttons); i++)
{
    draw_set_font(fnt_8bit);
    draw_set_halign(fa_center);
    draw_set_color(buttons[i][1] ? c_white : c_gray);
    
    if (selected == i)
        draw_set_color(c_yellow);
    
    sp_draw_text(320, yy + mspace + (i * 40), string_upper(buttons[i][0]));
}

if (global.pvpblock)
{
    draw_set_font(fnt_8bit);
    draw_set_halign(fa_center);
    draw_set_color(c_gray);
    sp_draw_text(320, yy + mspace + ((i + 1) * 40), "2 PLAYERS NEEDED TO START");
}
else
{
    draw_set_font(fnt_8bit);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    sp_draw_text(320, yy + mspace + ((i + 1) * 40), "MATCH STARTS IN " + string(floor(global.timer / 30)) + " SECONDS");
}

var selfId = networkvarsget(2);
exit;

if (array_length(global.participants) == 0)
{
    draw_set_color(c_green);
    sp_draw_text(580, yy + mspace, string_upper(global.playernickname));
}
else
{
    for (i = 0; i < array_length(global.participants); i++)
    {
        var name = "unknown name";
        var playerObject = getplayer(global.participants[i], 2, 0);
        
        if (instance_exists(playerObject))
            name = playerObject.nickname;
        
        draw_set_color(c_white);
        
        if (global.participants[i] == selfId)
            draw_set_color(c_yellow);
        
        if (i == 0)
            draw_set_color(c_green);
        
        sp_draw_text(580, yy + mspace + (i * 40), string_upper(name));
    }
}