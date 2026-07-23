function scr_phonename()
{
    for (i = 0; i < 8; i += 1)
        global.phonename[i] = stringsetloc(" ", "scr_phonename_slash_scr_phonename_gml_3_0");
    
    for (i = 0; i < 8; i += 1)
    {
        if (mysterycheck() == 1)
        {
            itemid = global.phone[i];
            
            switch (itemid)
            {
                case 201:
                    global.phonename[i] = stringsetloc("Call Home", "scr_phonename_slash_scr_phonename_gml_17_0");
                    
                    if (global.chapter == 2 && global.plot == 9)
                        global.phonename[i] = stringsetloc("Call Toriel", "scr_phonename_slash_scr_phonename_gml_18_0");
                    
                    break;
                
                case 202:
                    global.phonename[i] = stringsetloc("Sans's Number", "scr_phonename_slash_scr_phonename_gml_21_0");
                    
                    if (global.flag[274] >= 2)
                        global.phonename[i] = stringsetloc("Not Sans's Number", "scr_phonename_slash_scr_phonename_gml_22_0");
                    
                    break;
            }
        }
        else
        {
            itemid = global.mysteryphone[i];
            
            switch (itemid)
            {
                case 203:
                    global.phonename[i] = "Toriel's Phone";
                    break;
                
                case 204:
                    if (room != room_truelab_redlever)
                        global.phonename[i] = "Unknown number";
                    else if (!global.mysteryflag[0])
                        global.phonename[i] = "Doctor's Phone";
                    else
                        global.phonename[i] = "                  Phone";
                    
                    break;
            }
        }
    }
}
