function onlineinit()
{
    var filename = "onlineconfig.ini";
    global.onlineversion = "ch" + string(global.chapter) + "v0.0.5.6";
    global.onlineinitiated = 1;
    global.ip = "127.0.0.1";
    global.port = "7676";
    global.publicip = "45.133.89.163";
    global.publicport = "7676";
    
    switch (global.chapter)
    {
        case 1:
            global.publicport = "33495";
            break;
        
        case 2:
            global.publicport = "54667";
            break;
        
        case 3:
            global.publicport = "54393";
            break;
        
        case 4:
            global.publicport = "52119";
            break;
    }
    
    global.goingpublic = 0;
    global.playernickname = global.truename;
    global.maxplayercount = 16;
    global.connecttimeout = 5000;
    global.key_online_setting = "O";
    global.key_chat_setting = "T";
    global.character = "kris";
    global.shownicknames = 1;
    global.showyournickname = 0;
    global.showcompanions = 1;
    global.showchatmessages = 1;
    global.narratechat = 0;
    global.cutsceneplayers = 0;
    global.key_lostlevels_setting = "L";
    global.followparty = 0;
    global.lostlevels = 0;
    global.charactersunlocked = [0, 0];
    global.showchapter5 = 0;
    global.unlockchapter5 = 0;
    global.debugerrors = 0;
    global.alwaysunlockpink = 1;
    var fileip = "serverlist.json";
    global.serverlist = 
    {
        ips: [],
        ports: []
    };
    
    if (!file_exists(filename))
    {
        ini_open(filename);
        ini_write_string("Multiplayer", "ip", global.ip);
        ini_write_string("Multiplayer", "port", global.port);
        ini_write_string("Multiplayer", "nickname", global.playernickname);
        ini_write_real("Host", "maxplayers", global.maxplayercount);
        
        if (global.charactersunlocked[0])
            ini_write_real("Host", "friskunlocked", global.charactersunlocked[0]);
        
        if (global.charactersunlocked[1])
            ini_write_real("Host", "charaunlocked", global.charactersunlocked[1]);
        
        ini_write_string("Client", "key_online", global.key_online_setting);
        ini_write_string("Client", "key_chat", global.key_chat_setting);
        ini_write_string("Client", "character", global.character);
        ini_write_real("Client", "shownicknames", global.shownicknames);
        ini_write_real("Client", "showyournickname", global.showyournickname);
        ini_write_real("Client", "showcompanions", global.showcompanions);
        ini_write_real("Client", "showchatmessages", global.showchatmessages);
        ini_write_real("Client", "narratechat", global.narratechat);
        ini_write_real("Client", "unlockchapter5", global.unlockchapter5);
        ini_write_real("Client", "cutsceneplayers", global.cutsceneplayers);
        ini_write_string("Client", "key_lostlevels", global.key_lostlevels_setting);
        ini_write_real("Party", "followparty", global.followparty);
        ini_write_real("Bonus", "lostlevels", global.lostlevels);
        ini_write_real("Bonus", "connecttimeout", global.connecttimeout);
        ini_write_real("Bonus", "debugerrors", global.debugerrors);
        ini_close();
    }
    else if (file_exists(filename))
    {
        ini_open(filename);
        global.ip = ini_read_string("Multiplayer", "ip", "127.0.0.1");
        global.port = ini_read_string("Multiplayer", "port", "7676");
        global.playernickname = ini_read_string("Multiplayer", "nickname", global.truename);
        global.maxplayercount = ini_read_real("Host", "maxplayers", 16);
        global.charactersunlocked[0] = ini_read_real("Host", "friskunlocked", 0);
        global.charactersunlocked[1] = ini_read_real("Host", "charaunlocked", 0);
        global.key_online_setting = ini_read_string("Client", "key_online", "O");
        global.key_chat_setting = ini_read_string("Client", "key_chat", "T");
        global.character = ini_read_string("Client", "character", "kris");
        global.shownicknames = ini_read_real("Client", "shownicknames", 1);
        global.showyournickname = ini_read_real("Client", "showyournickname", 0);
        global.showcompanions = ini_read_real("Client", "showcompanions", 1);
        global.showchatmessages = ini_read_real("Client", "showchatmessages", 1);
        global.narratechat = ini_read_real("Client", "narratechat", 0);
        global.unlockchapter5 = ini_read_real("Client", "unlockchapter5", 0);
        global.cutsceneplayers = ini_read_real("Client", "cutsceneplayers", 0);
        global.key_lostlevels_setting = ini_read_string("Client", "key_lostlevels", "L");
        global.followparty = ini_read_real("Party", "followparty", 0);
        global.lostlevels = ini_read_real("Bonus", "lostlevels", 0);
        global.connecttimeout = ini_read_real("Bonus", "connecttimeout", 5000);
        global.debugerrors = ini_read_real("Bonus", "debugerrors", 0);
        ini_close();
    }
    
    if (!file_exists(fileip))
    {
        var thyfile = file_text_open_write(fileip);
        file_text_write_string(thyfile, json_stringify(global.serverlist));
        file_text_close(thyfile);
    }
    else
    {
        var thyfile = file_text_open_read(fileip);
        global.serverlist = json_parse(file_text_read_string(thyfile));
        file_text_close(thyfile);
    }
}

