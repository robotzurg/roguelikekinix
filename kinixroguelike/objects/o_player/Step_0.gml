//AAAAAAAAAAAAAAAAAA-

if keyboard_check(ord("W")) {
	y -= 8;
}

if keyboard_check(ord("A")) {
	x -= 8;
}

if keyboard_check(ord("S")) {
	y += 8;
}

if keyboard_check(ord("D")) {
	x += 8;
}

if mouse_check_button(mb_left) {
	var bullet = instance_create_layer(x,y,layer,o_bullet);
	with bullet {
		direction = point_direction(x,y,mouse_x,mouse_y);
		speed = 10;
	}
}