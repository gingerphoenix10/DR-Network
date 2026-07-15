var meminteract = global.interact;
myinteract = 3;
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
{
    global.typer = 6;
}
global.fe = 0;
global.fc = 0;
global.interact = 1;
global.msgno = 0;
scr_speaker("no_name");
msgbetter("* (You found Suzy.)/");
msgbetter("* (There is something familiar about her.)/");
msgbetter("* (You can't really put your finger on it.)/");
msgbetter("* (Put your finger? On what?)/");
msgbetter("* (What? Who's Suzie?)/%");
if (skip == 0)
{
    mydialoguer = instance_create(0, 0, 400);
}
read += 1;
if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}
