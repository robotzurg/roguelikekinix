/// @function   timer_set_pause(id, enable, [instance]);
/// @param		{string}	id
/// @param		{boolean}	enable
/// @param      {instance}	[instance]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved

/*
Pauses or unpauses the specified timer. Can also toggle pause state if 'other'
is supplied instead of 'true' or 'false'.

argument0 = the ID of the timer to pause (string) (or keyword 'all' for all timers)
argument1 = enables, disables, or toggles the pause state (boolean) (true/false/other)
argument2 = the object instance containing the timer (id) (optional, use no argument for self)
 
Example usage:
    timer_set_pause("t_alarm", other);
	timer_set_pause(all, true, my_other_inst);
*/

//Get instance to check for timer
var aindex, inst = id;
if (argument_count > 2) {
	inst = argument[2];
}

//Get pause setting
var time_pause = argument[1];

//Single timer
if (is_string(argument[0])) {
	if (variable_instance_exists(inst, argument[0])) {
		//Toggle pause state, if 'other'
		if (time_pause == other) {
			time_pause = !variable_instance_get(inst, argument[0] + "_pause");
		}
	
		//Set pause state for the specified timer, if it exists
		variable_instance_set(inst, argument[0] + "_pause", time_pause);
	}
	
//All timers
} else {
	with (inst) {
		//If timers exist in the instance...
		if (variable_instance_exists(inst, "ar_timer")) {
			//Pause each timer in the instance
			for (aindex = 0; aindex < array_length_1d(ar_timer); aindex++) {
				//Toggle pause state, if 'other'
				if (time_pause == other) {
					time_pause = !variable_instance_get(inst, ar_timer[aindex] + "_pause");
				}
				
				//Set pause state for the specified timer
				variable_instance_set(inst, ar_timer[aindex] + "_pause", time_pause);
			}
		}
	}
}