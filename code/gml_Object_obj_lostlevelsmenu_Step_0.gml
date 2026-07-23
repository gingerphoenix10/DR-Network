if (!menudisappear)
    lostalpha = lerp(lostalpha, 1, 0.25);
else
    lostalpha = lerp(lostalpha, 0, 0.25);

var loststart = 0;
var selectedarray = lostlevels;

if (!buttonlock)
{
    switch (lostlayer)
    {
        case 0:
            loststart = 0;
            selectedarray = lostlevels;
            break;
        
        case 1:
            loststart = 2;
            selectedarray = lostlevels[selectedtopic];
            break;
    }
}

if (selected < (array_length(selectedarray) - 1) && down_p())
{
    selected += 1;
    snd_play(snd_menumove);
}
else if (selected > loststart && up_p())
{
    selected -= 1;
    snd_play(snd_menumove);
}

if (button1_p() && !buttonlock)
{
    switch (lostlayer)
    {
        case 0:
            selectedtopic = selected;
            lostlayer += 1;
            selected = 2;
            snd_play(snd_select);
            break;
        
        case 1:
            buttonlock = 1;
            instance_create(0, 0, obj_fadeout);
            alarm[0] = 8;
            event_user(8);
            snd_play(snd_select);
            break;
    }
}

if ((global.key_lostlevels || button2_p()) && !buttonlock)
{
    if (lostlayer > 0)
    {
        selectedtopic = 0;
        selected = 0;
        lostlayer -= 1;
        snd_play(snd_smallswing);
    }
    else
    {
        menudisappear = 1;
        buttonlock = 1;
        global.interact = 0;
        
        with (obj_mainchara)
        {
            threebuffer = 2;
            twobuffer = 2;
        }
    }
}

if (menudisappear && lostalpha < 0.1)
    instance_destroy();
