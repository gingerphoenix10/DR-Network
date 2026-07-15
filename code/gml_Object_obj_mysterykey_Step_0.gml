if (!instance_exists(1743))
{
    visible = 1;
}
else
{
    visible = 0;
}
if (!visible)
{
    exit;
}
event_inherited();
image_speed = 0.2;
if (read >= 1 && !instance_exists(400))
{
    global.doorstage[keylook] = 1;
    instance_destroy();
}
