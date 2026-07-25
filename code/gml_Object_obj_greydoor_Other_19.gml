global.interact = 3;
instance_create(0, 0, obj_fadeout);
audio_stop_all();

if (touched == 0)
{
    snd_play(snd_dooropen);
    alarm[2] = 8;
    touched = 1;
}