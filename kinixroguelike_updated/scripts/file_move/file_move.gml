/// @function   file_move(fname, dest);
/// @param		{string}	fname
/// @param		{string}	dest
/// @author     Lucas Chasteen <lucas.chasteen@xgasoft.com>
/// @copyright  XGASOFT 2020, All Rights Reserved
function file_move(argument0, argument1) {

	/*
	Moves a file on the disk to a new folder, removing it from the original
	location. Will also return true or false to indicate if the operation
	succeeded.

	Note that on Android, files must be loaded into memory to be moved. It
	is not recommended to move very large files that could exceed the RAM 
	capacity of some users' phones.

	Also note that by default, this script can only be used to move files
	within working_directory or folders previously granted access via the
	get_save_filename function. On desktop platforms, this limitation can
	be removed by disabling the filesystem sandbox in Game Settings.

	argument0 = the full path of the file to move, including name and extension (string)
	argument1 = the destination folder to move file to, not including filename (string)

	Example usage:
		file_move(working_directory + "temp.sav", working_directory + "saves");
	*/

	//Copy file to new destination
	file_copy(argument0, argument1 + "\\" + argument0);

	//Ensure file copy succeeded
	if (file_exists(argument1 + "\\" + argument0)) {
		//If so, delete the original file
		return file_delete(argument0);
	} else {
		//Otherwise, return fail
		return false;
	}


}
