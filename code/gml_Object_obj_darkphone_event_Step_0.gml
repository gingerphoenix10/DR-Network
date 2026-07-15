if (con == 0)
{
    con = 1;
    alarm[4] = 40;
}
if (con == 1)
{
    global.interact = 1;
}
if (con == 2)
{
    sndplay = 0;
    if (snd_is_playing(global.currentsong[1]))
    {
        sndplay = 1;
        snd_pause(global.currentsong[1]);
    }
    snd_play(304);
    con = 3;
    alarm[4] = 200;
}
if (con == 4)
{
    with (400)
    {
        instance_destroy();
    }
    with (1176)
    {
        instance_destroy();
    }
    con = 7;
}
if (con == 7)
{
    snd_stop(304);
    if (sndplay == 1)
    {
        snd_resume(global.currentsong[1]);
    }
    if (mysterycheck())
    {
        global.msg[0] = stringsetloc("* It's nothing but garbage noise./%", "obj_darkphone_event_slash_Step_0_gml_42_0");
    }
    else
    {
        global.msg[0] = "* .../";
        global.msg[1] = "* Doctor?/%";
    }
    instance_create(0, 0, 400);
    con = 5;
    global.interact = 6;
    instance_destroy();
}
