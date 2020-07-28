//Go through all the possible room layouts, and save every instance in that room into a ds_grid, so we can place it into the full world later.
if room != rm_valley && room != testroom && room != rm_init && room != rm_valleytemplate && room != rm_mainmenu && room != rm_valleyarea2 {
	if room != rm_valleyroomlong && room != rm_valleyroomwide {
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
		if room_next(room) = testroom {
			room_goto(room_to_goto);
		} else {
			room_goto_next();
		}
		print("Next Room!");
	} else {
		if room_next(room) = testroom {
			room_goto(room_to_goto);
		} else {
			room_goto_next();
		}
		print("Next Room!");
	}
}