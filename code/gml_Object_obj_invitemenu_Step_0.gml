var partyobject = networkvarsget(1);
var curdslist = networkvarsget(3);
var curdsmap = networkvarsget(4);
var playerid = networkvarsget(2);

if (playerid == -4)
    exit;

if (selected < (array_length(buttons) - 1) && down_p())
{
    selected += 1;
    snd_play(snd_menumove);
}
else if (selected > 0 && up_p())
{
    selected -= 1;
    snd_play(snd_menumove);
}

if (button1_p())
{
    switch (selected)
    {
        case 0:
            partyobject.declinerequest = 1;
            partyobject.alarm[0] = 30;
            global.interact = 0;
            instance_destroy();
            break;
        
        case 1:
            partyobject.partystatus = inviter;
            global.interact = 0;
            instance_destroy();
            break;
    }
}
