draw_sprite_ext(sprite,image_index,o_player.x + (16 * sign(o_player.flipped)),o_player.y,o_player.flipped,image_yscale,image_angle,image_blend, (o_player.wepequipped == "ranged") ? 1 : 0);