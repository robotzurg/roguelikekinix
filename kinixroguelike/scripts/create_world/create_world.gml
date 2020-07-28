var map_w = ds_grid_width(global.worldgrid);
var map_h = ds_grid_height(global.worldgrid);
var room_w = 960;
var room_h = 540;
var dist_from_spawn = 0;
var dw = 0;
var dh = 0;
var origin_w = round((map_w-1)/2)
var origin_h = round((map_h-1)/2)
print(origin_w);
print(origin_h);

//Check to see what the furthest room is, to place the victory room later.
for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if global.worldgrid[# w,h] != 0 {
			
			//Update distance from spawn
			if (abs(w-origin_w)+abs(h-origin_h)) > dist_from_spawn {
				dist_from_spawn = (abs(w-origin_w)+abs(h-origin_h)) //Update distance
				dw = w;
				dh = h;
				print(dw);
				print(dh);
			}
			
		}
	}
}

for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if global.worldgrid[# w,h] != 0 {
			
			if w == dw && h == dh {
				var roomtype = ds_list_size(global.valleyareas)-1; //Place the victory room in the furthest room (according to the for loop above)
			} else {
				var roomtype = irandom_range(0,ds_list_size(global.valleyareas)-2);
			}
			
			if (global.worldgrid[# w,h] == 10 or global.worldgrid[# w,h] == 5) && global.worldgrid[# w,h+1] == 10 { //If both rooms have an up and down door, but no left or right doors, connect them together. Otherwise, make a regular 960x540 room.
				
				instance_create_layer( 0 + (room_w * w), 0 + (room_h * h), "Instances", o_WallTemplateLong);
				if global.worldgrid[# w,h] == 5 {
					instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h*2-32)+4, "Instances", o_doorfillW);
				}
				ds_grid_set(global.worldgrid, w, h, 11); //Set the current room to 0
				ds_grid_set(global.worldgrid, w, h+1, 13); //Set the bottom room to 0
				var roomtype = ds_list_size(global.valleyareas)-2;
				
			} else if (global.worldgrid[# w,h+1] == 10 or global.worldgrid[# w,h+1] == 2) && global.worldgrid[# w,h] == 10 { //If both rooms have an up and down door, but no left or right doors, connect them together. Otherwise, make a regular 960x540 room.
				
				instance_create_layer( 0 + (room_w * w), 0 + (room_h * h), "Instances", o_WallTemplateLong);
				if global.worldgrid[# w,h+1] == 2 {
					instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h*2-32)+8, "Instances", o_doorfillW);
					with instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h*2-32)+8, "Instances", o_doorfillW) {
						image_yscale = -1;
						y += 32;
					}
				}
				ds_grid_set(global.worldgrid, w, h, 11); //Set the current room to 0
				ds_grid_set(global.worldgrid, w, h+1, 13); //Set the bottom room to 0
				var roomtype = ds_list_size(global.valleyareas)-2;
				
			} else if (global.worldgrid[# w,h] == 21 or global.worldgrid[# w,h] == 3) && global.worldgrid[# w+1,h] == 21 { 
				
				instance_create_layer( 0 + (room_w * w), 0 + (room_h * h), "Instances", o_WallTemplateWide);
				if global.worldgrid[# w,h] == 3 {
					instance_create_layer(0 + (room_w * w) + (room_w*2-32), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorfillH);
				}
				ds_grid_set(global.worldgrid, w, h, 17); //Set the current room to 0
				ds_grid_set(global.worldgrid, w+1, h, 19); //Set the bottom room to 0
				var roomtype = ds_list_size(global.valleyareas)-1;
				
			} else if (global.worldgrid[# w+1,h] == 21 or global.worldgrid[# w+1,h] == 7) && global.worldgrid[# w,h] == 21 { 
				
				instance_create_layer( 0 + (room_w * w), 0 + (room_h * h), "Instances", o_WallTemplateWide);
				if global.worldgrid[# w+1,h] == 7 {
					with instance_create_layer(0 + (room_w * w) + (room_w*2-32), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorfillH) {
						image_xscale = -1;
						x += 32;
					}
				}
				ds_grid_set(global.worldgrid, w, h, 17); //Set the current room to 0
				ds_grid_set(global.worldgrid, w+1, h, 19); //Set the bottom room to 0
				var roomtype = ds_list_size(global.valleyareas)-1;
				
			} else if global.worldgrid[# w,h] != 11 && global.worldgrid[# w,h] != 13 && global.worldgrid[# w,h] != 17 && global.worldgrid[# w,h] != 19 {
				instance_create_layer( 0 + (room_w * w), 0 + (room_h * h), "Instances", o_CollisionParent);
			}
			
			//Door Creation Phase
			
			if global.worldgrid[# w,h] mod 2 == 0 { //UP
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h), "Instances", o_doorW);
			} else if global.worldgrid[# w,h] != 11 && global.worldgrid[# w,h] != 13 && global.worldgrid[# w,h] != 17 && global.worldgrid[# w,h] != 19 {
				with instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h), "Instances", o_doorfillW){
					image_yscale = -1;
					y += 32;
				}
			}
			
			if global.worldgrid[# w,h] mod 5 == 0 { //DOWN
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h-32)+4, "Instances", o_doorW);
			} else if global.worldgrid[# w,h] != 11 && global.worldgrid[# w,h] != 13 && global.worldgrid[# w,h] != 17 && global.worldgrid[# w,h] != 19 {
				instance_create_layer(0 + (room_w * w) + (room_w/2), 0 + (room_h * h) + (room_h-32)+4, "Instances", o_doorfillW);
			}
			
			if global.worldgrid[# w,h] mod 7 == 0 { //LEFT
				instance_create_layer(0 + (room_w * w), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorH);
			} else if global.worldgrid[# w,h] != 11 && global.worldgrid[# w,h] != 13 && global.worldgrid[# w,h] != 17 && global.worldgrid[# w,h] != 19 {
				instance_create_layer(0 + (room_w * w), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorfillH);
			}
			
			if global.worldgrid[# w,h] mod 3 == 0 { //RIGHT
				instance_create_layer(0 + (room_w * w) + (room_w-32), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorH);
			} else if global.worldgrid[# w,h] != 11 && global.worldgrid[# w,h] != 13 && global.worldgrid[# w,h] != 17 && global.worldgrid[# w,h] != 19 {
				with instance_create_layer(0 + (room_w * w) + (room_w-32), 0 + (room_h * h) + (room_h/2)+2, "Instances", o_doorfillH){
					image_xscale = -1;
					x += 32;
				}
			}
			
			//Add in the extra blocks based on what room type it is
			if global.worldgrid[# w,h] != 11 && global.worldgrid[# w,h] != 13 && global.worldgrid[# w,h] != 17 && global.worldgrid[# w,h] != 19 {
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
}

//ds_list_destroy(global.valleyareas);
