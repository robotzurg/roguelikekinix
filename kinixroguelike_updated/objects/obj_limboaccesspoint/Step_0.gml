//Check if touching limbo access point
if point_in_rectangle(obj_player.x,obj_player.y,x-48,y,x+40,y+59) {
	if keyboard_check_pressed(global.kb_Interact) && global.lapstart == false {
		global.lapstart = true;
	}
}
