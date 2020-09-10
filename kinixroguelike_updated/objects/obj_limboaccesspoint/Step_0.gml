//Check if touching limbo access point
if point_in_rectangle(obj_player.x,obj_player.y,x-48,y,x+40,y+59) {
	if global.lapstart == false {
		if keyboard_check(global.kb_Interact) {
			image_speed = (floor(image_index) != 10) ? 0.7 : 0 
			shake_screen(1,0.1); 
			obj_Camera.zoom_start = true;
			obj_Camera.zoom = -0.01;
			if floor(image_index) == 10 { global.lapstart = true; }
		} else {
			image_speed = (floor(image_index) != 0) ? -1.5 : 0
			obj_Camera.zoom_start = false;
		}
	} else if global.lapstart == true {
		obj_Camera.zoom_start = false //Reset zoom
	}
}

if global.lapstart == 2 {
	image_index = 11;	
}