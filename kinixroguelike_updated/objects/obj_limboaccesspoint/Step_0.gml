//Check if touching limbo access point
if point_in_rectangle(obj_player.x,obj_player.y,x-48,y,x+40,y+59) && global.lapstart == false {
	if keyboard_check(global.kb_Interact) {
		obj_Camera.zoomto = 50;
		image_speed = (floor(image_index) != 10) ? 0.7 : 0 
		shake_screen(1,0.1); 
		if floor(image_index) == 10 { global.lapstart = true; }
	} else {
		obj_Camera.zoomto = 100;
		image_speed = (floor(image_index) != 0) ? -1.5 : 0
	}
}

if global.lapstart == 2 {
	image_index = 11;	
}