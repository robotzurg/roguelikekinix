var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left);

// Hover
hover = lerp(hover, _hover, 0.2); //Smoothly transitions from 0 to 1, for hover animations

if (_click && click_func >= 0) {
	click_func();
}

ini_open("controls.ini")
if waiting_for_input == false {
	switch (keybind_tie) {
		case "kb_up": text = "Up Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,ord("W")))); break;
		case "kb_down": text = "Down Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,ord("S")))); break;
		case "kb_left": text = "Left Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,ord("A")))); break;
		case "kb_right": text = "Right Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,ord("D")))); break;
		case "kb_melee": text = "Melee Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,mb_left))); break;
		case "kb_ranged": text = "Ranged Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,mb_right))); break;
		case "kb_ability": text = "Ability Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,ord("Q")))); break;
		case "kb_interact": text = "Interact Key: " + string(key_to_string(ini_read_real("controls",keybind_tie,ord("E")))); break;
		case "ct_melee": text = "Melee Button: " + gp_to_string(ini_read_real("controls",keybind_tie,gp_shoulderrb)); break;
		case "ct_ranged": text = "Ranged Button: " + gp_to_string(ini_read_real("controls",keybind_tie,gp_shoulderrb)); break;
		case "ct_ability": text = "Ability Button: " + gp_to_string(ini_read_real("controls",keybind_tie,gp_shoulderr)); break;
		case "ct_interact": text = "Interact Button: " + gp_to_string(ini_read_real("controls",keybind_tie,gp_face1)); break;
		default: break;	
	}
} else {
	if gp_button == false {
		if keyboard_check_pressed(vk_anykey) {
			ini_write_real("controls",keybind_tie,keyboard_key);
			waiting_for_input = false;
			global.input_check_obj = -1;
		}
	
		if timer("wait_a_sec", 0.1) {
			if mouse_check_button_pressed(mb_any) {
				ini_write_real("controls",keybind_tie,mouse_button);
				waiting_for_input = false;	
				global.input_check_obj = -1;
			}
		}
	} else {
		if timer("wait_a_sec", 0.1) {
			if gamepad_button_check_pressed(0,gp_any()) {
				ini_write_real("controls",keybind_tie,gamepad_key(0));
				waiting_for_input = false;	
				global.input_check_obj = -1;
			}
		}
	}
	
}
ini_close();
if timer_get("wait_a_sec") == 0 && global.input_check_obj == -1 {
	timer_set("wait_a_sec",0.1);
}

if keybind_tie != -1 width = string_width(text) + 32