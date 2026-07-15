if (init == 0)
{
    init = 1;
}
event_inherited();
if (caterpillartarget == -4)
{
    depth = 31000;
}
else
{
    scr_depth();
}
if (con == 0)
{
    sprite_index = climbsprite;
    image_index = climbindex;
    if (reachcon >= 10)
    {
        con = 4;
        exit;
    }
    if (reachcon > 0)
    {
        con = 3;
        exit;
    }
    var _dir = dir;
    if (followmode == 1)
    {
        if (i_ex(1164))
        {
            if (obj_climb_kris.y < y)
            {
                climb_direction = 1;
            }
            else
            {
                climb_direction = -1;
            }
            _dir = -1;
            if ((obj_climb_kris.y - y) > 80 || (obj_climb_kris.y - y) < -20)
            {
                if (dir >= 0)
                {
                    con = 1;
                    climbcon = -startdelay;
                }
            }
        }
    }
    if (followmode == 2)
    {
        _dir = -1;
        if (i_ex(1164))
        {
            if (obj_climb_kris.climbcon == 2 && obj_climb_kris.climbtimer >= 1)
            {
                con = 1;
                dir = obj_climb_kris.dir_memory;
                climbcon = 0;
                if (obj_climb_kris.jumping)
                {
                    con = 2;
                }
            }
        }
    }
    if (followmode == 3)
    {
        _dir = -1;
        if (array_length(instruction_queue) > 0)
        {
            var next_instruction = instruction_queue[0];
            if (((current_time / 30) - startdelay) > next_instruction[2])
            {
                array_delete(instruction_queue, 0, 1);
                con = 1;
                climbcon = 0;
                if (next_instruction[1] < 0)
                {
                    dir = 2;
                }
                if (next_instruction[1] > 0)
                {
                    dir = 0;
                }
                if (next_instruction[0] > 0)
                {
                    dir = 1;
                }
                if (next_instruction[0] < 0)
                {
                    dir = 3;
                }
                if (next_instruction[3])
                {
                    con = 2;
                    xclimb = next_instruction[0];
                    yclimb = next_instruction[1];
                }
            }
        }
        if (con == 0)
        {
            climbmomentum *= 0.5;
        }
    }
    if (waiteventid > 0)
    {
        exit;
    }
    if (caterpillartarget != -4)
    {
        dir = -1;
        var evade = false;
        var yy = caterpillartarget.y;
        if (caterpillartarget.jumping)
        {
            yy = caterpillartarget.y + caterpillartarget.yclimb;
        }
        if (x > (caterpillartarget.x + 60) && y > (yy + 30))
        {
            if (y > (yy + 50) && can_caterpillar_to(x, y - 40))
            {
                dir = 2;
            }
            else
            {
                var xx = x;
                for (var i = 0; i < 3; i++)
                {
                    xx = scr_approach(xx, caterpillartarget.x, 40);
                    if (can_caterpillar_to(xx, y, true) && !place_meeting(xx, y - 40, caterpillartarget) && !place_meeting(xx, y + 40, caterpillartarget))
                    {
                        forcejump = i > 0;
                        xclimb = 0;
                        yclimb = 0;
                        dir = 3;
                        break;
                    }
                }
            }
        }
        else if (x < (caterpillartarget.x - 60) && y > (yy + 30))
        {
            var xx = scr_approach(x, caterpillartarget.x, 40);
            if (y > (yy + 50) && can_caterpillar_to(x, y - 40))
            {
                dir = 2;
            }
            else
            {
                xx = x;
                for (var i = 0; i < 3; i++)
                {
                    xx = scr_approach(xx, caterpillartarget.x, 40);
                    if (can_caterpillar_to(xx, y, true) && !place_meeting(xx, y - 40, caterpillartarget) && !place_meeting(xx, y + 40, caterpillartarget))
                    {
                        forcejump = i > 0;
                        xclimb = 0;
                        yclimb = 0;
                        dir = 1;
                        break;
                    }
                }
            }
        }
        else if (y > (yy + 170) && can_caterpillar_to(x, y - 120))
        {
            forcejump = 1;
            xclimb = 0;
            yclimb = 0;
            dir = 2;
        }
        else if (y > (yy + 130) && can_caterpillar_to(x, y - 80))
        {
            forcejump = 1;
            xclimb = 0;
            yclimb = 0;
            dir = 2;
        }
        else if (y > (yy + 90) && can_caterpillar_to(x, y - 40))
        {
            dir = 2;
        }
        else if (y < (yy + 50))
        {
            evade = true;
        }
        if (evade || force_evade)
        {
            var evaded = false;
            if (y < (yy + 50) && can_caterpillar_to(x, y + 40))
            {
                dir = 0;
                evaded = true;
            }
            else if (y < (yy + 50) && (can_caterpillar_to(x, y + 80) || can_caterpillar_to(x, y + 120)))
            {
                dir = 0;
                forcejump = true;
                xclimb = 0;
                yclimb = 0;
                evaded = true;
            }
            if (!evaded && (abs(x - caterpillartarget.x) < 20 || abs(x - obj_climb_kris.x) < 20))
            {
                if (y < (yy + 50) && can_caterpillar_to(x, y + 40))
                {
                    dir = 0;
                    evaded = true;
                }
                else if (y < (yy + 50) && (can_caterpillar_to(x, y + 80) || can_caterpillar_to(x, y + 120)))
                {
                    dir = 0;
                    forcejump = true;
                    xclimb = 0;
                    yclimb = 0;
                    evaded = true;
                }
            }
            var ydiff = y - yy;
            var wanted_distance = 80;
            if (scr_trigcheck_ext("softevade", id))
            {
                wanted_distance = 60;
                if (!evaded && abs(y - obj_climb_kris.y) < 10 && abs(x - obj_climb_kris.x) < 10)
                {
                    if (can_caterpillar_to(x + 40, y, true))
                    {
                        dir = 1;
                        evaded = true;
                    }
                    else if (can_caterpillar_to(x - 40, y, true))
                    {
                        dir = 3;
                        evaded = true;
                    }
                }
            }
            if (!evaded && sign(x - caterpillartarget.x) >= 0 && abs(caterpillartarget.x - x) < (wanted_distance - ydiff) && ydiff < 70)
            {
                if (can_caterpillar_to(x + 40, y))
                {
                    dir = 1;
                    evaded = true;
                }
                else if (can_caterpillar_to(x + 80, y) || can_caterpillar_to(x + 120, y))
                {
                    dir = 1;
                    forcejump = true;
                    xclimb = 0;
                    yclimb = 0;
                    evaded = true;
                }
                else if (place_meeting(x, y, 1368) && can_caterpillar_to(x - 40, y))
                {
                    dir = 3;
                    evaded = true;
                }
            }
            if (!evaded && sign(x - caterpillartarget.x) <= 0 && abs(caterpillartarget.x - x) < (wanted_distance - ydiff) && ydiff < 70)
            {
                if (can_caterpillar_to(x - 40, y))
                {
                    dir = 3;
                    evaded = true;
                }
                else if (can_caterpillar_to(x - 80, y) || can_caterpillar_to(x - 120, y))
                {
                    dir = 3;
                    forcejump = true;
                    xclimb = 0;
                    yclimb = 0;
                    evaded = true;
                }
                else if (place_meeting(x, y, 1368) && can_caterpillar_to(x + 40, y))
                {
                    dir = 1;
                    evaded = true;
                }
            }
            if (!evaded && force_evade)
            {
                if (can_caterpillar_to(x, y + 40))
                {
                    dir = 0;
                    evaded = true;
                }
                else if (can_caterpillar_to(x, y + 80) || can_caterpillar_to(x, y + 120))
                {
                    dir = 0;
                    forcejump = true;
                    xclimb = 0;
                    yclimb = 0;
                    evaded = true;
                }
            }
        }
        else if (y > (yy + 50) && x > (caterpillartarget.x + 20) && can_caterpillar_to(x - 40, y))
        {
            dir = 3;
        }
        else if (y > (yy + 50) && x < (caterpillartarget.x - 20) && can_caterpillar_to(x + 40, y))
        {
            dir = 1;
        }
        _dir = dir;
    }
    remx = x;
    remy = y;
    if (forcejump)
    {
        con = 2;
        timer = 0;
        forcejump = 0;
        force_evade = false;
        exit;
    }
    if (_dir >= 0)
    {
        force_evade = false;
        con = 1;
        climbcon = 0;
    }
}
if (con == 1)
{
    if (climbcon < 0)
    {
        climbcon++;
    }
    if (climbcon == 0)
    {
        yclimb = 0;
        xclimb = 0;
        var _dir = dir;
        if (climb_direction == -1 && (_dir % 2) == 0)
        {
            _dir = (_dir + 2) % 4;
        }
        if (_dir == 2)
        {
            yclimb = -40;
        }
        else if (_dir == 3)
        {
            xclimb = -40;
        }
        else if (_dir == 1)
        {
            xclimb = 40;
        }
        else
        {
            yclimb = 40;
        }
        sprite_index = climbsprite;
        if (climbindex == 0)
        {
            climbindex = 2;
        }
        else
        {
            climbindex = 0;
        }
        climbcon = 1;
    }
    if (climbcon == 1)
    {
        var draw_dust = !onrotatingtower || tile_vis == 1;
        if (timer == 0 && draw_dust)
        {
            var dust_amount = 1;
            if (jumping)
            {
                dust_amount = 5;
            }
            for (var i = 0; i < dust_amount; i++)
            {
                var dust = instance_create(x, y + 40, 1237);
                dust.sprite_index = 7696;
                dust.depth = depth + 10;
                if (jumping)
                {
                    dust.x = dust.x + random_range(-10, 10);
                    dust.y = dust.y + random_range(-10, 10);
                }
                else if (yclimb < 0)
                {
                    dust.x = (dust.x - 10) + (10 * climbindex);
                }
                else if (yclimb > 0)
                {
                    dust.x = (dust.x - 15) + (15 * climbindex);
                }
                else
                {
                    dust.y = dust.y + 10;
                }
                if (i_ex(744) && i_ex(1164))
                {
                    dust.x = tower_x;
                    dust.depth = obj_rotating_tower_controller_new.depth - 4;
                }
                dust.image_xscale = 2;
                dust.image_yscale = 2;
                dust.image_speed = 0.5;
                dust.vspeed += -1;
            }
        }
        drawoffsety = 0;
        var newx, newy, climbrate;
        if (jumping == 0)
        {
            if (climbspeed < climbspeedmultiplier)
            {
                climbspeed = climbspeedmultiplier;
            }
            climbrate = 10;
            if (followmode == 2)
            {
                climbspeed = obj_climb_kris.climbspeed;
                climbmomentum = obj_climb_kris.climbmomentum;
                if (obj_climb_kris.climbcon == 10)
                {
                    climbspeed = 0;
                    climbmomentum = 0;
                }
            }
            if (caterpillartarget != -4)
            {
                climbrate = 10;
                timer += (obj_climb_kris.climbspeed + obj_climb_kris.climbmomentum);
                if (obj_climb_kris.jumping)
                {
                    climbrate = 5;
                }
            }
            else
            {
                timer += (climbspeed + climbmomentum);
            }
            if (timer >= climbrate)
            {
                timer = climbrate;
            }
            newx = lerp_ease_inout(remx, remx + xclimb, timer / climbrate, 2);
            newy = lerp_ease_inout(remy, remy + yclimb, timer / climbrate, 2);
            image_index = climbindex;
            if (abs(newx - remx) > 3 || abs(newy - remy) > 3)
            {
                image_index = 1 + climbindex;
            }
        }
        x = newx;
        y = newy;
        if (timer >= climbrate)
        {
            jumping = 0;
            climbcon = 0;
            jumpchargeamount = 0;
            x = remx + xclimb;
            y = remy + yclimb;
            if (onrotatingtower && x > obj_rotating_tower_controller_new.tower_circumference)
            {
                x -= obj_rotating_tower_controller_new.tower_circumference;
            }
            if (onrotatingtower && x < 0)
            {
                x += obj_rotating_tower_controller_new.tower_circumference;
            }
            con = 0;
            timer = 0;
        }
    }
    if (followmode == 2)
    {
        image_index = obj_climb_kris.image_index;
    }
}
if (con == 3 || con == 4)
{
    sprite_index = 6391;
    if (con == 3)
    {
        sprite_index = 5051;
    }
    image_speed = 0;
    if (timer == 0)
    {
        image_index = 1;
        if (instance_place(x + 35, y, 1164) && (obj_climb_kris.climbcon == 2 || obj_climb_kris.neutralcon == 1 || obj_climb_kris.fallingcon > 0))
        {
            snd_play(314);
            with (1164)
            {
                image_alpha = 0;
                fallingcon = 0;
                jumping = 0;
                climbcon = 0;
                neutralcon = 1;
                if (other.onrotatingtower)
                {
                    visible = 0;
                }
            }
            if (onrotatingtower)
            {
                con = 5;
            }
            global.interact = 1;
            timer++;
        }
    }
    if (timer > 0)
    {
        timer++;
        var delay = (con * 10) - 10;
        if (timer < delay)
        {
            image_index = 2 + min(4, floor(timer / 4));
        }
        else
        {
            image_index = 6 + min(3, floor((timer - delay) / 4));
            if (timer == (delay + 8))
            {
                var targetx = 0;
                var targety = 0;
                with (311)
                {
                    var suffix = "";
                    if (extflag == (string(other.reachcon) + suffix))
                    {
                        other.targetgenmarker = self;
                        targetx = x;
                        targety = y;
                        break;
                    }
                }
                with (1164)
                {
                    scr_lerpvar("x", x, targetx, 25);
                    scr_lerpvar("y", y, targety - 20, 25);
                }
                with (instance_create(obj_climb_kris.x, obj_climb_kris.y - 20, 1238))
                {
                    scr_jump_to_point(targetx, targety - 20, 10, 25);
                    sprite_index = 86;
                    image_xscale = 2;
                    image_yscale = 2;
                    scr_doom(self, 25);
                }
                snd_play(424);
            }
            if (timer == (delay + 34))
            {
                var targetx = 0;
                var targety = 0;
                if (targetgenmarker != -4)
                {
                    targetx = targetgenmarker.x;
                    targety = targetgenmarker.y;
                }
                snd_play(314);
                obj_climb_kris.x = targetx + 20;
                obj_climb_kris.y = targety + 20;
                obj_climb_kris.image_alpha = 1;
                global.interact = 0;
                sprite_index = 3538;
                con = 0;
                reachcon = 0;
            }
        }
    }
}
if (con == 5)
{
    if (timer > 0)
    {
        timer++;
        var delay = 20;
        if (timer < delay)
        {
            image_index = 2 + min(4, floor(timer / 4));
        }
        else
        {
            image_index = 6 + min(3, floor((timer - delay) / 4));
            var jumptime = 100;
            if (timer == (delay + 8))
            {
                with (instance_create(camerax() + (0.5 * camerawidth()), obj_climb_kris.y - 20, 1238))
                {
                    scr_jump_to_point((camerax() - 19) + (0.5 * camerawidth()), ((cameray() - 42) + (0.5 * cameraheight())) - 416, 25, jumptime);
                    sprite_index = 86;
                    image_xscale = 2;
                    image_yscale = 2;
                    depth = 100;
                }
                snd_play(424);
            }
            if (timer > (delay + 8) && timer <= (delay + 60))
            {
                obj_climb_kris.y -= 8;
            }
            if (timer == (delay + 30))
            {
                whiteout = scr_marker_ext(0, 0, 6488, room_width, room_height, undefined, undefined, 16777215, 101);
                with (whiteout)
                {
                    image_alpha = 0;
                    scr_lerpvar("image_alpha", 0, 1, 30);
                }
            }
            if (timer == (delay + 8 + jumptime))
            {
                snd_play(314);
                with (1238)
                {
                    if (depth == 100)
                    {
                        y -= 6;
                        newmarker = instance_create(x, y, obj_marker_screen);
                        newmarker.sprite_index = 75;
                        newmarker.image_speed = 0;
                        newmarker.depth = 10;
                        with (newmarker)
                        {
                            scr_darksize();
                        }
                        scr_doom(newmarker, 100, true);
                        scr_shakeobj();
                        instance_destroy();
                    }
                }
                blackout = scr_marker_ext(0, 0, 6488, room_width, room_height, undefined, undefined, 0, 102);
            }
            if (timer == (delay + 8 + jumptime + 10))
            {
                with (whiteout)
                {
                    scr_lerpvar("image_alpha", 1, 0, 30);
                    scr_doom(self, 30);
                }
            }
            if (timer == (delay + 8 + jumptime + 55))
            {
            }
        }
    }
}
if (con == 2)
{
    image_index = 0;
    timer += 1;
    if (followmode != 3)
    {
        var _dir = dir;
        if (climb_direction == -1 && (_dir % 2) == 0)
        {
            _dir = (_dir + 2) % 4;
        }
        if (_dir == 2)
        {
            yclimb = -40;
        }
        else if (_dir == 3)
        {
            xclimb = -40;
        }
        else if (_dir == 1)
        {
            xclimb = 40;
        }
        else
        {
            yclimb = 40;
        }
        if (followmode == 2)
        {
            xclimb = obj_climb_kris.xclimb;
            yclimb = obj_climb_kris.yclimb;
            snd_play_x(300, 0.6, 1.1 + random(0.1));
            sprite_index = climbsprite;
            image_index = obj_climb_kris.image_index;
            timer = 0;
            con = 12;
        }
        else
        {
            var checkamount = 4;
            for (var i = 1; i <= checkamount; i++)
            {
                var testxclimb = xclimb * i;
                var testyclimb = yclimb * i;
                var finalclimbx = x + testxclimb;
                var finalclimbx2 = (x + testxclimb) - xclimb;
                var falseloopused = 0;
                if (collision_rectangle(finalclimbx, y + 10 + testyclimb, finalclimbx + 1, y + testyclimb + 11, 586, false, true))
                {
                    if (falseloopused)
                    {
                        remx = finalclimbx - testxclimb;
                    }
                    if (i == 1)
                    {
                        con = 1;
                        break;
                    }
                    xclimb = testxclimb;
                    yclimb = testyclimb;
                    snd_play_x(300, 0.6, 1.1 + random(0.1));
                    sprite_index = climbsprite;
                    timer = 0;
                    con = 12;
                    break;
                }
            }
        }
    }
    else
    {
        if (timer == 1)
        {
            if (image_index < 2)
            {
                sprite_index = chargelsprite;
            }
            else
            {
                sprite_index = chargersprite;
            }
        }
        image_index = timer / 4;
        if (timer > 3)
        {
            snd_play_x(300, 0.6, 1.1 + random(0.1));
            sprite_index = jumpsprite;
            timer = 0;
            con = 12;
        }
    }
}
if (con == 12)
{
    timer++;
    if (timer == 1)
    {
        var dust_amount = 5;
        for (var i = 0; i < dust_amount; i++)
        {
            var dust = instance_create(x, y, 1237);
            dust.sprite_index = 7696;
            dust.depth = depth + 10;
            dust.x = dust.x + random_range(-10, 10);
            dust.y = dust.y + random_range(-10, 10);
            dust.image_xscale = 2;
            dust.image_yscale = 2;
            dust.image_speed = 0.5;
            dust.vspeed += -1;
        }
    }
    var climbrate = 12;
    if (followmode == 2)
    {
        var boost = ((abs(xclimb) + abs(yclimb)) / 40) - 1;
        climbrate = 6 + (boost * 2);
        var clipamount = 4;
        if (boost >= 2)
        {
            clipamount = 2;
        }
        if (obj_climb_kris.climbcon == 10 || obj_climb_kris.cuttimer > 0)
        {
            timer -= 1;
        }
        if (timer >= climbrate)
        {
            climbtimer = climbrate;
        }
        if (timer >= (climbrate - clipamount))
        {
            timer = climbrate;
        }
    }
    if (timer >= climbrate)
    {
        timer = climbrate;
    }
    var newx = lerp_ease_out(remx, remx + xclimb, timer / climbrate, 1);
    var newy = lerp_ease_out(remy, remy + yclimb, timer / climbrate, 1);
    drawoffsety = -sin((timer / climbrate) * pi) * (2 * (((abs(xclimb) + abs(yclimb)) / 40) - 1));
    if (dir == 2 || dir == 0)
    {
        image_index = timer / 2;
        sprite_index = jumpsprite;
    }
    else if (dir == 1)
    {
        if ((timer / climbrate) > 0.5)
        {
            sprite_index = jumpsprite;
        }
        else
        {
            sprite_index = jumpsprite;
            image_index = 0;
        }
    }
    else if ((timer / climbrate) > 0.5)
    {
        sprite_index = jumpsprite;
    }
    else
    {
        sprite_index = jumpsprite;
        image_index = 0;
    }
    var afterimage = scr_afterimage();
    afterimage.image_alpha = 0.2;
    x = newx;
    y = newy;
    if (timer >= climbrate)
    {
        con = 0;
        timer = 0;
        drawoffsety = 0;
        climbmomentum = ((abs(xclimb) + abs(yclimb)) / 40) * 0.5;
        sprite_index = climbsprite;
        image_index = 0;
        x = remx + xclimb;
        y = remy + yclimb;
    }
}
var overlapping_trigger = instance_place(x, y, 891);
if (overlapping_trigger != -4)
{
    with (overlapping_trigger)
    {
        if (con == 0)
        {
            con = 1;
        }
    }
}
hittimer--;
if (hittimer <= 0 && global.interact == 0)
{
    var bulletcheck = collision_rectangle(bbox_left + 14, bbox_top + 14, bbox_right - 14, bbox_bottom - 14, 723, true, true);
    if (jumping == 0)
    {
        if (bulletcheck == -4)
        {
            var reposition = x;
            bulletcheck = collision_rectangle(bbox_left + 14, bbox_top + 14, bbox_right - 14, bbox_bottom - 14, 1112, true, true);
            x = reposition;
            if (bulletcheck != -4)
            {
                if (bulletcheck.active == 0)
                {
                    bulletcheck = -4;
                }
            }
        }
    }
    if (bulletcheck != -4)
    {
        damage = bulletcheck.damage;
        damagecon = 1;
        hittimer = 60;
    }
}
if (damagecon == 1)
{
    scr_damage_all_overworld();
    with (1390)
    {
        charcon = 1;
    }
    with (1164)
    {
        hittimer = 60;
    }
    damagecon = 0;
}
climbmomentum -= 0.03;
if (climbmomentum <= 0)
{
    climbmomentum = 0;
}
if (caterpillartarget != -4 && (!i_ex(1164) || obj_climb_kris.exitcon == 1))
{
    caterpillartarget = -4;
    con = 999;
    var targx = 0;
    var targy = 0;
    if (object_index == 196)
    {
        sprite_index = 484;
        image_speed = 0.25;
        x -= 20;
        y -= 20;
    }
    else
    {
        sprite_index = 83;
        image_speed = 0.25;
        x -= 20;
        y -= 20;
    }
    with (1389)
    {
        if (name == other.name)
        {
            targx = x;
            targy = y;
        }
    }
    var jumpstrength = 8;
    if (global.facing == 2)
    {
        jumpstrength = 12;
    }
    var __jump = scr_jump_to_point(targx, targy, jumpstrength, 15);
    con = 999;
    __jump.end_step = true;
    with (__jump)
    {
        scr_delay_var("image_alpha", 0, 15);
    }
    scr_delay_var("image_alpha", 0, 15);
    scr_doom(self, 16);
    exit;
}
