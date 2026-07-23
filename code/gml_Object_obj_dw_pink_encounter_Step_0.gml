if (!init)
{
    var shrub_colors = [255, 65280];
    
    for (var i = 0; i < array_length(shrub_colors); i++)
    {
        var mark = scr_marker_fromasset(findsprite(spr_fcastle_pink_flowerpot, "CUT_ASSETS", shrub_colors[i]));
        
        with (mark)
        {
            if (image_blend == c_red)
            {
                sprite_index = spr_fcastle_pink_flowerpot_explode;
                image_index = 0;
                image_speed = 0;
            }
            
            scr_depth();
            
            if (image_blend == c_red)
                depth += 260;
            
            image_blend = c_white;
            scr_debug_print(string(depth));
            
            with (obj_castlereflect_manager)
                add_reflection(other.id);
        }
    }
    
    init = 1;
    scr_miniface_init_flowers();
    
    with (obj_castlereflect_manager)
    {
        add_sprite_offset(spr_orange_yell_left, 8, 0);
        add_sprite_offset(spr_orange_cry_yell_right, 8, 0);
        add_sprite_offset(spr_orange_lookup_r, 1, 0);
        add_sprite_offset(spr_orange_stick_tongue_out, 1, 0);
        add_sprite_offset(spr_pink_angle, 0, -4);
        substitute_sprite(spr_pink_angle, 6364);
        add_sprite_offset(spr_pink_wistful, 0, -4);
        substitute_sprite(spr_pink_wistful, 8017);
        add_sprite_offset(spr_pink_yelling, 0, -4);
        substitute_sprite(spr_pink_yelling, 2209);
        add_sprite_offset(spr_pink_yelling_r, 0, -4);
        substitute_sprite(spr_pink_yelling_r, 5884);
    }
}

if (con == 0)
{
    if (global.tempflag[tempflag_index] < 1 && !ONLINE_DEBUG())
    {
        con = 1;
        alarm[0] = 1;
        global.interact = 1;
        global.facing = 0;
    }
    else
    {
        alarm[0] = 1;
        con = 0.1;
        global.interact = 1;
        global.facing = 0;
    }
}

if (con == 1.1)
{
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    ora = actor_count + 1;
    ora_actor = instance_create(orapos.x, orapos.y, obj_actor);
    scr_actor_setup(ora, ora_actor, "orange");
    ora_actor.sprite_index = spr_enemy_orange_walk_left;
    ora_actor.x = 320;
    ora_actor.visible = true;
    pk = actor_count + 2;
    pk_actor = instance_create(380, pkpos.y - 200, obj_actor);
    scr_actor_setup(pk, pk_actor, "pink");
    pk_actor.sprite_index = spr_pink_yelling;
    c_sel(kr);
    c_setxy(krpos.x - 250, krpos.y);
    c_sel(su);
    c_setxy(supos.x - 250, supos.y);
    c_sel(ra);
    c_setxy(rapos.x - 250, rapos.y);
    c_sel(kr);
    c_walkdirect(krpos.x, krpos.y, 25);
    c_sel(su);
    c_autofacing(false);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_walkdirect(supos.x, supos.y, 25);
    c_sel(ra);
    c_walkdirect(rapos.x, rapos.y, 25);
    c_wait(30);
    c_lerpvar_instance(pk_actor, "y", pkpos.y - 200, pkpos.y, 10, 2, "in");
    c_wait(10);
    c_sndplay_x(snd_whack_absurdlyloud, 0.2, 0.8);
    c_sel(pk);
    c_autowalk(false);
    c_var_instance(pk_actor, "image_speed", 0.25);
    c_customfunc(function()
    {
        scr_shakescreen();
        scr_lerp_var_instance(kr_actor, "x", kr_actor.x, kr_actor.x - 18, 20, 2, "out");
        scr_lerp_var_instance(su_actor, "x", su_actor.x, su_actor.x - 10, 20, 2, "out");
        scr_lerp_var_instance(ra_actor, "x", ra_actor.x, ra_actor.x - 14, 20, 2, "out");
        ora_actor.visible = false;
        ora_actor.sprite_index = spr_orange_surprised;
        ora_fly_marker = scr_marker_centered_frominstance(ora_actor);
        ora_fly_marker.image_xscale = -2;
        ora_fly_marker.gravity = 1;
        ora_fly_marker.vspeed = -17;
        ora_fly_marker.hspeed = -25;
        
        ora_fly_func = function()
        {
            image_angle += 42;
        };
        
        ora_fly_marker.step_func = method(ora_fly_marker.id, ora_fly_func);
        su_actor.sprite_index = spr_susie_shock_r;
        ra_actor.sprite_index = spr_ralsei_shocked_right;
    });
    c_wait(30);
    con = 3;
    c_actortokris();
    c_actortocaterpillar();
    c_waitcustom();
}

