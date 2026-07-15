function scr_textsound()
{
    playtextsound = 1;
    if (button2_h() == 1)
    {
        var dontplaysound = true;
        if (variable_instance_exists(id, "runcheck"))
        {
            if (runcheck)
            {
                dontplaysound = false;
            }
        }
        if (dontplaysound)
        {
            playtextsound = 0;
        }
    }
    if (skippable == 0)
    {
        playtextsound = 1;
    }
    if (playtextsound == 1)
    {
        if (rate <= 2)
        {
            getchar = string_char_at(mystring, pos);
        }
        else
        {
            getchar = string_char_at(mystring, pos - 1);
        }
        play = 1;
        playcheck = 0;
        if (getchar == "&" || getchar == "\n")
        {
            if (rate < 3)
            {
                playcheck = 1;
                getchar = string_char_at(mystring, pos + 1);
            }
            else
            {
                play = 0;
            }
        }
        if (getchar == " ")
        {
            play = 0;
        }
        if (getchar == "^")
        {
            play = 0;
        }
        if (getchar == "!")
        {
            play = 0;
        }
        if (getchar == ".")
        {
            play = 0;
        }
        if (getchar == "?")
        {
            play = 0;
        }
        if (getchar == ",")
        {
            play = 0;
        }
        if (getchar == ":")
        {
            play = 0;
        }
        if (getchar == "/")
        {
            play = 0;
        }
        if (getchar == "\\")
        {
            play = 0;
        }
        if (getchar == "|")
        {
            play = 0;
        }
        if (getchar == "*")
        {
            play = 0;
        }
        if (play == 1)
        {
            if (textsound == 146)
            {
                audio_stop_sound(281);
                qv = snd_play(281);
                qp = 0.9 + random(0.15);
                snd_pitch(qv, qp);
                sound_timer = 2;
            }
            else if (textsound == 283)
            {
                audio_stop_sound(284);
                snd_play_x(284, 0.8, 1.2);
                sound_timer = 2;
            }
            else if (textsound == 269)
            {
                audio_stop_sound(269);
                qv = snd_play(269);
                sound_timer = 2;
            }
            else if (textsound == 765)
            {
                snd_stop(765);
                snd_stop(766);
                snd_stop(767);
                snd_stop(768);
                snd_stop(769);
                snd_stop(770);
                snd_stop(771);
                var rnsound = floor(random(7));
                switch (rnsound)
                {
                    case 0:
                        qv = snd_play(765);
                        break;
                    case 1:
                        qv = snd_play(766);
                        break;
                    case 2:
                        qv = snd_play(767);
                        break;
                    case 3:
                        qv = snd_play(768);
                        break;
                    case 4:
                        qv = snd_play(769);
                        break;
                    case 5:
                        qv = snd_play(770);
                        break;
                    case 6:
                        qv = snd_play(771);
                        break;
                }
                sound_timer = 2;
            }
            else if (textsound == 107)
            {
                if (global.voiceclipmode == 0)
                {
                    sound_timer = 1;
                }
                if (global.voiceclipmode == 1)
                {
                    if (!snd_is_playing(global.voiceclip))
                    {
                        snd_play(global.voiceclip);
                    }
                    sound_timer = 1;
                }
                if (global.voiceclipmode == 2)
                {
                    audio_stop_sound(107);
                    audio_stop_sound(50);
                    audio_stop_sound(723);
                    qv = snd_play_x(choose(107, 50, 723), 1, 0.9 + random(0.15));
                    sound_timer = 3;
                }
            }
            else if (textsound == 671)
            {
                if (global.voiceclipmode == 0)
                {
                    sound_timer = 1;
                }
                if (global.voiceclipmode == 1)
                {
                    if (!snd_is_playing(global.voiceclip))
                    {
                        snd_play(global.voiceclip);
                    }
                    sound_timer = 1;
                }
                if (global.voiceclipmode == 2)
                {
                    audio_stop_sound(671);
                    snd_play_x(671, 1, 0.94);
                    sound_timer = 3;
                }
            }
            else if (textsound == 643)
            {
                var rand = irandom(8) + 1;
                if (global.flag[1054] <= 0)
                {
                    global.flag[1054] = 1;
                }
                var pitchrandom = (0.86 + random(0.35)) * global.flag[1054];
                var soundindex = "snd_tv_voice_short";
                if (rand >= 2)
                {
                    soundindex += ("_" + string(rand));
                }
                soundindex = asset_get_index(soundindex);
                audio_stop_sound(643);
                audio_stop_sound(593);
                audio_stop_sound(737);
                audio_stop_sound(67);
                audio_stop_sound(686);
                audio_stop_sound(152);
                audio_stop_sound(43);
                audio_stop_sound(732);
                audio_stop_sound(629);
                snd_play_x(soundindex, 0.7, pitchrandom);
                sound_timer = 3;
            }
            else if (textsound == 272)
            {
                if (room == 21)
                {
                    if (i_ex(1686) && obj_ch5_LW20W_handoff.failed == false)
                    {
                        var pitch = 1;
                        with (1686)
                        {
                            pitch = random_range(lowpitch, highpitch);
                        }
                        snd_play(textsound, 1, pitch);
                    }
                    else if (i_ex(493))
                    {
                        var max_pitch = obj_ch5_LW20W.voice_pitch;
                        if (max_pitch > 0)
                        {
                            var pitchrandom = random(max_pitch);
                            snd_play_x(textsound, 1, 1 + pitchrandom);
                        }
                        else
                        {
                            snd_play(textsound);
                        }
                    }
                    else
                    {
                        snd_play(textsound);
                    }
                }
                else if (room == 13)
                {
                    audio_stop_sound(203);
                    snd_play(203);
                }
                else
                {
                    snd_play(textsound);
                }
            }
            else
            {
                snd_play(textsound);
            }
            with (1172)
            {
                mouthmove = 1;
            }
            miniface_pos++;
        }
    }
}
