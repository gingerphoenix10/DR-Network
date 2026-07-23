myinteract = 3;
global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fe = 0;
global.fc = 0;
global.interact = 1;

with (obj_darkcontroller)
    charcon = 0;

global.msg[0] = stringsetloc("* Suddenly^1, your body seizes up^1.&* What are you looking at?/%", "obj_readable_room1_slash_Other_10_gml_13_0");

if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_readable_room1)/%");

if (room == room_krisroom)
{
    skip = 1;
    
    if (string_pos("krisroom_", extflag) != 0)
    {
        if (i_ex(obj_room_krisroom))
            obj_room_krisroom.show_convo(extflag);
    }
}

if (room == room_debug_loc)
{
    global.msg[0] = stringsetloc("* The door is locked./%", "obj_readable_room1_slash_Other_10_gml_120_0");
    
    if (x > 120)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's only you./%", "obj_readable_room1_slash_Other_10_gml_127_0");
        
        if (global.chapter >= 2)
            msgsetloc(0, "* (It's what they call \"you.\")/%", "obj_readable_room1_slash_Other_10_gml_133_0");
    }
    
    if (x > 160)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* There are crayons in the drawer^1. Their labels have long faded^1, and there's no green./%", "obj_readable_room1_slash_Other_10_gml_141_0");
        
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (..^1. How to Draw Dragons is at the bottom of the drawer.)/", "obj_readable_room1_slash_Other_10_gml_147_0");
            msgnextloc("* (The purple character on the cover is dressed..^1. immodestly.)/", "obj_readable_room1_slash_Other_10_gml_148_0_b");
            msgnextloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_148_0");
            msgnextloc("* (Your brother will never return this book.)/%", "obj_readable_room1_slash_Other_10_gml_150_0");
        }
    }
    
    if (x > 220)
        global.msg[0] = stringsetloc("* A cactus^1.&* There's not much to say about it./%", "obj_readable_room1_slash_Other_10_gml_169_0");
    
    if (x > 320)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* There are many books./", "obj_readable_room1_slash_Other_10_gml_177_0");
            global.msg[1] = stringsetloc("* Tales of Snails - A Story Book./", "obj_readable_room1_slash_Other_10_gml_178_0");
            global.msg[2] = stringsetloc("* Snails Do Not Have Tails -&A Scientific Refutation./", "obj_readable_room1_slash_Other_10_gml_179_0");
            global.msg[3] = stringsetloc("* Can Snails Help Your Garden? Um, Not Really./", "obj_readable_room1_slash_Other_10_gml_180_0");
            global.msg[4] = stringsetloc("* And a signed copy of The History of Humans and Monsters, by Gerson Boom./%", "obj_readable_room1_slash_Other_10_gml_181_0");
            
            if (read > 0)
                global.msg[0] = stringsetloc("* There's no time to read anything right now./%", "obj_readable_room1_slash_Other_10_gml_184_0");
        }
        
        if (global.chapter >= 2)
            msgsetloc(0, "* (There's no time to read books. Just generally.)/%", "obj_readable_room1_slash_Other_10_gml_175_0");
    }
}

if (room == room_krishallway)
{
    skip = 1;
    var hallway_convo = "hallway_tor";
    
    if (x > 120)
        hallway_convo = "hallway_mirror";
    
    if (x > 160)
        hallway_convo = "hallway_drawer";
    
    if (x > 220)
        hallway_convo = "hallway_cactus";
    
    if (x > 320)
        hallway_convo = "hallway_books";
    
    with (obj_room_krishallway)
        show_convo(hallway_convo);
}

if (room == room_torhouse)
{
    skip = 1;
    
    if (string_pos("torhouse_", extflag) != 0)
    {
        var times_talked = read;
        
        if (i_ex(obj_room_torhouse))
            obj_room_torhouse.show_convo(extflag, times_talked);
    }
    
    if (string_pos("tortoast_", extflag) != 0)
    {
        if (i_ex(obj_ch5_LW02))
            obj_ch5_LW02.show_convo(extflag);
    }
}

if (room == room_torbathroom)
{
    skip = 1;
    
    if (string_pos("torbathroom_", extflag) != 0)
    {
        if (i_ex(obj_room_torbathroom))
        {
            if (global.facing == 1 || global.facing == 3)
                exit;
            
            obj_room_torbathroom.show_convo(extflag);
        }
    }
}

