if (switchingPVP)
    exit;

var curnetobj = networkvarsget(1);
var dslistthing = networkvarsget(3);
var dsmapthing = networkvarsget(4);

if (curnetobj == -4)
    exit;

if (idthing != ds_list_find_value(dslistthing, 0))
{
    ds_map_delete(dsmapthing, idthing);
    ds_map_delete(global.chatmanager, idthing);
    
    if (instance_exists(obj_server))
    {
        ds_map_delete(global.Parties, idthing);
        
        if (array_contains_lts_sucks(global.participants, idthing) == 1)
            array_delete(global.participants, array_get_index_lts(global.participants, idthing), 1);
        
        if (array_contains_lts_sucks(global.eliminated, idthing) == 1)
            array_delete(global.eliminated, array_get_index_lts(global.eliminated, idthing), 1);
    }
    
    global.playercount -= 1;
}

if (fullyjoined)
    scr_notificationsend(0, nickname);

event_inherited();
