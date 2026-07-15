var camwd = camera_get_view_width(view_camera[0]);
var camhg = camera_get_view_height(view_camera[0]);
var respobject = obj_onlineconfig;

if (instance_exists(obj_realonlinemenu))
    respobject = obj_realonlinemenu;

if (respobject == obj_onlineconfig)
{
    if (obj_onlineconfig.settinglayer >= 0)
        exit;
}

var divide = 1;
draw_set_font(fnt_mainbig);

if (!global.darkzone)
{
    divide = 2;
    draw_set_font(fnt_main);
}

image_xscale = -string_width(text);
image_yscale = string_height(text);
draw_set_alpha(respobject.configalpha);
draw_set_color(image_blend);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(x, y, text);
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
