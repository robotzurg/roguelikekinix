var map_w = ds_grid_width(global.worldgrid);
var map_h = ds_grid_height(global.worldgrid);
var room_w = 960;
var room_h = 540;

for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if point_in_rectangle(o_player.x,o_player.y,0 + (room_w * w), 0 + (room_h * h), room_w + (room_w * w), room_h + (room_h * h)) {
			o_player.current_sector_x = w;
			o_player.current_sector_y = h;
			o_camera.sector_width = room_w/2 + (room_w * w)
			o_camera.sector_height = room_h/2 + (room_h * h)
		}
	}
}