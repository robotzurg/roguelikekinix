if playerbullet = false {
	if obj_player.cheats_enabled {
		other.hp -= b_damage;
	}
	instance_destroy();
}
