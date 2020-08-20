/// @function   approx(value, min, [max]);
/// @param      {real}	value
/// @param		{real}	min
/// @param		{real}	max
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function approx() {

	/*
	Checks if a value is between two numbers and returns 'true' or 'false'.

	By default, the input value will be tested plus or minus the min value, but an
	explicit max value can also be supplied to set the exact range.

	argument0 = the numerical value to check (real)
	argument1 = the minimum closeness, or alternatively, minimum value to accept (real)
	argument2 = the maximum value to accept (real) (optional, use none for +/- min)

	Example usage:
		if (approx(enemy.x - x, 128)) {
			//Enemy is near player on left or right
		}
	*/

	//Get min/max values to test, if input
	if (argument_count > 2) {
		var val_min = argument[1];
		var val_max = argument[2];
	} else {
		//Otherwise use defaults
		var val_max = abs(argument[1]);
		var val_min = -val_max;
	}

	//Check if value is inside range
	if ((argument[0] >= val_min) and (argument[0] <= val_max)) {
		return true;
	}

	//Otherwise return false
	return false;


}
