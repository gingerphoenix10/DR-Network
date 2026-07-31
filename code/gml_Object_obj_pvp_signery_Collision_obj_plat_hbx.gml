// The script in obj_pvp_signery.json needs to be updated when this index changes
if (!interacted)
{
    snd_play(snd_flowery_voiceclip_flowery, 0.75);
    snd_play(snd_mysterygo, 0.2);
    scr_lerpvar("image_alpha", 1, 0, 30);
    interacted = true;
}
