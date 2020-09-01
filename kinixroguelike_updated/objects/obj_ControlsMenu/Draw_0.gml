if (live_call()) return live_result;
draw_set_halign(fa_middle);
draw_set_valign(fa_center);
	draw_text_transformed(room_width/2,32,"Control Rebinding",2,2,0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

	draw_text_transformed(50,60,"Keyboard Rebinding",1.5,1.5,0);
	if gamepad_is_connected(0) draw_text_transformed(room_width-450,60,"Gamepad Rebinding",1.5,1.5,0);