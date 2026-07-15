array_delete(global.chattemp, 0, 1);
array_delete(global.chatsenderstemp, 0, 1);
if (array_length(global.chattemp) > 0)
{
    alarm[2] = chattime;
}
