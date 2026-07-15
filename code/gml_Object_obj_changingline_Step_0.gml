var respobject = 1579;

if (instance_exists(obj_onlineconfig))
{
    if (obj_onlineconfig.settinglayer >= 0 || obj_onlineconfig.menudisappear)
    {
        changemode = 0;
        image_blend = c_white;
        exit;
    }
}
else if (instance_exists(obj_realonlinemenu))
{
    respobject = 1589;
    
    if (obj_realonlinemenu.menudisappear)
    {
        changemode = 0;
        image_blend = c_white;
        exit;
    }
}

if (nevertouched)
{
    switch (linetype)
    {
        case 0:
            linewidth = 75;
            maxsymbols = 15;
            text = "NICKNAME:";
            changabletext = global.playernickname;
            break;
        
        case 1:
            linewidth = 100;
            maxsymbols = 30;
            text = "IP:";
            changabletext = global.ip;
            break;
        
        case 2:
            linewidth = 50;
            maxsymbols = 5;
            text = "PORT:";
            changabletext = global.port;
            break;
    }
}

switch (linetype)
{
    case 0:
        global.playernickname = changabletext;
        break;
    
    case 1:
        global.ip = changabletext;
        break;
    
    case 2:
        global.port = changabletext;
        break;
}

if (instance_exists(obj_server) || instance_exists(obj_client))
    lockline = 1;
else
    lockline = 0;

if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter))
{
    if (position_meeting(mouse_x, mouse_y, id))
    {
        if (changemode)
        {
            image_blend = c_white;
            changemode = 0;
            
            if (acceptableline(linetype, changabletext) == false)
                changabletext = lasttext;
        }
        else if (!lockline)
        {
            image_blend = c_yellow;
            lasttext = changabletext;
            keyboard_string = changabletext;
            changemode = 1;
            nevertouched = 0;
        }
    }
    else
    {
        image_blend = c_white;
        changemode = 0;
        
        if (acceptableline(linetype, changabletext) == false)
            changabletext = lasttext;
    }
}

if (changemode)
{
    if (string_length(keyboard_string) <= maxsymbols)
    {
        changabletext = keyboard_string;
        
        if (string_pos("gaster", string_lower(keyboard_string)))
            game_end();
    }
    else
    {
        keyboard_string = changabletext;
    }
}