function mysterycheck()
{
    if (global.mysteryin == "no")
        return 1;
    else
        return 0;
}

function mysteryman(arg0 = "chapter5")
{
    arg0 = "chapter3";
    global.mysterymemo = [room, obj_mainchara.x, obj_mainchara.y, global.currentsong[0], global.darkzone, global.character];
    global.mysteryin = arg0;
    mus_volume(global.currentsong[1], 0, 3);
    
    switch (arg0)
    {
        case "chapter3":
        default:
            global.mysteryphone[0] = 203;
            global.character = "frisk";
            global.currentsong[0] = snd_init("mus_waterfall.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            room_goto(room_water_fakehallway);
            break;
        
        case "chapter4":
        case "chapter5":
            global.mysteryphone[0] = 204;
            global.character = "chara";
            global.currentsong[0] = snd_init("mus_mysteriousroom2.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.7, 1);
            room_goto(room_truelab_elevator);
            break;
    }
    
    global.interact = 0;
    onlineinfoupdate();
    scr_become_light();
}

function mysterymanback()
{
    instance_create(0, 0, obj_persistentfadein);
    global.character = global.mysterymemo[5];
    
    if (global.charactersunlocked[0] == 0 && global.mysteryin == "chapter3")
    {
        scr_notificationsend(7, "Frisk");
        global.charactersunlocked[0] = 1;
    }
    
    if (global.charactersunlocked[1] == 0 && (global.mysteryin == "chapter4" || global.mysteryin == "chapter5"))
    {
        scr_notificationsend(7, "Kris");
        global.charactersunlocked[1] = 1;
    }
    
    global.mysteryhello = 1;
    onlineinfoupdate();
    room_goto(global.mysterymemo[0]);
    snd_free(global.currentsong[0]);
    global.currentsong[0] = global.mysterymemo[3];
    mus_volume(global.currentsong[1], 0, 14);
    global.currentsong[1] = mus_loop(global.currentsong[0]);
    obj_mainchara.x = global.mysterymemo[1];
    obj_mainchara.y = global.mysterymemo[2];
    global.mysteryin = "no";
    
    if (global.mysterymemo[4])
        scr_become_dark();
}

function onlineinfoupdate()
{
    var filename = "onlineconfig.ini";
    ini_open(filename);
    ini_write_string("Multiplayer", "ip", global.ip);
    ini_write_string("Multiplayer", "port", global.port);
    ini_write_string("Multiplayer", "nickname", global.playernickname);
    ini_write_real("Host", "maxplayers", global.maxplayercount);
    
    if (global.charactersunlocked[0])
        ini_write_real("Host", "friskunlocked", global.charactersunlocked[0]);
    
    if (global.charactersunlocked[1])
        ini_write_real("Host", "charaunlocked", global.charactersunlocked[1]);
    
    ini_write_string("Client", "key_online", global.key_online_setting);
    ini_write_string("Client", "key_chat", global.key_chat_setting);
    ini_write_string("Client", "character", global.character);
    ini_write_real("Client", "shownicknames", global.shownicknames);
    ini_write_real("Client", "showyournickname", global.showyournickname);
    ini_write_real("Client", "showcompanions", global.showcompanions);
    ini_write_real("Client", "showchatmessages", global.showchatmessages);
    ini_write_real("Client", "narratechat", global.narratechat);
    ini_write_real("Client", "unlockchapter5", global.unlockchapter5);
    ini_write_real("Client", "cutsceneplayers", global.cutsceneplayers);
    ini_write_string("Client", "key_lostlevels", global.key_lostlevels_setting);
    ini_write_real("Party", "followparty", global.followparty);
    ini_write_real("Bonus", "lostlevels", global.lostlevels);
    ini_write_real("Bonus", "connecttimeout", global.connecttimeout);
    ini_write_real("Bonus", "debugerrors", global.debugerrors);
    ini_close();
}

function chatsendmessage(arg0, arg1 = "", arg2 = 16777215, arg3 = obj_mainchara)
{
    array_push(global.chatsenderstemp, [arg1, arg2]);
    array_push(global.chatsenders, [arg1, arg2]);
    array_push(global.chattemp, arg0);
    array_push(global.chatstay, arg0);
    
    with (obj_onlinecontroller)
    {
        sndfntmaxtimes = ceil(string_length(arg0) / 3);
        sndfnttimes = 0;
        
        if (instance_exists(arg3))
            sndfnt = arg3.sndfnt;
        else
            sndfnt = 2;
        
        if (alarm[2] <= 0)
            alarm[2] = chattime;
        
        alarm[3] = 2;
    }
}

function serverlistinfoupdate()
{
    var filename = "serverlist.json";
    var thyfile = file_text_open_write(filename);
    file_text_write_string(thyfile, json_stringify(global.serverlist));
    file_text_close(thyfile);
}

function networkvarsget(arg0 = 1)
{
    var curobject = -4;
    var curplayerid = -4;
    var curdslist = -4;
    var curdsmap = -4;
    
    if (instance_exists(obj_server))
    {
        curobject = obj_server;
        curdslist = obj_server.SocketList;
        curdsmap = obj_server.PlayerMap;
        curplayerid = ds_list_find_value(curdslist, 0);
    }
    else if (instance_exists(obj_client))
    {
        curobject = obj_client;
        curdslist = obj_client.clientsocketlist;
        curdsmap = obj_client.clientplayermap;
        curplayerid = curobject.socketid;
    }
    
    switch (arg0)
    {
        case 1:
        default:
            return curobject;
            break;
        
        case 2:
            return curplayerid;
            break;
        
        case 3:
            return curdslist;
            break;
        
        case 4:
            return curdsmap;
            break;
    }
}

function initpartyinfo()
{
    partystatus = -4;
    partyinvite = -4;
    declinerequest = 0;
    partyhostinfo = -4;
    global.partydata = -4;
}

function getpartyinfo(arg0 = ds_list_find_value(networkvarsget(3), 0))
{
    var playersocket = arg0;
    var type = -4;
    
    if (instance_exists(obj_server))
        type = 1;
    else if (instance_exists(obj_client))
        type = 2;
    else if (arg0 == -4)
        type = 3;
    
    switch (type)
    {
        case 1:
            return ds_map_find_value(global.Parties, playersocket);
            break;
        
        case 2:
            if (global.Parties != -4)
                return variable_struct_get(global.Parties, string(playersocket));
            
            break;
        
        case 3:
            return -4;
            break;
    }
}

function getplayerpartydata()
{
    var netobject = networkvarsget(1);
    var playerid = networkvarsget(2);
    
    if (netobject != -4)
    {
        var character = obj_mainchara;
        
        if (!instance_exists(character))
            character = obj_plat_player;
        
        if (netobject.partystatus == playerid && instance_exists(character))
        {
            with (netobject)
            {
                var battleinfo = -4;
                partyhostinfo = 
                {
                    roomin: room,
                    targetx: character.x,
                    targety: character.y,
                    lightordark: global.darkzone,
                    entrance: global.entrance,
                    interact: global.interact,
                    battle: [instance_exists(obj_battlecontroller)],
                    battleinfo: battleinfo,
                    platformer: instance_exists(obj_plat_player)
                };
            }
        }
    }
}

function getmemberpartydata()
{
    var netobject = networkvarsget(1);
    var playerid = networkvarsget(2);
    
    if (netobject != -4)
    {
        if (netobject.partystatus != playerid && netobject.partystatus != -4)
        {
            with (netobject)
            {
                var battleinfo = -4;
                partyhostinfo = 
                {
                    battle: [instance_exists(obj_battlecontroller)],
                    battleinfo: battleinfo
                };
            }
        }
    }
}

function setcreatorpartydata()
{
    var netobject = networkvarsget(1);
    var playerid = networkvarsget(2);
    var dslistnet = networkvarsget(3);
    
    if (netobject != -4)
    {
        if (netobject.partystatus == playerid)
        {
            for (var i = 0; i < ds_list_size(dslistnet); i++)
            {
                var partymember = ds_list_find_value(dslistnet, i);
                
                if (partymember != playerid)
                {
                    var partymemberdata = getpartyinfo(partymember);
                    
                    if (is_struct(partymemberdata))
                        global.partydata = partymemberdata.partyhostinfo;
                }
            }
        }
    }
}

function setplayerpartydata()
{
    var netobject = networkvarsget(1);
    var playerid = networkvarsget(2);
    
    if (netobject != -4)
    {
        if (netobject.partystatus != -4 && netobject.partystatus != playerid)
        {
            var partycreatorstr = getpartyinfo(netobject.partystatus);
            
            if (is_struct(partycreatorstr))
            {
                var partycreatorinst = getplayer(netobject.partystatus, 2, 0);
                global.partydata = partycreatorstr.partyhostinfo;
                
                if (is_struct(global.partydata))
                {
                    if (room != global.partydata.roomin && !instance_exists(obj_roomswitcher) && global.followparty && !instance_exists(obj_cutscene_master) && global.partydata.interact == global.interact && global.interact == 0)
                    {
                        with (instance_create(x, y, obj_roomswitcher))
                        {
                            targetroom = global.partydata.roomin;
                            entrance = global.partydata.entrance;
                        }
                    }
                }
            }
        }
    }
}

function getpartycreator(arg0 = ds_list_find_value(networkvarsget(3), 0))
{
    var partyinfo = getpartyinfo(arg0);
    return partyinfo.partystatus;
}

function getplayer(arg0, arg1 = 1, arg2 = 1)
{
    var playerorder = arg0;
    var type = arg1;
    var isitorder = arg2;
    var curdslist = -4;
    var curdsmap = -4;
    
    if (instance_exists(obj_server))
    {
        curdslist = obj_server.SocketList;
        curdsmap = obj_server.PlayerMap;
    }
    else if (instance_exists(obj_client))
    {
        curdslist = obj_client.clientsocketlist;
        curdsmap = obj_client.clientplayermap;
    }
    
    if (curdslist != -4)
    {
        switch (type)
        {
            case 1:
                return ds_list_find_value(curdslist, playerorder);
                break;
            
            case 2:
                if (isitorder)
                    return ds_map_find_value(curdsmap, ds_list_find_value(curdslist, playerorder));
                else
                    return ds_map_find_value(curdsmap, playerorder);
                
                break;
        }
    }
    else if (type == 2 && !isitorder)
    {
        return ds_map_find_value(curdsmap, playerorder);
    }
}

function scr_characterspr()
{
    switch (global.character)
    {
        case "kris":
        default:
            sety = 10;
            slidesprite = spr_krisd_slide;
            heartslide = spr_krisd_slide;
            dsprite = spr_krisd;
            rsprite = spr_krisr;
            usprite = spr_krisu;
            lsprite = spr_krisl;
            climbsprite = spr_kris_climb_new;
            sndfnt = 243;
            
            if (global.darkzone == 1)
            {
                dsprite = spr_krisd_dark;
                rsprite = spr_krisr_dark;
                lsprite = spr_krisl_dark;
                usprite = spr_krisu_dark;
            }
            
            if (global.chapter == 4)
            {
                if (global.darkzone == 0 && global.plot >= 11 && global.plot < 35)
                {
                    dsprite = spr_kris_walk_down_church;
                    rsprite = spr_kris_walk_right_church;
                    lsprite = spr_kris_walk_left_church;
                }
            }
            
            break;
        
        case "frisk":
            sety = 2;
            slidesprite = spr_maincharad_fall;
            heartslide = spr_maincharad_fall;
            dsprite = spr_maincharad;
            rsprite = spr_maincharar;
            usprite = spr_maincharau;
            lsprite = spr_maincharal;
            climbsprite = spr_kris_climb_new;
            sndfnt = 243;
            
            if (global.chapter == 4)
            {
                if (global.darkzone == 0 && global.plot >= 11 && global.plot < 35)
                {
                    init_clothes = true;
                    dsprite = spr_kris_walk_down_church;
                    rsprite = spr_kris_walk_right_church;
                    lsprite = spr_kris_walk_left_church;
                }
                
                tower_shake_xoffset = 0;
            }
            
            break;
        
        case "chara":
            sety = 2;
            slidesprite = spr_charad_fall;
            heartslide = spr_charad_fall;
            dsprite = spr_charad;
            rsprite = spr_charar;
            usprite = spr_charau;
            lsprite = spr_charal;
            climbsprite = spr_kris_climb_new;
            sndfnt = 243;
            break;
        
        case "dog":
            sety = 0;
            slidesprite = spr_dog_sleep;
            heartslide = spr_dog_sleep;
            dsprite = spr_dog_walk;
            rsprite = spr_dog_walk;
            usprite = spr_dog_walk;
            lsprite = spr_dog_walk;
            climbsprite = spr_dog_climb_new;
            sndfnt = 243;
            break;
        
        case "susie":
            sety = 22;
            slidesprite = spr_susie_slide;
            heartslide = spr_susie_slide;
            dsprite = spr_susie_walk_down_lw;
            rsprite = spr_susie_walk_right_lw;
            usprite = spr_susie_walk_up_lw;
            lsprite = spr_susie_walk_left_lw;
            climbsprite = spr_susie_climb_new;
            sndfnt = 271;
            
            if (global.darkzone == 1)
            {
                dsprite = spr_susie_walk_down_dw;
                rsprite = spr_susie_walk_right_dw;
                lsprite = spr_susie_walk_left_dw;
                usprite = spr_susie_walk_up_dw;
            }
            
            if (global.chapter == 4)
            {
                if (global.darkzone == 0 && global.plot >= 11 && global.plot < 35)
                {
                    usprite = spr_susie_walk_up_church;
                    dsprite = spr_susie_walk_down_church;
                    rsprite = spr_susie_walk_right_church;
                    lsprite = spr_susie_walk_left_church;
                }
            }
            
            break;
        
        case "ralsei":
            sety = 16;
            slidesprite = spr_ralsei_slide;
            heartslide = spr_ralsei_slide;
            dsprite = spr_ralsei_walk_down;
            rsprite = spr_ralsei_walk_right;
            usprite = spr_ralsei_walk_up;
            lsprite = spr_ralsei_walk_left;
            climbsprite = spr_ralsei_climb_new;
            sndfnt = 274;
            
            if (global.chapter == 4)
            {
                if (global.darkzone == 0 && global.plot >= 11 && global.plot < 35)
                {
                    dsprite = spr_ralsei_walk_down_blush;
                    rsprite = spr_ralsei_walk_right_blush;
                    lsprite = spr_ralsei_walk_left_blush;
                }
            }
            
            break;
        
        case "noelle":
            sety = 28;
            stealthrightspr = spr_noelle_shocked_dw;
            stealthleftspr = spr_noelle_shocked_dw;
            slidesprite = spr_noelle_shocked_dw;
            heartslide = spr_noelle_shocked_dw;
            dsprite = spr_noelle_walk_down_lw;
            rsprite = spr_noelle_walk_right_lw;
            usprite = spr_noelle_walk_up_lw;
            lsprite = spr_noelle_walk_left_lw;
            climbsprite = spr_noelle_shocked_dw;
            sndfnt = 272;
            
            if (global.darkzone == 1)
            {
                dsprite = spr_noelle_walk_down_dw;
                rsprite = spr_noelle_walk_right_dw;
                lsprite = spr_noelle_walk_left_dw;
                usprite = spr_noelle_walk_up_dw;
            }
            
            break;
        
        case "aqua":
            sety = 2;
            stealthrightspr = spr_aqua_walk_right;
            stealthleftspr = spr_aqua_walk_left;
            slidesprite = spr_aqua_spin;
            heartslide = spr_aqua_spin;
            dsprite = spr_aqua_walk_down;
            rsprite = spr_aqua_walk_right;
            usprite = spr_aqua_walk_up;
            lsprite = spr_aqua_walk_left;
            climbsprite = spr_aqua_walk_up;
            sndfnt = 243;
            break;
        
        case "seth":
            sety = 10;
            stealthrightspr = spr_seth_walk_right;
            stealthleftspr = spr_seth_walk_left;
            slidesprite = spr_seth_nervous;
            heartslide = spr_seth_nervous;
            dsprite = spr_seth_walk_down;
            rsprite = spr_seth_walk_right;
            usprite = spr_seth_walk_up;
            lsprite = spr_seth_walk_left;
            climbsprite = spr_seth_walk_up;
            sndfnt = 243;
            break;
        
        case "yellow":
            sety = 45;
            stealthrightspr = spr_yellow_walk_right;
            stealthleftspr = spr_yellow_walk_left;
            slide_sprite = spr_yellow_cool_stance;
            heartslide = spr_yellow_cool_stance;
            dsprite = spr_yellow_walk_down;
            rsprite = spr_yellow_walk_right;
            usprite = spr_yellow_walk_up;
            lsprite = spr_yellow_walk_left;
            climbsprite = spr_yellow_walk_up;
            sndfnt = 243;
            break;
        
        case "pink":
            sety = 22;
            stealthrightspr = spr_pink_walk_left;
            stealthleftspr = spr_pink_walk_left;
            slidesprite = spr_pink_front_surprised;
            heartslide = spr_pink_front_surprised;
            dsprite = spr_pink_walk_down;
            rsprite = spr_pink_walk_right;
            usprite = spr_pink_walk_up;
            lsprite = spr_pink_walk_left;
            climbsprite = spr_pink_walk_up;
            sndfnt = 243;
            break;
    }
    
    scr_climbspr();
}

function scr_climbspr()
{
    if (instance_exists(obj_climb_kris))
    {
        with (obj_climb_kris)
        {
            switch (global.character)
            {
                case "kris":
                default:
                    slipfallspr = 3063;
                    chargespr = 8343;
                    climbspr = 6843;
                    chargerightspr = 3375;
                    chargeleftspr = 1674;
                    jumpupspr = 7464;
                    landrightspr = 2409;
                    sliprightspr = 1563;
                    landleftspr = 6541;
                    slipleftspr = 3590;
                    spr_jumpball = 68;
                    break;
                
                case "ralsei":
                    slipfallspr = 5993;
                    chargespr = 5992;
                    climbspr = 5908;
                    chargerightspr = 5986;
                    chargeleftspr = 5985;
                    jumpupspr = 6002;
                    landrightspr = 5998;
                    sliprightspr = 5988;
                    landleftspr = 5997;
                    slipleftspr = 5987;
                    spr_jumpball = 351;
                    break;
                
                case "susie":
                    slipfallspr = 5978;
                    chargespr = 5975;
                    climbspr = 5907;
                    chargerightspr = 5982;
                    chargeleftspr = 5979;
                    jumpupspr = 6000;
                    landrightspr = 6001;
                    sliprightspr = 5977;
                    landleftspr = 5999;
                    slipleftspr = 5976;
                    spr_jumpball = 66;
                    break;
                
                case "noelle":
                    slipfallspr = 5989;
                    chargespr = 5991;
                    climbspr = 5990;
                    chargerightspr = 5984;
                    chargeleftspr = 5983;
                    jumpupspr = 6003;
                    landrightspr = 5996;
                    sliprightspr = 5981;
                    landleftspr = 5995;
                    slipleftspr = 5980;
                    spr_jumpball = 5994;
                    break;
            }
        }
    }
}

function scr_playemote(arg0)
{
    if (!instance_exists(obj_mainchara))
        exit;
    
    var lr_facing = (global.facing == 1 || global.facing == 2) ? 1 : -1;
    
    with (obj_mainchara)
    {
        switch (global.character)
        {
            case "kris":
                if (arg0 == 1)
                {
                    sprite_index = spr_kris_pose;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 2)
                {
                    sprite_index = spr_kris_dance;
                    emote = sprite_index;
                    emote_speed = 0.2;
                }
                
                if (arg0 == 3)
                {
                    sprite_index = spr_kris_uniform1;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 4)
                {
                    sprite_index = (lr_facing == 1) ? spr_kris_bow_right : spr_kris_bow_left;
                    emote = sprite_index;
                    emote_speed = 0.2;
                }
                
                if (arg0 == 5)
                {
                    sprite_index = spr_kris_outfit_aqua;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 6)
                {
                    sprite_index = spr_kris_outfit_heal;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 7)
                {
                    sprite_index = spr_kris_outfit_rude_buster;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 8)
                {
                    sprite_index = spr_kris_outfit_yellow;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 9)
                {
                    sprite_index = spr_kris_peace;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 0)
                {
                    sprite_index = spr_kris_chicken;
                    emote = sprite_index;
                    emote_speed = 0.2;
                }
                
                break;
            
            case "susie":
                emote_speed = 0.2;
                
                if (arg0 == 1)
                    sprite_index = spr_susie_pose;
                
                if (arg0 == 2)
                    sprite_index = spr_susie_dance;
                
                if (arg0 == 3)
                    sprite_index = spr_susie_uniform1;
                
                if (arg0 == 4)
                    sprite_index = spr_susie_clap;
                
                if (arg0 == 5)
                    sprite_index = spr_susie_head_scratch_dw;
                
                if (arg0 == 6)
                    sprite_index = spr_susie_chomp;
                
                if (arg0 == 7)
                    sprite_index = (lr_facing == 1) ? spr_susie_sheeh : spr_susie_sheeh_flip;
                
                if (arg0 == 8)
                    sprite_index = spr_susie_laugh_dw;
                
                if (arg0 == 9)
                    sprite_index = spr_susie_dark_relax;
                
                if (arg0 == 0)
                    sprite_index = spr_susie_annoyed;
                
                emote = sprite_index;
                break;
            
            case "noelle":
                // I couldn't really find any DW sprites for noelle
                break;
            
            case "ralsei":
                emote_speed = 0.2;
                
                if (arg0 == 1)
                    sprite_index = spr_ralsei_pose;
                
                if (arg0 == 2)
                    sprite_index = spr_ralsei_dance;
                
                if (arg0 == 3)
                    sprite_index = spr_ralsei_uniform1;
                
                if (arg0 == 4)
                    sprite_index = spr_ralsei_sing;
                
                if (arg0 == 5)
                    sprite_index = spr_ralsei_dress_clap;
                
                if (arg0 == 6)
                    sprite_index = spr_ralsei_wave_down;
                
                if (arg0 == 7)
                    sprite_index = spr_ralsei_laugh;
                
                if (arg0 == 8)
                    sprite_index = spr_ralsei_lawyer_psychic;
                
                if (arg0 == 9)
                    sprite_index = spr_ralsei_pirouette;
                
                if (arg0 == 0)
                    sprite_index = spr_ralsei_splat;
                
                emote = sprite_index;
                break;
            
            case "aqua":
                if (arg0 == 1)
                {
                    sprite_index = spr_aqua_sleevewave;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                if (arg0 == 2)
                {
                    sprite_index = spr_enemy_aqua_spin;
                    emote = sprite_index;
                    emote_speed = 0.25;
                }
                
                if (arg0 == 3)
                {
                    sprite_index = spr_aqua_shakehead;
                    emote = sprite_index;
                    emote_speed = 0.25;
                }
                
                if (arg0 == 4)
                {
                    sprite_index = spr_aqua_laugh;
                    emote = sprite_index;
                    emote_speed = 0.25;
                }
                
                if (arg0 == 5)
                {
                    sprite_index = spr_aqua_sit_wave;
                    emote = sprite_index;
                    emote_speed = 0.25;
                }
                
                if (arg0 == 6)
                {
                    sprite_index = spr_aqua_clapping;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                if (arg0 == 7)
                {
                    sprite_index = spr_aqua_toothy_grin;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 8)
                {
                    sprite_index = (lr_facing == 1) ? spr_aqua_grab_hold2 : spr_aqua_grab_hold;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 9)
                {
                    sprite_index = spr_aqua_collapsed;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 0)
                {
                    sprite_index = spr_aqua_confused;
                    emote = sprite_index;
                    emote_speed = 0;
                    image_index = 1;
                }
                
                break;
            
            case "pink":
                if (arg0 == 1)
                {
                    sprite_index = (lr_facing == 1) ? spr_pink_shocked_r : spr_pink_shocked;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                if (arg0 == 2)
                {
                    sprite_index = spr_pink_overjoyed_loop;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                if (arg0 == 3)
                {
                    sprite_index = spr_pink_peace_sign;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 4)
                {
                    sprite_index = spr_pink_sing_idle;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                if (arg0 == 5)
                {
                    sprite_index = spr_pink_front_angry;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 6)
                {
                    sprite_index = spr_pink_kneeling_crying_loop;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                if (arg0 == 7)
                {
                    sprite_index = spr_pink_kneeling_sad2;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 8)
                {
                    sprite_index = spr_pink_front_burnt;
                    emote = sprite_index;
                    emote_speed = 0;
                }
                
                if (arg0 == 9)
                {
                    sprite_index = spr_pink_front_ohoho;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                if (arg0 == 0)
                {
                    sprite_index = spr_pink_yelling;
                    emote = sprite_index;
                    emote_speed = 1/3;
                }
                
                break;
        }
    }
}

function draw_player_updated(arg0, arg1 = sprite_index, arg2 = image_index, arg3 = x, arg4 = y, arg5 = image_xscale, arg6 = image_yscale, arg7 = image_angle, arg8 = image_blend, arg9 = image_alpha)
{
    var yfix = 0;
    var divide = 1;
    
    if (!global.darkzone)
        divide = 2;
    
    switch (arg0)
    {
        case "chara":
        case "frisk":
            yfix = -6;
            break;
        
        case "susie":
            yfix = 9;
            break;
        
        case "ralsei":
            yfix = 7;
            break;
        
        case "noelle":
            yfix = 8;
            break;
    }
    
    if (object_index == obj_climb_kris)
        draw_sprite_ext(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    else
        draw_sprite_ext(arg1, arg2, arg3 - ((sprite_get_width(arg1) - (19 + sprite_get_xoffset(arg1))) / divide), arg4 - ((sprite_get_height(arg1) - (38 + sprite_get_yoffset(arg1))) / divide) - (yfix / divide), arg5, arg6, arg7, arg8, arg9);
}

function scr_notificationsend(arg0, arg1 = "Kris")
{
    with (obj_onlinecontroller)
    {
        if (array_length(notifications) == 0)
            alarm[0] = nottime;
        
        array_push(notifications, [arg0, arg1]);
    }
}

function findplayer()
{
    var foundit = obj_onlinecontroller;
    
    if (instance_exists(obj_mainchara_dash))
        foundit = obj_mainchara_dash;
    else if (instance_exists(obj_plat_player))
        foundit = obj_plat_player;
    else if (instance_exists(obj_climb_kris))
        foundit = obj_climb_kris;
    else if (instance_exists(obj_mainchara))
        foundit = obj_mainchara;
    
    if (instance_exists(obj_battlecontroller))
    {
        if (instance_exists(obj_date_heart))
            foundit = obj_date_heart;
        else if (instance_exists(obj_heart))
            foundit = obj_heart;
    }
    
    return foundit;
}

function online_receive_instructions(arg0, arg1, arg2)
{
    try
    {
        switch (arg2)
        {
            case 1:
                if (arg0.state == 2 && !instance_exists(obj_battlecontroller))
                    break;
                
                arg0.x = arg1.playerx;
                arg0.y = arg1.playery;
                
                if (arg0.state == 2 && instance_exists(obj_battlecontroller))
                {
                    arg0.x += camera_get_view_x(view_camera[0]);
                    arg0.y += camera_get_view_y(view_camera[0]);
                }
                
                arg0.platformer = arg1.platformer;
                arg0.sprite_index = arg1.playersprite;
                arg0.image_index = arg1.playerimageindex;
                arg0.image_xscale = arg1.playerxscale;
                arg0.image_yscale = arg1.playeryscale;
                arg0.image_speed = arg1.playerspeed;
                arg0.image_alpha = arg1.playeralpha;
                arg0.depth = arg1.playerdepth;
                break;
            
            case 2:
                arg0.nickname = arg1.playernickname;
                arg0.roomin = arg1.playerroom;
                arg0.character = arg1.playercharacter;
                arg0.state = arg1.playerstate;
                break;
        }
    }
    catch (e)
    {
        if (global.debugerrors == 1)
            scr_notificationsend(9, "");
        
        player_kick(arg0.idthing);
    }
}

function player_kick(arg0)
{
    if (instance_exists(obj_server))
    {
        network_destroy(arg0);
        var findsocket = ds_list_find_index(SocketList, arg0);
        
        if (findsocket >= 0)
            ds_list_delete(SocketList, findsocket);
    }
}

function onlinedataget(arg0 = obj_mainchara, arg1 = 1)
{
    switch (arg1)
    {
        case 1:
            var sentx = 0;
            var senty = 0;
            var platformer = false;
            var sentsprite = 0;
            var sentindex = 0;
            var sentxscale = 0;
            var sentyscale = 0;
            var sentspeed = 0;
            var sentalpha = 0;
            var sentdepth = 0;
            
            if (instance_exists(arg0))
            {
                platformer = arg0 == obj_plat_player;
                battle = arg0 == obj_heart || arg0 == obj_date_heart;
                
                if (arg0 == obj_climb_kris)
                {
                    sentx = arg0.x + arg0.drawx;
                    senty = arg0.y + arg0.drawy + arg0.drawoffsety;
                }
                else if (platformer)
                {
                    sentx = round(arg0.x - (arg0.sprite_offset_x * arg0.image_xscale));
                    senty = round(arg0.y - (arg0.sprite_offset_y * arg0.image_yscale));
                }
                else if (battle)
                {
                    sentx = arg0.x - camera_get_view_x(view_camera[0]);
                    senty = arg0.y - camera_get_view_y(view_camera[0]);
                }
                else
                {
                    sentx = arg0.x;
                    senty = arg0.y;
                }
                
                sentsprite = arg0.sprite_index;
                sentindex = arg0.image_index;
                sentxscale = arg0.image_xscale;
                sentyscale = arg0.image_yscale;
                sentspeed = arg0.image_speed;
                sentalpha = arg0.image_alpha;
                sentdepth = arg0.depth;
            }
            
            return 
            {
                playerx: sentx,
                playery: senty,
                platformer: platformer,
                playersprite: sentsprite,
                playerimageindex: sentindex,
                playerxscale: sentxscale,
                playeryscale: sentyscale,
                playerspeed: sentspeed,
                playeralpha: sentalpha,
                playerdepth: sentdepth
            };
            break;
        
        case 2:
            var sentnickname = "";
            var sentroom = 0;
            var sentcharacter = "";
            var sentstate = 0;
            
            if (instance_exists(arg0))
            {
                if (arg0.object_index != obj_charafake)
                {
                    sentnickname = global.playernickname;
                    sentroom = room;
                    sentcharacter = global.character;
                    sentstate = global.sendstate;
                }
                else
                {
                    sentnickname = arg0.nickname;
                    sentroom = arg0.roomin;
                    sentcharacter = arg0.character;
                    sentstate = arg0.state;
                }
            }
            
            return 
            {
                playernickname: sentnickname,
                playerroom: sentroom,
                playercharacter: sentcharacter,
                playerstate: sentstate
            };
            break;
    }
}

function array_contains_lts(arg0, arg1)
{
    var i = 0;
    var size = array_length(arg0);
    
    repeat (size)
    {
        if (arg0[i] == arg1)
            return 1;
        
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
            return i;
        
        i++;
    }
    
    return -1;
}

function scr_depth_legacy(arg0 = id, arg1 = 0)
{
    with (arg0)
        depth = 100000 - (((y + 14) * 10) + (sprite_height * 10) + (arg1 * 10));
}

function draw_battle_players(arg0 = false)
{
    draw_set_color(instance_exists(obj_server) ? c_orange : c_white);
    draw_set_font(fnt_small);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    var scale = 1.5;
    
    if (global.showyournickname && mysterycheck() == 1)
        draw_text_transformed(x + (sprite_width / 2), y - 22, global.playernickname, scale, scale, 0);
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    var index = 1;
    
    with (obj_charafake)
    {
        if (state != 2 || you)
            continue;
        
        var remX = x;
        var remY = y;
        
        with (other)
        {
            var sprite = spr_heartbullet;
            var rot = 0;
            
            if ((i++ % 3) == 1 && false)
            {
                sprite = spr_orangeheart;
                rot = -90;
            }
            else if ((i++ % 3) == 2 && false)
            {
                sprite = spr_yellowheart;
                rot = -90;
            }
            
            if (arg0)
                rot += 90;
            
            draw_sprite_ext(sprite, 0, remX, remY, 1, 1, rot, make_color_hsv(((index * 158) - 5) % 255, 255, 255), 1);
        }
        
        draw_set_color(c_white);
        
        if (instance_exists(obj_client))
        {
            if (ds_list_find_value(obj_client.clientsocketlist, 0) == idthing)
                draw_set_color(c_orange);
        }
        
        draw_set_font(fnt_small);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        scale = 1.5;
        
        if (global.shownicknames && mysterycheck() == 1)
            draw_text_transformed(x + (sprite_width / 2), y - 22, nickname, scale, scale, 0);
        
        draw_set_halign(fa_left);
        draw_set_color(c_white);
        index++;
    }
}

global.pvpMaxHealth = 100;
global.returningFromPVP = false;

function IsPVP()
{
    return room == room_plat_pvp_tree;
}

function ONLINE_DEBUG()
{
    return true;
}
