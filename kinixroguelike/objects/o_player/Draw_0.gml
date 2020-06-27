draw_sprite_ext(sprite_index,image_index,x,y,flipped,image_yscale,image_angle,image_blend,image_alpha);

//Draw the Gun
draw_sprite_ext(gunmap[? "Sprite"],image_index,x + (16 * sign(flipped)),y,flipped,image_yscale,image_angle,image_blend, (wepequipped == "ranged") ? 1 : 0);