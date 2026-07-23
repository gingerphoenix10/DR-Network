var meminteract = global.interact;
myinteract = 3;
global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fe = 0;
global.fc = 0;
global.interact = 1;

with (obj_darkcontroller)
    charcon = 0;

global.msgno = 0;
scr_speaker("no_name");

if (sinkon == 0)
{
    msgbetter("* (You turned on the sink.)/%");
    sinkon = 1;
    sinkaudio = snd_loop(sinksnd, 0.6, 2.2);
}
else
{
    msgbetter("* (You turned off the sink.)/%");
    sinkon = 0;
    snd_stop(sinkaudio);
}

if (skip == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);

read += 1;

if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}
