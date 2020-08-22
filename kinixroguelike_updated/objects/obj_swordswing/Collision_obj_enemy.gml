if obj_player.cheats_enabled == false {
	other.hp -= obj_player.meleemap[? "Damage"];
} else {
	other.hp -= other.hp;	
}

other.kblen = obj_player.meleemap[? "Knockback Distance"];
other.kbhalf = (obj_player.meleemap[? "Knockback Distance"])/2;
other.kbdir = point_direction(obj_player.x,obj_player.y,other.x,other.y);