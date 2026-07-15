switch (keytype)
{
    case 0:
        if (global.doorstage[0] == 0)
        {
            turnedoffmes = "* (It's some kind of switch.^1)&* (There's a red-colored slot in the center.)/%";
        }
        else if (global.doorstage[0] == 1)
        {
            turnedmes = "* (Click!^1)&* (The red key fits perfectly into the slot.)/%";
        }
        else
        {
            alreadyturnedmes = "* (The red switch has been turned on.)/%";
        }
        break;
    case 1:
        if (global.doorstage[0] == 0)
        {
            turnedoffmes = "* (It's some kind of switch.^1)&* (There's a blue-colored slot in the center.)/%";
        }
        else if (global.doorstage[0] == 1)
        {
            turnedmes = "* (Click!^1)&* (The blue key fits perfectly into the slot.)/%";
        }
        else
        {
            alreadyturnedmes = "* (The blue switch has been turned on.)/%";
        }
        break;
    case 2:
        if (global.doorstage[0] == 0)
        {
            turnedoffmes = "* (It's some kind of switch.^1)&* (There's a green-colored slot in the center.)/%";
        }
        else if (global.doorstage[0] == 1)
        {
            turnedmes = "* (Click!^1)&* (The green key fits perfectly into the slot.)/%";
        }
        else
        {
            alreadyturnedmes = "* (The green switch has been turned on.)/%";
        }
        break;
    case 3:
        if (global.doorstage[0] == 0)
        {
            turnedoffmes = "* (It's some kind of switch.^1)&* (There's a yellow-colored slot in the center.)/%";
        }
        else if (global.doorstage[0] == 1)
        {
            turnedmes = "* (Click!^1)&* (The yellow key fits perfectly into the slot.)/%";
        }
        else
        {
            alreadyturnedmes = "* (The yellow switch has been turned on.)/%";
        }
        break;
}
if (global.doorstage[keytype] == 0)
{
    msgsetup(turnedoffmes);
}
else if (global.doorstage[keytype] == 1)
{
    msgsetup(turnedmes);
}
else
{
    msgsetup(alreadyturnedmes);
}
if (global.doorstage[keytype] != 0)
{
    keyin = 1;
}
