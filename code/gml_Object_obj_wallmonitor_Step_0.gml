scr_depth();
if (active > 0)
{
    if (instance_exists(1198) && lit == 0)
    {
        if (distance_to_object(1198) < 50)
        {
            lit = 1;
            snd_play(535);
            sprite_index = 8578;
        }
    }
}
