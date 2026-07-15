target = -4;
stop = 0;
lerptime_v = 15;
lerptime_h = 15;
lerptimemax = 15;

reset_all_lerps = function()
{
    lerptime_h = 0;
    lerptime_v = 0;
    lerptimemax = 15;
};

zone_lerpstrength = 1;
zone = -4;
nudgex = 0;
nudgey = 0;
lerpinit = 0;
nudgerate = 999;
last_ideal_y = 0;
last_ideal_y_real = 0;
y_stick = 1;
y_stick_lerp = 1;
wants_ideal_y = false;
shakex = 0;
shakey = 0;
just_started = true;
oldgoalx = -999;
oldgoaly = -999;
cutscene = false;
min_x = -1;
max_x = -1;
scroll_mode = false;
autoscroll_Speed = 3.46;
extra_targets = [];
markers = [];
extra_target_lerp = 1;

add_extra_target = function(arg0)
{
    extra_target_lerp = 0;
    if (is_array(arg0))
    {
        for (var i = 0; i < array_length(arg0); i++)
        {
            array_push(extra_targets, arg0[i]);
        }
    }
    else
    {
        array_push(extra_targets, arg0);
    }
};

remove_extra_target = function(arg0)
{
    if (is_array(arg0))
    {
        for (var j = 0; j < array_length(arg0); j++)
        {
            for (var i = 0; i < array_length(extra_targets); i++)
            {
                if (arg0[j].id == extra_targets[i].id)
                {
                    remove_extra_target_idx(i, false);
                    break;
                }
            }
        }
    }
    else
    {
        for (var i = 0; i < array_length(extra_targets); i++)
        {
            if (arg0.id == extra_targets[i].id)
            {
                remove_extra_target_idx(i);
                break;
            }
        }
    }
};

remove_extra_target_idx = function(arg0)
{
    extra_target_lerp = 0;
    array_delete(extra_targets, arg0, 1);
};

clear_extra_targets = function()
{
    extra_target_lerp = 0;
    extra_targets = [];
};

xoffset = 0;
yoffset = 0;

