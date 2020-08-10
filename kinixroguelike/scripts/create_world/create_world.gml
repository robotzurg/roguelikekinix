///@param area_list
global.gamephase = phase.creation;

var area_list = argument0;

var map_w = ds_grid_width(global.worldgrid);
var map_h = ds_grid_height(global.worldgrid);
var room_size = 960;
var dist_from_spawn = 0;
//Victory Room Coordinates
var vw = 0;
var vh = 0;
var origin_w = round((map_w-1)/2)
var origin_h = round((map_h-1)/2)
print("Origin W: " + string(origin_w));
print("Origin H: " + string(origin_h));

#region SPECIAL ROOM PHASE

//Check to see what the furthest room is, to place the victory room later.
for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if global.worldgrid[# w,h] != 0 {
			
			//Update distance from spawn, picked the furthest spot from spawn for the victory room
			if (abs(w-origin_w)+abs(h-origin_h)) > dist_from_spawn {
				dist_from_spawn = (abs(w-origin_w)+abs(h-origin_h)) //Update distance
				vw = w;
				vh = h;
			}	
		
			
		}
	}
}

//Shop Room Coordinates
do {
	var sw = irandom_range(0,ds_grid_width(global.worldgrid)-1);
	var sh = irandom_range(0,ds_grid_height(global.worldgrid)-1);
} until global.worldgrid[# sw,sh] != 0;
print(sw);
print(sh);

#endregion

//Main loop through the sectors of the worldgrid
for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if global.worldgrid[# w,h] != 0 { //If the spot on the worldgrid we are checking IS a room
			
#region ROOM TYPE SELECTION PHASE

			if w == vw && h == vh { //If the sector we are on is the victory room sector
				var roomtype = ds_list_size(area_list)-1; //Place the victory room in the furthest room (according to the for loop above)
			} else if w == sw && h == sh {
				var roomtype = ds_list_size(area_list)-2; //Place in victory room
			} else if w == origin_w && h == origin_h {
				var roomtype = ds_list_size(area_list)-3;
			} else {
				var roomtype = irandom_range(0,ds_list_size(area_list)-4); //Pick a random room (excluding victory room which is at the bottom of the list)
			}

#endregion

#region DOOR CREATION PHASE
			
			//(whats) UP DOOR
			//I hate you so much pines - Jeff
			if global.worldgrid[# w,h] mod 2 == 0 { //If there is no wall on the upper area, place a door
				with instance_create_layer((room_size * w) + (room_size/2), (room_size * h) + 32, "Instances", o_door) {
					image_index = 0; //Vertical
				}
			} else { //Otherwise, place a wall.
				with instance_create_layer((room_size * w) + (room_size/2), (room_size * h) + 32, "Instances", o_doorfill) {
					image_index = 0; //Up
				}
			}
			
			//DOWN DOOR
			if global.worldgrid[# w,h] mod 5 == 0 { //If there is no wall on the lower area, place a door
				with instance_create_layer((room_size * w) + (room_size/2), (room_size * h) + 928, "Instances", o_door) {
					image_index = 0; //Vertical
				}
			} else { //Otherwise, place a wall.
				with instance_create_layer((room_size * w) + (room_size/2), (room_size * h) + 928, "Instances", o_doorfill) {
					image_index = 1; //Down
				}
			}
			
			//LEFT DOOR
			if global.worldgrid[# w,h] mod 7 == 0 { //If there is no wall on the left area, place a door
				with instance_create_layer((room_size * w) + 32, (room_size * h) + (room_size/2), "Instances", o_door) {
					image_index = 1; //Horizontal
				}
			} else { //Otherwise, place a wall.
				with instance_create_layer((room_size * w) + 32, (room_size * h) + (room_size/2), "Instances", o_doorfill) {
					image_index = 2; //Left
				}
			}
			
			//RIGHT DOOR
			if global.worldgrid[# w,h] mod 3 == 0 { //If there is no wall on the right area, place a door
				with instance_create_layer((room_size * w) + 928, (room_size * h) + (room_size/2), "Instances", o_door) {
					image_index = 1; //Horizontal
				}
			} else { //Otherwise, place a wall.
				with instance_create_layer((room_size * w) + 928, (room_size * h) + (room_size/2), "Instances", o_doorfill) {
					image_index = 3; //Right
				}
			}
			
#endregion
			
#region INSTANCE CREATION PHASE 

		var rtsec = area_list[| roomtype] //Get the instance ds_grid from the room list
			for (var ix = 0; ix<ds_grid_width(rtsec);ix++) { //Loop through ds_grid to place each object
				var obj = instance_create_layer((room_size * w) + rtsec[# ix, 0], (room_size * h) + rtsec[# ix, 1], "Instances", rtsec[# ix, 4])
				with obj {
					image_xscale = rtsec[# ix, 2];
					image_yscale = rtsec[# ix, 3];
					if object_index = o_spawnzones {
						sector_x = w;
						sector_y = h;
					}
				}
			}
			
#endregion

#region TILE CREATION PHASE 

			//Create local vars needed for the process
			var countvar = 0;
			var sector_size = 960/32;
			var layer_id_1 = layer_get_id("Tiles_1");
			var layer_id_2 = layer_get_id("Tiles_2");
			var layer_id_3 = layer_get_id("Tiles_3");
			var map_id_1 = layer_tilemap_get_id(layer_id_1);
			var map_id_2 = layer_tilemap_get_id(layer_id_2);
			var map_id_3 = layer_tilemap_get_id(layer_id_3);
			var tiles_1 = global.valleytiles[rtsec,0]
			var tiles_2 = global.valleytiles[rtsec,1]
			var tiles_3 = global.valleytiles[rtsec,2]
    

			for(var tx = 0; tx < sector_size; tx++){	
				for(var ty = 0; ty < sector_size; ty++){ //Loop through every tile spot
				    tilemap_set_at_pixel(map_id_1, array_get(tiles_1,countvar), (room_size * w) + (tx*32), (room_size * h) + (ty*32));
				    tilemap_set_at_pixel(map_id_2, array_get(tiles_2,countvar), (room_size * w) + (tx*32), (room_size * h) + (ty*32));
				    tilemap_set_at_pixel(map_id_3, array_get(tiles_3,countvar), (room_size * w) + (tx*32), (room_size * h) + (ty*32));
					countvar++;
				}    
			}
			

#endregion
			
		} //End of room check if statement
	} //End of h for loop
} //End of w for loop

global.gamephase = phase.play;