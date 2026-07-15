battleanim = 1;
alphaheart[0] = -alphaheart[0];
alphaheart[1] += 1;
if (alphaheart[1] == 7)
{
    alphaheart = [1, 1];
    battleanim = 2;
    snd_play(314);
    snd_play(775);
}
else if (alphaheart[1] < 7)
{
    alarm[1] = 2;
}
if (alphaheart[0] == 1)
{
    snd_play(314);
}
