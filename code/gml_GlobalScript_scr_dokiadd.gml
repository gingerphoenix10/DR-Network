function scr_dokiadd(arg0, arg1)
{
    with (obj_pink_enemy)
    {
        doki += arg1;
        if (ONLINE_DEBUG())
            doki *= 50;
        if (doki < 0)
            doki = 0;
        
        if (doki >= 100)
            doki = 100;
    }
    
    var _playsound = 1;
    
    if (arg1 <= 0)
        _playsound = 0;
    
    with (obj_dmgwriter)
    {
        if (type == 15 && mercytimer < 8)
            _playsound = 0;
    }
    
    if (_playsound)
    {
        var _pitch = 0.8;
        
        if (arg1 < 99)
            _pitch = 1;
        
        if (arg1 <= 50)
            _pitch = 1.2;
        
        if (arg1 <= 25)
            _pitch = 1.4;
        
        snd_play_x(snd_mercyadd, 0.8, _pitch);
    }
    
    __mercydmgwriter = instance_create(global.monsterx[arg0], (global.monstery[arg0] + 20) - (global.hittarget[arg0] * 20), obj_dmgwriter);
    __mercydmgwriter.damage = arg1;
    __mercydmgwriter.type = 15;
    global.hittarget[arg0]++;
}
