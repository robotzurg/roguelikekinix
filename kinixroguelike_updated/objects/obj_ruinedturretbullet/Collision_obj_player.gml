if obj_player.invin_frames_var == 0 {
	if obj_player.cheats_enabled == false {
		other.hp -= 2;
	}
	other.invin_frames_var = other.invin_frames
}
instance_destroy();
