var networkobj = networkvarsget(1);
var playerid = networkvarsget(2);
var netlist = networkvarsget(3);

if (networkobj == -4)
{
    if (global.interact == 10)
        global.interact = 0;
    
    exit;
}

if (ds_list_find_index(netlist, networkobj.partystatus) < 0)
{
    networkobj.partystatus = -4;
}
else
{
    var partycreatorinfo = getpartyinfo(networkobj.partystatus);
    
    if (networkobj.partystatus != playerid)
    {
        if (partycreatorinfo.partystatus != networkobj.partystatus)
            networkobj.partystatus = -4;
    }
}

if (global.playercount <= 1 && networkobj == obj_server)
{
    networkobj.declinerequest = 0;
    networkobj.partyinvite = -4;
    networkobj.partystatus = -4;
    networkobj.partyhostinfo = -4;
}

if (global.interact == 10)
{
    if (keyboard_check_pressed(vk_escape))
        global.interact = 0;
    
    if (keyboard_check_pressed(vk_enter))
    {
        global.interact = 0;
        
        if (acceptablemes(keyboard_string))
        {
            var nickcolor = 16440756;
            
            if (instance_exists(obj_server))
                nickcolor = 4235519;
            
            chatsendmessage(keyboard_string, global.playernickname, nickcolor);
            global.sentmessage += 1;
            global.saidmessage = keyboard_string;
        }
    }
}

if (global.key_chat && global.interact == 0)
{
    global.interact = 10;
    alarm[1] = 8;
    keyboard_string = "";
}

if (array_length(global.chatsenders) > 12)
    array_delete(global.chatsenders, 0, 1);

if (array_length(global.chatsenderstemp) > 10)
    array_delete(global.chatsenderstemp, 0, 1);

if (array_length(global.chatstay) > 12)
    array_delete(global.chatstay, 0, 1);

if (array_length(global.chattemp) > 10)
    array_delete(global.chattemp, 0, 1);

getplayerpartydata();
getmemberpartydata();
setplayerpartydata();
setcreatorpartydata();
scr_pvp();
