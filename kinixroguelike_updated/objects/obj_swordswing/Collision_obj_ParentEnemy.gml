if obj_player.cheats_enabled == false {
	other.hp -= obj_player.melee.damage
} else {
	other.hp -= other.hp;	
}

other.kblen = obj_player.melee.kb_distance
other.kbhalf = (obj_player.melee.kb_distance)/2;
other.kbdir = point_direction(obj_player.x,obj_player.y,other.x,other.y);