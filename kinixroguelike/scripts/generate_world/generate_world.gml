global.valleygridgen = ds_grid_create(4,4);

var startingroom = rm_valleymain; //This is the x coordinate of the first room in the grid. (Because 0,0 is rm_valleymain, in the valley case)
ds_grid_add(global.valleygridgen,2,2,startingroom); //Puts the starting room in the middle of the world grid.

for (var i = 1; i > ds_grid_width(global.valleygrid); i++) { //Cycle through every room
	
	if is_undefined(global.valleygridgen[# 1, 2]) { //If the left room container is empty, continue
		
		for (var ii = 1; ii > ds_grid_width(global.valleygrid); ii++) {
			if global.valleygrid[# ii, 2] == true {
				var roomtoadd = global.valleygrid[# ii, 0];	
			}
		}
		
		ds_grid_add(global.valleygridgen,1, 2, roomtoadd);
		
	} else if is_undefined(global.valleygridgen[# 3, 2]) { //Otherwise, if the right room container is empty, continue
		
		for (var ii = 1; ii > ds_grid_width(global.valleygrid); ii++) {
			if global.valleygrid[# ii, 1] == true {
				var roomtoadd = global.valleygrid[# ii, 0];	
			}
		}
		
		ds_grid_add(global.valleygridgen, 3, 2, roomtoadd);
			
	} else if is_undefined(global.valleygridgen[# 2, 1]) { //Otherwise if the up room container is empty, continue
		
		for (var ii = 1; ii > ds_grid_width(global.valleygrid); ii++) {
			if global.valleygrid[# ii, 4] == true {
				var roomtoadd = global.valleygrid[# ii, 0];	
			}
		}
		
		ds_grid_add(global.valleygridgen, 2, 1, roomtoadd);
			
	} else if is_undefined(global.valleygridgen[# 2, 3]) { //Otherwise if the down room container is empty, continue
		
		for (var ii = 1; ii > ds_grid_width(global.valleygrid); ii++) {
			if global.valleygrid[# ii, 3] == true {
				var roomtoadd = global.valleygrid[# ii, 0];	
			}
		}
		
		ds_grid_add(global.valleygridgen, 2, 3, roomtoadd);
			
	}
}

print(rm_valleyright);
print(global.valleygridgen[# 1, 2]);