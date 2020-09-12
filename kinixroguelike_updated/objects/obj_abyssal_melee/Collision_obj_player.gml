if coldmg = true && obj_player.invin_frames_var == 0 && spawn_fade_in == 0 {
	if obj_player.cheats_enabled == false {
		if image_index = 12{
			other.invin_frames_var = other.invin_frames
			other.hp -= dmg;
		}
	}
	
}
