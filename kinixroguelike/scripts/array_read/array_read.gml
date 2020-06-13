/// @function	array_read(string);
/// @param		{string}	string
/// @requires	array_write
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Takes a string encoded with array_write and returns the contents as a 1D or 2D array.

This script also accepts strings encoded with ds_grid_write and can be used to convert
ds_grids to arrays.

argument[0] = the string to decode as an array

Example usage:
	my_array = array_read(str_array);
*/

//Initialize temporary variables for decoding array
var ar_output, ds_input, xindex, yindex;

//Get the input ds_grid
ds_input = ds_grid_create(0, 0);
ds_grid_read(ds_input, argument[0]);

//Convert ds_grid to array
if (ds_grid_width(ds_input) > 1) {
	//Convert 2D array
	for (yindex = 0; yindex < ds_grid_height(ds_input); yindex++) {
		for (xindex = 0; xindex < ds_grid_width(ds_input); xindex++) {
			if (!is_undefined(ds_input[# xindex, yindex])) {
				ar_output[xindex, yindex] = ds_input[# xindex, yindex];
			}
		}
	}
} else {
	//Convert 1D array
	for (yindex = 0; yindex < ds_grid_height(ds_input); yindex++) {
		ar_output[yindex] = ds_input[# 0, yindex];
	}	
}

//Clean up ds_grid
ds_grid_destroy(ds_input);

//Return the decoded array
return ar_output;