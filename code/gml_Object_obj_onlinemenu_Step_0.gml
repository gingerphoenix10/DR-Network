if (!menudisappear && !instance_exists(obj_onlineconfig) && !instance_exists(obj_dresser) && !instance_exists(obj_partymenu) && !instance_exists(obj_funmenu) && !instance_exists(obj_realonlinemenu))
    boxoffset = lerp(boxoffset, 0, 0.25);
else
    boxoffset = lerp(boxoffset, -500, 0.25);

hearty = lerp(hearty, offsetsy[selected], 0.5);

if (!pressed)
{
    if (selected < (array_length(text) - 1) && down_p())
    {
        selected += 1;
        snd_play(snd_menumove);
    }
    else if (selected > 0 && up_p())
    {
        selected -= 1;
        snd_play(snd_menumove);
    }
    
    heartangle = lerp(heartangle, 0, 0.5);
    heartoffy = lerp(heartoffy, 0, 0.5);
}
else
{
    heartangle = lerp(heartangle, 90, 0.5);
    heartoffy = lerp(heartoffy, 18, 0.5);
}

if (button1_p() && !pressed)
{
    presseffect[selected] = 3.2;
    
    switch (selected)
    {
        case 0:
            pressed = 1;
            snd_play(snd_select);
            instance_create(x, y, obj_onlineconfig);
            break;
        
        case 1:
            pressed = 1;
            snd_play(snd_select);
            instance_create(x, y, obj_realonlinemenu);
            break;
        
        case 2:
            if (networkvarsget(1) != -4)
            {
                pressed = 1;
                snd_play(snd_select);
                instance_create(x, y, obj_funmenu);
            }
            
            break;
        
        case 3:
            pressed = 1;
            snd_play(snd_select);
            instance_create(x, y, obj_dresser);
            break;
        
        case 4:
            pressed = 1;
            snd_play(snd_select);
            instance_create(x, y, obj_partymenu);
            break;
        
        case 5:
            pressed = 1;
            snd_play(snd_select);
            menudisappear = 1;
            global.interact = 0;
            
            with (obj_mainchara)
            {
                threebuffer = 2;
                twobuffer = 2;
            }
            
            break;
    }
}

if ((global.key_online || button2_p() || (button1_p() && done)) && (!pressed || done))
{
    pressed = 1;
    menudisappear = 1;
    global.interact = 0;
    
    with (obj_mainchara)
    {
        threebuffer = 2;
        twobuffer = 2;
    }
}

if (menudisappear && boxoffset < -200)
    instance_destroy();
