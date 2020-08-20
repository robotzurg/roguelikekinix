/// @function   timer_set(id, duration, [instance]);
/// @param		{string}	id
/// @param		{real}		duration
/// @param      {instance}	[instance]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function timer_set() {

	/*
	Overrides the current time in the specified timer, restarting the countdown process.
	If the timer does not exist, it will be created, but not countdown.

	Note that if this script is run in an event that is executed every frame (e.g. Step),
	the timer will be unable to countdown! If this is required, use an 'if' statement to
	only set the timer under certain conditions.

	argument0 = the ID of the timer to set (string) (or keyword 'all' for all local timers)
	argument1 = sets the duration of time to countdown, in seconds (real)
	argument2 = the object instance containing the timer (id) (optional, use no argument for self)
 
	Example usage:
	    timer("t_alarm", 5);
	    timer("t_other", 5, my_other_inst);
	*/

	//Get instance to check for timer
	var aindex, inst = id;
	if (argument_count > 2) {
		inst = argument[2];
	}

	//Single timer
	if (is_string(argument[0])) {
		//Initialize new timer, if it doesn't exist
		if (!variable_instance_exists(inst, argument[0])) {
			//Initialize timer array, if it doesn't exist
			if (!variable_instance_exists(inst, "ar_timer")) {
				variable_instance_set(inst, "ar_timer", -1);
			}
		
			//Set timer properties
			variable_instance_set(inst, argument[0] + "_speed", 1);				//Speed multiplier
			variable_instance_set(inst, argument[0] + "_pause", false);			//Pause state
	
			//Add timer to array
			with (inst) {
				aindex = array_length_1d(ar_timer);
				ar_timer[aindex] = argument[0];
			}
		}

		//Set new timer duration
		variable_instance_set(inst, argument[0], argument[1]);					//Current time
	
	//All timers
	} else {
		with (inst) {
			//If timers exist in the instance...
			if (variable_instance_exists(inst, "ar_timer")) {
				//Set new timer duration for each timer in the instance
				for (aindex = 0; aindex < array_length_1d(ar_timer); aindex++) {
					variable_instance_set(inst, ar_timer[aindex], argument[1]);	//Current time
				}
			}
		}
	}


}
