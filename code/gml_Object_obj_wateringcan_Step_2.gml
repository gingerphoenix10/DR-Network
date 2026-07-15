var f = global.facing;
global.facing = facing;
var cutscene = false;
if (i_ex(1198))
{
    cutscene = obj_mainchara.cutscene;
}
event_inherited();
global.facing = f;
var watering = false;
if ((!held || cutscene) && waterduration > 0)
{
    show_reticle = false;
    engaged = false;
    for (var j = 0; j < (areasize * areasize); j++)
    {
        with (watersplashes[j])
        {
            visible = false;
        }
    }
    waterduration = 0;
    global.flag[7] = 0;
    with (1198)
    {
        scr_characterspr();
    }
    exit;
}
if (!held)
{
    show_reticle = false;
    if (mode == 1)
    {
        mode = 0;
        if (susie != -4)
        {
            susie.image_alpha = 1;
        }
        with (1198)
        {
            scr_characterspr();
        }
    }
    exit;
}
if (can_switch_to_susie)
{
    global.flag[7] = 1;
}
var true_engaged = waterduration > 2 && can_use;
if (true_engaged && (facing % 2) != 1)
{
    if (global.facing == 1 || global.facing == 3)
    {
        facing = global.facing;
    }
    if (facing == 0 || facing == 2)
    {
        facing = 1;
    }
}
if (mode == 1)
{
    with (1198)
    {
        if (ONLINE_DEBUG())
        {
            continue;
        }
        var spr = (other.facing == 1) ? 4916 : 6276;
        dsprite = spr;
        rsprite = spr;
        lsprite = spr;
        usprite = spr;
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
    }
}
else
{
    with (1198)
    {
        if (ONLINE_DEBUG())
        {
            continue;
        }
        other.dont_draw = true_engaged;
        if (true_engaged)
        {
            var spr = 362;
            if (!nopress)
            {
                spr = (other.facing == 1) ? other.right_walk_bow_sprite : other.left_walk_bow_sprite;
            }
            else
            {
                spr = (other.facing == 1) ? other.right_idle_sprite : other.left_idle_sprite;
                image_index = 1;
            }
            dsprite = spr;
            rsprite = spr;
            lsprite = spr;
            usprite = spr;
            swordmode = 99;
            fun = 0;
            reflection_offset = -24;
        }
        else
        {
            reflection_offset = -4;
            dsprite = 362;
            rsprite = 364;
            lsprite = 368;
            usprite = 367;
        }
        if (fun == 0)
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
        }
    }
}
depth = obj_mainchara.depth;
with (1559)
{
    if (name == "kris")
    {
        other.depth = depth;
    }
}
timer++;
var xxx = abs(sprite_width) * (-facing + 2);
var yy = -20;
reticle_bounds[0] = 9999;
reticle_bounds[1] = 9999;
reticle_bounds[2] = -9999;
reticle_bounds[3] = -9999;
var is_watering_ralsei = false;
var papa = id;
var list2 = ds_list_create();
var list3 = ds_list_create();
special_reticle_draw_function = -4;
special_reticle_draw_object = -4;
for (var j = 0; j < (areasize * areasize); j++)
{
    ds_list_clear(list2);
    ds_list_clear(list3);
    var jx = 40 * floor(j / areasize) * sign(image_xscale);
    var jy = 40 * (j % areasize);
    var baseoffset = -10 * image_xscale;
    if (tap_watering)
    {
        baseoffset = 15 * image_xscale;
    }
    var xoffset = ((baseoffset * (areasize - 1)) + jx) - (5 * image_xscale);
    var yoffset = (-20 * (areasize - 1)) + jy + 10;
    var wx = (floor((x + (-20 * (facing - 2)) + xxx + xoffset) / 40) * 40) + 20;
    var wy = (floor((y + 10 + yy + 60 + yoffset) / 40) * 40) + 20;
    watersplashes[j].x = wx;
    watersplashes[j].y = wy;
    can_cut = false;
    with (watersplashes[j])
    {
        visible = true_engaged && other.mode == 0;
        if (place_meeting(x, y, 1428))
        {
            visible = false;
        }
        if (visible)
        {
            scr_depth();
        }
        ds_list_clear(list2);
        with (1389)
        {
            if (name == "ralsei" && place_meeting(x, y, other))
            {
                is_watering_ralsei = true;
            }
        }
        var amount1 = instance_place_list(x, y, 265, list2, false);
        for (var i = 0; i < amount1; i++)
        {
            var elem = ds_list_find_value(list2, i);
            if (other.mode == 1)
            {
                continue;
            }
            var can_water = elem.get_waterable() && elem.object_index != 351;
            if (can_water)
            {
                var special = false;
                if (other.special_reticle_draw_function == -4)
                {
                    if (elem.object_index == 483)
                    {
                        with (elem)
                        {
                            var amount = instance_place_list(x, y, -3, list3, false);
                            if (amount > 0)
                            {
                                for (var n = 0; n < amount; n++)
                                {
                                    if (variable_instance_exists(ds_list_find_value(list3, n).id, "can_water"))
                                    {
                                        if (ds_list_find_value(list3, n).can_water())
                                        {
                                            papa.special_reticle_draw_object = ds_list_find_value(list3, n).id;
                                        }
                                        papa.special_reticle_draw_function = ds_list_find_value(list3, n).draw_watering_reticle;
                                    }
                                }
                            }
                        }
                    }
                    other.reticle_bounds[0] = min(other.reticle_bounds[0], bbox_left);
                    other.reticle_bounds[1] = min(other.reticle_bounds[1], bbox_top);
                    other.reticle_bounds[2] = max(other.reticle_bounds[2], bbox_right);
                    other.reticle_bounds[3] = max(other.reticle_bounds[3], bbox_bottom);
                }
                other.show_reticle++;
                watering = true;
            }
            if (true_engaged)
            {
                ds_list_find_value(list2, i).water(false);
                other.show_reticle = false;
            }
        }
    }
}
ds_list_destroy(list2);
ds_list_destroy(list3);
if (!watering)
{
    show_reticle = 0;
}
if (!true_engaged)
{
    if (global.facing == 1 || global.facing == 3)
    {
        facing = global.facing;
    }
    if (facing == 0 || facing == 2)
    {
        facing = 1;
    }
    for (var j = 0; j < (areasize * areasize); j++)
    {
        with (watersplashes[j])
        {
            visible = false;
        }
    }
}
if (!true_engaged)
{
    is_watering_ralsei = false;
}
with (1198)
{
    if (!(press_d == 0 && press_l == 0 && press_u == 0 && press_r == 0))
    {
        is_watering_ralsei = false;
        with (other.flowermarker)
        {
            instance_destroy();
        }
    }
}
if (is_watering_ralsei)
{
    ralsei_watering_timer++;
    if (ralsei_watering_timer == 150 && !instance_exists(flowermarker))
    {
        with (1389)
        {
            if (name == "ralsei")
            {
                facing[target] = 0;
                other.flowermarker = instance_create(x, y - 6 - (12 * global.flag[1311]), 1238);
                with (other.flowermarker)
                {
                    sprite_index = 4566;
                    scr_darksize();
                    depth = other.depth - 1;
                    image_speed = 0;
                    scr_lerpvar("image_index", 0, 6, 12);
                    snd_play(684, 1, 1.1);
                }
            }
        }
    }
}
else
{
    ralsei_watering_timer = 0;
}
if (held && show_reticle && obj_mainchara.visible && !obj_mainchara.cutscene)
{
    for (var i = 0; i < 4; i++)
    {
        reticle_bounds[i] = floor(reticle_bounds[i] / 40) * 40;
        if (i >= 2)
        {
            reticle_bounds[i] += 40;
        }
    }
}
with (reticle_draw_marker)
{
    if (other.special_reticle_draw_function)
    {
        if (instance_exists(other.special_reticle_draw_object))
        {
            depth = other.special_reticle_draw_object.depth + 20;
        }
        else
        {
            depth = other.depth;
        }
    }
    else
    {
        depth = other.depth;
    }
}
with (1198)
{
    disable_interaction_checks = instance_exists(other.special_reticle_draw_object);
}
