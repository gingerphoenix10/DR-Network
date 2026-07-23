event_inherited();
image_speed = 0.2;

if (read >= 1 && global.doorstage[keytype] == 1)
{
    snd_play(snd_noise);
    message[0] = alreadyturnedmes;
    keyin = 1;
    global.doorstage[keytype] = 2;
}
