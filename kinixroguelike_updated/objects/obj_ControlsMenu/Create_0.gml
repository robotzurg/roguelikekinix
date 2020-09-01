if (live_call()) return live_result;
for (var i=0; i<8;i++) { //6 is the number of keybinds. Update as more are needed, but I made this hard coded as I expect we won't need much more - Jeff
	switch(i) {
		case 0: var kb = "kb_up"; break;
		case 1: var kb = "kb_down"; break;
		case 2: var kb = "kb_left"; break;
		case 3: var kb = "kb_right"; break;
		case 4: var kb = "kb_melee"; break;
		case 5: var kb = "kb_ranged"; break;
		case 6: var kb = "kb_ability"; break;
		case 7: var kb = "kb_interact"; break;
	}
	
	with (create_button(50, 100 + (45 * i), 45, 30, kb, b_controls)) {
		waiting_for_input = false; //Set this to 0 from -1.	
		keybind_tie = kb;
	}
}

if gamepad_is_connected(0) {
	for (var i=0; i<4;i++) { //6 is the number of keybinds. Update as more are needed, but I made this hard coded as I expect we won't need much more - Jeff
		switch(i) {
			case 0: var kb = "ct_melee"; break;
			case 1: var kb = "ct_ranged"; break;
			case 2: var kb = "ct_ability"; break;
			case 3: var kb = "ct_interact"; break;
		}
	
		with (create_button(room_width-450, 100 + (45 * i), 45, 30, kb, b_controls)) {
			waiting_for_input = false; //Set this to 0 from -1.	
			keybind_tie = kb;
			gp_button = true;
		}
	}
}

create_button(20,room_height-64,125,50,"Save & Exit",b_controls_back);
create_button(room_width-195,room_height-64,175,50,"Reset to Default",b_controls_reset);