/*GRIDS WORK LIKE SO:
x: room 1, room 2, room 3, room 4, room 5
y (under each x): left door, right door, up door, down door, dead end
*/

///VALLEY ROOM GRID\\\
global.valleygrid = ds_grid_create(15,15);

ds_grid_add(global.valleygrid,0,0,rm_valleymain);
ds_grid_add(global.valleygrid,0,1,true); //Left Door
ds_grid_add(global.valleygrid,0,2,true); //Right Door
ds_grid_add(global.valleygrid,0,3,true); //Up Door
ds_grid_add(global.valleygrid,0,4,true); //Down Door
ds_grid_add(global.valleygrid,0,5,false); //Dead End Room

ds_grid_add(global.valleygrid,1,0,rm_valleydown);
ds_grid_add(global.valleygrid,1,1,false); //Left Door
ds_grid_add(global.valleygrid,1,2,false); //Right Door
ds_grid_add(global.valleygrid,1,3,true); //Up Door
ds_grid_add(global.valleygrid,1,4,false); //Down Door
ds_grid_add(global.valleygrid,1,5,true); //Dead End Room

ds_grid_add(global.valleygrid,2,0,rm_valleyleft);
ds_grid_add(global.valleygrid,2,1,false); //Left Door
ds_grid_add(global.valleygrid,2,2,true); //Right Door
ds_grid_add(global.valleygrid,2,3,false); //Up Door
ds_grid_add(global.valleygrid,2,4,false); //Down Door
ds_grid_add(global.valleygrid,2,5,true); //Dead End Room

ds_grid_add(global.valleygrid,3,0,rm_valleyright);
ds_grid_add(global.valleygrid,3,1,true); //Left Door
ds_grid_add(global.valleygrid,3,2,false); //Right Door
ds_grid_add(global.valleygrid,3,3,false); //Up Door
ds_grid_add(global.valleygrid,3,4,false); //Down Door
ds_grid_add(global.valleygrid,3,5,true); //Dead End Room

ds_grid_add(global.valleygrid,4,0,rm_valleyup);
ds_grid_add(global.valleygrid,4,1,false); //Left Door
ds_grid_add(global.valleygrid,4,2,false); //Right Door
ds_grid_add(global.valleygrid,4,3,false); //Up Door
ds_grid_add(global.valleygrid,4,4,true); //Down Door
ds_grid_add(global.valleygrid,4,5,true); //Dead End Room