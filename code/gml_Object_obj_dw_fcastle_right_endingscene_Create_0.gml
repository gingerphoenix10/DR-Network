plot_check_on = true;
plot_flag = 1455;
plot_post = 80;
con = 0;
customcon = 0;
timer = 0;
init = 0;
sndtoggle = false;
didralseiside = false;
turnofflayers("CUTSCENE");
turnofflayers("NPCs");

if (scr_debug())
    scr_setparty(1, 1);

if (plot_check_on == false || scr_flag_get(plot_flag) < plot_post)
    con = 0;
else
    con = 999;

make_choice = function(arg0 = 1)
{
    var d = d_make();
    d.side = arg0;
};

draw_reflection = function()
{
    if (instance_exists(owner))
    {
        if (owner.object_index == obj_charafake && (owner.you || owner.roomin != room))
            exit;
        else if (owner.object_index == obj_caterpillarchara && !global.showcompanions)
            exit;
        
        if (owner.visible)
        {
            scr_spritematch(owner);
            var _scale = 1;
            x = owner.x;
            y = (owner.y - (owner.sprite_yoffset * 2)) + (owner.sprite_height * 2);
            
            if (variable_instance_exists(owner, "scale"))
            {
                _scale = owner.scale;
                y = owner.y;
            }
            
            depth = mindepth + owner.depth;
            image_yscale = -owner.image_yscale;
            image_xscale = owner.image_xscale;
            image_alpha = 1;
            
            if (bbox_top > 240)
                draw_sprite_ext(sprite_index, image_index, x, y - offset, image_xscale * _scale, image_yscale * _scale, image_angle, image_blend, image_alpha);
        }
    }
    else
    {
        instance_destroy();
    }
};

reflectobjs = [1198, 1389, 1735];

for (var i = 0; i < array_length(reflectobjs); i++)
{
    with (reflectobjs[i])
    {
        if (object_index == obj_charafake && (you || roomin != room))
            continue;
        
        myreflection = instance_create_layer(x, y, layer_get_id("REFLECTSURF"), obj_marker_fancy);
        
        with (myreflection)
        {
            mindepth = depth;
            owner = other.id;
            depth = mindepth + owner.depth;
            wave = 0;
            offset = 0;
            draw_func = method(id, obj_dw_fcastle_right_endingscene.draw_reflection);
            show_debug_message_concat("making reflection for ", object_get_name(owner.object_index));
        }
    }
}

make_reflection = function(arg0)
{
    if (arg0.object_index == obj_charafake && (arg0.you || arg0.roomin != room))
        exit;
    else if (arg0.object_index == obj_caterpillarchara && !global.showcompanions)
        exit;
    
    var _reflectionmarker = instance_create_layer(x, y, layer_get_id("REFLECTSURF"), obj_marker_fancy);
    
    with (_reflectionmarker)
    {
        mindepth = depth;
        owner = arg0.id;
        depth = mindepth + owner.depth;
        wave = 0;
        offset = 0;
        draw_func = method(id, obj_dw_fcastle_right_endingscene.draw_reflection);
        show_debug_message_concat("making reflection for ", object_get_name(owner.object_index), " at depth: ", depth);
    }
    
    return _reflectionmarker;
};

npc_green = -4;
npc_orange = -4;

if (global.flag[1455] == 100)
{
    var _a = scr_marker_fromasset(findsprite(spr_zengarden_plants, "NPCs", c_white));
    
    with (_a)
    {
        scr_depth(self, -40);
        image_blend = c_white;
    }
    
    _a = scr_marker_fromasset(findsprite(spr_zengarden_plants, "NPCs", c_red));
    
    with (_a)
    {
        scr_depth(self, -40);
        image_blend = c_white;
    }
    
    _a = scr_marker_fromasset(findsprite(spr_zengarden_plants, "NPCs", c_lime));
    
    with (_a)
    {
        scr_depth(self, -40);
        image_blend = c_white;
    }
    
    scr_miniface_init_flowers();
    npc_green = scr_makenpc_fromasset(findsprite(spr_enemy_green_behind, "NPCs"));
    scr_setnpclogic(npc_green, 
    {
        animspeed: 0,
        alwaysanimate: true
    }, function(arg0)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Messing with an edible flower arrangement...)/%", "obj_dw_fcastle_right_endingscene_slash_Create_0_gml_125_0");
    });
    npc_orange = scr_makenpc_fromasset(findsprite(spr_enemy_orange_walk_up, "NPCs"));
    scr_setnpclogic(npc_orange, 
    {
        animspeed: 0,
        alwaysanimate: true
    }, function(arg0)
    {
        scr_speaker("orange");
        msgsetsubloc(0, "~1* Asgore..^1. he'll be able to~2walk everywhere^1. To~2own everything!/", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_right_endingscene_slash_Create_0_gml_130_0");
        msgnextsubloc("~1* And the flowers..^1. they'll~2take care of themselves!/%", (global.lang == "ja") ? "\\m2\t\t\t" : "\\m2\t\t", (global.lang == "ja") ? "&\t\t\t\t" : "&\t\t", "obj_dw_fcastle_right_endingscene_slash_Create_0_gml_131_0");
    });
}

with (obj_caterpillarchara)
{
    if (name == "ralsei")
        y--;
}
