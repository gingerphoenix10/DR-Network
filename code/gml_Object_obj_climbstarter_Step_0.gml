if (con == 0)
{
    var trig = 0;
    
    if (global.flag[23] && !i_ex(obj_climb_kris))
    {
        with (obj_climbstartertrig)
        {
            if (exitmarkerflag == other.exitmarkerflag)
            {
                if (myinteract == 3)
                {
                    trig = 10;
                    myinteract++;
                }
            }
        }
    }
    
    if (forcetoclimb == true)
        trig = 10;
    
    if (i_ex(obj_climb_kris))
        trig = -1;
    
    if (!global.flag[23])
        trig = -1;
    
    if (trig == 10)
    {
        forcetoclimb = false;
        con = 1;
        timer = 0;
    }
}

if (con == 1)
{
    timer++;
    
    if (timer == 1)
    {
        obj_mainchara.visible = false;
        obj_mainchara.freeze = true;
        obj_mainchara.cutscene = true;
        endtime = 8;
        
        if (i_ex(obj_rotating_tower_controller_new) && center_if_tower == 1)
        {
            with (obj_rotating_tower_controller_new)
                scr_pan_lerp(tower_x - (0.5 * camerawidth()), cameray(), other.endtime);
        }
        
        var xx = x;
        var yy = y;
        var et = endtime;
        
        with (obj_caterpillarchara)
        {
            if (obj_mainchara.climb_with_caterpillars && global.showcompanions)
            {
                var spr = 83;
                var xxx = -40;
                
                if (name == "ralsei")
                {
                    spr = 484;
                    xxx = 40;
                }
                
                var gm = scr_genmarker(other.exitmarkerflag + name);
                
                if (gm != -4)
                {
                    xxx = 0;
                    xx = gm.x + 20;
                    yy = gm.y + 20;
                }
                
                if (instance_exists(obj_dw_cliff_climbrefresher) && y < 1000)
                    yy += 40;
                
                visible = 0;
                var jm = scr_marker_ext(x, y, spr, 2, 2, 0.25, 0, c_white, depth);
                
                with (jm)
                {
                    scr_jump_to_point((xx - 2) + xxx, yy - 22, 8, et, true).end_step = true;
                    scr_doom(self, et);
                }
            }
            else
            {
                with (obj_lerpvar)
                {
                    if (instance_exists(target) && target.id == other.id)
                        instance_destroy();
                }
                
                visible = 1;
                image_alpha = 1;
                scr_lerp_imageblend(id, c_white, c_gray, 7);
                scr_lerpvar("image_alpha", 1, 0, 7);
            }
        }
        
        jumpmarker = scr_marker_ext(obj_mainchara.x, obj_mainchara.y, spr_kris_jump_ball_fixed, 2, 2, 0.25, 0, c_white, obj_mainchara.depth);
        
        with (obj_mainchara)
            scr_stickto(other.jumpmarker, 0);
        
        with (jumpmarker)
        {
            scr_jump_to_point(other.x - 2, other.y - 22, 8, other.endtime, true).end_step = true;
            scr_addtosunshadows(id);
        }
        
        snd_play(snd_wing);
    }
    
    if (timer == (1 + endtime))
    {
        global.interact = 0;
        snd_play(snd_noise);
        safe_delete(jumpmarker);
        
        with (instance_create(x + 20, y + 20, obj_climb_kris))
        {
            if (other.e_up)
                yclimb = 1;
        }
        
        if (obj_mainchara.climb_with_caterpillars && global.showcompanions)
        {
            var xx = obj_climb_kris.x - 40;
            var yy = obj_climb_kris.y;
            var gm = scr_genmarker(exitmarkerflag + "susie");
            
            if (gm != -4)
            {
                xx = gm.x + 20;
                yy = gm.y + 20;
            }
            
            if (instance_exists(obj_dw_cliff_climbrefresher) && y < 1000)
                yy += 40;
            
            var su = instance_create(xx, yy, obj_climb_susie);
            su.caterpillartarget = 1164;
            su.depth = obj_climb_kris.depth + 1;
            xx = obj_climb_kris.x + 40;
            yy = obj_climb_kris.y;
            gm = scr_genmarker(exitmarkerflag + "ralsei");
            
            if (gm != -4)
            {
                xx = gm.x + 20;
                yy = gm.y + 20;
            }
            
            if (instance_exists(obj_dw_cliff_climbrefresher) && y < 1000)
                yy += 40;
            
            var ra = instance_create(xx, yy, obj_climb_ralsei);
            ra.caterpillartarget = su;
            ra.depth = obj_climb_kris.depth + 2;
        }
        
        con = 0;
    }
}

if (susieball != -4)
{
    susietimer++;
    
    if (susietimer >= 20)
    {
        snd_play(snd_noise);
        safe_delete(susieball);
        instance_create(x + 20, y + 20, obj_climb_susie);
        susietimer = 0;
        susieball = -4;
    }
}
