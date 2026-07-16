onlinekeys();

if (global.key_online && !instance_exists(obj_onlinemenu))
{
    instance_create(x, y, obj_onlinemenu);
    global.interact = 8;
}
else if (global.key_lostlevels && !instance_exists(obj_lostlevelsmenu) && global.lostlevels == 1)
{
    instance_create(x, y, obj_lostlevelsmenu);
    global.interact = 8;
}

if (!grassinit)
{
    grassinit = true;
    use_foreground_marker = instance_exists(obj_plat_vertical_floor_grass_strip);
    global.start_in_dashmode = UnknownEnum.Value_0;
    
    if (grounded && ground == -4)
        grounded = false;
    
    dashspeed_modified = dashspeed;
    
    if (instance_exists(obj_dw_cliff_dash_runner) || instance_exists(obj_dw_cliff_finaldash) || instance_exists(obj_dw_fcastle_ultradash))
        dashspeed_modified *= 2.5;
    
    if (instance_exists(obj_dw_cliff_eastcliff) || instance_exists(obj_dw_garden_aquadash_plat))
        dashspeed_modified *= 1.5;
    
    if (static_dash)
        dashspeed_modified = 0;
    
    if (!instance_exists(obj_tutorial_text))
        instance_create(0, 0, obj_tutorial_text);
    
    if (instance_exists(obj_platswap) && !instance_exists(obj_petalwing))
    {
        var _petalwing = instance_create(x, y, obj_petalwing);
        _petalwing.in_use = 1;
        _petalwing.timerstart = 1;
    }
}

if (button3_p())
{
    if (!act_buffer)
        act_button_held = true;
}
else if (!button3_h())
{
    if (global.interact == 0 && !global.pause_plat)
        act_buffer = false;
    
    act_button_held = false;
}

shake--;

if (dogjoke == 2)
    gml_Script_scr_afterimage_monochrome(255, true).image_alpha = 0.5;

if (cutscene == 1)
{
    hspeed = 0;
    vspeed = 0;
    heart.image_alpha -= 0.1;
    
    if (!was_cutscene)
        pre_cutscene_gravity = entity_gravity;
    
    gravity = 0;
    entity_gravity = 0;
    was_cutscene = 1;
    act_button_held = false;
    
    if (!targetmode)
        exit;
}
else if (was_cutscene)
{
    was_cutscene = false;
    gravity = pre_cutscene_gravity;
    entity_gravity = pre_cutscene_gravity;
}

var _keyleftprev = key_left;
var _keyrightprev = key_right;
var _hspeedmax = hspeed_max * (1 - clamp01(encumbered_count));
var _hspeedmin = -hspeed_max * (1 - clamp01(encumbered_count));

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

if (hurt || fallen_in_pit || global.interact > 0 || door_direction != 0 || paused || custom_paused || state == 1)
{
    key_left = false;
    key_right = false;
    key_up = false;
    key_down = false;
    press_left = false;
    press_right = false;
    press_up = false;
    press_down = false;
    vinput = 0;
    hinput = 0;
    press_jump = false;
    key_jump = false;
    press_attack = false;
    key_attack = false;
    key_left = key_left_override;
    key_right = key_right_override;
}
else
{
    gml_Script_scr_get_inputs(true);
}

if (door_direction != 0)
{
    if (door_direction == 1)
    {
        key_right = true;
        key_left = false;
    }
    else if (door_direction == -1)
    {
        key_left = true;
        key_right = false;
    }
    
    key_jump = hold_jump;
}

if (dash_transition_con > 0 && !targetmode)
{
    dash_transition_timer++;
    global.interact = 1;
    
    if (dash_transition_con == 1)
    {
        event_inherited();
        
        if (dash_transition_timer == 1)
        {
            with (obj_plat_camera)
            {
                reset_all_lerps();
                scr_lerpvar("nudgex", nudgex, other.dashspeed_modified * other.dashsign * 4, 17, 3, "out");
            }
            
            image_xscale = 2 * dashsign;
            var ground_y = 9999999;
            var li = ds_list_create();
            collision_rectangle_list(x + (40 * image_xscale), y, x + (41 * image_xscale), y + 200, obj_plat_floor, false, true, li, false);
            
            for (var i = 0; i < ds_list_size(li); i++)
            {
                if (ds_list_find_value(li, i).y < ground_y)
                    ground_y = ds_list_find_value(li, i).y;
            }
            
            ds_list_destroy(li);
            
            if (ground_y == 9999999)
                ground_y = y;
            else
                ground_y -= (bbox_bottom - y);
            
            jumping = 3;
            sprite_index = spr_kris_plat_land;
            image_speed = 0;
            hspeed = 0;
            vspeed = 0;
            scr_lerpvar("x", x, dash_position[0] + (20 * dashsign), 8, 3, "out");
            scr_lerpvar("y", y, dash_position[1] - 62, 8, 3, "out");
            var bottom = (dash_position[1] - 62) + (bbox_bottom - y);
            wallcollision = false;
            grounded = 0;
            snd_play(snd_wing);
            
            with (obj_plat_follower)
            {
                caterpillarmode = false;
                wallcollision = false;
                hspeed = 0;
                vspeed = 0;
                var ii = (name == "susie") ? 1 : 2;
                scr_lerpvar("x", x, other.dash_position[0] + ((20 - (40 * ii)) * other.dashsign), 8, 3, "out");
                scr_lerpvar("y", y, bottom - (bbox_bottom - y), 8, 3, "out");
                custom_behaviour(function()
                {
                }, 19);
                
                if (name == "susie")
                    force_animation(1185, 19, true);
                else
                    force_animation(6347, 19, true);
                
                image_speed = 0;
            }
        }
        
        with (obj_plat_follower)
            hspeed = other.hspeed;
        
        if (dash_transition_timer == 9)
        {
            with (obj_dashmode_trigger)
            {
                flash_object(other);
                
                with (obj_plat_follower)
                {
                    with (other)
                        flash_object(other);
                }
            }
        }
        
        if (dash_transition_timer == 17)
        {
            var dashdir = dashsign;
            
            with (obj_dashmode_trigger)
                start_running(other, dashdir, 16777215, true);
            
            visible = 1;
            jumping = 0;
            wallcollision = true;
            gml_Script_scr_plat_snap_to_ground();
            
            with (obj_plat_follower)
            {
                wallcollision = true;
                gml_Script_scr_plat_snap_to_ground();
                image_xscale = other.image_xscale;
                visible = 1;
                init_caterpillarmode();
            }
            
            sprite_index = spr_kris_plat_run;
            vspeed = 0;
            dash_transition_con = 0;
            global.interact = 0;
            vfx = instance_create(x, y, obj_plat_dashlines);
            vfx.owner = id;
            vfx.xspeed = -15 * image_xscale;
            dashing = true;
            attacking = false;
            hspeed = dashdir * 12;
            audio_stop_sound(snd_weaponpull_fast);
            snd_play(snd_weaponpull_fast);
            windloop_sound = snd_loop(snd_plat_windloop);
        }
    }
    
    if (dash_transition_con > 0)
        exit;
}

