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
		with instance_create_layer(random_range(x,x+sprite_width),random_range(y,y+sprite_height),"Instances",enemyselection) {
			global.spawn_currency -= spawncost;	
		}
	}
	else {
		start_spawning = false;	
	}
}