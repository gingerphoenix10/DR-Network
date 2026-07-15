if (!d_ex() && myinteract == 3)
{
    myinteract = 0;
    global.interact = 0;
    with (1198)
    {
        onebuffer = 3;
    }
}
if (talked == 1 && !instance_exists(400))
{
    instance_create(0, 0, 1741);
    talked = 2;
    global.bookfound = 1;
    con = 2;
}
