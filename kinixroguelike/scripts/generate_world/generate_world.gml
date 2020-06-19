///@param World_Type
///@param Map_Size
///@param Num_Of_Rooms
///@param In_Middle
var worldtype = argument0;
var mapsize = argument1;
var maxrooms = argument2;
var in_middle = argument3;

global.worldgrid = ds_grid_create(9,9); //This is a 8x8 grid;

var map_width = ds_grid_width(global.worldgrid)-1;
var map_height = ds_grid_height(global.worldgrid)-1;
var roomcount = 1;
var cont = true;

 //Populate the grid with 1s, for calculations
for (var w=0; w < map_width; w++) {
	for (var h=0; h < map_height; h++) {
			ds_grid_set(global.worldgrid,w,h,1);
	}
}

//Populate the outer ring with 0s, to have a border
for (var w=0; w < map_width; w++) { 
	ds_grid_set(global.worldgrid,w,0,0);
	ds_grid_set(global.worldgrid,w,map_height,0);
}

for (var h=0; h < map_height; h++) {
		ds_grid_set(global.worldgrid,0,h,0);
		ds_grid_set(global.worldgrid,map_width,h,0);
}

if in_middle == true {
	ds_grid_set(global.worldgrid,round(map_width/2),round(map_height/2),2*choose(1,3)*choose(1,5)*choose(1,7)); //This is the starting room
} else {
	ds_grid_set(global.worldgrid,irandom_range(2,map_width-1),irandom_range(2,map_height-1),(2*3*5*7)); //This is the starting room
}


for (var rp=1;rp != 0; rp=rp) {
	rp = 0;
	for (var w=1; w < map_width; w++) {
		for (var h=1; h < map_height; h++) {
			
			if roomcount >= maxrooms {
					rp = 0;
					cont = false;
			}
			
			if (global.worldgrid[# w,h] mod 2 == 0) && (global.worldgrid[# w,h-1] mod 5 != 0) && cont == true { //Check if we can build in the space above us
				if global.worldgrid[# w,h-1] == 1 {
					roomcount += 1;
				}
				
				ds_grid_set(global.worldgrid,w,h-1,(5*(choose(1,2))*(choose(1,3))*(choose(1,7))))
				rp = 1;
				
				if roomcount >= maxrooms {
					cont = false;	
				}
			}
			
			if (global.worldgrid[# w,h] mod 5 == 0) && (global.worldgrid[# w,h+1] mod 2 != 0) && cont == true { //Check if we can build in the space below us
				if global.worldgrid[# w,h+1] == 1 {
					roomcount += 1;
				}
				
				ds_grid_set(global.worldgrid,w,h+1,(2*(choose(1,5))*(choose(1,3))*(choose(1,7))))
				rp = 1;
				
				if roomcount >= maxrooms {
					cont = false;	
				}
			}
			
			if (global.worldgrid[# w,h] mod 7 == 0) && (global.worldgrid[# w-1,h] mod 3 != 0) && cont == true { //Check if we can build in the space to the left of us
				
				if global.worldgrid[# w-1,h] == 1 {
					roomcount += 1;
				}
				
				ds_grid_set(global.worldgrid,w-1,h,(3*(choose(1,2))*(choose(1,5))*(choose(1,7))))
				rp = 1;
				
				if roomcount >= maxrooms {
					cont = false;	
				}
			}
			
			if (global.worldgrid[# w,h] mod 3 == 0) && (global.worldgrid[# w+1,h] mod 7 != 0) && cont == true { //Check if we can build in the space to the right of us
				
				if global.worldgrid[# w+1,h] == 1 {
					roomcount += 1;
				}
				
				ds_grid_set(global.worldgrid,w+1,h,(7*(choose(1,2))*(choose(1,3))*(choose(1,5))))
				rp = 1;
				
				if roomcount >= maxrooms {
					cont = false;	
				}
				
			}
		}
	}
}

//Set all empty rooms left to 0
for (var w=0; w < map_width; w++) {
	for (var h=0; h < map_height; h++) {
			if global.worldgrid[# w,h] == 1 {
				ds_grid_set(global.worldgrid,w,h,0);
			}
	}
}

//Clean up any doors that lead into 0 rooms (or the outer edge)
for (var w=1; w < map_width; w++) {
	for (var h=1; h < map_height; h++) {
			
		if global.worldgrid[# w,h-1] == 0 && global.worldgrid[# w,h] mod 2 == 0 {
			ds_grid_set(global.worldgrid,w,h,(global.worldgrid[# w,h]/2))
		}
			
		if global.worldgrid[# w,h+1] == 0 && global.worldgrid[# w,h] mod 5 == 0 {
			ds_grid_set(global.worldgrid,w,h,(global.worldgrid[# w,h]/5))
		}
			
		if global.worldgrid[# w-1,h] == 0 && global.worldgrid[# w,h] mod 7 == 0 {
			ds_grid_set(global.worldgrid,w,h,(global.worldgrid[# w,h]/7))
		}
			
		if global.worldgrid[# w+1,h] == 0 && global.worldgrid[# w,h] mod 3 == 0 {
			ds_grid_set(global.worldgrid,w,h,(global.worldgrid[# w,h]/3))
		}
			
	}
}

print("Total Rooms: " + string(roomcount));

for (var w=1; w < map_width; w++) {
	for (var h=1; h < map_height; h++) {
			
		if (global.worldgrid[# w,h] mod 2 == 0) && (global.worldgrid[# w,h-1] mod 5 != 0) && global.worldgrid[# w,h] != 0 {
			ds_grid_set(global.worldgrid,w,h-1,(global.worldgrid[# w,h-1]*5))
		}
		
		if (global.worldgrid[# w,h] mod 5 == 0) && (global.worldgrid[# w,h+1] mod 2 != 0 && global.worldgrid[# w,h] != 0) {
			ds_grid_set(global.worldgrid,w,h+1,(global.worldgrid[# w,h+1]*2))
		}
		
		if (global.worldgrid[# w,h] mod 7 == 0) && (global.worldgrid[# w-1,h] mod 3 != 0 && global.worldgrid[# w,h] != 0) {
			ds_grid_set(global.worldgrid,w-1,h,(global.worldgrid[# w-1,h]*3))
		}
		
		if (global.worldgrid[# w,h] mod 3 == 0) && (global.worldgrid[# w+1,h] mod 7 != 0 && global.worldgrid[# w,h] != 0) {
			ds_grid_set(global.worldgrid,w+1,h,(global.worldgrid[# w+1,h]*7))
		}
		
	}
}

if room != rm_valley room_goto(rm_valley);
