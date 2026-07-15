function scr_anyface(arg0, arg1, arg2)
{
    _speakerC = arg0;
    _msgno = arg1;
    _emotion = arg2;
    if (is_real(arg2))
    {
        if (arg2 >= 10)
        {
            if (arg2 < 36)
            {
                _emotion = chr(55 + arg2);
            }
            else
            {
                emotion = chr(61 + arg2);
            }
        }
    }
    _speaker = string_lower(_speakerC);
    msgsetsub(arg1, "* Face ~1 not found/", _speaker);
    if (_speaker == "susie" || _speaker == "sus")
    {
        scr_susface(_msgno, _emotion);
    }
    if (_speaker == "ralsei" || _speaker == "ral")
    {
        scr_ralface(_msgno, _emotion);
    }
    if (_speaker == "noelle" || _speaker == "noe")
    {
        scr_noeface(_msgno, _emotion);
    }
    if (_speaker == "toriel" || _speaker == "tor")
    {
        scr_torface(_msgno, _emotion);
    }
    if (_speaker == "asgore" || _speaker == "asg")
    {
        scr_asgface(_msgno, _emotion);
    }
    if (_speaker == "king" || _speaker == "kin")
    {
        scr_kingface(_msgno, _emotion);
    }
    if (_speaker == "rudy" || _speaker == "rud")
    {
        scr_rudface(_msgno, _emotion);
    }
    if (_speaker == "lancer" || _speaker == "lan")
    {
        scr_lanface(_msgno, _emotion);
    }
    if (_speaker == "berdly" || _speaker == "ber")
    {
        msgsetsubloc(arg1, "\\TX \\F0 \\E~1 \\FB \\TB %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_23_0");
    }
    if (_speaker == "alphys" || _speaker == "alp")
    {
        msgsetsubloc(arg1, "\\TX \\F0 \\E~1 \\Fa \\Ta %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_24_0");
    }
    if (_speaker == "none" || _speaker == "x" || _speaker == "no name" || _speaker == "no_name")
    {
        scr_noface(_msgno);
    }
    if (_speaker == "rouxls" || _speaker == "rou")
    {
        scr_rurusface(_msgno, _emotion);
    }
    if (_speaker == "queen" || _speaker == "que")
    {
        msgsetsubloc(arg1, "\\TX \\F0 \\E~1 \\FQ \\TQ %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_27_0");
    }
    if (_speaker == "queen2" || _speaker == "que2")
    {
        msgsetsubloc(arg1, "\\TX \\F0 \\E~1 \\F0 \\Tq %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_28_0_b");
    }
    if (_speaker == "sans" || _speaker == "san")
    {
        msgsetsubloc(arg1, "\\TX \\F0 \\E~1 \\Fs \\Ts %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_28_0");
    }
    if (_speaker == "undyne" || _speaker == "und")
    {
        msgsetsubloc(arg1, "\\TX \\F0 \\E~1 \\FU \\TU %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_29_0");
    }
    if (_speaker == "jockington")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FJ \\Tj %", string(_emotion));
    }
    if (_speaker == "burgerpants")
    {
        msgsetsubloc(arg1, "\\TX \\F0 \\E~1 \\Fb \\T0 %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_30_0");
    }
    if (_speaker == "sneo")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Tp %", string(_emotion));
    }
    if (_speaker == "carol")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FC \\TC %", string(_emotion));
    }
    if (_speaker == "jackenstein")
    {
        msgset(arg1, "\\TX \\F0 \\Tf %", string(_emotion));
    }
    if (_speaker == "tenna")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Tv %", string(_emotion));
    }
    if (_speaker == "bratty")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fy \\Ty %", string(_emotion));
    }
    if (_speaker == "catti")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fi \\Ti %", string(_emotion));
    }
    if (_speaker == "catty")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Fk \\Tk %", string(_emotion));
    }
    if (_speaker == "flowery")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FF \\TF %", string(_emotion));
    }
    if (_speaker == "flowery_noface")
    {
        msgsetsub(arg1, "\\TX \\F0 \\TF %", string(_emotion));
    }
    if (_speaker == "flowery_s")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\FF \\Th %", string(_emotion));
    }
    if (_speaker == "aqua")
    {
        msgsetloc(arg1, "\\TX \\F0 \\T4 %", "scr_anyface_slash_scr_anyface_gml_50_0");
    }
    if (_speaker == "seth" || _speaker == "purple")
    {
        msgsetloc(arg1, "\\TX \\F0 \\T5 %", "scr_anyface_slash_scr_anyface_gml_52_0");
    }
    if (_speaker == "yellow")
    {
        msgsetloc(arg1, "\\TX \\F0 \\T6 %", "scr_anyface_slash_scr_anyface_gml_53_0");
    }
    if (_speaker == "orange")
    {
        msgsetloc(arg1, "\\TX \\F0 \\T7 %", "scr_anyface_slash_scr_anyface_gml_54_0");
    }
    if (_speaker == "blue")
    {
        msgsetloc(arg1, "\\TX \\F0 \\T8 %", "scr_anyface_slash_scr_anyface_gml_55_0");
    }
    if (_speaker == "green")
    {
        msgsetloc(arg1, "\\TX \\F0 \\T9 %", "scr_anyface_slash_scr_anyface_gml_56_0");
    }
    if (_speaker == "pink")
    {
        msgsetloc(arg1, "\\TX \\F0 \\TP %", "scr_anyface_slash_scr_anyface_gml_57_0");
    }
    if (_speaker == "opuppet")
    {
        msgsetloc(arg1, "\\TX \\F0 \\TO %", "scr_anyface_slash_scr_anyface_gml_58_0");
    }
    if (_speaker == "bluef")
    {
        msgsetsubloc(arg1, "\\TX \\F◘ \\E~1 \\T8 %", string(_emotion), "scr_anyface_slash_scr_anyface_gml_60_0");
    }
    if (_speaker == "mysteryman")
    {
        msgsetsub(arg1, "\\TX \\F0 \\E~1 \\Tz %", string(_emotion));
    }
}
