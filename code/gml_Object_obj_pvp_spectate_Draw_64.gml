if (!variable_global_exists("spectating"))
    exit;

var spectatingCharacter = instance_find(obj_charafake, global.spectating);
var spectatingName = "name";

if (instance_exists(spectatingCharacter))
    spectatingName = spectatingCharacter.nickname;

draw_set_font(fnt_8bit);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(320, 430, "SPECTATING <" + string_upper(spectatingName) + ">");
