/// @function	array_width(id);
/// @param		{array}		id
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function array_width() {

	/*
	Standard GameMaker array width and height functions reverse the X and Y
	values relative to data structures like ds_grid. This is confusing.

	This script returns the width of the given array, checking the same
	dimension for width as other data structures.

	argument0 = the array to check (array)

	Example usage:
	   var last_cell = array_width(my_array) - 1;  
	*/

	//Skip if not an array
	if (!is_array(argument[0])) {
		return 0;
	}

	//Return standardized array width
	return array_height_2d(argument[0]);


}
