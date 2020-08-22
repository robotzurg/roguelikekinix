function is_in_sector(argument0, argument1, argument2) {
	///@param object
	///@param room_size
	///@param door_buffer_amount
	//is_in_sector(object, room_size, door_buffer_amount);
	//checks if the object is within a sector accounting for a buffered amount

	var o = argument0; //object
	var s = argument1; //size of room
	var sh = s/2; //midpoint of room
	var db = argument2; //how much to buffer for

	if(abs(((o.x) mod s) - sh) < sh - db)&&(abs(((o.y) mod s) - sh) < sh - db){
		return(true)
	}
	else{
		return(false)
	}
}

if obj_player.current_sector_x == sector_x && obj_player.current_sector_y == sector_y && is_in_sector(obj_player,960,96) && fresh_sector {
	global.spawn_currency = spawner_currency;
	with obj_spawnzones {
		if obj_player.current_sector_x == sector_x && obj_player.current_sector_y == sector_y{
			start_spawning = true;
			fresh_sector = false;
		}
	}
}


if start_spawning == true {
	if global.spawn_currency > 0 {
		var enemyselection = global.valleyspawnpool[| irandom_range(0,ds_list_size(global.valleyspawnpool)-1)];
		global.spawn_currency -= enemyselection[? "Cost"];
		global.maptoset = enemyselection;
		instance_create_layer(random_range(x,x+sprite_width),random_range(y,y+sprite_height),"Instances",obj_enemy);
	}
	else {
		start_spawning = false;	
	}
}