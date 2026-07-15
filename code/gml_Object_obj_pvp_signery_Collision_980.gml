if (!interacted)
{
    snd_play(134);
    snd_play(764);
    scr_lerpvar("image_alpha", 1, 0, 30);
    interacted = true;
}