if (room == room_schoollobby)
{
    if (scr_flag_get(1324) == 3)
        skip = 1;
    
    if (x >= 140 && x < 240)
    {
        scr_speaker("no_name");
        
        if (tempvar == 0)
            global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_335_0");
        
        if (tempvar == 1)
            global.msg[0] = stringsetloc("* The locker's lock is locked./%", "obj_readable_room1_slash_Other_10_gml_336_0");
        
        if (tempvar == 2)
            global.msg[0] = stringsetloc("* The lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_337_0");
        
        if (tempvar == 3)
            global.msg[0] = stringsetloc("* The locker's lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_338_0");
        
        if (tempvar >= 4)
            global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_339_0");
        
        with (obj_readable_room1)
            tempvar += 1;
    }
    
    if (x == 240)
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* (The locker is covered in Jockington memorabilia.)/%", "obj_readable_room1_slash_Other_10_gml_344_0");
    }
    
    if (x >= 280)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There's a flyer.)/", "obj_readable_room1_slash_Other_10_gml_182_0");
            msgnextloc("* (\"Today^1, is the Festival^1! Why the heck are you in^1? School!?\")/%", "obj_readable_room1_slash_Other_10_gml_183_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The flyer is hard to read because the background is entirely soccerballs)/%", "obj_readable_room1_slash_Other_10_gml_187_0");
        }
    }
    
    if (x < 140)
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* (You look through the frosted window.)/", "obj_readable_room1_slash_Other_10_gml_356_0");
        global.msg[1] = stringsetloc("* (A blurry yellow object is teaching a bunch of blurry bored-looking objects.)/%", "obj_readable_room1_slash_Other_10_gml_357_0");
    }
    
    if (x >= 520)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Water fountain. You turned it on and blocked the stream with your finger.)/", "obj_readable_room1_slash_Other_10_gml_203_0");
            msgnextloc("* (The fountain was sealed...)/%", "obj_readable_room1_slash_Other_10_gml_204_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (For some reason^1, you thought about showing this to Susie later.)/%", "obj_readable_room1_slash_Other_10_gml_208_0");
            
            if (scr_havechar("susie"))
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E9* Pfft^1, you sealing the fountain^1, idiot?/%", "obj_readable_room1_slash_Other_10_gml_213_0_b");
            }
        }
    }
    
    if (x >= 560)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a flyer encouraging you to vote Jockington as Festival King and Queen.)/", "obj_readable_room1_slash_Other_10_gml_221_0");
        msgnextloc("* (..^1. maybe^1. It's impossible to read as the background is all basketballs.)/%", "obj_readable_room1_slash_Other_10_gml_222_0");
    }
    
    if (x >= 690)
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* (Locker^1. It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_390_0");
    }
    
    if (x == 760)
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* (This used to be your brother's locker.)/%", "obj_readable_room1_slash_Other_10_gml_396_0");
    }
    
    if (x == 780)
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* (It's your locker.^1)&* (It's empty.)/%", "obj_readable_room1_slash_Other_10_gml_400_0");
    }
    
    if (extflag == "dented_locker")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Lockers^1. They are dented.)/%", "obj_readable_room1_slash_Other_10_gml_246_0");
        
        if (scr_havechar("susie"))
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\ED* ..^1. yeah^1, uh..^1. these lockers are kinda dented^1, huh./", "obj_readable_room1_slash_Other_10_gml_253_0_b");
                msgnextloc("\\EV* .../", "obj_readable_room1_slash_Other_10_gml_254_0");
                msgnextloc("\\ER* I don't think I ever said I.../", "obj_readable_room1_slash_Other_10_gml_255_0");
                msgnextloc("\\ES* Y'now^1, I was a goddamn idiot^1, and.../", "obj_readable_room1_slash_Other_10_gml_256_0");
                msgnextloc("\\EH* What^1? No^1, I'm not picking you up again^1, dumbass!/%", "obj_readable_room1_slash_Other_10_gml_257_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EH* You're not picking me up either^1, idiot!/%", "obj_readable_room1_slash_Other_10_gml_261_0");
            }
        }
    }
}

if (room == room_alphysclass)
{
    skip = 1;
    
    if (string_pos("alphysclass_", extflag) != 0)
    {
        if (i_ex(obj_room_alphysclass))
        {
            var _read = read;
            obj_room_alphysclass.show_convo(extflag, _read);
        }
    }
}

if (room == room_torielclass)
{
    if (y <= (room_height / 2))
    {
        if (x >= 100)
        {
            scr_speaker("no_name");
            global.msg[0] = stringsetloc("* (\"Ms. Toriel\" is written in cursive on the dry-erase board.)/", "obj_readable_room1_slash_Other_10_gml_473_0");
            global.msg[1] = stringsetloc("* (Seems like it hasn't been erased in a very long time.)/%", "obj_readable_room1_slash_Other_10_gml_474_0");
        }
        
        if (x >= 130)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's your mom's computer wallpaper.)/", "obj_readable_room1_slash_Other_10_gml_295_0");
            msgnextloc("* (You're wearing a cowboy hat^1, sitting on somebody's lap.)/%", "obj_readable_room1_slash_Other_10_gml_296_0_b");
        }
        
        if (x >= 170)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You uncapped the yellow scented marker and gave it a sniff.)/", "obj_readable_room1_slash_Other_10_gml_304_0");
                msgnextloc("* (You're hit with an overpowering^1, floral bouquet...)/", "obj_readable_room1_slash_Other_10_gml_305_0");
                msgnextloc("* (..^1. actually^1, it's hard to tell with the flowers behind you.)/%", "obj_readable_room1_slash_Other_10_gml_306_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You opened a marker and held it aloft.)/", "obj_readable_room1_slash_Other_10_gml_310_0");
                msgnextloc("* (..^1. hard to tell what to do with it if you can't smell it.)/%", "obj_readable_room1_slash_Other_10_gml_311_0");
            }
            
            if (scr_havechar("susie"))
            {
                if (read == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (You uncapped the yellow-scented marker and presented it to Susie.)/", "obj_readable_room1_slash_Other_10_gml_319_0");
                    scr_anyface_next("susie", "8");
                    msgnextloc("\\E8* For me^1? Hey^1, you shouldn't have.../", "obj_readable_room1_slash_Other_10_gml_321_0");
                    scr_anyface_next("no_name", 0);
                    msgnextloc("* (The two of you held the marker and sniffed it together.)/", "obj_readable_room1_slash_Other_10_gml_323_0");
                    scr_anyface_next("susie", "8");
                    msgnextloc("\\E8* Dude^1, it's.../", "obj_readable_room1_slash_Other_10_gml_325_0");
                    msgnextloc("\\EC* ..^1. I can't smell it^1. Stupid flowers./%", "obj_readable_room1_slash_Other_10_gml_326_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* Maybe if we go under the desk to smell it^1? ..^1. nah./%", "obj_readable_room1_slash_Other_10_gml_330_0");
                }
            }
        }
        
        if (x >= 198)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Flowers.)/%", "obj_readable_room1_slash_Other_10_gml_340_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Never seems to be the right season for them.)/%", "obj_readable_room1_slash_Other_10_gml_344_0_b");
            }
            
            if (scr_havechar("susie"))
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EA* Hey^1, maybe I could take these flowers^1, and.../", "obj_readable_room1_slash_Other_10_gml_350_0_b");
                msgnextloc("\\Ev* ..^1. nah^1, that's stupid./%", "obj_readable_room1_slash_Other_10_gml_351_0_b");
            }
        }
        
        if (x >= 204)
        {
            scr_speaker("no_name");
            global.msg[0] = stringsetloc("* (It's a poster of several basic shapes.^1)&* (Circle, Oval, Square...)/", "obj_readable_room1_slash_Other_10_gml_521_0");
            global.msg[1] = stringsetloc("* (Hyperdodecahedron...)/%", "obj_readable_room1_slash_Other_10_gml_522_0");
        }
        
        if (x >= 230)
        {
            scr_speaker("no_name");
            global.msg[0] = stringsetloc("* (Kids' books.^1)&* (Some of them used to be yours.)/%", "obj_readable_room1_slash_Other_10_gml_526_0");
        }
        
        if (x >= 256)
        {
            scr_speaker("no_name");
            global.msg[0] = stringsetloc("* (It's a primitive drawing of your mom.)/%", "obj_readable_room1_slash_Other_10_gml_530_0");
        }
    }
    else if (x <= (room_width / 2))
    {
        scr_speaker("no_name");
        global.msg[0] = stringsetloc("* (Some kind of primitive sculpture.)&* (Who knows what it represents?)/%", "obj_readable_room1_slash_Other_10_gml_537_0");
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (...^1? There's a white napkin on top of the tower.)/", "obj_readable_room1_slash_Other_10_gml_383_0_b");
        msgnextloc("* (Imagining someone eating on top of this..^1. you felt ill.)/%", "obj_readable_room1_slash_Other_10_gml_384_0_b");
    }
}

