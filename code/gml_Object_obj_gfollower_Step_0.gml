if (gfollowertype == 0)
{
    if (global.mysteryflag[0])
    {
        isg = 1;
    }
}
else if (gfollowertype == 2)
{
    if (global.bookfound)
    {
        isg = 1;
    }
}
else if (gfollowertype == 3)
{
    if (global.suzyfound)
    {
        isg = 1;
    }
}
if (!isg)
{
    if (!instance_exists(400))
    {
        sprite_index = spr_idle;
    }
    else
    {
        sprite_index = spr_talk;
    }
}
else if (!instance_exists(400) && talked)
{
    snd_play(764);
    instance_destroy();
    snd_resume(global.currentsong[1]);
    global.mysteryflag[gfollowertype + 1] = 1;
}
else if (!instance_exists(400))
{
    sprite_index = spr_idleg;
}
else
{
    sprite_index = spr_talkg;
}
if (normalanim == 1)
{
    if (myinteract > 0 && instance_exists(1176))
    {
        if (obj_writer.halt > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
        if (obj_writer.halt == 0)
        {
            image_speed = remanimspeed;
        }
    }
}
if (normalanim == 1 || normalanim == 2)
{
    if (myinteract == 0)
    {
        image_index = 0;
        image_speed = 0;
    }
}
if (myinteract == 3)
{
    if (!d_ex())
    {
        global.interact = 0;
        myinteract = 0;
        with (1198)
        {
            onebuffer = 3;
        }
    }
}
