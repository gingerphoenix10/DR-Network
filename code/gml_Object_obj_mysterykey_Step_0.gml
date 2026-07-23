if (!instance_exists(obj_gfollower))
    visible = 1;
else
    visible = 0;

if (!visible)
    exit;

event_inherited();
image_speed = 0.2;

if (read >= 1 && !instance_exists(obj_dialoguer))
{
    global.doorstage[keylook] = 1;
    instance_destroy();
}
