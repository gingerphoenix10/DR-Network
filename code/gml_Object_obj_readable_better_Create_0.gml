message = [];
msgno = 0;
scr_depth();

function msgbetter(arg0)
{
    msgset(global.msgno, arg0);
    global.msgno++;
}

function msgsetup(arg0)
{
    message[msgno] = arg0;
    msgno += 1;
}

myinteract = 0;
image_speed = 0;
read = 0;
tempvar = 0;
extflag = 0;
mydialoguer = -1;
skip = 0;
selfdestruct = false;
