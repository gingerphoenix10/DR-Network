global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

global.fc = 0;
global.fe = 0;
global.interact = 1;
nodialogue = 1;
global.currentroom = room;

if (room == room_dw_castle_town)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (Once again you find yourself in a familiar town.)/", "obj_savepoint_slash_Other_10_gml_20_0");
    msgnextloc("* (You are filled with the power of conspicuously normal music.)/%", "obj_savepoint_slash_Other_10_gml_21_0");
    var recruited_all = scr_recruited_all_previous();
    
    if (recruited_all)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Funky music emerges from the cafe and fills the town.)/", "obj_savepoint_slash_Other_10_gml_27_0");
        msgnextloc("* (You are filled with the power of funky town.)/%", "obj_savepoint_slash_Other_10_gml_28_0");
    }
    
    if (scr_sideb_active())
        nodialogue = 1;
}
else if (room == room_dw_garden_intro)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The moist earth blooms before you^1, in a path of magnolia and rose.)/", "obj_savepoint_slash_Other_10_gml_48_0");
    msgnextloc("* (You are filled with a certain power.)/%", "obj_savepoint_slash_Other_10_gml_49_0");
}
else if (room == room_dw_garden_floradinnencounter)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The fragrance of familiar days.)&* (An old power returns to you.)/%", "obj_savepoint_slash_Other_10_gml_55_0_b");
}
else if (room == room_dw_garden_enemyrush)
{
    if (global.plot < 254)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (The Powery of Flowery.)/%", "obj_savepoint_slash_Other_10_gml_63_0");
    }
}
else if (room == room_dw_garden_diner)
{
    if (global.plot == 255)
    {
        nodialogue = 0;
        scr_speaker("no_name");
        msgsetloc(0, "* (It smells like if a diner was built only out of vegetarian ingredients.)/", "obj_savepoint_slash_Other_10_gml_72_0");
        msgnextloc("* (You are filled with a vegetarian power.)/%", "obj_savepoint_slash_Other_10_gml_73_0");
    }
}
else if (room == room_dw_garden_aquadash)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (Far above^1, the crack below a door shines like a forbidden star.)/", "obj_savepoint_slash_Other_10_gml_80_0");
    msgnextloc("* (But^1, you know you will not return that way.)/%", "obj_savepoint_slash_Other_10_gml_81_0");
}
else if (room == room_dw_garden_aquahole)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (Through the overgrowth^1, an abandoned shrine lies before you...)/", "obj_savepoint_slash_Other_10_gml_87_0");
    msgnextloc("* (You are filled with a certain power.)/%", "obj_savepoint_slash_Other_10_gml_88_0");
}
else if (room == room_dw_garden_cliffexit)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (Flower Castle looms in the distance^1, breathing a black pillar into the sky...)/", "obj_savepoint_slash_Other_10_gml_94_0_b");
    msgnextloc("* (You are filled with the power of usually going to Castles.)/%", "obj_savepoint_slash_Other_10_gml_95_0");
}
else if (room == room_dw_cliff_shop)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (A shop on the cliff^1, turned to face the light like a sunflower...)/%", "obj_savepoint_slash_Other_10_gml_101_0");
}
else if (room == room_dw_cliff_verticalwind_post)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (Minerals run down the edge of the hard wall..^1. the castle is above.)/%", "obj_savepoint_slash_Other_10_gml_107_0");
}
else if (room == room_dw_fcastle_second_diner)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (It smells like if a second diner was built out of first diner.)/", "obj_savepoint_slash_Other_10_gml_113_0");
    msgnextloc("* (You are filled with a certain diner.)/%", "obj_savepoint_slash_Other_10_gml_114_0");
}
else if (room == room_dw_fcastle_blueroom)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (Hushed voices wither with excitement^1. A play will begin soon...)/%", "obj_savepoint_slash_Other_10_gml_120_0");
    
    if (scr_flag_get(1454) >= 40)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Hushed voices wither with excitement^1. Probably a good performance.)/%", "obj_savepoint_slash_Other_10_gml_125_0");
    }
}
else if (room == room_dw_fcastle_top_entrance)
{
    nodialogue = 0;
    scr_speaker("no_name");
    msgsetloc(0, "* (The sky is running fast..^1. the Fountain must lie at its edge.)/", "obj_savepoint_slash_Other_10_gml_132_0");
    msgnextloc("* (You are filled with a certain power.)/%", "obj_savepoint_slash_Other_10_gml_133_0");
}
else if (room == room_dw_fcastle_post_party_jail)
{
    if (obj_mainchara.x < 340)
    {
        if (global.plot < 399)
        {
            nodialogue = 0;
            
            if (scr_flag_get(1839) == 0)
                scr_flag_set(1839, 1);
            
            scr_speaker("no_name");
            msgsetloc(0, "* (You have successfully escaped from jail...)/", "obj_savepoint_slash_Other_10_gml_148_0");
            msgnextloc("* (You are filled with the power of obligatory jail scene.)/%", "obj_savepoint_slash_Other_10_gml_149_0");
        }
    }
    else if (global.plot >= 399 && scr_flag_get(1839) >= 1)
    {
        nodialogue = 0;
        
        if (scr_flag_get(1839) < 2)
            scr_flag_set(1839, 2);
        
        scr_speaker("no_name");
        msgsetloc(0, "* (The previous filled with power jail thing is cancelled.)/", "obj_savepoint_slash_Other_10_gml_163_0");
        msgnextloc("* (You are now filled with power from Temporary Butler Ralsei.)/%", "obj_savepoint_slash_Other_10_gml_164_0");
    }
}

if (instance_exists(obj_dw_fcastle_second_diner))
{
    if (y > (ystart - 20))
    {
        if (talked == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's conspicuously off the table.)/", "obj_savepoint_slash_Other_10_gml_188_0");
            msgnextloc("* (You reach out to put it back on the table^1, and...)/%", "obj_savepoint_slash_Other_10_gml_189_0");
            nodialogue = 0;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You realized you don't know how to pick this up.)/%", "obj_savepoint_slash_Other_10_gml_193_0");
            nodialogue = 0;
        }
        
        scr_flag_set_ext(1765, 0, 1);
    }
}

myinteract = 3;

if (nodialogue == 0)
    mydialoguer = instance_create(0, 0, obj_dialoguer);

talked += 1;
snd_play(snd_power);

for (i = 0; i < 5; i += 1)
{
    if (global.hp[i] < global.maxhp[i])
        global.hp[i] = global.maxhp[i];
}
