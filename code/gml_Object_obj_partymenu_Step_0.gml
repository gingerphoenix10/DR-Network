var partyobject = networkvarsget(1);
var playerid = networkvarsget(2);
var curdsmap = networkvarsget(4);
shaketext = lerp(shaketext, 0, 0.5);
if (done)
{
    partyalpha = lerp(partyalpha, 0, 0.25);
}
else
{
    partyalpha = lerp(partyalpha, 1, 0.25);
}
if (partyalpha <= 0.1 && done)
{
    obj_onlinemenu.pressed = 0;
    instance_destroy();
}
if (done)
{
    exit;
}
if (button2_p())
{
    var definelayer = 0;
    if (partyobject != -4)
    {
        if (partyobject.partystatus != -4)
        {
            definelayer = 1;
        }
    }
    if (partylayer > definelayer)
    {
        partylayer -= 1;
        selected = 0;
    }
    else
    {
        done = 1;
    }
    snd_play(420);
}
if (partyobject == -4 || global.playercount <= 1 || done)
{
    exit;
}
if (partyobject.partystatus != -4 && partylayer == 0)
{
    partylayer = 1;
}
else if (partyobject.partystatus == -4 && partylayer > 0)
{
    partylayer = 0;
}
switch (partylayer)
{
    case 0:
        if (button1_p() && partyobject.partystatus == -4)
        {
            partyobject.partystatus = playerid;
            partylayer += 1;
            snd_play(536);
        }
        break;
    case 1:
        if (selected < (array_length(buttons[partylayer]) - 1) && down_p())
        {
            selected += 1;
            snd_play(535);
        }
        else if (selected > 0 && up_p())
        {
            selected -= 1;
            snd_play(535);
        }
        if (button1_p())
        {
            if (selected == 0)
            {
                selected = 1;
                partylayer += 1;
                snd_play(536);
            }
            else if (selected == 1)
            {
                selected = 0;
                partyobject.partystatus = -4;
                partylayer = 0;
                snd_play(536);
            }
            else
            {
                done = 1;
                snd_play(420);
            }
        }
        break;
    case 2:
        var k = ds_map_find_first(curdsmap);
        var i = 0;
        playerarray = [];
        while (!is_undefined(k))
        {
            playerarray[i] = k;
            k = ds_map_find_next(curdsmap, k);
            i += 1;
        }
        var offsety = 0;
        for (i = 0; i < array_length(playerarray); i++)
        {
            offsetsy[i] = offsety;
            if (playerarray[i] != playerid)
            {
                offsety += 40;
            }
        }
        if (selected < (array_length(buttons[partylayer]) - 1) && right_p())
        {
            selected += 1;
            snd_play(535);
        }
        else if (selected > 0 && left_p())
        {
            selected -= 1;
            snd_play(535);
        }
        if (selectedplayer > (array_length(playerarray) - 1))
        {
            selectedplayer = array_length(playerarray) - 1;
        }
        if (selected == 1)
        {
            if (selectedplayer < (array_length(playerarray) - 1) && down_p())
            {
                selectedplayer += 1;
                ohuh = 0;
                if (playerarray[selectedplayer] == playerid)
                {
                    if (selectedplayer < (array_length(playerarray) - 1))
                    {
                        selectedplayer += 1;
                        ohuh = 1;
                    }
                    else
                    {
                        selectedplayer -= 1;
                    }
                }
                snd_play(535);
            }
            else if (selectedplayer > 0 && up_p())
            {
                selectedplayer -= 1;
                ohuh = 0;
                if (playerarray[selectedplayer] == playerid)
                {
                    if (selectedplayer > 0)
                    {
                        selectedplayer -= 1;
                    }
                    else
                    {
                        selectedplayer += 1;
                    }
                }
                snd_play(535);
            }
        }
        if (playerarray[selectedplayer] == playerid)
        {
            if (selectedplayer > 0)
            {
                selectedplayer -= 1;
            }
            else
            {
                selectedplayer += 1;
            }
        }
        var selplayerdata = getpartyinfo(playerarray[selectedplayer]);
        if (button1_p())
        {
            switch (selected)
            {
                case 0:
                    if (selplayerdata.partystatus == -4)
                    {
                        partyobject.partyinvite = playerarray[selectedplayer];
                        partyobject.alarm[0] = 30;
                        snd_play(536);
                    }
                    else
                    {
                        snd_play(440);
                        shaketext = 15;
                    }
                    break;
                case 2:
                    partylayer -= 1;
                    selected = 0;
                    snd_play(420);
                    break;
            }
        }
        break;
}
