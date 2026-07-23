if (!d_ex() && myinteract == 3)
{
    myinteract = 0;
    global.interact = 0;
    
    with (obj_mainchara)
        onebuffer = 3;
}

if (talked == 1 && !instance_exists(obj_dialoguer))
{
    instance_create(0, 0, obj_fakeundertalebattle);
    talked = 2;
    global.bookfound = 1;
    con = 2;
}
