if instance_exists(obj_ParentEnemy) {
if obj_player.current_sector_x == sector_x && obj_player.current_sector_y == sector_y && is_in_sector(obj_player,960,96) {
    image_speed = 1;
        
    if image_index > 4 {
        if(t_reload > 0){
            t_reload--;    
            image_index = 5;
        }
        else if(t_hold > 0){
                t_hold--;
				if image_index = 11 {
					image_index = 9
				}
                
        }
        else{
			image_speed = 0;
            image_index = 7;
            t_reload = 60;
            t_hold = 60;
            var bullet = instance_create_layer(x,y,"Instances",obj_ruinedturretbullet)
            with bullet {
                direction = point_direction(x,y,obj_player.x,obj_player.y);
                speed = 8;
            }    
        }
    }
        
}
else{
    if (image_index < 0){
        image_speed = -1;
    }
    else {
        image_speed = 0;    
    }
}
} else { //If no enemies are in the room
	 if (floor(image_index) != 1){
        image_speed = -1;
    } else {
		image_speed = 0;	
	}
}