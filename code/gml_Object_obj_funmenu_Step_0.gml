if (!menudisappear)
{
    funalpha = lerp(funalpha, 1, 0.25);
}
else
{
    funalpha = lerp(funalpha, 0, 0.25);
}
for (var i = 0; i < array_length(colors); i++)
{
    if (selected == i)
    {
        colors[i] = lerp(colors[i], 255, 0.5);
    }
    else
    {
        colors[i] = lerp(colors[i], 0, 0.5);
    }
}
if (menudisappear && funalpha < 0.1)
{
    obj_onlinemenu.pressed = 0;
    instance_destroy();
}
if (minigameselected)
{
    minigameframe += minigamespeed;
}
if (menudisappear || lock)
{
    exit;
}
if (selected < (array_length(modes) - 1) && right_p())
{
    selected += 1;
    snd_play(535);
}
else if (selected > -1 && left_p())
{
    selected -= 1;
    snd_play(535);
}
if (button2_p())
{
    menudisappear = 1;
    snd_play(420);
}
if (button1_p())
{
    switch (selected)
    {
        case -1:
            menudisappear = 1;
            snd_play(420);
            break;
        case 0:
            if (!minigameselected && !global.pvpstarted)
            {
                minigameselected = 1;
                lock = 1;
                alarm[0] = 45;
                alarm[1] = 37;
                snd_play(520);
            }
            else
            {
                snd_play(406);
                scr_notificationsend(5, "");
            }
            break;
        case 1:
            rnd = irandom_range(0, 100);
            if (rnd >= 96 && !global.mysteryhello)
            {
                mysteryman();
            }
            else
            {
                snd_play(406);
            }
            break;
    }
}
