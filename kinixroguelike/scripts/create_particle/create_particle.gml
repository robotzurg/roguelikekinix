///@param x
///@param y
///@param x_velocity
///@param y_velocity
///@param layer
///@param sprite_index
///@param is_directional

with(instance_create_layer(argument0, argument1, argument4,o_particle)){
	particle = argument5;
	x_vel = argument2;
	y_vel = argument3;
	if(argument6){
		img_a = point_direction(x,y,x+x_vel,y+y_vel);	
	}
}