global.mysteryhello = 0;
global.mysteryin = "no";
global.mysteryphone = [];
global.suzyfound = 0;
global.mysteryflag = [0, 0, 0, 0, 0];
global.doorstage = [0, 0, 0, 0];
global.bookfound = 0;

for (i = 0; i < 8; i += 1)
    global.mysteryphone[i] = 0;

global.targetdoor = -4;
global.sentmessage = 0;
global.saidmessage = "";
global.chatstay = [];
global.chattemp = [];
global.chatsenders = [];
global.chatsenderstemp = [];
notifications = [];
nottime = 75;
chattime = 200;
colors = [65535, 65535, 255, 255, 255, 255, 255, 8388736, 255, 255, 255];
nottext = [" left the game", " joined the game", "Error: Server not found.#Please try connecting again.", "Error: The version of your mod does not match#the version used on the server.", "Error: The server already exists, or the ip you're#trying to host server with is not yours.", "Error: Minigame already started.", "Error: Behind You.", " unlocked", "Error: Buffer Failure", "Error: Received wrong instruction", "Error: Socket paradox"];
depth = -2500;
typo = "";
sndfnt = 109;
sndfntmaxtimes = 0;
sndfnttimes = 0;

function acceptablemes(arg0)
{
    var acceptablestring = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789`~!@#$%^&*()_+=-;:?/,.<>[]{}'";
    var count = 0;
    var acceptable = true;
    
    for (var i = 1; i <= string_length(arg0); i++)
    {
        if (string_pos(string_char_at(arg0, i), acceptablestring) != 0)
        {
            count += 1;
            break;
        }
    }
    
    if (count <= 0)
        acceptable = false;
    
    return acceptable;
}
