var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
var scale = 2;
var dialoguewidth = guiwd / 2;
var dialogueheight = guihg - (50 * scale);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_mainbig);
FramesToComplete = 60;
FramesBeforeStart = 30;
Distance = 50;

tween = 0;
if (timer > FramesBeforeStart)
{
    tween = ((timer-FramesBeforeStart)/FramesToComplete) == 1 ? 1 : 1 - power(2, -10 * (((timer-FramesBeforeStart)/FramesToComplete)))
}
/*
draw_sprite_ext(spr_dialogueboxyellow, 1, dialoguewidth, dialogueheight - tween*Distance, 4.2 * scale, 1.3 * scale, image_angle, c_white, tween);
draw_sprite_ext(spr_dialogueboxyellow, 0, dialoguewidth, dialogueheight - tween*Distance, 4.1 * scale, 1.2 * scale, image_angle, image_blend, tween);
draw_set_halign(fa_center);
draw_text(guiwd / 2, dialogueheight - (30 * scale), "Phoenix");
*/
space = x;
height = 200;

image_alpha = tween;
arg0 = space;
arg1 = y-tween*Distance;
arg2 = guiwd - space;
arg3 = y+height-tween*Distance;

draw_set_color(c_black);
d_rectangle(arg0 + 20, arg1 + 20, arg2 - 20, arg3 - 20, false);

if (!variable_instance_exists(id, "cur_jewel"))
    cur_jewel = 0;

cur_jewel += 1;
textbox_width = arg2 - arg0 - 63;

if (textbox_width < 0)
    textbox_width = 0;

textbox_height = arg3 - arg1 - 63;

if (textbox_height < 0)
    textbox_height = 0;

if (textbox_width > 0)
{
    draw_sprite_stretched_ext(spr_textbox_top, 0, arg0 + 32, arg1, textbox_width, 32, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_top, 0, arg0 + 32, arg3 + 1, textbox_width, -2, 0, c_white, image_alpha);
}

if (textbox_height > 0)
{
    draw_sprite_ext(spr_textbox_left, 0, arg2 + 1, arg1 + 32, -2, textbox_height, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_left, 0, arg0, arg1 + 32, 2, textbox_height, 0, c_white, image_alpha);
}

if (global.flag[8] == 0)
{
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg0, arg1, 2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg2 + 1, arg1, -2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg0, arg3 + 1, 2, -2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg2 + 1, arg3 + 1, -2, -2, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(spr_textbox_topleft, 0, arg0, arg1, 2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, 0, arg2 + 1, arg1, -2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, 0, arg0, arg3 + 1, 2, -2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, 0, arg2 + 1, arg3 + 1, -2, -2, 0, c_white, image_alpha);
}

draw_set_color(-1);

draw_set_font(fnt_mainbig);
draw_set_color(c_yellow)
draw_set_halign(fa_center)
draw_text(dialoguewidth, arg1+20, "Warning")
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_text(dialoguewidth, arg1+50, "This is an unofficial fork of")

draw_text(dialoguewidth, arg1+80, "CMD28's DELTARUNE: Network mod.")

timer++