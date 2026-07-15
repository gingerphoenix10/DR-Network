cur_jewel = 0;
alarm[0] = 1;
charcon = 0;
chartimer = 0;
tp = 0;
xx = camerax();
yy = cameray();
global.fighting = 0;
movenoise = 0;
selectnoise = 0;
cancelnoise = 0;
onebuffer = 0;
twobuffer = 0;
threebuffer = 0;
upbuffer = 0;
downbuffer = 0;
hold_up = 0;
hold_down = 0;
dograndom = 0;
atalk = 0;
deschaver = 0;
evidencecheck = -1;
yellowed = 0;
bcolor = merge_color(8388736, 0, 0.7);
bcolor = merge_color(bcolor, 4210752, 0.5);
chartotal = 0;
havechar[0] = 0;
havechar[1] = 0;
havechar[2] = 0;
havechar[3] = 0;
global.charturn = 3;
tp = 0;
tpy = 50;
bp = 0;
bpy = 152;
mmy[0] = 0;
mmy[1] = 0;
mmy[2] = 0;
mmy[3] = 0;
global.submenu = 0;
global.charselect = -1;
for (var i = 0; i < 36; i += 1)
{
    global.submenucoord[i] = 0;
}
global.cinstance[0] = 4343434343;
global.cinstance[1] = 343434343434;
for (var i = 0; i < 3; i += 1)
{
    global.faceaction[i] = 0;
    if (global.char[i] != 0)
    {
        chartotal += 1;
    }
    if (global.char[i] == 1)
    {
        havechar[0] = 1;
        charpos[0] = i;
    }
    else if (IsPVP())
    {
        continue;
    }
    if (global.char[i] == 2)
    {
        havechar[1] = 1;
        charpos[1] = i;
        if (i > 0)
        {
            global.cinstance[i - 1] = instance_create(obj_mainchara.x - 6, obj_mainchara.y - 16, 1389);
            global.cinstance[i - 1].target = i * 12;
        }
    }
    if (global.char[i] == 3)
    {
        havechar[2] = 1;
        charpos[2] = i;
        if (i > 0)
        {
            global.cinstance[i - 1] = instance_create(obj_mainchara.x - 2, obj_mainchara.y - 12, 1389);
            global.cinstance[i - 1].target = i * 12;
            with (global.cinstance[i - 1])
            {
                name = "ralsei";
                slidesprite = 567;
                if (global.chapter >= 2)
                {
                    usprite = 536;
                    dsprite = 487;
                    rsprite = 526;
                    lsprite = 513;
                    if (global.chapter == 5)
                    {
                        if (scr_flag_get(1311) == 1)
                        {
                            dsprite = 1063;
                            rsprite = 1076;
                            lsprite = 1068;
                            usprite = 1067;
                        }
                    }
                }
                else
                {
                    usprite = 1067;
                    dsprite = 1063;
                    rsprite = 1076;
                    lsprite = 1068;
                }
            }
        }
    }
    if (global.char[i] == 4)
    {
        havechar[3] = 1;
        charpos[3] = i;
        if (i > 0)
        {
            global.cinstance[i - 1] = instance_create(obj_mainchara.x - 4, obj_mainchara.y - 20, 1389);
            global.cinstance[i - 1].target = i * 12;
            with (global.cinstance[i - 1])
            {
                name = "noelle";
                slidesprite = 403;
                usprite = 408;
                dsprite = 403;
                rsprite = 407;
                lsprite = 405;
            }
        }
    }
}
global.charinstance[0] = 1198;
global.charinstance[1] = global.cinstance[0];
global.charinstance[2] = global.cinstance[1];
disablesusieralseiattack = false;
slmxx = 0;
slmyy = 0;
s_siner = 0;
menusiner = 0;
pagemax[0] = 0;
pagemax[1] = 0;
getmusvol = 1;
curvol = 1;
drawchar = 0;
hpcolor[0] = 16776960;
hpcolor[1] = 16711935;
hpcolor[2] = 65280;
hpcolor[3] = 65535;
menu_sprite = scr_84_get_sprite("spr_darkmenudesc");
autorun_text = stringsetloc("Auto-Run", "obj_darkcontroller_slash_Draw_0_gml_94_0");
back_text = stringsetloc("Back", "obj_darkcontroller_slash_Draw_0_gml_96_0");
gamepad_controls = [32769, 32770, 32771, 32772, 32773, 32775, 32774, 32776, 32777, 32778, 32779, 32780, 32781, 32782, 32783, 32784];
border_options = [stringsetloc("Dynamic", "obj_darkcontroller_slash_Create_0_gml_153_0"), stringsetloc("Simple", "obj_darkcontroller_slash_Create_0_gml_153_1"), stringsetloc("None", "obj_darkcontroller_slash_Create_0_gml_153_2")];
var border_options_en = ["Dynamic", "Simple", "None"];
var border_options_ja = ["ダイナミック", "シンプル", "なし"];
if (global.lang == "ja")
{
    for (var i = 0; i < array_length(border_options_en); i++)
    {
        if (border_options_en[i] == global.screen_border_id)
        {
            global.screen_border_id = border_options_ja[i];
            break;
        }
    }
}
else
{
    for (var i = 0; i < array_length(border_options_ja); i++)
    {
        if (border_options_ja[i] == global.screen_border_id)
        {
            global.screen_border_id = border_options_en[i];
            break;
        }
    }
}
selected_border = 0;
for (var i = 0; i < array_length_1d(border_options); i++)
{
    if (border_options[i] == global.screen_border_id)
    {
        selected_border = i;
        break;
    }
}

killfloweryshine = function()
{
    with (1238)
    {
        if (sprite_index == 3397)
        {
            instance_destroy();
        }
    }
    with (1496)
    {
        if (sprite_index == 4624)
        {
            instance_destroy();
        }
    }
};

floweryshine = function()
{
    snd_stop(187);
    snd_play_flowery(187);
    killfloweryshine();
    var cam = scr_getcam();
    var _xloc = camera_get_view_x(view_camera[0]) + 208;
    var _yloc = camera_get_view_y(view_camera[0]) + 184;
    if (global.lang == "ja")
    {
        if (global.submenu == 10)
        {
            _xloc -= 22;
        }
        if (global.submenu == 20)
        {
            _xloc -= 15;
        }
    }
    var smile = scr_marker_ext(_xloc, _yloc, 3397, 2, 2, undefined, undefined, undefined, depth - 1, undefined, 15);
    with (smile)
    {
        image_index = 1;
        scr_doom(id, 10);
        with (scr_marker_fancy(_xloc, _yloc, 4624))
        {
            extflag = "smile";
            depth = -50;
            scr_size(2, 2);
            timer = 0;
            image_speed = 0.25;
            vspeed = -0.5;
            hspeed = 0.5;
            image_alpha = 2;
            gravity = 0.05;
            
            step_func = function()
            {
                image_alpha -= 0.1;
                if (image_alpha < 0)
                {
                    instance_destroy();
                }
            };
        }
    }
};
