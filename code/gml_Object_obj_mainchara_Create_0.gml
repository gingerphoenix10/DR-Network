onlineinit();
onlinekeys();
scr_depth();
global.currentroom = room;
scr_initialize_charnames();
reflection_offset = -4;
battle_menu_block = true;
is_using_held_item = false;
autorun = 0;
bg = 0;
if (instance_exists(1302))
{
    bg = 1;
}
stepping = 0;
stepped = 0;
drawbattlemode = 1;
battlemode = 0;
battleheart = instance_create(x, y, 1367);
battleheart.image_alpha = 0;
battleheart.image_speed = 0;
battlealpha = 0;
becamebattle = 0;
sliding = 0;
becamesword = 0;
swordmode = 0;
swordcon = 0;
swordtimer = 0;
stop_movement = 0;
roomenterfreezeend = 0;
climbing = 0;
climbbuffer = 0;
floorheight = 0;
darkmode = global.darkzone;
if (darkmode == 1)
{
    stepping = 1;
    image_xscale = 2;
    image_yscale = 2;
}
if (string_pos("room_truelab", room_get_name(room)) != 0)
{
    image_blend = merge_color(8421504, 16777215, 0.3);
}
cutscene = 0;
press_l = 0;
press_r = 0;
press_d = 0;
press_u = 0;
px = 0;
py = 0;
wallcheck = 0;
wspeed = 3;
bwspeed = 3;
global.sendstate = 0;
if (darkmode == 1)
{
    bwspeed = 4;
    wspeed = 4;
}
run = 0;
runtimer = 0;
runcounter = 0;
drawdebug = 0;
ignoredepth = 0;
freeze = 0;
holding_item = -4;
disable_interaction_checks = false;
subxspeed = 0;
subyspeed = 0;
subx = 0;
suby = 0;
walk = 0;
walkanim = 0;
walkbuffer = 0;
walktimer = 0;
image_speed = 0;
emote = -4;
emote_speed = 1;
scr_characterspr();

set_facing = function()
{
    if (global.facing == 0)
    {
        sprite_index = dsprite;
    }
    if (global.facing == 1)
    {
        sprite_index = rsprite;
    }
    if (global.facing == 2)
    {
        sprite_index = usprite;
    }
    if (global.facing == 3)
    {
        sprite_index = lsprite;
    }
};

