if (ready)
{
    dresalpha = lerp(dresalpha, 0, 0.2);
}
else
{
    dresalpha = lerp(dresalpha, 1, 0.2);
}
offsetanimx = lerp(offsetanimx, offsets[chosencharacter], 0.25);
if (dresalpha <= 0.1 && ready)
{
    instance_destroy();
    obj_onlinemenu.pressed = 0;
}
floatycool = 5 * sin(current_time / 300);
shakey = 5 * sin(current_time / 500);
if (!ready)
{
    if (left_p() && chosencharacter > 0)
    {
        chosencharacter -= 1;
        global.character = characters[chosencharacter][0];
        with (1198)
        {
            scr_characterspr();
        }
        snd_play(535);
    }
    else if (right_p() && chosencharacter < (array_length(characters) - 1))
    {
        chosencharacter += 1;
        global.character = characters[chosencharacter][0];
        with (1198)
        {
            scr_characterspr();
        }
        snd_play(535);
    }
}
if (button1_p() && !ready)
{
    snd_play(536);
    onlineinfoupdate();
    ready = 1;
}
for (var i = 0; i < array_length(colors); i++)
{
    if (chosencharacter == i)
    {
        colors[i] = lerp(colors[i], 255, 0.5);
    }
    else
    {
        colors[i] = lerp(colors[i], 0, 0.5);
    }
}
