x += x_vel;
y += y_vel;
direction = point_direction(x,y, x+x_vel, y+y_vel);

//Bullet Bouncing
if(b_bounce > 0){
	if (place_meeting(x+x_vel,y,o_CollisionParent)){
		x_vel= -1*x_vel;
		b_bounce -=1;
	}
	if (place_meeting(x,y+y_vel,o_CollisionParent)){
		y_vel= -1*y_vel;
		b_bounce -=1;
	}
}
//Bullet Homing
if(b_homing > 0) && instance_exists(o_enemy){
	x_vel+= sign(o_enemy.x -x )*b_homing;
	y_vel+= sign(o_enemy.y - y)*b_homing;
}
