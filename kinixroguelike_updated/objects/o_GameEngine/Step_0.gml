//ONLY UNCOMMENT THIS IF YOU ARE NEEDING TO USE GM_LIVE WITH INIT_MAPS.
//if (live_call()) return live_result;
//init_maps();

if keyboard_check_pressed(ord("R")) {
	game_restart();	
}

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen())
}

global.current_t++;