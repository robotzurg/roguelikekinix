if room != rm_valley && room != testroom && room != rm_init && room != rm_valleytemplate && room != rm_mainmenu {
	if instance_exists(o_wall) {
		ds_list_add(global.valleyareas,ds_grid_create(instance_count,5))
		var sec = global.valleyareas[| ds_list_size(global.valleyareas)-1]
		var i = 0;
		with all {
			if object_index != o_CollisionParent && object_index != obj_gmlp && object_index != obj_gmlive && object_index != o_GameEngine {
				ds_grid_add(sec, i, 0, x);
				ds_grid_add(sec, i, 1, y);
				ds_grid_add(sec, i, 2, image_xscale);
				ds_grid_add(sec, i, 3, image_yscale);
				ds_grid_add(sec, i, 4, object_index);
				i++;
			}
		}
		room_goto_next();
		print("Next Room!");
	} else {
		room_goto_next();
		print("Next Room!");
	}
}