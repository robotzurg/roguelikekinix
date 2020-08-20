/// @description SELF-CREATING OBJECT
//  SELF-CREATING GML+ MANAGER OBJECT

/*
MOUSE CURSOR STATE
*/

#region Update cursor state for next Step

//System cursor
if (window_get_cursor() != cr_none) {
	cr_sys_previous = window_get_cursor();
	
	//Hide sprite cursor
	if (cr_spr_previous != -1) {
		cursor_sprite = -1;
		cr_spr_previous = -1;
	}
}

//Sprite cursor
if (cursor_sprite != -1) {
	cr_spr_previous = cursor_sprite;
	
	//Hide system cursor
	if (cr_sys_previous != cr_none) {
		window_set_cursor(cr_none);
		cr_sys_previous = cr_none;
	}
}
#endregion

#region Update cursor visibility

//Show mouse when visible
if (mouse_visible) {
	//System cursor
	if (window_get_cursor() == cr_none) {
		if (cr_sys_previous != cr_none) {
			window_set_cursor(cr_sys_previous);
		}
	}
		
	//Sprite cursor
	if (cursor_sprite == -1) {
		if (cr_spr_previous != -1) {
			cursor_sprite = cr_spr_previous;
		}
	}

//Hide mouse when invisible
} else {
	//System cursor
	if (window_get_cursor() != cr_none) {
		window_set_cursor(cr_none);
	}
	
	//Sprite cursor
	if (cursor_sprite != -1) {
		cursor_sprite = -1;
	}
}
#endregion