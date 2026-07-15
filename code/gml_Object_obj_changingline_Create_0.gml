linetype = 0;
nevertouched = 1;
linewidth = 100;
changabletext = "";
lasttext = "";
changemode = 0;
text = "";
lockline = 0;
depth = -90001;

function acceptableline(arg0, arg1)
{
    var acceptablestring = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_";
    
    if (arg0 == 1)
        acceptablestring = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_";
    
    if (arg0 == 2)
        acceptablestring = "0123456789";
    
    var acceptable = true;
    
    for (var i = 1; i <= string_length(arg1); i++)
    {
        if (string_pos(string_char_at(arg1, i), acceptablestring) == 0)
        {
            acceptable = false;
            break;
        }
    }
    
    return acceptable;
}
