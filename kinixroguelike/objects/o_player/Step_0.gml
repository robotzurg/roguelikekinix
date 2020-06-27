plr_movement();

flipped = sign(mouse_x-x);

//Shooting (with reload timer from GML+)
if timer("reload") == true {
	if mouse_check_button(mb_left) && ammo != 0 {
		o_player.wepequipped = "ranged";
		for(var i = gunmap[? "Bullet Count"]; i > 0; i--){
			var bullet = instance_create_layer(x + (16 * sign(flipped)),y,layer,o_bullet);
			with bullet {
				x = o_player.x + (16 * sign(o_player.flipped));
				y = o_player.y;
			}
		}
		timer_set("reload",gunmap[? "Fire Rate"]);
		ammo -= gunmap[? "Ammo Use"];
	}
}

