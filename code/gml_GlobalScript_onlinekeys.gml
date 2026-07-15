function onlinekeys()
{
    global.key_online = keyboard_check_pressed(ord(global.key_online_setting));
    global.key_lostlevels = keyboard_check_pressed(ord(global.key_lostlevels_setting));
    global.key_chat = keyboard_check_pressed(ord(global.key_chat_setting));
    
    if (keyboard_key >= ord("0") && keyboard_key <= ord("9"))
        scr_playemote(real(chr(keyboard_key)));
    
    var alwaysfalse = false;
    
    if (!ONLINE_DEBUG() && alwaysfalse)
        exit;
    
    var chromebook_mode = true;
    
    if ((keyboard_check_pressed(vk_f3) && !chromebook_mode) || (keyboard_check_pressed(ord("P")) && chromebook_mode))
    {
        var roomnum = get_integer("Go to room", room);
        
        if (roomnum != undefined)
        {
            room_goto(roomnum);
            global.interact = 0;
            
            if (instance_exists(obj_mainchara))
                obj_mainchara.freeze = 0;
        }
    }
}
