/// @function	ds_list_add_map(id, source);
/// @param		{ds_list}	id
/// @param		{ds_map}	source
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function ds_list_add_map() {

	/*
	Adds the **contents** of a previously-created ds_map to the specified ds_list.

	Intended only for use with JSON functions. Normally, adding one data structure 
	to another simply stores a **reference** to the data structure, therefore this
	function is necessary to flag the list value as a data structure itself so its
	contents are written to the JSON file.

	As JSON data is unordered by nature, there is no need to input an index at which 
	to insert the new list.

	argument0 = the ds_list to add a ds_map to
	argument1 = the ds_map to be added

	Example usage:
		my_list = ds_list_create();
		my_map = ds_map_create();
	
		ds_list_add_map(my_list, my_map);
	*/

	//Add the input ds_map to the parent ds_list
	ds_list_add(argument[0], argument[1]);
	ds_list_mark_as_map(argument[0], ds_list_size(argument[0]) - 1);


}
