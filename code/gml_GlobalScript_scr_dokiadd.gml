function scr_dokiadd(arg0, arg1)
{
    with (300)
    {
        doki += (arg1 * 50);
        if (doki < 0)
        {
            doki = 0;
        }
        if (doki >= 100)
        {
            doki = 100;
        }
    }
    var _playsound = 1;
    if (arg1 <= 0)
    {
        _playsound = 0;
    }
    with (1537)
    {
        if (type == 15 && mercytimer < 8)
        {
            _playsound = 0;
        }
    }
    if (_playsound)
    {
        var _pitch = 0.8;
        if (arg1 < 99)
        {
            _pitch = 1;
        }
        if (arg1 <= 50)
        {
            _pitch = 1.2;
        }
        if (arg1 <= 25)
        {
            _pitch = 1.4;
        }
        snd_play_x(1, 0.8, _pitch);
    }
    __mercydmgwriter = instance_create(global.monsterx[arg0], (global.monstery[arg0] + 20) - (global.hittarget[arg0] * 20), 1537);
    __mercydmgwriter.damage = arg1;
    __mercydmgwriter.type = 15;
    global.hittarget[arg0]++;
}
