draw_self();
anim += 1;

if (keytype == 0)
{
    if (global.doorstage[keytype] != 2)
        draw_sprite(spr_levereye_red, 0, x + 6, y + 16);
    else
        draw_sprite(spr_levereye_red_bright, floor(anim / 4), x + 6, y + 16);
}
else if (keytype == 1)
{
    if (global.doorstage[keytype] != 2)
        draw_sprite(spr_levereye_blue, 0, x + 6, y + 16);
    else
        draw_sprite(spr_levereye_blue_bright, floor(anim / 4), x + 6, y + 16);
}
else if (keytype == 2)
{
    if (global.doorstage[keytype] != 2)
        draw_sprite(spr_levereye_green, 0, x + 6, y + 16);
    else
        draw_sprite(spr_levereye_green_bright, floor(anim / 4), x + 6, y + 16);
}
else if (keytype == 3)
{
    if (global.doorstage[keytype] != 2)
        draw_sprite(spr_levereye_yellow, 0, x + 6, y + 16);
    else
        draw_sprite(spr_levereye_yellow_bright, floor(anim / 4), x + 6, y + 16);
}