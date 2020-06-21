x = o_player.x;
y = o_player.y;
direction = point_direction(x,y,mouse_x,mouse_y)

if timer("reload") == true {
	if mouse_check_button(mb_left) && ammo != 0 {
		for(var i = b_count; i > 0; i--){
			with (instance_create_layer(x,y,layer,o_bullet)){;
				playerbullet = true;
				damage = other.damage;
				b_speed = other.b_speed;
				x_vel = lengthdir_x(other.b_speed,other.direction+random_range(-other.b_spread/2,other.b_spread/2));
				y_vel = lengthdir_y(other.b_speed,other.direction+random_range(-other.b_spread/2,other.b_spread/2));
				b_sprite = other.b_sprite;
				b_trail  = other.b_trail;
				b_bounce = other.b_bounce;
				b_split = other.b_split;
				b_split_amount = other.b_split_amount;
				b_split_angle = other.b_split_angle;
				b_collision = other.b_collision;
				b_homing = other.b_homing;
				b_count = other.b_count;
				b_spread = other.b_spread;
			}					
		}
		timer_set("reload",fire_rate);
		ammo -= ammo_used;
	}
}