/// @function	ds_grid_delete_col(id, col);
/// @param		{ds_grid}	id
/// @param		{integer}	col
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function ds_grid_delete_col(argument0, argument1) {

	/*
	Removes a column from the specified ds_grid while preserving other data.

	When complete, ds_grid_width will be reduced by 1. For this reason, a column 
	should only be deleted when there are at least two columns in the grid,
	otherwise the entire grid will be destroyed.

	argument0 = the data structure to remove column from (ds_grid)
	argument1 = the index of the column to remove (integer)
            
	Example usage:
	   ds_grid_delete_col(my_grid, 1);
	*/

	//Get data structure
	var ds_data = argument0;

	//Get data structure dimensions
	var ds_height = ds_grid_height(ds_data) - 1; 
	var ds_width = ds_grid_width(ds_data) - 1; 

	//Remove column from data structure
	if (ds_width > 0) {
		//If not the last column, shift other data back
		if (argument1 < ds_width) {
			ds_grid_set_grid_region(ds_data, ds_data, argument1 + 1, 0, ds_width, ds_height, argument1, 0);
		}
   
		//Remove the last column
		ds_grid_resize(ds_data, max(1, ds_width), ds_height + 1);
	} else {
		//If the last column, destroy ds_grid
		ds_grid_destroy(ds_data);
	}


}
