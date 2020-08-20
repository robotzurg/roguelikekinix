/// @function   timer(id, [duration]);
/// @param      {string}	id
/// @param      {real}		[duration]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function timer() {

	/*
	Sets and/or counts down a timer and returns 'false' until the time has expired, after which 
	it will return 'true'. (To return the actual time value, see timer_get.)

	The timer ID should be a unique string value. Timers and their IDs are local to the running 
	instance, so multiple timers can use the same ID in different instances. However, the same ID
	cannot be reused within a single instance. Otherwise, there is no limit on the quantity of
	timers that can exist at once.

	Timer duration is measured in seconds. This value is automatically adapted to framerate and 
	delta time.

	argument0 = sets the unique timer ID (string)
	argument1 = sets the duration of time to countdown, in seconds (real) (optional, use none to create timer only)

	Example usage:
	    if (timer("t_alarm", 3)) {
			//Action after 3 seconds
	    }
	*/

	/*
	INITIALIZATION
	*/

	//Initialize timer array, if it doesn't exist
	if (!variable_instance_exists(id, "ar_timer")) {
		ar_timer = -1;
	}

	//Initialize new timer, if it doesn't exist
	if (!variable_instance_exists(id, argument[0])) {
		//Get timer duration
		var time_duration = 0;
		if (argument_count > 1) {
			//Use input duration, if supplied
			time_duration = argument[1];
		}
	
		//Set timer properties
		variable_instance_set(id, argument[0], time_duration);		//Current time
		variable_instance_set(id, argument[0] + "_speed", 1);		//Speed multiplier
		variable_instance_set(id, argument[0] + "_pause", false);	//Pause state
	
		//Add timer to array
		var aindex = array_length_1d(ar_timer);
		ar_timer[aindex] = argument[0];
	
		//Return initial timer status
		return false;
	}


	/*
	PERFORM TIMER
	*/

	//Get current time remaining
	var time_current = variable_instance_get(id, argument[0]);

	//Decrement time, if unpaused
	if (!variable_instance_get(id, argument[0] + "_pause")) {
		//Decrement time
		if (time_current > 0) {
			time_current -= (delta_time*0.000001)*variable_instance_get(id, argument[0] + "_speed");
		
			//Clamp time to zero
			if (time_current < 0) {
				time_current = 0;
			}
		
			//Update timer
			variable_instance_set(id, argument[0], time_current);
		}
	}

	//Return timer status
	return (time_current <= 0);


}
