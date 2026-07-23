function scr_textsound()
{
    playtextsound = 1;
    
    if (button2_h() == 1)
    {
        var dontplaysound = true;
        
        if (variable_instance_exists(id, "runcheck"))
        {
            if (runcheck)
                dontplaysound = false;
        }
        
        if (dontplaysound)
            playtextsound = 0;
    }
    
    if (skippable == 0)
        playtextsound = 1;
    
    if (playtextsound == 1)
    {
        if (rate <= 2)
            getchar = string_char_at(mystring, pos);
        else
            getchar = string_char_at(mystring, pos - 1);
        
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
            play = 0;
        
        if (getchar == "^")
            play = 0;
        
        if (getchar == "!")
            play = 0;
        
        if (getchar == ".")
            play = 0;
        
        if (getchar == "?")
            play = 0;
        
        if (getchar == ",")
            play = 0;
        
        if (getchar == ":")
            play = 0;
        
        if (getchar == "/")
            play = 0;
        
        if (getchar == "\\")
            play = 0;
        
        if (getchar == "|")
            play = 0;
        
        if (getchar == "*")
            play = 0;
        
        if (play == 1)
        {
            if (textsound == snd_txtq)
            {
                audio_stop_sound(snd_txtq_2);
                qv = snd_play(snd_txtq_2);
                qp = 0.9 + random(0.15);
                snd_pitch(qv, qp);
                sound_timer = 2;
            }
            else if (textsound == snd_txtspam)
            {
                audio_stop_sound(snd_txtspam2);
                snd_play_x(snd_txtspam2, 0.8, 1.2);
                sound_timer = 2;
            }
            else if (textsound == snd_txtsans)
            {
                audio_stop_sound(snd_txtsans);
                qv = snd_play(snd_txtsans);
                sound_timer = 2;
            }
            else if (textsound == snd_wngdng1)
            {
                snd_stop(snd_wngdng1);
                snd_stop(snd_wngdng2);
                snd_stop(snd_wngdng3);
                snd_stop(snd_wngdng4);
                snd_stop(snd_wngdng5);
                snd_stop(snd_wngdng6);
                snd_stop(snd_wngdng7);
                var rnsound = floor(random(7));
                
                switch (rnsound)
                {
                    case 0:
                        qv = snd_play(snd_wngdng1);
                        break;
                    
                    case 1:
                        qv = snd_play(snd_wngdng2);
                        break;
                    
                    case 2:
                        qv = snd_play(snd_wngdng3);
                        break;
                    
                    case 3:
                        qv = snd_play(snd_wngdng4);
                        break;
                    
                    case 4:
                        qv = snd_play(snd_wngdng5);
                        break;
                    
                    case 5:
                        qv = snd_play(snd_wngdng6);
                        break;
                    
                    case 6:
                        qv = snd_play(snd_wngdng7);
                        break;
                }
                
                sound_timer = 2;
            }
            else if (textsound == snd_flowery_voicenoise_1)
            {
                if (global.voiceclipmode == 0)
                    sound_timer = 1;
                
                if (global.voiceclipmode == 1)
                {
                    if (!snd_is_playing(global.voiceclip))
                        snd_play(global.voiceclip);
                    
                    sound_timer = 1;
                }
                
                if (global.voiceclipmode == 2)
                {
                    audio_stop_sound(snd_flowery_voicenoise_1);
                    audio_stop_sound(snd_flowery_voicenoise_2);
                    audio_stop_sound(snd_flowery_voicenoise_3);
                    qv = snd_play_x(choose(snd_flowery_voicenoise_1, snd_flowery_voicenoise_2, snd_flowery_voicenoise_3), 1, 0.9 + random(0.15));
                    sound_timer = 3;
                }
            }
            else if (textsound == snd_flowery_voicenoise_loop)
            {
                if (global.voiceclipmode == 0)
                    sound_timer = 1;
                
                if (global.voiceclipmode == 1)
                {
                    if (!snd_is_playing(global.voiceclip))
                        snd_play(global.voiceclip);
                    
                    sound_timer = 1;
                }
                
                if (global.voiceclipmode == 2)
                {
                    audio_stop_sound(snd_flowery_voicenoise_loop);
                    snd_play_x(snd_flowery_voicenoise_loop, 1, 0.94);
                    sound_timer = 3;
                }
            }
            else if (textsound == snd_tv_voice_short)
            {
                var rand = irandom(8) + 1;
                
                if (global.flag[1054] <= 0)
                    global.flag[1054] = 1;
                
                var pitchrandom = (0.86 + random(0.35)) * global.flag[1054];
                var soundindex = "snd_tv_voice_short";
                
                if (rand >= 2)
                    soundindex += ("_" + string(rand));
                
                soundindex = asset_get_index(soundindex);
                audio_stop_sound(snd_tv_voice_short);
                audio_stop_sound(snd_tv_voice_short_2);
                audio_stop_sound(snd_tv_voice_short_3);
                audio_stop_sound(snd_tv_voice_short_4);
                audio_stop_sound(snd_tv_voice_short_5);
                audio_stop_sound(snd_tv_voice_short_6);
                audio_stop_sound(snd_tv_voice_short_7);
                audio_stop_sound(snd_tv_voice_short_8);
                audio_stop_sound(snd_tv_voice_short_9);
                snd_play_x(soundindex, 0.7, pitchrandom);
                sound_timer = 3;
            }
            else if (textsound == snd_txtnoe)
            {
                if (room == room_beach)
                {
                    if (i_ex(obj_ch5_LW20W_handoff) && obj_ch5_LW20W_handoff.failed == false)
                    {
                        var pitch = 1;
                        
                        with (obj_ch5_LW20W_handoff)
                            pitch = random_range(lowpitch, highpitch);
                        
                        snd_play(textsound, 1, pitch);
                    }
                    else if (i_ex(obj_ch5_LW20W))
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
                else if (room == room_krisroom)
                {
                    audio_stop_sound(snd_txtnoe_echo);
                    snd_play(snd_txtnoe_echo);
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
            
            with (obj_face_parent)
                mouthmove = 1;
            
            miniface_pos++;
        }
    }
}