var _FollowObject = -4;

if (state == 1)
{
    with (obj_plat_movemarker)
    {
        if (extflag == other.followtarget || id == other.followtarget)
        {
            _FollowObject = id;
            var _dist = point_distance(x, y, other.x, other.y);
            
            if (_dist <= 60)
            {
                var _next_marker = -4;
                
                with (obj_plat_movemarker)
                {
                    if (other.next_extflag == extflag)
                        _next_marker = id;
                }
                
                if (_next_marker != -4)
                    other.followtarget = _next_marker;
            }
            
            break;
        }
    }
    
    if (instance_exists(_FollowObject))
    {
        var _followX = _FollowObject.x;
        var _followY = _FollowObject.y;
        var _follow_dist = 10;
        
        if (grounded)
        {
            if (y > (_followY + 40) && abs(_followX - x) <= 80)
            {
                press_jump = true;
                key_jump = true;
            }
        }
        else if ((vspeed <= 0 || jumping || jumpsquat) && y > _followY)
        {
            key_jump = true;
        }
        
        if (grounded)
        {
            if (hspeed > 0 && !collision_line(x, y, x, bbox_bottom + 10, obj_plat_floor, 0, 0) && !collision_line(x, y, x, bbox_bottom + 10, obj_plat_player.ground, 0, 0))
                press_jump = true;
            
            if (hspeed < 0 && !collision_line(x, y, x, bbox_bottom + 10, obj_plat_floor, 0, 0) && !collision_line(x, y, x, bbox_bottom + 10, obj_plat_player.ground, 0, 0))
                press_jump = true;
        }
        
        var _keepmoving = 0;
        
        if (x > (_followX + _follow_dist))
            key_left = true;
        else
            _keepmoving++;
        
        if (x < (_followX - _follow_dist))
            key_right = true;
        else
            _keepmoving++;
    }
}

var last_targetmode = targetmode;
var in_targetmode = (act_button_held || keep_act_open_forced) && global.interact == 0 && (!paused || targetmode) && jumping != 3 && act_enabled && !hurt;

