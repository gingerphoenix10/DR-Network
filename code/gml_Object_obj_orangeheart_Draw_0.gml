siner++;
var camspeed = 0;
with (743)
{
    camspeed = min((fakecamxspeedbase * 0.25) + (fakecamxspeedadditional * 2), 0);
}
if (!hitstop)
{
    for (var a = 9; a > 0; a--)
    {
        prev_coord[a] = [prev_coord[a - 1][0] + camspeed, prev_coord[a - 1][1]];
    }
    prev_coord[0] = [x + camspeed, y - height];
}
if (height_val != -3.141592653589793)
{
    height_val = scr_approach(height_val, pi, pi / height_frames);
    if (height_val == pi)
    {
        height_val = -3.141592653589793;
        height_frames += floor((37 - height_frames) * 0.5);
        with (743)
        {
            fakecamxspeedadditional = 0;
        }
        chargecon = 3;
        snd_play(60, 0.5);
        repeat (5 + irandom(5))
        {
            with (instance_create_depth(x + 20 + random_range(-48, 0), y + 20 + random_range(-12, 12), depth - 1, 1013))
            {
                sprite_index = 3350;
                image_blend = merge_color(16776960, 16711680, 0.5);
                direction = 45 + random_range(-20, 20);
                speed = 16 + random(12);
                gravity_direction = 270;
                gravity = 0.5 + random(0.5);
                acceleration_type = 1;
                shrink_rate = 0.05 + random(0.05);
                acceleration_rate = 0.9 - random(0.1);
                orangeheartControlled = true;
            }
        }
        for (var a = 0; a < 2; a++)
        {
            with (instance_create(x + 20, y + 20, 1238))
            {
                orangeheartControlled = true;
                sprite_index = 3738;
                image_index = 0;
                image_speed = 0;
                image_blend = merge_color(16776960, 16711680, 0.5);
                image_xscale = 0;
                image_yscale = 0;
                image_speed = 0;
                scr_lerpvar("image_xscale", 0, 2 + (a * 2), 16);
                scr_lerpvar("image_yscale", 0, 2 + (a * 2), 16);
                scr_lerpvar("image_alpha", 1, 0, 16);
                scr_doom(id, 16);
            }
        }
    }
}
height = sin(height_val) * 105;
if (height > 0)
{
    draw_sprite_ext(7723, 0, x + 10, y + 10, 3 - (sin(height_val) * 1), 1.5 - (sin(height_val) * 0.5), 0, 2110297, 1);
}
draw_battle_players(true);
if (drawafterimages)
{
    for (var a = 9; a >= 0; a--)
    {
        if (a > 0)
        {
            if (!(abs(prev_coord[a][0] - prev_coord[a - 1][0]) < 1))
            {
                draw_sprite_ext(sprite_index, image_index, prev_coord[a][0], prev_coord[a][1], image_xscale, image_yscale, image_angle, image_blend, 0.55 - (a * 0.05));
            }
        }
        else
        {
            draw_sprite_ext(sprite_index, image_index, prev_coord[a][0], prev_coord[a][1], image_xscale, image_yscale, image_angle, image_blend, 0.55 - (a * 0.05));
        }
    }
}
if (dashstate == 1 && chargetimer < 16)
{
    var z_charge = (chargetimer * 2) % 35;
    for (var i = 0; i < 4; i += 1)
    {
        var alf = (chargetimer / 10) - 0.2;
        var rotx = (i * 90) + (z_charge * 5);
        var xx = sin(degtorad(rotx)) * (35 - z_charge);
        var yy = cos(degtorad(rotx)) * (35 - z_charge);
        draw_sprite_ext(3492, 0, (x + 9) - xx, (y + 10) - yy - height, 4 - ((z_charge * 2) / 35), 4 - ((z_charge * 2) / 35), 0, 16777215, 0.25 + (alf * 0.75));
    }
}
if (shakeheart)
{
    shakeheart--;
}
var controller = -1;
with (743)
{
    controller = id;
}
var chs = choose(-1, 0, 1);
var chs2 = choose(-1, 0, 1);
if (height == 0)
{
    _angle = 0;
}
else
{
    _angle = 30 - (sin(height_val * 0.5) * 60);
}
var _angle = 0;
if (sprite_index == 5949)
{
    draw_sprite_ext(4397, 0, (x - 10) + (chs * sign(shakeheart)) + 10, ((y - 10) + (chs2 * sign(shakeheart)) + 10) - height, image_xscale, image_yscale, _angle, image_blend, image_alpha);
    if (chargecon != 5)
    {
        if (controller.fakecamxspeedadditional < 0)
        {
            draw_sprite_part_ext(4397, 1, 0, 0, min(20, abs(controller.fakecamxspeedadditional * 1.11)), 20, x, y - height, image_xscale, image_yscale, merge_color(65535, 4235519, 0.5), 1);
        }
        else if (controller.fakecamxspeedadditional > 0)
        {
            draw_sprite_part_ext(4397, 1, 0, 0, min(20, abs(chargetimer * 1.25)), 20, x, y - height, image_xscale, image_yscale, merge_color(65535, 4235519, 0.5), 1);
        }
    }
    else
    {
        draw_sprite_part_ext(4397, 1, 0, 0, cos(height_val * 0.5) * 20, 20, x, y - height, image_xscale, image_yscale, merge_color(65535, 4235519, 0.5), 1);
    }
}
if (!obj_debug_orangeheartcontroller.scrolling)
{
    draw_sprite_ext(sprite_index, image_index, x + (chs * sign(shakeheart)) + 10, (y + (chs2 * sign(shakeheart)) + 10) - height, image_xscale, image_yscale, _angle, image_blend, image_alpha);
}
else
{
    draw_sprite_ext(sprite_index, image_index, x + (chs * sign(shakeheart)), (y + (chs2 * sign(shakeheart))) - height, image_xscale, image_yscale, _angle, image_blend, image_alpha);
}
if (dashstate == 1 && chargetimer == 16)
{
    glowtimer += 0.5;
    draw_sprite_ext(4397, 1, x, y - height, image_xscale, image_yscale, _angle, 16777215, 0.5 + (sin(glowtimer) * 0.5));
}
if (dashstate == 2)
{
    if (chargecon != 5)
    {
        draw_sprite_ext(1954, global.time, x - 2, y - height, (image_xscale * 1.25) - (0.45 + (sin(global.time * 1.5) * 0.2)), image_yscale, _angle, image_blend, 0.45 + (sin(global.time * 1.5) * 0.2));
    }
    gpu_set_fog(true, 65535, 0, 0);
    if (chargecon != 5)
    {
        draw_sprite_ext(1954, global.time, x - 2, y - height, (image_xscale * 1.25) - (0.225 + (sin(global.time * 1.5) * 0.1)), image_yscale, _angle, image_blend, 0.225 + (sin(global.time * 1.5) * 0.1));
    }
    draw_sprite_ext(5949, 0, x, y - height, image_xscale, image_yscale, _angle, 16777215, 0.45 + (sin(global.time * 1.5) * 0.2));
    gpu_set_fog(false, 16777215, 0, 0);
}
if (chargetimer > 0)
{
}
