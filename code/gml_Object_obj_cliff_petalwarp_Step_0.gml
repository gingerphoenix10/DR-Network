var yscale = scr_platswap_yscale();
image_xscale = 1 + (sin(current_time / 300) * 0.05);
image_alpha = 0.5 + (sin(current_time / 450) * 0.1);
target_alpha = scr_approach(target_alpha, tangible, 0.1);
image_alpha *= (1 - yscale[0]);
image_alpha *= target_alpha;
image_yscale = 1 - yscale[0];
scr_depth(self, -500);
leafstorm.depth = depth;
leafstorm.active = true;
leafstorm.style = 1;

if (con == 0 && leafstorm.active && global.interact == 0)
{
    if (place_meeting(x, y, obj_mainchara))
    {
        con = 1;
        
        with (obj_caterpillarchara)
        {
            if (name == "ralsei")
                other.ralsei = self;
            
            if (name == "susie")
                other.susie = self;
        }
        
        event_user(8);
    }
    
    leafstorm.strength = 1.1;
}

if (con == 1)
{
    con = 2;
    scr_delay_var("con", 3, 1);
    global.interact = 1;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    var xx = x;
    var yy = y;
    c_sel(kr);
    c_walkdirect(xx - 19, yy - 80 - (length / 2), 15);
    c_pan_fancy(clamp(xx - 320, 0, room_width - 640), clamp(yy - 80 - 240 - 200, 0, room_height - 480), 80);
    c_pannable(1);
    
    if (susie != -4)
    {
        c_sel(su);
        c_walkdirect(xx - 40, yy - 76, 15);
    }
    
    if (ralsei != -4)
    {
        c_sel(ra);
        c_walkdirect(xx + 27, yy - 64, 15);
    }
    
    c_wait(15);
    c_var_instance(id, "spinner_con", 3);
    c_wait(1);
    c_snd_play(snd_petalwarp);
    c_sel(kr);
    c_sprite(spr_krisb_pirouette);
    c_autowalk(false);
    c_lerp_var_instance(kr_actor, "image_speed", 0.16666666666666666, 0.5, 10, 2, "in");
    c_lerp_var_instance(id, "k_height", 0, 320, 50, 2, "in");
    
    if (susie != -4)
    {
        c_sel(su);
        c_sprite(spr_susie_pirouette);
        c_lerp_var_instance(su_actor, "image_speed", 0.16666666666666666, 0.5, 10, 2, "in");
        c_autowalk(false);
        c_var_instance(id, "spinner_con", 2);
        c_lerp_var_instance(id, "s_height", 0, 320, 50, 2, "in");
    }
    
    if (ralsei != -4)
    {
        c_sel(ra);
        c_sprite(spr_ralsei_pirouette);
        c_lerp_var_instance(ra_actor, "image_speed", 0.16666666666666666, 0.5, 10, 2, "in");
        c_autowalk(false);
        c_var_instance(id, "spinner_con", 3);
        c_lerp_var_instance(id, "r_height", 0, 320, 50, 2, "in");
    }
    
    c_wait(15);
    c_fadeout(30);
    c_wait(30);
    c_pannable(0);
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}

if (con == 3)
{
    if (!instance_exists(obj_cutscene_master))
    {
        global.facing = 0;
        global.interact = 0;
        obj_mainchara.cutscene = 0;
        obj_mainchara.freeze = false;
        scr_caterpillar_interpolate("all");
        con = 0;
        instance_create(0, 0, obj_persistentfadein);
        global.interact = 3;
        event_user(7);
        room_goto(doorRoom);
    }
}

if (spinner_con > 0)
{
    if (instance_exists(kr_actor))
    {
        var _yscale = 0.5;
        kr_actor.x = (x + lengthdir_x(length, angle)) - 20;
        var _yoff = (lengthdir_y(length, angle) * _yscale) - k_height - kr_actor.sprite_height;
        kr_actor.y = y + _yoff;
        
        if (spinner_con >= 2)
        {
            if (susie != -4)
            {
                var _offset = 120;
                
                if (ralsei == -4)
                    _offset = 180;
                
                su_actor.x = (x + lengthdir_x(length, angle + _offset)) - 20;
                _yoff = (lengthdir_y(length, angle + _offset) * _yscale) - k_height - su_actor.sprite_height;
                su_actor.y = y + _yoff;
            }
            else if (ralsei != -4)
            {
                ra_actor.x = (x + lengthdir_x(length, angle + 180)) - 20;
                _yoff = (lengthdir_y(length, angle + 180) * _yscale) - k_height - ra_actor.sprite_height;
                ra_actor.y = y + _yoff;
            }
        }
        
        if (spinner_con >= 3)
        {
            ra_actor.x = (x + lengthdir_x(length, angle + 240)) - 20;
            _yoff = (lengthdir_y(length, angle + 240) * _yscale) - k_height - ra_actor.sprite_height;
            ra_actor.y = y + _yoff;
        }
    }
    
    angle -= rotation;
}