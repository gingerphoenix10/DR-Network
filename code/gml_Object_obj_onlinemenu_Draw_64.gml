draw_set_color(color);
var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
var scale = 2;
var dialoguewidth = guiwd / 2;
var dialogueheight = guihg - (50 * scale) - boxoffset;
var sertest = "You're offline.";
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (instance_exists(obj_server))
    sertest = "You're host.";
else if (instance_exists(obj_client))
    sertest = "You're client.";

draw_set_font(fnt_mainbig);
draw_sprite_ext(spr_dialogueboxyellow, 1, dialoguewidth, dialogueheight, 4.2 * scale, 1.3 * scale, image_angle, color, image_alpha);
draw_sprite_ext(spr_dialogueboxyellow, 0, dialoguewidth, dialogueheight, 4.1 * scale, 1.2 * scale, image_angle, image_blend, image_alpha);
draw_set_halign(fa_center);
draw_text(guiwd / 2, dialogueheight - (30 * scale), global.playernickname);
draw_text(guiwd / 2, dialogueheight - (10 * scale), global.ip + ":" + global.port);
draw_text(guiwd / 2, dialogueheight + (10 * scale), sertest);
draw_set_halign(fa_left);
var offsety = 0;
var xdtd = (70 * scale) + boxoffset;
var ydtd = 65 * scale;
draw_sprite_ext(spr_dialogueboxyellow, 1, xdtd, ydtd + 17, 1.4 * scale, 2.05 * scale, image_angle, color, image_alpha);
draw_sprite_ext(spr_dialogueboxyellow, 0, xdtd, ydtd + 17, 1.3 * scale, 1.95 * scale, image_angle, image_blend, image_alpha);

for (var i = 0; i < array_length(text); i++)
{
    if (presseffect[i] > 0)
        presseffect[i] -= 0.4;
    
    draw_set_color(color);
    
    if (selected == i && !done)
        draw_set_color(c_yellow);
    
    if (i == 2 && networkvarsget(1) == -4)
        draw_set_color(c_gray);
    
    draw_sprite_ext(spr_heartsmall, 0, xdtd - 68, (ydtd - 90) + hearty + heartoffy, 2, 2, heartangle, c_white, image_alpha);
    draw_text((xdtd - (20 * scale)) + presseffect[i], (ydtd - (49 * scale)) + offsety + presseffect[i], string_hash_to_newline(text[i]));
    offsety += 40;
}

draw_set_color(c_white);

if (global.darkzone)
    draw_sprite(spr_poppup_mouse, 0, mouse_x - camera_get_view_x(view_camera[0]), mouse_y - camera_get_view_y(view_camera[0]));
else
    draw_sprite(spr_poppup_mouse, 0, (mouse_x - camera_get_view_x(view_camera[0])) * 2, (mouse_y - camera_get_view_y(view_camera[0])) * 2);
