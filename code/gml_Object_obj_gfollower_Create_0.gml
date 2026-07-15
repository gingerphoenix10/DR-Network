gfollowertype = 0;
isg = 0;

function msgbetter(arg0)
{
    msgset(global.msgno, arg0);
    global.msgno++;
}

image_blend = merge_color(8421504, 16777215, 0.3);
spr_idle = 8581;
spr_talk = 8581;
spr_idleg = 8582;
spr_talkg = 8582;
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
