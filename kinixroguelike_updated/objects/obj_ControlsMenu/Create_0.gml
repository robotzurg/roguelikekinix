for (var i=0; i<6;i++) { //6 is the number of keybinds. Update as more are needed, but I made this hard coded as I expect we won't need much more - Jeff
	switch(i) {
		case 0: var kb = "kb_up"; break;
		case 1: var kb = "kb_down"; break;
		case 2: var kb = "kb_left"; break;
		case 3: var kb = "kb_right"; break;
		case 4: var kb = "kb_melee"; break;
		case 5: var kb = "kb_ranged"; break;
	}
	
	with (create_button(50, 50 + (64 * i), 60, 60, kb, b_controls)) {
		waiting_for_input = false; //Set this to 0 from -1.	
		keybind_tie = kb;
	}
}

create_button(20,room_height-64,125,50,"Save & Exit",b_controls_back);
create_button(room_width-195,room_height-64,175,50,"Reset to Default",b_controls_reset);