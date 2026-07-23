if (you)
{
    var player = findplayer();
    
    if (instance_exists(player))
    {
        nickname = global.playernickname;
        x = player.x;
        y = player.y;
    }
    
    exit;
}

event_inherited();
scr_fakespr();
var curobject = networkvarsget(1);
var curplayerid = networkvarsget(2);
var curdslist = networkvarsget(3);
var curdsmap = networkvarsget(4);

if (instance_exists(obj_client))
{
    if (obj_client.Result == -1)
        instance_destroy();
}
else if (!instance_exists(obj_client) && !instance_exists(obj_server))
{
    instance_destroy();
}

if (state == 2)
{
    if (state_index < (sprite_get_number(battlestance) - 1))
        state_index += 0.5;
}
else if (state == 1)
{
    if (state_index < sprite_get_number(cutscenewait))
        state_index += 0.2;
    else
        state_index = 0;
}
else
{
    state_index = 0;
}

if (curdslist != -4)
{
    if (ds_list_find_index(curdslist, idthing) == -1)
        instance_destroy();
    
    if (idthing == curplayerid)
        you = 1;
    
    if (instance_exists(obj_client))
    {
        if (fullyjoined && !sendmessage)
        {
            if (ds_list_find_index(networkvarsget(3), idthing) > ds_list_find_index(networkvarsget(3), networkvarsget(2)))
                scr_notificationsend(1, nickname);
            
            sendmessage = 1;
        }
    }
}
