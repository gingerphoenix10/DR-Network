if (!init)
{
    init = 1;
    var shrub_colors = [255, 65280, 16711680, 16777215];
    
    for (var i = 0; i < array_length(shrub_colors); i++)
    {
        var mark = scr_marker_fromasset(findsprite(spr_fcastle_pink_flowerpot, "NPCs", shrub_colors[i]));
        
        with (mark)
        {
            image_blend = c_white;
            scr_depth();
            
            with (obj_castlereflect_manager)
                add_reflection(other.id);
        }
    }
    
    with (obj_castlereflect_manager)
    {
        add_sprite_offset(6055, 5, 0);
        add_sprite_offset(3603, 8, 0);
        add_sprite_offset(3, 0, -8);
        substitute_sprite(3, 7036);
        
        with (obj_dw_fcastle_pinkroom_ferrol)
        {
            if (instance_exists(ferrol))
            {
                other.add_reflection(ferrol.marker);
                other.add_sprite_offset(3234, 3, 0);
                other.add_sprite_offset(543, -3, 0);
                other.add_sprite_offset(6017, 5, 0);
            }
        }
    }
    
    scr_miniface_init_flowers();
    
    if (global.flag[PINK_FLAG] >= 1.5)
    {
        var saveloc = findspriteinfo(spr_savepoint);
        instance_create(saveloc.x, saveloc.y, obj_savepoint).depth -= 120;
    }
    else
    {
        cutscenecon = 0.1;
    }
    
    if (global.flag[PINK_FLAG] >= 3)
    {
        con = 1;
        
        with (obj_solidblocksized_alt)
            instance_destroy();
        
        path_layer_alpha = 1;
        var gm = scr_genmarker("blocker");
        
        if (!global.alwaysunlockpink)
        {
            with (instance_create(gm.x, gm.y, obj_solidblocksized))
            {
                image_xscale = 2;
                image_yscale = 20;
            }
        }
    }
}

if (cutscenecon == 0.1)
{
    cutscenecon = 1;
    global.interact = 1;
    
    with (obj_mainchara)
        y += 200;
    
    with (obj_caterpillarchara)
    {
        y += 200;
        scr_caterpillar_interpolate();
    }
}
else if (cutscenecon == 1)
{
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var orapos = findspriteinfo(spr_enemy_orange_prepare, "CUT_ASSETS");
    var orapos2 = findspriteinfo(spr_enemy_orange_walk_left, "CUT_ASSETS");
    ora = actor_count + 1;
    ora_actor = instance_create(orapos.x, orapos.y, obj_actor);
    scr_actor_setup(ora, ora_actor, "orange");
    ora_actor.sprite_index = spr_enemy_orange_prepare;
    ora_actor.visible = false;
    cutscenecon = 2;
    var krmarker = scr_heromarker("kr", "cut");
    var sumarker = scr_heromarker("su", "cut");
    var ramarker = scr_heromarker("ra", "cut");
    c_sel(ora);
    c_autowalk(false);
    c_autofacing(false);
    c_image_speed(0.25);
    c_sel(kr);
    c_setxy(krmarker[0], cameray() + cameraheight());
    c_sel(su);
    c_setxy(sumarker[0], cameray() + cameraheight());
    c_sel(ra);
    c_setxy(ramarker[0], cameray() + cameraheight());
    var krdist = point_distance(kr_actor.x, kr_actor.y, krmarker[0], krmarker[1]) / 3;
    var radist = point_distance(ra_actor.x, ra_actor.y, ramarker[0], ramarker[1]) / 3;
    var sudist = point_distance(su_actor.x, su_actor.y, sumarker[0], sumarker[1]) / 3;
    c_sel(kr);
    c_walkdirect_speed(krmarker[0], krmarker[1], 3);
    c_sel(su);
    c_walkdirect_speed(sumarker[0], sumarker[1], 3);
    c_sel(ra);
    c_walkdirect_speed(ramarker[0], ramarker[1], 3);
    c_wait(10);
    c_var_instance(id, "cuttimer", max(krdist, sudist, radist));
    c_msgside("bottom");
    c_wait(50);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EJ* Hello...^1? Anyone in here?/%", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_85_0");
    c_talk_wait();
    c_wait(20);
    c_speaker("susie");
    c_msgsetloc(0, "\\E7* Bet you it's someone mega strong./%", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_91_0");
    c_msgfunc(function()
    {
        if (cuttimer <= 10)
            su_actor.sprite_index = spr_susie_up_look_left_smile;
    });
    c_talk_wait();
    c_wait(10);
    c_wait_if(id, "cuttimer", "<=", 0);
    c_sel(kr);
    c_facing("d");
    c_sel(ra);
    c_sprite(spr_ralsei_smile_right);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EH* Ooh^1, perhaps with a unique and memorable theme!/", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_110_0");
    c_facenext("susie", "6");
    c_msgnextloc("\\E6* Shhh^1, I hear someone!/%", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_112_0");
    c_sel(su);
    c_spritenext(spr_susie_up_look_right_full);
    c_msgfunc(function()
    {
        snd_play(snd_wing);
    });
    c_talk_wait();
    c_sel(ora);
    c_var("visible", true);
    c_jump(orapos2.x, orapos2.y, 12, 30);
    c_snd_play(snd_jump);
    c_wait(30);
    c_mus2("initloop", "meeting_flower_orange.ogg");
    c_shake();
    c_sel(kr);
    c_facing("r");
    c_jump(krmarker[0] - 60, krmarker[1], 6, 10);
    c_sel(ra);
    c_sprite(spr_ralsei_shocked_right);
    c_jump(ramarker[0] - 60, ramarker[1], 6, 10);
    c_sel(su);
    c_sprite(spr_susie_shock_r);
    c_jump(sumarker[0] - 60, sumarker[1], 6, 10);
    c_wait(4);
    c_speaker("orange");
    c_msgsetsubloc(0, "~1* Ha-HA^1! You chibbies talking~2about ME!?/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_145_0");
    c_talk_wait();
    c_wait(10);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_unhappy);
    c_imagespeed(0);
    c_imageindex(0);
    c_sel(su);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_imagespeed(0);
    c_imageindex(0);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EX* Oh^1, umm^1, it's just Orange.../%", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_164_0");
    c_talk_wait();
    c_sel(ora);
    c_sprite(spr_orange_mad);
    c_jump_in_place(4, 10);
    c_snd_play_x(snd_petaldrain, 0.7, 1.5);
    c_wait(10);
    c_jump_in_place(4, 10);
    c_snd_play_x(snd_petaldrain, 0.7, 1.5);
    c_wait(10);
    c_shakeobj();
    c_speaker("orange");
    c_msgsetsubloc(0, "~1* Wh..^1. what do you mean~2JUST Orange!?/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_178_0");
    c_talk_wait();
    c_var_instance(id, "orange_jump", 1);
    c_sprite(spr_orange_ready_fight);
    c_imagespeed(0.25);
    c_speaker("orange");
    c_msgsetsubloc(0, "~1* I've been practicing...!^1!~2I'm..^1. I'm EXTRA now!^1!~2I'm SUPER!!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_187_0");
    c_sel(ra);
    c_facenext("ralsei", "K");
    c_msgnextloc("\\EK* Kris^1, perhaps we need to use the key somewhere else...?/", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_190_0");
    c_spritenext(spr_ralsei_up);
    c_facenext("susie", "N");
    c_msgnextloc("\\EN* Psst^1, Ralsei^1, c'mon^1. We can beat her up if she wants./", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_193_0");
    c_spritenext(spr_ralsei_right);
    c_sel(su);
    c_spritenext(spr_susie_look_back_whisper_look_right, 0, 0);
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* S..^1. STOP BULLYING ME!!!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_199_0");
    c_sel(su);
    c_spritenext(spr_susie_walk_right_dw_unhappy, 0, 0);
    c_msgfunc(function()
    {
        orange_jump = 0;
    });
    c_sel(ora);
    c_spritenext(spr_orange_yell_left, 0, 0.25);
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* Or I^1, I^1, I^1, I.../%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_209_0");
    c_spritenext(spr_orange_cry_big_eye, 0, 0.25);
    c_msgfunc(function()
    {
        orange_shake = true;
    });
    c_talk_wait();
    c_var_instance(id, "orange_shake", false);
    c_sel(ora);
    c_sprite(spr_orange_cry_r);
    var orapos3 = findspriteinfo(spr_orange_cry_big_eye, undefined, c_blue);
    c_walkdirect_speed(orapos3.x, orapos3.y, 10);
    cuttimer = 50;
    c_snd_play(snd_escaped);
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_head_down);
    c_sel(su);
    c_sprite(spr_susie_surprised_subtle_right);
    c_speaker("orange");
    c_msgsetsubloc(0, "~1* I'm telling!!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_232_0");
    c_talk_wait();
    c_mus2("volume", 0, 30);
    c_wait(12);
    c_wait_if(id, "cuttimer", "<=", 0);
    c_sel(su);
    c_sprite(spr_susie_walk_left_dw_unhappy);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* .../", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_247_0");
    c_facenext("susie", "0");
    c_msgnextloc("\\E0* ..^1. let's go check on her./%", "obj_dw_fcastle_pinkroom_slash_Step_0_gml_249_0");
    c_talk_wait();
    c_wait(10);
    c_sel(kr);
    c_facing("d");
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}