if (in_targetmode)
{
    if (!last_targetmode)
    {
        targetmode_pause_trigger = 1;
        last_accepted_input_angle = -2;
        
        with (obj_choicer_neo)
            instance_destroy();
        
        cx = bbox_left + (0.5 * (bbox_right - bbox_left)) + hspeed;
        cy = bbox_top + (0.5 * (bbox_bottom - bbox_top)) + vspeed + entity_gravity;
        
        with (obj_afterimage)
            instance_destroy();
        
        with (obj_afterimage_onecolor)
            instance_destroy();
        
        ds_list_clear(act_targets_list);
        snd_play(snd_spearrise);
        
        with (obj_plat_targethelper)
            is_valid_target = false;
        
        var pad = 10;
        var pad_bottom = pad + 20;
        var _cx = camerax();
        var _cy = cameray();
        
        with (obj_plat_targethelper)
        {
            hovered = false;
            last_hovered = false;
            hoverlerp = 0;
        }
        
        if (instance_exists(obj_darkcontroller) && obj_darkcontroller.charcon == 1)
            pad_bottom += 40;
        
        collision_rectangle_list(_cx + pad, _cy + pad, (_cx + camerawidth()) - pad, (_cy + cameraheight()) - pad_bottom, obj_plat_targethelper, false, false, act_targets_list, false);
        targetmode = true;
        targetindex = -1;
        blue_outline = true;
        heart.depth = 1400;
        heart.image_alpha = 1;
        
        with (obj_plat_follower)
            depth = 1580;
        
        with (obj_plat_foreground_writer)
        {
            if (side == 0)
                evade = (other.bbox_top - _cy) < 120;
            else
                evade = (other.bbox_bottom - _cy) > 360;
        }
        
        hlit_target = -1;
        last_index_buffer = 0;
        var isok = false;
        var buffer = 10;
        pad_bottom = buffer + 20;
        
        if (instance_exists(obj_darkcontroller) && obj_darkcontroller.charcon == 1)
            pad_bottom += 40;
        
        var i = ds_list_size(act_targets_list) - 1;
        
        while (i >= 0)
        {
            var elem = ds_list_find_value(act_targets_list, i);
            
            if (instance_exists(elem) && elem.active && !elem.protected && elem.blocked != 1 && elem.cx >= (_cx + buffer) && elem.cx <= ((_cx + camerawidth()) - buffer) && elem.cy >= (_cy + buffer) && elem.cy <= ((_cy + cameraheight()) - pad_bottom))
            {
                isok = true;
                elem.is_valid_target = true;
            }
            else
            {
                ds_list_delete(act_targets_list, i);
            }
            
            i--;
        }
        
        if (!isok)
            hlit_target = -0.5;
    }
    
    if (!keep_act_open_forced)
        gml_Script_scr_get_inputs(true);
    
    var type = 0;
    
    if (press_right)
        type = 1;
    
    if (press_up)
        type = 2;
    
    if (press_left)
        type = 3;
    
    if (press_down)
        type = 4;
    
    type = check_new_gamepad_dir(type);
    
    if (button2_p())
        type = 5;
    
    if (type > 0 && ds_list_size(act_targets_list) > 0)
    {
        var to = ds_list_find_value(act_targets_list, targetindex);
        
        if (to == undefined || !instance_exists(to))
        {
            cx = bbox_left + (0.5 * (bbox_right - bbox_left));
            cy = bbox_top + (0.5 * (bbox_bottom - bbox_top));
            to = self;
        }
        
        var _input = 
        {
            to: to,
            type: type,
            besti: -1,
            secondbesti: -1,
            best: to,
            angle_limit: 65,
            bestdist: 99999,
            bestangle: 999999,
            secondbest: -4,
            secondbestdist: 99999,
            secondbestangle: 999999,
            best_is_close: false,
            total_targets: 0
        };
        
        if (type != 5)
        {
            if (ds_list_size(act_targets_list) == 1)
                _input.angle_limit = 85;
            
            find_best_target(_input);
        }
        
        if (_input.best_is_close && _input.secondbesti >= 0)
        {
            _input.best = _input.secondbest;
            _input.besti = _input.secondbesti;
            _input.bestdist = _input.secondbestdist;
            _input.bestangle = _input.secondbestangle;
        }
        
        if (_input.besti < 0)
        {
            _input.best = self;
            snd_play(snd_plat_act_move_fail);
            hlit_target = -1;
        }
        else
        {
            hlit_target = 3;
            
            if (_input.best.char == "su")
                hlit_target = 1;
            
            if (_input.best.char == "ra")
                hlit_target = 2;
            
            if (_input.best.char == "dog")
                hlit_target = 4;
            
            if (_input.best.char == "none")
                hlit_target = 5;
            
            if (_input.best.char == "kr")
                hlit_target = 0;
            
            hlit_name = _input.best.objectname;
            hlit_desc = _input.best.description;
            hlit_blocked = _input.best.blocked == 2;
            
            if (!_input.best._character_active)
            {
                if (_input.best.char == "su")
                    hlit_desc = _input.best.susie_inactive_message;
                else if (_input.best.char == "ra")
                    hlit_desc = _input.best.ralsei_inactive_message;
            }
        }
        
        heart_lerp_timer = 0;
        
        with (obj_plat_foreground_writer)
        {
            if (side == 0)
                evade = (_input.best.bbox_top - cameray()) < 120;
            else
                evade = (_input.best.bbox_bottom - cameray()) > 360;
        }
        
        _input.to.hovered = false;
        _input.best.hovered = true;
        
        if (targetindex >= 0)
        {
            last_targetindex = targetindex;
            last_index_buffer = 2;
            
            if (_input.besti < 0)
                last_index_buffer = 5;
        }
        
        targetindex = _input.besti;
        heart.immune = true;
        heart.depth = 1400;
        
        with (obj_plat_follower)
        {
            highlighted = _input.best != other && ((name == "susie" && _input.best.char == "su") || (name == "ralsei" && _input.best.char == "ra"));
            depth = 1580 - (10 * highlighted);
        }
        
        blue_outline = false;
        
        if (_input.best == self || (_input.best.char == "all" || _input.best.char == "kr"))
            blue_outline = true;
    }
    
    depth = 1550;
    last_index_buffer--;
    
    if (targetindex >= 0 && instance_exists(ds_list_find_value(act_targets_list, targetindex)) && button1_p() && variable_instance_exists(ds_list_find_value(act_targets_list, targetindex), "button1_activated") && ds_list_find_value(act_targets_list, targetindex).button1_activated)
    {
        in_targetmode = false;
        snd_play(snd_plat_act_select);
        ds_list_find_value(act_targets_list, targetindex).select();
        ds_list_find_value(act_targets_list, targetindex).hovered = false;
        key_attack = false;
        press_attack = false;
        key_jump = false;
        press_jump = false;
        scr_delay_var("attack_buffered", false, 2);
        scr_delay_var("attackbuffer", 0, 2);
        scr_delay_var("jumpbuffer", 0, 2);
    }
}

if (!in_targetmode && last_targetmode)
{
    targetmode = false;
    hovered = false;
    blue_outline = false;
    targetmode_pause_trigger = -1;
    heart.image_alpha = outline_alpha;
    hlit_target = -1;
    hlit_name = "";
    hlit_desc = "";
    hlit_blocked = false;
    gml_Script_scr_get_inputs(true);
    
    if (encumbered_count > 5)
        press_jump = false;
    
    if ((key_jump || press_jump) && can_jump)
        jumpbuffer = 4;
    
    if (key_attack || press_attack)
    {
        attack_buffered = true;
        attackbuffer = 4;
    }
    
    gml_Script_scr_plat_depthcast();
    
    with (obj_plat_follower)
    {
        gml_Script_scr_plat_depthcast();
        highlighted = false;
    }
    
    with (heart)
    {
        scr_delay_var("immune", false, 4);
        gml_Script_scr_plat_set_group(UnknownEnum.Value_m2);
    }
    
    var ti = -1;
    
    if (last_index_buffer > 0)
    {
        ti = targetindex;
        targetindex = last_targetindex;
    }
    
    if (ds_list_size(act_targets_list) > 0 && targetindex >= 0)
    {
        var target = ds_list_find_value(act_targets_list, targetindex);
        
        if (instance_exists(target))
        {
            target.hovered = false;
            
            if (!target.button1_activated)
            {
                if (target._character_active && !target.blocked)
                {
                    snd_play(snd_plat_act_select);
                    target.select();
                }
                else
                {
                    snd_play(snd_plat_act_move_fail);
                }
            }
        }
        
        if (ti >= 0)
        {
            target = ds_list_find_value(act_targets_list, ti);
            
            if (instance_exists(target))
                target.hovered = false;
        }
    }
}

if (force_terminate_attack)
{
    attackbuffer = 0;
    key_attack = 0;
    press_attack = false;
    attack_buffered = false;
}

