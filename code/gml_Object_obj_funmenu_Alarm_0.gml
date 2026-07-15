var px = -4;
var py = -4;
var player = findplayer();
if (player != 1754)
{
    px = player.x;
    py = player.y;
}
global.pvpmemo = [room, px, py, global.currentsong[0], global.darkzone];
scr_become_light();
mus_volume(global.currentsong[1], 0, 14);
room_goto(268);
instance_create(0, 0, 1311);
