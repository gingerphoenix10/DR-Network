function scr_fakespr()
{
    switch (character)
    {
        case "kris":
        default:
            sety = 10;
            cutscenewait = 704;
            if (!global.darkzone)
            {
                cutscenewait = 708;
            }
            battlestance = 2185;
            break;
        case "frisk":
            sety = 2;
            cutscenewait = 8548;
            battlestance = 8534;
            break;
        case "chara":
            sety = 2;
            cutscenewait = 8535;
            battlestance = 8535;
            break;
        case "susie":
            sety = 22;
            cutscenewait = 7;
            if (!global.darkzone)
            {
                cutscenewait = 670;
            }
            battlestance = 2228;
            break;
        case "ralsei":
            sety = 16;
            cutscenewait = 475;
            battlestance = 2431;
            break;
        case "noelle":
            sety = 28;
            cutscenewait = 401;
            if (!global.darkzone)
            {
                cutscenewait = 440;
            }
            battlestance = 2491;
            break;
        case "aqua":
            sety = 2;
            cutscenewait = 4383;
            battlestance = 6787;
            break;
        case "seth":
            sety = 2;
            cutscenewait = 4241;
            battlestance = 90;
            break;
        case "yellow":
            sety = 45;
            cutscenewait = 3555;
            battlestance = 7624;
            break;
        case "pink":
            sety = 28;
            cutscenewait = 6069;
            battlestance = 682;
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
if (object_index == 1771)
{
    iframes = 0;
    
    get_hurt = function(arg0)
    {
        if (paused || custom_paused || iframes > 0 || eliminated)
        {
            exit;
        }
        with (arg0)
        {
            if (!hit_check(other.id))
            {
                exit;
            }
        }
        global.lastHitId = idthing;
        global.lastHitNum++;
        with (arg0)
        {
            do_hbx_hit(-4, -1, 1.5 - ((0.5 * other.hp) / other.__max_hp));
        }
        flash_hurt(255);
        with (instance_create_depth(x, y, depth, 1658))
        {
            sprite_index = 3352;
            image_speed = 1;
        }
        with (instance_create_depth(x, y, depth, 1658))
        {
            sprite_index = 1236;
            image_speed = 2;
        }
    };
}
