randomize();
init_maps();
init_rooms();
count = 0;

room_goto(rm_mainmenu);
draw_set_color(c_white);

global.camera_focus = o_player;
global.maptoset = global.batmap;