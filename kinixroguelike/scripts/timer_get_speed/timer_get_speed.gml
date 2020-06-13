/// @function   timer_get_speed(id, [instance]);
/// @param		{string}	id
/// @param      {instance}	[instance]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved

/*
Returns the speed multiplier for the timer running in the current or specified instance,
where a value of 1 is real time. If the instance or timer does not exist, 0 will be returned 
instead.

argument0 = the ID of the timer to check (string)
argument1 = the object instance containing the timer (id) (optional, use no argument for self)

Example usage:
	var my_timer_speed = timer_get_speed("my_timer");
	
	my_timer_speed += (3 - my_timer_speed)*0.25;
	
	timer_set_speed("my_timer", my_timer_speed);
*/

//Get instance to check for timer
var inst = id;
if (argument_count > 1) {
	inst = argument[1];
}

//Return current speed multiplier, if timer exists
if (variable_instance_exists(inst, argument[0] + "_speed")) {
	return variable_instance_get(inst, argument[0] + "_speed");
}

//Otherwise return 0 if instance or timer could not be found
return 0;