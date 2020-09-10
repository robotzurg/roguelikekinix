//create other bullets when instance destroyed
if(b_split > 1){
	b_split-=1;
	for(var i = b_split_amount; i > 0; i--){
		with (instance_create_layer(x,y,layer,obj_bullet)){;
				x_vel = lengthdir_x(other.b_speed,other.direction+random_range(-other.b_split_angle/2,other.b_split_angle/2)+180);
				y_vel = lengthdir_y(other.b_speed,other.direction+random_range(-other.b_split_angle/2,other.b_split_angle/2)+180);
				b_sprite = other.b_sprite;
				b_trail  = other.b_trail;
				b_bounce = other.b_bounce;
				b_split = other.b_split;
				b_split_amount = other.b_split_amount;
				b_collision = other.b_collision;
				b_homing = other.b_homing;
				b_count = other.b_count;
				b_split_angle = other.b_split_angle;
				b_damage_falloff = other.damage_falloff
				b_damage_falloff_range = other.damage_falloff_range
			}
	}
}
