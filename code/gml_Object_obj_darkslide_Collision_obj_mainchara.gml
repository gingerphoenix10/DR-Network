cancollide = 0;
if (global.interact == 0 || collide == 1)
{
    cancollide = 1;
}
if (cancollide == 1)
{
    if (abovey == 0)
    {
        if (obj_mainchara.y < y)
        {
            abovey = 1;
            snd_play(314);
            slide_noise = snd_loop(510);
            with (1198)
            {
                fun = 1;
                sprite_index = slidesprite;
            }
        }
        if (obj_mainchara.y > y)
        {
            abovey = -1;
        }
    }
    collide = 1;
    global.interact = 1;
    other.y += 12;
    collidetimer = 3;
    collider += 1;
    if (slidetimer == 0 && abovey == 1)
    {
        dust = instance_create(obj_mainchara.x + 20, obj_mainchara.y + 30, 1328);
        with (dust)
        {
            vspeed = -6;
            hspeed = -1 + random(2);
        }
        slidetimer = -6;
    }
    slidetimer += 1;
    if (move_lr_enabled && obj_mainchara.px == 0)
    {
        if (left_h())
        {
            with (1198)
            {
                _px = -6;
                if (!place_meeting(x + _px, y, 1181))
                {
                    x += _px;
                }
            }
        }
        if (right_h())
        {
            with (1198)
            {
                _px = 6;
                if (!place_meeting(x + _px, y, 1181))
                {
                    x += _px;
                }
            }
        }
    }
}
