if playerbullet = true {
	other.hp -= damage;
	instance_destroy();
	other.hot_time = b_hot_time;
	other.cold_time = b_cold_time;
}
