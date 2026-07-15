draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_alpha(configalpha - 0.5);
draw_set_color(c_black);
draw_rectangle(camx, camy, camx + camera_get_view_width(view_camera[0]), camy + camera_get_view_height(view_camera[0]), 0);
draw_set_alpha(1);
draw_set_color(c_white);
