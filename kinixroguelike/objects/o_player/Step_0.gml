plr_movement();

//Shooting (with reload timer from GML+)
if timer("reload") == true {
	if mouse_check_button(mb_left) && ammo != 0 {
		var bullet = instance_create_layer(x,y,layer,o_bullet);
		with bullet {
			playerbullet = true;
			direction = point_direction(x,y,mouse_x,mouse_y);
			speed = 8;
		}
		timer_set("reload",0.1);
		ammo -= 1;
	}
}
