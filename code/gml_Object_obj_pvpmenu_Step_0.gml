if (global.timer == 0 && !global.pvpblock)
{
    mus_volume(global.currentsong[1], 0, 14);
    global.currentsong[0] = snd_init("mus_race.ogg");
    global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
    global.pvpstarted = 1;
    var mapnumber = maps[global.pvpmap][1];
    global.interact = 0;
    room_goto(mapnumber);
}
if (global.key_online)
{
    global.participates = -4;
    instance_create(0, 0, 1311);
    global.returningFromPVP = true;
    room_goto(global.pvpmemo[0]);
    snd_free(global.currentsong[0]);
    global.currentsong[0] = global.pvpmemo[3];
    mus_volume(global.currentsong[1], 0, 14);
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    obj_mainchara.x = global.pvpmemo[1];
    obj_mainchara.y = global.pvpmemo[2];
    global.interact = 3;
    if (global.pvpmemo[4])
    {
        scr_become_dark();
    }
}
