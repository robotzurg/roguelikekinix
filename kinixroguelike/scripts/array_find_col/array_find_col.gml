/// @function	array_find_col(id, value);
/// @param		{array}			id
/// @param		{real|string}	value
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Searches an array for the given value and returns the column index. If the value
cannot not found, -1 will be returned instead.

This script should be used with 2D arrays only, as 1D arrays will always return 0.
To find the index of a value in a 1D array, use array_find_row.

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
	for (yindex = 0; yindex < array_length_2d(ar_input, xindex); yindex++) {
		//If value is held at test location, return the column index
		if (ar_input[xindex, yindex] == argument[1]) {
			return xindex;
		}
	}
}

//Otherwise return -1 if value was not found
return -1;