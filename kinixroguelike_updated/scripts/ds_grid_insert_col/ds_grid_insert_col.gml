/// @function	ds_grid_insert_col(id, col, [value]);
/// @param		{ds_grid}		id
/// @param		{integer}		col
/// @param		{real|string}	[value]
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function ds_grid_insert_col() {

	/*
	Adds a new column to a ds_grid at the given index, shifting any columns that follow. 
	Optionally also sets a value for empty new cells in the grid (default value is 0).

	When complete, ds_grid_width will be increased by 1.

	argument0 = the data structure to add column to (ds_grid)
	argument1 = the index of the new column to add (integer)
	argument2 = initial value to assign to new cells in the grid (real/string) (optional, use no argument for 0)
            
	Example usage:
	   ds_grid_insert_col(my_grid, ds_grid_width(my_grid) - 2);
	   ds_grid_insert_col(my_grid, ds_grid_width(my_grid) - 2, -1);
	*/

	//Get data structure
	var ds_data = argument[0];

	//Get data structure dimensions
	var ds_height = ds_grid_height(ds_data) - 1;
	var ds_width = ds_grid_width(ds_data);

	//Resize ds_grid to make room for new column
	ds_grid_resize(ds_data, ds_width + 1, ds_height + 1);

	//Insert column, if inside data structure range
	if (ds_width > argument[1]) {
		//Shift other columns
		ds_grid_set_grid_region(ds_data, ds_data, argument[1], 0, ds_width, ds_height, argument[1] + 1, 0);
	}

	//Set default value, if specified
	var ds_val = 0;
	if (argument_count > 2) {
		ds_val = argument[2];
	}

	ds_grid_set_region(ds_data, argument[1], 0, argument[1], ds_height, ds_val);


}
