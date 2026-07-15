var type_event = ds_map_find_value(async_load, "type");
switch (type_event)
{
    case 1:
        var socket = ds_map_find_value(async_load, "socket");
        ds_list_add(SocketList, socket);
        break;
    case 2:
        var socket = ds_map_find_value(async_load, "socket");
        var findsocket = ds_list_find_index(SocketList, socket);
        if (findsocket >= 0)
        {
            ds_list_delete(SocketList, findsocket);
            if (socket == 2)
            {
                scr_notificationsend(10, "");
                instance_destroy();
            }
        }
        break;
    case 3:
        var buffer = ds_map_find_value(async_load, "buffer");
        var socket = ds_map_find_value(async_load, "id");
        buffer_seek(buffer, 0, 0);
        ReceivedPacket(buffer, socket);
        break;
}
