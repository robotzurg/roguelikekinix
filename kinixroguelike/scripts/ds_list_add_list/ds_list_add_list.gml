/// @function	ds_list_add_list(id, source);
/// @param		{ds_list}	id
/// @param		{ds_list}	source
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved

/*
Adds the **contents** of a previously-created ds_list to the specified ds_list.

Intended only for use with JSON functions. Normally, adding one data structure 
to another simply stores a **reference** to the data structure, therefore this
function is necessary to flag the list value as a data structure itself so its
contents are written to the JSON file.

As JSON data is unordered by nature, there is no need to input an index at which 
to insert the new list.

argument0 = the ds_list to add a ds_list to
argument1 = the ds_list to be added

Example usage:
	my_list = ds_list_create();
	my_other_list = ds_list_create();
	
	ds_list_add_list(my_list, my_other_list);
*/

//Add the input ds_list to the parent ds_list
ds_list_add(argument[0], argument[1]);
ds_list_mark_as_list(argument[0], ds_list_size(argument[0]) - 1);