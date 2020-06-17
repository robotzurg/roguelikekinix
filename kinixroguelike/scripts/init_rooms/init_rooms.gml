/*GRIDS WORK LIKE SO:
x: room 1, room 2, room 3, room 4, room 5
y (under each x): left door, right door, up door, down door, dead end
*/

///VALLEY ROOM GRID\\\
global.valleygrid = ds_grid_create(15,15);

ds_grid_add(global.valleygrid,0,0,rm_valleymain);
ds_grid_add(global.valleygrid,0,1,15); //Room Value

ds_grid_add(global.valleygrid,1,0,rm_valleydown);
ds_grid_add(global.valleygrid,1,1,1); 

ds_grid_add(global.valleygrid,2,0,rm_valleyleft);
ds_grid_add(global.valleygrid,2,1,2);

ds_grid_add(global.valleygrid,3,0,rm_valleyright);
ds_grid_add(global.valleygrid,3,1,8);

ds_grid_add(global.valleygrid,4,0,rm_valleyup);
ds_grid_add(global.valleygrid,4,0,4);