if (!battleinitiated)
{
    if (battleanim == 2)
    {
        var heartdestx = 22;
        var heartdesty = 228;
        var heartspeed = 8;
        
        if (heartx < heartdestx)
            heartx += heartspeed;
        else if (heartx > heartdestx)
            heartx -= heartspeed;
        
        if (hearty < heartdesty)
            hearty += heartspeed;
        else if (hearty > heartdesty)
            hearty -= heartspeed;
        
        if (point_distance(heartx, hearty, heartdestx, heartdesty) < heartspeed)
        {
            battleanim = 0;
            battlesong = snd_loop(songfile);
            battleinitiated = 1;
        }
    }
    
    exit;
}
else if (alpha < 1)
{
    alpha += 0.2;
}

if (onebuffer > 0)
    onebuffer -= 1;

if (twobuffer > 0)
    twobuffer -= 1;

if (battleturn > 0)
{
    actualboxsizex = lerp(actualboxsizex, presets[1], 0.25);
    move1 = right_h() - left_h();
    move2 = down_h() - up_h();
    hsp = move1 * movespeed;
    vsp = move2 * movespeed;
    fakex += hsp;
    fakey += vsp;
    
    if (fakex > ((presets[1] / 2) - 13))
        fakex = (presets[1] / 2) - 13;
    
    if (fakey > ((presets[1] / 2) - 13))
        fakey = (presets[1] / 2) - 13;
    
    if (fakex < -((presets[1] / 2) - 13))
        fakex = -((presets[1] / 2) - 13);
    
    if (fakey < -((presets[1] / 2) - 13))
        fakey = -((presets[1] / 2) - 13);
    
    if (battleturn == 1)
    {
        battleturn = 2;
        alarm[0] = 75;
    }
}
else
{
    actualboxsizex = lerp(actualboxsizex, presets[0], 0.25);
    fakex = 0;
    fakey = 0;
}

if (characters < message_length && counter == 0 && layerchoice == 0)
{
    characters += increase;
    
    if (characters > message_length)
        characters = message_length;
    
    message_draw = string_copy(message, 0, characters);
    current_char = string_char_at(message_draw, characters);
    var wtf = snd_fnt_default;
    
    if (current_char != " " && battleturn == 0)
        snd_play(wtf);
}

if (layerchoice > 0)
{
    characters = 0;
    message_draw = "";
    counter = 0;
}

if (characters > 0 && characters < message_length && layerchoice == 0)
{
    current_char = string_char_at(message_draw, characters);
    counter_max = 1;
    counter += 1;
    
    if (counter >= counter_max)
        counter = 0;
}
else if (characters == message_length && button1_p() && onebuffer == 0 && act != 0)
{
    if (act == 1)
    {
        message = nextmessage;
        message_length = string_length(message);
        characters = 0;
        message_draw = "";
        counter = 0;
        battleturn = 1;
    }
    else
    {
        message = sparemessage;
        message_length = string_length(message);
        characters = 0;
        message_draw = "";
        counter = 0;
        
        if (spare == 0)
        {
            spare = 1;
        }
        else if (spare == 1)
        {
            spare = 2;
            snd_stop(battlesong);
            snd_free(songfile);
            message = sparemessage2;
            message_length = string_length(message);
        }
        else if (spare == 2)
        {
            snd_resume(global.currentsong[1]);
            instance_destroy();
            global.interact = 0;
            instance_create(0, 0, obj_fadein);
        }
    }
}

if (battleturn == 0)
    actualboxsizex = lerp(actualboxsizex, presets[0], 0.25);
else
    actualboxsizex = lerp(actualboxsizex, presets[1], 0.25);

if ((right_p() || left_p()) && layerchoice == 0 && act == 0 && battleturn == 0)
{
    if (right_p())
    {
        if (choice < (array_length(buttonsorder) - 1))
            choice += 1;
        else
            choice = 0;
    }
    else if (left_p())
    {
        if (choice > 0)
            choice -= 1;
        else
            choice = array_length(buttonsorder) - 1;
    }
    
    snd_play(snd_menumove);
}

if (button1_p() && act == 0 && onebuffer == 0 && battleturn == 0)
{
    switch (choice)
    {
        default:
            snd_play(snd_splat);
            buttonsorder[choice] = spr_booked_act;
            break;
        
        case 1:
            if (layerchoice < 2)
            {
                layerchoice += 1;
                snd_play(snd_select);
            }
            else if (choicelayer == 0)
            {
                layerchoice = 0;
                choicelayer = 0;
                message = checkmessage;
                message_length = string_length(message);
                act = 1;
                snd_play(snd_select);
            }
            else
            {
                layerchoice = 0;
                choicelayer = 0;
                message = sparemessage0;
                message_length = string_length(message);
                act = 2;
                snd_play(snd_select);
            }
            
            break;
    }
}

if (button2_p() && battleturn == 0 && twobuffer == 0)
{
    if (layerchoice >= 1)
    {
        twobuffer = 3;
        layerchoice -= 1;
        choicelayer = 0;
    }
}

if (button2_p() && twobuffer == 0 && layerchoice == 0)
{
    characters = message_length;
    message_draw = string_copy(message, 0, characters);
    current_char = string_char_at(message_draw, characters);
    twobuffer = 3;
}

if (layerchoice == 2 && battleturn == 0)
{
    switch (choice)
    {
        case 1:
            if (down_p())
            {
                if (choicelayer < 1)
                    choicelayer += 1;
                else
                    choicelayer = 0;
                
                snd_play(snd_menumove);
            }
            else if (up_p())
            {
                if (choicelayer > 0)
                    choicelayer -= 1;
                else
                    choicelayer = 1;
                
                snd_play(snd_menumove);
            }
            
            break;
    }
}
