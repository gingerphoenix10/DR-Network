function array_contains_lts_sucks(arg0, arg1)
{
    var i = 0;
    var size = array_length(arg0);
    repeat (size)
    {
        if (arg0[i] == arg1)
        {
            return 1;
        }
        i++;
    }
    return 0;
}

function array_get_index_lts(arg0, arg1)
{
    var i = 0;
    var size = array_length(arg0);
    repeat (size)
    {
        if (arg0[i] == arg1)
        {
            return i;
        }
        i++;
    }
    return -1;
}

function initpvpinfo()
{
    global.timer = 0;
    global.eliminated = [];
    global.participants = [];
    global.participates = -4;
    global.pvp = -4;
    global.serverpvpinfo = -4;
    global.pvpblock = 1;
    global.reqmap = 0;
    global.pvpmap = 0;
    global.lastHitNum = 0;
    global.lastHitId = 0;
    global.hitsmap = ds_map_create();
    global.pvpeliminated = false;
    global.spectating = 0;
}

function pvpreset()
{
    global.timer = 0;
    global.participates = -4;
    global.eliminated = [];
    global.participants = [];
    global.pvpblock = 1;
    global.reqmap = 0;
    global.pvpmap = 0;
    global.lastHitNum = 0;
    global.lastHitId = 0;
    global.pvpeliminated = false;
    global.spectating = 0;
    ds_map_clear(global.hitsmap);
    instance_create(0, 0, 1311);
    room_goto(global.pvpmemo[0]);
    snd_free(global.currentsong[0]);
    global.currentsong[0] = global.pvpmemo[3];
    mus_volume(global.currentsong[1], 0, 14);
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    obj_mainchara.x = global.pvpmemo[1];
    obj_mainchara.y = global.pvpmemo[2];
    if (global.pvpmemo[4])
    {
        scr_become_dark();
    }
}

function scr_pvp()
{
    if (false && instance_exists(obj_ralseiracecontroller))
    {
        if (array_length(global.participants) == 0)
        {
            global.eliminated = [];
            global.pvpblock = 1;
        }
    }
    if (instance_exists(1761))
    {
        var count = 0;
        for (var i = 0; i < instance_number(obj_charafake); i++)
        {
            var curchar = instance_find(obj_charafake, i);
            var pvproom = 266;
            if (curchar.roomin == pvproom)
            {
                count += 1;
            }
        }
        if (count == 0)
        {
            global.pvpstarted = 0;
        }
        if (array_length(global.participants) >= 2 && global.pvpblock)
        {
            global.timer = 900;
            global.pvpblock = 0;
        }
        if (array_length(global.participants) < 2 && !global.pvpblock)
        {
            global.timer = 900;
            global.pvpblock = 1;
        }
        global.serverpvpinfo = 
        {
            timer: global.timer,
            eliminated: global.eliminated,
            participants: global.participants,
            pvpblock: global.pvpblock,
            pvpstarted: global.pvpstarted
        };
        if (global.timer > 0 && !global.pvpblock)
        {
            global.timer--;
        }
    }
    if (instance_exists(1737))
    {
        if (is_struct(global.serverpvpinfo))
        {
            global.timer = global.serverpvpinfo.timer;
            global.eliminated = global.serverpvpinfo.eliminated;
            global.participants = global.serverpvpinfo.participants;
            global.pvpblock = global.serverpvpinfo.pvpblock;
            global.pvpstarted = global.serverpvpinfo.pvpstarted;
        }
    }
}

function pvp_takehit(arg0)
{
    with (910)
    {
        if (!hurt && !targetmode && !invincible)
        {
            snd_play(371);
            do_kb = true;
            hurt_type = 1;
            var hk = 6 * sign(x - arg0.x);
            var vk = min(-4, -4);
            get_hurt(10, hk, vk, 17);
            do_hitstop(4);
            with (scr_plat_vfx(7342))
            {
                image_xscale = choose(1, -1);
                image_yscale = choose(1, -1);
                image_angle = choose(0, 90, 180, 270);
            }
        }
    }
}