if (con == 2)
{
    con = 3;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    ora = actor_count + 1;
    ora_actor = instance_create(orapos.x, orapos.y, obj_actor);
    scr_actor_setup(ora, ora_actor, "orange");
    ora_actor.sprite_index = spr_orange_cry_r;
    ora_actor.x = 320;
    ora_actor.visible = true;
    pk = actor_count + 2;
    pk_actor = instance_create(pkpos.x, pinkface.y - 200, obj_actor);
    scr_actor_setup(pk, pk_actor, "pink");
    pk_actor.sprite_index = spr_pink_walk_up;
    pk_actor.visible = false;
    su_actor.mask_index = spr_susie_walk_right_dw;
    c_sel(kr);
    c_setxy(krpos.x - 250, krpos.y);
    c_sel(su);
    c_setxy(supos.x - 250, supos.y);
    c_sel(ra);
    c_setxy(rapos.x - 250, rapos.y);
    c_sel(ora);
    c_autowalk(false);
    c_autofacing(false);
    c_image_speed(0.25);
    c_wait(30);
    c_sel(ora);
    c_wait(20);
    c_sel(kr);
    c_walkdirect(krpos.x, krpos.y, 30);
    c_sel(su);
    c_autofacing(false);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_walkdirect(supos.x, supos.y, 30);
    c_sel(ra);
    c_walkdirect(rapos.x, rapos.y, 30);
    c_wait(10);
    c_msgstay(3);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EJ* Umm^1, Orange^1? We just wanted to check on you.../%", "obj_dw_pink_encounter_slash_Step_0_gml_162_0");
    c_talk_wait();
    c_sel(ora);
    c_image_speed(0.25);
    c_sprite(spr_orange_yell_left);
    c_speaker("orange");
    c_msgstay(3);
    c_msgsetsubloc(0, "~1* Leave me ALONE^1, you big ugly~2hatless long-eared FREAK!!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_171_0");
    c_sel(ra);
    c_spritenext(spr_ralsei_walk_mad_right, 0, 0);
    c_msgnextsubloc("~1* Or I'm..^1. I'm telling my~2BIG SIS!!!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_174_0");
    c_talk_wait();
    c_speaker("ralsei");
    c_msgsetloc(0, "\\En* \"Big Sis?\" What's her name^1, Marigold the Giant Rat?/", "obj_dw_pink_encounter_slash_Step_0_gml_180_0");
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* DON'T MAKE FUN OF BIG SIS!!!!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_182_0");
    c_facenext("ralsei", "n");
    c_msgnextloc("\\En* Or what?/%", "obj_dw_pink_encounter_slash_Step_0_gml_184_0");
    c_spritenext(spr_ralsei_walk_annoyed_right, 0, 0);
    c_talk_wait();
    c_var_instance(blackall, "image_alpha", 0.8);
    c_sound_play(snd_locker);
    c_sel_sprite(su, 1027);
    c_sel_sprite(ra, 1447);
    c_sel_sprite(ora, 2705);
    c_image_speed(0);
    c_wait(15);
    c_msgstay(120);
    c_speaker("normal");
    c_msgsetloc(0, "* Spring may change to Fall^1, but my Season 2 will never falter!/", "obj_dw_pink_encounter_slash_Step_0_gml_226_0");
    c_msgnextloc("* Whoever's making Orange blue^1, the STRONGEST FLOWER will PUNISH YOU!/", "obj_dw_pink_encounter_slash_Step_0_gml_227_0");
    c_msgnextloc("* The prettiest soldier of Asgore's 7 Colored Flowers.../%", "obj_dw_pink_encounter_slash_Step_0_gml_228_0");
    c_talk_wait();
    c_customfunc(function()
    {
        snd_volume(rumble_sound, 0.7, 20);
    });
    c_var_lerp_instance(pinkface, "y", pinkface.ystart, room_height - pinkface.sprite_height, 90);
    c_wait(90);
    c_customfunc(function()
    {
        snd_volume(rumble_sound, 0, 0);
    });
    c_wait(20);
    c_msgstay(60);
    c_mus2("initloop", "pink_theme.ogg");
    c_speaker("pink");
    c_msgsetloc(0, "\\E4* PINK!/%", "obj_dw_pink_encounter_slash_Step_0_gml_250_0");
    c_talk();
    c_wait_if(pinkface, "visi", "=", true);
    c_var_instance(blackall, "image_alpha", 0);
    c_waittalk();
    c_sel(ora);
    c_autodepth(false);
    c_depth(97000);
    c_facing("r");
    c_sel(pk);
    c_visible(true);
    c_walkdirect(pkpos.x, pkpos.y, 30);
    c_wait(35);
    c_sprite(spr_pink_angle);
    c_autowalk(false);
    c_imageindex(1);
    c_wait(20);
    c_var_instance(pinkface, "silhouette", false);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EL* Huh?/%", "obj_dw_pink_encounter_slash_Step_0_gml_273_0");
    c_talk_wait();
    c_sel_sprite(su, 5231);
    c_autowalk(true);
    c_sel_sprite(ra, 5245);
    c_sel(ora);
    c_autowalk(true);
    c_walkdirect(pkpos.x - 50, orapos.y, 10);
    c_speaker("orange");
    c_msgstay(3);
    c_msgsetsubloc(0, "~1* Big sis!^1! You made it!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_287_0");
    c_talk();
    c_wait_if(ora_actor, "x", "=", pkpos.x - 50);
    c_sprite(spr_orange_lookup_r);
    c_wait_talk();
    c_sel_sprite(pk, spr_pink_peace_sign);
    c_speaker("pink");
    c_msgsetloc(0, "\\E5* Of course^1! Friends never leave friends in corporeal danger!/%", "obj_dw_pink_encounter_slash_Step_0_gml_296_0");
    c_talk_wait();
    c_sel(pk);
    c_sprite(spr_pink_kneel_r);
    c_imageindex(0);
    c_animate(0, 2, 0.25);
    c_wait_if(pk_actor, "image_index", ">=", 2);
    c_speaker("pink");
    c_msgsetloc(0, "\\E1* Now^1, who's bullying you^1, Ory?/", "obj_dw_pink_encounter_slash_Step_0_gml_311_0");
    c_facenext("orange", 0);
    c_sel(ora);
    c_msgnextsubloc("~1* Those guys!^1! They've been~2bullying me ALL DAY!!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_314_0");
    c_msgnextsubloc("~1* They keep acting like..^1.~2I'm not extra..^1.~2like I'm small!!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_315_0");
    c_sel(su);
    c_spritenext(spr_susie_look_down_right_dw);
    c_sel(ora);
    c_msgnextsubloc("~1* They even..^1. they even said~2humans don't have tails!!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_319_0");
    c_msgcmd("addxy", 0, -2);
    c_spritenext(spr_orange_cry_yell_right, 0, 0.25);
    c_talk_wait();
    c_sel_sprite(pk, spr_pink_sweat_drop);
    c_imageindex(0);
    c_wait(4);
    c_animate(0, 2, 0.1);
    c_speaker("pink");
    c_msgsetloc(0, "\\E6* H-hyuh^1? Of course we have tails.../", "obj_dw_pink_encounter_slash_Step_0_gml_329_0");
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* So^1, can you beat them up!?/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_331_0");
    c_sel(ora);
    c_msgcmd("addxy", 0, 2);
    c_msgcmd("sprite", spr_orange_lookup_r);
    c_facenext("pink", 0);
    c_msgnextloc("\\E5* Leave it to me!/%", "obj_dw_pink_encounter_slash_Step_0_gml_335_0");
    c_sel(pk);
    c_msgcmd("sprite", spr_pink_peace_sign);
    c_talk();
    c_wait_box(0);
    c_var_instance(pinkface, "sweat", true);
    c_wait_box(2);
    c_var_instance(pinkface, "sweat", false);
    c_wait_talk();
    c_sel(pk);
    c_autowalk(true);
    c_walkdirect(320, pkpos.y, 30);
    c_wait_if(pk_actor, "x", "<", pkpos.x - 60);
    c_sel(ora);
    c_facing("l");
    c_wait_if(pk_actor, "x", "<=", 320);
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E1* Have you three been picking on Orange?/", "obj_dw_pink_encounter_slash_Step_0_gml_358_0");
    c_sel(pk);
    c_msgcmd("sprite", 3296);
    c_msgcmd("autowalk", false);
    c_msgcmd("animate", 0, 2, 0.25);
    c_msgnextloc("* She's really a sweet girl^1. Just like a real orange./", "obj_dw_pink_encounter_slash_Step_0_gml_363_0");
    c_msgnextloc("\\E4* If you just say sorry^1, maybe we could be friends!/", "obj_dw_pink_encounter_slash_Step_0_gml_364_0");
    c_msgcmd("sprite", spr_pink_peace_sign);
    c_facenext("ralsei", "n");
    c_msgnextloc("\\En* We WERE being nice^1! She..^1. SHE started it!/", "obj_dw_pink_encounter_slash_Step_0_gml_367_0");
    c_sel(su);
    c_spritenext(spr_susie_look_down_right_dw_surprise, 0, 0);
    c_sel(ra);
    c_spritenext(spr_ralsei_mad_right_lookdown, 0, 0);
    c_facenext("susie", "K");
    c_msgnextloc("\\EK* (Psst^1, Ralsei...)/%", "obj_dw_pink_encounter_slash_Step_0_gml_373_0");
    c_sel(su);
    c_spritenext(spr_susie_lookdown_right);
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_lookup_right);
    c_wait(45);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_msgstay(6);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EO* Umm^1, you're right^1. We're sorry./", "obj_dw_pink_encounter_slash_Step_0_gml_386_0");
    c_msgnextloc("\\EQ* We..^1. just want to be friends^1, too./%", "obj_dw_pink_encounter_slash_Step_0_gml_387_0");
    c_talk_wait();
    c_sel(su);
    c_spritenext(spr_susie_walk_right_dw_unhappy);
    c_sel(ra);
    c_sprite(spr_ralsei_right);
    c_speaker("pink");
    c_msgsetloc(0, "\\E4* There you go^1, mew~!/%", "obj_dw_pink_encounter_slash_Step_0_gml_394_0");
    c_sel(pk);
    c_msgcmd("sprite", spr_pink_peace_sign);
    c_talk_wait();
    c_sel(ora);
    c_walkdirect(380, orapos.y, 5);
    c_wait(15);
    c_sel(ora);
    c_sprite(spr_orange_stick_tongue_out);
    c_autowalk(false);
    c_image_speed(0.25);
    c_speaker("orange");
    c_msgsetsubloc(0, "~1* Blehhhh!!!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_409_0");
    c_talk_wait();
    c_sel(pk);
    c_sprite(spr_pink_kneel);
    c_animate(0, 2, 0.25);
    c_wait_if(pk_actor, "image_index", ">=", 2);
    c_speaker("pink");
    c_msgsetloc(0, "\\E8* Ory^1, you apologize too^1, mew./", "obj_dw_pink_encounter_slash_Step_0_gml_418_0");
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* Huh!^1? Me!^1? Why!?/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_420_0");
    c_sel(su);
    c_spritenext(spr_susie_walk_right_dw);
    c_sel(ora);
    c_spritenext(spr_orange_surprised);
    c_facenext("pink", 0);
    c_msgnextloc("\\E1* You're always getting into fights^1, aren't you?/", "obj_dw_pink_encounter_slash_Step_0_gml_426_0");
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* I..^1. I..^1. umm.../", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_428_0");
    c_spritenext(spr_orange_lookdown, 1);
    c_msgcmd("imagespeed", 0);
    c_facenext("pink", 0);
    c_msgnextloc("\\E8* You have to control your anger^1, mew./", "obj_dw_pink_encounter_slash_Step_0_gml_432_0");
    c_msgnextloc("\\E6* Don't let grudges grow.../", "obj_dw_pink_encounter_slash_Step_0_gml_433_0");
    c_msgnextloc("\\E4* And never make an enemy when you can make a friend!/", "obj_dw_pink_encounter_slash_Step_0_gml_434_0");
    c_sel(pk);
    c_spritenext(spr_pink_peace_sign);
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* ..^1. well..^1. if you say so^1,~2Big Sis!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_438_0");
    c_talk_wait();
    c_speaker("orange");
    c_sel(ora);
    c_autowalk(true);
    c_walkdirect(260, orapos.y, 30);
    c_wait_if(ora_actor, "x", "<", 320);
    c_sel(pk);
    c_facing("l");
    c_wait_if(ora_actor, "x", "<=", 260);
    c_wait(5);
    c_sel(ora);
    c_autowalk(false);
    c_sprite(spr_orange_lookup);
    c_msgsetsubloc(0, "~1* Hey^1, jerks^1! I'm sorry^1, too!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_455_0");
    c_facenext("susie", "9");
    c_msgnextloc("\\E9* Heh^1, don't worry about it./", "obj_dw_pink_encounter_slash_Step_0_gml_457_0");
    c_sel(su);
    c_spritenext(spr_susie_pose);
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* ..^1. I..^1. feel better now.~2Thanks^1, Pink./", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_461_0");
    c_spritenext(spr_susie_right_dw);
    c_sel(ora);
    c_spritenext(spr_orange_lookdown_r, 0);
    c_facenext("pink", 0);
    c_msgnextloc("\\E6* No problem^1, Ory^1! Haha!/", "obj_dw_pink_encounter_slash_Step_0_gml_467_0");
    c_msgnextloc("\\E5* Now let's go do normal flower stuff!/%", "obj_dw_pink_encounter_slash_Step_0_gml_469_0");
    c_sel(pk);
    c_spritenext(spr_pink_peace_sign);
    c_talkwait();
    var _slowwalktime = 40;
    c_sel(ora);
    c_lerp_var_instance(ora_actor, "x", 260, 260 + _slowwalktime, _slowwalktime);
    c_lerp_var_instance(ora_actor, "image_index", 0, 5, 20);
    c_facing("r");
    c_autowalk(false);
    c_autofacing(false);
    c_sel(pk);
    c_lerp_var_instance(pk_actor, "x", 320, 320 + _slowwalktime, _slowwalktime);
    c_lerp_var_instance(pk_actor, "image_index", 0, 5, _slowwalktime);
    c_facing("r");
    c_autowalk(false);
    c_autofacing(false);
    c_wait(10);
    c_sel(su);
    c_sprite(spr_susie_blink_right_dw);
    c_snd_play(snd_xylophone_blink);
    c_wait(8);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait(8);
    c_sprite(spr_susie_blink_right_dw);
    c_snd_play(snd_xylophone_blink);
    c_wait(8);
    c_sprite(spr_susie_walk_right_dw_unhappy);
    c_wait(max(6, _slowwalktime - 34));
    c_sprite(spr_susie_look_down_right);
    c_mus2("volume", 0, 1);
    c_msgstay(6);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* Hey^1, uh..^1. wait a sec^1. Maybe I miscounted^1, but.../%", "obj_dw_pink_encounter_slash_Step_0_gml_512_0");
    c_talk_wait();
    c_mus("free_all");
    c_sel(ora);
    c_facing("l");
    c_imageindex(0);
    c_sel(pk);
    c_sprite(spr_pink_shocked);
    c_shakeobj();
    c_sel(ora);
    c_sprite(spr_orange_notsmile);
    c_msgstay(6);
    c_speaker("pink");
    c_msgsetloc(0, "\\EF* Huh?/%", "obj_dw_pink_encounter_slash_Step_0_gml_528_0");
    c_talk_wait();
    c_sel(ra);
    c_sprite(spr_ralsei_lookup_right);
    c_sel(su);
    c_sprite(spr_susie_lookdown_right);
    c_speaker("susie");
    c_msgsetloc(0, "\\E6* Ralsei^1, didn't we meet all 7 flowers already?/", "obj_dw_pink_encounter_slash_Step_0_gml_540_0");
    c_sel(ora);
    c_spritenext(spr_orange_notsmile_r);
    c_facenext("pink", 0);
    c_msgnextloc("\\EF* Huh^1, huh?/%", "obj_dw_pink_encounter_slash_Step_0_gml_544_0");
    c_sel(pk);
    c_msgcmd("shakeobj");
    c_talk();
    c_wait_box(1);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_sel(ora);
    c_sprite(spr_orange_notsmile_r);
    c_wait_talk();
    c_wait(4);
    c_msgstay(6);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EK* Come to think of it..^1. Asgore doesn't HAVE a pink flower^1, does he?/", "obj_dw_pink_encounter_slash_Step_0_gml_561_0");
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* ..^1. Big Sis^1? Pink?/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_566_0");
    c_msgnextsubloc("~1* ..^1. how long have you been my~2Big Sis?/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_567_0");
    c_sel(ora);
    c_spritenext(spr_orange_lookup_nosmile_r);
    c_facenext("pink", 0);
    c_msgnextloc("\\EF* Huh^1, huh^1, HUH?/%", "obj_dw_pink_encounter_slash_Step_0_gml_571_0");
    c_sel(pk);
    c_msgcmd("shakeobj");
    c_talk_wait();
    c_sel_sprite(pk, spr_pink_sweat_drop);
    c_imageindex(0);
    c_animate(0, 2, 0.1);
    c_var_instance(pinkface, "sweat", true);
    c_speaker("pink");
    c_msgsetloc(0, "\\E6* Ah^1, w-well^1, you see.../", "obj_dw_pink_encounter_slash_Step_0_gml_582_0");
    c_msgnextloc("* Ummm^1, tee hee!/", "obj_dw_pink_encounter_slash_Step_0_gml_583_0");
    c_msgnextloc("* Errr.../", "obj_dw_pink_encounter_slash_Step_0_gml_584_0");
    c_msgnextloc("* Well^1, that's.../%", "obj_dw_pink_encounter_slash_Step_0_gml_585_0");
    c_talk();
    c_sel(pk);
    c_wait_box(1);
    c_facing("l");
    c_shakeobj();
    c_wait_box(2);
    c_facing("r");
    c_shakeobj();
    c_wait_box(3);
    c_facing("l");
    c_shakeobj();
    c_wait_box(4);
    c_facing("u");
    c_shakeobj();
    c_wait_talk();
    c_var_instance(pinkface, "sweat", false);
    c_wait(35);
    c_sprite(spr_pink_yelling);
    c_image_speed(0.25);
    c_customfunc(function()
    {
        scr_shakescreen();
        scr_lerp_var_instance(kr_actor, "x", kr_actor.x, kr_actor.x - 18, 20, 2, "out");
        scr_lerp_var_instance(su_actor, "x", su_actor.x, su_actor.x - 10, 20, 2, "out");
        scr_lerp_var_instance(ra_actor, "x", ra_actor.x, ra_actor.x - 14, 20, 2, "out");
        ora_actor.visible = false;
        ora_actor.sprite_index = spr_orange_surprised;
        ora_fly_marker = scr_marker_centered_frominstance(ora_actor);
        ora_fly_marker.image_xscale = -2;
        ora_fly_marker.gravity = 1;
        ora_fly_marker.vspeed = -17;
        ora_fly_marker.hspeed = -25;
        
        ora_fly_func = function()
        {
            image_angle += 42;
        };
        
        ora_fly_marker.step_func = method(ora_fly_marker.id, ora_fly_func);
        su_actor.sprite_index = spr_susie_shock_r;
        ra_actor.sprite_index = spr_ralsei_shocked_right;
    });
    c_mus2("initloop", "pink_theme_mad.ogg");
    c_msgstay(6);
    c_speaker("pink");
    c_msgsetloc(0, "\\E7* HOW ABOUT YOU ALL MIND YOUR OWN DAMN BUSINESS!!!/%", "obj_dw_pink_encounter_slash_Step_0_gml_636_0");
    c_talk_wait();
    c_shake();
    c_speaker("pink");
    c_msgsetloc(0, "\\E7* So WHAT if I'm not REALLY a Flower!^1? WHO CARES!!!!/", "obj_dw_pink_encounter_slash_Step_0_gml_642_0");
    c_msgnextloc("* I LIKE being here!^1! I LIKE this world!^1! I LIKE this body!!!/", "obj_dw_pink_encounter_slash_Step_0_gml_643_0");
    c_msgcmd("shake");
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* S..^1. sorry^1, Ms. Pink^1, but this Dark World is.../", "obj_dw_pink_encounter_slash_Step_0_gml_646_0");
    c_sel(pk);
    c_spritenext(spr_pink_wistful);
    c_sel(ra);
    c_spritenext(spr_ralsei_walk_right_sad_subtle);
    c_facenext("susie", "S");
    c_msgnextloc("\\ES* It's kinda..^1. temporary./", "obj_dw_pink_encounter_slash_Step_0_gml_652_0");
    c_sel(su);
    c_spritenext(spr_susie_walk_right_dw_unhappy);
    c_facenext("pink", 2);
    c_msgnextloc("\\E2* I get it./", "obj_dw_pink_encounter_slash_Step_0_gml_658_0");
    c_msgnextloc("\\E7* YOU!!^1! YOU kittens are gonna take it away^1, aren't you!?/", "obj_dw_pink_encounter_slash_Step_0_gml_660_0");
    c_msgcmd("shake");
    c_sel(pk);
    c_spritenext(spr_pink_yelling);
    c_msgnextloc("* HA!!^1! Don't make me laugh!!^1!/", "obj_dw_pink_encounter_slash_Step_0_gml_665_0");
    c_msgcmd("shake");
    c_msgnextloc("* PINK is gonna PUNISH you first!!/", "obj_dw_pink_encounter_slash_Step_0_gml_667_0");
    c_msgcmd("shake");
    c_msgnextloc("* YOU'LL be WRIGGLING in the SOIL begging for forgiveness!!!/", "obj_dw_pink_encounter_slash_Step_0_gml_669_0");
    c_msgcmd("shake");
    c_msgnextloc("\\E3* That's the best way to apologize^1, mew~/%", "obj_dw_pink_encounter_slash_Step_0_gml_672_0");
    c_spritenext(spr_pink_peace_sign);
    c_talk_wait();
    c_mus("free_all");
    c_sel(pk);
    c_sprite(spr_pink_angle);
    c_imageindex(1);
    c_autodepth(false);
    c_depth(5000);
    c_actortokris();
    c_actortocaterpillar();
    c_waitcustom();
}