if (targetmode)
{
    var best = self;
    
    if (targetindex >= 0)
    {
        best = ds_list_find_value(act_targets_list, targetindex);
        
        if (!instance_exists(best))
            best = self;
    }
    
    heart_lerp_timer = scr_approach(heart_lerp_timer, 1, 0.15);
    var heart_t = heart_lerp_timer;
    
    with (heart)
    {
        if (heart_t < 1 || !last_targetmode)
        {
            var xs = x;
            var ys = y;
            var xx = best.cx - 9;
            var yy = best.cy - 8;
            
            if (best == other)
            {
                var xspd = lengthdir_x(other.paused_spd, other.paused_dir);
                var yspd = lengthdir_y(other.paused_spd, other.paused_dir);
                xx = (best.x - 10) + other.hspeed;
                yy = (best.y - 10) + 6 + other.vspeed;
            }
            
            if (last_targetmode)
            {
                var dist = point_distance(x, y, xx, yy);
                var dir = point_direction(x, y, xx, yy);
                var i = 0.5 * dist;
                
                while (i < dist)
                {
                    x = xs + lengthdir_x(i, dir);
                    y = ys + lengthdir_y(i, dir);
                    
                    with (gml_Script_scr_afterimage_monochrome(255, true))
                    {
                        fade_when_paused = true;
                        image_alpha = lerp(0.8, 0, 1 - ((i / dist) * 0.5));
                        fadeSpeed = 0.1;
                        depth = other.depth + 1;
                    }
                    
                    i += 24;
                }
            }
            
            heart_t = 1;
            x = xx;
            y = yy;
        }
    }
}

if (paused || custom_paused)
    exit;

global.inv--;

if (!hurt)
{
    if (key_left && key_right)
    {
        if (_keyleftprev && key_left)
            key_right = false;
        
        if (_keyrightprev && key_right)
            key_left = false;
    }
    
    if (dashing && instance_place(x + (hspeed * 1.5), y, obj_plat_block))
    {
        attacking = 0;
        dashing = 0;
        jumping = 3;
        impacted = -hspeed * 0.25;
        grounded = 0;
        sprite_index = spr_plat_kris_ball;
        vspeed = -14;
        hspeed = -hspeed * 0.25;
        snd_play_pitch(snd_cymbal, 1.2);
        snd_play(snd_punchmed);
        
        with (instance_create(x + (20 * image_xscale), y, obj_plat_vfx))
        {
            sprite_index = spr_smack_vfx;
            alarm[0] = 2;
            image_angle = 90 * irandom(3);
        }
    }
    
    var _gate = instance_place(x, y, obj_dashmode_trigger);
    
    if (instance_exists(_gate))
    {
        if (!dashing && !dashing_end && !climbing && !jumphovering)
        {
            var __dir = movement_direction;
            
            if (__dir == _gate.viable_directions || _gate.viable_directions == 0)
            {
                if (_gate.usable && !_gate.just_initiated)
                {
                    with (_gate)
                    {
                        just_initiated = 1;
                        scr_delay_var("just_initiated", 0, 30);
                    }
                    
                    dash_transition_con = 1;
                    dash_transition_timer = 0;
                    dash_position[0] = _gate.x;
                    dash_position[1] = _gate.y;
                    attacking = false;
                    dashsign = __dir;
                    hinput = 0;
                    global.interact = 1;
                }
            }
        }
        
        if (dashing)
        {
            if (_gate.usable && !_gate.just_initiated)
            {
                attacking = 0;
                
                with (obj_plat_camera)
                    reset_all_lerps();
                
                dashing = false;
                dashing_end = 15;
                
                if (_gate.single_use)
                {
                    _gate.deathcon = 1;
                    _gate.timer = 0;
                    act_enabled = false;
                    scr_var_delay("act_enabled", true, 45);
                }
                
                snd_play(snd_wing);
            }
        }
    }
    
    if (dashing || dashing_end)
    {
        _hspeedmax = dashspeed_modified;
        _hspeedmin = -dashspeed_modified;
    }
    
    if (dashing)
    {
        with (obj_plat_camera)
            nudgex = scr_approach(nudgex, other.dashspeed_modified * other.image_xscale * 4, abs(other.hspeed) + 0.55);
        
        if (!variable_instance_exists(id, "afterimagetimer"))
            afterimagetimer = 2;
        
        if (afterimagetimer == 0 && !targetmode && visible)
        {
            var afterimage = gml_Script_scr_afterimage_monochrome(14522675, true);
            
            with (afterimage)
            {
                image_alpha = 0.3;
                fadeSpeed = 0.05;
                image_blend = c_white;
                image_xscale = 2;
                depth = other.depth + 1000;
                hspeed = -other.static_dash_fake_speed * 0.5;
                scr_lerpvar("hspeed", hspeed, -other.static_dash_fake_speed, 3);
            }
            
            afterimagetimer = 1;
        }
        
        if (afterimagetimer > 0)
            afterimagetimer--;
    }
}

var _haccel = air_accel;

if (grounded)
    _haccel = ground_accel;

if (encumbered_count > 0)
    _haccel *= (1 - clamp01(encumbered_count / 10));

if (impacted != 0)
{
    if (jumping != 3)
    {
        impacted = 0;
    }
    else
    {
        hspeed = impacted;
        impacted *= 0.96;
    }
}

var _dont_accel = false;

if (key_left && instance_place(x - 8 - abs(hspeed), y, obj_plat_block))
    _dont_accel = true;

if (key_right && instance_place(x + 8 + abs(hspeed), y, obj_plat_block))
    _dont_accel = true;

if (climbing)
    _dont_accel = true;

if (attacking && grounded)
    _dont_accel = true;

if (jumphovering)
    _dont_accel = true;

if (hurt || jumping == 3 || dashing_end)
    _dont_accel = true;

if (dashing)
{
    _dont_accel = true;
    var hspeedinfluence = 0;
    hspeed = scr_approach(hspeed, (dashspeed_modified * dashsign) + (hinput * hspeedinfluence), 0.35);
}

var _hdecel = 0;

if (grounded)
    _hdecel = ground_decel;
else
    _hdecel = air_decel;

if (!grounded && abs(hspeed) > (_hspeedmax + 2.1))
    _hdecel = 1;

if (hurt)
{
    if (!grounded)
        _hdecel = 0.99;
    else
        _hdecel = ground_decel;
}

if (encumbered_boost)
    _hdecel = 1;

if (perma_attack)
    _hdecel = 1;

var _force_decel = false;

if (grounded && attacking)
    _force_decel = true;

if (hurt)
    _force_decel = true;

