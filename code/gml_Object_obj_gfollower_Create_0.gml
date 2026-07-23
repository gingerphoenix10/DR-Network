gfollowertype = 0;
isg = 0;

function msgbetter(arg0)
{
    msgset(global.msgno, arg0);
    global.msgno++;
}

image_blend = merge_color(c_gray, c_white, 0.3);
spr_idle = spr_followerl1;
spr_talk = spr_followerl1;
spr_idleg = spr_g_follower_1;
spr_talkg = spr_g_follower_1;
myinteract = 0;
talked = 0;
tempvar = 0;
image_speed = 0;
depthcancel = 0;
normalanim = 1;
remanimspeed = 0;
flag = 0;
extflag = 0;
alwaysanimate = false;
skip = false;
mydialoguer = -1;
scr_depth();