if (con == 3 && customcon == 1)
{
    if (timer == 0)
    {
        pk_actor.visible = false;
        var _spr = spr_pink_angle;
        
        if (global.tempflag[tempflag_index] > 0)
            _spr = spr_pink_yelling;
        
        var _pinkmarker = scr_dark_marker(pk_actor.x, pk_actor.y, _spr);
        _pinkmarker.image_index = 1;
        scr_battle(224, 3, _pinkmarker, 0, 0);
        
        with (_pinkmarker)
            scr_delay_var("visible", 0, 24);
        
        global.tempflag[tempflag_index]++;
        
        if (scr_debug())
            show_debug_message_concat("pink already fought count: ", global.tempflag[tempflag_index]);
        
        if (global.console)
        {
            with (obj_border_controller)
                show_border();
        }
    }
    
    if (!battlesetup && i_ex(obj_battlecontroller))
        battlesetup = true;
    
    timer++;
    
    if (timer > 45 && !i_ex(obj_battlecontroller))
    {
        pk_actor.visible = true;
        timer = 0;
        con = 4;
        scr_maincharacters_actors();
        pk_actor.sprite_index = spr_pink_walk_left;
        pk_actor.image_index = 0;
        pk_actor.image_speed = 0;
    }
}

if (con == 4)
{
    if (!i_ex(obj_endbattle))
    {
        con = 5;
        customcon = 0;
        
        with (obj_caterpillarchara)
            visible = false;
        
        with (obj_mainchara)
            visible = false;
        
        c_waitcustom_end();
    }
}

