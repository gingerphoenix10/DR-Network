var shadcolor = 3934982;
var shadalph = 0.65;
var shadoff = 2;
var _x = 0;
var _y = 0;
star_anim += star_anim_speed;
bg_speed -= bg_speed_max;
bg_speed_y += bg_speed_y_max;
if (bg_speed < -640)
{
    bg_speed += 640;
}
if (bg_speed_y > -480)
{
    bg_speed_y -= 480;
}
draw_sprite_tiled_ext(4962, star_anim, bg_speed, bg_speed_y, 2, 2, 16777215, 1);
yy = 96 + yyscroll;
mspace = 32;
draw_set_font(2);
draw_set_halign(1);
var songname = "{{songname}}";
var buttons = [["SELECT MAP < " + maps[global.pvpmap][0] + " >", array_length(global.participants) == 0 || global.participants[0] == networkvarsget(2)], ["SELECT MUSIC < " + songname + " >", true], ["", false], ["", false], ["", false], ["", false], ["", false]];
var prevSelected = selected;
if (keyboard_check_pressed(40) || !buttons[selected][1])
{
    selected = (selected + 1) % array_length(buttons);
    while (!buttons[selected][1])
    {
        selected = (selected + 1) % array_length(buttons);
        if (selected == prevSelected)
        {
            break;
        }
    }
}
if (keyboard_check_pressed(38))
{
    selected = (selected - 1) % array_length(buttons);
    if (selected < 0)
    {
        selected = array_length(buttons) - 1;
    }
    while (!buttons[selected][1])
    {
        selected = (selected - 1) % array_length(buttons);
        if (selected < 0)
        {
            selected = array_length(buttons) - 1;
        }
        if (selected == prevSelected)
        {
            break;
        }
    }
}
selected %= array_length(buttons);
if (selected != prevSelected)
{
    snd_play(535);
}
if (selected == 0)
{
    var prevMapIndex = global.reqmap;
    if (keyboard_check_pressed(39))
    {
        global.reqmap = (global.reqmap + 1) % array_length(maps);
    }
    if (keyboard_check_pressed(37))
    {
        global.reqmap = (global.reqmap - 1) % array_length(maps);
    }
    if (global.reqmap < 0)
    {
        global.reqmap = array_length(maps) - 1;
    }
    if (global.reqmap != prevMapIndex)
    {
        snd_play(535);
        if (instance_exists(1761))
        {
            global.pvpmap = global.reqmap;
        }
    }
}
for (i = 0; i < array_length(buttons); i++)
{
    draw_set_font(2);
    draw_set_halign(1);
    draw_set_color(buttons[i][1] ? 16777215 : 8421504);
    if (selected == i)
    {
        draw_set_color(65535);
    }
    sp_draw_text(320, yy + mspace + (i * 40), string_upper(buttons[i][0]));
}
if (global.pvpblock)
{
    draw_set_font(2);
    draw_set_halign(1);
    draw_set_color(8421504);
    sp_draw_text(320, yy + mspace + ((i + 1) * 40), "2 PLAYERS NEEDED TO START");
}
else
{
    draw_set_font(2);
    draw_set_halign(1);
    draw_set_color(16777215);
    sp_draw_text(320, yy + mspace + ((i + 1) * 40), "MATCH STARTS IN " + string(floor(global.timer / 30)) + " SECONDS");
}
var selfId = networkvarsget(2);
exit;
if (array_length(global.participants) == 0)
{
    draw_set_color(32768);
    sp_draw_text(580, yy + mspace, string_upper(global.playernickname));
}
else
{
    for (i = 0; i < array_length(global.participants); i++)
    {
        var name = "unknown name";
        var playerObject = getplayer(global.participants[i], 2, 0);
        if (instance_exists(playerObject))
        {
            name = playerObject.nickname;
        }
        draw_set_color(16777215);
        if (global.participants[i] == selfId)
        {
            draw_set_color(65535);
        }
        if (i == 0)
        {
            draw_set_color(32768);
        }
        sp_draw_text(580, yy + mspace + (i * 40), string_upper(name));
    }
}
