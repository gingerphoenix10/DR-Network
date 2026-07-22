if (!instance_exists(obj_time))
{
    scr_input_manager_process();
}
if (global.is_console)
{
    if (global.savedata_async_id >= 0)
    {
        exit;
    }
    if (!variable_global_exists("chapter"))
    {
        exit;
    }
    if (!textures_loaded)
    {
        textures_loaded = loadtex.loaded;
    }
    if (textures_loaded)
    {
        show_debug_message_concat("TEXTURES LOADED");
    }
    else
    {
        exit;
    }
}
var CH = string(global.chapter);
if (audio_group_is_loaded(1) && (ONLINE_DEBUG() || acceptWarning) )
{
    roomchoice = PLACE_CONTACT;
    menu_go = 0;
    if (scr_chapter_save_file_exists(global.chapter) || ossafe_file_exists("dr.ini"))
    {
        menu_go = 1;
    }
    if (scr_completed_chapter_any_slot(global.chapter))
    {
        menu_go = 2;
    }
    if (scr_debug())
    {
        menu_go = 3;
    }
    if (menu_go == 0 || menu_go == 1)
    {
        if (global.is_console)
        {
            global.screen_border_alpha = 0;
        }
        roomchoice = room_intro_ch5;
    }
    if (menu_go == 2)
    {
        if (global.is_console)
        {
            global.screen_border_alpha = 1;
        }
        scr_windowcaption("DELTARUNE");
        global.tempflag[10] = 1;
        roomchoice = room_legend;
        global.plot = 0;
    }
    if (menu_go == 3)
    {
        if (global.is_console)
        {
            global.screen_border_alpha = 0;
        }
        roomchoice = room_title_placeholder;
    }
    if (ONLINE_DEBUG())
    {
        roomchoice = PLACE_MENU;
    }
    room_goto(roomchoice);
} else if (audio_group_is_loaded(1) && global.is_console && !instance_exists(obj_unofficialwarning))
{
    instance_create(100, 200, obj_unofficialwarning);
    if (instance_exists(obj_prefetchtex))
        instance_destroy(obj_prefetchtex);
}