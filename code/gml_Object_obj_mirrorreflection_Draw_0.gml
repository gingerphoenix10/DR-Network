if (instance_exists(obj_mainchara))
{
    image_blend = obj_mainchara.image_blend;
    x = obj_mainchara.x;
    y = horizon - (obj_mainchara.y - horizon);
    
    if (y < ceiling)
        y = ceiling;
    
    sprite_index = obj_mainchara.sprite_index;
    image_index = obj_mainchara.image_index;
    
    if (sprite_index == obj_mainchara.dsprite && flip == 0)
    {
        sprite_index = obj_mainchara.usprite;
        flip = 1;
    }
    
    if (sprite_index == obj_mainchara.usprite && flip == 0)
    {
        sprite_index = obj_mainchara.dsprite;
        flip = 1;
    }
    
    flip = 0;
}

if (obj_mainchara.sprite_index == obj_mainchara.rsprite)
    xscalething = -1;
else if (obj_mainchara.sprite_index == obj_mainchara.lsprite)
    xscalething = 1;

if (global.suzyfound)
    draw_sprite_ext(spr_redacted_a, image_index, x + 10 + (xscalething * 20), y - 26, xscalething, 1, 0, c_dkgray, 0.3);

draw_sprite_ext(sprite_index, image_index, x, y - 6, 1, 1, 0, image_blend, 1);
