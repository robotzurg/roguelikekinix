var dir_x = lengthdir_x(o_player.meleemap[? "Slash Offset"],  point_direction(o_player.x,o_player.y,mouse_x,mouse_y))
var dir_y = lengthdir_y(o_player.meleemap[? "Slash Offset"],  point_direction(o_player.x,o_player.y,mouse_x,mouse_y))
o_player.melee_rotation-=10;
x = o_player.x + dir_x;
y = o_player.y + dir_y;