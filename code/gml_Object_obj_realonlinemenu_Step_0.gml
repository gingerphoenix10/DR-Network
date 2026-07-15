lockbuttons = 0;
hearty = lerp(hearty, offsetsy[array_length(buttons) - 1 - selected], 0.5);

if (savedata)
    onlineinfoupdate();

if (menudisappear && configalpha < 0.1)
{
    obj_onlinemenu.pressed = 0;
    instance_destroy(obj_changingline);
    instance_destroy(obj_clickablebutton);
    instance_destroy();
}

if (!menudisappear)
    configalpha = lerp(configalpha, 1, 0.25);
else
    configalpha = lerp(configalpha, 0, 0.25);

for (var i = 0; i < instance_number(obj_changingline); i++)
{
    var curline = instance_find(obj_changingline, i);
    
    if (curline.changemode)
        lockbuttons = 1;
}

if (!pushed)
{
    heartangle = lerp(heartangle, 0, 0.5);
    heartoffy = lerp(heartoffy, 0, 0.5);
    color = c_yellow;
    buttons = ["Create Server", "Join a Server", "Disconnect", "Join Official Server", "Back"];
}
else
{
    heartangle = lerp(heartangle, 90, 0.5);
    heartoffy = lerp(heartoffy, 18, 0.5);
}

if (menudisappear || lockbuttons)
    exit;

if (selected < (array_length(buttons) - 1) && down_p())
{
    pushed = 0;
    selected += 1;
    snd_play(snd_menumove);
}
else if (selected > 0 && up_p())
{
    pushed = 0;
    selected -= 1;
    snd_play(snd_menumove);
}

if (button2_p())
{
    menudisappear = 1;
    savedata = 1;
    snd_play(snd_smallswing);
}

if (button1_p())
{
    presseffect[selected] = 4;
    
    switch (selected)
    {
        case 0:
            if (!instance_exists(obj_server) && !instance_exists(obj_client))
            {
                buttons[selected] = "You hosted a Server";
                instance_create(x, y, obj_server);
                color = c_orange;
                pushed = 1;
                snd_play(snd_save, 1, 0.75);
            }
            
            break;
        
        case 1:
            if (!instance_exists(obj_server) && !instance_exists(obj_client))
            {
                buttons[selected] = "You joined a Server";
                instance_create(x, y, obj_client);
                color = c_aqua;
                pushed = 1;
                snd_play(snd_save, 1, 0.75);
            }
            
            break;
        
        case 2:
            if (networkvarsget(1) != -4)
            {
                buttons[selected] = "You left a Server";
                instance_destroy(networkvarsget(1));
                color = c_red;
                pushed = 1;
                snd_play(snd_save, 1, 0.5);
            }
            
            break;
        
        case 3:
            if (!instance_exists(obj_server) && !instance_exists(obj_client))
            {
                global.goingpublic = 1;
                buttons[selected] = "You joined a Server";
                instance_create(x, y, obj_client);
                color = c_aqua;
                pushed = 1;
                snd_play(snd_save, 1, 0.75);
            }
            
            break;
        
        case 4:
            buttons[selected] = "See ya";
            menudisappear = 1;
            savedata = 1;
            pushed = 1;
            snd_play(snd_smallswing);
            break;
    }
}
