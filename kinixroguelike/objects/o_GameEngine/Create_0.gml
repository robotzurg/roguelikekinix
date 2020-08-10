randomize();
global.gamephase = phase.menu
global.worldgrid = -1;
global.valleyareas = -1;

init_maps();
init_rooms();

room_goto(rm_mainmenu);
draw_set_color(c_white);

global.maptoset = global.batmap;
room_to_goto = area_Valley;
global.current_t = 0;

cursor_sprite = s_MouseCursor;
window_set_cursor(cr_none);