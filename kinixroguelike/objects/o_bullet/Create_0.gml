playerbullet = true;

x_vel = 0;
y_vel = 0;
direction = point_direction(x,y,mouse_x,mouse_y);

b_damage = o_player.gunmap[? "Damage"];
b_range = o_player.gunmap[? "Range"];
b_speed = o_player.gunmap[? "Bullet Speed"];
b_sprite = o_player.gunmap[? "Bullet Sprite"];
b_trail  = o_player.gunmap[? "Bullet Trail"];
b_bounce = o_player.gunmap[? "Bullet Bounce"];
b_split = o_player.gunmap[? "Bullet Split"];
b_split_amount = o_player.gunmap[? "Bullet Split Amount"];
b_split_angle = o_player.gunmap[? "Bullet Split Angle"];
b_collision = o_player.gunmap[? "Bullet Collision"];
b_homing = o_player.gunmap[? "Bullet Homing"];
b_count = o_player.gunmap[? "Bullet Count"];
b_spread = o_player.gunmap[? "Bullet Spread"];
b_hot_time = o_player.gunmap[? "Hot Damage Time"];
b_cold_time = o_player.gunmap[? "Cold Damage Time"];
x_vel = lengthdir_x(b_speed,direction+random_range(-b_spread/2,b_spread/2));
y_vel = lengthdir_y(b_speed,direction+random_range(-b_spread/2,b_spread/2));


start_home = false;

sprite_index = b_sprite;