if (room == room_schooldoor)
{
    scr_speaker("no_name");
    global.msg[0] = stringsetloc("* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_626_0");
}

if (room == room_school_unusedroom)
{
    if (x < 80)
        global.msg[0] = stringsetloc("* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_631_0");
    
    if (x > 100)
        global.msg[0] = stringsetloc("* (It's a worn-down stuffed animal.)/%", "obj_readable_room1_slash_Other_10_gml_632_0");
    
    if (x > 160 && y < 100)
        global.msg[0] = stringsetloc("* (It's a lightswitch.)/%", "obj_readable_room1_slash_Other_10_gml_633_0");
    
    if (x > 160 && y > 100)
        global.msg[0] = stringsetloc("* (It's a checkerboard.^1)&* (There are pawns strewn on it.)/%", "obj_readable_room1_slash_Other_10_gml_634_0");
    
    if (x > 220)
        global.msg[0] = stringsetloc("* (Playing cards spill out of a deck in the closet.)/%", "obj_readable_room1_slash_Other_10_gml_635_0");
    
    if (x > 250)
    {
        global.msg[0] = stringsetloc("* (It's a yellowed, poorly-drawn picture of a green turtle.)/", "obj_readable_room1_slash_Other_10_gml_638_0");
        global.msg[1] = stringsetloc("* (It's signed 'Alvin.')/%", "obj_readable_room1_slash_Other_10_gml_639_0");
    }
    
    if (global.chapter >= 2)
    {
        if (x > 160 && y > 100)
            msgsetloc(0, "* (You stared at the checkerboard from the doorway.)/%", "obj_readable_room1_slash_Other_10_gml_644_0");
        
        if (x > 220)
            msgsetloc(0, "* (Managed to cram everything into the closet^1. Even the rug.)/%", "obj_readable_room1_slash_Other_10_gml_645_0");
    }
}

if (room == room_hospital_lobby)
{
    if (x <= 160)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (It's one of those sliding bead toys that naturally spawns inside doctors' offices.)/", "obj_readable_room1_slash_Other_10_gml_586_0");
            global.msg[1] = stringsetloc("* (The beads march grimly along their set path.)/%", "obj_readable_room1_slash_Other_10_gml_587_0");
        }
        
        if (global.chapter >= 2)
        {
            if (scr_sideb_get_phase() > 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's a toy with beads on a track.)/", "obj_readable_room1_slash_Other_10_gml_667_0_b");
                msgnextloc("* (One of the blue beads is broken and torn off.)/%", "obj_readable_room1_slash_Other_10_gml_668_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The beads of the toy march on.)/%", "obj_readable_room1_slash_Other_10_gml_672_0");
            }
        }
    }
    
    if (x >= 160)
    {
        if (global.chapter == 1)
        {
            global.msc = 360;
            scr_text(global.msc);
        }
        
        if (global.chapter >= 2)
        {
            global.msc = 1155;
            scr_text(global.msc);
        }
    }
}