if (dashing || jumping == 3 || fallen_in_pit)
{
    _hdecel = 1;
}
else if (dashing_end > 0 && !hurt)
{
    dashing_end--;
    
    if (abs(hspeed) <= 2)
    {
        runstop_anim = 1;
        
        if (!forced_anim)
            sprite_index = spr_kris_plat_runstop;
        
        dashing_end = 0;
    }
    else
    {
        turn_anim = 1;
        
        if (!forced_anim)
            sprite_index = spr_kris_plat_turn;
    }
    
    if (grounded && (t % 2) == 0)
    {
        with (gml_Script_scr_vfx_above(5966))
        {
            depth = other.depth + 2;
            y = other.bbox_bottom;
            image_xscale = other.image_xscale;
        }
    }
    
    _force_decel = 1;
    _hdecel = 0.9;
}

if (!_dont_accel)
{
    if (key_left)
    {
        if (grounded && press_left)
            vfx_dust(1);
        
        var last_hspeed = hspeed;
        hspeed -= _haccel;
        
        if (run_zone)
            _hspeedmin = -(dashspeed_modified + 4);
        
        if (last_hspeed <= _hspeedmin)
            hspeed = clamp(hspeed * _hdecel, last_hspeed, _hspeedmin);
    }
    
    if (key_right)
    {
        if (grounded && press_right)
            vfx_dust(-1);
        
        var last_hspeed = hspeed;
        hspeed += _haccel;
        
        if (run_zone)
            _hspeedmax = dashspeed_modified - 4;
        
        if (last_hspeed >= _hspeedmax)
            hspeed = clamp(hspeed * _hdecel, _hspeedmax, last_hspeed);
    }
}

if (((!key_left && !key_right) || (key_left && key_right) || _force_decel) && !jumphovering)
    hspeed *= _hdecel;

var jumpheight_real = jumpheight * (1 - clamp01(encumbered_count));

if (press_jump && can_jump)
    jumpbuffer = 4;
else
    jumpbuffer = max(jumpbuffer - 1, 0);

if (grounded || climbing)
{
    jump_button_forced = false;
    jump_coyote_time = jump_coyote_time_max;
    jumping = 0;
    jump_time = 0;
}

if (key_jump && can_jump && attacking && grounded)
{
    jumpbuffer = 4;
    var _img = floor(image_index);
    
    if (_img >= 5 && attack_hitbox == 1)
        attacking = false;
    
    if (_img >= 9 && attack_hitbox == 2)
        attacking = false;
}

if (!jumpbuffer && jumpsquat <= 0)
{
    if (!grounded && !climbing && jump_coyote_time > 0)
        jump_coyote_time--;
}

if ((jumpbuffer || jumpsquat > 0) && (climbing || (grounded || infinite_jumps) || (jump_coyote_time > 0 && vspeed > -1)) && !attacking && !jumphovering && !hurt)
{
    var inc = 1;
    var meet = place_meeting(x, y - 8, obj_plat_block);
    
    if (meet)
    {
        inc = 0.5;
        
        if (jumpsquat == 0)
        {
            snd_play(snd_noise);
            vfx = vfx_dust(-1);
            vfx.sprite_index = spr_vfx_landingdust_new;
            vfx = vfx_dust(1);
            vfx.sprite_index = spr_vfx_landingdust_new;
        }
    }
    
    jumpsquat = max(jumpsquat + inc, 1);
    jumpbuffer = 0;
    
    if (jumpsquat > jumpsquat_max)
    {
        jumpsquat = 0;
        jump_coyote_time = 0;
        
        if (!meet)
        {
            climbing = false;
            
            if (wind_jumpheight)
                vspeed = -jumpheight_real - 4;
            else
                vspeed = -jumpheight_real;
            
            y -= 1;
            jumping = 1;
            global.flag[1904]++;
            snd_play_pitch(snd_smallswing, 1.5);
        }
    }
}
else
{
    jumpsquat = 0;
}

if (jumping == 1 && vspeed > 0)
    jumping = 2;

if (jump_boost && (vspeed > 0 || grounded))
    jump_boost = false;

if (jumping)
    jump_time++;

var release_jump = false;

if (!jump_button_forced && !key_jump && jumping == 1 && jump_time >= jump_mintime && !jump_boost && !encumbered_boost)
    release_jump = true;

if ((vspeed < 0 || hitstop > 0) && release_jump && !hurt && !fallen_in_pit)
{
    vspeed *= 0.5;
    
    if (speeds_stored)
        stored_vspeed *= 0.5;
}

if (fallen_in_pit == 0)
{
    var _checkpoint = instance_place(x, y, obj_plat_checkpoint);
    
    if (_checkpoint != -4)
    {
        if (_checkpoint.respawn_target_extflag != "")
        {
            with (obj_plat_movemarker)
            {
                if (extflag == _checkpoint.respawn_target_extflag)
                {
                    _checkpoint = self;
                    break;
                }
            }
        }
        
        checkpoint_x = _checkpoint.x;
        checkpoint_y = _checkpoint.y;
    }
}

var _cameray = cameray();
var _cameraheight = cameraheight();

if (fallen_in_pit == 0 && !instance_exists(obj_cutscene_master) && y > (_cameray + _cameraheight + 120 + (sprite_height * 0.5)))
{
    if (dogjoke)
    {
        dogjoke = false;
        respawn_leap_style = 3;
    }
    
    if (respawn_leap_enabled && (global.interact == 0 || fall_in_foreground))
    {
        fallen_in_pit = 1;
        grounded = 0;
        ground = -4;
        
        if (fall_in_foreground)
        {
            fall_in_foreground = 0;
            
            with (obj_plat_floor)
                mask_index = -4;
        }
        
        global.interact = 0;
        entity_gravity = 1.25;
        
        with (obj_plat_follower)
            restore_default_behavior();
        
        with (obj_dog_hanging)
            instance_destroy();
    }
}

