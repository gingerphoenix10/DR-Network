var map = networkvarsget(4);
if (map == -4)
{
    exit;
}
var _size = ds_map_size(map);
var _key = ds_map_find_first(map);
for (var i = 0; i < _size; i++)
{
    var player = ds_map_find_value(map, _key);
    var upgradeToEnemy = IsPVP() && (!instance_exists(player) || (player.roomin == room && !player.you && player.object_index == obj_charafake && !player.eliminated && !global.pvpeliminated));
    var downgradePlayer = player.object_index == 1771 && (!IsPVP() || player.roomin != room || player.eliminated || global.pvpeliminated);
    if (upgradeToEnemy)
    {
        var enemy = instance_create_depth(0, 0, -1000, 1771);
        if (instance_exists(player))
        {
            player.switchingPVP = true;
            with (enemy)
            {
                assignednum = player.assignednum;
                idthing = player.idthing;
                fullyjoined = player.fullyjoined;
            }
        }
        else
        {
            with (enemy)
            {
                idthing = _key;
                fullyjoined = true;
            }
        }
        ds_map_set(map, _key, enemy);
        if (instance_exists(player))
        {
            instance_destroy(player);
        }
    }
    else if (downgradePlayer)
    {
        var newPlayer = instance_create_depth(0, 0, -1000, obj_charafake);
        if (instance_exists(player))
        {
            player.switchingPVP = true;
            with (newPlayer)
            {
                assignednum = player.assignednum;
                idthing = player.idthing;
                fullyjoined = player.fullyjoined;
                eliminated = player.eliminated;
            }
        }
        else
        {
            with (newPlayer)
            {
                idthing = _key;
                fullyjoiend = true;
                eliminated = true;
            }
        }
        ds_map_set(map, _key, newPlayer);
        if (instance_exists(player))
        {
            instance_destroy(player);
        }
    }
    _key = ds_map_find_next(map, _key);
}
if (global.pvpeliminated)
{
    with (910)
    {
        custom_paused = true;
        paused = true;
        player_visible = false;
        visible = false;
    }
}