if (room == room_dw_castle_west_cliff)
{
    if (global.chapter >= 2)
    {
        scr_speaker("none");
        msgsetloc(0, "* (The rubble on the ground seems to have been dusted and polished.)/", "obj_readable_room1_slash_Other_10_gml_716_0");
        msgnextloc("* (Someone around here really cares about the details.)/%", "obj_readable_room1_slash_Other_10_gml_717_0");
    }
    
    if (extflag == "cliff_items")
    {
        if (scr_flag_get(1375) == 0)
        {
            global.msc = 1240;
            scr_text(global.msc);
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There's a hole in the wall...)/", "obj_readable_room1_slash_Other_10_gml_740_0");
            msgnextloc("* (There's nothing inside.)/%", "obj_readable_room1_slash_Other_10_gml_741_0");
        }
    }
    
    if (string_pos("cliffs_", extflag) != 0)
    {
        skip = 1;
        
        if (i_ex(obj_npc_castle_cliff))
        {
            var _read = read;
            obj_npc_castle_cliff.show_convo(extflag, _read);
        }
    }
}

if (room == room_dw_castle_east_door)
{
    skip = 1;
    
    if (string_pos("grand_", extflag) != 0)
    {
        if (i_ex(obj_npc_castle_door))
        {
            var _read = read;
            obj_npc_castle_door.show_convo(extflag, _read);
        }
    }
}

if (room == room_cc_clover)
{
    if (x < 90)
    {
        if (global.flag[412] == 0)
            global.flag[412] = 1;
    }
    
    global.msg[0] = stringsetloc("* (It's a bed for three people^1, or one three-headed person.)/%", "obj_readable_room1_slash_Other_10_gml_662_0");
    
    if (x > (room_width / 2))
    {
        if (y < (room_height / 2))
        {
            global.msg[0] = stringsetloc("* (It's a giant baseball.^1)&* (For parties.)/%", "obj_readable_room1_slash_Other_10_gml_667_0");
            
            if (read >= 1)
            {
                global.msg[0] = stringsetloc("* (Actually^1, seems the giant baseball is a soccer ball that's been painted over.)/", "obj_readable_room1_slash_Other_10_gml_670_0");
                global.msg[1] = stringsetloc("* (It would be easier to draw that way.)/%", "obj_readable_room1_slash_Other_10_gml_671_0");
            }
        }
        else
        {
            global.msg[0] = stringsetloc("* (It's a tree.^1)&* (For parties.)/%", "obj_readable_room1_slash_Other_10_gml_676_0");
        }
    }
}

if (room == room_flowershop_2f)
{
    if (string_pos("shop_", extflag) != 0)
    {
        skip = 1;
        
        if (instance_exists(obj_ch5_LWF01))
            obj_ch5_LWF01.show_convo(extflag, read);
    }
    else if (extflag == "flower_shine")
    {
        skip = 1;
        
        with (obj_ch5_LWF01)
            con = 20;
    }
}

if (room == room_town_south)
{
    if (x <= 100)
    {
        if (scr_sideb_active())
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* If they have police tape.../", "obj_readable_room1_slash_Other_10_gml_556_0_b");
                msgnextloc("\\E1* ..^1. why don't they have police glue?/%", "obj_readable_room1_slash_Other_10_gml_557_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* I mean^1, I'm glad they don't^1. But they could./%", "obj_readable_room1_slash_Other_10_gml_561_0");
            }
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Police tape^1. Seems newer than yesterday.)/%", "obj_readable_room1_slash_Other_10_gml_566_0");
            
            if (scr_flag_get(1324) == 3)
                skip = 1;
        }
    }
    
    if (string_pos("tako_", extflag) != 0)
    {
        if (i_ex(obj_town_south_tako))
        {
            skip = 1;
            obj_town_south_tako.show_convo(extflag);
        }
    }
    else if (string_pos("strength_", extflag) != 0)
    {
        if (i_ex(obj_town_south_strength))
        {
            if (string_pos("strength_tester", extflag) && global.facing != 2)
                exit;
            
            skip = 1;
            obj_town_south_strength.show_convo(extflag);
        }
    }
    else if (string_pos("dunk_tank", extflag) != 0)
    {
        if (i_ex(obj_town_south_dunk_tank))
        {
            skip = 1;
            obj_town_south_dunk_tank.show_convo(extflag, read);
        }
    }
    else if (extflag == "library_books")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E0* Stop looking at books^1. It's the weekend./%", "obj_readable_room1_slash_Other_10_gml_597_0");
        
        if (scr_flag_get(1324) == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (A box of books that talk about how to barricade doors.)/%", "obj_readable_room1_slash_Other_10_gml_602_0");
        }
    }
    else if (extflag == "burgerpants_morning")
    {
        if (global.facing != 2 && global.facing != 3)
            exit;
        
        if (read == 0)
        {
            scr_speaker("burgerpants");
            msgsetloc(0, "\\E3* Hey^1! Lil' buddy^1! Ready for my BIG SHOW today?/", "obj_readable_room1_slash_Other_10_gml_609_0");
            msgnextloc("\\EC* Me and my GIRL are meeting for the first time..^1. ONSTAGE!/", "obj_readable_room1_slash_Other_10_gml_610_0");
            msgnextloc("\\E3* Ha^1! We'll sing our LOVE..^1. in front of THE WHOLE TOWN!/", "obj_readable_room1_slash_Other_10_gml_611_0");
            msgnextloc("\\ES* You up early practicing too...?/", "obj_readable_room1_slash_Other_10_gml_612_0");
            msgnextloc("\\EL* .../", "obj_readable_room1_slash_Other_10_gml_613_0");
            msgnextloc("\\EN* Sorry^1, I know..^1. but you could try solo?/", "obj_readable_room1_slash_Other_10_gml_614_0");
            msgnextloc("\\EC* ..^1. people would like it^1, buddy./%", "obj_readable_room1_slash_Other_10_gml_615_0");
        }
        else
        {
            scr_speaker("burgerpants");
            msgsetloc(0, "\\ET* I..^1. was your band's only groupie^1, back then./", "obj_readable_room1_slash_Other_10_gml_619_0");
            msgnextloc("\\ES* Your brother and her..^1. didn't even really \"practice.\"/", "obj_readable_room1_slash_Other_10_gml_620_0");
            msgnextloc("\\E2* Well^1, their instruments^1, that is^1. Blegh./", "obj_readable_room1_slash_Other_10_gml_621_0");
            msgnextloc("\\EC* But YOU^1? YOU had talent^1, buddy./", "obj_readable_room1_slash_Other_10_gml_622_0");
            msgnextloc("\\E3* And today^1, I'll show you mine./", "obj_readable_room1_slash_Other_10_gml_623_0_b");
            msgnextloc("\\ER* ..^1. snap a pic for Azzy^1, would ya?/%", "obj_readable_room1_slash_Other_10_gml_624_0");
        }
    }
    else if (extflag == "lesser_bark")
    {
        skip = 1;
        snd_play(snd_pombark);
    }
}