if (fallen_in_pit > 0)
{
    if (respawn_leap_style == 0)
    {
        if (fallen_in_pit == 1)
        {
            physics = false;
            vspeed = 0;
            hspeed = 0;
            impacted = 0;
            dashing = false;
            gravity = 0;
            scr_lerpvar("x", x, checkpoint_x, 10 + ceil(abs(x - checkpoint_x) / 200), 2, "inout");
            global.interact = 1;
            fallen_in_pit = 2;
        }
        
        if (x == checkpoint_x && fallen_in_pit == 2)
        {
            if (abs(image_xscale) > 2)
            {
                image_xscale = -2;
                image_yscale = 2;
                
                with (obj_plat_follower)
                {
                    scale_multiplier = 1;
                    image_xscale = -2;
                    image_yscale = 2;
                }
            }
            
            fallen_in_pit = 3;
            x = checkpoint_x;
            var time = 5 + floor(abs(checkpoint_y - y) / 30);
            var wng = snd_play(snd_wing, 1, 0.3);
            snd_pitch_time(wng, 2.5, time + 10);
            
            with (obj_plat_windcontroller_new)
            {
                flip_wind(time + 10, 90);
                boost_wind(time + 10);
            }
            
            jumping = 1;
            gravity = entity_gravity;
            gravity_direction = 270;
            fallen_in_pit = 2.5;
            scr_lerpvar("x", x, checkpoint_x, time, 2, "inout");
            hspeed = 0;
            gravity = entity_gravity;
            vspeed = (checkpoint_y - y - (0.5 * (entity_gravity * time * time))) / time;
            scr_delay_var("fallen_in_pit", 4, time);
            scr_delay_var("physics", true, time);
        }
        
        if (fallen_in_pit == 4 && (grounded || y > (checkpoint_y + 60)))
        {
            fallen_in_pit = 0;
            global.interact = 0;
        }
    }
    else if (respawn_leap_style == 1)
    {
        var time = 5 + floor(abs(checkpoint_y - y) / 30);
        
        if (fallen_in_pit == 1)
        {
            fallen_in_pit = 1.5;
            scr_delay_var("fallen_in_pit", 2, 10);
            global.interact = 1;
            physics = false;
            
            with (obj_plat_windcontroller_new)
            {
                flip_wind(time + 10, point_direction(other.x, other.y, other.checkpoint_x, other.checkpoint_y), 0, true);
                boost_wind(time + 10);
            }
            
            gravity = 0;
        }
        
        if (fallen_in_pit == 2)
        {
            fallen_in_pit = 2.5;
            var wng = snd_play(snd_wing, 1, 0.3);
            snd_pitch_time(wng, 2.5, time + 10);
            jumping = 1;
            scr_lerpvar("x", x, checkpoint_x, time, 2, "inout");
            hspeed = 0;
            gravity = entity_gravity;
            vspeed = (checkpoint_y - y - (0.5 * (entity_gravity * time * time))) / time;
            scr_delay_var("fallen_in_pit", 3, time);
            scr_delay_var("physics", true, time);
        }
        
        if (fallen_in_pit == 3 && (grounded || y > (checkpoint_y + 60)))
        {
            global.interact = 0;
            fallen_in_pit = 0;
        }
    }
    else if (respawn_leap_style == 2)
    {
        if (fallen_in_pit == 1)
        {
            physics = false;
            vspeed = 0;
            hspeed = 0;
            gravity = 0;
            scr_lerpvar_instance(id, "x", id.x, checkpoint_x, 15, 2, "out");
            fallen_in_pit = 2;
        }
        
        if (x == checkpoint_x && fallen_in_pit == 2)
        {
            fallen_in_pit = 3;
            x = checkpoint_x;
            snd_play(snd_jump);
            jumping = 1;
            vspeed = -33;
            gravity = entity_gravity;
            gravity_direction = 270;
        }
        
        if (fallen_in_pit == 3 && vspeed > -5 && !instance_place(x, y, obj_plat_block))
        {
            fallen_in_pit = 0;
            physics = true;
        }
    }
    else if (respawn_leap_style == 3)
    {
        respawn_leap_enabled = false;
        fallen_in_pit = 0;
        scr_fadeout(35);
        scr_script_delayed(function()
        {
            global.interact = 0;
            snd_volume(global.currentsong[1], 1, 30);
            instance_create(0, 0, obj_persistentfadein);
            room_restart();
        }, 35);
    }
}

event_inherited();

if (grounded && !groundedprev && time_since_ground > 2)
{
    vfx = vfx_dust(-1);
    vfx.sprite_index = spr_vfx_landingdust_new;
    vfx = vfx_dust(1);
    vfx.sprite_index = spr_vfx_landingdust_new;
}

if (hurt)
    attacking = false;

if (attacking && attack_press_mode == 0 && attack_canceleable)
{
    var _img = floor(image_index);
    
    if (_img >= 3.5 && _img < 5 && !key_attack)
    {
        attacking = false;
        sprite_index = spr_kris_jump_down;
    }
    
    if (_img >= 7.5 && _img < 9 && !key_attack)
    {
        attacking = false;
        sprite_index = spr_kris_jump_down;
    }
    
    if (attacking)
    {
        if (attack_hitbox >= 3 && press_attack)
            attack_buffered = true;
    }
    
    if (attack_buffered && image_index >= (image_number - 1.2))
    {
        image_index = 0;
        attack_hitbox = 0;
        attack_buffered = false;
    }
}

if (attacking && attack_press_mode == 1 && attack_canceleable)
{
    if (attack_hitbox == 3 && attack_press_buffer == 2)
    {
        if (image_index > 7 && image_index < image_number && press_attack)
        {
            image_index = 1;
            attack_hitbox = 0;
            attack_press_buffer = 0;
        }
    }
    
    if (attack_hitbox == 2 && attack_press_buffer == 1)
    {
        if (image_index > 3 && image_index <= 6 && press_attack)
        {
            attack_press_buffer++;
        }
        else if (image_index >= 6)
        {
            attacking = false;
            sprite_index = spr_kris_jump_down;
        }
    }
    
    if (attack_hitbox == 1 && attack_press_buffer == 0)
    {
        if (image_index > 1 && image_index <= 3 && press_attack)
        {
            attack_press_buffer++;
        }
        else if (image_index >= 3)
        {
            attacking = false;
            sprite_index = spr_kris_jump_down;
        }
    }
}

if (hurt)
    climbing = false;

if (!attacking)
    force_terminate_attack = false;

if (perma_attack)
{
    attacking = true;
    sprite_index = spr_kris_plat_slash_air;
    
    if (image_index >= 11 || image_index < 8)
    {
        image_index = 8;
        generate_hitbox(attack_hitbox);
    }
    
    if (grounded)
    {
        perma_attack = false;
        attacking = false;
        global.interact = 0;
    }
}

