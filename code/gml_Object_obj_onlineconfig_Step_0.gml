settings = [[["Online Menu: ", global.key_online_setting], ["Lost Levels Menu: ", global.key_lostlevels_setting], ["Chat: ", global.key_chat_setting], ["Back", global.blank]], [["Max Players: ", global.maxplayercount], ["Back", global.blank]], [["Show players nicknames: ", global.shownicknames], ["Show your nickname: ", global.showyournickname], ["Show companions: ", global.showcompanions], ["Show players in cutscenes: ", global.cutsceneplayers], ["Show temporary chat messages: ", global.showchatmessages], ["Narrate chat: ", global.narratechat], ["Unlock Chapter 5 Characters: ", global.unlockchapter5], ["Back", global.blank]], [["Enable Lost Levels: ", global.lostlevels], ["Connect Timeout: " + string(global.connecttimeout / 1000) + " second(s)", global.blank], ["Show buffer errors: ", global.debugerrors], ["Back", global.blank]], [["(WIP) Always follow party creator: ", global.followparty], ["Back", global.blank]]];

if (savedata)
    onlineinfoupdate();

if (!menudisappear)
    configalpha = lerp(configalpha, 1, 0.25);
else
    configalpha = lerp(configalpha, 0, 0.25);

if (settinglayer == array_length(settings))
{
    if (button2_p())
    {
        selected = settinglayer;
        settinglayer = -1;
        hearty = offsetsy[array_length(topics) - 1 - selected];
        snd_play(snd_smallswing);
    }
    
    exit;
}

if (settinglayer < 0)
    hearty = lerp(hearty, offsetsy[array_length(topics) - 1 - selected], 0.5);
else
    hearty = lerp(hearty, 40 * selected, 0.5);

var currenthingy = topics;

if (settinglayer >= 0)
    currenthingy = settings[settinglayer];

lockbuttons = 0;

if (changemode)
{
    pressed = 1;
    
    switch (settinglayer)
    {
        case 0:
            if (string_length(keyboard_string) > 0)
            {
                switch (selected)
                {
                    case 0:
                        if (acceptableord(keyboard_string))
                            global.key_online_setting = string_upper(string_char_at(keyboard_string, 0));
                        
                        break;
                    
                    case 1:
                        if (acceptableord(keyboard_string))
                            global.key_lostlevels_setting = string_upper(string_char_at(keyboard_string, 0));
                        
                        break;
                    
                    case 2:
                        if (acceptableord(keyboard_string))
                            global.key_chat_setting = string_upper(string_char_at(keyboard_string, 0));
                        
                        break;
                }
                
                alarm[0] = 3;
                changemode = 0;
            }
            
            break;
        
        case 1:
            var minnum = 2;
            var maxnum = 100;
            
            if (left_p())
            {
                if (global.maxplayercount > minnum)
                    global.maxplayercount -= 1;
            }
            
            if (right_p())
            {
                if (global.maxplayercount < maxnum)
                    global.maxplayercount += 1;
            }
            
            if (button1_p())
            {
                alarm[0] = 3;
                changemode = 0;
                snd_play(snd_select);
            }
            
            break;
        
        case 3:
            var minnum = 1000;
            var maxnum = 15000;
            
            if (left_p())
            {
                if (global.connecttimeout > minnum)
                    global.connecttimeout -= 1000;
            }
            
            if (right_p())
            {
                if (global.connecttimeout < maxnum)
                    global.connecttimeout += 1000;
            }
            
            if (button1_p())
            {
                alarm[0] = 3;
                changemode = 0;
                snd_play(snd_select);
            }
            
            break;
    }
}

for (var i = 0; i < instance_number(obj_changingline); i++)
{
    var curline = instance_find(obj_changingline, i);
    
    if (curline.changemode)
        lockbuttons = 1;
}

if (!pressed && !lockbuttons)
{
    if (selected < (array_length(currenthingy) - 1) && down_p())
    {
        selected += 1;
        snd_play(snd_menumove);
    }
    else if (selected > 0 && up_p())
    {
        selected -= 1;
        snd_play(snd_menumove);
    }
}

if (button1_p() && settinglayer < 0 && !lockbuttons && !pressed && !((instance_exists(obj_server) || instance_exists(obj_client)) && selected == 1))
{
    if (selected != (array_length(currenthingy) - 1))
    {
        settinglayer = selected;
        hearty = 0;
        selected = 0;
        snd_play(snd_select);
    }
    else
    {
        pressed = 1;
        menudisappear = 1;
        savedata = 1;
        snd_play(snd_smallswing);
    }
}
else if (button1_p() && settinglayer >= 0 && !lockbuttons && !pressed)
{
    if (selected != (array_length(currenthingy) - 1))
    {
        switch (settinglayer)
        {
            case 0:
                keyboard_string = "";
                changemode = 1;
                break;
            
            case 1:
                changemode = 1;
                break;
            
            case 2:
                switch (selected)
                {
                    case 0:
                        if (global.shownicknames)
                            global.shownicknames = 0;
                        else
                            global.shownicknames = 1;
                        
                        break;
                    
                    case 1:
                        if (global.showyournickname)
                            global.showyournickname = 0;
                        else
                            global.showyournickname = 1;
                        
                        break;
                    
                    case 2:
                        if (global.showcompanions)
                            global.showcompanions = 0;
                        else
                            global.showcompanions = 1;
                        
                        break;
                    
                    case 3:
                        if (global.cutsceneplayers)
                            global.cutsceneplayers = 0;
                        else
                            global.cutsceneplayers = 1;
                        
                        break;
                    
                    case 4:
                        if (global.showchatmessages)
                            global.showchatmessages = 0;
                        else
                            global.showchatmessages = 1;
                        
                        break;
                    
                    case 5:
                        if (global.narratechat)
                            global.narratechat = 0;
                        else
                            global.narratechat = 1;
                        
                        break;
                    
                    case 6:
                        if (global.unlockchapter5)
                            global.unlockchapter5 = 0;
                        else
                            global.unlockchapter5 = 1;
                        
                        break;
                }
                
                break;
            
            case 3:
                switch (selected)
                {
                    case 0:
                        if (global.lostlevels)
                            global.lostlevels = 0;
                        else
                            global.lostlevels = 1;
                        
                        break;
                    
                    case 1:
                        changemode = 1;
                        break;
                    
                    case 2:
                        if (global.debugerrors)
                            global.debugerrors = 0;
                        else
                            global.debugerrors = 1;
                        
                        break;
                }
                
                break;
            
            case 4:
                switch (selected)
                {
                    case 0:
                        if (global.followparty)
                            global.followparty = 0;
                        else
                            global.followparty = 1;
                        
                        break;
                }
                
                break;
        }
        
        snd_play(snd_select);
    }
    else
    {
        selected = settinglayer;
        settinglayer = -1;
        hearty = offsetsy[array_length(topics) - 1 - selected];
        snd_play(snd_smallswing);
    }
}

if (button2_p() && !lockbuttons && !pressed)
{
    if (settinglayer >= 0)
    {
        selected = settinglayer;
        settinglayer = -1;
        hearty = offsetsy[array_length(topics) - 1 - selected];
    }
    else
    {
        pressed = 1;
        menudisappear = 1;
        savedata = 1;
    }
    
    snd_play(snd_smallswing);
}

if (menudisappear && configalpha < 0.1)
{
    obj_onlinemenu.pressed = 0;
    instance_destroy(obj_changingline);
    instance_destroy();
}
