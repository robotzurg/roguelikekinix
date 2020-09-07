if obj_player.current_sector_x == sector_x && obj_player.current_sector_y == sector_y && is_in_sector(obj_player,960,96) {
		image_speed = 1;
}

if image_index > 6 {
	image_speed = 0;
	if timer("reload",1) {
		image_index = 8
		timer_set("shoot",1)
		log("reloading")
	}
	
	if timer("shoot",1) {
		var bullet = instance_create_layer(x,y,"Instances",obj_ruinedturretbullet)
		with bullet {
			direction = point_direction(x,y,obj_player.x,obj_player.y);
			speed = 8;
		}
		image_index = 7;
		timer_set("reload",1);
		log("firing");
	}
}