if (jumphovering && ((!key_jump || grounded || !jumpbutton_hover) && jumphover_time >= jumphover_min))
    jumphovering = false;

if (grounded)
    hovers_remaining = max_hovers;

if (press_jump && !grounded && jumpbutton_hover && !jumphovering && jumphover_meter > 0 && jump_coyote_time <= 0 && hovers_remaining && !hurt)
{
    var _penalty = ((max_hovers - hovers_remaining) / max_hovers) * 10;
    jumphover_meter -= _penalty;
    
    if (jumphover_meter <= 0)
        jumphover_meter = 1;
    
    hovers_remaining -= 1;
    snd_play(snd_spearrise);
    jumphovering = true;
    jumphover_time = 0;
    
    if (!attacking)
        sprite_index = spr_kris_jump_up;
    
    if (key_left)
        heart_xoffset = -heart_offset_max;
    
    if (key_right)
        heart_xoffset = heart_offset_max;
    
    if (key_up)
        heart_yoffset = -heart_offset_max;
    
    if (key_down)
        heart_yoffset = heart_offset_max;
}

if (jumphovering == true)
{
    jumphover_time++;
    physics = false;
    gravity = 0;
    hspeed *= 0.5;
    vspeed *= 0.5;
    var _pull = false;
    
    if (!jumphover_shiftmode)
    {
        var _speed = hover_movespeed;
        var _hinput = key_right - key_left;
        var _vinput = key_down - key_up;
        
        if (_hinput != 0 || _vinput != 0)
        {
            var dir = point_direction(0, 0, _hinput, _vinput);
            moveX = lengthdir_x(_speed, dir);
            moveY = lengthdir_y(_speed, dir);
            
            if (!instance_place(x + (moveX * 1.5), y, obj_plat_block))
            {
                x += moveX;
                _pull = true;
            }
            
            if (!instance_place(x, y + (moveY * 1.5), obj_plat_block))
            {
                y += moveY;
                _pull = true;
            }
        }
        
        if (!global.pause_plat && !parry)
        {
            jumphover_meter--;
            
            if (_pull)
                jumphover_meter--;
        }
    }
    
    if (jumphover_meter <= 0)
        jumphovering = false;
}

if (jumphover_shiftmode)
{
    var _pull = false;
    
    if (jumphovering && heart_mode == 1)
    {
        var _speed = 4;
        var _hinput = key_right - key_left;
        var _vinput = key_down - key_up;
        heart_xoffset += (_hinput * hover_movespeed);
        heart_yoffset += (_vinput * hover_movespeed);
        var _max = heart_offset_max;
        
        if (heart_xoffset < -_max)
        {
            if (!instance_place(x - abs(_speed), y, obj_plat_block))
                x -= _speed;
            
            _pull = true;
        }
        
        if (heart_xoffset > _max)
        {
            if (!instance_place(x + abs(_speed), y, obj_plat_block))
                x += _speed;
            
            _pull = true;
        }
        
        if (heart_yoffset < -_max)
        {
            if (!instance_place(x, y - abs(_speed), obj_plat_block))
                y -= _speed;
            
            _pull = true;
        }
        
        if (heart_yoffset > _max)
        {
            if (!instance_place(x, y + abs(_speed), obj_plat_block))
                y += _speed;
            
            _pull = true;
        }
        
        if (!global.pause_plat && !parry)
        {
            jumphover_meter--;
            
            if (_pull)
                jumphover_meter--;
        }
        
        heart_xoffset = clamp(heart_xoffset, -_max, _max);
        heart_yoffset = clamp(heart_yoffset, -_max, _max);
    }
    else
    {
        if (jumphover_time >= jumphover_iframes_requirement)
            heart.retreating = true;
        
        heart_xoffset *= 0.5;
        heart_yoffset *= 0.5;
        
        if (abs(round(heart_xoffset)) < 3)
            heart_xoffset = 0;
        
        if (abs(round(heart_yoffset)) < 3)
            heart_yoffset = 0;
        
        if (heart_xoffset == 0 && heart_yoffset == 0)
            heart.retreating = false;
    }
}

if (jumphover_chargevfx > 0)
    jumphover_chargevfx--;

if (grounded || fallen_in_pit || climbing)
{
    if (jumphover_meter < jumphover_max)
    {
        var _max = jumphover_max;
        
        if (jumphover_meter < (jumphover_max * 0.9))
        {
            jumphover_chargevfx = ((_max - jumphover_meter) / _max) * jumphover_chargevfx_max;
            jumphover_chargevfx_white = jumphover_chargevfx_whitemax;
        }
        
        jumphover_meter = jumphover_max;
    }
}

if (!hurt)
{
    attackbuffer = max(0, attackbuffer - 1);
    
    if (press_attack)
        attackbuffer = 4;
    
    if (attackbuffer && !attacking && !climbing && !jumpsquat)
    {
        if (attack_override_check())
        {
            attackbuffer = 0;
            attack_hitbox = 0;
            image_index = 0;
            image_speed = 0.6;
            attack_canceleable = 1;
            
            if (grounded)
            {
                sprite_index = spr_kris_plat_slash_ground;
            }
            else
            {
                sprite_index = spr_kris_plat_slash_air;
                
                if (!jumphovering)
                {
                    attack_hitbox = 2;
                    image_index = 8;
                    attack_canceleable = 0;
                }
            }
            
            attacking = true;
            attack_press_buffer = 0;
            attack_buffered = false;
        }
        else
        {
        }
    }
    
    if (attacking)
    {
        var _img = floor(image_index);
        
        if (_img >= 1 && attack_hitbox == 0)
        {
            snd_play(snd_smallswing);
            hbx = generate_hitbox(attack_hitbox);
            global.flag[1905]++;
            attack_hitbox++;
        }
        
        if (_img >= 5 && attack_hitbox == 1)
        {
            snd_play_pitch(snd_heavyswing, 1.1);
            hbx = generate_hitbox(attack_hitbox);
            global.flag[1905]++;
            attack_hitbox++;
        }
        
        if (_img >= 9 && attack_hitbox == 2)
        {
            snd_play_pitch(snd_ultraswing, 1.1);
            hbx = generate_hitbox(attack_hitbox);
            global.flag[1905]++;
            attack_hitbox++;
        }
    }
}

