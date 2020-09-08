if keyboard_check_pressed(global.kb_Interact) && global.lapstart == false {
	log("Selected!")
	global.lapstart = true;
}

if global.lapstart == false {
	log("Colliding!");
}