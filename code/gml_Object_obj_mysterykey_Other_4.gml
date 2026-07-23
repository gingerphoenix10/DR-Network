switch (keylook)
{
    case 0:
        msgsetup("* (You found a red key on the ground.^1)&* (You put it on your keychain.)/%");
        image_blend = c_red;
        break;
    
    case 1:
        msgsetup("* (You found a blue key on the ground.^1)&* (You put it on your keychain.)/%");
        image_blend = c_blue;
        break;
    
    case 2:
        msgsetup("* (You found a green key on the ground.^1)&* (You put it on your keychain.)/%");
        image_blend = c_green;
        break;
    
    case 3:
        msgsetup("* (You found a yellow key on the ground.^1)&* (You put it on your keychain.)/%");
        image_blend = c_yellow;
        break;
}

if (global.doorstage[keylook] > 0)
    instance_destroy();
