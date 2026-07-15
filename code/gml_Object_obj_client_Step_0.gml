var playinst = findplayer();
var bufferdata = onlinedataget(playinst, 1);
var bufferdata2 = onlinedataget(playinst, 2);
var partydata = 
{
    sentpartystatus: partystatus,
    sentpartyinvite: partyinvite,
    sentpartyhostinfo: partyhostinfo
};
var sndfntpluse = 151;
if (instance_exists(1198))
{
    sndfntpluse = obj_mainchara.sndfnt;
}
var chatdata = 
{
    socket: networkvarsget(2),
    wasitsent: global.sentmessage,
    sender: global.playernickname,
    message: global.saidmessage,
    sndfnt: sndfntpluse
};
var pvpdata = 
{
    sentparticipates: global.participates,
    requestedmap: global.reqmap,
    lastHitNum: global.lastHitNum,
    lastHitId: global.lastHitId,
    eliminated: global.pvpeliminated
};
if (infotype == 0)
{
    buffer_seek(Buffer, 0, 0);
    buffer_write(Buffer, 1, 0);
    buffer_write(Buffer, 11, global.onlineversion);
    Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
    infotype = 1;
}
else
{
    buffer_seek(Buffer, 0, 0);
    buffer_write(Buffer, 1, 1);
    buffer_write(Buffer, 11, json_stringify(bufferdata));
    buffer_write(Buffer, 11, json_stringify(bufferdata2));
    buffer_write(Buffer, 11, json_stringify(partydata));
    buffer_write(Buffer, 11, json_stringify(pvpdata));
    buffer_write(Buffer, 11, json_stringify(chatdata));
    Result = network_send_packet(Socket, Buffer, buffer_tell(Buffer));
}
if (Result < 0)
{
    scr_notificationsend(2, "");
    if (instance_exists(1759))
    {
        with (1759)
        {
            buttons[selected] = "Error";
            snd_play(406);
            color = 255;
        }
    }
    instance_destroy();
}
