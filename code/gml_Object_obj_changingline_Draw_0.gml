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

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(respobject.configalpha);

if (changemode)
    draw_set_color(c_yellow);

if (lockline)
    draw_set_color(c_gray);

draw_text(x, y - (3 / divide), changabletext);
var sizemore = 0;

if (string_width(changabletext) > (linewidth / divide))
    sizemore = string_width(changabletext) - (linewidth / divide);

image_xscale = (linewidth / divide) + sizemore;
image_yscale = 32 / divide;
draw_rectangle(x, (y + image_yscale) - (4 / divide), x + image_xscale, (y + image_yscale) - (1 / divide));
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(x - (5 / divide), y - (3 / divide), text);
draw_set_alpha(1);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
