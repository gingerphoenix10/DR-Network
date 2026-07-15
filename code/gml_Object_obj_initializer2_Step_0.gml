if (!instance_exists(1645))
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
if (audio_group_is_loaded(1))
{
    roomchoice = 12;
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
        roomchoice = 247;
    }
    if (menu_go == 2)
    {
        if (global.is_console)
        {
            global.screen_border_alpha = 1;
        }
        scr_windowcaption("DELTARUNE");
        global.tempflag[10] = 1;
        roomchoice = 67;
        global.plot = 0;
    }
    if (menu_go == 3)
    {
        if (global.is_console)
        {
            global.screen_border_alpha = 0;
        }
        roomchoice = 246;
    }
    if (ONLINE_DEBUG())
    {
        roomchoice = 75;
    }
    room_goto(roomchoice);
}
