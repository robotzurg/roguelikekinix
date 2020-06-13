/// @function   game_get_time([type]);
/// @param		{constant}	[type]
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved

/*
Returns the number of milliseconds (gamespeed_fps) or microseconds (gamespeed_microseconds) 
the entire current game session has been running. If no `[type]` is specified, milliseconds 
will be returned by default.

argument0 = sets whether to return a value in milliseconds or microseconds (constant) (optional, use none for milliseconds)
 
Example usage:
    var hours_played = floor(game_get_time(gamespeed_fps)/1000/60/60);
	var ms_played = (game_get_time(gamespeed_microseconds)/100000);
*/

//Get value type
var time_convert = 0.000001;
if (argument_count > 0) {
	if (argument[0] == gamespeed_microseconds) {
		time_convert = 1;
	}
}

//Return the current session time, converted to the input time type
return (get_timer()*time_convert);