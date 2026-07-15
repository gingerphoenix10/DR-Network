draw_self();
anim += 1;
if (keytype == 0)
{
    if (global.doorstage[keytype] != 2)
    {
        draw_sprite(8579, 0, x + 6, y + 16);
    }
    else
    {
        draw_sprite(8580, floor(anim / 4), x + 6, y + 16);
    }
}
else if (keytype == 1)
{
    if (global.doorstage[keytype] != 2)
    {
        draw_sprite(8557, 0, x + 6, y + 16);
    }
    else
    {
        draw_sprite(8562, floor(anim / 4), x + 6, y + 16);
    }
}
else if (keytype == 2)
{
    if (global.doorstage[keytype] != 2)
    {
        draw_sprite(8570, 0, x + 6, y + 16);
    }
    else
    {
        draw_sprite(8577, floor(anim / 4), x + 6, y + 16);
    }
}
else if (keytype == 3)
{
    if (global.doorstage[keytype] != 2)
    {
        draw_sprite(8583, 0, x + 6, y + 16);
    }
    else
    {
        draw_sprite(8585, floor(anim / 4), x + 6, y + 16);
    }
}