swordfacing = 1;
swordsprite = rsprite;
fun = 0;
if (global.facing == 0)
{
    sprite_index = dsprite;
}
if (global.facing == 1)
{
    sprite_index = rsprite;
}
if (global.facing == 2)
{
    sprite_index = usprite;
}
if (global.facing == 3)
{
    sprite_index = lsprite;
}
_weird_mode = scr_sideb_active() && global.plot < 105;
_weird_mode_xx = x;
_weird_mode_yy = y;
_weird_mode_shake = false;
_weird_mode_shake_timer = 0;
_weird_mode_shakeamt = 3;
_weird_mode_shakereduct = 0.8;
_weird_mode_on = 1;
_silo_mode = scr_sideb_active() && room == 21;
if (_silo_mode)
{
    dsprite = 232;
    rsprite = 8262;
    usprite = 1646;
    lsprite = 4221;
    set_facing();
}
onebuffer = 0;
twobuffer = 0;
threebuffer = 0;
climb_with_caterpillars = false;
global.menuno = 0;
for (i = 0; i < 10; i += 1)
{
    global.menucoord[i] = 0;
}
cameFromEntrance = global.entrance;
global.flag[1360] = -1;
if (global.interact == 7)
{
    var found = 0;
    with (969)
    {
        if (found == 0)
        {
            if (image_index == global.entrance)
            {
                found = 1;
                with (instance_create(x + 20, y + 20, 1164))
                {
                    var roomw = room_width;
                    var roomh = room_height;
                    var vieww = view_wport[0];
                    var viewh = view_hport[0];
                    var camx = clamp(x - floor(vieww / 2), 0, roomw - vieww);
                    var camy = clamp(y - floor(viewh / 2), 0, roomh - viewh);
                    var lclamp = 0;
                    var rclamp = roomw - vieww;
                    var uclamp = 0;
                    var dclamp = roomh - viewh;
                    camx = clamp(camx, lclamp, rclamp);
                    camy = clamp(camy, uclamp, dclamp);
                    camerax_set(camx);
                    cameray_set(camy);
                    startofroom = true;
                }
                global.interact = 0;
            }
        }
    }
    if (found)
    {
        visible = false;
        freeze = true;
        cutscene = true;
    }
}
used_vertical_transition = false;
doorcooldown = 0;
if (global.start_in_platmode != 0)
{
    doorcooldown = 2;
}
if (global.interact == 3)
{
    noentrancefound = 0;
    if (global.entrance > 0)
    {
        if (global.flag[21] <= 0)
        {
            global.interact = 0;
            global.flag[21] = -10;
            roomenterfreezeend = 1;
        }
        switch (global.entrance)
        {
            case 1:
                if (i_ex(1273))
                {
                    setxy(obj_markerA.x, obj_markerA.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 2:
                if (i_ex(1274))
                {
                    setxy(obj_markerB.x, obj_markerB.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 3:
                if (i_ex(1277))
                {
                    setxy(obj_markerC.x, obj_markerC.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 4:
                if (i_ex(1278))
                {
                    setxy(obj_markerD.x, obj_markerD.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 5:
                if (i_ex(1279))
                {
                    setxy(obj_markerE.x, obj_markerE.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 6:
                if (i_ex(1280))
                {
                    setxy(obj_markerF.x, obj_markerF.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 18:
                if (i_ex(1281))
                {
                    setxy(obj_markerr.x, obj_markerr.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 19:
                if (i_ex(1282))
                {
                    setxy(obj_markers.x, obj_markers.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 20:
                if (i_ex(1284))
                {
                    setxy(obj_markert.x, obj_markert.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 21:
                if (i_ex(1285))
                {
                    setxy(obj_markeru.x, obj_markeru.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 22:
                if (i_ex(1287))
                {
                    setxy(obj_markerv.x, obj_markerv.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 23:
                if (i_ex(1288))
                {
                    setxy(obj_markerw.x, obj_markerw.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            case 24:
                if (i_ex(1289))
                {
                    setxy(obj_markerX.x, obj_markerX.y);
                }
                else
                {
                    noentrancefound = 1;
                }
                break;
            default:
                noentrancefound = 1;
        }
        if (noentrancefound == 1)
        {
            if (i_ex(1253))
            {
                with (1253)
                {
                    if (image_index == global.entrance)
                    {
                        other.x = x;
                        other.y = y;
                        if (variable_global_exists("marker_lerpX") && variable_global_exists("marker_lerpY"))
                        {
                            if (global.marker_lerpX != -4)
                            {
                                other.x = lerp(bbox_left, bbox_right, global.marker_lerpX);
                                global.marker_lerpX = -4;
                                other.used_vertical_transition = true;
                            }
                            if (global.marker_lerpY != -4)
                            {
                                other.y = lerp(bbox_top, bbox_bottom, global.marker_lerpY);
                                global.marker_lerpY = -4;
                            }
                        }
                    }
                }
            }
            else
            {
                setxy(room_width / 2, room_height / 2);
                debug_message("entrance not found, setting to center of room");
                debug_message("entrance requested was global.entrance=" + string(global.entrance));
            }
        }
    }
}
if (global.targetdoor != -4)
{
    if (i_ex(global.targetdoor))
    {
        setxy(global.targetdoor.x, global.targetdoor.y);
    }
    global.targetdoor = -4;
}
if (global.entrance_animation > 0)
{
    instance_create(0, 0, 485);
}
initwd = sprite_width;
initht = sprite_height;
mywidth = sprite_width;
myheight = sprite_height;
interactedobject = -4;
for (i = 0; i < 3; i += 1)
{
    global.battledf[i] = global.df[global.char[i]] + global.itemdf[global.char[i]][0] + global.itemdf[global.char[i]][1] + global.itemdf[global.char[i]][2];
}
if (global.chapter == 2)
{
    if (global.flag[302] == 1)
    {
        instance_create(x, y, 1188);
    }
}

function check_heightfloor(arg0, arg1, arg2)
{
    var __onfloor = 0;
    var __inst = instance_position(bbox_right + arg0, bbox_top + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
        {
            __onfloor++;
        }
    }
    __inst = instance_position(bbox_right + arg0, bbox_bottom + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
        {
            __onfloor++;
        }
    }
    __inst = instance_position(bbox_left + arg0, bbox_top + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
        {
            __onfloor++;
        }
    }
    __inst = instance_position(bbox_left + arg0, bbox_bottom + arg1, arg2);
    if (__inst != -4)
    {
        if (__inst.floorheight == floorheight)
        {
            __onfloor++;
        }
    }
    if (__onfloor == 4)
    {
        __onfloor = 1;
    }
    else
    {
        __onfloor = 0;
    }
    return __onfloor;
}

nudgex = 0;
nudgey = 0;
nudgelerp = 0.1;
if (global.flag[1332] > 0)
{
    var f = global.flag[1332];
    global.flag[1332] = 0;
    if (f == 1 || f == 2)
    {
        var wateringcan = instance_create(x, y, 1008);
        wateringcan.held = true;
        wateringcan.mode = f - 1;
        with (wateringcan)
        {
            scr_darksize();
        }
        holding_item = wateringcan;
    }
    if (f == 3)
    {
        var pinwheel = instance_create(x, y, 1052);
        pinwheel.held = true;
        with (pinwheel)
        {
            scr_darksize();
        }
        holding_item = pinwheel;
    }
}
noclip = false;
if (scr_debug())
{
    if (layer_exists("OBJECTS_MAIN"))
    {
        if (!layer_get_visible("OBJECTS_MAIN"))
        {
            scr_debug_print("OBJECTS_MAIN layer is disabled! See console.");
            show_debug_message_concat("OBJECTS_MAIN layer is disabled in room: ", room_get_name(room), "    Turn on before you save!");
            layer_set_visible("OBJECTS_MAIN", true);
        }
    }
}

_shadowdraw_func = function()
{
    if (_weird_mode_shake && _weird_mode)
    {
        draw_sprite(sprite_index, image_index, floor(x + (_weird_mode_shakeamt * _weird_mode_on)), y);
    }
    else
    {
        draw_self();
    }
};

selfshadow_override = false;
if (global.returningFromPVP)
{
    x = global.pvpmemo[1];
    y = global.pvpmemo[2];
    global.returningFromPVP = false;
}
