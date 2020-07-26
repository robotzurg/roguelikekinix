if (live_call()) return live_result;

if floor(image_index) == 2  {
	draw_set_color(c_red);
	draw_rectangle(x + (20*flipped),y-10,x + (45*flipped),y+20,false);
	draw_set_color(c_white);
}

draw_sprite_ext(sprite_index,image_index,x,y,flipped,image_yscale,image_angle,image_blend,image_alpha);

//Draw the Gun
draw_sprite_ext(gunmap[? "Sprite"],
				image_index,
				x - (arm_length * sign(flipped)) + lengthdir_x(20,point_direction(x,y,mouse_x,mouse_y)),
				y+lengthdir_y(20,point_direction(x,y,mouse_x,mouse_y)),
				image_xscale,
				flipped,
				point_direction(x,y,mouse_x,mouse_y),
				image_blend, 
				(wepequipped == "ranged") ? 1 : 0);

//Draw the Melee
draw_sprite_ext(meleemap[? "Sprite"],
				image_index,
				x - (arm_length * sign(flipped)) + lengthdir_x(20,point_direction(x,y,mouse_x,mouse_y)+melee_rotation*sign(flipped)),
				y+lengthdir_y(20,point_direction(x,y,mouse_x,mouse_y)+melee_rotation*sign(flipped)),
				image_xscale,
				flipped,
				point_direction(x,y,mouse_x,mouse_y)+melee_rotation*sign(flipped),
				image_blend, 
				(wepequipped == "melee") ? 1 : 0);

//Draw the Arm
draw_sprite_ext(s_playerarm,
				image_index,
				x - (arm_length * sign(flipped)),
				y,
				image_xscale,
				flipped,
				point_direction(x,y,mouse_x,mouse_y)+melee_rotation*sign(flipped),
				image_blend, 1);