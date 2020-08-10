playerbullet = true;

x_vel = 0;
y_vel = 0;
direction = point_direction(x,y,mouse_x,mouse_y);

b_damage = o_player.rangedmap[? "Damage"];
b_range = o_player.rangedmap[? "Range"];
b_speed = o_player.rangedmap[? "Bullet Speed"];
b_sprite = o_player.rangedmap[? "Bullet Sprite"];
b_trail  = o_player.rangedmap[? "Bullet Trail"];
b_bounce = o_player.rangedmap[? "Bullet Bounce"];
b_split = o_player.rangedmap[? "Bullet Split"];
b_split_amount = o_player.rangedmap[? "Bullet Split Amount"];
b_split_angle = o_player.rangedmap[? "Bullet Split Angle"];
b_collision = o_player.rangedmap[? "Bullet Collision"];
b_homing = o_player.rangedmap[? "Bullet Homing"];
b_count = o_player.rangedmap[? "Bullet Count"];
b_spread = o_player.rangedmap[? "Bullet Spread"];
b_hot_time = o_player.rangedmap[? "Hot Damage Time"];
b_cold_time = o_player.rangedmap[? "Cold Damage Time"];
x_vel = lengthdir_x(b_speed,direction+random_range(-b_spread/2,b_spread/2));
y_vel = lengthdir_y(b_speed,direction+random_range(-b_spread/2,b_spread/2));


start_home = false;

sprite_index = b_sprite;