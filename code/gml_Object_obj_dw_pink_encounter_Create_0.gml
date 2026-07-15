customcon = 0;
con = -1;
timer = 0;
init = 0;
siner = 0;
battlesetup = false;
tempflag_index = 62;
turnofflayers("CUT");
turnofflayers("DEBUG");
orapos = findspriteinfo(spr_enemy_orange_walk_right, "CUT_ASSETS");
pkpos = findspriteinfo(spr_pink_walk_up, "CUT_ASSETS");
krpos = findspriteinfo(spr_debug_krmarker, "CUT_ASSETS");
supos = findspriteinfo(spr_debug_sumarker, "CUT_ASSETS");
rapos = findspriteinfo(spr_debug_ramarker, "CUT_ASSETS");
kissheart = -4;

if (scr_debug())
{
    scr_setparty(true, true);
    
    if (keyboard_check(ord("P")))
    {
    }
}

if (global.flag[1846] < 2 || global.alwaysunlockpink)
{
    con = 0;
    blackall = scr_marker(-10, -10, spr_whitepx);
    blackall.image_xscale = 700;
    blackall.image_yscale = blackall.image_xscale;
    blackall.image_alpha = 1.3;
    blackall.image_blend = c_black;
    blackall.depth = 10000;
    scr_lerp_instance_var(blackall, "image_alpha", 1.3, 0, 30);
    scr_flag_set(20, 0);
    pinkface = instance_create_depth(room_width - 224, room_height, -50, obj_pinkspeaker);
}

rumble_sound = snd_loop(snd_rumble);
snd_volume(rumble_sound, 0, 0);
