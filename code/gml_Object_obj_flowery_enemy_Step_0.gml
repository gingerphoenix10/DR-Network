var _cx = camerax();
var _cy = cameray();
var _mcx = camerax() + camerawidth();
var _random = random(spread_range);
var _mercy = 0;
var _maxmercy = 0;
if (phase == 1)
{
    _maxmercy = 10;
}
if (phase == 2)
{
    _maxmercy = 20;
}
if (phase == 3)
{
    _maxmercy = 30;
}
if (phase == 4)
{
    _maxmercy = 40;
}
if (phase == 5)
{
    _maxmercy = 50;
}
if (phase == 6)
{
    _maxmercy = 80;
}
if (init == false)
{
    if (i_ex(1432))
    {
        krisflower = instance_create_depth(x, y, obj_herokris.depth, 208);
        krisflower.hero = 1;
    }
    if (i_ex(1433))
    {
        susieflower = instance_create_depth(x, y, obj_herosusie.depth, 208);
        susieflower.hero = 2;
    }
    if (i_ex(1434))
    {
        ralseiflower = instance_create_depth(x, y, obj_heroralsei.depth, 208);
        ralseiflower.hero = 3;
    }
    if (global.tempflag[74] == 7)
    {
        moar_tension = 1.1;
    }
    if (global.tempflag[74] == 8)
    {
        moar_tension = 1.2;
    }
    if (global.tempflag[74] == 9)
    {
        moar_tension = 1.25;
    }
    if (global.tempflag[74] == 10)
    {
        moar_tension = 1.3;
    }
    if (global.tempflag[74] == 11)
    {
        moar_tension = 1.35;
    }
    if (global.tempflag[74] == 12)
    {
        moar_tension = 1.4;
    }
    if (global.tempflag[74] >= 13)
    {
        moar_tension = 1.5;
    }
    init = true;
}
if (scr_debug())
{
    if (keyboard_check_pressed(80) && debugtimer == 0)
    {
        scr_mercyadd(myself, 10);
        mercyaddcon = 1;
        phasetransition_con = 0;
        debugtimer = 8;
        overwrite_correct = 0;
        if (phase == 2 && aqua_and_purple_enter == 0)
        {
            aqua_and_purple_enter = 1;
            debugtimer = 40;
        }
        if (phase == 3 && green_and_orange_enter == 0)
        {
            green_and_orange_enter = 1;
            debugtimer = 40;
        }
        if (phase == 4 && yellow_and_blue_enter == 0)
        {
            yellow_and_blue_enter = 1;
            debugtimer = 40;
        }
    }
    if (debugtimer > 0)
    {
        debugtimer--;
    }
    _category = "";
    var _pressed = false;
    var _pattern = "";
    if (keyboard_check_pressed(18))
    {
        pattern_category++;
        if (pattern_category > 5)
        {
            pattern_category = 0;
        }
        pattern_test = 0 + (pattern_category * 10);
        _pressed = true;
        _pattern = " - 1.";
    }
    if (keyboard_check_pressed(17))
    {
        pattern_category--;
        if (pattern_category < 0)
        {
            pattern_category = 5;
        }
        pattern_test = 0 + (pattern_category * 10);
        _pressed = true;
        _pattern = " - 1.";
    }
    switch (pattern_category)
    {
        case 0:
            _category = "No Forced Patterns.";
            category_size = 0;
            break;
        case 1:
            _category = "Jarona";
            category_size = 5;
            break;
        case 2:
            _category = "Chase";
            category_size = 9;
            break;
        case 3:
            _category = "Fist";
            category_size = 3;
            break;
        case 4:
            _category = "Boxes";
            category_size = 4;
            break;
        case 5:
            _category = "The Final Jarona";
            category_size = 1;
            break;
    }
    if (keyboard_check_pressed(49))
    {
        pattern_test = 0 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(50))
    {
        pattern_test = 1 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(51))
    {
        pattern_test = 2 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(52))
    {
        pattern_test = 3 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(53))
    {
        pattern_test = 4 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(54))
    {
        pattern_test = 5 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(55))
    {
        pattern_test = 6 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(56))
    {
        pattern_test = 7 + (pattern_category * 10);
        _pressed = true;
    }
    if (keyboard_check_pressed(57))
    {
        pattern_test = 8 + (pattern_category * 10);
        _pressed = true;
    }
    pattern_test = min(pattern_test, ((pattern_category * 10) + category_size) - 1);
    _pattern = "(N/A)";
    switch (pattern_test)
    {
        case 10:
            _pattern = "Jarona Easy";
            myattackchoice = 0;
            break;
        case 11:
            _pattern = "Jarona Medium";
            myattackchoice = 1;
            break;
        case 12:
            _pattern = "Jarona with Bullet(Med)";
            myattackchoice = 2;
            break;
        case 13:
            _pattern = "Jarona with Bullets(Hard)";
            myattackchoice = 14;
            break;
        case 14:
            _pattern = "Jarona with Orange";
            myattackchoice = 16;
            break;
        case 20:
            _pattern = "Chase Tutorial";
            myattackchoice = 3;
            break;
        case 21:
            _pattern = "Chase Open";
            myattackchoice = 4;
            break;
        case 22:
            _pattern = "Chase Closed";
            myattackchoice = 5;
            break;
        case 23:
            _pattern = "Chase Closed Hard";
            myattackchoice = 6;
            break;
        case 24:
            _pattern = "Chase Open (Random)";
            myattackchoice = 12;
            break;
        case 25:
            _pattern = "Chase With Bullets";
            myattackchoice = 13;
            break;
        case 26:
            _pattern = "Chase Blue Yellow";
            myattackchoice = 15;
            break;
        case 27:
            _pattern = "Dash Tutorial";
            myattackchoice = 17;
            break;
        case 28:
            _pattern = "Blue Chase";
            myattackchoice = 20;
            break;
        case 30:
            _pattern = "Fist Basic Easy";
            myattackchoice = 7;
            break;
        case 31:
            _pattern = "Fist Basic Med.";
            myattackchoice = 8;
            break;
        case 32:
            _pattern = "Fist Basic Hard";
            myattackchoice = 9;
            break;
        case 40:
            _pattern = "Boxes Easy";
            myattackchoice = 10;
            break;
        case 41:
            _pattern = "Boxes Medium";
            myattackchoice = 11;
            break;
        case 42:
            _pattern = "Aqua Knives";
            myattackchoice = 21;
            break;
        case 43:
            _pattern = "Rotating Stars";
            myattackchoice = 22;
            break;
        case 50:
            _pattern = "SUPER JARONA";
            myattackchoice = 19;
            break;
    }
    if (_pressed)
    {
        if (pattern_category)
        {
            scr_debug_print("Pattern set to " + _pattern);
        }
        else
        {
            scr_debug_print(_category);
        }
        with (scr_afterimage_fog(id, 16777215, 16))
        {
            depth = other.depth - 1;
            image_alpha = 0.5;
            scr_script_repeat(function()
            {
                color = make_color_hsv((global.time * 10) % 255, 255, 192);
            }, 16, 1);
        }
        snd_play(415, 0.5, 1.5);
    }
}
if (global.mercymod[myself] >= 1 && global.mercymod[myself] < 20 && phase == 1)
{
    phase = 2;
    if (ONLINE_DEBUG())
    {
        phase = 6;
    }
    actshavechangedbattlemsg = true;
    event_user(0);
}
if (global.mercymod[myself] >= 20 && global.mercymod[myself] < 30 && phase == 2)
{
    phase = 3;
    phaseturn = 0;
    event_user(0);
}
if (global.mercymod[myself] >= 30 && global.mercymod[myself] < 40 && phase == 3)
{
    phase = 4;
    phaseturn = 0;
    failedpreviousact = false;
    event_user(0);
    snd_play(357);
    with (purple_marker)
    {
        sprite_index = 8117;
    }
    with (purple_marker)
    {
        speed = 4;
    }
    with (purple_marker)
    {
        direction = 180;
    }
    with (purple_marker)
    {
        gravity_direction = 0;
    }
    with (purple_marker)
    {
        gravity = 0.3;
    }
    with (aqua_marker)
    {
        sprite_index = 3476;
    }
    with (aqua_marker)
    {
        image_speed = 1/3;
    }
    with (aqua_marker)
    {
        speed = 4;
    }
    with (aqua_marker)
    {
        direction = 180;
    }
    with (aqua_marker)
    {
        gravity_direction = 0;
    }
    with (aqua_marker)
    {
        gravity = 0.3;
    }
    NOOO_MERCY = true;
}
if (global.mercymod[myself] >= 40 && global.mercymod[myself] < 50 && phase == 4)
{
    phase = 5;
    phaseturn = 0;
    actshavechangedbattlemsg = true;
    failedpreviousact = false;
    event_user(0);
    with (green_marker)
    {
        sprite_index = 5083;
    }
    with (green_marker)
    {
        image_speed = 0;
    }
    with (green_marker)
    {
        vspeed = -10;
    }
    with (green_marker)
    {
        depth = obj_flowery_enemy.depth - 1;
    }
    with (green_marker)
    {
        scr_delay_var("image_index", 1, 13);
    }
    with (green_marker)
    {
        scr_script_delayed(snd_play, 13, 442);
    }
    with (orange_marker)
    {
        scr_delay_var("visible", false, 13);
    }
    with (orange_marker)
    {
        scr_delay_var("sprite_index", 5450, 13);
    }
    orange_fixibility_fix = 13;
    NOOO_MERCY = true;
}
if (global.mercymod[myself] >= 50 && global.mercymod[myself] < 60 && phase == 5)
{
    phase = 6;
    phaseturn = 0;
    actshavechangedbattlemsg = true;
    failedpreviousact = false;
    event_user(0);
    with (blue_marker)
    {
        scr_oflash();
    }
    with (blue_marker)
    {
        scr_lerpvar("x", x, xstart, 56, 2, "in");
    }
    with (blue_marker)
    {
        vspeed = -2;
    }
    with (blue_marker)
    {
        sprite_index = 6658;
    }
    with (blue_marker)
    {
        image_speed = 1/3;
    }
    with (yellow_marker)
    {
        sprite_index = 392;
    }
    with (yellow_marker)
    {
        scr_lerpvar("x", x, xstart + 200, 60, 2, "in");
    }
    with (yellow_marker)
    {
        vspeed = -2;
    }
    NOOO_MERCY = true;
}
if (global.mercymod[myself] >= 80 && phase == 6)
{
    phase = 7;
    phaseturn = 0;
    phasetransition_con = 20;
    event_user(0);
}
if (introcon == 1 && !i_ex(1176))
{
    global.charturn = 3;
    introtimer++;
    if (introtimer == 10)
    {
        scr_randomtarget();
        if (!instance_exists(1535))
        {
            instance_create(__view_get(UnknownEnum.Value_0, 0) + 320, __view_get(UnknownEnum.Value_1, 0) + 170, 1535);
        }
        with (1535)
        {
            visible = false;
        }
        if (!instance_exists(1439))
        {
            scr_moveheart();
        }
    }
    if (introtimer == 21)
    {
        global.monsterattackname[myself] = "FloweryDashTutorial";
        dc = scr_bulletspawner(x, y, 1453);
        dc.type = 637;
        scr_turntimer(9999999);
        introcon = 2;
        with (1412)
        {
            noreturn = 1;
        }
    }
}
if (introcon == 2 && !i_ex(1176) && !i_ex(1453))
{
    if ((global.hp[1] < 1 || global.hp[3] < 1) && phase != 5 && phase != 6)
    {
        global.actsimulsus[myself][0] = 0;
    }
    else
    {
        global.actsimulsus[myself][0] = 1;
    }
    if ((global.hp[1] < 1 || global.hp[2] < 1) && phase != 5 && phase != 6)
    {
        global.actsimulral[myself][0] = 0;
    }
    else
    {
        global.actsimulral[myself][0] = 1;
    }
    scr_spellmenu_setup();
    introcon = 3;
    if (global.hp[1] > 0)
    {
        global.charturn = 0;
    }
    else if (global.hp[2] > 0)
    {
        global.charturn = 1;
    }
    else if (global.hp[3] > 0)
    {
        global.charturn = 2;
    }
    with (1535)
    {
        growcon = 3;
    }
    with (1486)
    {
        instance_create(x, y, 1441);
        instance_destroy();
    }
}
with (1537)
{
    if (type == 5)
    {
        with (1537)
        {
            depth = -999999;
        }
    }
}
if (global.monster[myself] == 1)
{
    if (scr_isphase("enemytalk") && global.mercymod[myself] >= 100 && endcon == 0)
    {
        endcon = 1;
    }
    if (scr_isphase("enemytalk") && global.monsterhp[myself] <= (global.monstermaxhp[myself] * 0.99) && healingscenecon == 0)
    {
        if (global.flag[1873] < 3)
        {
            global.flag[1873]++;
        }
        healingscenecon = 1;
        if (global.flag[1873] >= 2)
        {
            healingscenecon = 3;
        }
        else
        {
            force_hurt_sprite = true;
        }
    }
    if (scr_isphase("enemytalk") && talked == 0 && endcon == 0 && phasetransition_con == 0 && healingscenecon == 0 && flowery_blowkiss_scene_con == 0)
    {
        event_user(1);
        scr_randomtarget();
        setbattlemsg = false;
        with (1412)
        {
            skipsusieturn = false;
        }
        with (1412)
        {
            skipralseiturn = false;
        }
        if (!instance_exists(1420))
        {
            instance_create(0, 0, 1420);
        }
        with (1430)
        {
            mercycon = 0;
        }
        if (state == 10 && sprite_index == 3757)
        {
            state = 0;
            sprite_index = 6703;
        }
        global.typer = 50;
        var __rand = choose(0, 1, 2, 3);
        if (__rand == 0)
        {
            msgsetloc(0, "Kris... isn't&your mother&calling you?/%", "obj_flowery_enemy_slash_Step_0_gml_544_0");
        }
        if (__rand == 1)
        {
            msgsetloc(0, "Asgore... I&won't let you&down, oldbuddy!/%", "obj_flowery_enemy_slash_Step_0_gml_545_0_b");
        }
        if (__rand == 2)
        {
            msgsetloc(0, "Hah! You think&you can match&my style!?/%", "obj_flowery_enemy_slash_Step_0_gml_546_0");
        }
        if (__rand == 3)
        {
            msgsetloc(0, "Is that really&just what \"HEROES\"&can do!?/%", "obj_flowery_enemy_slash_Step_0_gml_547_0");
        }
        ballooncon = 0;
        balloonend = 1;
        with (1412)
        {
            noreturn = 0;
        }
        if ((phase == 1 || phase == 2) && phase_1_2_turn < 6)
        {
            phase_1_2_turn++;
            if (damage_taken_during_tutorial >= 4)
            {
                msgsetloc(0, "I'll never let you&get to the Dark&Fountain...!/%", "obj_flowery_enemy_slash_Step_0_gml_366_0");
                ballooncon = 2;
                balloonend = 0;
                phase_1_2_turn--;
                damage_taken_during_tutorial = 0;
            }
            else if (global.flag[1865] > 1 && phase_1_2_turn == 1)
            {
                if (ralsei_tutorial_string_con != -1)
                {
                    ralsei_tutorial_string_con = 1;
                }
                msgsetloc(0, "Here^1, let me&start over.../%", "obj_flowery_enemy_slash_Step_0_gml_374_0");
                ballooncon = 99;
                balloonend = 0;
            }
            else if (phase_1_2_turn == 2 || (global.flag[1865] == 1 && phase_1_2_turn == 1))
            {
                msgsetloc(0, "You know^1, I had&wanted you&to meet the&other flowers./%", "obj_flowery_enemy_slash_Step_0_gml_380_0");
                ballooncon = 11;
                balloonend = 0;
                if (global.flag[1865] == 1)
                {
                    phase_1_2_turn = 2;
                }
            }
            else if (phase_1_2_turn == 3)
            {
                msgsetloc(0, "If everyone&could just&be friends.../%", "obj_flowery_enemy_slash_Step_0_gml_386_0");
                ballooncon = 12;
                balloonend = 0;
            }
            else if (phase_1_2_turn == 4)
            {
                msgsetloc(0, "But^1, I see your&hearts are set&in stone./%", "obj_flowery_enemy_slash_Step_0_gml_393_0");
                ballooncon = 13;
                balloonend = 0;
            }
            else if (phase_1_2_turn == 5)
            {
                msgsetloc(0, "Imagine that...&a branch where&we didn't have&to fight./%", "obj_flowery_enemy_slash_Step_0_gml_399_0");
                ballooncon = 14;
                balloonend = 0;
            }
        }
        else if (phase == 3 && phases3turn < 4)
        {
            phases3turn++;
            if (phases3turn == 1)
            {
                msgsetloc(0, "I won't lose...&My friends are&behind me!/%", "obj_flowery_enemy_slash_Step_0_gml_408_0");
                ballooncon = 31;
                balloonend = 0;
                if (aqua_and_purple_enter == 0)
                {
                    aqua_and_purple_enter = 1;
                }
                global.battlemsg[0] = stringsetloc("* Flowery's friends Aqua and Seth appeared!", "obj_flowery_enemy_slash_Step_0_gml_822_0");
            }
            else if (phases3turn == 2)
            {
                msgsetloc(0, "Aqua^1! Let's play&knife cutting game!/%", "obj_flowery_enemy_slash_Step_0_gml_548_0");
                ballooncon = 33;
                balloonend = 0;
            }
            else if (phases3turn == 3)
            {
                msgsetloc(0, "Asgore!!&Play, play!!/%", "obj_flowery_enemy_slash_Step_0_gml_422_0");
                ballooncon = 34;
                balloonend = 0;
            }
            else if (phases3turn == 4)
            {
                msgsetloc(0, "This is.../%", "obj_flowery_enemy_slash_Step_0_gml_625_0");
                ballooncon = 34.1;
                balloonend = 0;
            }
        }
        else if (phase == 4 && phases4turn < 4)
        {
            phases4turn++;
            if (phases4turn == 1)
            {
                if (green_and_orange_enter == 0)
                {
                    green_and_orange_enter = 1;
                }
                msgsetloc(0, "Orange^1! Be brave,&it's your turn!/%", "obj_flowery_enemy_slash_Step_0_gml_431_0");
                ballooncon = 41;
                balloonend = 0;
            }
            else if (phases4turn == 2)
            {
                msgsetloc(0, "Green! How about&a $999 tip!?/%", "obj_flowery_enemy_slash_Step_0_gml_437_0");
                ballooncon = 0;
                balloonend = 1;
                green_marker.sprite_index = 5634;
            }
            else if (phases4turn == 3)
            {
                msgsetloc(0, "Asgore... if I'm&courageous... you'll&be proud of me, right!?/%", "obj_flowery_enemy_slash_Step_0_gml_445_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (phases4turn == 4)
            {
                msgsetloc(0, "Why won't you&LOSE!?/%", "obj_flowery_enemy_slash_Step_0_gml_657_0");
                ballooncon = 60;
                balloonend = 0;
            }
        }
        else if (phase == 5 && phases5turn < 4)
        {
            phases5turn++;
            if (phases5turn == 1)
            {
                idlesprite = 6703;
                if (yellow_and_blue_enter == 0)
                {
                    yellow_and_blue_enter = 1;
                }
                msgsetloc(0, "... Blue!/%", "obj_flowery_enemy_slash_Step_0_gml_454_0");
                ballooncon = 51;
                balloonend = 0;
            }
            else if (phases5turn == 2)
            {
                msgsetloc(0, "Yellow! Tonight...&justice rides&together!/%", "obj_flowery_enemy_slash_Step_0_gml_460_0");
                ballooncon = 52;
                balloonend = 0;
            }
            else if (phases5turn == 3)
            {
                msgsetloc(0, "Asgore!! This&justice's for you!/%", "obj_flowery_enemy_slash_Step_0_gml_466_0");
                ballooncon = 53;
                balloonend = 0;
            }
        }
        else if (phase == 6 && phases6turn < 3)
        {
            phases6turn++;
            if (phases6turn == 1)
            {
                msgsetloc(0, "Enough, Kris!&I don't need a trial&to expose the truth!/%", "obj_flowery_enemy_slash_Step_0_gml_31_0");
                ballooncon = 200;
                balloonend = 0;
            }
            else if (phases6turn == 2)
            {
                msgsetloc(0, "... that's not&like you, Kris!/%", "obj_flowery_enemy_slash_Step_0_gml_697_0");
                ballooncon = 0;
                balloonend = 1;
            }
        }
        global.typer = 50;
        if (phase == 3 && phases3turn == 3)
        {
            global.typer = 50;
            scr_enemyblcon(aqua_marker.x - 28, aqua_marker.y + 40, 10);
            with (1531)
            {
                flowery_aqua_float = true;
            }
        }
        else if (ballooncon == 34.1)
        {
            global.typer = 50;
            scr_enemyblcon(purple_marker.x - 18, purple_marker.y + 20, 10);
            with (1531)
            {
                flowery_aqua_float = true;
            }
        }
        else if (ballooncon == 53)
        {
            global.typer = 50;
            scr_enemyblcon(yellow_marker.x - 34, yellow_marker.y + 97, 10);
            with (1531)
            {
                flowery_aqua_float = true;
            }
        }
        else if ((phase == 4 && phases4turn == 3) || (phase == 4 && phases4turn == 4))
        {
            global.typer = 50;
            scr_enemyblcon(orange_marker.x - 10, orange_marker.y + 15, 10);
            with (1531)
            {
                flowery_float = true;
            }
            if (phases4turn == 4)
            {
                phases4turn++;
            }
        }
        else if (ralseitalks == 1 && instance_exists(1434))
        {
            global.typer = 74;
            scr_enemyblcon(obj_heroralsei.x + 95, obj_heroralsei.y + 48, 14);
            scr_guardpeek(1434);
        }
        else if (susietalks == 1 && instance_exists(1433))
        {
            global.typer = 75;
            scr_enemyblcon(obj_herosusie.x + 95, obj_herosusie.y + 40, 14);
            scr_guardpeek(1433);
        }
        else
        {
            scr_enemyblcon(x - 8, y + 40, 10);
            with (1531)
            {
                flowery_float = true;
            }
        }
        ralseitalks = 0;
        susietalks = 0;
        if (balloonend == 1)
        {
            talked = 0.5;
            talktimer = 0;
            alarm[6] = 1;
        }
        else
        {
            talked = 0.6;
            talktimer = 0;
        }
        rtimer = 0;
    }
    if (talked == 0.6 && yellow_and_blue_enter != 1)
    {
        talktimer++;
        if ((button3_p() && talktimer > 15) || !i_ex(1176))
        {
            with (1176)
            {
                instance_destroy();
            }
            if (ballooncon == 1)
            {
                msgsetloc(0, "Try keeping up&with THIS!/%", "obj_flowery_enemy_slash_Step_0_gml_523_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 2)
            {
                msgsetloc(0, "Hey^1, tutorial boy!&Stop dazzling and&teach them&how to fight./%", "obj_flowery_enemy_slash_Step_0_gml_525_0");
                ballooncon = 3;
                balloonend = 0;
            }
            else if (ballooncon == 3)
            {
                msgsetloc(0, "\\EC* I, I.../", "obj_flowery_enemy_slash_Step_0_gml_526_0");
                msgnextsubloc("\\EA* Kris... hold down&~1&to charge.../", scr_get_input_name(4), "obj_flowery_enemy_slash_Step_0_gml_763_0");
                msgnextloc("\\EQ* ... and release it to dash!/", "obj_flowery_enemy_slash_Step_0_gml_750_0");
                msgnextloc("\\EI* Tap the button for a short dash, and hold it to go a little longer!/", "obj_flowery_enemy_slash_Step_0_gml_765_0");
                msgnextloc("\\EA* While dashing, you can hit blue bullets.../", "obj_flowery_enemy_slash_Step_0_gml_529_0");
                msgnextloc("\\EQ* Doing this gives you a speed boost, so hit as many as you can!/", "obj_flowery_enemy_slash_Step_0_gml_530_0");
                msgnextloc("\\ER* ... and, Kris?/", "obj_flowery_enemy_slash_Step_0_gml_531_0");
                msgnextloc("\\Ej* Don't hold back./%", "obj_flowery_enemy_slash_Step_0_gml_532_0");
                ballooncon = 10;
                balloonend = 0;
                ralseitalks = 2;
            }
            else if (ballooncon == 10)
            {
                msgsetloc(0, "..^1. as if you&have a choice!/%", "obj_flowery_enemy_slash_Step_0_gml_533_0");
                ballooncon = 0;
                ralseitalks = 0;
                balloonend = 1;
                with (242)
                {
                    instance_destroy();
                }
            }
            else if (ballooncon == 99)
            {
                msgsetloc(0, "Maybe^1, just maybe,&this time you'll&LISTEN!/%", "obj_flowery_enemy_slash_Step_0_gml_536_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 11)
            {
                msgsetloc(0, "..^1. to see how &wonderful they&all are./%", "obj_flowery_enemy_slash_Step_0_gml_539_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 12)
            {
                msgsetloc(0, "You might&turn over&a new leaf./%", "obj_flowery_enemy_slash_Step_0_gml_541_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 13)
            {
                msgsetloc(0, "Your world^1, your&Fountain is more&important than&ours.../%", "obj_flowery_enemy_slash_Step_0_gml_543_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 14)
            {
                msgsetloc(0, "We could even&call it a&\"pacifist root\"./%", "obj_flowery_enemy_slash_Step_0_gml_545_0");
                ballooncon = 0;
                balloonend = 1;
            }
            else if (ballooncon == 31)
            {
                msgsetloc(0, "Seth^1, remember&the patterns&I taught you!?/%", "obj_flowery_enemy_slash_Step_0_gml_416_0");
                ballooncon = 32;
                balloonend = 0;
            }
            else if (ballooncon == 32)
            {
                msgsetloc(0, "Heh, I improved&them! Watch!/%", "obj_flowery_enemy_slash_Step_0_gml_551_0");
                balloonend = 1;
            }
            else if (ballooncon == 33)
            {
                msgsetloc(0, "Uee hee hee,&it's always so&fun!/%", "obj_flowery_enemy_slash_Step_0_gml_549_0");
                balloonend = 1;
            }
            else if (ballooncon == 34)
            {
                msgsetloc(0, "Just gotta get&smarter...for Asgore!/%", "obj_flowery_enemy_slash_Step_0_gml_555_0");
                balloonend = 1;
            }
            else if (ballooncon == 34.1)
            {
                msgsetloc(0, "Our dream!/%", "obj_flowery_enemy_slash_Step_0_gml_777_0");
                ballooncon = 34.2;
                balloonend = 0;
            }
            else if (ballooncon == 34.2)
            {
                msgsetloc(0, "Uuu,&nightmare,&nightmare!/%", "obj_flowery_enemy_slash_Step_0_gml_778_0");
                balloonend = 1;
            }
            else if (ballooncon == 41)
            {
                msgsetloc(0, "Flowery! Big bro! They&won't beat our COMBO!/%", "obj_flowery_enemy_slash_Step_0_gml_556_0");
                balloonend = 1;
            }
            else if (ballooncon == 60)
            {
                msgsetloc(0, "Don't cry, Orange.&Tears are for a&wedding's day.../%", "obj_flowery_enemy_slash_Step_0_gml_783_0");
                balloonend = 1;
            }
            else if (ballooncon == 51)
            {
                msgsetloc(0, "We know, Flowery...&we're here to play&our part./%", "obj_flowery_enemy_slash_Step_0_gml_559_0");
                balloonend = 1;
            }
            else if (ballooncon == 52)
            {
                msgsetloc(0, "You got it,&pard'ner!!/%", "obj_flowery_enemy_slash_Step_0_gml_561_0");
                balloonend = 1;
            }
            else if (ballooncon == 53)
            {
                msgsetloc(0, "Will he witness&our dance?/%", "obj_flowery_enemy_slash_Step_0_gml_563_0");
                balloonend = 1;
            }
            else if (ballooncon == 200)
            {
                msgsetloc(0, "We've watched you&since you were a&child.../%", "obj_flowery_enemy_slash_Step_0_gml_43_0");
                ballooncon = 201;
                balloonend = 0;
            }
            else if (ballooncon == 201)
            {
                msgsetloc(0, "And I know that&you've CHANGED!/%", "obj_flowery_enemy_slash_Step_0_gml_58_0");
                ballooncon = 202;
                balloonend = 0;
            }
            else if (ballooncon == 202)
            {
                msgsetloc(0, "I don't know&what your plans&are, but.../%", "obj_flowery_enemy_slash_Step_0_gml_73_0");
                ballooncon = 203;
                balloonend = 0;
            }
            else if (ballooncon == 203)
            {
                msgsetloc(0, "If they involve&Asgore... this is&as far as you go!/%", "obj_flowery_enemy_slash_Step_0_gml_88_0");
                ballooncon = 204;
                balloonend = 0;
            }
            else if (ballooncon == 204)
            {
                msgsetloc(0, "Feel it!&Smell it!&The power&of flowers!/%", "obj_flowery_enemy_slash_Step_0_gml_691_0");
                ballooncon = 0;
                balloonend = 1;
            }
            talked = 0.7;
            global.typer = 50;
            if ((ballooncon == 34.2 && balloonend == 1) || (ballooncon == 33 && balloonend == 1))
            {
                global.typer = 50;
                scr_enemyblcon(aqua_marker.x - 28, aqua_marker.y + 40, 10);
                ballooncon = 0;
                with (1531)
                {
                    flowery_aqua_float = true;
                }
            }
            else if ((ballooncon == 32 && balloonend == 1) || ballooncon == 34)
            {
                global.typer = 50;
                scr_enemyblcon(purple_marker.x - 18, purple_marker.y + 20, 10);
                ballooncon = 0;
                with (1531)
                {
                    flowery_aqua_float = true;
                }
            }
            else if (ballooncon == 41)
            {
                global.typer = 50;
                scr_enemyblcon(orange_marker.x - 10, orange_marker.y + 15, 10);
                ballooncon = 0;
                with (1531)
                {
                    flowery_float = true;
                }
            }
            else if (ballooncon == 52)
            {
                global.typer = 50;
                scr_enemyblcon(yellow_marker.x - 34, yellow_marker.y + 97, 10);
                ballooncon = 0;
                with (1531)
                {
                    flowery_aqua_float = true;
                }
            }
            else if (ballooncon == 51 || ballooncon == 53)
            {
                global.typer = 50;
                scr_enemyblcon(blue_marker.x - 28, blue_marker.y + 54, 10);
                ballooncon = 0;
                with (1531)
                {
                    flowery_aqua_float = true;
                }
            }
            else if (ralseitalks == 1 && instance_exists(1434))
            {
                global.typer = 74;
                scr_enemyblcon(obj_heroralsei.x + 95, obj_heroralsei.y + 48, 14);
                scr_guardpeek(1434);
            }
            else if (ralseitalks == 2 && instance_exists(1434))
            {
                scr_speaker("ralsei");
                scr_anyface_next("ralsei", "i");
                scr_battletext();
            }
            else if (susietalks == 1 && instance_exists(1433))
            {
                global.typer = 75;
                scr_enemyblcon(obj_herosusie.x + 95, obj_herosusie.y + 40, 14);
                scr_guardpeek(1433);
            }
            else
            {
                scr_enemyblcon(x - 8, y + 40, 10);
                with (1531)
                {
                    flowery_float = true;
                }
            }
            susietalks = 0;
            ralseitalks = 0;
            alarm[6] = 1;
        }
    }
    if (talked == 1 && scr_isphase("enemytalk") && endcon == 0 && phasetransition_con == 0 && healingscenecon == 0 && flowery_blowkiss_scene_con == 0 && !i_ex(1176))
    {
        global.mnfight = 1.5;
    }
    if (global.mnfight == 1.5 && endcon == 0 && phasetransition_con == 0 && healingscenecon == 0 && flowery_blowkiss_scene_con == 0)
    {
        if (!instance_exists(1535))
        {
            instance_create(__view_get(UnknownEnum.Value_0, 0) + 320, __view_get(UnknownEnum.Value_1, 0) + 170, 1535);
        }
        with (1535)
        {
            maxxscale = camerawidth() / 70;
            maxyscale = 0.6779661016949152;
            x -= 5;
            if (other.myattackchoice == 17)
            {
                visible = false;
            }
        }
        if (myattackchoice == 0 || myattackchoice == 1 || myattackchoice == 2 || myattackchoice == 16 || myattackchoice == 18 || myattackchoice == 19 || myattackchoice == 7 || myattackchoice == 8 || myattackchoice == 9)
        {
            var _jarona = instance_create(x, y, 709);
            if (myattackchoice == 18)
            {
                _jarona.can_kidding = true;
            }
            if (myattackchoice == 19)
            {
                _jarona.visible = false;
                depth = obj_growtangle.depth + 1;
            }
            else
            {
                visible = false;
            }
        }
        else
        {
            depth = obj_growtangle.depth + 1;
        }
        if (myattackchoice == 8 || myattackchoice == 16)
        {
            with (orange_marker)
            {
                visible = false;
                with (instance_create(x, y, 1238))
                {
                    sprite_index = 309;
                    scr_darksize();
                    depth = obj_growtangle.depth - 1;
                    scr_lerpvar("x", x, camerax() + 530, 15);
                    scr_lerpvar("y", y, cameray() + 224, 15);
                    scr_doom(id, 15);
                }
            }
        }
        if (!instance_exists(1439))
        {
            with (scr_moveheart())
            {
                distx = (obj_growtangle.x - 10 - 75) + 10;
                disty = (obj_growtangle.y - 10) + 10;
                dist = point_distance(x, y, distx, disty);
                move_towards_point(distx, disty, dist / 12);
                alarm[0] = 12;
            }
        }
        global.mnfight = 2;
        scr_turntimer(90);
        if (!instance_exists(1439))
        {
            with (scr_moveheart())
            {
                distx = (obj_growtangle.x - 10 - 75) + 10;
                disty = (obj_growtangle.y - 10) + 10;
                dist = point_distance(x, y, distx, disty);
                move_towards_point(distx, disty, dist / 12);
                alarm[0] = 12;
            }
        }
        global.mnfight = 2;
        scr_turntimer(90);
    }
    if (scr_isphase("bullets") && attacked == 0 && endcon == 0 && healingscenecon == 0 && flowery_blowkiss_scene_con == 0)
    {
        rtimer++;
        if (rtimer == 12)
        {
            with (585)
            {
                instance_destroy();
            }
            with (kawkaw_marker)
            {
                if (sprite_index == 8337)
                {
                    sprite_index = 6566;
                    image_xscale = 2;
                    x -= 82;
                }
            }
            with (green_marker)
            {
                sprite_index = 8303;
            }
            if (myattackchoice == 0)
            {
                global.monsterattackname[myself] = "FloweryDeflect1";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 620;
                scr_turntimer(3200);
            }
            if (myattackchoice == 1)
            {
                global.monsterattackname[myself] = "FloweryDeflect2";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 621;
                scr_turntimer(3200);
            }
            if (myattackchoice == 2)
            {
                global.monsterattackname[myself] = "FloweryDeflect3";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 634;
                scr_turntimer(3200);
            }
            if (myattackchoice == 3)
            {
                global.monsterattackname[myself] = "FloweryWallsTutorial";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 623;
                scr_turntimer(320);
            }
            if (myattackchoice == 4)
            {
                global.monsterattackname[myself] = "FloweryChase";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 624;
                scr_turntimer(320);
            }
            if (myattackchoice == 5)
            {
                global.monsterattackname[myself] = "FloweryChase2";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 625;
                scr_turntimer(320);
            }
            if (myattackchoice == 6)
            {
                global.monsterattackname[myself] = "FloweryChase2Harder";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 626;
                scr_turntimer(320);
            }
            if (myattackchoice == 7)
            {
                global.monsterattackname[myself] = "FloweryBulletsFistEasy";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 627;
                scr_turntimer(320);
            }
            if (myattackchoice == 8)
            {
                global.monsterattackname[myself] = "FloweryBulletsFistMedium";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 628;
                scr_turntimer(320);
            }
            if (myattackchoice == 9)
            {
                global.monsterattackname[myself] = "FloweryBulletsFistHard";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 629;
                scr_turntimer(320);
            }
            if (myattackchoice == 10)
            {
                global.monsterattackname[myself] = "FloweryBoxesEasy";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 630;
                scr_turntimer(320);
            }
            if (myattackchoice == 11)
            {
                global.monsterattackname[myself] = "FloweryBoxesMedium";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 631;
                scr_turntimer(320);
            }
            if (myattackchoice == 12)
            {
                global.monsterattackname[myself] = "FloweryChase2Random";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 632;
                scr_turntimer(320);
            }
            if (myattackchoice == 13)
            {
                global.monsterattackname[myself] = "FloweryChaseWithBullets";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 633;
                scr_turntimer(320);
            }
            if (myattackchoice == 14)
            {
                global.monsterattackname[myself] = "FloweryDeflect2point5";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 622;
                scr_turntimer(3200);
            }
            if (myattackchoice == 15)
            {
                global.monsterattackname[myself] = "FloweryChaseBlueYellow";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 635;
                scr_turntimer(320);
            }
            if (myattackchoice == 16)
            {
                global.monsterattackname[myself] = "FloweryDeflectOrange";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 636;
                scr_turntimer(3200);
            }
            if (myattackchoice == 17)
            {
                global.monsterattackname[myself] = "FloweryDashTutorial";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 637;
                scr_turntimer(9999999);
            }
            if (myattackchoice == 18)
            {
                global.monsterattackname[myself] = "JustKidding";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 638;
                scr_turntimer(3800);
            }
            if (myattackchoice == 19)
            {
                global.monsterattackname[myself] = "SuperJarona";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 639;
                scr_turntimer(9999);
            }
            if (myattackchoice == 20)
            {
                global.monsterattackname[myself] = "BlueChase";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 640;
                scr_turntimer(380);
            }
            if (myattackchoice == 21)
            {
                global.monsterattackname[myself] = "AquaKnives";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 641;
                scr_turntimer(320);
            }
            if (myattackchoice == 22)
            {
                global.monsterattackname[myself] = "OrbitStars";
                dc = scr_bulletspawner(x, y, 1453);
                dc.type = 647;
                scr_turntimer(320);
            }
            turns++;
            attacked = 1;
        }
    }
    if (global.mnfight == 2 && global.turntimer <= 1)
    {
        if (setbattlemsg == false)
        {
            if ((global.hp[1] < 1 || global.hp[3] < 1) && phase != 5 && phase != 6)
            {
                global.actsimulsus[myself][0] = 0;
            }
            else
            {
                global.actsimulsus[myself][0] = 1;
            }
            if ((global.hp[1] < 1 || global.hp[2] < 1) && phase != 5 && phase != 6)
            {
                global.actsimulral[myself][0] = 0;
            }
            else
            {
                global.actsimulral[myself][0] = 1;
            }
            scr_spellmenu_setup();
            if (phase == 5)
            {
                event_user(0);
            }
            tpsave = global.tension;
            global.typer = 6;
            global.fc = 0;
            draw_set_valign(0);
            draw_set_halign(0);
            if (phase == 1 || phase == 2)
            {
                rr = choose(0, 1, 2);
                if (rr == 0)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery emits the fragrance of hope!", "obj_flowery_enemy_slash_Step_0_gml_815_0");
                }
                if (rr == 1)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery holds onto his dream.", "obj_flowery_enemy_slash_Step_0_gml_816_0");
                }
                if (rr == 2)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery blooms in bravery.", "obj_flowery_enemy_slash_Step_0_gml_817_0");
                }
            }
            if (phase == 3)
            {
                if (aqua_phase_balloon_order <= 1)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery's friends Aqua and Seth appeared!", "obj_flowery_enemy_slash_Step_0_gml_822_0");
                    if (phaseturn < 1)
                    {
                        phaseturn = 1;
                    }
                }
                if (aqua_phase_balloon_order == 2)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery shows Aqua how to safely hold a knife!", "obj_flowery_enemy_slash_Step_0_gml_823_0");
                }
                if (aqua_phase_balloon_order == 3)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery shows Seth how to be more confident!", "obj_flowery_enemy_slash_Step_0_gml_824_0");
                }
                if (aqua_phase_balloon_order >= 4)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery looks on at Aqua and Seth proudly!", "obj_flowery_enemy_slash_Step_0_gml_825_0");
                }
                aqua_phase_balloon_order++;
            }
            if (phase == 4)
            {
                if (orange_phase_balloon_order == 1)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery's little sister Orange^1, and kitchen partner Green appeared!", "obj_flowery_enemy_slash_Step_0_gml_829_0");
                }
                if (orange_phase_balloon_order == 2)
                {
                    global.battlemsg[0] = stringsetloc("* Orange rides on Flowery's fist as they punch together!", "obj_flowery_enemy_slash_Step_0_gml_830_0");
                }
                if (orange_phase_balloon_order == 3)
                {
                    global.battlemsg[0] = stringsetloc("* Green and Flowery come up with a new recipe!", "obj_flowery_enemy_slash_Step_0_gml_831_0");
                }
                if (orange_phase_balloon_order >= 4)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery looks on at Orange and Green proudly!", "obj_flowery_enemy_slash_Step_0_gml_832_0");
                    phaseturn = 2;
                }
                orange_phase_balloon_order++;
            }
            if (phase == 5)
            {
                if (phaseturn == 1)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery's sparring partner Yellow and dance rival Blue appeared!", "obj_flowery_enemy_slash_Step_0_gml_836_0");
                }
                if (phaseturn == 2)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery and Yellow point towards you side-by-side!", "obj_flowery_enemy_slash_Step_0_gml_837_0");
                }
                if (phaseturn == 3)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery pirouettes^1! ..^1. but^1, Blue shakes his head.", "obj_flowery_enemy_slash_Step_0_gml_838_0");
                }
                if (phaseturn >= 4)
                {
                    global.battlemsg[0] = stringsetloc("* Flowery and Yellow stand strong against you!&* Blue hangs back...", "obj_flowery_enemy_slash_Step_0_gml_839_0");
                }
            }
            if (actshavechangedbattlemsg == true && phase != 5)
            {
                global.battlemsg[0] = stringsetloc("* Your ACTs changed!", "obj_flowery_enemy_slash_Step_0_gml_1025_0");
                actshavechangedbattlemsg = false;
            }
            if (phase == 6)
            {
                global.battlemsg[0] = stringsetloc("* Susie glances at you..^1. she looks like she has an idea!", "obj_flowery_enemy_slash_Step_0_gml_841_0");
            }
            if (ralsei_tutorial_string_con == 1)
            {
                scr_speaker("ralsei");
                global.battlemsg[0] = stringsetsub(ralsei_tutorial_string, scr_get_input_name(4));
                ralsei_tutorial_string_con = 0;
            }
            if (partytiredbattlemsg == true)
            {
                global.battlemsg[0] = stringsetloc("* TP gain reduced this turn!", "obj_flowery_enemy_slash_Step_0_gml_862_0");
                partytiredbattlemsg = false;
            }
            setbattlemsg = true;
            with (1430)
            {
                mercycon = 1;
            }
        }
    }
}
if (global.myfight == 3)
{
    xx = __view_get(UnknownEnum.Value_0, 0);
    yy = __view_get(UnknownEnum.Value_1, 0);
    if (acting == 1 && actcon == 0)
    {
        actcon = 1;
        sprite_set_offset(6711, 10, 0);
        global.writerimg[0] = 6711;
        global.writerimg[1] = 6711;
        msgsetloc(0, "* FLOWERY - AT \\I0 DF \\I1&* A being taken shape from the Golden Flower./", "obj_flowery_enemy_slash_Step_0_gml_886_0");
        msgnextloc("* Everything about him is an illusion..^1. but^1, with hope^1, can he make it real!?/%", "obj_flowery_enemy_slash_Step_0_gml_887_0");
        scr_battletext_default();
    }
    if (phase == 1)
    {
        var _str = stringsetloc("* Press with the right timing to POSE!", "obj_flowery_enemy_slash_Step_0_gml_893_0");
        if (acting == 2 && actcon == 0)
        {
            acting = 3.1;
            pose_alone = true;
            msgsetsubloc(0, "* You posed alone!&~1/%", _str, "obj_flowery_enemy_slash_Step_0_gml_903_0");
            scr_battletext_default();
        }
        if (acting == 3 && actcon == 0)
        {
            acting = 3.1;
            pose_alone = false;
            msgsetsubloc(0, "* Everyone posed together!&~1/%", _str, "obj_flowery_enemy_slash_Step_0_gml_913_0");
            scr_battletext_default();
            if (shi_recruited)
            {
                with (shi_marker)
                {
                    scr_move_to_point_over_time(camerax() + 290, y, 8);
                }
            }
            if (shinobeetle_recruited)
            {
                with (shinobeetle_marker)
                {
                    scr_move_to_point_over_time(camerax() + 270, y, 8);
                }
            }
            if (kawkaw_recruited)
            {
                with (kawkaw_marker)
                {
                    scr_move_to_point_over_time(camerax() + 180, y, 8);
                }
            }
        }
        if (acting == 3.1 && actcon == 0 && ((i_ex(1176) && obj_writer.reachedend == 1) || !i_ex(1176)))
        {
            instance_create(camerax() + 304, cameray() + 80, 700);
            box = instance_create(camerax() + 320, cameray() + 220, 1168);
            box.parentid = id;
            acting = 3.2;
        }
        if (acting == 3.2 && actcon == 0 && !i_ex(1168))
        {
            scr_battle_sprite_reset("kris");
            scr_battle_sprite_reset("susie");
            scr_battle_sprite_reset("ralsei");
            with (1176)
            {
                instance_destroy();
            }
        }
        if (create_afterimage == true)
        {
            create_afterimage_timer++;
            if ((create_afterimage_timer % 6) == 0)
            {
                var _heroobj = 1430;
                if (pose_alone == true)
                {
                    _heroobj = 1432;
                }
                with (_heroobj)
                {
                    afterimage = instance_create(x, y, 1009);
                    afterimage.sprite_index = sprite_index;
                    afterimage.image_index = image_index;
                    afterimage.image_blend = image_blend;
                    afterimage.image_speed = 0;
                    afterimage.depth = depth;
                    afterimage.image_xscale = image_xscale;
                    afterimage.image_yscale = image_yscale;
                    afterimage.image_angle = image_angle;
                    with (afterimage)
                    {
                        speed = 2.7;
                        direction = irandom(360);
                        fadeSpeed = 0.1;
                    }
                }
                if (shi_recruited)
                {
                    with (shi_marker)
                    {
                        afterimage = instance_create(x, y, 1009);
                        afterimage.sprite_index = sprite_index;
                        afterimage.image_index = image_index;
                        afterimage.image_blend = image_blend;
                        afterimage.image_speed = 0;
                        afterimage.depth = depth;
                        afterimage.image_xscale = image_xscale;
                        afterimage.image_yscale = image_yscale;
                        afterimage.image_angle = image_angle;
                        with (afterimage)
                        {
                            speed = 2.7;
                            direction = irandom(360);
                            fadeSpeed = 0.1;
                        }
                    }
                }
                if (shinobeetle_recruited)
                {
                    with (shinobeetle_marker)
                    {
                        afterimage = instance_create(x, y, 1009);
                        afterimage.sprite_index = sprite_index;
                        afterimage.image_index = image_index;
                        afterimage.image_blend = image_blend;
                        afterimage.image_speed = 0;
                        afterimage.depth = depth;
                        afterimage.image_xscale = image_xscale;
                        afterimage.image_yscale = image_yscale;
                        afterimage.image_angle = image_angle;
                        with (afterimage)
                        {
                            speed = 2.7;
                            direction = irandom(360);
                            fadeSpeed = 0.1;
                        }
                    }
                }
                if (kawkaw_recruited)
                {
                    with (kawkaw_marker)
                    {
                        afterimage = instance_create(x, y, 1009);
                        afterimage.sprite_index = sprite_index;
                        afterimage.image_index = image_index;
                        afterimage.image_blend = image_blend;
                        afterimage.image_speed = 0;
                        afterimage.depth = depth;
                        afterimage.image_xscale = image_xscale;
                        afterimage.image_yscale = image_yscale;
                        afterimage.image_angle = image_angle;
                        with (afterimage)
                        {
                            speed = 2.7;
                            direction = irandom(360);
                            fadeSpeed = 0.1;
                        }
                    }
                }
            }
        }
    }
    if (phase == 2)
    {
        if ((acting == 2 || acting == 3) && actcon == 0)
        {
            msgsetsubloc(0, "* ~1 repeatedly to blow away!", scr_get_input_name(4), scr_get_input_name(6), "obj_flowery_enemy_slash_Step_0_gml_1028_0");
            scr_battletext_default();
            with (1176)
            {
                rate = 33;
                pos = 60;
            }
            custombody = 0;
            if (acting == 2)
            {
                custombody = 1;
            }
            scr_battle_sprite_set("kris", 2995, 0, true);
            if (acting == 3)
            {
                scr_battle_sprite_set("susie", 3456, 0, true);
                scr_battle_sprite_set("ralsei", 5286, 0, true);
                if (floradinn_recruited)
                {
                    with (floradin_marker)
                    {
                        scr_move_to_point_over_time(camerax() + 180, y, 8);
                    }
                }
                if (leafling_recruited)
                {
                    with (leafling_marker)
                    {
                        scr_move_to_point_over_time(camerax() + 180, y, 8);
                    }
                }
                if (kawkaw_recruited)
                {
                    with (kawkaw_marker)
                    {
                        scr_move_to_point_over_time(camerax() + 180, y, 8);
                    }
                }
                with (1430)
                {
                    scr_oflash();
                    a = scr_afterimage();
                    a.hspeed = 2.5;
                    a.depth = depth + 1;
                    b = scr_afterimage();
                    b.image_alpha = 0.6;
                    b.hspeed = 5;
                    b.depth = depth + 2;
                }
            }
            acting = 101;
        }
    }
    if (acting == 101 && actcon == 0)
    {
        if (progress > 0)
        {
            progress -= 0.2;
        }
        if (button1_p() == 1 && presscount_1 < 5)
        {
            snd_stop(359);
            snd_play_x(359, 1, 1 + (presstimer / 100));
            state = 10;
            image_speed = 0;
            image_index = 0.5;
            sprite_index = 1497;
            if (floradinn_recruited)
            {
                with (floradin_marker)
                {
                    image_index = 1;
                }
            }
            if (leafling_recruited)
            {
                with (leafling_marker)
                {
                    image_index = 1;
                }
            }
            if (kawkaw_recruited)
            {
                with (kawkaw_marker)
                {
                    image_index = 1;
                }
            }
            progress += 12;
            if (acttimer > 160)
            {
                progress += 75;
            }
            starttimer = true;
            blown = 1;
            blowanimtimer = 20;
            onoff = 0;
            shakeamt = 5;
            repeat (6)
            {
                dustparticle = instance_create(x + random(sprite_width - 40) + 2, y + 20 + random(sprite_height - 20), 1237);
                with (dustparticle)
                {
                    sprite_index = 6110;
                    speed = 6;
                    image_index = 1;
                    direction = 10 + random(70);
                    image_speed = 0.5;
                    image_xscale = 2;
                    image_yscale = 2;
                    gravity_direction = 0;
                    gravity = 0.7;
                    friction = 0.4;
                    image_alpha = 0.5;
                    depth = 15;
                }
                if (blown == 1)
                {
                    with (dustparticle)
                    {
                        image_alpha = 1;
                        depth = -10;
                    }
                }
            }
        }
        if (blowanimtimer == 12)
        {
            if (floradinn_recruited)
            {
                with (floradin_marker)
                {
                    image_index = 0;
                }
            }
            if (leafling_recruited)
            {
                with (leafling_marker)
                {
                    image_index = 0;
                }
            }
            if (kawkaw_recruited)
            {
                with (kawkaw_marker)
                {
                    image_index = 0;
                }
            }
        }
        presstimer++;
        if (presstimer == 30)
        {
            presstimer = 0;
            presscount_1 = 0;
        }
        if (progress >= 150)
        {
            progress = 150;
        }
        if (starttimer == true)
        {
            acttimer += 2;
        }
        if (acttimer >= acttimermax || progress >= 150)
        {
            starttimer = false;
            acting = 102;
            blown = 0;
            acttimer = 0;
            with (1176)
            {
                instance_destroy();
            }
        }
    }
    if (acting == 102 && actcon == 0)
    {
        if (floradinn_recruited)
        {
            with (floradin_marker)
            {
                image_index = 0;
            }
        }
        if (leafling_recruited)
        {
            with (leafling_marker)
            {
                image_index = 0;
            }
        }
        if (kawkaw_recruited)
        {
            with (kawkaw_marker)
            {
                image_index = 0;
            }
        }
        if (progress < 100)
        {
            sprite_index = 6703;
            msgsetloc(0, "* You ran out of time!/%", "obj_flowery_enemy_slash_Step_0_gml_1150_0");
        }
        else
        {
            msgsetloc(0, "* You made Flowery's hair blow beautifully!/%", "obj_flowery_enemy_slash_Step_0_gml_1154_0");
            _mercy = 5;
            if ((global.mercymod[myself] + _mercy) > _maxmercy)
            {
                _mercy = _maxmercy - global.mercymod[myself];
            }
            scr_mercyadd(myself, _mercy);
            mercyaddcon = 1;
            sprite_index = 4515;
        }
        image_speed = 0.16666666666666666;
        scr_battletext_default();
        if (global.mercymod[myself] >= 20)
        {
            flowery_blowkiss_scene_con = 1;
        }
        scr_battle_sprite_reset("kris");
        scr_battle_sprite_reset("susie");
        scr_battle_sprite_reset("ralsei");
        if (custombody == 0)
        {
            acting = 0;
        }
        actcon = 1;
        progress = 0;
        blowaway = true;
    }
    if (phase == 3)
    {
        if ((acting == 2 || acting == 3) && actcon == 0)
        {
            var _pickedcorrectly = false;
            if (correctact == (acting - 1))
            {
                _pickedcorrectly = true;
            }
            if (overwrite_correct == 1)
            {
                _pickedcorrectly = false;
            }
            if (overwrite_correct == 2)
            {
                _pickedcorrectly = true;
            }
            _pickedcorrectly = true;
            if (actcon == 0 && acting != 151)
            {
                event_user(0);
                snd_play(355);
            }
            if (_pickedcorrectly == true && actcon == 0)
            {
                actcon = 1;
                if (acting == 2)
                {
                    msgsetloc(0, "* You spin!/%", "obj_flowery_enemy_slash_Step_0_gml_1237_0");
                }
                else
                {
                    msgsetloc(0, "* Everyone spins!/%", "obj_flowery_enemy_slash_Step_0_gml_1194_0");
                }
                scr_battletext_default();
                scr_battle_sprite_set("kris", 2146, 1/3, true);
                if (acting == 3)
                {
                    scr_battle_sprite_set("susie", 1513, 1/3, true);
                }
                if (acting == 3)
                {
                    scr_battle_sprite_set("ralsei", 5779, 1/3, true);
                }
                with (1432)
                {
                    scr_oflash();
                    a = scr_afterimage();
                    a.hspeed = 2.5;
                    a.depth = depth + 1;
                    b = scr_afterimage();
                    b.image_alpha = 0.6;
                    b.hspeed = 5;
                    b.depth = depth + 2;
                }
                if (acting == 3)
                {
                    with (1433)
                    {
                        scr_oflash();
                        a = scr_afterimage();
                        a.hspeed = 2.5;
                        a.depth = depth + 1;
                        b = scr_afterimage();
                        b.image_alpha = 0.6;
                        b.hspeed = 5;
                        b.depth = depth + 2;
                    }
                    with (1434)
                    {
                        scr_oflash();
                        a = scr_afterimage();
                        a.hspeed = 2.5;
                        a.depth = depth + 1;
                        b = scr_afterimage();
                        b.image_alpha = 0.6;
                        b.hspeed = 5;
                        b.depth = depth + 2;
                    }
                }
                if (failedpreviousact == true)
                {
                    if (global.mercymod[myself] == 20)
                    {
                        _mercy = 10;
                        if ((global.mercymod[myself] + _mercy) > _maxmercy)
                        {
                            _mercy = _maxmercy - global.mercymod[myself];
                        }
                        scr_mercyadd(myself, _mercy);
                        mercyaddcon = 1;
                    }
                    if (global.mercymod[myself] == 25)
                    {
                        _mercy = 5;
                        if ((global.mercymod[myself] + _mercy) > _maxmercy)
                        {
                            _mercy = _maxmercy - global.mercymod[myself];
                        }
                        scr_mercyadd(myself, _mercy);
                        mercyaddcon = 1;
                    }
                    aqua_mercy += 100;
                    with (aqua_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 20, 1537);
                        __mercydmgwriter.damage = 100;
                        __mercydmgwriter.type = 5;
                    }
                    purple_mercy += 100;
                    with (purple_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 40, 1537);
                        __mercydmgwriter.damage = 100;
                        __mercydmgwriter.type = 5;
                    }
                }
                else
                {
                    if (global.mercymod[myself] < 30)
                    {
                        _mercy = 5;
                        if ((global.mercymod[myself] + _mercy) > _maxmercy)
                        {
                            _mercy = _maxmercy - global.mercymod[myself];
                        }
                        scr_mercyadd(myself, _mercy);
                        mercyaddcon = 1;
                    }
                    else
                    {
                        purple_marker.sprite_index = 8117;
                        aqua_marker.sprite_index = 3476;
                    }
                    if (sethaqua_defeated_with_violence == true)
                    {
                        aqua_mercy += 80;
                        with (aqua_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 80;
                            __mercydmgwriter.type = 5;
                        }
                        purple_mercy += 80;
                        with (purple_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 40, 1537);
                            __mercydmgwriter.damage = 80;
                            __mercydmgwriter.type = 5;
                        }
                    }
                    else
                    {
                        aqua_mercy += 50;
                        with (aqua_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                        purple_mercy += 50;
                        with (purple_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 40, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                    }
                }
            }
            if (acting == 151)
            {
                acttimer++;
                if (acttimer == 1)
                {
                    snd_play(2, 0.1, 1.2);
                    snd_volume(2, 2, 5);
                }
                if (acttimer >= 1 && acttimer < 60)
                {
                    repeat (6)
                    {
                        drop_petal2(((_cx + 640) - (spread_range * 0.5)) + _random, (_cy - (spread_range * 0.5)) + _random, true, -12, 1);
                    }
                }
                if (acttimer == 31)
                {
                    snd_volume(2, 0, 30);
                }
                if (acttimer >= 60 && !i_ex(1176))
                {
                    snd_stop(2);
                    snd_play(357);
                    defensedowntimer = 30;
                    msgsetloc(0, "* Party's DEFENSE dropped this turn!/%", "obj_flowery_enemy_slash_Step_0_gml_1304_0");
                    scr_battletext_default();
                    actcon = 1;
                    acting = 0;
                    acttimer = 0;
                }
            }
        }
    }
    if (phase == 4)
    {
        if ((acting == 2 || acting == 3) && actcon == 0)
        {
            var _pickedcorrectly = false;
            if (correctact == (acting - 1))
            {
                _pickedcorrectly = true;
            }
            if (overwrite_correct == 1)
            {
                _pickedcorrectly = false;
            }
            if (overwrite_correct == 2)
            {
                _pickedcorrectly = true;
            }
            _pickedcorrectly = true;
            if (actcon == 0 && acting != 201 && acting != 202)
            {
                event_user(0);
            }
            if (_pickedcorrectly == true && actcon == 0)
            {
                actcon = 1;
                if (acting == 2)
                {
                    msgsetloc(0, "* You praise Flowery!/%", "obj_flowery_enemy_slash_Step_0_gml_1655_0");
                }
                if (acting == 3)
                {
                    msgsetloc(0, "* Everyone praises Flowery!/%", "obj_flowery_enemy_slash_Step_0_gml_1328_0");
                }
                scr_battletext_default();
                scr_battle_sprite_set("kris", 2152, 1/3, true);
                if (acting == 3)
                {
                    scr_battle_sprite_set("susie", 120, 1/3, true);
                    scr_battle_sprite_set("ralsei", 7309, 1/3, true);
                }
                acting = 202;
                global.actcost[myself][1] = 200;
                idlesprite = 1796;
                with (green_marker)
                {
                    sprite_index = 5634;
                }
                with (orange_marker)
                {
                    sprite_index = 5911;
                }
                with (1430)
                {
                    scr_oflash();
                    a = scr_afterimage();
                    a.hspeed = 2.5;
                    a.depth = depth + 1;
                    b = scr_afterimage();
                    b.image_alpha = 0.6;
                    b.hspeed = 5;
                    b.depth = depth + 2;
                }
                if (global.mercymod[myself] < 40)
                {
                    _mercy = 5;
                    if ((global.mercymod[myself] + _mercy) > _maxmercy)
                    {
                        _mercy = _maxmercy - global.mercymod[myself];
                    }
                    scr_mercyadd(myself, _mercy);
                }
                if (failedpreviousact == true)
                {
                    orange_mercy += 100;
                    with (orange_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 20, 1537);
                        __mercydmgwriter.damage = 100;
                        __mercydmgwriter.type = 5;
                    }
                    green_mercy += 100;
                    with (green_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 20, 1537);
                        __mercydmgwriter.damage = 100;
                        __mercydmgwriter.type = 5;
                    }
                }
                else if (defeatedpink == true)
                {
                    orange_mercy += 80;
                    with (orange_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 20, 1537);
                        __mercydmgwriter.damage = 80;
                        __mercydmgwriter.type = 5;
                    }
                    green_mercy += 80;
                    with (green_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 20, 1537);
                        __mercydmgwriter.damage = 80;
                        __mercydmgwriter.type = 5;
                    }
                }
                else
                {
                    orange_mercy += 50;
                    with (orange_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 20, 1537);
                        __mercydmgwriter.damage = 50;
                        __mercydmgwriter.type = 5;
                    }
                    green_mercy += 50;
                    with (green_marker)
                    {
                        __mercydmgwriter = instance_create(x, y + 20, 1537);
                        __mercydmgwriter.damage = 50;
                        __mercydmgwriter.type = 5;
                    }
                }
                if (defeatedpink == true)
                {
                    snd_play(162);
                    inst = instance_create(camerax() + 320, cameray() + 160, 1238);
                    inst.sprite_index = 6793;
                    with (inst)
                    {
                        scr_lerpvar("image_alpha", 0.45, 0, 20, 2, "in");
                        scr_lerpvar("image_xscale", 5, 3, 20, 2, "in");
                        scr_lerpvar("image_yscale", 5, 3, 20, 2, "in");
                        scr_script_delayed(instance_destroy, 20);
                    }
                }
            }
            if (acting == 202 && !i_ex(1176))
            {
                acting = 0;
                actcon = 1;
                sprite_index = 7483;
                image_index = 0;
                image_speed = 1/3;
                orange_marker.sprite_index = 5702;
                green_marker.sprite_index = 3869;
                scr_oflash();
                a = scr_afterimage();
                a.hspeed = -2.5;
                a.depth = depth + 1;
                b = scr_afterimage();
                b.image_alpha = 0.6;
                b.hspeed = -5;
                b.depth = depth + 2;
                msgsetloc(0, "* Everyone got TIRED!/%", "obj_flowery_enemy_slash_Step_0_gml_1440_0");
                scr_battletext_default();
                snd_stop(440);
                snd_play(440);
                with (1430)
                {
                    hurt = 1;
                }
                with (1430)
                {
                    __tiredwriter = instance_create(x, y + 40, 1537);
                    __tiredwriter.typeb = 13;
                    __tiredwriter.type = 13;
                }
                snd_play_x(360, 0.5, 0.9);
            }
        }
    }
    if (phase == 5)
    {
        if (acting == 2 && actcon == 0)
        {
            if (global.hp[2] < 1)
            {
                star = 1;
                scr_healitemspell(abs(global.hp[2]) + 1);
                global.hp[2] = 1;
            }
            if (global.hp[3] < 1)
            {
                star = 2;
                scr_healitemspell(abs(global.hp[3]) + 1);
                global.hp[3] = 1;
            }
            if (global.tempflag[70] == 1)
            {
                msgset_add(stringsetloc("What?^1 An&accusation&again?/%", "obj_flowery_enemy_slash_Step_0_gml_1848_0"), x - 15, y + 30, 10, 50);
                msgset_add_func(function()
                {
                    if (i_ex(1434))
                    {
                        repeat (3)
                        {
                            make_petal_storm(obj_heroralsei.x + 120, obj_heroralsei.y + 48, obj_heroralsei.depth, 12);
                        }
                    }
                    talked = -1;
                    scr_var_delayed("talked", 1, 30);
                });
                msgset_add(stringsetloc("If you want&to \"beleave\"&things can change.../%", "obj_flowery_enemy_slash_Step_0_gml_1873_0"), x - 15, y + 30, 10, 50);
                msgset_add(stringsetloc("Prove it&on your side,&sprinkles./%", "obj_flowery_enemy_slash_Step_0_gml_1874_0"), x - 15, y + 30, 10, 50);
                msgset_add_func(function()
                {
                    scr_script_delayed(function()
                    {
                        with (1412)
                        {
                            havechar[2] = 0;
                            charpos[2] = 0;
                            with (1434)
                            {
                                ralsei_marker = instance_create_depth(x, y, depth, 1238);
                                ralsei_marker.sprite_index = 1447;
                                ralsei_marker.image_speed = 0.16666666666666666;
                                ralsei_marker.image_xscale = image_xscale;
                                ralsei_marker.image_yscale = image_yscale;
                                ralsei_marker.hspeed = -20;
                                instance_destroy();
                            }
                            with (208)
                            {
                                if (hero == 3)
                                {
                                    hspeed = -20;
                                }
                            }
                            global.hp[3] = 0;
                            global.acting[3] = 1;
                            global.char[2] = 0;
                            global.charmove[2] = 0;
                            global.charauto[2] = 0;
                            chartotal--;
                        }
                        with (579)
                        {
                            ralsei_removed = true;
                        }
                        with (579)
                        {
                            remove_ralsei_con = 1;
                        }
                    }, 12);
                    with (680)
                    {
                        do_movement = false;
                        scr_lerpvar("x_center", x_center, x_center - 300, 20);
                    }
                    with (1434)
                    {
                        scr_script_delayed(snd_play, 9, 310);
                        scr_script_delayed(scr_lerpvar, 9, "x", x, x - 180, 12);
                        scr_script_delayed(scr_battle_sprite_set, 9, "ralsei", 1447, 0.16666666666666666, true);
                    }
                    talked = -1;
                    scr_var_delayed("talked", 1, 30);
                });
                msgset_add_func(function()
                {
                    with (1412)
                    {
                        skipsusieturn = true;
                    }
                    global.faceaction[1] = 0;
                    global.charaction[1] = 0;
                    global.acting[1] = 0;
                    global.actingsingle[1] = 0;
                    with (1412)
                    {
                        skipralseiturn = true;
                    }
                    global.faceaction[2] = 0;
                    global.charaction[2] = 0;
                    global.acting[2] = 0;
                    global.actingsingle[2] = 0;
                    actcon = 1;
                    acting = 0;
                    talked = 0;
                    with (yellow_marker)
                    {
                        sprite_index = 6497;
                    }
                    with (blue_marker)
                    {
                        sprite_index = 1969;
                        image_index = 0;
                        image_speed = 0.16666666666666666;
                    }
                    global.mercymod[myself] += 10;
                    mercyaddcon = 1;
                    event_user(0);
                });
                flowery_balloon();
                actcon = 0.2;
            }
            else
            {
                with (1173)
                {
                    target_alpha = 0;
                }
                scr_speaker("ralsei");
                scr_anyface_next("ralsei", "i");
                msgsetloc(0, "\\Ei* Enough! With this ACT... I'm finishing this!/", "obj_flowery_enemy_slash_Step_0_gml_1468_0");
                msgnextloc("\\Ek* Let me prove..^1. without a doubt.../", "obj_flowery_enemy_slash_Step_0_gml_1469_0");
                msgnextloc("\\Ej* Flowery isn't as innocent as he behaves!/%", "obj_flowery_enemy_slash_Step_0_gml_1470_0");
                scr_battletext();
                actcon = 0.1;
                if (irandom(1))
                {
                    scr_battle_sprite_set("kris", 8157, 0.16666666666666666, true);
                }
                else
                {
                    scr_battle_sprite_set("kris", 3559, 0.16666666666666666, true);
                }
                scr_battle_sprite_set("susie", 3529, 0.16666666666666666, true);
                scr_battle_sprite_set("ralsei", 6861, 0.16666666666666666, true);
                with (1432)
                {
                    depth = -500;
                }
                with (1433)
                {
                    depth = -502;
                }
                with (1434)
                {
                    depth = -504;
                }
                with (1432)
                {
                    with (instance_create_depth(x + 60, y + 56, depth - 0.1, 1238))
                    {
                        sprite_index = 3172;
                        image_index = 1;
                        image_speed = 0;
                        scr_darksize();
                        scr_script_repeat(function()
                        {
                            if (i_ex(1432))
                            {
                                y = obj_herokris.y + 56;
                                depth = obj_herokris.depth - 1;
                            }
                            else
                            {
                                instance_destroy();
                            }
                        }, -1, 1);
                    }
                }
                with (1433)
                {
                    with (instance_create_depth(x + 60, y + 62, depth - 0.1, 1238))
                    {
                        sprite_index = 3172;
                        image_speed = 0;
                        scr_darksize();
                        scr_script_repeat(function()
                        {
                            if (i_ex(1433))
                            {
                                y = obj_herosusie.y + 62;
                                depth = obj_herosusie.depth - 1;
                            }
                            else
                            {
                                instance_destroy();
                            }
                        }, -1, 1);
                    }
                }
                with (1434)
                {
                    with (instance_create_depth(x + 60, y + 72, depth - 0.1, 1238))
                    {
                        sprite_index = 3172;
                        image_index = 1;
                        image_speed = 0;
                        scr_darksize();
                        scr_script_repeat(function()
                        {
                            if (i_ex(1434))
                            {
                                y = obj_heroralsei.y + 72;
                                depth = obj_heroralsei.depth - 1;
                            }
                            else
                            {
                                instance_destroy();
                            }
                        }, -1, 1);
                    }
                }
                global.faceaction[0] = 6;
                global.faceaction[1] = 6;
                global.faceaction[2] = 6;
                global.charaction[0] = 6;
                global.charaction[1] = 6;
                global.charaction[2] = 6;
            }
        }
        if (acting == 2 && actcon == 0.1)
        {
            if (!i_ex(1176))
            {
                actcon = 0.2;
                with (blue_marker)
                {
                    sprite_index = 5367;
                    image_index = 2;
                    image_speed = 0;
                }
                with (yellow_marker)
                {
                    sprite_index = 968;
                }
                with (instance_create(0, 0, 826))
                {
                    trial_id = 99;
                    ds_list_add(evidence_list, [stringsetloc("Metal Cuff", "obj_flowery_enemy_slash_Step_0_gml_1583_0"), stringsetloc("Hangs from the wall.", "obj_flowery_enemy_slash_Step_0_gml_1584_0"), 9, 10]);
                    ds_list_add(evidence_list, [stringsetloc("Moss", "obj_flowery_enemy_slash_Step_0_gml_1585_0"), stringsetloc("Has a bite taken#out of it.", "obj_flowery_enemy_slash_Step_0_gml_1586_0"), 10, 11]);
                    ds_list_add(evidence_list, [stringsetloc("Prisoncloth", "obj_flowery_enemy_slash_Step_0_gml_1587_0"), stringsetloc("A prisoner wears it.", "obj_flowery_enemy_slash_Step_0_gml_1588_0"), 11, 12]);
                    can_control = true;
                    evidence_mode = true;
                    evidence_choice = true;
                    can_cancel = false;
                }
                with (826)
                {
                    flowery_mode = true;
                    begin_trial();
                    evidence_mode = false;
                    can_control = false;
                    with (1612)
                    {
                        y = testimony_y;
                    }
                }
                with (1612)
                {
                    depth = -501;
                }
                scr_var_delayed("actcon", 0.11, 25);
            }
        }
        if (acting == 2 && actcon == 0.11)
        {
            scr_speaker("ralsei");
            scr_anyface_next("ralsei", "i");
            msgsetloc(0, "\\Ei* Susie and Kris..^1. were jailed illegally!/%", "obj_flowery_enemy_slash_Step_0_gml_1618_0");
            scr_battletext();
            actcon = 0.111;
        }
        if (acting == 2 && actcon == 0.111)
        {
            if (!i_ex(1176))
            {
                with (826)
                {
                    snd_play(415);
                    evidence_mode = true;
                    can_control = true;
                    flowery_mode = false;
                    spotlight_offset = -90;
                }
                with (1612)
                {
                    y -= 90;
                    testimony_y -= 90;
                }
                actcon = 0.2;
            }
        }
        if (acting == 2 && actcon == 0.2 && talked != -1)
        {
            flowery_balloon_control();
        }
    }
    if (phase == 6)
    {
        if (acting == 2 && actcon == 0)
        {
            with (1173)
            {
                target_alpha = 0;
            }
            acttimer = 0;
            scr_speaker("no_name");
            msgsetloc(0, "* (You listened to Susie's Idea!)/", "obj_flowery_enemy_slash_Step_0_gml_1660_0");
            if (global.flag[1874] == 0)
            {
                scr_anyface_next("susie", "A");
                msgnextloc("\\E0* (Kris..^1. I just noticed from what Flowery said^1, but...)/", "obj_flowery_enemy_slash_Step_0_gml_1663_0");
                msgnextloc("\\E4* (The flowers we're on stopped going up a while ago!)/", "obj_flowery_enemy_slash_Step_0_gml_1664_0");
                msgnextloc("\\ED* (If you want to get to the Dark Fountain...)/", "obj_flowery_enemy_slash_Step_0_gml_1665_0");
                msgnextloc("\\E2* (We gotta find another way..^1. got it!?)/%", "obj_flowery_enemy_slash_Step_0_gml_1666_0");
                acting = 2.11;
                global.tempflag[73] = 1;
            }
            else
            {
                scr_anyface_next("susie", "D");
                msgnextloc("\\ED* (Kris..^1. took a while^1, but...)/", "obj_flowery_enemy_slash_Step_0_gml_1675_0");
                msgnextloc("\\EA* (We're finally up high enough for another shot!)/", "obj_flowery_enemy_slash_Step_0_gml_1676_0");
                msgnextloc("\\E2* (You got it this time^1, Kris?)/", "obj_flowery_enemy_slash_Step_0_gml_1689_0");
                msgnextloc("\\El* Kris^1, this is it!^1! Go!!!/%", "obj_flowery_enemy_slash_Step_0_gml_1723_0");
                acting = 2.91;
            }
            scr_battletext();
        }
        if (acting == 2.11 && actcon == 0)
        {
            acttimer++;
            if ((button3_p() && acttimer > 15) || !i_ex(1176))
            {
                scr_battle_sprite_set("susie", 702, 9, true);
                with (1176)
                {
                    instance_destroy();
                }
                scr_speaker("susie");
                msgsetloc(0, "\\EH* Hey^1, Flowery! Asgore's falling over there!!/%", "obj_flowery_enemy_slash_Step_0_gml_1714_0");
                scr_battletext();
                acting = 2.12;
            }
        }
        if (acting == 2.12 && actcon == 0)
        {
            acttimer++;
            if ((button3_p() && acttimer > 15) || !i_ex(1176))
            {
                idlesprite = 1474;
                scr_shakeobj();
                with (1176)
                {
                    instance_destroy();
                }
                scr_speaker("flowery");
                msgsetloc(0, "\\E9* O-Oldbuddy!?/%", "obj_flowery_enemy_slash_Step_0_gml_1705_0");
                scr_battletext();
                acting = 2.13;
            }
        }
        if (acting == 2.13 && actcon == 0)
        {
            acttimer++;
            if ((button3_p() && acttimer > 15) || !i_ex(1176))
            {
                with (1176)
                {
                    instance_destroy();
                }
                acting = 2.14;
            }
        }
        if (acting == 2.14 && actcon == 0 && !i_ex(1176))
        {
            scr_speaker("susie");
            msgsetloc(0, "\\El* Kris^1, this is it!^1! Go!!!/%", "obj_flowery_enemy_slash_Step_0_gml_1723_0");
            scr_battletext();
            acting = 2.91;
        }
        if (acting == 2.91 && actcon == 0)
        {
            acttimer++;
            if ((button3_p() && acttimer > 15) || !i_ex(1176))
            {
                snd_play(310);
                with (1176)
                {
                    instance_destroy();
                }
                var last_cam_x = camerax();
                var last_cam_y = cameray();
                with (1432)
                {
                    visible = 0;
                }
                with (1433)
                {
                    visible = 0;
                }
                with (1238)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (208)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (602)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (1430)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (1412)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (1442)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (47)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (579)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (919)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (591)
                {
                    persistent = true;
                    scr_delay_var("persistent", false, 5);
                }
                with (1603)
                {
                    persistent = true;
                }
                room_goto(217);
                var camshiftx = -last_cam_x;
                var camshifty = 11640 - last_cam_y;
                with (1238)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (208)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (602)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (1430)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (1412)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (1442)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (47)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (1603)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                with (579)
                {
                    x += camshiftx;
                    xstart = x;
                    y += camshifty;
                    ystart = y;
                }
                acting = 2.92;
                acttimer = 0;
            }
        }
        if (acting == 2.92 && actcon == 0)
        {
            with (1198)
            {
                x = -1000;
            }
            with (1389)
            {
                x = -1000;
            }
            acttimer++;
            if (acttimer == 2)
            {
                throwsus = instance_create(obj_herosusie.x, obj_herosusie.y, 47);
            }
            if (acttimer == 32)
            {
                with (47)
                {
                    image_index = 0;
                    image_speed = 0.5;
                    sprite_index = 2276;
                    throwcon = 2;
                    snd_play(422);
                    snd_play(424);
                    marker = instance_create(x, y, 1238);
                    marker.sprite_index = 86;
                    marker.image_speed = 1/3;
                    marker.image_xscale = 2;
                    marker.image_yscale = 2;
                    scr_doom(marker, 20);
                    with (marker)
                    {
                        scr_jump_to_point(camerax() + 320, cameray() - 200, 12, 20);
                    }
                    with (226)
                    {
                        start_pan();
                    }
                    with (1412)
                    {
                        hidebattleui = 1;
                    }
                    with (1442)
                    {
                        alarm[5] = 15;
                        hspeed = -10;
                        friction = -0.4;
                    }
                }
            }
            if (acttimer == 100)
            {
                with (1412)
                {
                    with (1456)
                    {
                        instance_destroy();
                    }
                    with (1416)
                    {
                        instance_destroy();
                    }
                    with (1442)
                    {
                        instance_destroy();
                    }
                    global.fighting = 0;
                    instance_destroy();
                    exit;
                }
            }
        }
    }
    if (actingsus == 1 && actconsus == 1)
    {
        var rand = choose(0, 1, 2, 3);
        var afterimagescale = 2;
        if (rand == 0)
        {
            scr_battle_sprite_set("susie", 3529, 0, true);
        }
        if (rand == 1)
        {
            sprite_set_offset(8351, 16, 5);
            sprite_set_offset(3964, 16, 5);
            if (global.lang == "ja")
            {
                scr_battle_sprite_set("susie", 8351, 1, 1);
            }
            else
            {
                scr_battle_sprite_set("susie", 3964, 1, 1);
            }
            afterimagescale = 1;
        }
        if (rand == 2)
        {
            scr_battle_sprite_set("susie", 2285, 0, true);
        }
        if (rand == 3)
        {
            scr_battle_sprite_set("susie", 5607, 0, true);
        }
        with (1433)
        {
            _oflash = scr_oflash();
            _oflash.image_xscale = afterimagescale;
            _oflash.image_yscale = afterimagescale;
            a = scr_afterimage();
            a.hspeed = 2.5;
            a.depth = depth + 1;
            a.image_xscale = afterimagescale;
            a.image_yscale = afterimagescale;
            b = scr_afterimage();
            b.image_alpha = 0.6;
            b.hspeed = 5;
            b.depth = depth + 2;
            b.image_xscale = afterimagescale;
            b.image_yscale = afterimagescale;
        }
        if (global.actsimulsus[myself][0] == 0)
        {
            msgsetloc(0, "* Susie gives her all^1! TP and Mercy increased!/%", "obj_flowery_enemy_slash_Step_0_gml_1855_0");
            actcon = 1;
            actconsus = 0;
            actingsus = 1.1;
            scr_battletext_default();
            if (global.hp[1] < 1 && global.hp[3] < 1)
            {
                if (NOOO_MERCY == false)
                {
                    if (phase == 3)
                    {
                        aqua_mercy += 50;
                        with (aqua_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                        purple_mercy += 50;
                        with (purple_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 40, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                    }
                    if (phase == 4)
                    {
                        orange_mercy += 50;
                        with (orange_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                        green_mercy += 50;
                        with (green_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                    }
                }
                scr_mercyadd(myself, 5);
            }
            else if (global.hp[1] < 1 || global.hp[3] < 1)
            {
                if (NOOO_MERCY == false)
                {
                    if (phase == 3)
                    {
                        aqua_mercy += 30;
                        with (aqua_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                        purple_mercy += 30;
                        with (purple_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 40, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                    }
                    if (phase == 4)
                    {
                        orange_mercy += 30;
                        with (orange_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                        green_mercy += 30;
                        with (green_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                    }
                }
                scr_mercyadd(myself, 3);
            }
            mercyaddcon = 1;
        }
        else
        {
            msgsetloc(0, "* Susie gives her all^1! TP increased!", "obj_flowery_enemy_slash_Step_0_gml_1854_0");
            scr_simultext("susie");
            if (simulordersus == 0)
            {
                actconsus = 20;
            }
            else
            {
                actconsus = 0;
            }
        }
        scr_tensionheal(30);
        mercyaddcon = 1;
    }
    if (actingral == 1 && actconral == 1)
    {
        var rand = choose(0, 1, 2, 3);
        if (rand == 0)
        {
            scr_battle_sprite_set("ralsei", 6861, 0, true);
        }
        if (rand == 1)
        {
            scr_battle_sprite_set("ralsei", 1637, 0, true);
        }
        if (rand == 2)
        {
            scr_battle_sprite_set("ralsei", 2413, 0, true);
        }
        if (rand == 3)
        {
            scr_battle_sprite_set("ralsei", 2281, 0, true);
        }
        with (1434)
        {
            scr_oflash();
            a = scr_afterimage();
            a.hspeed = 2.5;
            a.depth = depth + 1;
            b = scr_afterimage();
            b.image_alpha = 0.6;
            b.hspeed = 5;
            b.depth = depth + 2;
        }
        if (global.actsimulral[myself][0] == 0)
        {
            msgsetloc(0, "* Ralsei gives his all^1! TP and Mercy increased!/%", "obj_flowery_enemy_slash_Step_0_gml_1886_0");
            actcon = 1;
            actconral = 0;
            actingral = 1.1;
            scr_battletext_default();
            if (global.hp[1] < 1 && global.hp[2] < 1)
            {
                if (NOOO_MERCY == false)
                {
                    if (phase == 3)
                    {
                        aqua_mercy += 50;
                        with (aqua_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                        purple_mercy += 50;
                        with (purple_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 40, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                    }
                    if (phase == 4)
                    {
                        orange_mercy += 50;
                        with (orange_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                        green_mercy += 50;
                        with (green_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 50;
                            __mercydmgwriter.type = 5;
                        }
                    }
                }
                if (NOOO_MERCY == false)
                {
                    scr_mercyadd(myself, 5);
                }
            }
            else if (global.hp[1] < 1 || global.hp[2] < 1)
            {
                if (NOOO_MERCY == false)
                {
                    if (phase == 3)
                    {
                        aqua_mercy += 30;
                        with (aqua_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                        purple_mercy += 30;
                        with (purple_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 40, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                    }
                    if (phase == 4)
                    {
                        orange_mercy += 30;
                        with (orange_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                        green_mercy += 30;
                        with (green_marker)
                        {
                            __mercydmgwriter = instance_create(x, y + 20, 1537);
                            __mercydmgwriter.damage = 30;
                            __mercydmgwriter.type = 5;
                        }
                    }
                }
                if (NOOO_MERCY == false)
                {
                    scr_mercyadd(myself, 3);
                }
            }
            mercyaddcon = 1;
        }
        else
        {
            msgsetloc(0, "* Ralsei gives his all^1! TP increased!", "obj_flowery_enemy_slash_Step_0_gml_1885_0");
            scr_simultext("ralsei");
            if (simulorderral == 0)
            {
                actconral = 20;
            }
            else
            {
                actconral = 0;
            }
        }
        scr_tensionheal(30);
        mercyaddcon = 1;
    }
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if (scr_terminate_writer())
        {
            actconsus = -1;
            actconral = -1;
            actcon = 1;
        }
    }
    if (actcon == 1 && !instance_exists(1176))
    {
        if (state == 10 && (sprite_index == 7020 || sprite_index == 7100))
        {
            sprite_index = 6703;
        }
        if (actingsus == 1)
        {
            scr_battle_sprite_reset("susie");
        }
        if (actingral == 1)
        {
            scr_battle_sprite_reset("ralsei");
        }
        if (actingsus == 1.1)
        {
            scr_battle_sprite_reset("susie");
        }
        if (actingral == 1.1)
        {
            scr_battle_sprite_reset("ralsei");
        }
        if (phase == 1 || phase == 3 || phase == 4 || phase == 5)
        {
            scr_battle_sprite_reset("kris");
            scr_battle_sprite_reset("susie");
            scr_battle_sprite_reset("ralsei");
            scr_act_charsprite_end();
            sprite_index = 6703;
            image_speed = 0.16666666666666666;
            with (orange_marker)
            {
                sprite_index = 7055;
            }
        }
        if (flowery_blowkiss_scene_con == 1)
        {
        }
        else
        {
            with (floradin_marker)
            {
                scr_move_to_point_over_time(xstart, ystart, 8);
            }
            with (leafling_marker)
            {
                scr_move_to_point_over_time(xstart, ystart, 8);
            }
            with (kawkaw_marker)
            {
                scr_move_to_point_over_time(xstart, ystart, 8);
            }
            with (shi_marker)
            {
                scr_move_to_point_over_time(xstart, ystart, 8);
            }
            with (shinobeetle_marker)
            {
                scr_move_to_point_over_time(xstart, ystart, 8);
            }
        }
        state = 0;
        scr_nextact();
    }
}
if (state == 3)
{
    scr_enemy_hurt();
}
if (healingscenecon == 1)
{
    healingscenetimer++;
    if (healingscenetimer == 1)
    {
        msgsetloc(0, "Heh..^1. so that's&it^1? You're just&gonna cut me down...?/%", "obj_flowery_enemy_slash_Step_0_gml_1956_0");
        global.typer = 50;
        scr_enemyblcon(x - 8, y + 40, 10);
    }
    if ((button3_p() && healingscenetimer > 15) || !i_ex(1176))
    {
        healingscenetimer = 0;
        healingscenecon = 2;
        with (1176)
        {
            instance_destroy();
        }
        snd_play(364);
        with (1433)
        {
            scr_shakeobj();
        }
        with (1434)
        {
            scr_shakeobj();
        }
        snd_play(316);
        sprite_set_offset(6722, -5, -1);
        sprite_set_offset(4809, -6, -5);
        scr_battle_sprite_set("susie", 6722, 0, true);
        scr_battle_sprite_set("ralsei", 4809, 0, true);
        msgsetloc(0, ".../%", "obj_flowery_enemy_slash_Step_0_gml_1982_0");
        global.typer = 75;
        scr_enemyblcon(obj_herosusie.x + 95, obj_herosusie.y + 40, 14);
        scr_guardpeek(1433);
    }
}
if (healingscenecon == 2)
{
    healingscenetimer++;
    if ((button3_p() && healingscenetimer > 15) || !i_ex(1176))
    {
        healingscenetimer = 0;
        healingscenecon = 3;
        scr_battle_sprite_reset("susie");
        scr_battle_sprite_reset("ralsei");
    }
}
if (healingscenecon == 3)
{
    healingscenetimer++;
    if (healingscenetimer == 1)
    {
        scr_battle_sprite_set("susie", 6778, 0.5, false);
        with (1433)
        {
            image_index = 5;
        }
        if (global.flag[1873] >= 2)
        {
            var _cost = 0;
            if (global.flag[1045] == 0)
            {
                _cost = 200;
            }
            if (global.flag[1045] == 1)
            {
                _cost = 197.5;
            }
            if (global.flag[1045] == 2)
            {
                _cost = 197.5;
            }
            if (global.flag[1045] == 3)
            {
                _cost = 197.5;
            }
            if (global.flag[1045] == 4)
            {
                _cost = 195;
            }
            if (global.flag[1045] == 5)
            {
                _cost = 195;
            }
            if (global.flag[1045] == 6)
            {
                _cost = 195;
            }
            if (global.flag[1045] == 7)
            {
                _cost = 192.5;
            }
            if (global.flag[1045] == 8)
            {
                _cost = 192.5;
            }
            if (global.flag[1045] == 9)
            {
                _cost = 192.5;
            }
            if (global.flag[1045] == 10)
            {
                _cost = 190;
            }
            if (global.flag[1045] == 11)
            {
                _cost = 190;
            }
            if (global.flag[1045] == 12)
            {
                _cost = 190;
            }
            if (global.flag[1045] == 13)
            {
                _cost = 187.5;
            }
            if (global.flag[1045] == 14)
            {
                _cost = 187.5;
            }
            if (global.flag[1045] >= 15)
            {
                _cost = 187.5;
            }
            global.tension -= _cost;
            if (global.tension < 0)
            {
                global.tension = 0;
            }
        }
    }
    if (healingscenetimer == 11)
    {
        inst = instance_create(obj_herosusie.x + 52, obj_herosusie.y + 28, 16);
        inst.gravity = 1;
        inst.gravity_direction = 0;
        inst.image_xscale = 3;
        inst.image_yscale = 3;
        inst.image_speed = 1;
        snd_stop(390);
        snd_play_x(391, 1, 0.4);
    }
    if (healingscenetimer == 37)
    {
        with (16)
        {
            anim = instance_create(x + 30 + 12, y + 9, 1237);
            anim.sprite_index = 7682;
            anim.image_xscale = 2;
            anim.image_yscale = 2;
            instance_destroy();
        }
        with (579)
        {
            ha = instance_create(x, y, 1512);
            ha.target = id;
            caster = 1;
            global.monsterhp[myself] = global.monstermaxhp[myself];
            instance_create_depth(x, y + 50, depth - 10, 1537);
            with (1537)
            {
                delay = 4;
                caster = 1;
                damage = ceil(scr_heal_amount_modify_by_equipment((global.battlemag[1] * 5) + 15 + (2 * global.flag[1045])));
                type = 3;
                image_index = 2;
                image_blend = 65280;
                image_speed = 0;
            }
            if (global.hp[3] < 1)
            {
                with (1537)
                {
                    typeb = 3;
                }
            }
            snd_stop(427);
            snd_play(427);
        }
        with (1412)
        {
            disablesusieralseiattack = true;
        }
        scr_battle_sprite_reset("susie");
    }
    if (healingscenetimer == 57)
    {
        if (global.flag[1873] < 3)
        {
            msgsetloc(0, "No..^1. that's not&the way we're&gonna beat you!/%", "obj_flowery_enemy_slash_Step_0_gml_2085_0");
            global.typer = 75;
            scr_enemyblcon(obj_herosusie.x + 95, obj_herosusie.y + 40, 14);
            scr_guardpeek(1433);
            healingscenecon = 3.5;
            healingscenetimer = 0;
        }
        else
        {
            healingscenecon = 4;
            healingscenetimer = 0;
        }
        if (global.hp[3] < 1)
        {
            healingscenecon = 9;
        }
    }
}
if (healingscenecon == 3.5)
{
    healingscenetimer++;
    if ((button3_p() && healingscenetimer > 15) || !i_ex(1176))
    {
        with (1176)
        {
            instance_destroy();
        }
        healingscenecon = 4;
        healingscenetimer = 0;
    }
}
if (healingscenecon == 4)
{
    healingscenetimer++;
    if (healingscenetimer == 1)
    {
        if (global.flag[1873] >= 2)
        {
            var _cost = 80;
            global.tension -= _cost;
            if (global.tension < 0)
            {
                global.tension = 0;
            }
        }
        scr_battle_sprite_set("ralsei", 2453, 0.5, false);
    }
    if (healingscenetimer == 6)
    {
        with (579)
        {
            ha = instance_create(x, y, 1512);
            ha.target = id;
            instance_create_depth(x, y + 30, depth - 10, 1537);
            with (1537)
            {
                delay = 4;
                caster = 2;
                damage = ceil(scr_heal_amount_modify_by_equipment(global.battlemag[2] * 5));
                type = 3;
                image_index = 2;
                image_blend = 65280;
                image_speed = 0;
            }
            with (1537)
            {
                typeb = 3;
            }
            snd_stop(427);
            snd_play(427);
        }
    }
    if (healingscenetimer >= 20)
    {
        force_hurt_sprite = false;
        healingscenetimer = 0;
        healingscenecon = 0;
        if (global.flag[1873] == 1)
        {
            healingscenecon = 5;
        }
    }
}
if (healingscenecon == 5)
{
    if (i_ex(1434))
    {
        global.typer = 50;
        msgsetloc(0, "Heh..^1. aren't&you supposed to&listen to Kris,&Raly...?/%", "obj_flowery_enemy_slash_Step_0_gml_2155_0");
        scr_enemyblcon(x - 8, y + 40, 10);
        with (1531)
        {
            flowery_float = true;
        }
    }
    healingscenecon = 6;
}
if (healingscenecon == 6)
{
    healingscenetimer++;
    if ((button3_p() && healingscenetimer > 15) || !i_ex(1176))
    {
        with (1176)
        {
            instance_destroy();
        }
        if (i_ex(1434))
        {
            msgsetloc(0, "..^1. you're already&going to lose^1. Let&me.../%", "obj_flowery_enemy_slash_Step_0_gml_2168_0");
            global.typer = 74;
            scr_enemyblcon(obj_heroralsei.x + 100, obj_heroralsei.y + 40, 14);
            scr_guardpeek(1434);
        }
        healingscenetimer = 0;
        healingscenecon = 7;
    }
}
if (healingscenecon == 7)
{
    healingscenetimer++;
    if ((button3_p() && healingscenetimer > 15) || !i_ex(1176))
    {
        with (1176)
        {
            instance_destroy();
        }
        if (i_ex(1434))
        {
            msgsetloc(0, "Beat you&my way!/%", "obj_flowery_enemy_slash_Step_0_gml_2185_0");
            global.typer = 74;
            scr_enemyblcon(obj_heroralsei.x + 100, obj_heroralsei.y + 40, 14);
            scr_guardpeek(1434);
        }
        healingscenetimer = 0;
        healingscenecon = 8;
    }
}
if (healingscenecon == 8)
{
    healingscenetimer++;
    if ((button3_p() && healingscenetimer > 15) || !i_ex(1176))
    {
        with (1176)
        {
            instance_destroy();
        }
        if (i_ex(1434))
        {
            idlesprite = 62;
            image_speed = 1/3;
            global.typer = 50;
            msgsetloc(0, "Heh^1. ...&Whatever you say,&Raly./%", "obj_flowery_enemy_slash_Step_0_gml_2206_0");
            scr_enemyblcon(x - 8, y + 40, 10);
            with (1531)
            {
                flowery_float = true;
            }
        }
        healingscenetimer = 0;
        healingscenecon = 9;
    }
}
if (healingscenecon == 9)
{
    healingscenetimer++;
    if ((button3_p() && healingscenetimer > 15) || !i_ex(1176))
    {
        with (1176)
        {
            instance_destroy();
        }
        if (cannot_fight_text_used == false)
        {
            msgsetloc(0, "* (Susie and Ralsei cannot FIGHT anymore.)/%", "obj_flowery_enemy_slash_Step_0_gml_2221_0");
            if (phase == 6)
            {
                msgsetloc(0, "* (Susie cannot FIGHT anymore.)/%", "obj_flowery_enemy_slash_Step_0_gml_2725_0");
            }
            scr_battletext_default();
        }
        cannot_fight_text_used = true;
        healingscenetimer = 0;
        healingscenecon = 10;
    }
}
if (healingscenecon == 10 && !i_ex(1176))
{
    if (green_and_orange_enter == 2)
    {
        orange_marker.y -= 14;
    }
    idlesprite = 6703;
    image_speed = 0.16666666666666666;
    healingscenetimer = 0;
    healingscenecon = 0;
    force_hurt_sprite = false;
}
if (flowery_blowkiss_scene_con == 1 && !i_ex(1176) && global.myfight == -1 && healingscenecon == 0)
{
    state = 0;
    global.typer = 50;
    msgsetloc(0, "Heh^1! You think that's&gonna stop me!?/%", "obj_flowery_enemy_slash_Step_0_gml_2267_0");
    scr_enemyblcon(x - 8, y + 40, 10);
    with (1531)
    {
        flowery_float = true;
    }
    flowery_blowkiss_scene_con = 2;
}
if (flowery_blowkiss_scene_con == 2)
{
    flowery_blowkiss_scene_timer++;
    if ((button3_p() && flowery_blowkiss_scene_timer > 15) || !i_ex(1176))
    {
        with (1176)
        {
            instance_destroy();
        }
        global.typer = 50;
        msgsetloc(0, "You're not the&only one that&can ACT!/%", "obj_flowery_enemy_slash_Step_0_gml_2281_0");
        scr_enemyblcon(x - 8, y + 40, 10);
        with (1531)
        {
            flowery_float = true;
        }
        flowery_blowkiss_scene_timer = 0;
        flowery_blowkiss_scene_con = 3;
    }
}
if (flowery_blowkiss_scene_con == 3)
{
    flowery_blowkiss_scene_timer++;
    if ((button3_p() && flowery_blowkiss_scene_timer > 15) || !i_ex(1176))
    {
        with (1176)
        {
            instance_destroy();
        }
        flowery_blowkiss_scene_timer = 0;
        flowery_blowkiss_scene_con = 4;
    }
}
if (flowery_blowkiss_scene_con == 4)
{
    flowery_blowkiss_scene_timer++;
    if (flowery_blowkiss_scene_timer == 1)
    {
        state = 10;
        sprite_index = 3757;
        image_speed = 0.16666666666666666;
        image_index = 0;
        snd_play_flowery(740);
        speed = 4;
        direction = 0;
        friction = 0.5;
        snd_play(300, 1, 0.8);
    }
    if (flowery_blowkiss_scene_timer == 9)
    {
        speed = 10;
        direction = 180;
        friction = 0.5;
        snd_play(300, 1, 1.2);
        snd_play(2, 0.1, 1.2);
        snd_volume(2, 2, 5);
    }
    if (flowery_blowkiss_scene_timer == 12)
    {
        image_speed = 0;
        image_index = 3;
    }
    if (flowery_blowkiss_scene_timer == 40)
    {
        image_speed = 0;
        image_index = 3;
        with (1432)
        {
            sprite_index = 2182;
            state = 8;
        }
        with (1433)
        {
            sprite_index = 2244;
            state = 8;
        }
        with (1434)
        {
            sprite_index = 2445;
            state = 8;
        }
        if (floradinn_recruited)
        {
            with (floradin_marker)
            {
                sprite_index = 5202;
                image_xscale *= -1;
                x += 67;
                xstart = x;
                y -= 4;
            }
        }
        if (leafling_recruited)
        {
            with (leafling_marker)
            {
                sprite_index = 1526;
                image_xscale *= -1;
                x += 50;
                xstart = x;
            }
        }
        if (kawkaw_recruited)
        {
            with (kawkaw_marker)
            {
                sprite_index = 1628;
                image_xscale *= -1;
                x += 80;
                xstart = x;
            }
        }
    }
    if (flowery_blowkiss_scene_timer >= 40 && flowery_blowkiss_scene_timer < 100)
    {
        with (1430)
        {
            x = (xstart - 2) + irandom(4);
        }
        if (floradinn_recruited)
        {
            with (floradin_marker)
            {
                x = (xstart - 2) + irandom(4);
            }
        }
        if (leafling_recruited)
        {
            with (leafling_marker)
            {
                x = (xstart - 2) + irandom(4);
            }
        }
        if (kawkaw_recruited)
        {
            with (kawkaw_marker)
            {
                x = (xstart - 2) + irandom(4);
            }
        }
    }
    if (flowery_blowkiss_scene_timer >= 20 && flowery_blowkiss_scene_timer < 90)
    {
        repeat (1)
        {
            drop_petal(x + 8, y + 44, true, 0, 1);
        }
    }
    if (flowery_blowkiss_scene_timer == 60)
    {
        snd_volume(2, 0, 30);
        if (floradinn_recruited)
        {
            with (floradin_marker)
            {
                spareanim = instance_create(x, y, 227);
                spareanim.sprite_index = sprite_index;
                spareanim.sprite_index = 3736;
                spareanim.image_xscale = image_xscale;
                spareanim.image_index = 0;
                spareanim.image_yscale = image_yscale;
                instance_destroy();
            }
        }
        if (leafling_recruited)
        {
            with (leafling_marker)
            {
                spareanim = instance_create(x, y, 227);
                spareanim.sprite_index = sprite_index;
                spareanim.sprite_index = 7022;
                spareanim.image_xscale = image_xscale;
                spareanim.image_index = 0;
                spareanim.image_yscale = image_yscale;
                instance_destroy();
            }
        }
        if (kawkaw_recruited)
        {
            with (kawkaw_marker)
            {
                spareanim = instance_create(x, y, 227);
                spareanim.sprite_index = sprite_index;
                spareanim.sprite_index = 1590;
                spareanim.image_xscale = image_xscale;
                spareanim.image_index = 0;
                spareanim.image_yscale = image_yscale;
                instance_destroy();
            }
        }
        snd_play_x(1, 0.8, 1);
        with (1430)
        {
            if (object_index != 1432)
            {
                __mercydmgwriter = instance_create(x, y + 40, 1537);
                __mercydmgwriter.damage = 10;
                __mercydmgwriter.type = 5;
                mercy += 10;
                mercycon = 1;
            }
        }
    }
    if (flowery_blowkiss_scene_timer == 100)
    {
        snd_stop(2);
        scr_move_to_point_over_time(xstart - 40, ystart - 34, 2);
        with (1430)
        {
            x = xstart;
            state = 0;
        }
    }
    if (flowery_blowkiss_scene_timer == 103)
    {
        x = xstart;
        y = ystart;
        sprite_index = idlesprite;
        image_speed = 0.16666666666666666;
        state = 0;
    }
    if (flowery_blowkiss_scene_timer == 105)
    {
        phase = 3;
        phaseturn = 0;
        blowawaybattlemsg = true;
        flowery_blowkiss_scene_timer = 0;
        flowery_blowkiss_scene_con = 0;
    }
}
if (endcon == 1)
{
    endtimer++;
    if (endtimer == 30)
    {
        endtimer = 0;
        endcon = 2;
    }
}
if (defensedowntimer > 0)
{
    defensedowntimer--;
    if ((defensedowntimer % 7) == 0)
    {
        with (1430)
        {
            var _x = 10 + irandom(70);
            var _y = 10 + irandom(80);
            if (object_index == 1433)
            {
                _x = 10 + irandom(70);
                _y = 10 + irandom(80);
            }
            if (object_index == 1434)
            {
                _x = 10 + irandom(70);
                _y = 10 + irandom(80);
            }
            inst = instance_create(x + _x, y + _y, 1569);
            inst.sprite_index = 2096;
            inst.image_blend = 255;
            inst.image_index = 0;
            inst.image_angle = 270;
            inst.image_speed = 0;
            inst.image_xscale = 2;
            inst.image_yscale = 2;
            inst.vspeed = 6;
            inst.friction = 0.3;
            inst.fadeSpeed = 0.1;
        }
    }
}
if (mercyaddcon == 1)
{
    mercyaddtimer++;
    if (mercyaddtimer == 1)
    {
        snd_stop(359);
        snd_play_x(359, 1, 1 + (presstimer / 100));
        state = 10;
        image_speed = 0;
        image_index = 0.5;
        sprite_index = 7100;
        blown = 1;
        blowanimtimer = 20;
        onoff = 0;
        shakeamt = 5;
        repeat (6)
        {
            dustparticle = instance_create(x + random(sprite_width - 40) + 2, y + 20 + random(sprite_height - 20), 1237);
            with (dustparticle)
            {
                sprite_index = 6110;
                speed = 6;
                image_index = 1;
                direction = 10 + random(70);
                image_speed = 0.5;
                image_xscale = 2;
                image_yscale = 2;
                gravity_direction = 0;
                gravity = 0.7;
                friction = 0.4;
                image_alpha = 0.5;
                depth = 15;
            }
            with (dustparticle)
            {
                image_alpha = 1;
                depth = -10;
            }
        }
    }
    if (mercyaddtimer >= 10)
    {
        mercyaddtimer = 0;
        mercyaddcon = 0;
        state = 0;
        sprite_index = 6703;
        image_speed = 0.16666666666666666;
    }
}
if (aqua_and_purple_enter == 1)
{
    NOOO_MERCY = false;
    with (purple_marker)
    {
        scr_lerpvar("x", x, camerax() + 532, 15, 2, "out");
    }
    with (aqua_marker)
    {
        scr_lerpvar("x", x, camerax() + 543, 15, 2, "out");
    }
    with (aqua_marker)
    {
        scr_delay_var("sprite_index", 6096, 22);
    }
    with (aqua_marker)
    {
        scr_delay_var("image_speed", 0.16666666666666666, 22);
    }
    aqua_and_purple_enter = 2;
}
if (orange_jump_con == 1)
{
    NOOO_MERCY = false;
    orange_jump_timer++;
    if (i_ex(orange_marker))
    {
        orange_marker.x = lerp(xstart + 150, camerax() + 494, orange_jump_timer / 5);
        orange_marker.y = lerp(ystart - 80, cameray() + 90, orange_jump_timer / 5);
    }
    if (orange_jump_timer >= 5)
    {
        orange_jump_timer = 0;
        orange_jump_con = 0;
        with (orange_marker)
        {
            xstart = x;
            ystart = y;
        }
    }
}
if (green_and_orange_enter == 1 && debugtimer < 1)
{
    NOOO_MERCY = false;
    orange_jump_con = 1;
    with (green_marker)
    {
        scr_lerpvar("x", x, camerax() + 536, 15, 2, "out");
    }
    green_and_orange_enter = 2;
}
if (yellow_and_blue_enter == 1 && debugtimer < 1)
{
    NOOO_MERCY = false;
    with (orange_marker)
    {
        sprite_index = 5450;
    }
    yellow_and_blue_enter_timer++;
    if (yellow_and_blue_enter_timer == 1)
    {
        with (blue_marker)
        {
            scr_lerpvar("x", x, camerax() + 502, 15, 2, "out");
        }
    }
    if (yellow_and_blue_enter_timer < 13)
    {
        with (yellow_marker)
        {
            y = lerp((cameray() + 160) - 600, cameray() + 160, other.yellow_and_blue_enter_timer / 12);
        }
    }
    if (yellow_and_blue_enter_timer < 14)
    {
        with (yellow_marker)
        {
            with (scr_afterimage_monochrome(65535, true))
            {
                image_alpha = 0.6;
            }
        }
    }
    if (yellow_and_blue_enter_timer == 13)
    {
        with (yellow_marker)
        {
            sprite_index = 106;
        }
        snd_play(6, 0.2, 0.8);
        with (yellow_marker)
        {
            anim = instance_create(bbox_left, bbox_bottom, 1237);
            with (anim)
            {
                sprite_index = 3659;
                hspeed = 6;
                friction = 0.4;
                image_speed = 0.5;
                scr_darksize();
                image_xscale = -2;
            }
            for (var i = 1; i < 5; i++)
            {
                var ai = instance_create_depth(x - 80, y + 180, -100000, 1070);
                with (ai)
                {
                    xscale = 1;
                    yscale = 1;
                    alpha = 0.3;
                    xrate = 0.03 * i;
                    yrate = 0.03 * i;
                    faderate = 0.025;
                }
            }
        }
    }
    if (yellow_and_blue_enter_timer == 43)
    {
        with (yellow_marker)
        {
            sprite_index = 6497;
        }
        with (yellow_marker)
        {
            image_xscale = 2;
        }
        with (yellow_marker)
        {
            x -= 72;
        }
        with (yellow_marker)
        {
            ystart = y;
        }
        yellow_and_blue_enter = 2;
    }
}
purple_marker.y = purple_marker.ystart + (sin(float_siner * 0.5) * 8);
if (aqua_and_purple_enter >= 1 && green_and_orange_enter < 2)
{
    event_user(5);
}
aqua_marker.y = aqua_marker.ystart + (sin(float_siner * 0.5) * 8);
if (orange_jump_con == 0)
{
    orange_marker.y = orange_marker.ystart + (sin(float_siner * 0.33) * 5);
}
if (phase < 5)
{
    green_marker.y = green_marker.ystart + (sin(float_siner * 0.5) * 8);
}
if (!i_ex(826))
{
    blue_marker.y = blue_marker.ystart + (sin(float_siner * 0.5) * 8);
    if (yellow_marker.sprite_index == 6497)
    {
        yellow_marker.y = yellow_marker.ystart + (sin(float_siner * 0.5) * 8);
    }
}
if (aqua_mercy >= 100)
{
    aqua_mercy = 100;
}
if (purple_mercy >= 100)
{
    purple_mercy = 100;
}
if (orange_mercy >= 100)
{
    orange_mercy = 100;
}
if (green_mercy >= 100)
{
    green_mercy = 100;
}
if (blue_mercy >= 100)
{
    blue_mercy = 100;
}
if (yellow_mercy >= 100)
{
    yellow_mercy = 100;
}
if (make_orange_visible_con == 1)
{
    var _end = true;
    for (var i = 0; i < instance_number(1496); i++)
    {
        marker[i] = instance_find(1496, i);
        if (marker[i].sprite_index == 8247)
        {
            _end = false;
        }
    }
    if (_end == true)
    {
        make_orange_visible_con = 0;
        with (orange_marker)
        {
            visible = true;
        }
    }
}
with (yellow_marker)
{
    depth = other.depth - 60;
    if (i_ex(826))
    {
        depth = obj_yellow_trial_manager.depth + 60;
    }
}
if (i_ex(1535))
{
    with (yellow_marker)
    {
        depth = obj_growtangle.depth;
    }
}
if (i_ex(orange_marker) && phase < 5)
{
    orange_marker.image_alpha = 1;
}
else if (i_ex(orange_marker) && phase >= 5)
{
    orange_marker.image_alpha = 0;
}
if (orange_fixibility_fix > 0)
{
    orange_fixibility_fix--;
    with (orange_marker)
    {
        image_alpha = 1;
    }
}
with (709)
{
    if (appearance == 1)
    {
        with (579)
        {
            orange_marker.image_alpha = 0;
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1
}
