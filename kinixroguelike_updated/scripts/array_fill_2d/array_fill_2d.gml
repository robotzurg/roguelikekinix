/// @function	array_fill_2d(id, [value]);
/// @param		{array}			id
/// @param		{real|string}	[value]
/// @requires	array_width, array_height
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function array_fill_2d() {

	/*
	Unlike ds_grids, 2D arrays have non-uniform columns, meaning each can have a different 
	height. This is often problematic, and it would be preferable to have empty cells rather 
	than no cells at all.

	This script takes an existing 2D array and fills the vertical gaps, optionally assigning
	a given value to each index (default value is 0).

	It is HIGHLY recommended to run this script before array_write or looping through array
	contents if height is not known to be uniform.

	argument0 = the array to fill (array)
	argument1 = initial value for new cells (real/string) (optional, use no argument for 0)

	Example usage:
	   array_fill_2d(my_array);
	   array_fill_2d(my_array, -1);
	*/

	//Initialize temporary variables for checking array height
	var xindex, 
		ar_input = argument[0],
		ar_val = 0,
		max_height = array_height(ar_input),
		test_height = max_height;

	//Get initial value to set, if any
	if (argument_count > 1) {
	   ar_val = argument[1];
	}
	
	//Fill column(s) to match max height
	for (xindex = 0; xindex < array_width(ar_input); xindex++) {
		test_height = array_length_2d(ar_input, xindex);
		
		//If current column is short, fill it
		while (test_height < max_height) {
			ar_input[@ xindex, test_height] = ar_val;
			test_height++;
		}		
	}


}
