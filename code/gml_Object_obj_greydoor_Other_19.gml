global.interact = 3;
instance_create(0, 0, 1169);
audio_stop_all();
if (touched == 0)
{
    snd_play(213);
    alarm[2] = 8;
    touched = 1;
}
// fix this