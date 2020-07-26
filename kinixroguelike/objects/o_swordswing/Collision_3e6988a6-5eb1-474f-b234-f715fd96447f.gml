other.hp -= o_player.meleemap[? "Damage"];

other.kblen = o_player.meleemap[? "Knockback Distance"];
other.kbhalf = (o_player.meleemap[? "Knockback Distance"])/2;
other.kbdir = point_direction(o_player.x,o_player.y,other.x,other.y);