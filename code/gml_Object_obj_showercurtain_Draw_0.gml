if (myinteract == 1 && con == 0)
{
    con = 1;
    myinteract = 0;
    with (1198)
    {
        onebuffer = 3;
    }
    snd_play(464);
}
else if (myinteract == 1 && con == 1)
{
    talked = 1;
    myinteract = 3;
    global.msc = 0;
    global.typer = 5;
    global.msgno = 0;
    global.msg[0] = "* (There is something strange inside the bathtub.)/";
    global.msgno = 1;
    global.msg[1] = "* (Wait... But that's...)/%";
    instance_create(0, 0, 400);
    global.interact = 1;
}
else if (myinteract == 1 && con == 2)
{
    myinteract = 3;
    global.msc = 0;
    global.typer = 5;
    global.msgno = 0;
    global.msg[0] = "* (It's an empty bathtub.)/%";
    instance_create(0, 0, 400);
    global.interact = 1;
}
if (con == 1)
{
    if (size > 0.3)
    {
        size -= 0.1;
    }
}
if (con < 2)
{
    draw_sprite_ext(8617, 0, 167, 50, 1, 1, 0, 16777215, 1);
}
draw_sprite_ext(8599, 0, x, y, size, 1, 0, 16777215, 1);
