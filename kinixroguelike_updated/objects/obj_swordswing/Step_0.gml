var dir_x = lengthdir_x(obj_player.melee.slash_offset,  point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))
var dir_y = lengthdir_y(obj_player.melee.slash_offset,  point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))
obj_player.melee_rotation -= obj_player.melee.slash_angle;
x = obj_player.x + dir_x;
y = obj_player.y + dir_y;