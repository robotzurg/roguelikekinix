/// @function   timer_set_speed(id, speed, [instance]);
/// @param		{string}	id
/// @param		{real}		speed
/// @param      {instance}	[instance]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function timer_set_speed() {

	/*
	Sets the speed multiplier for the specified timer, increasing or decreasing the
	countdown rate. The default value of 1 equals real time.

	argument0 = the ID of the timer to set (string) (or keyword 'all' for all timers)
	argument1 = sets the speed multiplier of time countdown, where 1 is default (real)
	argument2 = the object instance containing the timer (id) (optional, use no argument for self)
 
	Example usage:
	    timer_set_speed("t_alarm", 0.5);
		timer_set_speed(all, 1, my_other_inst);
	*/

	//Get instance to check for timer
	var aindex, inst = id;
	if (argument_count > 2) {
		inst = argument[2];
	}

	//Single timer
	if (is_string(argument[0])) {
		//Set the speed multiplier for the specified timer, if it exists
		if (variable_instance_exists(inst, argument[0])) {
			variable_instance_set(inst, argument[0] + "_speed", argument[1]);
		}
	
	//All timers
	} else {
		with (inst) {
			//If timers exist in the instance...
			if (variable_instance_exists(inst, "ar_timer")) {
				//Set the speed multiplier for each timer in the instance
				for (aindex = 0; aindex < array_length_1d(ar_timer); aindex++) {
					variable_instance_set(inst, ar_timer[aindex] + "_speed", argument[1]);
				}
			}
		}
	}


}
