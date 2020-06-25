if instance_exists(o_wall) && room != rm_valley {
	ds_list_add(global.valleyareas,ds_grid_create(instance_number(o_wall),4))
	var sec = global.valleyareas[| ds_list_size(global.valleyareas)-1]
	var i = 0;
	with o_wall {
		ds_grid_add(sec, i, 0, x);
		ds_grid_add(sec, i, 1, y);
		ds_grid_add(sec, i, 2, image_xscale);
		ds_grid_add(sec, i, 3, image_yscale);
		i++;
	}
	room_goto_next();
	o_GameEngine.count += 1;
	print("Next Room!");
} 
