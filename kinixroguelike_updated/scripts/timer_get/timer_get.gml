/// @function   timer_get(id, [instance]);
/// @param		{string}	id
/// @param      {instance}	[instance]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function timer_get() {

	/*
	Returns the time remaining for the timer running in the current or specified instance,
	as a value of seconds. If the instance or timer does not exist, -1 will be returned 
	instead.

	argument0 = the ID of the timer to check (string)
	argument1 = the object instance containing the timer (id) (optional, use no argument for self)
 
	Example usage:
		var inst_streetlight = instance_find(obj_streetlight, 0);
	    var race_started = (timer_get("t_streetlight", inst_streetlight) == 0);
	*/

	//Get instance to check for timer
	var inst = id;
	if (argument_count > 1) {
		inst = argument[1];
	}

	//Return current time, if timer exists
	if (variable_instance_exists(inst, argument[0])) {
		return variable_instance_get(inst, argument[0]);
	}

	//Otherwise return -1 if instance or timer could not be found
	return -1;


}
