/// @function	rot_point_y(x, y, [deg]);
/// @param		{real}	x
/// @param		{real}	y
/// @param		{real}	[deg]
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Returns the Y component of a point the given distance away rotated by the 
given angle in degrees. (Center point is assumed as 0.)

Supplying a rotation is optional. As calculating the sine and cosine of 
angles is costly to performance, these values are stored in memory for use 
with further instances of angle functions based on the same rotation. If 
no rotation is supplied, the previous angle's sine and cosine will be used. 
This is highly useful for improving performance when calculating multiple 
points based on the same rotation.

argument0 = horizontal distance from the rotation center point (real)
argument1 = vertical distance from the rotation center point (real)
argument2 = angle of rotation in degrees (real) (optional, use no argument for previous)

Example usage:
   x = 128 + rot_point_x(64, 64, image_angle);
   y = 128 + rot_point_y(64, 64);
*/

//Calculate sine and cosine if angle is supplied
if (argument_count > 2) {
   rot_prefetch(argument[2]);
}

//Return rotated Y component
return (argument[0]*-trig_sine) + (argument[1]*trig_cosine);
