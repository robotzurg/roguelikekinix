//is_in_sector(object, room_size, door_buffer_amount);
///@param object
///@param room_size
///@param door_buffer_amount

//checks if the object is within a sector accounting for a buffered amount


var o = argument0; //object
var s = argument1; //size of room
var sh = s/2; //midpoint of room
var db = argument2; //how much to buffer for

if(abs(((o.x) mod s) - sh) < sh - db)&&(abs(((o.y) mod s) - sh) < sh - db){
	return(true)
}
else{
	return(false)
}



