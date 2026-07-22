if (ignoredepth == 0)
{
    if ((global.character != "chara" && global.character != "frisk") || mysterycheck() == 0)
    {
        scr_depth();
    }
    else
    {
        scr_depth_legacy();
    }
}
onlinekeys();
mask_index = 380;
if (instance_exists(1412))
{
    global.sendstate = 2;
}
else if (cutscene)
{
    global.sendstate = 1;
}
else if (instance_exists(1164))
{
    global.sendstate = 3;
}
else
{
    global.sendstate = 0;
}
wallcheck = 0;
nowx = x;
nowy = y;
if (press_d == 0 && press_l == 0 && press_u == 0 && press_r == 0)
{
    nopress = 1;
}
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
bkx = 0;
bky = 0;
bkxy = 0;
jelly = 2;
if (scr_debug())
{
    var noclipinput = false;
    var glointforce = false;
    for (var i = 0; i < 8; i++)
    {
        if ((gamepad_button_check(i, 32773) || gamepad_button_check(i, 32775)) && (gamepad_button_check(i, 32774) || gamepad_button_check(i, 32776)))
        {
            if (gamepad_button_check_pressed(i, 32772))
            {
                noclipinput = true;
            }
            if (gamepad_button_check_pressed(i, 32777))
            {
                glointforce = true;
            }
        }
    }
    if ((keyboard_check(16) && keyboard_check(17) && keyboard_check_pressed(78)) || noclipinput)
    {
        noclip = !noclip;
        var str = "off";
        if (noclip == 1)
        {
            str = "on";
        }
        scr_debug_print("noclip=" + str);
    }
    if ((keyboard_check(16) && keyboard_check(17) && keyboard_check_pressed(48)) || glointforce)
    {
        scr_debug_print("global.interact set to 0");
        global.interact = 0;
    }
}
if (!roomenterfreezeend)
{
    if (global.interact == 3)
    {
        if (global.flag[21] > 0)
        {
            global.flag[21]--;
        }
        else
        {
            roomenterfreezeend = 1;
            global.interact = 0;
            global.flag[21] = -10;
        }
    }
}
if (global.interact == 0)
{
    if (button3_p() && threebuffer < 0 && !instance_exists(obj_climb_kris))
    {
        var haveflowery = false;
        with (obj_caterpillar_generic)
        {
            if (name == "flowery")
            {
                haveflowery = 1;
            }
        }
        if (global.flag[7] == 0 && (battlemode == 0 || !battle_menu_block) && swordmode == 0)
        {
            with (obj_darkcontroller)
            {
                threebuffer = 2;
            }
            with (obj_overworldc)
            {
                movenoise = 1;
                threebuffer = 2;
            }
            global.menuno = 0;
            global.interact = 5;
            threebuffer = 2;
            twobuffer = 2;
            if (haveflowery)
            {
                if (flvoice())
                {
                    var snd = [scr_84_get_sound("snd_flowery_voiceclip_leaf_it_to_me"), scr_84_get_sound("snd_flowery_voiceclip_itsmeflowery"), scr_84_get_sound("snd_flowery_voiceclip_flowery2")];
                    snd_play_random(true, undefined, undefined, snd);
                }
            }
        }
    }
    else if (threebuffer < 0 && global.flag[7] == 0 && battlemode == 0 && swordmode == 0 && mysterycheck() == 1)
    {
        if (global.key_online && !instance_exists(obj_onlinemenu))
        {
            instance_create(x, y, obj_onlinemenu);
            global.interact = 8;
            threebuffer = 2;
            twobuffer = 2;
        }
        else if (global.key_lostlevels && !instance_exists(obj_lostlevelsmenu) && global.lostlevels == 1)
        {
            instance_create(x, y, obj_lostlevelsmenu);
            global.interact = 8;
            threebuffer = 2;
            twobuffer = 2;
        }
    }
}
if (swordcon == 1)
{
    swordtimer++;
    if (swordtimer >= 15)
    {
        with (slashmarker)
        {
            instance_destroy();
        }
        swordcon = 0;
        swordsprite = rsprite;
        fun = 0;
        if (global.interact == 4)
        {
            global.interact = 0;
        }
        swordtimer = 0;
        image_speed = 0;
        image_index = 0;
        image_alpha = 1;
    }
}
if (global.interact == 0 && freeze == 0)
{
    if (mysterycheck() == 1)
    {
        if (global.flag[11] == 1)
        {
            if (button2_h() && twobuffer < 0)
            {
                run = 0;
            }
            else
            {
                run = 1;
            }
        }
        else if (button2_h() && twobuffer < 0)
        {
            run = 1;
        }
        else
        {
            run = 0;
        }
        if (room == 20 && global.plot >= 190 && global.plot < 200)
        {
            run = 0;
        }
        if (autorun > 0)
        {
            if (autorun == 1)
            {
                run = 1;
                runtimer = 200;
            }
            if (autorun == 2)
            {
                run = 1;
                runtimer = 50;
            }
        }
    }
    if (run == 1)
    {
        if (darkmode == 0)
        {
            wspeed = bwspeed + 1;
            if (runtimer > 10)
            {
                wspeed = bwspeed + 2;
            }
            if (runtimer > 60)
            {
                wspeed = bwspeed + 3;
            }
        }
        if (darkmode == 1)
        {
            wspeed = bwspeed + 2;
            if (runtimer > 10)
            {
                wspeed = bwspeed + 4;
            }
            if (runtimer > 60)
            {
                wspeed = bwspeed + 5;
            }
        }
    }
    if (run == 0)
    {
        wspeed = bwspeed;
    }
    if (climbing == 1)
    {
        wspeed = ceil(wspeed * 0.7);
    }
    if (global.chapter == 5)
    {
        if (_weird_mode)
        {
            wspeed = 1;
        }
        else if (scr_sideb_active())
        {
            if (room == 21)
            {
                var target_x = 240;
                var dist = (target_x - x) / target_x;
                var target_speed = clamp(1 + dist, 1, 1.67);
                wspeed = target_speed;
            }
            else if (run == 1)
            {
                wspeed = clamp(wspeed, 0, 3);
            }
            else
            {
                wspeed = clamp(wspeed, 0, 2);
            }
        }
        else if (global.plot >= 570)
        {
            if (run == 1)
            {
                wspeed = clamp(wspeed, 0, 3);
            }
            else
            {
                wspeed = clamp(wspeed, 0, 2);
            }
        }
    }
    if (left_h())
    {
        press_l = 1;
    }
    if (right_h())
    {
        press_r = 1;
    }
    if (up_h())
    {
        press_u = 1;
    }
    if (down_h())
    {
        press_d = 1;
    }
    px = 0;
    py = 0;
    pressdir = -1;
    if (press_r == 1)
    {
        px = wspeed;
        pressdir = 1;
    }
    if (press_l == 1)
    {
        px = -wspeed;
        pressdir = 3;
    }
    if (press_d == 1)
    {
        py = wspeed;
        pressdir = 0;
    }
    if (press_u == 1)
    {
        py = -wspeed;
        pressdir = 2;
    }
    if (nopress == 1 && pressdir != -1)
    {
        global.facing = pressdir;
    }
    if (global.facing == 2)
    {
        if (press_d == 1)
        {
            global.facing = 0;
        }
        if (press_u == 0 && pressdir != -1)
        {
            global.facing = pressdir;
        }
    }
    if (global.facing == 0)
    {
        if (press_u == 1)
        {
            global.facing = 2;
        }
        if (press_d == 0 && pressdir != -1)
        {
            global.facing = pressdir;
        }
    }
    if (global.facing == 3)
    {
        if (press_r == 1)
        {
            global.facing = 1;
        }
        if (press_l == 0 && pressdir != -1)
        {
            global.facing = pressdir;
        }
    }
    if (global.facing == 1)
    {
        if (press_l == 1)
        {
            global.facing = 3;
        }
        if (press_r == 0 && pressdir != -1)
        {
            global.facing = pressdir;
        }
    }
    if (press_r == 1)
    {
        swordfacing = 1;
    }
    if (press_l == 1)
    {
        swordfacing = -1;
    }
    if (press_l == 0 && press_u == 0 && press_r == 0 && press_d == 0 && emote != -4)
    {
        sprite_index = emote;
        image_speed = emote_speed;
        exit;
    }
    else if (emote != -4)
    {
        emote = -4;
        set_facing();
        image_speed = 0;
    }
    if (swordmode == 1)
    {
        if (button1_p() && swordcon == 0 && global.interact == 0)
        {
            global.interact = 4;
            swordsprite = rsprite;
            slashmarker = scr_dark_marker(x, y, rsprite);
            slashmarker.depth = depth;
            slashmarker.image_speed = 1;
            if (swordfacing == -1)
            {
                slashmarker.x += sprite_width;
                slashmarker.image_xscale = -image_xscale;
            }
            image_alpha = 0;
            fun = 1;
            snd_play(444);
            image_index = 0;
            image_speed = 0.5;
            swordtimer = 0;
            swordcon = 1;
            press_l = 0;
            press_r = 0;
            press_u = 0;
            press_d = 0;
            swordhitbox = instance_create(slashmarker.x, slashmarker.y, 1353);
            swordhitbox.image_xscale = slashmarker.image_xscale;
            swordhitbox.image_yscale = image_yscale;
        }
    }
    nopress = 0;
    xmeet = 0;
    ymeet = 0;
    xymeet = 0;
    var checkcol = true;
    if (scr_debug() && noclip)
    {
        checkcol = false;
    }
    if (checkcol)
    {
        if (place_meeting(x + px, y + py, 1181))
        {
            xymeet = 1;
        }
        if (place_meeting(x + px, y, 1181))
        {
            if (place_meeting(x + px, y, 1181))
            {
                for (g = wspeed; g > 0; g -= 1)
                {
                    mvd = 0;
                    if (press_d == 0 && !place_meeting(x + px, y - g, 1181))
                    {
                        y -= g;
                        py = 0;
                        break;
                        mvd = 1;
                    }
                    if (press_u == 0 && mvd == 0 && !place_meeting(x + px, y + g, 1181))
                    {
                        y += g;
                        py = 0;
                        break;
                    }
                }
            }
            xmeet = 1;
            bkx = 0;
            if (px > 0)
            {
                for (var i = px; i >= 0; i -= 1)
                {
                    if (!place_meeting(x + i, y, 1181))
                    {
                        px = i;
                        bkx = 1;
                        break;
                    }
                }
            }
            if (px < 0)
            {
                for (var i = px; i <= 0; i += 1)
                {
                    if (!place_meeting(x + i, y, 1181))
                    {
                        px = i;
                        bkx = 1;
                        break;
                    }
                }
            }
            if (bkx == 0)
            {
                px = 0;
            }
        }
        if (place_meeting(x, y + py, 1181))
        {
            ymeet = 1;
            bky = 0;
            if (place_meeting(x, y + py, 1181))
            {
                for (g = wspeed; g > 0; g -= 1)
                {
                    mvd = 0;
                    if (press_r == 0 && !place_meeting(x - g, y + py, 1181))
                    {
                        x -= g;
                        px = 0;
                        break;
                        mvd = 1;
                    }
                    if (mvd == 0 && press_l == 0 && !place_meeting(x + g, y + py, 1181))
                    {
                        x += g;
                        px = 0;
                        break;
                    }
                }
            }
            if (py > 0)
            {
                for (var i = py; i >= 0; i -= 1)
                {
                    if (!place_meeting(x, y + i, 1181))
                    {
                        py = i;
                        bky = 1;
                        break;
                    }
                }
            }
            if (py < 0)
            {
                for (var i = py; i <= 0; i += 1)
                {
                    if (!place_meeting(x, y + i, 1181))
                    {
                        py = i;
                        bky = 1;
                        break;
                    }
                }
            }
            if (bky == 0)
            {
                py = 0;
            }
        }
        if (place_meeting(x + px, y + py, 1181))
        {
            xymeet = 1;
            bkxy = 0;
            var i = px;
            j = py;
            while (j != 0 || i != 0)
            {
                if (!place_meeting(x + i, y + j, 1181))
                {
                    px = i;
                    py = j;
                    bkxy = 1;
                    break;
                }
                if (abs(j) >= 1)
                {
                    if (j > 0)
                    {
                        j -= 1;
                    }
                    if (j < 0)
                    {
                        j += 1;
                    }
                }
                else
                {
                    j = 0;
                }
                if (abs(i) >= 1)
                {
                    if (i > 0)
                    {
                        i -= 1;
                    }
                    if (i < 0)
                    {
                        i += 1;
                    }
                }
                else
                {
                    i = 0;
                }
            }
            if (bkxy == 0)
            {
                px = 0;
                py = 0;
            }
        }
    }
    runmove = 0;
    if (run == 1 && xmeet == 0 && ymeet == 0 && xymeet == 0)
    {
        if (abs(px) > 0 || abs(py) > 0)
        {
            runmove = 1;
            runtimer += 1;
            runcounter += 1;
        }
        else
        {
            runtimer = 0;
        }
    }
    else
    {
        runtimer = 0;
    }
    x += px;
    y += py;
}
if (fun == 0)
{
    walk = 0;
    if (x != nowx && nopress == 0)
    {
        walk = 1;
    }
    if (y != nowy && nopress == 0)
    {
        walk = 1;
    }
    if (walk == 1)
    {
        walkbuffer = 6;
    }
    if (walkbuffer > 3 && fun == 0)
    {
        walktimer += 1.5;
        if (scr_sideb_active())
        {
            runmove = 0;
            walktimer -= 0.5;
        }
        if (runmove == 1)
        {
            walktimer += 1.5;
        }
        if (walktimer >= 40)
        {
            walktimer -= 40;
        }
        if (walktimer < 10)
        {
            image_index = 0;
        }
        if (walktimer >= 10)
        {
            image_index = 1;
        }
        if (walktimer >= 20)
        {
            image_index = 2;
        }
        if (walktimer >= 30)
        {
            image_index = 3;
        }
    }
    if (walkbuffer <= 0 && fun == 0 && climbing == 0)
    {
        if (walktimer < 10)
        {
            walktimer = 9.5;
        }
        if (walktimer >= 10 && walktimer < 20)
        {
            walktimer = 19.5;
        }
        if (walktimer >= 20 && walktimer < 30)
        {
            walktimer = 29.5;
        }
        if (walktimer >= 30)
        {
            walktimer = 39.5;
        }
        image_index = 0;
    }
    walkbuffer -= 0.75;
}
if (fun == 0)
{
    set_facing();
    if (climbing == 1)
    {
        sprite_index = climbsprite;
    }
}
if (stepping == 1 && fun == 0)
{
    if (image_index == 1 && stepped == 0)
    {
        if (global.flag[31] == 0)
        {
            snd_play(462);
        }
        stepped = 1;
    }
    if (image_index == 0 || image_index == 2)
    {
        stepped = 0;
    }
    if (image_index == 3 && stepped == 0)
    {
        if (global.flag[31] == 0)
        {
            snd_play(463);
        }
        stepped = 1;
    }
}
if (onebuffer < 0)
{
    if (global.interact == 0)
    {
        if (button1_p() && !disable_interaction_checks)
        {
            interactedobject = -4;
            thisinteract = 0;
            d = global.darkzone + 1;
            if (global.facing == 1)
            {
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, 1240, false, true))
                {
                    thisinteract = 1;
                }
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, 1182, false, true))
                {
                    thisinteract = 2;
                }
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                {
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, 1240, false, true);
                }
                if (thisinteract == 2)
                {
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x + sprite_width + (13 * d), y + sprite_height, 1182, false, true);
                }
                if (interactedobject != -4)
                {
                    with (interactedobject)
                    {
                        facing = 3;
                    }
                    with (interactedobject)
                    {
                        scr_interact();
                    }
                }
            }
            thisinteract = 0;
            if (global.facing == 3)
            {
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, 1240, false, true))
                {
                    thisinteract = 1;
                }
                if (collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, 1182, false, true))
                {
                    thisinteract = 2;
                }
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                {
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, 1240, false, true);
                }
                if (thisinteract == 2)
                {
                    interactedobject = collision_rectangle(x + (sprite_width / 2), y + (6 * d) + (sprite_height / 2), x - (13 * d), y + sprite_height, 1182, false, true);
                }
                if (interactedobject != -4)
                {
                    with (interactedobject)
                    {
                        facing = 1;
                    }
                    with (interactedobject)
                    {
                        scr_interact();
                    }
                }
            }
            thisinteract = 0;
            if (global.facing == 0)
            {
                if (collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), 1240, false, true))
                {
                    thisinteract = 1;
                }
                if (collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), 1182, false, true))
                {
                    thisinteract = 2;
                }
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                {
                    interactedobject = collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), 1240, false, true);
                }
                if (thisinteract == 2)
                {
                    interactedobject = collision_rectangle(x + (4 * d), y + (28 * d), (x + sprite_width) - (4 * d), y + sprite_height + (15 * d), 1182, false, true);
                }
                if (interactedobject != -4)
                {
                    with (interactedobject)
                    {
                        facing = 2;
                    }
                    with (interactedobject)
                    {
                        scr_interact();
                    }
                }
            }
            thisinteract = 0;
            if (global.facing == 2)
            {
                if (collision_rectangle(x + 3, (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), 1240, false, true))
                {
                    thisinteract = 1;
                }
                if (collision_rectangle(x + 3, (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), 1182, false, true))
                {
                    thisinteract = 2;
                }
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 1)
                {
                    interactedobject = collision_rectangle(x + (3 * d), (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), 1240, false, true);
                }
                if (thisinteract == 2)
                {
                    interactedobject = collision_rectangle(x + (3 * d), (y + sprite_height) - (5 * d), (x + sprite_width) - (5 * d), y + (5 * d), 1182, false, true);
                }
                if (interactedobject != -4)
                {
                    with (interactedobject)
                    {
                        facing = 0;
                    }
                    with (interactedobject)
                    {
                        scr_interact();
                    }
                }
            }
        }
        if (disable_interaction_checks)
        {
            interactedobject = -4;
        }
        if (holding_item != -4 && visible && !cutscene)
        {
            if (!i_ex(interactedobject) || interactedobject.id == holding_item.id || (interactedobject.id != holding_item.id && interactedobject.myinteract < 3))
            {
                holding_item.can_use = true;
                if (button1_p())
                {
                    var use_cancelled = holding_item.on_press();
                    is_using_held_item = use_cancelled != false;
                }
                if (button1_h() && holding_item != -4 && is_using_held_item)
                {
                    holding_item.on_hold();
                }
                if (button1_r() && holding_item != -4)
                {
                    holding_item.on_release();
                    is_using_held_item = false;
                }
            }
            else
            {
                is_using_held_item = false;
                holding_item.can_use = false;
            }
        }
        else
        {
            is_using_held_item = false;
        }
    }
}
onebuffer -= 1;
twobuffer -= 1;
threebuffer -= 1;
climbbuffer--;
if (climbbuffer <= 0)
{
    climbing = 0;
}
if (doorcooldown > 0)
{
    doorcooldown--;
    if (doorcooldown == 0)
    {
        global.start_in_platmode = 0;
    }
}
else
{
    with (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 1249, 0, 0))
    {
        event_user(9);
    }
}
if (battlemode == 1)
{
    global.inv -= 1;
    if (global.inv < 0)
    {
        with (collision_rectangle(x + 12, y + 40, x + 27, y + 49, 1381, 1, 0))
        {
            event_user(5);
        }
        with (collision_line(x + 12, y + 49, x + 19, y + 57, 1381, 1, 0))
        {
            event_user(5);
        }
        with (collision_line(x + 26, y + 49, x + 19, y + 57, 1381, 1, 0))
        {
            event_user(5);
        }
        with (collision_rectangle(x + 12, y + 40, x + 27, y + 49, 539, 1, 0))
        {
            event_user(5);
        }
        with (collision_line(x + 12, y + 49, x + 19, y + 57, 539, 1, 0))
        {
            event_user(5);
        }
        with (collision_line(x + 26, y + 49, x + 19, y + 57, 539, 1, 0))
        {
            event_user(5);
        }
    }
}
if (scr_debug())
{
    if (sunkus_kb_check_pressed(67) && sunkus_kb_check_direct(16))
    {
        global.flag[24] = (global.flag[24] + 1) % 2;
        scr_debug_print("platforming ability toggled");
    }
    if (sunkus_kb_check_pressed(72) && sunkus_kb_check_direct(16))
    {
        scr_flag_set(1311, (scr_flag_get(1311) > 0) ? 0 : 1);
        scr_debug_print("ralsei hat mode: " + string(global.flag[1311]));
    }
    if (sunkus_kb_check_pressed(45))
    {
        if (room_exists(room + 1))
        {
            room_goto_next();
        }
        else
        {
            scr_debug_print("LAST ROOM");
        }
    }
    if (sunkus_kb_check_pressed(46))
    {
        if (room_exists(room - 1))
        {
            room_goto_previous();
        }
    }
    if (sunkus_kb_check_pressed(36) && floorheight == 0)
    {
        if (sunkus_kb_check(50))
        {
            room_goto(13);
            global.plot = 0;
            global.darkzone = 0;
        }
        if (sunkus_kb_check(51))
        {
            room_goto(53);
            global.plot = 7;
            global.darkzone = 1;
        }
        if (sunkus_kb_check(55))
        {
            room_goto(68);
        }
        if (sunkus_kb_check(56))
        {
            room_goto(2);
            global.darkzone = 1;
        }
        if (sunkus_kb_check(57))
        {
            room_goto(91);
            global.darkzone = 1;
        }
    }
}
