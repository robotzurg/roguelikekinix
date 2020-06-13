/// @function   timer_get_pause(id, [instance]);
/// @param		{string}	id
/// @param      {instance}	[instance]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved

/*
Returns the pause state for the timer running in the current or specified instance. 
If the instance or timer does not exist, 'true' will be returned, as the timer is
not running.

argument0 = the ID of the timer to check (string)
argument1 = the object instance containing the timer (id) (optional, use no argument for self)

Example usage:
	if (timer_get_pause("my_timer")) {
		timer_set("my_timer", 5);
	}
*/

//Get instance to check for timer
var inst = id;
if (argument_count > 1) {
	inst = argument[1];
}

//Return current pause state, if timer exists
if (variable_instance_exists(inst, argument[0] + "_pause")) {
	return variable_instance_get(inst, argument[0] + "_pause");
}

//Otherwise return 'true' if instance or timer could not be found
return true;