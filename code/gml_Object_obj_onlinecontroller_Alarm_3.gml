if (sndfnttimes < sndfntmaxtimes)
{
    sndfnttimes += 1;
    if (global.narratechat)
    {
        snd_play(sndfnt);
    }
    alarm[3] = 2;
}
