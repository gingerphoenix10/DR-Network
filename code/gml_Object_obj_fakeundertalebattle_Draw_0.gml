if (battleanim == 0)
{
    draw_sprite(1910, 0, obj_mainchara.x + 10, obj_mainchara.y - 3);
}
if (battleanim >= 1)
{
    draw_set_color(0);
    draw_rectangle(0, 0, 320, 240, 0);
    draw_set_color(16777215);
    if (battleanim == 1)
    {
        draw_player_updated(global.character, obj_mainchara.sprite_index, obj_mainchara.image_index, obj_mainchara.x, obj_mainchara.y, obj_mainchara.image_xscale, obj_mainchara.image_yscale, obj_mainchara.image_angle, obj_mainchara.image_blend, obj_mainchara.image_alpha);
    }
    draw_sprite_ext(4862, 0, heartx, hearty, 1, 1, 0, 16777215, alphaheart[0]);
}
