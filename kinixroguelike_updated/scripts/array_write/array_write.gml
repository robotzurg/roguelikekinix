/// @function	array_write(id);
/// @param		{array}	id
/// @requires	array_width, array_height
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function array_write() {

	/*
	Takes a 1D or 2D array and returns the contents as an encoded string for use with array_read.

	The resulting string can also be decoded with ds_grid_read and can be used to convert arrays
	to ds_grids.

	argument[0] = the array to encode as a string

	Example usage:
		my_array = [0, 1, 2, 3, 4];
		str_array = array_write(my_array);
	*/

	//Initialize temporary variables for encoding array
	var ar_input, ds_input, str_output, xindex, yindex;

	//Get the input array
	ar_input = argument[0];

	//Convert array to ds_grid
	if (array_width(ar_input) > 1) {
		//Initialize temporary ds_grid for encoding 2D array
		ds_input = ds_grid_create(array_width(ar_input), array_height(ar_input));
	
		//Convert 2D array
		for (yindex = 0; yindex < ds_grid_height(ds_input); yindex++) {
			for (xindex = 0; xindex < ds_grid_width(ds_input); xindex++) {
				//Use array value if within column height
				if (yindex < array_length_2d(ar_input, xindex)) {
					ds_input[# xindex, yindex] = ar_input[xindex, yindex];
				} else {
					//Otherwise use 'undefined' to have this value ignored
					ds_input[# xindex, yindex] = undefined;
				}
			}
		}
	} else {
		//Initialize temporary ds_grid for encoding 1D array
		ds_input = ds_grid_create(1, array_height(ar_input));
	
		//Convert 1D array
		for (yindex = 0; yindex < ds_grid_height(ds_input); yindex++) {
			ds_input[# 0, yindex] = ar_input[yindex];
		}
	}

	//Write ds_grid to string
	str_output = ds_grid_write(ds_input);

	//Clean up ds_grid
	ds_grid_destroy(ds_input);

	//Return the encoded array
	return str_output;


}
