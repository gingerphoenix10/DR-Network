var type_event = ds_map_find_value(async_load, "type");
switch (type_event)
{
    case 3:
        var buffer = ds_map_find_value(async_load, "buffer");
        buffer_seek(buffer, 0, 0);
        ReceivedPacket(buffer);
        break;
}
