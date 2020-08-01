if o_player.current_sector_x == sector_x && o_player.current_sector_y == sector_y && is_in_sector(o_player,960,96){
	with o_spawnzones {
		if o_player.current_sector_x == sector_x && o_player.current_sector_y == sector_y {
			start_spawning = true;
		}
	}
}

if start_spawning == true {
	while spawn_currency > 0 {
		var enemyselection = global.valleyspawnpool[| irandom_range(0,ds_list_size(global.valleyspawnpool)-1)];
		//print(enemyselection[? "Name"]);
		//print("Current Currency: " + string(spawn_currency));
		spawn_currency -= enemyselection[? "Cost"];
		//print("Changed Currency: " + string(spawn_currency));
		global.maptoset = enemyselection;
		instance_create_layer(random_range(x,x+sprite_width),random_range(y,y+sprite_height),"Instances",o_enemy);
	}
}