var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();

if (noDialogue >= 0)
{
    timer++;
    
    if (noDialogue >= array_length(dialogueLines))
    {
        draw_sprite_ext(spr_roaringknight_slash_white_horizontal, 0, (guiwd / 2) - 180, guihg / 2, 1.5, 1.5, 0, c_white, 1);
        
        if (timer > 15)
            game_end();
        
        exit;
    }
    
    draw_set_valign(fa_middle);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_set_font(fnt_mainbig);
    draw_set_alpha(1);
    lines = string_split(dialogueLines[noDialogue], "\n");
    
    for (i = 0; i < array_length(lines); i++)
        draw_text(guiwd / 2, (guihg / 2) + (i * 30), lines[i]);
    
    if (button1_p() || button3_h())
        noDialogue++;
    
    if (noDialogue >= array_length(dialogueLines))
    {
        timer = 0;
        var _snd = snd_play(snd_knight_cut2);
        snd_volume(_snd, 8, 0);
        snd_pitch(_snd, 0.06);
        _snd = snd_play(snd_knight_cut2);
        snd_volume(_snd, 8, 0);
        snd_pitch(_snd, 0.1);
        _snd = snd_play(snd_knight_cut2);
        snd_volume(_snd, 8, 0);
        snd_pitch(_snd, 0.12);
        _snd = snd_play(snd_knight_cut2);
        snd_volume(_snd, 8, 0);
        snd_pitch(_snd, 0.18);
        _snd = snd_play(snd_knight_cut2);
        snd_volume(_snd, 8, 0);
        snd_pitch(_snd, 0.24);
    }
    
    exit;
}

var scale = 2;
var dialoguewidth = guiwd / 2;
var dialogueheight = guihg - (50 * scale);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_mainbig);
FramesToComplete = 60;
FramesBeforeStart = 30;
Distance = 50;
tween = 0;

if (timer > FramesBeforeStart)
    tween = (((timer - FramesBeforeStart) / FramesToComplete) == 1) ? 1 : (1 - power(2, -10 * ((timer - FramesBeforeStart) / FramesToComplete)));

if (fadeToGame)
    tween = ((timer / (FramesToComplete / 2)) == 1) ? 0 : power(2, -10 * (timer / (FramesToComplete / 2)));

space = x;
height = 200;
image_alpha = tween;
arg0 = space;
arg1 = y - (tween * Distance);
arg2 = guiwd - space;
arg3 = (y + height) - (tween * Distance);
draw_set_color(c_black);
d_rectangle(arg0 + 20, arg1 + 20, arg2 - 20, arg3 - 20, false);

if (!variable_instance_exists(id, "cur_jewel"))
    cur_jewel = 0;

cur_jewel += 1;
textbox_width = arg2 - arg0 - 63;

if (textbox_width < 0)
    textbox_width = 0;

textbox_height = arg3 - arg1 - 63;

if (textbox_height < 0)
    textbox_height = 0;

if (textbox_width > 0)
{
    draw_sprite_stretched_ext(spr_textbox_top, 0, arg0 + 32, arg1, textbox_width, 32, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_top, 0, arg0 + 32, arg3 + 1, textbox_width, -2, 0, c_white, image_alpha);
}

if (textbox_height > 0)
{
    draw_sprite_ext(spr_textbox_left, 0, arg2 + 1, arg1 + 32, -2, textbox_height, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_left, 0, arg0, arg1 + 32, 2, textbox_height, 0, c_white, image_alpha);
}

if (global.flag[8] == 0)
{
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg0, arg1, 2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg2 + 1, arg1, -2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg0, arg3 + 1, 2, -2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, cur_jewel / 10, arg2 + 1, arg3 + 1, -2, -2, 0, c_white, image_alpha);
}
else
{
    draw_sprite_ext(spr_textbox_topleft, 0, arg0, arg1, 2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, 0, arg2 + 1, arg1, -2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, 0, arg0, arg3 + 1, 2, -2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_textbox_topleft, 0, arg2 + 1, arg3 + 1, -2, -2, 0, c_white, image_alpha);
}

draw_set_alpha(tween);
draw_set_font(fnt_mainbig);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_text(dialoguewidth, arg1 + 20, "Warning");
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_text(dialoguewidth, arg1 + 60, "This is an unofficial fork of CMD28's DELTARUNE: Network mod.");
draw_text(dialoguewidth, arg1 + 80, "Please expect bugs, as this version is still in beta. If you'd");
draw_text(dialoguewidth, arg1 + 100, "like to report any bugs, please send them to the fork developer.");
draw_text(dialoguewidth, arg1 + 120, "Knowing this, would you still like to PROCEED?");
draw_set_font(fnt_mainbig);
draw_set_color((selected == 0) ? c_yellow : c_white);
draw_text(dialoguewidth - 60, arg1 + 145, "YES");
draw_set_color((selected == 1) ? c_yellow : c_white);
draw_text(dialoguewidth + 60, arg1 + 145, "NO");
draw_set_color(-1);

if (keyboard_check_pressed(vk_left) && selected != 0)
{
    selected = 0;
    snd_play(snd_menumove);
}

if (keyboard_check_pressed(vk_right) && selected != 1)
{
    selected = 1;
    snd_play(snd_menumove);
}

if (button1_p() && !fadeToGame)
{
    snd_play(snd_select);
    
    if (selected == 0)
    {
        fadeToGame = true;
        timer = 0;
    }
    else
    {
        noDialogue = 0;
    }
}

if (timer > FramesBeforeStart && fadeToGame)
    obj_initializer2.acceptWarning = true;

timer++;
