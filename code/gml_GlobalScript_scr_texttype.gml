function scr_texttype()
{
    var font_set = true;
    var extra_ja_vspace = 0;
    textscale = 1;
    switch (global.typer)
    {
        case 0:
            font_set = false;
            break;
        case 1:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 243, 8, 18, 0);
            break;
        case 2:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 534, 8, 18, 0);
            break;
        case 3:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 243, 8, 18, 1);
            break;
        case 4:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 243, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 5:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 243, 8, 18, 0);
            break;
        case 6:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 7:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 280, 8, 18, 0);
            break;
        case 8:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 280, 8, 18, 0);
            break;
        case 10:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 271, 8, 18, 0);
            break;
        case 11:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 271, 8, 18, 0);
            break;
        case 12:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 272, 8, 18, 0);
            break;
        case 13:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 273, 8, 18, 0);
            break;
        case 14:
            scr_textsetup(scr_84_get_font("comicsans"), 16777215, x, y, 33, 0, 1, 269, 8, 18, 0);
            break;
        case 15:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 243, 8, 18, 0);
            break;
        case 16:
            font_set = false;
            break;
        case 17:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 270, 8, 18, 0);
            break;
        case 18:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 267, 8, 18, 0);
            break;
        case 19:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 243, 8, 18, 0);
            break;
        case 20:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 278, 8, 18, 0);
            break;
        case 21:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 278, 8, 18, 0);
            break;
        case 22:
            scr_textsetup(scr_84_get_font("tinynoelle"), 16777215, x, y + 7, 33, 0, 1, 278, 6, 18, 0);
            break;
        case 23:
            scr_textsetup(scr_84_get_font("tinynoelle"), 16777215, x, y + 7, 33, 0, 1, 272, 6, 18, 0);
            break;
        case 30:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 271, 16, 36, 1);
            break;
        case 31:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 274, 16, 36, 1);
            break;
        case 32:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 277, 16, 36, 1);
            break;
        case 33:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 367, 16, 36, 1);
            break;
        case 35:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 276, 16, 36, 1);
            break;
        case 36:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 534, 16, 36, 1);
            break;
        case 37:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 3, 271, 18, 36, 1);
            break;
        case 40:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 534, 8, 18, 0);
            break;
        case 41:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 3, 534, 8, 18, 0);
            break;
        case 42:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 2, 534, 16, 36, 1);
            break;
        case 45:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 274, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 46:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 277, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 47:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 271, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 48:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 367, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 50:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 243, 9, 20, 0);
            break;
        case 51:
            var rate = langopt(10, 14);
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, rate, 243, 16, 36, 1);
            break;
        case 52:
            var rate = langopt(6, 4);
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, rate, 243, 16, 36, 1);
            break;
        case 53:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 271, 9, 20, 0);
            break;
        case 54:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 2, 271, 9, 20, 0);
            break;
        case 55:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 275, 8, 18, 0);
            break;
        case 56:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 272, 16, 36, 1);
            break;
        case 57:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 273, 16, 36, 1);
            break;
        case 58:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 146, 16, 36, 1);
            break;
        case 59:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 272, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 60:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 274, 12, 20, 0);
            break;
        case 61:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 271, 12, 20, 0);
            break;
        case 62:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 281, 16, 36, 1);
            break;
        case 63:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 272, 8, 18, 0);
            break;
        case 64:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 1, 2, 272, 8, 18, 0);
            break;
        case 65:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 285, 16, 36, 1);
            break;
        case 66:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 283, 16, 36, 1);
            break;
        case 67:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 284, 16, 36, 1);
            break;
        case 68:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 283, 9, 20, 0);
            break;
        case 69:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 273, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 70:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 146, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 71:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 146, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 72:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 284, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 74:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 274, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 75:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 271, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 76:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 272, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 77:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 273, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 78:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 36, 0, 1, 243, 16, 36, 1);
            break;
        case 79:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 137, 16, 36, 1);
            break;
        case 83:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 88, 16, 36, 1);
            break;
        case 84:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 643, 16, 36, 1);
            break;
        case 86:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 671, 16, 36, 1);
            break;
        case 87:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 1, 148, 8, 18, 0);
            break;
        case 88:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 107, 16, 36, 1);
            break;
        case 89:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 267, 16, 36, 1);
            break;
        case 90:
            scr_textsetup(scr_84_get_font("mainbig"), 16775556, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 91:
            scr_textsetup(scr_84_get_font("mainbig"), 16558306, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 92:
            scr_textsetup(scr_84_get_font("mainbig"), 10615039, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 93:
            scr_textsetup(scr_84_get_font("mainbig"), 8891647, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 94:
            scr_textsetup(scr_84_get_font("mainbig"), 16754566, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 95:
            scr_textsetup(scr_84_get_font("mainbig"), 12386222, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 96:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 107, 9, 20, 0);
            extra_ja_vspace = 2;
            break;
        case 97:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 1, 243, 16, 36, 1);
            break;
        case 98:
            scr_textsetup(scr_84_get_font("mainbig"), 4235519, x, y, 33, 1, 1, 243, 16, 36, 0);
            break;
        case 99:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 2, 271, 18, 36, 1);
            break;
        case 200:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 271, 9, 20, 0);
            break;
        case 201:
            scr_textsetup(scr_84_get_font("dotumche"), 0, x, y, 33, 0, 1, 274, 9, 20, 0);
            break;
        case 202:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 2, 274, 16, 36, 1);
            break;
        case 203:
            scr_textsetup(scr_84_get_font("mainbig"), 16777215, x, y, 33, 0, 4, 243, 16, 36, 1);
            break;
        case 666:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 4, 534, 12, 20, 2);
            break;
        case 667:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 2, 534, 12, 20, 2);
            break;
        case 999:
            scr_textsetup(scr_84_get_font("main"), 16777215, x, y, 33, 0, 4, 531, 8, 18, 3);
            break;
        case 100:
            scr_textsetup(2, 16777215, x, y, 22, 0, 1, 243, 16, 20, 0);
            break;
        default:
            font_set = false;
            break;
    }
    if (font_set && global.lang == "ja")
    {
        if (myfont == 14)
        {
            hspace = ((hspace * 26) / 16) + 1;
            if (vspace == 32)
            {
                vspace = 36;
            }
        }
        else if (myfont == 11)
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (myfont == 9)
        {
            textscale = 0.5;
            hspace = ((hspace * 13) / 8) + 3;
        }
        else if (myfont == 13)
        {
            textscale = 0.5;
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (myfont == 10)
        {
            hspace = ((hspace * 26) / 16) + 1;
        }
        else if (myfont == 12)
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        vspace += extra_ja_vspace;
    }
}
