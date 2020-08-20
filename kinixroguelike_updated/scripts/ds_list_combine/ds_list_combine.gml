/// @function	ds_list_combine(id, source, [pos]);
/// @param		{ds_list}	id
/// @param		{ds_list}	source
/// @param		{integer}	[pos]
/// @author		Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright	XGASOFT 2020, All Rights Reserved
function ds_list_combine() {

	/*
	Copies the values of one ds_list into another ds_list. Unlike ds_list_copy,
	ds_list_combine does not clear the list of existing values.

	By default, this script will insert new values at the end of the list. A
	different position can be optionally supplied instead, ranging from 0 to 
	ds_list_size(id).

	Both lists must have already been created before running this script.

	argument0 = the ds_list to add new data to
	argument1 = the ds_list to be added
	argument2 = the position at which to insert new data (optional, use no argument for end of list)

	Example usage:
		my_list = ds_list_create();
		my_list[| 0] = "Hello, ";
	
		my_other_list = ds_list_create();
		my_other_list[| 0] = "world!";
	
		ds_list_combine(my_list, my_other_list);
	*/

	//Ensure source and target data structures exist
	if (ds_exists(argument[0], ds_type_list)) and (ds_exists(argument[1], ds_type_list)) {
		//Initialize temporary variables for processing lists
		var ds_pos = ds_list_size(argument[0]),
			ds_yindex;
		
		//Insert at other list position, if specified
		if (argument_count > 2) {
			ds_pos = clamp(argument[2], 0, ds_pos);
		}

		//Add the source ds_list to the target ds_list
		for (ds_yindex = 0; ds_yindex < ds_list_size(argument[1]); ds_yindex++) {
			ds_list_insert(argument[0], ds_pos, ds_list_find_value(argument[1], ds_yindex));
			ds_pos++;
		}
	}


}
