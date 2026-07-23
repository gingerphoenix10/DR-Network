var _x = 0;
var _y = 0;

if (i_ex(obj_pink_enemy) && obj_pink_enemy.datecount == 3)
    _x = 2;

if (i_ex(obj_pink_enemy) && obj_pink_enemy.datecount == 3)
    _y = -23;

if (i_ex(obj_purplecontrols) && obj_purplecontrols.life_time > 0)
{
}
else
{
    draw_battle_players();
    draw_sprite_ext(sprite_index, image_index, (x - 10) + _x, (y - 10) + _y, image_xscale, image_yscale, 0, c_white, image_alpha);
}
