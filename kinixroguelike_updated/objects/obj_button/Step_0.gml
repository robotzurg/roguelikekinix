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
		default: break;	
	}
} else {
	
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
	
}
ini_close();
if timer_get("wait_a_sec") == 0 && global.input_check_obj == -1 {
	timer_set("wait_a_sec",0.1);
}

if keybind_tie != -1 width = string_width(text) + 32