//Go through all the possible room layouts, and save every instance in that room into a ds_grid, so we can place it into the full world later.
if room != rm_valley && room != testroom && room != rm_init && room != rm_valleytemplate && room != rm_mainmenu && room != rm_valleyarea2 {
	if room != rm_valleyroomlong && room != rm_valleyroomwide {
		
		//Get tile data for the room
		var room_w = floor(room_width/32);
		var room_h = floor(room_height/32);
		var room_area = room_w * room_h;
		var counter = 0;
		var layer_id_1 = layer_get_id("Tiles_1");
		var layer_id_2 = layer_get_id("Tiles_2");
		var layer_id_3 = layer_get_id("Tiles_3");
		var map_id_1 = layer_tilemap_get_id(layer_id_1);
		var map_id_2 = layer_tilemap_get_id(layer_id_2);
		var map_id_3 = layer_tilemap_get_id(layer_id_3);

		var room_tiles_1 = array_create(room_area);
		var room_tiles_2 = array_create(room_area);
		var room_tiles_3 = array_create(room_area);

		for(var w = 0; w < room_w; w++){
			for(var h = 0; h < room_h; h++){
			    array_set(room_tiles_1,counter,tilemap_get_at_pixel(map_id_1, w*32, h*32));
			    array_set(room_tiles_2,counter,tilemap_get_at_pixel(map_id_2, w*32, h*32));
			    array_set(room_tiles_3,counter,tilemap_get_at_pixel(map_id_3, w*32, h*32));
			    counter++;
			}  
		}
		
		//Collect instance data
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
		
		//Add in tile data
		global.valleytiles[sec,0] = room_tiles_1;
		global.valleytiles[sec,1] = room_tiles_2;
		global.valleytiles[sec,2] = room_tiles_3;
		print(sec)
		
		
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