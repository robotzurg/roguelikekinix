playerbullet = true;

x_vel = 0;
y_vel = 0;
direction = point_direction(x,y,mouse_x,mouse_y);

if(o_player.wepequipped = "ranged"){
	maptouse = o_player.rangedmap;
}
else{
	maptouse = o_player.meleeprojmap
}


b_damage = maptouse[? "Damage"];
b_range = maptouse[? "Range"];
b_speed = maptouse[? "Bullet Speed"];
b_sprite = maptouse[? "Bullet Sprite"];
b_trail  = maptouse[? "Bullet Trail"];
b_bounce = maptouse[? "Bullet Bounce"];
b_split = maptouse[? "Bullet Split"];
b_split_amount = maptouse[? "Bullet Split Amount"];
b_split_angle = maptouse[? "Bullet Split Angle"];
b_collision = maptouse[? "Bullet Collision"];
b_homing = maptouse[? "Bullet Homing"];
b_count = maptouse[? "Bullet Count"];
b_spread = maptouse[? "Bullet Spread"];
b_hot_time = maptouse[? "Hot Damage Time"];
b_cold_time = maptouse[? "Cold Damage Time"];
x_vel = lengthdir_x(b_speed,direction+random_range(-b_spread/2,b_spread/2));
y_vel = lengthdir_y(b_speed,direction+random_range(-b_spread/2,b_spread/2));


start_home = false;

sprite_index = b_sprite;