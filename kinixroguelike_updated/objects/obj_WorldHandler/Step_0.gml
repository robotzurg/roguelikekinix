var map_w = ds_grid_width(global.worldgrid);
var map_h = ds_grid_height(global.worldgrid);
var room_size = 960;

for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		
		//Update player sector position based on where the player is
		if point_in_rectangle(obj_player.x,obj_player.y,(room_size * w), (room_size * h), room_size + (room_size * w), room_size + (room_size * h)) {
			obj_player.current_sector_x = w;
			obj_player.current_sector_y = h;
			obj_Camera.sector_width = room_size/2 + (room_size * w)
			obj_Camera.sector_height = room_size/2 + (room_size * h)
			obj_Camera.room_num = global.worldgrid[# w,h];
		}
	}
}

if (room == area_Valley or room == area_Valley2) && instance_exists(obj_ParentEnemy) {
	instance_activate_object(obj_door);
} else {
	instance_deactivate_object(obj_door);
}


if global.lapstart == true {
	if limit < 5 {
		if (wait(1)) {
			limit++
			instance_create_layer(obj_limboaccesspoint.x,obj_limboaccesspoint.y+150,"Instances",obj_bat)
		}
	} else {
		global.lapstart = false;	
		limit = 0;
	}
}