if (global.entrance == 0)
{
    global.start_in_platmode = true;
}
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("NPCs", 0);
con = 0;
timer = 0;
init = 0;
ascent_con = 0;
can_reset = false;
draw_grayscale = false;
surf = -4;
killer_bullet = -4;
marker_manager = instance_create(0, 0, 1722);
PROGRESS_FLAG = 1844;
_INTRO_BIT = 0;
_SHURIKEN_BIT = 1;
_FREEWILL_BIT = 3;
_FALLBIT_1A = 16;
_FALLBIT_1B = 8;
_FALLBIT_2 = 9;
_FALLBIT_3A = 10;
_FALLBIT_3B = 11;
_FALLBIT_3C = 12;
_FALLBIT_4 = 13;
_CLEAR_BIT = 14;
if (scr_debug())
{
    if (global.tempflag[90] == 0.001)
    {
        global.tempflag[90] = 0;
        global.flag[PROGRESS_FLAG] = 0;
        global.facing = 1;
        global.start_in_platmode = false;
        with (1198)
        {
            setxy(12, 5716);
        }
        with (1389)
        {
            if (name == "susie")
            {
                setxy(obj_mainchara.x - 6, obj_mainchara.y - 16);
            }
            else
            {
                setxy(obj_mainchara.x - 2, obj_mainchara.y - 12);
            }
            scr_caterpillar_interpolate(name);
        }
    }
    if (keyboard_check(80))
    {
        global.tempflag[90] = 0.002;
    }
    if (global.tempflag[90] == 0.002)
    {
        global.tempflag[90] = 0;
        scr_flag_set_ext(PROGRESS_FLAG, _FREEWILL_BIT, 0, 2);
        global.start_in_platmode = true;
    }
    if (global.tempflag[90] == 0.003)
    {
        global.tempflag[90] = 0;
        global.flag[PROGRESS_FLAG] = 0;
        scr_flag_set_ext(PROGRESS_FLAG, _FREEWILL_BIT, 1, 2);
        global.facing = 1;
        global.start_in_platmode = false;
        with (1198)
        {
            setxy(12, 5716);
        }
        with (1389)
        {
            if (name == "susie")
            {
                setxy(obj_mainchara.x - 6, obj_mainchara.y - 16);
            }
            else
            {
                setxy(obj_mainchara.x - 2, obj_mainchara.y - 12);
            }
            scr_caterpillar_interpolate(name);
        }
    }
    if (global.tempflag[90] == 0.004)
    {
        global.tempflag[90] = 0;
        global.start_in_platmode = true;
        scr_flag_set_ext(PROGRESS_FLAG, _FREEWILL_BIT, 3, 2);
    }
}

get_room_progress = function()
{
    if (scr_flag_get_ext(PROGRESS_FLAG, _CLEAR_BIT))
    {
        return 9;
    }
    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_4))
    {
        return 8;
    }
    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_3A))
    {
        return 5;
    }
    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_2))
    {
        return 3;
    }
    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_1A))
    {
        return 1;
    }
    return 0;
};

wallmarker = -4;
introcon = scr_flag_get_ext(PROGRESS_FLAG, _INTRO_BIT, 2);
shuricon = scr_flag_get_ext(PROGRESS_FLAG, _SHURIKEN_BIT, 3);
furthest_room_progress = get_room_progress();
current_room_progress = 0;
waiting_for_free_will_scene = false;
wants_to_reveal_wall = false;
failcounter = scr_flag_get_ext(PROGRESS_FLAG, _FREEWILL_BIT, 2);

