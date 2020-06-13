/// @function	array_find_row(id, value);
/// @param		{array}			id
/// @param		{real|string}	value
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Searches an array for the given value and returns the row index. If the value
cannot not found, -1 will be returned instead.

This script can be used to search both 1D and 2D arrays.

argument0 = the array to search (array)
argument1 = the value to find index of (real, string, etc)

Example usage:
	//Find index of the target string
	var xx = array_find_col(my_array, "Items held:");
	var yy = array_find_row(my_array, "Items held:");
   
	//Draw the string and the corresponding value held in the following column
	draw_text(25, 25, my_array[xx, yy] + string(my_array[xx + 1, yy]));
*/

//Initialize temporary variables for searching array
var xindex, yindex,
	ar_input = argument[0];

//Search array for target value
for (xindex = 0; xindex < array_height_2d(ar_input); xindex++) {
	for (yindex = array_length_2d(ar_input, xindex) - 1; yindex > -1; yindex--) {
		//If value is held at test location, return the row index
		if (ar_input[xindex, yindex] == argument[1]) {
			return yindex;
		}
	}
}

//Otherwise return -1 if value was not found
return -1;