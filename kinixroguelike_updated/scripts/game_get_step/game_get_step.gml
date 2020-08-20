/// @function   game_get_step();
/// @requires	obj_gmlp
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function game_get_step() {

	/*
	Returns the number of steps that have been run for the entire current game session.

	While it is not strictly required, this script will not have perfect accuracy 
	without including obj_gmlp in the current project. The obj_gmlp object will 
	automatically track any lost steps (i.e. dropped frames) that occur as a result 
	of system lag, window dragging, and similar events, which will then be accounted 
	for in this script.

	No arguments
 
	Example usage:
	    if (is_even(game_get_step())) {
			//Action on even steps
		} else {
			//Action on odd steps
		}
	*/

	//Initialize lost processing time tracker
	gml_pragma("global", "global.time_loss = 0;");

	//Get the current session time, adjusted for lost time
	var get_timer_adjusted = (get_timer() - global.time_loss);

	//Return the current Step count, converted from session time
	return floor(get_timer_adjusted/game_get_speed(gamespeed_microseconds));


}