failed_jump_loops = function()
{
    if (!d_plat_exists(0))
    {
        if (failcounter > 2)
        {
            if (current_room_progress >= furthest_room_progress && current_room_progress < 9)
            {
                if (current_room_progress >= 8)
                {
                    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_4) == 0)
                    {
                        scr_flag_set_ext(PROGRESS_FLAG, _FALLBIT_4, 1);
                        scr_speaker("susie");
                        msgsetsubloc(0, "\\Ek* Damn^1, close^1! Be ready to hit the flower^1, k^1, Kris?", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_89_0");
                        scr_anyface_next("ralsei", "1");
                        msgnextsubloc("\\E1* (Susie telling Kris what to do...)", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_91_0");
                        d_make_plat(0, 0);
                    }
                }
                else if (current_room_progress >= 5)
                {
                    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_3A) == 0)
                    {
                        scr_flag_set_ext(PROGRESS_FLAG, _FALLBIT_3A, 1);
                        scr_speaker("ralsei");
                        msgsetsubloc(0, "\\E2* We almost had it!", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_98_0");
                        scr_anyface_next("susie", "k");
                        msgnextsubloc("\\Ek* Next time^1, right^1, Kris?", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_100_0");
                        d_make_plat(0, 0);
                    }
                    else if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_3B) == 0)
                    {
                        scr_flag_set_ext(PROGRESS_FLAG, _FALLBIT_3B, 1);
                        scr_speaker("susie");
                        msgsetsubloc(0, "\\EK* I meant next next time.", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_105_0");
                        d_make_plat(0, 0);
                    }
                    else if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_3C) == 0)
                    {
                        scr_flag_set_ext(PROGRESS_FLAG, _FALLBIT_3C, 1);
                        var small_text = stringsetloc("Hey, shut up!", "obj_dw_fcastle_top_ascent_slash_Create_0_gml_110_0");
                        var sf = 
                        {
                            x: "mid",
                            y: "topmid"
                        };
                        if (global.lang == "ja")
                        {
                            sf = 
                            {
                                x: 224,
                                y: 12
                            };
                        }
                        scr_smallface(0, 35, 0, sf.x, sf.y, small_text);
                        scr_speaker("ralsei");
                        msgsetsubloc(0, "\\EG* She meant next next next time.\\f0", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_114_0");
                        d_make_plat(0, 0);
                    }
                }
                else if (current_room_progress >= 3)
                {
                    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_2) == 0)
                    {
                        scr_flag_set_ext(PROGRESS_FLAG, _FALLBIT_2, 1);
                        scr_speaker("ralsei");
                        msgsetsubloc(0, "\\E2* We got further that time!", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_122_0");
                        scr_anyface_next("susie", "9");
                        msgnextsubloc("\\E9* Yeah^1, should be a piece of cake!", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_124_0");
                        d_make_plat(0, 0);
                    }
                }
                else if (current_room_progress >= 1)
                {
                    if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_1A) == 0)
                    {
                        scr_flag_set_ext(PROGRESS_FLAG, _FALLBIT_1A, 1);
                        scr_speaker("susie");
                        msgsetsubloc(0, "\\Ek* Kris^1, you'll get it^1. Don't worry.", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_131_0");
                        d_make_plat(0, 0);
                    }
                    else if (scr_flag_get_ext(PROGRESS_FLAG, _FALLBIT_1B) == 0)
                    {
                        scr_flag_set_ext(PROGRESS_FLAG, _FALLBIT_1B, 1);
                        scr_speaker("ralsei");
                        msgsetsubloc(0, "\\E1* (Do it for Susie^1, Kris!)", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_136_0");
                        d_make_plat(0, 0);
                    }
                }
                furthest_room_progress = current_room_progress;
            }
        }
        else if (!waiting_for_free_will_scene)
        {
            failcounter++;
            if (failcounter == 1)
            {
                scr_speaker("ralsei");
                msgsetsubloc(0, "\\EE* Well^1, this is a tad difficult...", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Create_0_gml_147_0");
                d_make_plat(0, 1);
                scr_flag_set_ext(PROGRESS_FLAG, _FREEWILL_BIT, 1, 2);
            }
            if (failcounter >= 2)
            {
                failcounter = 2;
                waiting_for_free_will_scene = true;
                scr_flag_set_ext(PROGRESS_FLAG, _FREEWILL_BIT, 2, 2);
            }
        }
        global.flag[1901] = global.flag[1901] + 1;
        if (global.flag[1901] >= 10 && global.flag[1902] == 0 && failcounter >= 3)
        {
            wants_to_reveal_wall = true;
        }
    }
    if (ONLINE_DEBUG())
    {
        current_room_progress = 0;
    }
};

reset_all_stage_elements = function()
{
    if (can_reset)
    {
        can_reset = 0;
        ascent_con = 0;
        with (824)
        {
            if (is_platform_mode == 3)
            {
                drop_off_platform_mode();
            }
        }
        with (123)
        {
            if (autocloses)
            {
                closed_state = 0;
                su_act.blocked = true;
                sprite_index = 7578;
            }
            else if (strength < 15)
            {
                closed_state = 1;
                su_act.blocked = false;
                sprite_index = 696;
                with (su_act)
                {
                    activetimer = 50;
                }
            }
        }
        with (683)
        {
            recover();
        }
    }
};

create_scary_bullet = function(arg0, arg1)
{
    with (instance_create(obj_plat_player.x + (arg0 * 500), obj_plat_player.y - 40, 38))
    {
        sprite_index = 2865;
        image_speed = 1;
        hspeed = arg1;
        image_xscale = 1;
        image_yscale = 1;
        image_angle = 275 + (35 * arg0);
        lifetime = 300;
        timer = 0;
        neutralizable = true;
        neutralize_effect = false;
        damage = 60;
        with (866)
        {
            if (nudgex != 0)
            {
                x = xstart;
            }
        }
        
        step_func = function()
        {
            timer++;
            with (scr_afterimage_monochrome(255, true))
            {
                image_alpha = 0.1;
                image_blend = 255;
            }
            if ((timer % 8) == 0 && scr_onscreen_tolerance(self, 100))
            {
                snd_stop(607);
                snd_play(607, lerp(0.3, 1, abs(x - obj_plat_player.x) / 200), 0.4);
            }
        };
    }
};

marker_manager.register_event(255, 2, failed_jump_loops);
