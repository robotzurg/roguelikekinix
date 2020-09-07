if playerbullet = true  {
	if ds_list_find_index(enemy_hitlist,other.id) == -1 {
	if obj_player.cheats_enabled == false {
		other.hp -= b_damage;
	} else {
		other.hp -= other.hp;	
	}
	
	if b_piercing == 0 {
		instance_destroy();
		ds_list_destroy(enemy_hitlist);
	} else { 
		if b_piercing != -1 { b_piercing -= 1; }
	}
	other.hot_time = b_hot_time;
	other.cold_time = b_cold_time;
	}
	
	if b_piercing != 0 {
		ds_list_add(enemy_hitlist,other.id);
	}
}
