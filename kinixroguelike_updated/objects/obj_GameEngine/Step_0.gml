if keyboard_check_pressed(ord("R")) {
	game_restart();	
}

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen())
}

global.current_t++;