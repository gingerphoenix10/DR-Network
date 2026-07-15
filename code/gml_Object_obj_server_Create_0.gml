network_set_config(0, global.connecttimeout);
var Type = 0;
var Port = floor(real(global.port));
var IPAddress = global.ip;
var MaxClients = global.maxplayercount;
Server = network_create_server(Type, Port, MaxClients);
Socket = network_create_socket(Type);
isConnected = network_connect(Socket, IPAddress, Port);
var Size = 16384;
var BufType = 0;
var Alignment = 1;
Buffer = buffer_create(Size, BufType, Alignment);
SocketList = ds_list_create();
PlayerMap = ds_map_create();
global.Parties = ds_map_create();
initpartyinfo();
connected = 0;
global.playercount = 0;
depth = -5000;
global.chatcont = ds_map_create();
global.chatmanager = ds_map_create();
initpvpinfo();
global.pvp = ds_map_create();
global.pvpstarted = 0;

function ReceivedPacket(arg0, arg1)
{
    var buffer = arg0;
    var socket = arg1;
    var msgid = -4;
    try
    {
        msgid = buffer_read(buffer, 1);
    }
    catch (e)
    {
        if (global.debugerrors == 1)
        {
            scr_notificationsend(8, "");
            player_kick(socket);
        }
    }
    switch (msgid)
    {
        case -4:
            break;
        case 0:
            var clientversion = "";
            var kickprocedure = 0;
            try
            {
                clientversion = buffer_read(buffer, 11);
            }
            catch (e)
            {
                if (global.debugerrors == 1)
                {
                    scr_notificationsend(8, "");
                }
                kickprocedure = 1;
            }
            if (clientversion != global.onlineversion)
            {
                kickprocedure = 1;
            }
            if (kickprocedure)
            {
                buffer_seek(Buffer, 0, 0);
                buffer_write(Buffer, 1, 66);
                buffer_write(Buffer, 1, 3);
                network_send_packet(socket, Buffer, buffer_tell(Buffer));
            }
            break;
        case 1:
            var partydata = "";
            var pvpdata = "";
            var chatdata = "";
            var puppetdata = "";
            var puppetdata2 = "";
            var f = true;
            try
            {
                puppetdata = buffer_read(buffer, 11);
                puppetdata2 = buffer_read(buffer, 11);
                partydata = buffer_read(buffer, 11);
                pvpdata = buffer_read(buffer, 11);
                chatdata = buffer_read(buffer, 11);
            }
            catch (e)
            {
                if (global.debugerrors == 1)
                {
                    scr_notificationsend(8, "");
                }
            }
            var dataparsed = 0;
            buffer_seek(Buffer, 0, 0);
            buffer_write(Buffer, 1, 1);
            buffer_write(Buffer, 5, socket);
            buffer_write(Buffer, 5, ds_list_size(SocketList));
            var datapl = {};
            var datapl2 = {};
            var partyparse = {};
            var pvpparse = {};
            var chatparse = {};
            try
            {
                partyparse = json_parse(partydata);
                pvpparse = json_parse(pvpdata);
                chatparse = json_parse(chatdata);
                dataparsed = 1;
            }
            catch (e)
            {
                dataparsed = 0;
            }
            if (dataparsed == 1)
            {
                try
                {
                    ds_map_set(global.Parties, ds_list_find_value(SocketList, 0), 
                    {
                        possiblecreator: ds_list_find_value(SocketList, 0),
                        partystatus: partystatus,
                        partyinvite: partyinvite,
                        partyhostinfo: partyhostinfo
                    });
                    ds_map_set(global.Parties, socket, 
                    {
                        possiblecreator: socket,
                        partystatus: partyparse.sentpartystatus,
                        partyinvite: partyparse.sentpartyinvite,
                        partyhostinfo: partyparse.sentpartyhostinfo
                    });
                }
                catch (e)
                {
                    if (global.debugerrors == 1)
                    {
                        scr_notificationsend(8, "");
                    }
                    player_kick(socket);
                }
                try
                {
                    if (array_length(global.participants) > 0 && global.participants[0] == pvpparse.sentparticipates)
                    {
                        global.pvpmap = pvpparse.requestedmap;
                        var accessplstruct = ds_map_find_value(global.pvp, socket);
                    }
                    ds_map_set(global.pvp, ds_list_find_value(SocketList, 0), 
                    {
                        selectedmap: global.pvpmap,
                        lastHitNum: global.lastHitNum,
                        lastHitId: global.lastHitId,
                        eliminated: global.pvpeliminated
                    });
                    ds_map_set(global.pvp, socket, 
                    {
                        requestedmap: pvpparse.requestedmap,
                        lastHitNum: pvpparse.lastHitNum,
                        lastHitId: pvpparse.lastHitId,
                        eliminated: pvpparse.eliminated
                    });
                    if (pvpparse.lastHitNum == 0)
                    {
                        ds_map_set(global.hitsmap, socket, 
                        {
                            lastHitNum: pvpparse.lastHitNum,
                            lastHitId: pvpparse.lastHitId
                        });
                    }
                    else if (!ds_map_exists(global.hitsmap, socket) || ds_map_find_value(global.hitsmap, socket).lastHitNum < pvpparse.lastHitNum)
                    {
                        if (pvpparse.lastHitId == networkvarsget(2))
                        {
                            pvp_takehit(ds_map_find_value(PlayerMap, socket));
                        }
                        else if (ds_map_exists(PlayerMap, pvpparse.lastHitId))
                        {
                            ds_map_find_value(PlayerMap, pvpparse.lastHitId).iframes = 40;
                        }
                        ds_map_set(global.hitsmap, socket, 
                        {
                            lastHitNum: pvpparse.lastHitNum,
                            lastHitId: pvpparse.lastHitId
                        });
                    }
                    if (global.lastHitNum == 0)
                    {
                        ds_map_set(global.hitsmap, 0, 
                        {
                            lastHitNum: global.lastHitNum,
                            lastHitId: global.lastHitId
                        });
                    }
                    else if (!ds_map_exists(global.hitsmap, 0) || ds_map_find_value(global.hitsmap, 0).lastHitNum < global.lastHitNum)
                    {
                        if (ds_map_exists(PlayerMap, global.lastHitId))
                        {
                            ds_map_find_value(PlayerMap, global.lastHitId).iframes = 50;
                        }
                        ds_map_set(global.hitsmap, 0, 
                        {
                            lastHitNum: global.lastHitNum,
                            lastHitId: global.lastHitId
                        });
                    }
                    if (ds_map_exists(PlayerMap, socket) && instance_exists(ds_map_find_value(PlayerMap, socket)))
                    {
                        var plr = ds_map_find_value(PlayerMap, socket);
                        plr.eliminated = pvpparse.eliminated;
                    }
                }
                catch (e)
                {
                    if (global.debugerrors == 1)
                    {
                        scr_notificationsend(8, "");
                    }
                    player_kick(socket);
                }
                var sndfntpluse = 151;
                if (instance_exists(1198))
                {
                    sndfntpluse = obj_mainchara.sndfnt;
                }
                try
                {
                    ds_map_set(global.chatcont, ds_list_find_value(SocketList, 0), 
                    {
                        socket: networkvarsget(2),
                        wasitsent: global.sentmessage,
                        sender: global.playernickname,
                        message: global.saidmessage,
                        sndfnt: sndfntpluse
                    });
                    ds_map_set(global.chatcont, socket, 
                    {
                        socket: socket,
                        wasitsent: chatparse.wasitsent,
                        sender: chatparse.sender,
                        message: chatparse.message,
                        sndfnt: chatparse.sndfnt
                    });
                    var accessplstruct = ds_map_find_value(global.chatcont, socket);
                    if (accessplstruct.wasitsent > 0 && ds_map_find_value(global.chatmanager, socket) < accessplstruct.wasitsent)
                    {
                        var nickcolor = 13619151;
                        ds_map_set(global.chatmanager, socket, accessplstruct.wasitsent);
                        chatsendmessage(accessplstruct.message, accessplstruct.sender, nickcolor, accessplstruct.sndfnt);
                    }
                }
                catch (e)
                {
                    if (global.debugerrors == 1)
                    {
                        scr_notificationsend(8, "");
                    }
                    player_kick(socket);
                }
                if (!array_contains_lts_sucks(global.participants, global.participates) && global.participates != -4)
                {
                    array_push(global.participants, global.participates);
                }
                if (array_contains_lts_sucks(global.participants, networkvarsget(2)))
                {
                    if (global.participates == -4)
                    {
                        array_delete(global.participants, array_get_index_lts(global.participants, networkvarsget(2)), 1);
                    }
                }
                try
                {
                    if (!array_contains_lts_sucks(global.participants, pvpparse.sentparticipates) && pvpparse.sentparticipates != -4)
                    {
                        array_push(global.participants, pvpparse.sentparticipates);
                    }
                    if (array_contains_lts_sucks(global.participants, socket))
                    {
                        if (pvpparse.sentparticipates == -4)
                        {
                            array_delete(global.participants, array_get_index_lts(global.participants, socket), 1);
                        }
                    }
                }
                catch (e)
                {
                    if (global.debugerrors == 1 && true)
                    {
                        scr_notificationsend(8, "");
                    }
                    player_kick(socket);
                }
            }
            var partiesmap = json_encode(global.Parties);
            var pvpstruct = json_encode(global.pvp);
            buffer_write(Buffer, 11, partiesmap);
            buffer_write(Buffer, 11, pvpstruct);
            buffer_write(Buffer, 11, json_stringify(global.serverpvpinfo));
            buffer_write(Buffer, 11, json_encode(global.chatcont));
            for (var i = 0; i < ds_list_size(SocketList); i++)
            {
                var v = ds_map_find_value(PlayerMap, ds_list_find_value(SocketList, i));
                var playinst = findplayer();
                var valuesend = 0;
                if (i != 0)
                {
                    playinst = v;
                    valuesend = i;
                }
                var bufferdata = onlinedataget(playinst, 1);
                var bufferdata2 = onlinedataget(playinst, 2);
                buffer_write(Buffer, 6, ds_list_find_value(SocketList, valuesend));
                buffer_write(Buffer, 11, json_stringify(bufferdata));
                buffer_write(Buffer, 11, json_stringify(bufferdata2));
                buffer_write(Buffer, 6, i);
                buffer_write(Buffer, 6, ds_list_find_value(SocketList, i));
                if (partystatus == -4 && ds_map_size(global.Parties) > 0)
                {
                    var plthing = ds_map_find_value(global.Parties, ds_list_find_value(SocketList, i));
                    if (is_struct(plthing))
                    {
                        try
                        {
                            if (plthing.partyinvite == ds_list_find_value(SocketList, 0) && global.interact == 0 && !instance_exists(1745) && !declinerequest)
                            {
                                with (instance_create(x, y, 1745))
                                {
                                    inviter = plthing.partystatus;
                                    global.interact = 9;
                                }
                            }
                        }
                        catch (e)
                        {
                            if (global.debugerrors == 1)
                            {
                                scr_notificationsend(8, "");
                            }
                            player_kick(socket);
                        }
                    }
                }
            }
            if (global.playercount < ds_list_size(SocketList))
            {
                var idthingy = ds_list_find_value(SocketList, global.playercount);
                var p = instance_create_depth(0, 0, -1000, obj_charafake);
                with (p)
                {
                    assignednum = global.playercount;
                    idthing = idthingy;
                }
                global.playercount += 1;
                ds_map_add(PlayerMap, idthingy, p);
                ds_map_add(global.chatmanager, idthingy, 0);
            }
            var find_player = ds_map_find_value(PlayerMap, socket);
            if (instance_exists(find_player))
            {
                try
                {
                    datapl = json_parse(puppetdata);
                    datapl2 = json_parse(puppetdata2);
                    dataparsed = 1;
                }
                catch (e)
                {
                    dataparsed = 0;
                }
                if (puppetdata != "" && dataparsed)
                {
                    if (datapl2.playerroom == room)
                    {
                        find_player.visible = 1;
                    }
                    else
                    {
                        find_player.visible = 0;
                    }
                    online_receive_instructions(find_player, datapl, 1);
                    online_receive_instructions(find_player, datapl2, 2);
                    if (find_player.fullyjoined == 0)
                    {
                        if (ds_list_find_index(networkvarsget(3), socket) > ds_list_find_index(networkvarsget(3), networkvarsget(2)))
                        {
                            scr_notificationsend(1, datapl2.playernickname);
                        }
                        find_player.fullyjoined = 1;
                    }
                }
            }
            network_send_packet(socket, Buffer, buffer_tell(Buffer));
            break;
    }
}
