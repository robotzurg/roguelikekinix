if keyboard_check_pressed(ord("R")) {
	game_restart();	
}

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen())
}

global.current_t++;

if keyboard_check_pressed(vk_f12) {
	live_reload_data = !live_reload_data	
}

if live_reload_data == true {
	init_data()
}