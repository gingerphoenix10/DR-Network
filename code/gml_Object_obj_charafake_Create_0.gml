function scr_fakespr()
{
    switch (character)
    {
        case "kris":
        default:
            sety = 10;
            cutscenewait = spr_kris_pease;
            
            if (!global.darkzone)
                cutscenewait = spr_kris_sit_wind;
            
            battlestance = spr_krisb_intro;
            break;
        
        case "frisk":
            sety = 2;
            cutscenewait = spr_maincharar_liedown;
            battlestance = spr_mainchara_pourwater;
            break;
        
        case "chara":
            sety = 2;
            cutscenewait = spr_truechara_laugh;
            battlestance = spr_truechara_laugh;
            break;
        
        case "susie":
            sety = 22;
            cutscenewait = spr_susie_head_scratch_dw;
            
            if (!global.darkzone)
                cutscenewait = spr_susie_head_scratch;
            
            battlestance = spr_susieb_idle;
            break;
        
        case "ralsei":
            sety = 16;
            cutscenewait = spr_ralsei_dance;
            battlestance = spr_ralsei_battleintro;
            break;
        
        case "noelle":
            sety = 28;
            cutscenewait = spr_noelle_shocked_dw;
            
            if (!global.darkzone)
                cutscenewait = spr_noelle_shocked_lw;
            
            battlestance = spr_noelleb_battleintro;
            break;
        
        case "aqua":
            sety = 2;
            cutscenewait = spr_aqua_shell_listen;
            battlestance = spr_aqua_sleevewave; //CHANGE
            break;
        
        case "seth":
            sety = 2;
            cutscenewait = spr_seth_read;
            battlestance = spr_seth_exasperated;
            break;
        
        case "yellow":
            sety = 45;
            cutscenewait = spr_yellow_up_dejected_lookback;
            battlestance = spr_yellow_shoot;
            break;
        
        case "pink":
            sety = 28;
            cutscenewait = spr_pink_sing_idle;
            battlestance = spr_pink_laugh_pouring;
    }
}

is_sprinting = false;
nickname = "Kris";
character = "kris";
version = global.onlineversion;
you = 0;
tower_shake_xoffset = 0;
idthing = 0;
roomin = 0;
scr_fakespr();
fullyjoined = 0;
sendmessage = 0;
state = 0;
state_index = 0;
assignednum = 0;
boardexclusive = 0;
horsespeedx = 0;
image_speed = 0;
damagebuffer = 0;
dust_timer = 0;
jumpy = 0;
colorswitch = 0;
afterimagetimer = 0;
movey = 0;
fakespeed = 0;
fakex = 0;
platformer = false;
performs_culling_checks = false;
switchingPVP = false;
eliminated = false;
event_inherited();

if (object_index == obj_plat_pvp_charafake)
{
    iframes = 0;
    
    get_hurt = function(arg0)
    {
        if (paused || custom_paused || iframes > 0 || eliminated)
            exit;
        
        with (arg0)
        {
            if (!hit_check(other.id))
                exit;
        }
        
        global.lastHitId = idthing;
        global.lastHitNum++;
        
        with (arg0)
            do_hbx_hit(-4, -1, 1.5 - ((0.5 * other.hp) / other.__max_hp));
        
        flash_hurt(255);
        
        with (instance_create_depth(x, y, depth, obj_plat_vfx))
        {
            sprite_index = spr_hit_vfx;
            image_speed = 1;
        }
        
        with (instance_create_depth(x, y, depth, obj_plat_vfx))
        {
            sprite_index = spr_smokepuff;
            image_speed = 2;
        }
    };
}
