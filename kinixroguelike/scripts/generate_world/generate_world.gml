global.worldgrid = ds_grid_create(8,8); //This is a 8x8 grid;

var map_width = ds_grid_width(global.worldgrid)-1;
var map_height = ds_grid_height(global.worldgrid)-1;

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

ds_grid_set(global.worldgrid,3,3,(2*3*5*7)); //This is the starting room

for (var rp=1;rp != 0; rp=rp) {
	rp = 0;
	for (var w=1; w < map_width; w++) {
		for (var h=1; h < map_height; h++) {
			
			if (global.worldgrid[# w,h] mod 2 == 0) && (global.worldgrid[# w,h-1] mod 5 != 0) { //Check if we can build in the space above us
				ds_grid_set(global.worldgrid,w,h-1,(5*(choose(1,2))*(choose(1,3))*(choose(1,7))))
				rp = 1;
			}
			
			if (global.worldgrid[# w,h] mod 5 == 0) && (global.worldgrid[# w,h+1] mod 2 != 0) { //Check if we can build in the space below us
				ds_grid_set(global.worldgrid,w,h+1,(2*(choose(1,5))*(choose(1,3))*(choose(1,7))))
				rp = 1;
			}
			
			if (global.worldgrid[# w,h] mod 7 == 0) && (global.worldgrid[# w-1,h] mod 3 != 0) { //Check if we can build in the space to the left of us
				ds_grid_set(global.worldgrid,w-1,h,(3*(choose(1,2))*(choose(1,5))*(choose(1,7))))
				rp =1;
			}
			
			if (global.worldgrid[# w,h] mod 3 == 0) && (global.worldgrid[# w+1,h] mod 7 != 0) { //Check if we can build in the space to the right of us
				ds_grid_set(global.worldgrid,w+1,h,(7*(choose(1,2))*(choose(1,3))*(choose(1,5))))
				rp = 1;
			}
			
		}
	}
}

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

for (var w=0; w < map_width+1; w++) {
	for (var h=0; h < map_height+1; h++) {
		print(string(global.worldgrid[# w, h]));		
	}
	print(" ");
}