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
if (global.suzyfound)
{
    instance_destroy();
}
if (read > 0 && !instance_exists(400))
{
    snd_pause(global.currentsong[1]);
    global.suzyfound = 1;
    snd_play(776, 1, 0.5);
    instance_destroy();
}
