var map_w = ds_grid_width(global.worldgrid);
var map_h = ds_grid_height(global.worldgrid);
var room_size = 960;

for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		
		//Update player sector position based on where the player is
		if point_in_rectangle(o_player.x,o_player.y,(room_size * w), (room_size * h), room_size + (room_size * w), room_size + (room_size * h)) {
			o_player.current_sector_x = w;
			o_player.current_sector_y = h;
			o_Camera.sector_width = room_size/2 + (room_size * w)
			o_Camera.sector_height = room_size/2 + (room_size * h)
			o_Camera.room_num = global.worldgrid[# w,h];
		}
	}
}

if (room == area_Valley or room == area_Valley2) && instance_exists(o_enemy) {
	instance_activate_object(o_door);
} else {
	instance_deactivate_object(o_door);
}