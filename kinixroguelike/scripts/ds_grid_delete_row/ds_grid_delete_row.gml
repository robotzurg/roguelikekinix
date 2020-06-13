/// @function	ds_grid_delete_row(id, row);
/// @param		{ds_grid}	id
/// @param		{integer}	row
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Removes a row from the specified ds_grid while preserving other data.

When complete, ds_grid_height will be reduced by 1. For this reason, a 
row should only be deleted when there are at least two rows in the grid,
otherwise the entire grid will be destroyed.

argument0 = the data structure to remove row from (ds_grid)
argument1 = the index of the row to remove (integer)
            
Example usage:
   ds_grid_delete_row(my_grid, 1);
*/

//Get data structure
var ds_data = argument0;

//Get data structure dimensions
var ds_height = ds_grid_height(ds_data) - 1; 
var ds_width = ds_grid_width(ds_data) - 1; 

//Remove row from data structure
if (ds_height > 0) {
	//If not the last row, shift other data up
	if (argument1 < ds_height) {
		ds_grid_set_grid_region(ds_data, ds_data, 0, argument1 + 1, ds_width, ds_height, 0, argument1);
	}
   
	//Remove the last row
	ds_grid_resize(ds_data, ds_width + 1, max(1, ds_height));   
} else {
	//If the last row, destroy ds_grid
	ds_grid_destroy(ds_data);
}