update_camera = function()
{
    var scroll_x;
    if (cutscene)
    {
        if (global.pause_plat)
        {
            exit;
        }
    }
    else
    {
        scroll_x = x;
        var regularCam = !IsPVP() || !variable_global_exists("pvpeliminated") || !global.pvpeliminated;
        if (!instance_exists(target) && instance_exists(910) && regularCam)
        {
            target = instance_find(910, 0);
        }
        else if (!regularCam)
        {
            if (instance_number(obj_charafake) <= 0)
            {
                exit;
            }
            if (global.spectating >= instance_number(obj_charafake))
            {
                global.spectating = 0;
            }
            if (global.spectating < 0)
            {
                global.spectating = instance_number(obj_charafake) - 1;
            }
            var spectateTarget = instance_find(obj_charafake, global.spectating);
            var startIndex = global.spectating;
            while (spectateTarget.you || spectateTarget.roomin != room || spectateTarget.eliminated)
            {
                global.spectating = (global.spectating + 1) % instance_number(obj_charafake);
                spectateTarget = instance_find(obj_charafake, global.spectating);
                if (global.spectating == startIndex)
                {
                    spectateTarget = instance_find(1767, 0);
                    break;
                }
            }
            if (target != spectateTarget)
            {
                target = spectateTarget;
            }
        }
        lerptime_h = lerptimemax;
        lerptime_v = lerptimemax;
        camera_set_view_target(view_camera[0], self);
        camera_set_view_border(view_camera[0], 640, 480);
        if (instance_exists(target))
        {
            if (target.visible == 0)
            {
                xoffset = 0;
                yoffset = 0;
                with (373)
                {
                    if (visible == 1 && name == "kris")
                    {
                        other.target = self;
                        if (variable_instance_exists(id, "create_x_diff"))
                        {
                            other.xoffset = create_x_diff;
                            other.yoffset = create_y_diff;
                        }
                        break;
                    }
                }
                with (910)
                {
                    if (visible == 1)
                    {
                        other.target = self;
                        break;
                    }
                }
            }
            if (target.object_index == 910)
            {
                xoffset = 0;
                yoffset = 0;
            }
            var tx = x;
            var ty = y;
            if (global.pause_plat)
            {
                exit;
            }
            lerptime_h = min(lerptime_h + zone_lerpstrength, lerptimemax);
            lerptime_v = min(lerptime_v + zone_lerpstrength, lerptimemax);
            extra_target_lerp = min(extra_target_lerp + 0.05, 1);
            tx = target.x + xoffset;
            ty = target.y + yoffset;
            with (910)
            {
                if (grounded)
                {
                    if (place_meeting(x, y, 272))
                    {
                        other.wants_ideal_y = 1;
                        other.y_stick = 2;
                        other.y_stick_lerp = 1;
                    }
                    else
                    {
                        other.wants_ideal_y = scr_approach(other.wants_ideal_y, 0, 0.05);
                    }
                }
                else if (other.wants_ideal_y < 1)
                {
                    other.wants_ideal_y = scr_approach(other.wants_ideal_y, 0, 0.05);
                }
            }
            if (array_get(scr_platswap_yscale(), 0) != 1 || !lerpinit)
            {
                last_ideal_y_real = target.y;
                lerpinit = true;
                last_ideal_y = target.y;
                y_stick = 2;
                y_stick_lerp = 1;
            }
            if (wants_ideal_y > 0)
            {
                if (variable_instance_get(target.id, "grounded"))
                {
                    last_ideal_y_real = target.y;
                    if (y_stick != 2)
                    {
                        y_stick_lerp = 0;
                        y_stick = 2;
                    }
                }
                else if (y_stick == 1)
                {
                    last_ideal_y_real = target.y;
                }
                else
                {
                    y_stick = 0;
                    if (last_ideal_y < (target.y - 20) || last_ideal_y > (target.y + 160))
                    {
                        y_stick = 1;
                        y_stick_lerp = 0;
                        last_ideal_y_real = target.y;
                    }
                    if (variable_instance_get(target.id, "jump_boost"))
                    {
                        y_stick = 1;
                        y_stick_lerp = 0;
                        last_ideal_y_real = target.y;
                    }
                }
                last_ideal_y = lerp(last_ideal_y, last_ideal_y_real, ease_inout_quad(min(y_stick_lerp, 1), 0, 1, 1));
                y_stick_lerp += 0.07;
                ty = lerp(ty, last_ideal_y, wants_ideal_y);
            }
            var num = 1;
            var len = array_length(extra_targets);
            for (i = 0; i < len; i++)
            {
                with (extra_targets[i])
                {
                    if (!variable_instance_exists(id, "___camtarget"))
                    {
                        ___camtarget = instance_create(x, y, 1238);
                        ___camtarget.lerp = 0;
                        ___camtarget.target = id;
                        array_push(other.markers, ___camtarget);
                    }
                }
            }
            len = array_length(markers);
            var i = len - 1;
            for (; i >= 0; i--)
            {
                var m = markers[i];
                if (instance_exists(m.target))
                {
                    m.lerp = scr_approach(m.lerp, 1, 0.05);
                    x = m.target.bbox_left + (0.5 * (m.target.bbox_right - m.target.bbox_left));
                    y = m.target.bbox_top + (0.5 * (m.target.bbox_bottom - m.target.bbox_top));
                }
                else
                {
                    m.lerp = scr_approach(m.lerp, 0, 0.05);
                    if (m.lerp <= 0)
                    {
                        array_delete(markers, i, 1);
                        instance_destroy(m);
                        continue;
                    }
                }
                var falloff = clamp01(((300 - point_distance(target.x, target.y, m.x, m.y)) + 100) / 300) * 0.75;
                falloff *= (ease_inout_sine(m.lerp, 0, 1, 1) * extra_target_lerp);
                tx += (m.x * falloff);
                ty += (m.y * falloff);
                num += falloff;
            }
            tx /= num;
            ty /= num;
            var _goalx = tx + nudgex;
            var _goaly = ty + nudgey;
            if (global.pause_plat)
            {
                _goalx = tx;
                _goaly = ty;
            }
            with (target)
            {
                var _zone = instance_place(x, y, 1350);
                if (i_ex(_zone))
                {
                    var roomw = room_width;
                    var roomh = room_height;
                    var vieww = view_wport[0];
                    var viewh = view_hport[0];
                    var lclamp = 0;
                    var rclamp = roomw - vieww;
                    var uclamp = 0;
                    var dclamp = roomh - viewh;
                    if (_zone.xmin != -4)
                    {
                        lclamp = _zone.xmin;
                    }
                    if (_zone.xmax != -4)
                    {
                        rclamp = _zone.xmax;
                    }
                    if (_zone.ymin != -4)
                    {
                        uclamp = _zone.ymin;
                    }
                    if (_zone.ymax != -4)
                    {
                        dclamp = _zone.ymax;
                    }
                    if (_zone.mode != "Constant" && _zone.gradual_extflag != "")
                    {
                        with (1350)
                        {
                            if (extflag == _zone.gradual_extflag)
                            {
                                var zonelerp = 0;
                                var xx = other.x;
                                var yy = other.y;
                                if (_zone.mode == "Gradual - Left")
                                {
                                    zonelerp = 1 - inverselerp(_zone.bbox_left, _zone.bbox_right, xx);
                                }
                                else if (_zone.mode == "Gradual - Up")
                                {
                                    zonelerp = 1 - inverselerp(_zone.bbox_top, _zone.bbox_bottom, yy);
                                }
                                else if (_zone.mode == "Gradual - Right")
                                {
                                    zonelerp = inverselerp(_zone.bbox_left, _zone.bbox_right, xx);
                                }
                                else if (_zone.mode == "Gradual - Down")
                                {
                                    zonelerp = inverselerp(_zone.bbox_top, _zone.bbox_bottom, yy);
                                }
                                zonelerp = clamp01(zonelerp);
                                if (_zone.xmin != -4 && xmin != -4)
                                {
                                    lclamp = lerp(_zone.xmin, xmin, zonelerp);
                                }
                                if (_zone.xmax != -4 && xmax != -4)
                                {
                                    rclamp = lerp(_zone.xmax, xmax, zonelerp);
                                }
                                if (_zone.ymin != -4 && ymin != -4)
                                {
                                    uclamp = lerp(_zone.ymin, ymin, zonelerp);
                                }
                                if (_zone.ymax != -4 && ymax != -4)
                                {
                                    dclamp = lerp(_zone.ymax, ymax, zonelerp);
                                }
                                break;
                            }
                        }
                    }
                    var owclamp_l = 320;
                    var owclamp_r = room_width - 320;
                    var owclamp_t = 240;
                    var owclamp_b = room_height - 240;
                    var ys = array_get(scr_platswap_yscale(), 0);
                    if (ys < 1)
                    {
                        with (171)
                        {
                            if (scr_onscreen(self))
                            {
                                with (instance_place(x, y, 43))
                                {
                                    if (xmin != -4)
                                    {
                                        owclamp_l = xmin + 320;
                                    }
                                    if (xmax != -4)
                                    {
                                        owclamp_r = xmax + 320;
                                    }
                                    if (ymin != -4)
                                    {
                                        owclamp_t = ymin + 240;
                                    }
                                    if (ymax != -4)
                                    {
                                        owclamp_b = ymax + 240;
                                    }
                                }
                            }
                        }
                    }
                    _goalx = lerp(clamp(_goalx, owclamp_l, owclamp_r), clamp(_goalx, lclamp + 320, rclamp + 320), ys);
                    _goaly = lerp(clamp(_goaly, owclamp_t, owclamp_b), clamp(_goaly, uclamp + 240, dclamp + 240), ys);
                    if (_zone.lerpstrength < 0)
                    {
                        other.zone_lerpstrength = 1;
                    }
                    else
                    {
                        other.zone_lerpstrength = _zone.lerpstrength;
                    }
                }
                with (other)
                {
                    if (zone != _zone)
                    {
                        zone = _zone;
                        if (oldgoalx != (_goalx - target.x - nudgex))
                        {
                            if (!just_started)
                            {
                                lerptime_h = 0;
                            }
                        }
                        if (oldgoaly != (_goaly - target.y - nudgey))
                        {
                            if (!just_started)
                            {
                                lerptime_v = 0;
                            }
                        }
                    }
                    oldgoalx = _goalx - target.x - nudgex;
                    oldgoaly = _goaly - target.y - nudgey;
                }
                _zone = instance_place(x, y, 866);
                var _rate = 8;
                if (i_ex(_zone))
                {
                    _rate = _zone.nudgerate;
                    if (other.nudgerate == 999)
                    {
                        _rate = 999;
                        other.nudgerate = 8;
                    }
                    var nx = _zone.nudgex;
                    var ny = _zone.nudgey;
                    if (_zone.mode == "Gradual - Left")
                    {
                        nx = lerp(0, nx, 1 - clamp01((x - _zone.bbox_left) / (_zone.bbox_right - _zone.bbox_left)));
                        ny = lerp(0, ny, 1 - clamp01((x - _zone.bbox_left) / (_zone.bbox_right - _zone.bbox_left)));
                    }
                    if (_zone.mode == "Gradual - Right")
                    {
                        nx = lerp(0, nx, clamp01((x - _zone.bbox_left) / (_zone.bbox_right - _zone.bbox_left)));
                        ny = lerp(0, ny, clamp01((x - _zone.bbox_left) / (_zone.bbox_right - _zone.bbox_left)));
                    }
                    if (_zone.mode == "Gradual - Up")
                    {
                        nx = lerp(0, nx, 1 - clamp01((y - _zone.bbox_top) / (_zone.bbox_bottom - _zone.bbox_top)));
                        ny = lerp(0, ny, 1 - clamp01((y - _zone.bbox_top) / (_zone.bbox_bottom - _zone.bbox_top)));
                    }
                    if (_zone.mode == "Gradual - Down")
                    {
                        nx = lerp(0, nx, clamp01((y - _zone.bbox_top) / (_zone.bbox_bottom - _zone.bbox_top)));
                        ny = lerp(0, ny, clamp01((y - _zone.bbox_top) / (_zone.bbox_bottom - _zone.bbox_top)));
                    }
                    other.nudgex = scr_approach(other.nudgex, nx, _rate);
                    other.nudgey = scr_approach(other.nudgey, ny, _rate);
                }
                else
                {
                    if (other.nudgerate == 999)
                    {
                        _rate = 999;
                        other.nudgerate = 8;
                    }
                    other.nudgex = scr_approach(other.nudgex, 0, _rate);
                    other.nudgey = scr_approach(other.nudgey, 0, _rate);
                }
            }
            x = lerp(x, _goalx, lerptime_h / lerptimemax);
            y = lerp(y, _goaly, lerptime_v / lerptimemax);
        }
        else if (i_ex(1198))
        {
            obj_mainchara.nudgex = nudgex;
            obj_mainchara.nudgey = nudgey;
            instance_destroy();
        }
    }
    if (min_x != -1)
    {
        x = max(x, min_x);
    }
    if (max_x != -1)
    {
        x = min(x, max_x);
    }
    just_started = false;
    x = clamp(x, 320, room_width - 320);
    y = clamp(y, 240, room_height - 240);
    if (instance_exists(910))
    {
        if (obj_plat_player.fallen_in_pit && scroll_mode)
        {
            scroll_mode = false;
        }
    }
    if (scroll_mode && !global.pause_plat)
    {
        x = scroll_x + autoscroll_Speed;
    }
    x += floor(shakex * 0.5);
    y += floor(shakey * 0.5);
    shakex = scr_approach(-shakex, 0, 1);
    shakey = scr_approach(-shakey, 0, 1);
    x = ceil(x);
    y = ceil(y);
};
