draw_self();

if (sinkon)
{
    anim += 1;
    draw_sprite(spr_sink_water, floor(anim / 3), x + 10, y);
}