if (cutscenecon == 2 && !instance_exists(obj_cutscene_master))
{
    global.interact = 0;
    cutscenecon = 0;
    global.flag[PINK_FLAG] = 1.5;
    var saveloc = findspriteinfo(spr_savepoint);
    instance_create(saveloc.x, saveloc.y, obj_savepoint).depth -= 120;
}

if (orange_jump != 0)
{
    orange_cooldown--;
    
    if (orange_cooldown <= 0)
    {
        snd_play(snd_petaldrain, 0.7, 1.5);
        
        with (ora_actor)
        {
            if (other.orange_jump > 0)
                scr_jump_to_point(x + 16, y, 6, 10);
            else
                scr_jump_to_point(x - 16, y, 6, 10);
        }
        
        orange_jump = -orange_jump;
        orange_cooldown = 10;
    }
}

if (orange_shake)
{
    if ((floor(cuttimer) % 2) == 0)
    {
        orange_cooldown = -sign(orange_cooldown + 0.5);
        ora_actor.x += 2 * orange_cooldown;
    }
}

if (con == 0 && global.flag[PINK_FLAG] == 2)
{
    if (scr_trigcheck("remove_encounter_room"))
    {
        con = 1;
        global.flag[PINK_FLAG] = 3;
        scr_tempsave();
        snd_play(snd_sparkle_glock);
        
        with (obj_solidblocksized_alt)
            instance_destroy();
        
        scr_lerpvar("path_layer_alpha", 0, 1, 30);
        var gm = scr_genmarker("blocker");
        
        if (!global.alwaysunlockpink)
        {
            with (instance_create(gm.x, gm.y, obj_solidblocksized))
            {
                image_xscale = 2;
                image_yscale = 20;
            }
        }
    }
}

if (con >= 1 && con <= 30)
{
    con++;
    
    with (obj_caterpillarchara)
    {
        if (x > 520)
            x -= 2;
        
        for (var i = 0; i < 75; i++)
        {
            if (remx[i] > 520)
                array_set(remx, i, array_get(remx, i) - 2);
        }
    }
}

cuttimer--;
