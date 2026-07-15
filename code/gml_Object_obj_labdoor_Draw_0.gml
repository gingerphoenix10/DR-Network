s_buffer += 1;
draw_set_color(0);
ossafe_fill_rectangle(x, y, x + 40, y + 60);
if (open == 1)
{
    if (instance_exists(s1))
    {
        with (s1)
        {
            instance_destroy();
        }
        with (s2)
        {
            instance_destroy();
        }
    }
    if (ox < 20)
    {
        ox += 2;
        c_sound = 0;
        s_sound = 0;
    }
    if (ox >= 20)
    {
        ox = 30;
    }
}
if (open == 0)
{
    if (instance_exists(s1) == 0)
    {
        s1 = instance_create(x, y + 40, 1181);
        s2 = instance_create(x + 20, y + 40, 1181);
    }
    if (ox > 0)
    {
        ox -= 2;
        o_sound = 0;
    }
    if (ox < 0)
    {
        ox = 0;
        if (s_sound == 0)
        {
            snd_play(309);
            s_sound = 1;
        }
    }
}
anim += 1;
if (ox < 20)
{
    draw_sprite_part(8571, 0, ox, 0, 20 - ox, 60, x, y);
    draw_sprite_part(8574, 0, 0, 0, 20 - ox, 60, x + 20 + ox, y);
    if (type == 1)
    {
        draw_sprite_part(8588, 0, ox, 0, 20 - ox, 60, x, y);
        if (red == 1)
        {
            draw_sprite_part(8591, floor(anim / 5), ox, 0, 19 - ox, 12, x, y + 12);
        }
        if (yel == 1)
        {
            draw_sprite_part(8592, floor(anim / 5), ox, 0, 19 - ox, 12, x, y + 25);
        }
        draw_sprite_part(8589, 0, 0, 0, 20 - ox, 60, x + 20 + ox, y);
        if (blu == 1)
        {
            draw_sprite_part(8596, floor(anim / 5), 0, 0, 17 - ox, 10, x + 23 + ox, y + 13);
        }
        if (gre == 1)
        {
            draw_sprite_part(8595, floor(anim / 5), 0, 0, 17 - ox, 10, x + 23 + ox, y + 26);
        }
    }
    if (type == 2)
    {
        draw_sprite_part(8586, 0, ox, 0, 20 - ox, 37, x, y);
        draw_sprite_part(8587, 0, 0, 0, 20 - ox, 37, x + 20 + ox, y);
        if (red == 1)
        {
            w = 13 - ox;
            if (w < 0)
            {
                w = 0;
            }
            draw_sprite_part(8593, floor(anim / 5), ox, 0, w, 15, x + 7, y + 18);
            w = 15 - ox;
            if (w < 0)
            {
                w = 0;
            }
            draw_sprite_part(8594, floor(anim / 5), 0, 0, w, 15, x + 20 + ox, y + 18);
        }
    }
}
draw_sprite(8554, 0, x - 4, y - 3);
if (instance_exists(1198))
{
    if (point_distance(x + 20, y + 60, obj_mainchara.x + 10, obj_mainchara.bbox_top) > 50)
    {
        if (open == 1)
        {
            snd_play(773);
        }
        open = 0;
    }
    if (point_distance(x + 20, y + 60, obj_mainchara.x + 10, obj_mainchara.bbox_top) < 40 && shouldopen == 1)
    {
        if (open == 0)
        {
            snd_play(772);
        }
        open = 1;
    }
}
