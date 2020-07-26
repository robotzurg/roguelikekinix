var map_w = ds_grid_width(global.worldgrid);
var map_h = ds_grid_height(global.worldgrid);
var room_w = 960;
var room_h = 540;


for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if point_in_rectangle(o_player.x,o_player.y,0 + (room_w * w), 0 + (room_h * h), room_w + (room_w * w), room_h + (room_h * h)) {
			if global.worldgrid[# w,h] != 11 && global.worldgrid[# w,h] != 13 && global.worldgrid[# w,h] != 17 && global.worldgrid[# w,h] != 19 {
				if(o_player.current_sector_x != w){
					o_player.x += (sign(w-o_player.current_sector_x))*64;	
				}
				if(o_player.current_sector_y != h){
					o_player.y += (sign(h-o_player.current_sector_y))*64;	
				}
				o_player.current_sector_x = w;
				o_player.current_sector_y = h;
				o_camera.sector_width = room_w/2 + (room_w * w)
				o_camera.sector_height = room_h/2 + (room_h * h)
				o_camera.room_num = global.worldgrid[# w,h];
			} else {
				
				o_camera.room_num = global.worldgrid[# w,h];
				if o_camera.room_num == 11 or o_camera.room_num == 13 {
					o_camera.sector_width = room_w/2 + (room_w * w)
				} else if o_camera.room_num == 17 {
					o_camera.sector_width = room_w/2 + (room_w * o_player.current_sector_x+1) + room_w;
				} else if o_camera.room_num == 19 {
					o_camera.sector_width = room_w/2 + (room_w * o_player.current_sector_x-1) + room_w;
				}
			
				if o_camera.room_num == 17 or o_camera.room_num == 19 {
					o_camera.sector_height = room_h/2 + (room_h * h)
				} else if o_camera.room_num == 11 {
					o_camera.sector_height = room_h/2 + (room_h * o_player.current_sector_y+1) + room_h
				} else if o_camera.room_num = 13 {
					o_camera.sector_height = room_h/2 + (room_h * o_player.current_sector_y-1) + room_h
				}
			}
		}
	}
}

if room = rm_valley && instance_exists(o_enemy) {
	instance_activate_object(o_doorW);
	instance_activate_object(o_doorH);
} else {
	instance_deactivate_object(o_doorW);	
	instance_deactivate_object(o_doorH);	
}