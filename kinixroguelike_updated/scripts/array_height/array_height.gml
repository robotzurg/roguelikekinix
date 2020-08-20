/// @function	array_height(id);
/// @param		{array}		id
/// @requires	array_width
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function array_height() {

	/*
	Standard GameMaker array width and height functions reverse the X and Y
	values relative to data structures like ds_grid. This is confusing.

	This script returns the height of the given array, checking the same
	dimension for height as other data structures.

	argument0 = the array to check (array)

	Example usage:
	   var last_cell = array_height(my_array) - 1;  
	*/

	//Skip if not an array
	if (!is_array(argument[0])) {
		return 0;
	}

	//Initialize temporary variables for checking array height
	var xindex, 
		ar_input = argument[0],
		test_height = array_length_2d(ar_input, 0),
		max_height = test_height;

	//Get the tallest column in the array
	for (xindex = 1; xindex < array_width(ar_input); xindex++) {
		test_height = array_length_2d(ar_input, xindex);
	
		//If current column is taller than previous column, use it
		if (test_height > max_height) {
			max_height = test_height;
		}
	}

	//Return standardized array height
	return max_height;


}
