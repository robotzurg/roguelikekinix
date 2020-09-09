//Check if touching limbo access point
if point_in_rectangle(obj_player.x,obj_player.y,x-48,y,x+40,y+59) {
	if keyboard_check(global.kb_Interact) && global.lapstart == false {
		if floor(image_index) != 10 { image_speed = 0.7; shake_screen(1,0.1); } else { image_speed = 0; global.lapstart = true; }
	} else if global.lapstart == false {
		if floor(image_index) != 0 { image_speed = -1.5; } else { image_speed = 0; }
	}
}

if global.lapstart == 2 {
	image_index = 11;	
}