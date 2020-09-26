//If at the base image index, set image speed to 0;
if(image_index = 0){image_speed = 0};

//Check if touching limbo access point
if point_in_rectangle(obj_player.x,obj_player.y,x-48,y,x+40,y+59) && global.lapstart == false {
	if keyboard_check(global.kb_Interact) {
		zoom_camera(50,1);
		image_speed = (floor(image_index) != 10) ? 0.7 : 0 
		shake_screen(1,0.1); 
		if floor(image_index) == 10 { 
			global.lapstart = true; 
		}
	}
	else if (global.lapstart == false){
		image_speed = (floor(image_index) != 0) ? -1.5 : 0
	}
}
else{
	zoom_camera(100,1)
}




if global.lapstart == 2 {
	image_index = 11;	
}