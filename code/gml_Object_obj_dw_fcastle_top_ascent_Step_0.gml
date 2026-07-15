failcounter = 0;
waiting_for_free_will_scene = false;
if (!init)
{
    init = true;
    with (123)
    {
        if (!closed)
        {
            autocloses = true;
        }
    }
    if (furthest_room_progress == 9)
    {
        var gm = scr_genmarker("make_bounce");
        var bounceflower = instance_create(gm.x, gm.y, 123);
        with (bounceflower)
        {
            scr_plat_depthcast();
            index = 5;
            angle = 90;
            strength = 20.75;
            stem_ease_x = ease_in_quad;
            stem_ease_y = ease_out_quad;
            scr_delay_var("force_yplat", true, 4);
            scr_delay_var("y_plat", ystart + 80, 4);
        }
    }
    with (382)
    {
        ss1 = 0.8;
        ssy1 = 0.8;
        ss2 = 0.7;
        ssy2 = 0.7;
    }
    if (global.flag[1902] == 0)
    {
        with (scr_marker_fromasset(findsprite(6741)))
        {
            other.wallmarker = id;
            scr_darksize();
            y += 2;
            depth = 1345599;
        }
        if (global.flag[1901] >= 10)
        {
            wants_to_reveal_wall = true;
        }
    }
    else
    {
        with (1424)
        {
            if (extflag == "pumpkin_wall")
            {
                instance_destroy();
                break;
            }
        }
        with (1350)
        {
            if (xmax == 1240 && ymax == 5220)
            {
                xmax = -4;
            }
        }
    }
}
if (global.pause_plat)
{
    exit;
}
if (scr_trigcheck_ext("reset", 910))
{
    reset_all_stage_elements();
}
if (scr_trigcheck_ext("can_reset", 910))
{
    if (!can_reset)
    {
        with (683)
        {
            recover();
        }
        can_reset = true;
    }
}
if (ascent_con == 0)
{
    if (scr_trigcheck_ext("bullet1", 910) && obj_plat_player.grounded)
    {
        ascent_con = 1;
        create_scary_bullet(-1, 7.5);
    }
}
if (ascent_con == 1)
{
    if (scr_trigcheck_ext("bullet2", 910) && obj_plat_player.grounded)
    {
        ascent_con = 2;
        create_scary_bullet(1, -9);
    }
}
if (failcounter >= 3)
{
    with (824)
    {
        free_will = true;
    }
}
for (var i = current_room_progress; i < 9; i++)
{
    if (scr_trigcheck_ext("progress_" + string(i), 910))
    {
        current_room_progress = max(current_room_progress, i);
    }
}
if (introcon == 0)
{
    if (scr_trigcheck_ext("intro_1", 910))
    {
        introcon = 1;
        scr_speaker("ralsei");
        msgsetsubloc(0, "\\EL* This room's enormous!", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_98_0");
        scr_flag_set_ext(PROGRESS_FLAG, _INTRO_BIT, 1, 2);
        d_make_plat(0, 0, undefined, undefined, 1);
    }
}
else if (introcon == 1)
{
    if (scr_trigcheck_ext("intro_2", 910))
    {
        introcon = 2;
        scr_speaker("susie");
        msgsetsubloc(0, "\\E0* Guess we start here?", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_106_0");
        d_make_plat(0, 0, undefined, undefined, 1);
        scr_flag_set_ext(PROGRESS_FLAG, _INTRO_BIT, 2, 2);
    }
}
if (shuricon == 0)
{
    if (scr_trigcheck_ext("shuri_1", 910) && obj_plat_player.grounded)
    {
        shuricon = 1.1;
        scr_delay_var("shuricon", 1, 120);
        scr_speaker("susie");
        var small_text = stringsetloc("I'm trying!?", "obj_dw_fcastle_top_ascent_slash_Step_0_gml_118_0");
        scr_smallface(0, 7010, 0, "mid", "topmid", small_text);
        msgsetsubloc(0, "\\E6* Go faster!?\\f0", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_120_0");
        d_make_plat(0, 0);
        scr_flag_set_ext(PROGRESS_FLAG, _SHURIKEN_BIT, 1, 3);
    }
}
else if (shuricon == 1)
{
    if (scr_trigcheck_ext("shuri_1", 910) && obj_plat_player.grounded)
    {
        shuricon = 1.1;
        scr_delay_var("shuricon", 2, 120);
        var small_text = stringsetloc("How!?", "obj_dw_fcastle_top_ascent_slash_Step_0_gml_128_0");
        scr_smallface(0, 7010, 1, "mid", "topmid", small_text);
        scr_speaker("susie");
        msgsetsubloc(0, "\\E6* Faster this time!?\\f0", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_131_0");
        d_make_plat(0, 0);
        scr_flag_set_ext(PROGRESS_FLAG, _SHURIKEN_BIT, 2, 3);
    }
}
else if (shuricon == 2)
{
    if (scr_trigcheck_ext("shuri_1", 910) && obj_plat_player.grounded)
    {
        shuricon = 1.1;
        var small_text = stringsetloc("No!?", "obj_dw_fcastle_top_ascent_slash_Step_0_gml_138_0");
        scr_smallface(0, 7010, 2, "mid", "topmid", small_text);
        scr_speaker("susie");
        msgsetsubloc(0, "\\E7* Rocket boost!\\f0", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_141_0");
        d_make_plat(0, 0);
        scr_flag_set_ext(PROGRESS_FLAG, _SHURIKEN_BIT, 3, 3);
    }
}
if (wants_to_reveal_wall)
{
    if (scr_trigcheck_ext("wall_reveal", 910))
    {
        wants_to_reveal_wall = false;
        global.flag[1902] = 1;
        with (1424)
        {
            if (extflag == "pumpkin_wall")
            {
                instance_destroy();
                break;
            }
        }
        with (1350)
        {
            if (xmax == 1240 && ymax == 5220)
            {
                scr_lerpvar("xmax", xmax, room_width - 640, 60);
            }
        }
        snd_play(504);
        with (wallmarker)
        {
            scr_doom(id, 60);
            scr_lerpvar("x", x, x + 120, 60);
            scr_lerpvar("image_alpha", 1, 0, 60);
        }
    }
}
if (waiting_for_free_will_scene == 1)
{
    var eligible = true;
    with (824)
    {
        if (is_platform_mode > 0 || image_alpha < 1 || !caterpillarmode)
        {
            eligible = false;
            break;
        }
    }
    if (eligible && scr_trigcheck_ext("intro_2", 910))
    {
        var wait = false;
        with (824)
        {
            if (name == "ralsei")
            {
                var ral = id;
                if (!grounded)
                {
                    wait = true;
                }
            }
        }
        global.interact = 1;
        if (wait)
        {
            waiting_for_free_will_scene = 1.1;
        }
        else
        {
            waiting_for_free_will_scene = 1.2;
        }
    }
}
if (waiting_for_free_will_scene == 1.1)
{
    var wait = false;
    with (824)
    {
        if (name == "ralsei")
        {
            var ral = id;
            if (!grounded)
            {
                wait = true;
            }
        }
    }
    if (!wait)
    {
        waiting_for_free_will_scene = 1.2;
    }
}
if (waiting_for_free_will_scene == 1.2)
{
    with (1424)
    {
        if (extflag == "failsafe")
        {
            x = 1000;
            break;
        }
    }
    waiting_for_free_will_scene = 2;
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var ral = -4;
    with (823)
    {
        instance_destroy();
    }
    scr_get_plat_followers();
    c_plat_prepare_followers();
    c_pannable(1);
    var cam_target = -4;
    with (1732)
    {
        if (extflag == "cutykr1")
        {
            cam_target = id;
            break;
        }
    }
    c_pan(cam_target.x - 240, 5220, 30);
    c_plat_moveto(kr_actor, "cutykr1");
    c_plat_moveto(su_actor, "cutysu1");
    c_plat_moveto(ra_actor, "cutyra1");
    c_wait(15);
    c_plat_goal_reached(kr_actor);
    c_plat_goal_reached(su_actor);
    c_plat_goal_reached(ra_actor);
    c_plat_turn(kr_actor, "r");
    c_plat_turn(su_actor, "r");
    c_plat_turn(ra_actor, "l");
    c_sel(ra);
    c_sprite(828);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetsubloc(0, "\\EQ* Kris^1, perhaps if you.../%", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_204_0");
    c_talk_wait();
    c_plat_moveto(su_actor, "cutysu2");
    c_wait(5);
    c_plat_goal_reached(su_actor);
    c_customfunc(function()
    {
        with (su_actor)
        {
            depth = other.ra_actor.depth + 5;
        }
    });
    c_sel(su);
    c_sprite(3016);
    c_imagespeed(0.25);
    c_imageindex(0);
    c_wait(18);
    c_imagespeed(0);
    c_speaker("susie");
    c_msgsetsubloc(0, "\\E0* Ralsei^1. Hey./", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_221_0");
    c_facenext("ralsei", "L");
    c_msgnextsubloc("\\EL* Susie...?/", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_223_0");
    c_sel(ra);
    c_spritenext(1567);
    c_facenext("susie", "D");
    c_sel(su);
    c_msgnextsubloc("\\ED* For this room.../", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_228_0");
    c_msgnextsubloc("\\EN* Let's not wait for Kris to tell us when./", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_229_0");
    c_msgnextsubloc("\\E2* Let's just do it./", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_230_0");
    c_msgnextsubloc("\\E9* All we gotta do is trust each other^1, right?/", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_231_0");
    c_facenext("ralsei", "d");
    c_msgnextsubloc("\\Ed* .../", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_233_0");
    c_sel(ra);
    c_spritenext(828);
    c_msgnextsubloc("\\EE* Then^1, let's go./%", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_236_0");
    c_spritenext(1567);
    c_talk_wait();
    c_wait(10);
    c_panobj(kr_actor, 15);
    c_customfunc(function()
    {
        with (1307)
        {
            panx += 14;
            finalx += 14;
            pany = 0;
            finaly = cameray();
        }
    });
    c_wait(16);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_customfunc(function()
    {
        with (824)
        {
            if (name == "susie")
            {
                x += 24;
            }
            else
            {
                x -= 24;
            }
        }
    });
    c_terminatekillactors();
}
if (waiting_for_free_will_scene == 2 && !instance_exists(1570))
{
    waiting_for_free_will_scene = 0;
    with (1424)
    {
        if (extflag == "failsafe")
        {
            x = 3000;
            break;
        }
    }
    failcounter = 3;
    global.interact = 0;
    with (824)
    {
        image_xscale = 2;
        state = -1;
        caterpillarmode = 0;
        important = 1;
    }
    scr_flag_set_ext(PROGRESS_FLAG, _FREEWILL_BIT, 3, 2);
}
if (furthest_room_progress < 8.5 && scr_trigcheck_ext("finished", 910))
{
    with (824)
    {
        drop_off_platform_mode(true);
    }
    furthest_room_progress = 8.5;
}
if (furthest_room_progress < 9 && furthest_room_progress >= 8.5 && obj_plat_player.grounded && instance_number(824) > 0)
{
    furthest_room_progress = 9.1;
    with (824)
    {
        drop_off_platform_mode(true);
    }
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    with (823)
    {
        instance_destroy();
    }
    scr_get_plat_followers();
    c_plat_prepare_followers();
    c_plat_moveto(kr_actor, "cutekr1");
    c_plat_moveto(su_actor, "cutesu1");
    c_plat_moveto(ra_actor, "cutera1");
    c_wait(5);
    c_plat_goal_reached(kr_actor);
    c_plat_goal_reached(su_actor);
    c_plat_goal_reached(ra_actor);
    c_sndplay(419);
    c_plat_turn(kr_actor, "l");
    c_plat_turn(ra_actor, "l");
    c_plat_turn(su_actor, "l");
    c_plat_animate(su_actor, 8084);
    c_plat_animate(ra_actor, 2415);
    c_plat_animate(kr_actor, 5475);
    c_wait(15);
    c_sndplay(690);
    c_plat_animate(su_actor, 6035);
    c_plat_animate(ra_actor, 7808);
    c_plat_animate(kr_actor, 6176);
    c_wait(45);
    if (failcounter >= 3)
    {
        c_sel(ra);
        c_sprite(6906);
        c_speaker("susie");
        c_msgsetsubloc(0, "\\Ek* That was easy^1, right?/%", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_301_0");
        c_talk_wait();
    }
    else
    {
        c_speaker("ralsei");
        c_msgsetsubloc(0, "\\E2* Wow^1, amazing job^1, Kris!/", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_407_0");
        c_sel(ra);
        c_facenext("susie", 9);
        c_msgnextsubloc("\\E9* Nothing's tough for us^1, right?/%", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_410_0");
        c_spritenext(6906);
        c_talk_wait();
    }
    c_customfunc(function()
    {
        killer_bullet = instance_create(camerax() + 680, cameray() + 220, 1238);
        with (killer_bullet)
        {
            con = 0;
            timer = 0;
            speed_scale = 1;
            _vspeed = -6;
            _gravity = 0.5;
            sprite_index = 2865;
            image_speed = 1;
            image_angle = -90;
        }
        with (su_actor)
        {
            depth = other.ra_actor.depth + 5;
        }
        with (ra_actor)
        {
            depth = 1950;
        }
    });
    c_wait(13);
    c_customfunc(function()
    {
        scr_lerpvar("draw_grayscale", 0, 1, 15, 1, "in");
        with (killer_bullet)
        {
            scr_lerpvar("speed_scale", 1, 0.05, 15, 1, "in");
        }
    });
    c_wait(10);
    c_sel(kr);
    c_sprite(6863);
    c_imageindex(0);
    c_imagespeed(0);
    c_plat_turn(kr_actor, "r");
    c_sel(ra);
    c_plat_turn(ra_actor, "l");
    c_sprite(870);
    c_imagespeed(0);
    c_imageindex(1);
    c_mus2("volume", 0, 30);
    c_wait(10);
    c_imageindex(2);
    c_wait(20);
    c_speaker("ralsei");
    c_msgsetsubloc(0, "\\Et* SUSIE!", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_343_0");
    c_talk();
    c_sel(su);
    c_plat_turn(su_actor, "r");
    c_sprite(7783);
    c_wait(20);
    c_plat_turn(ra_actor, "r");
    c_sel(ra);
    c_sprite(6356);
    c_imageindex(0);
    c_imagespeed(0.1);
    c_wait(10);
    c_imagespeed(0.05);
    c_sel(su);
    c_sprite(785);
    c_imageindex(0);
    c_imagespeed(0);
    c_wait(10);
    c_imageindex(1);
    c_addxy(-8, 0);
    c_sel(ra);
    c_imagespeed(0.1);
    c_wait(18);
    c_customfunc(function()
    {
        k_d();
    });
    c_customfunc(function()
    {
        with (killer_bullet)
        {
            scr_shakeobj();
        }
        killer_bullet.speed_scale = 0;
        instance_create(killer_bullet.x, killer_bullet.y, 1676);
    });
    c_wait(12);
    c_customfunc(function()
    {
        with (killer_bullet)
        {
            scr_oflash().image_alpha = 1;
        }
    });
    c_wait(5);
    c_imagespeed(0);
    c_customfunc(function()
    {
        with (killer_bullet)
        {
            for (var i = 0; i < 12; i++)
            {
                with (instance_create(x, y, 1237))
                {
                    sprite_index = 7253;
                    speed = 8;
                    friction = 0.4;
                    scr_darksize();
                    image_speed = 0.25;
                    direction = i * 30;
                }
            }
            for (var i = 0; i < 12; i++)
            {
                with (instance_create(x, y, 1237))
                {
                    sprite_index = 7253;
                    speed = 10;
                    friction = 0.34;
                    scr_darksize();
                    image_speed = 0.2;
                    direction = (i * 30) + 15;
                }
            }
            for (var i = -3; i < 3; i++)
            {
                with (instance_create(x, y, 1496))
                {
                    sprite_index = 5781;
                    speed = 8;
                    image_index = random_range(0, 4);
                    scr_darksize();
                    gravity = 0.4;
                    image_speed = 0.5;
                    direction = 90 + (i * 30) + random_range(10, 20);
                    hspeed *= 1.2;
                    scr_lerpvar("image_alpha", 5, 0, 300);
                    scr_doom(self, 300);
                    
                    step_func = function()
                    {
                        with (instance_place(x, y, 706))
                        {
                            other.speed = 0;
                            other.gravity = 0;
                            other.y = bbox_top - 16;
                        }
                    };
                }
            }
            with (instance_create(x, y, 1237))
            {
                sprite_index = 1197;
                scr_darksize();
                depth = other.depth + 20;
                image_speed = 0.5;
            }
            instance_destroy();
        }
        scr_lerpvar("draw_grayscale", 1, 0, 15, 1, "out");
    });
    c_sel(su);
    c_sprite(7875);
    c_plat_turn(su_actor, "r");
    c_wait(60);
    c_speaker("susie");
    c_msgsetsubloc(0, "\\EZ* Dude^1, I..^1. didn't know you could do that.../%", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_384_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_sprite(534);
    c_imageindex(0);
    c_speaker("ralsei");
    c_msgsetsubloc(0, "\\EC* Umm^1, well^1, I.../%", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_391_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_sprite(615);
    c_imageindex(0);
    c_wait(5);
    c_imageindex(1);
    c_snd_play(364);
    c_wait(5);
    c_sel(ra);
    c_sprite(5245);
    c_speaker("susie");
    c_msgsetsubloc(0, "\\E9* Show me cool stuff like that earlier^1, k?/", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_404_0");
    c_facenext("ralsei", "Q");
    c_msgnextsubloc("\\EQ* Haha^1, of course^1, Susie!/%", (global.lang == "ja") ? stringset("&\t\t\t") : stringset("&"), "obj_dw_fcastle_top_ascent_slash_Step_0_gml_406_0");
    c_spritenext(5960);
    c_talk_wait();
    c_plat_stop_animation(su_actor);
    c_plat_stop_animation(ra_actor);
    c_plat_turn(su_actor, "l");
    c_plat_turn(ra_actor, "l");
    c_mus2("volume", 1, 30);
    c_wait(5);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (furthest_room_progress == 9.1 && !instance_exists(1570))
{
    furthest_room_progress = 9;
    scr_flag_set_ext(PROGRESS_FLAG, _CLEAR_BIT, 1);
    global.interact = 0;
    scr_tempsave();
}
depth = 2000;
with (killer_bullet)
{
    hspeed = -8 * speed_scale;
    timer += speed_scale;
    _vspeed += (_gravity * speed_scale);
    vspeed = _vspeed * speed_scale;
    image_speed = speed_scale;
    depth = other.depth - 5;
    image_angle += (speed_scale * 0.5);
}
with (866)
{
    if (nudgex != 0 && instance_number(38) == 0)
    {
        x = xstart - 10000;
    }
}
