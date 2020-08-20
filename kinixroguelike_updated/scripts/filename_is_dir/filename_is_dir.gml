/// @function   filename_is_dir(fname);
/// @param		{string}	fname
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function filename_is_dir() {

	/*
	Checks if a filename appears to be a directory and returns true or false.

	This is faster than directory_exists, and is useful for checking paths
	outside the sandbox.

	argument0 = the path to check, as a string (string)

	Example usage:
		var file = file_find_first("C:\\*", fa_directory);
	
		if (filename_is_dir(file)) {
			//Directory exists!
		}
	*/

	//Test filename to determine type
	if (filename_ext(argument[0]) == "") {
		return true;
	}
	if (string_count("\\", filename_ext(argument[0])) > 0) {
		return true;
	}
	if (string_count("/", filename_ext(argument[0])) > 0) {
		return true;
	}

	//Return 'false' if input is not a directory
	return false;


}
