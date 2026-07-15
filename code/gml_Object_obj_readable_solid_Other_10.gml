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
with (1390)
{
    charcon = 0;
}
global.msgno = 0;
scr_speaker("no_name");
for (var i = 0; i < array_length(message); i++)
{
    msgbetter(message[i]);
}
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
