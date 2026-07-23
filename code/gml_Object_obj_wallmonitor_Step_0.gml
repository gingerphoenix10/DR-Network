scr_depth();

if (active > 0)
{
    if (instance_exists(obj_mainchara) && lit == 0)
    {
        if (distance_to_object(obj_mainchara) < 50)
        {
            lit = 1;
            snd_play(snd_menumove);
            sprite_index = spr_monitor_lit;
        }
    }
}