if (room == room_town_mid)
{
    skip = 1;
    
    if (string_pos("diner_", extflag) != 0)
    {
        if (i_ex(obj_room_town_mid_diner))
        {
            if (extflag == "diner_child")
            {
                if (global.facing != 2)
                    exit;
            }
            
            obj_room_town_mid_diner.show_convo(extflag, read);
        }
    }
    else if (string_pos("w_ferris", extflag) != 0)
    {
        if (i_ex(obj_town_mid_ferris_w))
        {
            if (global.facing != 2)
                exit;
            
            obj_town_mid_ferris_w.show_convo(extflag);
        }
    }
    else if (string_pos("ferris_", extflag) != 0)
    {
        if (i_ex(obj_town_mid_ferris))
        {
            if (global.facing != 2)
                exit;
            
            obj_town_mid_ferris.show_convo(extflag);
        }
    }
    else if (string_pos("teacup_", extflag) != 0)
    {
        if (i_ex(obj_town_mid_teacup))
            obj_town_mid_teacup.show_convo(extflag, read);
    }
    else if (string_pos("w_sans_", extflag) != 0)
    {
        if (i_ex(obj_town_mid_sans_w))
            obj_town_mid_sans_w.show_convo(extflag);
    }
    else if (string_pos("sans_", extflag) != 0)
    {
        if (i_ex(obj_town_mid_sans))
        {
            if (global.facing != 2)
                exit;
            
            obj_town_mid_sans.show_convo(extflag);
        }
    }
    else if (string_pos("door_", extflag) != 0)
    {
        if (i_ex(obj_town_mid_doors))
            obj_town_mid_doors.show_convo(extflag, read);
    }
    else if (string_pos("conbini", extflag) != 0)
    {
        if (i_ex(obj_town_mid_conbini))
            obj_town_mid_conbini.show_convo(extflag);
    }
    else if (string_pos("temmie", extflag) != 0)
    {
        if (i_ex(obj_town_mid_temmie))
        {
            if (global.facing != 2)
                exit;
            
            obj_town_mid_temmie.show_convo(extflag);
        }
    }
    else if (extflag == "night_door")
    {
        skip = 0;
        scr_speaker("susie");
        msgsetloc(0, "\\ER* Kris^1, y'know.../", "obj_readable_room1_slash_Other_10_gml_691_0");
        msgnextloc("\\ES* ..^1. that's not really what I meant^1, right?/%", "obj_readable_room1_slash_Other_10_gml_692_0");
    }
    else if (string_pos("rabbits_", extflag) != 0)
    {
        if (i_ex(obj_npc_rabbits))
            obj_npc_rabbits.show_convo(extflag, read);
    }
    else if (extflag == "ice_wolf_morning")
    {
        skip = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* FawFaw..^1. excited./", "obj_readable_room1_slash_Other_10_gml_703_0");
        msgnextloc("* Love setting up logs.../%", "obj_readable_room1_slash_Other_10_gml_704_0");
    }
    else if (extflag == "pap_door")
    {
        skip = 0;
        
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E2* Now that we got Noelle^1, maybe we can open this door./", "obj_readable_room1_slash_Other_10_gml_712_0_b");
            scr_anyface_next("noelle", "2");
            msgnextloc("\\E2* (What are they both expecting me to do...?)/%", "obj_readable_room1_slash_Other_10_gml_714_0");
        }
        else
        {
            scr_speaker("sans");
            msgsetloc(0, "\\E2* huh^1. maybe we need to get somebody else./", "obj_readable_room1_slash_Other_10_gml_718_0_b");
            scr_anyface_next("susie", "3");
            msgnextloc("\\E3* Yeah..^1. hey wait a second^1, shut up./%", "obj_readable_room1_slash_Other_10_gml_720_0_b");
        }
    }
}

if (room == room_town_north)
{
    skip = 1;
    
    if (string_pos("asgore_", extflag) != 0)
    {
        if (i_ex(obj_town_north_asgore))
            obj_town_north_asgore.show_convo(extflag);
    }
    else if (string_pos("catty_house_", extflag) != 0)
    {
        if (i_ex(obj_town_north_catty_house))
        {
            if (extflag == "catty_house_voting_booth")
            {
                if (global.facing != 2)
                    exit;
            }
            
            obj_town_north_catty_house.show_convo(extflag, read);
        }
    }
    else if (string_pos("town_north_", extflag) != 0)
    {
        if (i_ex(obj_town_north))
            obj_town_north.show_convo(extflag, read);
    }
    else if (string_pos("napstablook_door", extflag) != 0)
    {
        if (i_ex(obj_town_north_napstablook))
            obj_town_north_napstablook.show_convo(extflag);
    }
}

