var map_w = ds_grid_width(global.worldgrid);
var map_h = ds_grid_height(global.worldgrid);
var room_w = 960;
var room_h = 540;

for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if global.worldgrid[# w,h] != 0 {
			instance_create_layer( 0 + (room_w * w), 0 + (room_h * h), "Instances", o_CollisionParent);
			
			if global.worldgrid[# w,h] mod 2 == 0 { //UP
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h), "Instances", o_doorW);
			} else {
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h), "Instances", o_doorfillW);
			}
			
			if global.worldgrid[# w,h] mod 5 == 0 { //DOWN
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h-64), "Instances", o_doorW);
			} else {
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h-64), "Instances", o_doorfillW);
			}
			
			if global.worldgrid[# w,h] mod 7 == 0 { //LEFT
				instance_create_layer(0 + (room_w * w), 0 + (room_h * h) + (room_h/2), "Instances", o_doorH);
			} else {
				instance_create_layer(0 + (room_w * w), 0 + (room_h * h) + (room_h/2), "Instances", o_doorfillH);
			}
			
			if global.worldgrid[# w,h] mod 3 == 0 { //RIGHT
				instance_create_layer(0 + (room_w * w) + (room_w-64), 0 + (room_h * h) + (room_h/2)+1, "Instances", o_doorH);
			} else {
				instance_create_layer(0 + (room_w * w) + (room_w-64), 0 + (room_h * h) + (room_h/2)+1, "Instances", o_doorfillH);
			}
		}
	}
}