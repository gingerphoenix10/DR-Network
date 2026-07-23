var meminteract = global.interact;
global.msc = 0;
global.typer = 5;

if (global.darkzone == 1)
    global.typer = 6;

myinteract = 3;
global.fc = 0;
global.fe = 0;
global.interact = 1;
image_speed = 0.2;
global.msgno = 0;
scr_speaker("no_name");

switch (gfollowertype)
{
    case 0:
        if (!isg)
        {
            msgbetter("* Doc conducts the final tests of the CORE./");
            msgbetter("* Did you know that it powers up this entire laboratory?/");
            msgbetter("* And soon, the energy will spread throughout the whole underground./%");
        }
        else
        {
            msgbetter("* Some monsters say that they witnesed his fall./");
            msgbetter("* His doom was not a mere accident./");
            msgbetter("* They say, something caused it./");
            msgbetter("* Someone./%");
        }
        
        break;
    
    case 1:
        if (!isg)
        {
            msgbetter("* Boy, I'm so hungry.../");
            msgbetter("* Oh hey there, do you by any chance have any food with you?");
            msgbetter("* Dr. Gaster appointed me as the chief researcher of this weird rock in my hand./");
            msgbetter("* I haven't taken my eyes off it since then./");
            msgbetter("* But hey, if you could by chance find me some snack, I'd really appreciate it./");
            msgbetter("* I wouldn't even turn down a donut./%");
        }
        else
        {
            msgbetter("* But you know what they say, about the dead either good or nothing./");
            msgbetter("* Oh? No, I don't mean Dr. Gaster./");
            msgbetter("* Although why am I telling you this? You know what happened much better than me./");
            msgbetter("* After all, you was there beside him, wasn't you?/%");
        }
        
        break;
    
    case 2:
        if (!isg)
        {
            msgbetter("* Doс conducts the final tests of the CORE./");
            msgbetter("* Did you know that it powers up this entire laboratory?/");
            msgbetter("* And soon, the energy will spread throughout the whole underground./%");
        }
        else
        {
            msgbetter("* Soon you'll meet him again, at last./");
            msgbetter("* Tragedy repeats itself, over and over again./");
            msgbetter("* Poor Doctor stuck in this eternal loop./");
            msgbetter("* A piece of him anyway./");
            msgbetter("* Ready to relive what you caused?/%");
        }
        
        break;
    
    case 3:
        if (!isg)
        {
            msgbetter("* Suzy! Suzy!/");
            msgbetter("* I'm sorry, have you seen Suzy?/");
            msgbetter("* Today is Bring Your Kid to Work Day./");
            msgbetter("* And since my neighbor is workless, he asked me to take his daughter to my work./");
            msgbetter("* But I lost sight of her while I was looking at this lovely dog bowl.../");
            msgbetter("* Can you help me find her?/%");
        }
        else
        {
            msgbetter("* A kid was with him that day./");
            msgbetter("* I saw them right from the entrance./");
            msgbetter("* Was that a monster?/");
            msgbetter("* Human?/%");
        }
        
        break;
}

if (!skip)
{
    remanimspeed = image_speed;
    mydialoguer = instance_create(0, 0, obj_dialoguer);
}

if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}

talked += 1;