var _landingsound = false;
var _do_autorun = false;

if (!animation_override)
{
    if ((dashing || autorun) && grounded && !attacking && !climbing)
        _do_autorun = true;
    
    if (grounded != groundedprev && grounded && !attacking && land_anim == 0 && time_since_ground > 2)
    {
        land_anim = 1;
        _landingsound = true;
        
        if (!forced_anim)
            sprite_index = spr_kris_plat_land;
        
        image_index = 0;
        image_speed = 0.25;
        
        if (instance_exists(hbx))
            instance_destroy(hbx);
    }
    
    if ((!attacking || (attack_hitbox == 0 && attacking)) && !climbing && !hurt && !dashing && !dashing_end)
    {
        if (key_left)
        {
            if (grounded && !turn_anim && hspeed > 0.1 && !attacking)
            {
                turn_anim = true;
                
                if (!forced_anim)
                    sprite_index = spr_kris_plat_turn;
                
                image_index = 0;
                image_speed = 0.25;
            }
            
            image_xscale = -2;
        }
        
        if (key_right)
        {
            if (grounded && !turn_anim && hspeed < -0.1 && !attacking)
            {
                turn_anim = true;
                
                if (!forced_anim)
                    sprite_index = spr_kris_plat_turn;
                
                image_index = 0;
                image_speed = 0.25;
            }
            
            image_xscale = 2;
        }
    }
    
    if (!attacking && grounded && !climbing && !_do_autorun)
    {
        if (((!key_left && !key_right) || (key_left && key_right)) && !runstop_anim && !land_anim && sprite_index != spr_kris_plat_idle && sprite_index == spr_kris_plat_run)
        {
            turn_anim = false;
            runstop_anim = true;
            sprite_index = spr_kris_plat_runstop;
            image_index = 0;
            image_speed = 0.25;
        }
    }
    
    if (key_left || key_right || sprite_index != spr_kris_plat_runstop)
        runstop_anim = false;
    
    if (attacking || !grounded)
    {
        land_anim = 0;
        turn_anim = false;
        runstop_anim = false;
    }
    
    if (sprite_index != spr_kris_plat_land || key_left || key_right)
        land_anim = 0;
    
    if (!attacking && !hurt && !land_anim && !turn_anim && !runstop_anim && !climbing && !_do_autorun)
    {
        image_speed = 0.25;
        
        if (grounded)
        {
            if (key_left || key_right)
                sprite_index = spr_kris_plat_run;
            
            if (key_left && hspeed > 0.1 && !turn_anim)
            {
                turn_anim = true;
                sprite_index = spr_kris_plat_turn;
            }
            
            if (key_right && hspeed < -0.1 && !turn_anim)
            {
                turn_anim = true;
                sprite_index = spr_kris_plat_turn;
            }
            
            if (hspeed < 0.25 && hspeed > -0.25)
            {
                if (!turn_anim)
                {
                    image_speed = 0.25;
                    
                    if (!forced_anim)
                        sprite_index = spr_kris_plat_idle;
                }
            }
            else
            {
                if (!turn_anim)
                    image_speed = 0.15 + (0.25 * (abs(hspeed) / abs(hspeed_max)));
                
                if (key_left && key_right)
                {
                    turn_anim = false;
                    image_speed = 0.25;
                    
                    if (!forced_anim)
                        sprite_index = spr_kris_plat_idle;
                }
            }
        }
        else
        {
            image_speed = 0.25;
            
            if (jumping == 3)
                sprite_index = spr_plat_kris_ball;
            else if (jumping < 2)
                sprite_index = spr_kris_jump_up;
            else
                sprite_index = spr_kris_jump_down;
        }
    }
    
    if (attacking)
    {
        if (grounded)
        {
            if (sprite_index == spr_kris_plat_slash_air && image_index > 10)
            {
                land_anim = 1;
                sprite_index = spr_kris_plat_land;
                image_index = 0;
                image_speed = 0.25;
                attacking = 0;
                instance_destroy(hbx);
            }
            else
            {
                sprite_index = spr_kris_plat_slash_ground;
            }
        }
        else
        {
            sprite_index = spr_kris_plat_slash_air;
        }
    }
    
    if (climbing)
    {
        sprite_index = spr_kris_plat_climb;
        image_speed = 0;
        
        if (key_up)
            image_speed = 0.25;
        
        if (key_down)
            image_speed = -0.25;
    }
    
    if (_do_autorun)
    {
        sprite_index = spr_kris_plat_run;
        
        if (static_dash)
            image_speed = 0.5;
        else
            image_speed = lerp(0.25, 0.5, abs(hspeed / dashspeed_modified));
    }
    
    if (jumpsquat > 0)
    {
        sprite_index = spr_kris_plat_land;
        image_speed = 0.25;
        
        if (jumpsquat == 1)
            image_index = 0;
    }
    
    if (hurt)
    {
        if (grounded)
            sprite_index = spr_kris_plat_hurt_ground;
        else
            sprite_index = spr_kris_plat_hurt_air;
    }
    
    if (key_down && sprite_index == spr_kris_plat_idle)
        sprite_index = spr_kris_plat_crouch;
    
    if (run_zone)
        image_xscale = autorun_xscale;
}

if (_landingsound && sprite_index == spr_kris_plat_land)
    snd_play_pitch(snd_noise, 1.2);

if (jumphovering && fallen_in_pit == 0)
    gml_Script_scr_collision_failsafe();

if (state == 1)
    reached_target();

wind_jumpheight = false;

if (hspeed != 0)
    movement_direction = sign(hspeed);

if (windloop_sound != -4)
{
    snd_volume(windloop_sound, (abs(hspeed) / dashspeed) * 0.1, 0);
    snd_pitch(windloop_sound, lerp(2.5, 1.5, (y - _cameray) / _cameraheight));
}

if (windloop_sound != -4 && !dashing)
{
    snd_volume(windloop_sound, 0, 30);
    scr_script_delayed(snd_stop, 30, windloop_sound);
    windloop_sound = -4;
}

if (!grounded)
    time_since_ground++;
else
    time_since_ground = 0;

enum UnknownEnum
{
    Value_m2 = -2,
    Value_0 = 0
}
