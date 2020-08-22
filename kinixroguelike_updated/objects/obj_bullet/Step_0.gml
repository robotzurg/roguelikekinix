x += x_vel;
y += y_vel;
direction = point_direction(x,y, x+x_vel, y+y_vel);
image_angle = direction;
var nearest_enemy = instance_nearest(x,y,obj_enemy);

if timer("homingstart",0.2) == true {
	start_home = true;
}


//Bullet Bouncing
if(b_bounce > 0){
	if (place_meeting(x+x_vel,y,obj_CollisionParent)){
		x_vel= -1*x_vel;
		b_bounce -=1;
	}
	if (place_meeting(x,y+y_vel,obj_CollisionParent)){
		y_vel= -1*y_vel;
		b_bounce -=1;
	}
}
//Bullet Homing
if(b_homing > 0) && instance_exists(obj_enemy) && start_home == true {
	var ybuffer = 1;
	var xbuffer = 1;
		if sign(nearest_enemy.x - x) != sign(x_vel){
			xbuffer = 4;
		}
		if sign(nearest_enemy.y - y) != sign(y_vel){
			ybuffer = 4;
		}
	x_vel+= sign(nearest_enemy.x - x)*b_homing*xbuffer;
	y_vel+= sign(nearest_enemy.y - y)*b_homing*ybuffer;

}
