/// @function   round_to(value, multiple);
/// @param      {real}	value
/// @param		{real}	multiple
/// @requires	is_even
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function round_to(argument0, argument1) {

	/*
	Rounds to a multiple of the specified number (rather than to the nearest whole)
	and returns the result. Unlike normal rounding, rounding to fractional values 
	is supported.

	Note that this script uses "banker's rounding", meaning if a value is exactly
	half the multiplier, it will round to the nearest **even** number.

	Also note that the multiplier should **always** be positive. The value to round 
	can be either positive or negative.

	argument0 = the value to round (real)
	argument1 = the number to round to, as a multiple (real)

	Example usage:
		score = round_to(score, 10);
	*/

	//Temporarily treat all input values as positive
	var val = abs(argument0);

	//Get the difference between the value and the multiple
	var val_diff = (val mod argument1);

	//Get cutoff point for rounding to multiplier
	var val_multi = (argument1*0.5);

	//Round down to nearest multiplier
	if (val_diff < val_multi) {
		return (val - val_diff)*sign(argument0);
	}

	//Round to nearest even multiplier
	if (val_diff == val_multi) {
		if (is_even(val - val_diff)) {
			//Round down, if even
			return (val - val_diff)*sign(argument0);
		} else {
			//Otherwise, round up to even
			return (val + (argument1 - val_diff))*sign(argument0);
		}
	}

	//Round up to nearest multiplier
	if (val_diff > val_multi) {
		return (val + (argument1 - val_diff))*sign(argument0);
	}


}
