/// @function	rot_prefetch(deg);
/// @param		{real}	deg
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Pre-calculates the sine and cosine of an angle in degrees, which can 
then be used by future angle functions without calculating them again. 
This is highly useful for improving performance when calculating 
multiple points based on the same rotation.

Other angle functions will also prefetch rotation, if supplied, in
which case running this script separately is not necessary. However,
prefetching rotation manually can still be quite useful in some 
scenarios (such as calculations spread across multiple events) or
simply maintaining clean code.

argument0 = angle to calculate sine and cosine, in degrees (real)

Example usage:
   rot_prefetch(90);
   x = rot_point_x(5, 10);
   y = rot_point_y(5, 10);
*/

//Calculate sine and cosine of input angle
if (argument0 == 0) {
   //Use defaults if angle is zero
   trig_sine = 0;
   trig_cosine = 1;
} else {
   //Otherwise calculate values
   trig_sine = dsin(argument0);
   trig_cosine = dcos(argument0);
}
