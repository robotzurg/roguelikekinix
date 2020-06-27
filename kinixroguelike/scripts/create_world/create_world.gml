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
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h-32)+4, "Instances", o_doorW);
			} else {
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h-32)+4, "Instances", o_doorfillW);
			}
			
			if global.worldgrid[# w,h] mod 7 == 0 { //LEFT
				instance_create_layer(0 + (room_w * w), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorH);
			} else {
				instance_create_layer(0 + (room_w * w), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorfillH);
			}
			
			if global.worldgrid[# w,h] mod 3 == 0 { //RIGHT
				instance_create_layer(0 + (room_w * w) + (room_w-32), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorH);
			} else {
				instance_create_layer(0 + (room_w * w) + (room_w-32), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorfillH);
			}
			
			//Add in the extra blocks based on what room type it is
			var roomtype = irandom_range(0,ds_list_size(global.valleyareas)-1);
			var rtsec = global.valleyareas[| roomtype]
			for (var ix = 0; ix<ds_grid_width(rtsec);ix++) {
				var obj = instance_create_layer(0 + (room_w * w) + rtsec[# ix, 0], 0 + (room_h * h) + rtsec[# ix, 1], "Instances", rtsec[# ix, 4])
				with obj {
					image_xscale = rtsec[# ix, 2];
					image_yscale = rtsec[# ix, 3];
					if object_index = o_spawnzones {
						sector_x = w;
						sector_y = h;
					}
				}
			}
			
		}
	}
}

ds_list_destroy(global.valleyareas);
