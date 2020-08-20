/// @function	ds_list_replace_list(id, oldlist, newlist);
/// @param		{ds_list}	id
/// @param		{ds_list}	oldlist
/// @param		{ds_list}	newlist
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function ds_list_replace_list() {

	/*
	Replaces a ds_list previously added to another ds_list with the **contents** of 
	a new ds_list.

	Warning: because data structures are referenced by numerical values, this script
	may not behave as you expect! If a numerical entry in the parent ds_list happens
	to match the value of a child ds_list, there is no guarantee which value will be
	replaced!

	Intended only for use with JSON functions. Normally, adding one data structure 
	to another simply stores a **reference** to the data structure, therefore this
	function is necessary to flag the list value as a data structure itself so its
	contents are written to the JSON file.

	argument0 = the ds_list to add a ds_list to (ds_list)
	argument1 = the old ds_list to be replaced (ds_list)
	argument2 = the new ds_list to be added (ds_list)

	Example usage:
		my_list = ds_list_create();
		my_other_list = ds_list_create();
		my_new_list = ds_list_create();
	
		ds_list_add_list(my_list, my_other_list);
	
		ds_list_replace_list(my_list, my_other_list, my_new_list);
	*/

	//Get list index to replace
	var ds_index = ds_list_find_index(argument[0], argument[1]);

	//Replace the input ds_list in the parent ds_list
	ds_list_replace(argument[0], ds_index, argument[2]);
	ds_list_mark_as_list(argument[0], ds_index);


}
