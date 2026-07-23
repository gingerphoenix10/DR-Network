scr_depth();
image_speed = 0;

if (global.darkzone)
    scr_darksize(id);

walk = 0;
fun = 0;
follow = 1;
runmove = 0;
dir = 0;
walkbuffer = 0;
walktimer = 0;
slided = 0;
specialed = 0;
init_clothes = false;
blushtimer = 0;
name = "susie";
target = 12;
sprite_init = false;
usprite = spr_susieu_dark;
dsprite = spr_susied_dark;
rsprite = spr_susier_dark;
lsprite = spr_susiel_dark;
slidesprite = spr_susie_slide;
climbsprite = 3538;

if (global.chapter >= 2)
{
    usprite = spr_susie_walk_up_dw;
    rsprite = spr_susie_walk_right_dw;
    lsprite = spr_susie_walk_left_dw;
    dsprite = spr_susie_walk_down_dw;
    
    if (global.darkzone == 0)
    {
        usprite = spr_susie_walk_up_lw;
        rsprite = spr_susie_walk_right_lw;
        lsprite = spr_susie_walk_left_lw;
        dsprite = spr_susie_walk_down_lw;
    }
}

usprite_blush = spr_ralseiu;
dsprite_blush = spr_ralseid;
rsprite_blush = spr_ralseir_blush;
lsprite_blush = spr_ralseil_blush;

if (global.chapter >= 2)
{
    usprite_blush = spr_ralsei_walk_up;
    dsprite_blush = spr_ralsei_walk_down_blush;
    rsprite_blush = spr_ralsei_walk_right_blush;
    lsprite_blush = spr_ralsei_walk_left_blush;
}

parent = obj_mainchara;
pd = parent.dsprite;
pr = parent.rsprite;
pl = parent.lsprite;
pu = parent.usprite;

for (i = 0; i < 75; i += 1)
{
    remx[i] = parent.x;
    remy[i] = parent.y;
    facing[i] = global.facing;
    sliding[i] = 0;
    special[i] = 0;
}

depth = parent.depth + 5;
mywidth = sprite_width;
myheight = sprite_height;
xoffset = 0;
yoffset = 0;
init = 0;
encounter_return_offset = undefined;
forget = 0;
ignoredepth = 0;
halign = 6;
valign = 16;

initialize = function()
{
    ignoredepth = 0;
    init = 1;
    
    if (name == "susie")
    {
        reflection_offset = 8;
        
        if (scr_havechar("no") && global.darkzone == 0)
            target = 8;
        
        halign = (global.darkzone == 0) ? 3 : 6;
        valign = (global.darkzone == 0) ? 6 : 16;
        
        if (scr_flag_get(1416) == 1)
        {
            rsprite = spr_susie_walk_right_lw_unhappy;
            dsprite = spr_susie_walk_down_lw_unhappy;
            lsprite = spr_susie_walk_left_lw_unhappy;
        }
        
        if (scr_use_unhappy_sprites())
        {
            rsprite = spr_susie_walk_right_dw_unhappy;
            dsprite = spr_susie_walk_down_dw_unhappy;
            lsprite = spr_susie_walk_left_dw_unhappy;
        }
        
        if (global.darkzone == 0)
        {
            if (global.plot >= 90 && global.plot < 105)
            {
                if (scr_flag_get(1322) == 1 && room != room_town_school)
                {
                    var trash_marker = instance_create(x + 2, y - 2, obj_susie_dust);
                    var _target = id;
                    
                    with (trash_marker)
                        stick_to(_target, -10);
                }
            }
        }
    }
    
    if (name == "noelle")
    {
        usprite = (global.darkzone == 1) ? spr_noelle_walk_up_dw : spr_noelle_walk_up_lw;
        rsprite = (global.darkzone == 1) ? spr_noelle_walk_right_dw : spr_noelle_walk_right_lw;
        lsprite = (global.darkzone == 1) ? spr_noelle_walk_left_dw : spr_noelle_walk_left_lw;
        dsprite = (global.darkzone == 1) ? spr_noelle_walk_down_dw : spr_noelle_walk_down_lw;
        
        if (global.darkzone == 0)
            target = scr_havechar("su") ? 17 : 12;
        
        halign = (global.darkzone == 0) ? 2 : 4;
        valign = (global.darkzone == 0) ? 9 : 18;
    }
    
    if (name == "ralsei")
    {
        climbsprite = 6791;
        halign = 2;
        valign = 12;
        
        if (global.flag[1311] == 1)
            reflection_offset = 4;
        else
            reflection_offset = 8;
        
        if (global.chapter == 5)
        {
            if (scr_flag_get(1311) == 1)
            {
                dsprite = spr_ralseid;
                rsprite = spr_ralseir;
                lsprite = spr_ralseil;
                usprite = spr_ralseiu;
                usprite_blush = spr_ralseiu;
                dsprite_blush = spr_ralseid;
                rsprite_blush = spr_ralseir_blush;
                lsprite_blush = spr_ralseil_blush;
                slidesprite = spr_ralsei_dark_slide;
            }
            else
            {
                dsprite = spr_ralsei_walk_down;
                rsprite = spr_ralsei_walk_right;
                lsprite = spr_ralsei_walk_left;
                usprite = spr_ralsei_walk_up;
                
                if (scr_use_unhappy_sprites())
                {
                    rsprite = spr_ralsei_walk_right_unhappy;
                    dsprite = spr_ralsei_walk_down_unhappy;
                    lsprite = spr_ralsei_walk_left_unhappy;
                }
                
                usprite_blush = spr_ralsei_walk_up;
                dsprite_blush = spr_ralsei_walk_down_blush;
                rsprite_blush = spr_ralsei_walk_right_blush;
                lsprite_blush = spr_ralsei_walk_left_blush;
                slidesprite = spr_ralsei_slide;
            }
        }
    }
    
    if (name == "flowery")
    {
        halign = 0;
        valign = 44;
    }
    
    if (name == "aqua")
    {
        halign = 0;
        valign = -6;
    }
    
    if (name == "orange")
    {
        halign = 0;
        valign = -40;
    }
};

selfshadow_override = false;