if (con == 5)
{
    con = 6;
    pinkface.silhouette = false;
    pinkface.y = room_height - pinkface.sprite_height;
    c_sel(kr);
    c_facing("r");
    c_sel(pk);
    c_sprite(spr_pink_walk_left);
    c_imageindex(0);
    c_imagespeed(0);
    c_sel_sprite(su, spr_susie_walk_right_dw);
    c_sel_sprite(ra, 526);
    c_wait(70);
    c_sel_sprite(pk, spr_pink_peace_sign);
    c_speaker("pink");
    c_msgsetloc(0, "\\E4* I..^1. I feel..^1. together!/", "obj_dw_pink_encounter_slash_Step_0_gml_799_0");
    c_msgnextloc("\\EC* Thank you^1, you three^1! Thanks to you.../", "obj_dw_pink_encounter_slash_Step_0_gml_800_0");
    c_msgnextloc("\\E4* We can finally be..^1. in harmony..^1. forever!/%", "obj_dw_pink_encounter_slash_Step_0_gml_801_0_b");
    c_talk_wait();
    c_wait(10);
    c_sel_sprite(su, spr_susie_look_down_right_dw);
    c_sel_sprite(ra, spr_ralsei_head_down_sad_right);
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* ..^1. well.../", "obj_dw_pink_encounter_slash_Step_0_gml_808_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* There's still the..^1. Dark Fountain^1, but.../%", "obj_dw_pink_encounter_slash_Step_0_gml_810_0");
    c_talk_wait();
    c_wait(30);
    c_sel_sprite(pk, 7703);
    c_shakeobj();
    c_shaketarget(pinkface);
    c_speaker("pink");
    c_msgsetloc(0, "\\EF* W-wait.../", "obj_dw_pink_encounter_slash_Step_0_gml_817_0");
    c_msgnextloc("\\EF* Wait!/", "obj_dw_pink_encounter_slash_Step_0_gml_818_0");
    c_msgcmd("shaketarget", pinkface);
    c_msgcmd("shakeobj");
    c_msgnextloc("\\EF* WAIT!!!/%", "obj_dw_pink_encounter_slash_Step_0_gml_821_0");
    c_msgcmd("shaketarget", pinkface);
    c_msgcmd("shakeobj");
    c_talk_wait();
    c_wait(40);
    c_shake();
    c_sel(pk);
    c_sprite(spr_pink_kneeling_crying_loop);
    c_imagespeed(0.25);
    c_sel_sprite(su, 5231);
    c_sel_sprite(ra, 5245);
    c_sel(pk);
    c_sprite(spr_pink_kneeling_crying_loop);
    c_mus2("initloop", "noelle_normal.ogg");
    c_msgstay(6);
    c_speaker("pink");
    c_msgsetloc(0, "\\E9* W-waaaa!^1! Y-you guys really ARE bullies^1, aren't you...!!/", "obj_dw_pink_encounter_slash_Step_0_gml_750_0");
    c_msgnextloc("* I just..^1. want to..^1. be.../%", "obj_dw_pink_encounter_slash_Step_0_gml_751_0");
    c_talk_wait();
    c_sprite(spr_pink_kneeling_sad);
    c_imagespeed(0);
    c_imageindex(1);
    c_msgstay(6);
    c_speaker("pink");
    c_msgsetloc(0, "\\EA* ..^1. like this./%", "obj_dw_pink_encounter_slash_Step_0_gml_757_0");
    c_talk_wait();
    c_sel_sprite(su, spr_susie_look_down_right);
    c_sel_sprite(ra, 528);
    c_speaker("pink");
    c_msgstay(6);
    c_msgsetloc(0, "\\EA* Ever since I saw Asgore's doll^1, I knew it was ME.../", "obj_dw_pink_encounter_slash_Step_0_gml_767_0");
    c_msgnextloc("* I'd been possessing this body as a ghost since then^1, but.../", "obj_dw_pink_encounter_slash_Step_0_gml_768_0");
    c_msgnextloc("* Once I got to this strange world.../", "obj_dw_pink_encounter_slash_Step_0_gml_769_0");
    c_msgnextloc("* I could..^1. MOVE in it^1! I could TALK.../", "obj_dw_pink_encounter_slash_Step_0_gml_770_0");
    c_msgnextloc("\\E3* I could be AN ANIMATED CATGIRL!!!/", "obj_dw_pink_encounter_slash_Step_0_gml_772_0");
    c_sel(pk);
    c_spritenext(spr_pink_peace_sign);
    c_msgnextloc("\\EB* Why do you twerps have to take that away!?/", "obj_dw_pink_encounter_slash_Step_0_gml_776_0");
    c_spritenext(spr_pink_kneeling_crying_loop);
    c_msgcmd("imagespeed", 0.25);
    c_facenext("ralsei", "Q");
    c_msgnextloc("\\EQ* ..^1. we're sorry^1, but.../", "obj_dw_pink_encounter_slash_Step_0_gml_780_0");
    c_sel(ra);
    c_spritenext(spr_ralsei_walk_right_sad_subtle);
    c_msgnextloc("\\E8* This world..^1. it's dangerous to keep it around.../%", "obj_dw_pink_encounter_slash_Step_0_gml_783_0");
    c_talk_wait();
    c_sel_sprite(ra, 528);
    c_sel(su);
    c_autowalk(false);
    c_sprite(spr_susie_act_ow);
    c_animate(0, 4, 0.25);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* But^1, uh^1, look^1. We don't wanna ruin your life or anything./", "obj_dw_pink_encounter_slash_Step_0_gml_794_0");
    c_msgnextloc("\\E7* Why don't you come to our place?/", "obj_dw_pink_encounter_slash_Step_0_gml_795_0");
    c_sel(pk);
    c_msgcmd("imagespeed", 0);
    c_spritenext(spr_pink_kneeling_sad, 1);
    c_facenext("pink", 2);
    c_msgnextloc("*\\EA ..^1. your place?/", "obj_dw_pink_encounter_slash_Step_0_gml_801_0");
    c_facenext("susie", "D");
    c_msgnextloc("\\ED* We..^1. have a world like this^1, too./", "obj_dw_pink_encounter_slash_Step_0_gml_803_0");
    c_sel(su);
    c_spritenext(spr_susie_walk_right_dw_unhappy, 0);
    c_msgnextloc("\\E2* You'll probably be able to keep being a catgirl there^1, too./", "obj_dw_pink_encounter_slash_Step_0_gml_806_0");
    c_sel(su);
    c_spritenext(spr_susie_look_down_right);
    c_facenext("pink", 1);
    c_msgnextloc("\\EC* R..^1. really!?/%", "obj_dw_pink_encounter_slash_Step_0_gml_811_0");
    c_talk_wait();
    c_wait(8);
    c_sel_sprite(pk, spr_pink_overjoyed);
    c_imagespeed(0.25);
    c_imageindex(0);
    c_wait_if(pk_actor, "image_index", ">=", 5);
    c_sprite(spr_pink_overjoyed_loop);
    c_speaker("pink");
    c_msgsetloc(0, "\\EE* Ohhh^1, thank you^1! Thank you^1! THANK YOU!!!/", "obj_dw_pink_encounter_slash_Step_0_gml_825_0");
    c_msgnextloc("* I can't believe it^1, mew!^1! My hopes and dreams are glowing!!/", "obj_dw_pink_encounter_slash_Step_0_gml_826_0");
    c_msgnextloc("* I..^1. I'll go pack my big pink bags!!/%", "obj_dw_pink_encounter_slash_Step_0_gml_827_0");
    c_talk_wait();
    c_sel(ora);
    c_autowalk(true);
    c_autofacing(false);
    c_sndplay(snd_wing);
    c_customfunc(function()
    {
        with (obj_marker)
        {
            if (sprite_index == spr_fcastle_pink_flowerpot_explode)
            {
                scr_animate(1, 4, 0.2);
                other.ora_actor.x = x;
                other.ora_actor.y = y;
                other.ora_actor.auto_depth = false;
                other.ora_actor.depth = depth - 10;
            }
        }
        
        with (ora_actor)
        {
            scr_jump_to_point(other.pkpos.x - 70, other.orapos.y, 10, 30);
            image_speed = 0.2;
        }
    });
    c_sprite(spr_orange_walk_nosmile);
    c_visible(true);
    c_sel(pk);
    c_autowalk(true);
    c_autofacing(true);
    c_walkdirect(pkpos.x - 140, pkpos.y, 30);
    c_wait(30);
    c_sel_sprite(ora, spr_orange_lookup_nosmile);
    c_image_speed(0);
    c_speaker("orange");
    c_msgsetsubloc(0, "~1* Pink...^1? Does that mean~2you're going to..^1. leaf?/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_849_0");
    c_facenext("pink", 0);
    c_msgnextloc("\\EF* Ah..^1. I.../%", "obj_dw_pink_encounter_slash_Step_0_gml_851_0");
    c_sel(pk);
    c_spritenext(spr_pink_shocked_r);
    c_msgcmd("shakeobj");
    c_talk_wait();
    c_wait(10);
    c_sel(pk);
    c_facing("l");
    c_wait(15);
    c_facing("r");
    c_wait(15);
    c_facing("u");
    c_wait(30);
    c_facing("d");
    c_sel_sprite(pk, spr_pink_kneeling_crying_loop);
    c_autowalk(false);
    c_imagespeed(0.25);
    c_sel_sprite(ora, spr_orange_surprised);
    c_customfunc(function()
    {
        scr_shakescreen();
        scr_lerp_var_instance(kr_actor, "x", kr_actor.x, kr_actor.x - 9, 15, 2, "out");
        scr_lerp_var_instance(su_actor, "x", su_actor.x, su_actor.x - 5, 15, 2, "out");
        scr_lerp_var_instance(ra_actor, "x", ra_actor.x, ra_actor.x - 7, 15, 2, "out");
        scr_lerp_var_instance(ora_actor, "x", ora_actor.x, ora_actor.x + 10, 15, 2, "out");
        su_actor.sprite_index = spr_susie_shock_r;
        ra_actor.sprite_index = spr_ralsei_shocked_right;
    });
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E9* No!!^1! I don't WANNA go!^1! Ory^1! Everyone!^1! I love them!!/", "obj_dw_pink_encounter_slash_Step_0_gml_887_0");
    c_facenext("ralsei", "J");
    c_msgnextloc("\\EJ* Err^1, you don't have to leave just yet./", "obj_dw_pink_encounter_slash_Step_0_gml_889_0");
    c_msgnextloc("\\E0* We still haven't reached the Fountain./%", "obj_dw_pink_encounter_slash_Step_0_gml_890_0");
    c_talk();
    c_wait_box(2);
    c_sel(ra);
    c_facing("r");
    c_sel(su);
    c_facing("r");
    c_wait_talk();
    c_wait(15);
    c_sel_sprite(pk, spr_pink_peace_sign);
    c_mus("stop");
    c_mus("free_all");
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E4* Oh^1, okay./%", "obj_dw_pink_encounter_slash_Step_0_gml_907_0");
    c_talk_wait();
    c_sel(pk);
    c_autowalk(true);
    c_walkdirect(pkpos.x - 110, pkpos.y, 15);
    c_wait(15);
    c_sprite(spr_pink_kneel);
    c_autowalk(false);
    c_imagespeed(0);
    c_imageindex(0);
    c_animate(0, 2, 0.25);
    c_wait_if(pk_actor, "image_index", ">=", 2);
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E1* Ory^1, I'll stay with you until the end^1, OK?/", "obj_dw_pink_encounter_slash_Step_0_gml_924_0");
    c_facenext("orange", 0);
    c_msgnextsubloc("~1* Pink!!^1! I'll stay with you^1,~2too!!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_pink_encounter_slash_Step_0_gml_926_0");
    c_sel(ora);
    c_spritenext(spr_enemy_orange_walk_left);
    ora_actor.floor_y = orapos.y;
    
    var _jumpfunc = function()
    {
        gravity = 1;
        
        if (y >= floor_y)
        {
            vspeed = -7;
            y = floor_y;
        }
        
        reflect_jump_y = (floor_y - y) * 2;
    };
    
    c_msgcmd("stepfunc", _jumpfunc);
    c_talk_wait();
    
    var _endjumpfunc = function()
    {
        if (y >= floor_y)
        {
            reflect_jump_y = 0;
            vspeed = 0;
            y = floor_y;
            gravity = 0;
        }
    };
    
    c_wait(20);
    c_sel(pk);
    c_facing("l");
    c_sprite(spr_pink_peace_sign);
    c_sel(ora);
    c_step_func(_endjumpfunc);
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E5* ..^1. well WHAT are you three waiting for!?/%", "obj_dw_pink_encounter_slash_Step_0_gml_963_0");
    c_talk_wait();
    c_wait(30);
    blackall.image_alpha = 0;
    c_sel(pk);
    c_sprite(spr_pink_yelling);
    c_shake();
    c_imagespeed(0.25);
    c_speaker("pink");
    c_msgsetloc(0, "\\E7* Get the HELL out of here already!!!/%", "obj_dw_pink_encounter_slash_Step_0_gml_975_0");
    c_talk_wait();
    c_sel(pk);
    c_autowalk(true);
    c_autodepth(true);
    c_autofacing(true);
    c_walkdirect(-80, pkpos.y, 90);
    c_wait_if(pk_actor, "x", "<", 320);
    c_sel(ora);
    c_autodepth(true);
    c_facing("l");
    c_walkdirect(-80, orapos.y, 90);
    c_sel_facing(kr, "d");
    c_autofacing(false);
    c_walk("r", 2, 20);
    c_wait(6);
    c_sel_facing(su, "d");
    c_autofacing(false);
    c_walk("u", 2, 20);
    c_wait(6);
    c_sel_facing(ra, "u");
    c_autofacing(false);
    c_walk("d", 2, 10);
    c_wait(60);
    c_sel_facing(kr, "l");
    c_sel_facing(su, "l");
    c_sel_facing(ra, "l");
    c_wait(40);
    c_sel_facing(su, "r");
    c_sel_facing(ra, "u");
    c_speaker("susie");
    c_msgsetloc(0, "* Well..^1. guess we better get going./%", "obj_dw_pink_encounter_slash_Step_0_gml_1129_0");
    c_talk_wait();
    c_sel(su);
    c_autowalk(true);
    c_walk("l", 4, 40);
    c_wait(10);
    c_sel(ra);
    c_autowalk(true);
    c_walk("u", 4, 15);
    c_wait(15);
    c_walk("l", 4, 40);
    c_wait(60);
    c_sel(kr);
    c_autowalk(true);
    c_walk("d", 2, 20);
    c_wait(20);
    c_walk("l", 2, 20);
    c_wait(15);
    c_sel(pk);
    c_setxy(-40, 104);
    c_walk("r", 7, 15);
    c_wait(10);
    c_sel(kr);
    c_autofacing(false);
    c_walk("r", 5, 10);
    c_wait(10);
    c_mus2("initloop", "pink_theme.ogg");
    c_mus2("pitch", 1.25);
    c_customfunc(function()
    {
        audio_sound_set_track_position(global.currentsong[1], 14.3);
    });
    c_sel_spriteimage(pk, spr_pink_yelling_r, 0, 0.25);
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E7* H..^1. Hey^1! Wait^1. Wait^1! WAIT!/%", "obj_dw_pink_encounter_slash_Step_0_gml_1155_0");
    c_talk_wait();
    c_autowalk(true);
    c_sel_facing(pk, "u");
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E6* I^1, uh.../%", "obj_dw_pink_encounter_slash_Step_0_gml_1164_0");
    c_msgvar_instance(pinkface, "sweat", true);
    c_talk_wait();
    c_sel_facing(pk, "r");
    c_msgstay(3);
    c_speaker("pink");
    c_msgsetloc(0, "\\E1* My body..^1. she^1, forgot to give you something!/%", "obj_dw_pink_encounter_slash_Step_0_gml_1173_0");
    c_msgvar_instance(pinkface, "sweat", false);
    c_talk_wait();
    c_sel_spriteimage(pk, spr_pink_sweat_drop, 0, 0);
    c_var_lerp_to_instance(pk_actor, "image_index", 2, 6);
    c_wait(6);
    c_var_instance(pinkface, "sweat", true);
    c_speaker("pink");
    c_msgsetloc(0, "\\E6* I don't know why^1, but we've had THIS since we got here.../", "obj_dw_pink_encounter_slash_Step_0_gml_1184_0");
    c_msgnextloc("\\E7* And^1, uh..^1. we don't need it^1. So YOU have it!/%", "obj_dw_pink_encounter_slash_Step_0_gml_1185_0");
    c_sel_spritenext(pk, spr_pink_yelling_r, 0, 0.25);
    c_msgvar_instance(pinkface, "sweat", false);
    c_talk_wait();
    c_autowalk(true);
    c_walk("r", 5, 7);
    c_wait(7);
    c_spriteimage(spr_pink_arms_out_r, 0, 0);
    c_autowalk(false);
    c_var_lerp_to_instance(pk_actor, "image_index", 2, 6);
    c_wait(6);
    c_snd_play(snd_sparkle_glock);
    c_speaker("no_name");
    c_msgsetloc(0, "* (SHADOWCRYSTAL was added to your KEY ITEMS.)/%", "obj_dw_pink_encounter_slash_Step_0_gml_1200_0");
    c_talk_wait();
    c_var_lerp_to_instance(pk_actor, "image_index", 4, 6);
    c_wait(8);
    c_spriteimage(spr_pink_walk_right, 1, 0.25);
    c_walk("l", 5, 7);
    c_wait(7);
    c_sel_spriteimage(pk, spr_pink_yelling_r, 0, 0.25);
    c_speaker("pink");
    c_msgsetloc(0, "\\EH* There^1, are we done now^1, body?/", "obj_dw_pink_encounter_slash_Step_0_gml_1215_0");
    c_msgnextloc("\\E8\\cp* Actually^1, let me give you something else^1, mew...!\\cW/%", "obj_dw_pink_encounter_slash_Step_0_gml_1216_0");
    c_spritenext(spr_pink_walk_right, 0, 0);
    c_talk_wait();
    c_autowalk(true);
    c_walk("r", 5, 7);
    c_wait(7);
    c_spriteimage(spr_pink_kiss, 0, 0);
    c_addxy(-1, 0);
    c_autowalk(false);
    c_wait(6);
    c_wait(15);
    c_imageindex(1);
    c_snd_play(snd_coaster_kiss);
    kissheart = scr_dark_marker(160, 121, spr_kissheart);
    kissheart.visible = false;
    c_var_instance(kissheart, "visible", true);
    c_var_instance(kissheart, "vspeed", -3);
    c_var_instance(kissheart, "friction", 0.2);
    c_wait(30);
    c_var_instance(kissheart, "visible", false);
    c_spriteimage(spr_pink_shocked_r, 0, 0);
    c_var_lerp_to_instance(pk_actor, "x", 65, 20, 3, "out");
    c_shakeobj();
    c_wait(24);
    c_autowalk(false);
    c_spriteimage(spr_pink_yelling_r, 0, 0.25);
    c_speaker("pink");
    c_msgsetloc(0, "\\EH* H..^1. HEY!!^1! WHAT THE.../", "obj_dw_pink_encounter_slash_Step_0_gml_1251_0");
    c_msgnextloc("\\E8\\cp* See you later^1, mew!\\cW/%", "obj_dw_pink_encounter_slash_Step_0_gml_1252_0");
    c_spritenext(spr_pink_walk_right, 0, 0);
    c_talk_wait();
    c_autowalk(true);
    c_walk("l", 7, 30);
    c_wait(30);
    c_var_lerp_to_instance(blackall, "image_alpha", 1, 60);
    c_mus2("volume", 0, 50);
    c_wait(60);
    c_mus2("free");
    c_wait(15);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}

if (con == 6 && !i_ex(obj_cutscene_master))
{
    show_debug_message_concat("cutscene ended");
    global.interact = 3;
    global.facing = 3;
    instance_create(0, 0, obj_persistentfadein);
    global.entrance = 1;
    global.flag[1815] = 1;
    global.flag[1816] = 1;
    global.flag[1846] = 2;
    con = -99;
    
    if (scr_flag_get(1908) == 0)
        scr_flag_set(1908, 2);
    
    scr_get_shadow_crystal(global.chapter);
    
    if (scr_keyitemcheck(13) == 0)
        scr_keyitemget(13);
    
    room_goto(room_dw_fcastle_pinkroom);
    con = 999;
}
