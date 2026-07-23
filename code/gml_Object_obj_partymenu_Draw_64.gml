var guiwd = display_get_gui_width();
var guihg = display_get_gui_height();
draw_set_alpha(partyalpha - 0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, guiwd, guihg, 0);
draw_set_alpha(partyalpha);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_mainbig);
var partyobject = networkvarsget(1);
var playerid = networkvarsget(2);
var curdslist = networkvarsget(3);
var curdsmap = networkvarsget(4);
var plobject = -4;

if (curdslist != -4 && global.playercount > 1)
{
    switch (partylayer)
    {
        case 0:
            draw_set_halign(fa_center);
            draw_set_valign(fa_bottom);
            draw_set_color(c_white);
            draw_text(guiwd / 2, guihg / 2, string_hash_to_newline("It looks like you're not a member of any party.#Shall we create one?"));
            draw_set_valign(fa_top);
            draw_set_color(c_yellow);
            draw_text_transformed(guiwd / 2, guihg / 2, "Create Party", 1.5, 1.5, 0);
            break;
        
        case 1:
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_color(#BABABA);
            draw_text(10, 10, "Creator of the Party: ");
            plobject = getplayer(partyobject.partystatus, 2, 0);
            draw_set_color(c_white);
            
            if (instance_exists(plobject))
                draw_text(10, 40, plobject.nickname);
            
            draw_set_color(#BABABA);
            draw_text(10, 90, "Party Members: ");
            draw_set_color(c_white);
            var playersamount = 0;
            var offsety = 0;
            
            for (var i = 0; i < ds_list_size(curdslist); i++)
            {
                var partymemberid = getplayer(i, 1);
                var partyinfomember = getpartyinfo(partymemberid);
                plobject = getplayer(partymemberid, 2, 0);
                
                if (instance_exists(plobject))
                {
                    if (is_struct(partyinfomember))
                    {
                        if (partyinfomember.partystatus == partyobject.partystatus && partyinfomember.partystatus != plobject.idthing)
                        {
                            draw_text(10, 120 + offsety, plobject.nickname);
                            playersamount += 1;
                            offsety += 30;
                        }
                    }
                }
            }
            
            if (playersamount == 0)
                draw_text(10, 120, "Nobody :'(");
            
            draw_set_halign(fa_right);
            draw_set_valign(fa_bottom);
            offsety = 0;
            
            for (var i = 0; i < array_length(buttons[partylayer]); i++)
            {
                var toolong = array_length(buttons[partylayer]) - 1 - i;
                draw_set_color(c_white);
                
                if (selected == toolong)
                    draw_set_color(c_yellow);
                
                draw_text(guiwd - 10, guihg - 10 - offsety, buttons[partylayer][array_length(buttons[partylayer]) - 1 - i]);
                offsety += 40;
            }
            
            break;
        
        case 2:
            if (array_length(playerarray) > 0)
            {
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                var offsety = 0;
                
                for (var i = 0; i < array_length(playerarray); i++)
                {
                    var selplayerdata = getpartyinfo(playerarray[i]);
                    draw_set_color(c_white);
                    
                    if (selectedplayer == i)
                    {
                        if (selected == 1)
                            draw_set_color(c_yellow);
                        else
                            draw_set_color(#F5DF7F);
                    }
                    
                    if (selplayerdata.partystatus != -4 || selplayerdata.partystatus == partyobject.partystatus)
                        draw_set_color(c_gray);
                    
                    plobject = getplayer(playerarray[i], 2, 0);
                    
                    if (playerarray[i] != playerid && instance_exists(plobject))
                    {
                        draw_text(guiwd / 2, ((guihg / 2) + offsety) - offsetsy[selectedplayer], plobject.nickname);
                        offsety += 40;
                    }
                }
                
                draw_set_halign(fa_left);
                draw_set_valign(fa_bottom);
                draw_set_color(c_white);
                
                if (selected == 0)
                    draw_set_color(c_yellow);
                
                draw_text(10 + irandom_range(-shaketext, shaketext), guihg - 10, buttons[partylayer][0]);
                draw_set_halign(fa_right);
                draw_set_color(c_white);
                
                if (selected == 2)
                    draw_set_color(c_yellow);
                
                draw_text(guiwd - 10, guihg - 10, buttons[partylayer][2]);
            }
            
            break;
    }
}
else
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_orange);
    draw_text_transformed(guiwd / 2, guihg / 2, "SORRY, but...", 2, 2, 0);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_text(guiwd / 2, guihg / 2, string_hash_to_newline("There must be players on your server#besides you to use this option."));
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
