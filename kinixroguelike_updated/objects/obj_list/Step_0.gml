//Mouse input
var _mouseX = device_mouse_x_to_gui(0);
var _mouseY = device_mouse_y_to_gui(0);
var _mousePress = mouse_check_button_pressed(mb_left);

//Operate on list
var _size = ds_list_size(list);

for (var i=0; i<_size; i++) {
	// Array data
	var _arr = list[| i];
	var _name = _arr[PR.NAME];
	var _sel = _arr[PR.SELECTED];
	var _vals = _arr[PR.VALUES];
	
	//Coordinates 
	var _x1 = x + padding;
	var _y1 = y + padding + itemH * i;
	var _x2 = x + width - padding;
	var _y2 = _y1 + itemH;
	
	//Get if hovering
	var _hover = point_in_rectangle(_mouseX, _mouseY, _x1, _y1, _x2, _y2);
	
	if (_hover) {
		//Set hover variable
		if _name != "Menu unusable for now." {
			hoverID = i;
		}
		
		//Select
		if (_sel == -1 && _mousePress) {
			switch (_name) {
				case "Close":
					instance_destroy();
				break;
			}
		}
		
		//Change value
		if (_sel > -1) {
			
			//Change value based on left or right arrow keys
			if keyboard_check_pressed(vk_right) {
				_sel += 1;
			} else if keyboard_check_pressed(vk_left) {
				_sel -= 1;	
			}
			
			//Change value based on mouse click
			if _mousePress {
				if _sel != array_length(_vals)-1 {
					_sel += 1;
				} else {
					_sel = 0;	
				}
			}
			
			//Clamp
			_sel = clamp(_sel, 0, array_length(_vals) - 1);
			
			//Apply to list
			_arr[@ PR.SELECTED] = _sel;
			
		}
		
	}
}

