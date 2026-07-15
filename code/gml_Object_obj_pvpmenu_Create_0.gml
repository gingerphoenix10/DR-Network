global.participates = networkvarsget(2);
mus_volume(global.currentsong[1], 0, 14);
star_anim = 0;
star_anim_speed = 0.5;
bg_speed = 1;
bg_speed_y = 1;
bg_speed_max = 3;
bg_speed_y_max = 3;
shakeobj = 0;
yyscroll = 0;
showrank = 0;
bg_y = -640;
repeatthingy = 0;
bg_y_extra = 0;
bg_x_extra = 0;
unlockskip = 0;
con = 0;
nuevatimer = 0;
timer = 0;
bouncebuff = 0;
bouncecount = 0;
depth = -1000;
reachedend_draw_triangle_siner = 0;

function sp_draw_text(arg0, arg1, arg2)
{
    var shadcolor = 3934982;
    var shadalph = 0.65;
    var shadoff = 2;
    var memcol = draw_get_color();
    var memalph = draw_get_alpha();
    draw_set_color(shadcolor);
    draw_set_alpha(shadalph);
    draw_text(arg0 + shadoff, arg1 + shadoff, arg2);
    draw_set_color(memcol);
    draw_set_alpha(memalph);
    draw_text(arg0, arg1, arg2);
}

selected = 1;
mapindex = 0;
maps = [["Tree", 266], ["another", 0], ["another2", 0]];
