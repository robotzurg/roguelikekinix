if point_in_rectangle(mouse_x,mouse_y,room_width/2-90,200,room_width/2+90,290) { //PLAY BUTTON
	if mouse_check_button_pressed(mb_left) {
		if keyboard_check(vk_shift) {
			room_goto(testroom);
		} else {
			generate_world(rm_valley,9,10,true);
		}
	}
} 

if point_in_rectangle(mouse_x,mouse_y,room_width/2-90,300,room_width/2+90,390) { //QUIT BUTTON
	if mouse_check_button_pressed(mb_left) {
		game_end();
	}
} 