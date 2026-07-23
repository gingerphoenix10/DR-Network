if (!interacted)
{
    snd_play(snd_flowery_voiceclip_flowery);
    snd_play(snd_mysterygo);
    scr_lerpvar("image_alpha", 1, 0, 30);
    interacted = true;
}
