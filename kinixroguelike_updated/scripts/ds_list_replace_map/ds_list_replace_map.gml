/// @function	ds_list_replace_map(id, oldmap, newmap);
/// @param		{ds_list}	id
/// @param		{ds_map}	oldmap
/// @param		{ds_map}	newmap
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function ds_list_replace_map() {

	/*
	Replaces a ds_map previously added to a parent ds_list with the **contents** of 
	a new ds_map.

	Warning: because data structures are referenced by numerical values, this script
	may not behave as you expect! If a numerical entry in the parent ds_list happens
	to match the value of a child ds_map, there is no guarantee which value will be
	replaced!

	Intended only for use with JSON functions. Normally, adding one data structure 
	to another simply stores a **reference** to the data structure, therefore this
	function is necessary to flag the list value as a data structure itself so its
	contents are written to the JSON file.

	argument0 = the ds_list to add a ds_map to (ds_list)
	argument1 = the old ds_map to be replaced (ds_map)
	argument2 = the new ds_map to be added (ds_map)

	Example usage:
		my_list = ds_list_create();
		my_map = ds_map_create();
		my_new_map = ds_map_create();
	
		ds_list_add_map(my_list, my_map);
	
		ds_list_replace_map(my_list, my_map, my_new_map);
	*/

	//Get list index to replace
	var ds_index = ds_list_find_index(argument[0], argument[1]);

	//Replace the input ds_map in the parent ds_list
	ds_list_replace(argument[0], ds_index, argument[2]);
	ds_list_mark_as_map(argument[0], ds_list_size(argument[0]) - 1);


}
