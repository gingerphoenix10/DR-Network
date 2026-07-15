if (!variable_global_exists("spectating"))
{
    exit;
}
var spectatingCharacter = instance_find(obj_charafake, global.spectating);
var spectatingName = "name";
if (instance_exists(spectatingCharacter))
{
    spectatingName = spectatingCharacter.nickname;
}
draw_set_font(2);
draw_set_halign(1);
draw_set_color(16777215);
draw_text(320, 430, "SPECTATING <" + string_upper(spectatingName) + ">");
