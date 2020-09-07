playerbullet = true;

x_vel = 0;
y_vel = 0;
direction = point_direction(x,y,mouse_x,mouse_y);
image_angle = direction;

if(obj_player.wepequipped = "Ranged"){
	struct_to_use = obj_player.ranged;
}
else{
	struct_to_use = obj_player.melee.ranged_atk
}


b_damage = struct_to_use.damage;
b_range = struct_to_use.bullet_range;
b_speed = struct_to_use.bullet_speed;
b_sprite = struct_to_use.bullet_sprite
b_trail  = struct_to_use.bullet_trail
b_piercing = (struct_to_use.bullet_piercing+1)
b_bounce = struct_to_use.bullet_bounce
b_split = struct_to_use.bullet_split
b_split_amount = struct_to_use.bullet_split_amount
b_split_angle = struct_to_use.bullet_split_angle
b_collision = struct_to_use.bullet_collision
b_homing = struct_to_use.bullet_homing
b_count = struct_to_use.bullet_count
b_spread = struct_to_use.bullet_spread
b_hot_time = struct_to_use.hot_damage_time
b_cold_time = struct_to_use.cold_damage_time
b_cone = random_range(-b_spread/2,b_spread/2);
x_vel = lengthdir_x(b_speed,direction + b_cone) *  random_range(1-struct_to_use.bullet_speed_random,1);
y_vel = lengthdir_y(b_speed,direction + b_cone) *  random_range(1-struct_to_use.bullet_speed_random,1);

enemy_hitlist = ds_list_create();
start_home = false;

sprite_index = b_sprite;