if (room == room_dw_castle_tv)
{
    if (extflag == "zapper")
    {
        with (obj_room_castle_tv)
            con = 0;
        
        skip = 1;
    }
    
    if (extflag == "construction")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Mystery game^1! Currently under construction!)/%", "obj_readable_room1_slash_Other_10_gml_4721_0");
    }
    
    if (extflag == "rhythm_closed")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Currently under construction!)/", "obj_readable_room1_slash_Other_10_gml_4727_0");
        msgnextloc("* (Would be done if there were more recruits from TV World!)/%", "obj_readable_room1_slash_Other_10_gml_4728_0");
    }
    
    if (extflag == "desk_empty")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Now recruiting someone to be at this desk^1! Yikes!)/%", "obj_readable_room1_slash_Other_10_gml_4734_0");
    }
    
    if (extflag == "mike_door")
    {
        with (obj_room_castle_tv_mike_door)
            show_convo("mike_door");
        
        skip = 1;
    }
}

if (room == room_dw_castle_tv_rhythm)
{
    if (extflag == "pippins")
    {
        global.msc = 1439;
        scr_text(global.msc);
    }
    else if (extflag == "poster")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (RHYTHM GAME^1! Press the buttons in time with the notes to get a high score!)/", "obj_readable_room1_slash_Other_10_gml_4747_0");
        msgnextloc("* (Ask PIPPINS and SHADOWGUY for more details!)/%", "obj_readable_room1_slash_Other_10_gml_4748_0");
    }
    else
    {
        if (i_ex(obj_room_castle_tv_rhythm))
            obj_room_castle_tv_rhythm.select_door(extflag);
        
        global.msc = 1441;
        scr_text(global.msc);
    }
}

if (room == room_dw_castle_rooms_kris)
{
    if (string_pos("krisroom_", extflag) != 0)
    {
        if (i_ex(obj_room_castle_kris))
        {
            skip = 1;
            obj_room_castle_kris.show_convo(extflag, read);
        }
    }
}

if (room == room_dw_castle_rooms_susie)
{
    if (string_pos("susieroom_", extflag) != 0)
    {
        if (i_ex(obj_room_castle_susie))
        {
            skip = 1;
            obj_room_castle_susie.show_convo(extflag, read);
        }
    }
}

if (room == room_dw_ralsei_castle_1f)
{
    if (x > 350 && x < 450)
        msgsetloc(0, "* (2F : LIVING QUARTERS)&* (3F : EXTENDED LIVING QUARTERS! NEW!)/%", "obj_readable_room1_slash_Other_10_gml_3040_0");
    
    if (x > 570 && x < 680)
        msgsetloc(0, "* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_1948_0");
    
    if (x > 950 && x < 1050)
        msgsetloc(0, "* (BF : LIVING QUARTERS FOR BAD GUYS)/%", "obj_readable_room1_slash_Other_10_gml_1953_0");
    
    if (string_pos("castle_1f_", extflag) != 0)
    {
        if (i_ex(obj_ch5_LW07))
        {
            skip = 1;
            
            if (extflag == "castle_1f_queen" && scr_flag_get(1427) == 0 && global.facing != 2)
                exit;
            
            obj_ch5_LW07.show_convo(extflag);
        }
    }
}

if (room == room_dw_ralsei_castle_2f)
{
    if (x > 1040 && x < 1150)
    {
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EA* Hey Ralsei^1, what's up here?/", "obj_readable_room1_slash_Other_10_gml_1964_0");
            scr_anyface_next("ralsei", 2);
            msgnextloc("\\E2* Oh^1, just more rooms I'm renovating!/", "obj_readable_room1_slash_Other_10_gml_1966_0");
            scr_anyface_next("susie", 2);
            msgnextloc("\\E2* ..^1. so is your room up there?/", "obj_readable_room1_slash_Other_10_gml_1968_0");
            scr_anyface_next("ralsei", 26);
            msgnextloc("\\EQ* Er^1, yes^1! I still^1, um^1, haven't dusted it though.../", "obj_readable_room1_slash_Other_10_gml_1970_0");
            scr_anyface_next("susie", 2);
            msgnextloc("\\E2* Yeah^1, like we need to see your nerdy glasses collection anyway./%", "obj_readable_room1_slash_Other_10_gml_1972_0");
        }
        else
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EG* Sorry^1, work in progress!/%", "obj_readable_room1_slash_Other_10_gml_1976_0");
        }
    }
}

if (room == room_dw_ralsei_castle_3f)
{
    if (x > 1220 && y < 250)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Your friends are still in Ralsei's room...)/%", "obj_readable_room1_slash_Other_10_gml_3084_0");
    }
    
    if (extflag == "tea_party_prompt")
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E6* Hey^1, what's past here...?/", "obj_readable_room1_slash_Other_10_gml_3090_0");
        scr_anyface_next("ralsei", "9");
        msgnextloc("\\E9* Um..^1. instead of looking over there.../", "obj_readable_room1_slash_Other_10_gml_3092_0");
        msgnextloc("\\EQ* How about seeing the \\cYspecial surprise\\cW in your rooms?/%", "obj_readable_room1_slash_Other_10_gml_3093_0");
    }
    else if (extflag == "ralsei_room_prompt")
    {
        if (i_ex(obj_ch4_PDC06A))
        {
            with (obj_ch4_PDC06A)
                con = 0;
        }
        
        skip = 1;
    }
}

