network_set_config(network_config_connect_timeout, global.connecttimeout);
var Type = 0;
var Port = floor(real(global.port));
var IPAddress = global.ip;

if (global.goingpublic)
{
    Port = floor(real(global.publicport));
    IPAddress = global.publicip;
    global.goingpublic = 0;
}

Socket = network_create_socket(Type);
isConnected = network_connect(Socket, IPAddress, Port);
var Size = 16384;
var BufType = 0;
var Alignment = 1;
Ping = -4;
Result = -4;
socketid = 0;
serverid = -4;
othersockid = 0;
Buffer = buffer_create(Size, BufType, Alignment);
sockloop = 0;
global.playercount = 0;
value = -4;
clientsocketlist = ds_list_create();
clientplayermap = ds_map_create();
global.Parties = -4;
initpartyinfo();
depth = -5000;
changerequest = 0;
global.chatcont = -4;
global.chatmanager = ds_map_create();
infotype = 0;
initpvpinfo();
global.pvpstarted = 0;

function ReceivedPacket(arg0)
{
    var buffer = arg0;
    var msgid = -4;
    
    try
    {
        msgid = buffer_read(buffer, buffer_u8);
    }
    catch (e)
    {
        scr_notificationsend(8, "");
        scr_notificationsend(2, "");
        instance_destroy();
    }
    
    switch (msgid)
    {
        case -4:
            break;
        
        case 66:
            var kickreason = 2;
            
            try
            {
                kickreason = buffer_read(buffer, buffer_u8);
            }
            catch (e)
            {
                scr_notificationsend(8, "");
            }
            
            scr_notificationsend(kickreason, "");
            
            if (instance_exists(obj_realonlinemenu))
            {
                with (obj_realonlinemenu)
                {
                    buttons[selected] = "Error";
                    snd_play(snd_error);
                    color = c_red;
                }
            }
            
            instance_destroy();
            break;
        
        case 1:
            ds_list_clear(clientsocketlist);
            
            try
            {
                socketid = buffer_read(buffer, buffer_u32);
                sockloop = buffer_read(buffer, buffer_u32);
            }
            catch (e)
            {
                if (global.debugerrors == 1)
                    scr_notificationsend(8, "");
            }
            
            var dataparsed = 0;
            var datapl = {};
            var datapl2 = {};
            var chatsvdat = -4;
            var chatcldat = -4;
            var parties = -4;
            var chatdat = -4;
            var partiesreceive = "";
            var pvpreceive = "";
            var pvp2receive = "";
            var chatreceive = "";
            
            try
            {
                partiesreceive = buffer_read(buffer, buffer_string);
                pvpreceive = buffer_read(buffer, buffer_string);
                pvp2receive = buffer_read(buffer, buffer_string);
                chatreceive = buffer_read(buffer, buffer_string);
            }
            catch (e)
            {
                if (global.debugerrors == 1)
                    scr_notificationsend(8, "");
            }
            
            try
            {
                parties = json_parse(partiesreceive);
                pvp = json_parse(pvpreceive);
                global.serverpvpinfo = json_parse(pvp2receive);
                chatdat = json_parse(chatreceive);
                dataparsed = 1;
            }
            catch (e)
            {
                dataparsed = 0;
            }
            
            global.chatcont = chatdat;
            global.Parties = parties;
            global.pvp = pvp;
            
            for (var i = 0; i < sockloop; i++)
            {
                var playerindex = 0;
                
                try
                {
                    playerindex = buffer_read(buffer, buffer_s32);
                }
                catch (e)
                {
                    if (global.debugerrors == 1)
                        scr_notificationsend(8, "");
                }
                
                var v = ds_map_find_value(clientplayermap, playerindex);
                var puppetdata = "";
                var puppetdata2 = "";
                
                try
                {
                    puppetdata = buffer_read(buffer, buffer_string);
                    puppetdata2 = buffer_read(buffer, buffer_string);
                }
                catch (e)
                {
                    if (global.debugerrors == 1)
                        scr_notificationsend(8, "");
                }
                
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
                
                if (instance_exists(v) && dataparsed)
                {
                    var roomio = datapl2.playerroom;
                    
                    if (roomio == room)
                        v.visible = 1;
                    else
                        v.visible = 0;
                    
                    online_receive_instructions(v, datapl, 1);
                    online_receive_instructions(v, datapl2, 2);
                    v.fullyjoined = 1;
                }
                
                var pos = 0;
                value = 2;
                
                try
                {
                    pos = buffer_read(buffer, buffer_s32);
                    value = buffer_read(buffer, buffer_s32);
                }
                catch (e)
                {
                    if (global.debugerrors == 1)
                        scr_notificationsend(8, "");
                }
                
                if (is_struct(global.pvp))
                {
                    var datastruct = variable_struct_get(global.pvp, value);
                    
                    if (is_struct(datastruct))
                    {
                        if (value == serverid)
                            global.pvpmap = datastruct.selectedmap;
                        
                        if (datastruct.lastHitNum == 0)
                        {
                            ds_map_set(global.hitsmap, value, 
                            {
                                lastHitNum: datastruct.lastHitNum,
                                lastHitId: datastruct.lastHitId
                            });
                        }
                        else if (!ds_map_exists(global.hitsmap, value) || ds_map_find_value(global.hitsmap, value).lastHitNum < datastruct.lastHitNum)
                        {
                            if (datastruct.lastHitId == networkvarsget(2))
                                pvp_takehit(ds_map_find_value(clientplayermap, value));
                            else if (ds_map_exists(clientplayermap, datastruct.lastHitId))
                                ds_map_find_value(clientplayermap, datastruct.lastHitId).iframes = 50;
                            
                            ds_map_set(global.hitsmap, value, 
                            {
                                lastHitNum: datastruct.lastHitNum,
                                lastHitId: datastruct.lastHitId
                            });
                        }
                        
                        if (ds_map_exists(clientplayermap, value) && instance_exists(ds_map_find_value(clientplayermap, value)))
                        {
                            var plr = ds_map_find_value(clientplayermap, value);
                            plr.eliminated = datastruct.eliminated;
                        }
                    }
                }
                
                if (is_struct(global.chatcont))
                {
                    var accessplstruct = variable_struct_get(global.chatcont, value);
                    var nickcolor = 13619151;
                    
                    if (value == serverid)
                        nickcolor = 4235519;
                    
                    if (is_struct(accessplstruct))
                    {
                        if (accessplstruct.wasitsent > 0 && value != networkvarsget(2) && ds_map_find_value(global.chatmanager, value) < accessplstruct.wasitsent)
                        {
                            ds_map_set(global.chatmanager, value, accessplstruct.wasitsent);
                            chatsendmessage(accessplstruct.message, accessplstruct.sender, nickcolor, accessplstruct.sndfnt);
                        }
                    }
                }
                
                if (global.Parties != -4 && partystatus == -4)
                {
                    var plthing = variable_struct_get(global.Parties, string(value));
                    
                    if (is_struct(plthing))
                    {
                        if (plthing.partyinvite == socketid && global.interact == 0 && !instance_exists(obj_invitemenu) && !declinerequest)
                        {
                            with (instance_create(x, y, obj_invitemenu))
                            {
                                inviter = plthing.partystatus;
                                global.interact = 9;
                            }
                        }
                    }
                }
                
                if (pos == 0)
                    serverid = value;
                
                ds_list_set(clientsocketlist, pos, value);
            }
            
            if (global.playercount < ds_list_size(clientsocketlist))
            {
                var idthingy = ds_list_find_value(clientsocketlist, global.playercount);
                var p = instance_create_depth(0, 0, -1000, obj_charafake);
                
                with (p)
                {
                    assignednum = global.playercount;
                    idthing = idthingy;
                }
                
                global.playercount += 1;
                ds_map_add(clientplayermap, idthingy, p);
                ds_map_add(global.chatmanager, idthingy, 0);
            }
            
            break;
    }
}
