if keyboard_check(ord("W")) {
	y -= 5;
}

if keyboard_check(ord("A")) {
	x -= 5;
}

if keyboard_check(ord("S")) {
	y += 5;
}

if keyboard_check(ord("D")) {
	x += 5;
}

if mouse_check_button_pressed(mb_left) {
	var bullet = instance_create_layer(x,y,layer,o_bullet);
	with bullet {
		direction = point_direction(x,y,mouse_x,mouse_y);
		speed = 10;
	}
}