if (room == room_dw_castle_rooms_ralsei)
{
    if (string_pos("ralseiroom_", extflag) != 0)
    {
        skip = 1;
        
        if (i_ex(obj_room_castle_ralsei))
            obj_room_castle_ralsei.show_convo(extflag, read);
    }
    else
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The curtains are fluttering.)/%", "obj_readable_room1_slash_Other_10_gml_3288_0");
        
        if (scr_flag_get(710) == 2 && scr_flag_get(1458) == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Even though he changed his room^1, the window stayed.)/", "obj_readable_room1_slash_Other_10_gml_942_0");
            msgnextloc("* (More proof that Ralsei really likes Window.)/%", "obj_readable_room1_slash_Other_10_gml_943_0");
        }
        else if (!i_ex(obj_ch4_PDC06B))
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Ralsei said he had no hobbies^1, but he at least likes Window.)/%", "obj_readable_room1_slash_Other_10_gml_3293_0");
        }
    }
}

if (room == room_dw_castle_town)
{
    if (extflag == "bakery_sign")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Mama Miba^1! Welcome to TOP Bakery!/", "obj_readable_room1_slash_Other_10_gml_2124_0");
        msgnextloc("* Our special chefs spin baked goods at the TOP of their class!/%", "obj_readable_room1_slash_Other_10_gml_2125_0");
    }
    
    if (extflag == "closed_tv")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems that the building isn't ready to open yet...)/", "obj_readable_room1_slash_Other_10_gml_3126_0");
        msgnextloc("* (Maybe there wasn't enough staff.)/%", "obj_readable_room1_slash_Other_10_gml_3127_0");
    }
    
    if (extflag == "cyber_door")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a classic Cyber City style building that you can't actually go inside.)/%", "obj_readable_room1_slash_Other_10_gml_974_0_b");
    }
    
    if (string_pos("mizzle", extflag) != 0)
    {
        skip = 1;
        
        if (i_ex(obj_npc_castle_town_mizzle))
            obj_npc_castle_town_mizzle.show_convo(extflag, read);
    }
}

if (room == room_dw_castle_restaurant)
{
    if (extflag == "dojo_master")
    {
        with (obj_npc_dojo)
            event_user(0);
        
        exit;
    }
    else if (extflag == "bakery_jack")
    {
        skip = 1;
        
        with (obj_npc_castle_bakery_jackenstein)
            show_convo("bakery_jack");
    }
}

if (room == room_dw_castle_east_door)
{
    if (sprite_index == spr_tasque_idle_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems like it's gone stray without its master...)/%", "obj_readable_room1_slash_Other_10_gml_2160_0");
    }
    
    if (sprite_index == spr_maus_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Squeak...)/%", "obj_readable_room1_slash_Other_10_gml_2165_0");
    }
    
    if (sprite_index == spr_npc_poppup)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* TANJOUBY.../%", "obj_readable_room1_slash_Other_10_gml_2170_0");
    }
    
    if (sprite_index == spr_traffic_car_side_legs_small_left)
    {
        skip = 1;
        snd_play(snd_smallcar_yelp);
    }
}

if (room == room_dw_castle_dojo)
{
    scr_speaker("no_name");
    global.msg[0] = stringsetloc("* (It's a bed for three people^1, or one three-headed person.)/%", "obj_readable_room1_slash_Other_10_gml_2177_0");
    
    if (string_pos("dojo_", extflag) != 0)
    {
        skip = 1;
        
        if (i_ex(obj_room_castle_dojo))
            obj_room_castle_dojo.show_convo(extflag);
    }
}

if (room == room_lw_computer_lab)
{
    if (x > 40 && x < 60 && y > 40 && y < 50)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The closet is spacious and full of old electronics.)/", "obj_readable_room1_slash_Other_10_gml_2318_0");
        msgnextloc("* (A large person could easily fit inside.)/%", "obj_readable_room1_slash_Other_10_gml_2319_0");
    }
    
    if (x > 150 && x < 170 && y > 115 && y < 130)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like the library's state-of-the-art public laptop.)/", "obj_readable_room1_slash_Other_10_gml_2326_0");
        msgnextloc("* (Someone left it on.)/%", "obj_readable_room1_slash_Other_10_gml_2327_0");
    }
    
    if (x > 220 && x < 250 && y > 40 && y < 50)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's full of many backup devices^1, like extra mice^1, extra keyboards^1, or extra maracas.)/%", "obj_readable_room1_slash_Other_10_gml_2334_0");
    }
    
    if (x > 70 && x < 95 && y > 90 && y < 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a computer. The monitor is flickering brightly.)/%", "obj_readable_room1_slash_Other_10_gml_2341_0");
    }
    
    if (x > 220 && x < 240 && y > 100 && y < 110)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2348_0");
        msgnextloc("* (A dolphin screensaver is advertising some kind of malware.)/%", "obj_readable_room1_slash_Other_10_gml_2349_0");
    }
    
    if (x > 220 && x < 240 && y > 120 && y < 140)
    {
        if (global.flag[309] < 9)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2360_0");
            msgnextloc("* (Someone tried to check their email^1, but the Internet is down.)/%", "obj_readable_room1_slash_Other_10_gml_2361_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2366_0");
            msgnextloc("* (... it's nothing but a blue screen. Looks like it crashed.)/%", "obj_readable_room1_slash_Other_10_gml_2367_0");
        }
    }
    
    if (x > 120 && x < 140 && y > 25 && y < 40)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Various posters talking about Internet safety.)/%", "obj_readable_room1_slash_Other_10_gml_2377_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You suddenly thought about how your day might have been different...)/", "obj_readable_room1_slash_Other_10_gml_2381_0");
            msgnextloc("* (..^1. if the poster with that orange cat was still on the wall.)/%", "obj_readable_room1_slash_Other_10_gml_2382_0");
        }
    }
    
    if (x > 30 && x < 40 && y > 170 && x < 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a trashcan. You get the feeling it doesn't have any friends.)/", "obj_readable_room1_slash_Other_10_gml_2390_0");
        msgnextloc("* (It's hard to explain why you feel this way about a trashcan.)/%", "obj_readable_room1_slash_Other_10_gml_2391_0");
    }
    
    if (x > 230 && x < 250 && y > 170 && y < 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a recycling bin.)/", "obj_readable_room1_slash_Other_10_gml_2398_0");
        msgnextloc("* (Looks like someone accidentally printed off a lot of useless emails.)/%", "obj_readable_room1_slash_Other_10_gml_2399_0");
    }
}

