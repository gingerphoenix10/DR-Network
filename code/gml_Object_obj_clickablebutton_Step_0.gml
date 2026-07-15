switch (type)
{
    case 0:
        text = "Reset IP";
        
        if (networkvarsget(1) == -4)
            lock = 0;
        else
            lock = 1;
        
        break;
    
    case 1:
        text = "Reset Port";
        
        if (networkvarsget(1) == -4)
            lock = 0;
        else
            lock = 1;
        
        break;
}

if (obj_realonlinemenu.menudisappear)
    exit;

if (!lock)
{
    if (position_meeting(mouse_x, mouse_y, id))
    {
        image_blend = c_yellow;
        hovered = 1;
        
        if (mouse_check_button_pressed(mb_left))
        {
            switch (type)
            {
                case 0:
                    for (var i = 0; i < instance_number(obj_changingline); i++)
                    {
                        var curline = instance_find(obj_changingline, i);
                        
                        if (curline.linetype == 1)
                            curline.nevertouched = 1;
                    }
                    
                    global.ip = "127.0.0.1";
                    break;
                
                case 1:
                    for (var i = 0; i < instance_number(obj_changingline); i++)
                    {
                        var curline = instance_find(obj_changingline, i);
                        
                        if (curline.linetype == 2)
                            curline.nevertouched = 1;
                    }
                    
                    global.port = "7676";
                    break;
            }
        }
    }
    else
    {
        hovered = 0;
        image_blend = c_white;
    }
}
else
{
    image_blend = c_gray;
}
