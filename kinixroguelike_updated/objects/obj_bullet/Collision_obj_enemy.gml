if playerbullet = true {
	if obj_player.cheats_enabled == false {
		other.hp -= b_damage;
	} else {
		other.hp -= other.hp;	
	}
	instance_destroy();
	other.hot_time = b_hot_time;
	other.cold_time = b_cold_time;
}