if (room == room_dw_castle_cafe)
{
    skip = 1;
    
    if (string_pos("cafe_", extflag) != 0)
    {
        if (i_ex(obj_npc_castle_cafe))
            obj_npc_castle_cafe.show_convo(extflag);
    }
}

if (room == room_town_school)
{
    if (extflag == "doors_blocked")
    {
        skip = 1;
        
        with (obj_room_town_school)
            con = 1;
    }
    else if (string_pos("w_school", extflag) != 0)
    {
        if (i_ex(obj_room_town_school))
        {
            skip = 1;
            obj_room_town_school.show_convo(extflag);
        }
    }
    else if (string_pos("shiny_", extflag) != 0)
    {
        if (i_ex(obj_town_w_shining))
        {
            skip = 1;
            obj_town_w_shining.show_convo(extflag);
        }
    }
}

if (room == room_town_church)
{
    skip = 1;
    
    if (string_pos("rudy_", extflag) != 0)
    {
        if (i_ex(obj_town_church_rudy))
            obj_town_church_rudy.show_convo(extflag, read);
    }
    else if (string_pos("church_", extflag) != 0)
    {
        if (i_ex(obj_room_town_church))
            obj_room_town_church.show_convo(extflag, read);
    }
}

if (room == room_lw_church_entrance)
{
    skip = 1;
    
    if (string_pos("church_", extflag) != 0)
    {
        if (i_ex(obj_church_entrance_festival))
            obj_church_entrance_festival.show_convo(extflag);
    }
}

if (room == room_castle_tutorial)
{
    skip = 1;
    
    if (string_pos("tutorial_", extflag) != 0)
    {
        if (i_ex(obj_castle_tutorial))
            obj_castle_tutorial.show_convo(extflag, read);
    }
}

if (room == room_town_krisyard)
{
    skip = 1;
    
    if (string_pos("w_krisyard", extflag) != 0)
    {
        if (i_ex(obj_room_town_krisyard))
            obj_room_town_krisyard.show_convo(extflag);
    }
}

if (room == room_dw_castle_music)
{
    skip = 1;
    
    if (string_pos("music_shop", extflag) != 0)
    {
        if (i_ex(obj_room_castle_music))
            obj_room_castle_music.show_convo(extflag);
    }
}

if (room == room_dw_castle_tv_mike)
{
    skip = 1;
    
    if (string_pos("mike_", extflag) != 0)
    {
        if (i_ex(obj_room_castle_tv_mike))
            obj_room_castle_tv_mike.show_convo(extflag, read);
    }
}

if (room == room_dw_castle_tv_kikky)
{
    skip = 1;
    
    if (i_ex(obj_room_castle_tv_kikky))
        obj_room_castle_tv_kikky.show_convo(extflag);
}

if (room == room_dw_garden_hospital)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a flowerbed.)/%", "obj_readable_room1_slash_Other_10_gml_1272_0");
}

if (room == room_dw_post_flowery_battle)
{
    skip = 1;
    
    if (global.plot >= 500)
    {
        if (instance_exists(obj_ch5_DW40))
        {
            if (global.facing == 0)
                exit;
            
            obj_ch5_DW40.show_convo(extflag, read);
        }
    }
}

if (room == room_dw_fcastle_top_fountain)
{
    skip = 1;
    
    if (instance_exists(obj_ch5_DW45))
        obj_ch5_DW45.show_convo(extflag, read);
}

if (room == room_dw_ralsei_castle_front)
{
    skip = 1;
    
    if (string_pos("racer_", extflag) != 0)
    {
        if (instance_exists(obj_room_castle_front_racer))
        {
            var racer_name = extflag;
            
            with (obj_room_castle_front_racer)
            {
                if (racer_name == ("racer_" + _name))
                    play_sound();
            }
        }
    }
    else if (instance_exists(obj_room_castle_front_race))
    {
        obj_room_castle_front_race.show_convo(extflag, read);
    }
}

if (room == room_beach)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (Not a good bed.)/%", "obj_readable_room1_slash_Other_10_gml_1324_0_b");
}

if (room == room_truelab_hub)
{
    scr_speaker("no_name");
    msgset(0, "* (An old looking vending machine.)/");
    msgnext("* (Seems its out of order.)/%");
}

if (skip == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);

read += 1;

if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}
