/// @function   wait(duration, [offset]);
/// @param      {real}	duration
/// @param		{real}	[offset]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved

/*
Returns 'false' for a specified interval, as a value of seconds, after which 'true' 
will be returned for one frame. Repeats endlessly.

Note that this script's starting time is based on instance creation time, and will 
always return 'true' at the same time for every instance of any object created in the 
same Step. Sometimes this synchronization is not desirable, in which case an optional 
offset time can also be supplied. Unlike the main time interval, the offset value can 
be either positive or negative. For example, to base starting time on game session 
time, use `-game_get_time()` (must be a variable declared in an event that is not run 
every Step).

argument0 = the duration of time to wait, in seconds (real)
argument1 = the amount of time to offset the timer (real) (optional, use no argument for none)

Example usage:
	//STEP EVENT
	if (x != xprevious) or (y != yprevious) {
		if (wait(1)) {
			stamina--;
		}
	} else {
		if (wait(2)) {
			stamina++;
		}
	}
	
	//LEFT MOUSE PRESSED EVENT
	click_time = -game_get_time();
	
	//LEFT MOUSE DOWN EVENT
	if (wait(0.15, click_time)) {
		instance_create_layer(x, y, layer, obj_bullet);
	}
*/

/*
INITIALIZATION
*/

//Get wait timer ID
var ar_temp = debug_get_callstack(),
	w_id = ar_temp[array_length_1d(ar_temp) - 2];

//Initialize new wait timer, if it doesn't exist
if (!variable_instance_exists(id, w_id + "_offset")) {
	variable_instance_set(id, w_id + "_offset", -get_timer());	//Start time
}

//Offset global session time by wait starting time
var time_offset = variable_instance_get(id, w_id + "_offset");


/*
PERFORM WAIT TIMER
*/

//Get user time offset, if any
if (argument_count > 1) {
	time_offset += (argument[1]*1000000);
}

//Get the current global time, as a value of frames
var time_current = floor((get_timer() + time_offset)/game_get_speed(gamespeed_microseconds));

//Get the amount of time to wait, as a value of frames
var time_wait = ceil(argument[0]*game_get_speed(gamespeed_fps));

//Return 'true' when interval is reached
return ((time_current mod time_wait) == 0);