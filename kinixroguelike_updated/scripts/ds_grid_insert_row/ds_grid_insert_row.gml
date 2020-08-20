/// @function	ds_grid_insert_row(id, row, [value]);
/// @param		{ds_grid}		id
/// @param		{integer}		row
/// @param		{real|string}	[value]
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function ds_grid_insert_row() {

	/*
	Adds a new row to a ds_grid at the given index, shifting any rows that follow. 
	Optionally also sets a value for empty new cells in the grid (default value is 0).

	When complete, ds_grid_height will be increased by 1.

	argument0 = the data structure to add row to (ds_grid)
	argument1 = the index of the new row to add (integer)
	argument2 = initial value to assign to new cells in the grid (real/string) (optional, use no argument for 0)
            
	Example usage:
	   ds_grid_insert_row(my_grid, ds_grid_height(my_grid) - 2);
	   ds_grid_insert_row(my_grid, ds_grid_height(my_grid) - 2, -1);
	*/

	//Get data structure
	var ds_data = argument[0];

	//Get data structure dimensions
	var ds_height = ds_grid_height(ds_data);
	var ds_width = ds_grid_width(ds_data) - 1;

	//Resize ds_grid to make room for new row
	ds_grid_resize(ds_data, ds_width + 1, ds_height + 1);

	//Insert row, if inside data structure range
	if (ds_height > argument[1]) {
		//Shift other rows
		ds_grid_set_grid_region(ds_data, ds_data, 0, argument[1], ds_width, ds_height, 0, argument[1] + 1);
	}

	//Set default value, if specified
	var ds_val = 0;
	if (argument_count > 2) {
		ds_val = argument[2];
	}

	ds_grid_set_region(ds_data, 0, argument[1], ds_width, argument[1], ds_val);


}
