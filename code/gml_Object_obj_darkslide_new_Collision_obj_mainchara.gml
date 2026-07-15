var solidcheck = 0;
cancollide = 0;
if (sliding == 0 && global.interact == 0)
{
    if (obj_mainchara.y < ((y + sprite_height) - obj_mainchara.sprite_height))
    {
        with (1198)
        {
            if (place_meeting(x, y + 20, 1181))
            {
                solidcheck = 1;
            }
        }
        if (solidcheck == 0)
        {
            if (obj_mainchara.y >= obj_mainchara.sprite_height)
            {
                snd_play(314);
            }
            slide_noise = snd_loop(510);
            with (1198)
            {
                sliding = 1;
                fun = 1;
                sprite_index = slidesprite;
            }
            sliding = 1;
        }
    }
    else
    {
        obj_mainchara.y = (y + sprite_height) - 48;
    }
}
if (sliding == 1)
{
    collide = 1;
    global.interact = 1;
    other.y += 12;
    collidetimer = 1;
    if (other.y >= room_height)
    {
        other.y -= room_height;
    }
    collider += 1;
    if (slidetimer == 0)
    {
        dust = instance_create(obj_mainchara.x + 20, obj_mainchara.y + 30, 1328);
        with (dust)
        {
            vspeed = -6;
            hspeed = -1 + random(2);
        }
        slidetimer = -3;
    }
    slidetimer += 1;
    if (slidetimer >= 1)
    {
        slidetimer = -3;
    }
    if (move_lr_enabled)
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
        solidcheck = 0;
        with (1198)
        {
            if (place_meeting(x, y + 20, 1181))
            {
                solidcheck = 1;
            }
        }
        if (solidcheck == 1)
        {
            instant_end_sliding = 1;
        }
    }
}
