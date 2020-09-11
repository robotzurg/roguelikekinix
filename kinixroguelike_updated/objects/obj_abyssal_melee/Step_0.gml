
if(spawn_timer > 0){
	spawn_timer --;
}
else if(spawn_fade_in > 0) {
	if(image_index>3){image_index = 0;}
	spawn_fade_in-=2;
	pixel_alpha = random_range(0,255);
	if(spawn_fade_in <= 0){
		var sw = sprite_width/2;
		var sh = sprite_height/2;
		//var near = instance_nearest(x,y,obj_ParentEnemy);
		for(var i = 24; i > 0; i--){			
			create_particle(x+random_range(-sw,sw), y+random_range(-sw,sh),random_range(-5,5),random_range(-5,5),"Instances",par_spawn_particle,true);
		} 
	}
}
else{

atkcooldown -= 1;
movetimer -= 1;

hspd = 0; 
vspd = 0;


#region Enemy Death State

if hp <= 0 {
	instance_destroy();	
	death_coindrop(currencydrop);
}

#endregion

#region //Status Effects
//ICE DAMAGE
if cold_time > 0{
	cold_time --;
	speed_multiplier = .5;
	fire_rate =  struct.fire_rate*2; 
	create_particle(x+random_range(-30,30), y+random_range(-30,30), random_range(-1,1), random_range(-1,1),"Instances",par_ice_particle,false);
}
else{
	speed_multiplier = 1;	
	fire_rate = struct.fire_rate;
}

//FIRE DAMAGE
if hot_time > 0{
	hot_time --;
	if hot_tick <= 0{
		hot_tick = 60;
		hp -= fire_damage;
		for(var i = 24; i > 0; i--){
			create_particle(x+random_range(-30,30), y+random_range(-30,30),random_range(-2,2),-1,"Instances",par_fire_particle,false);
		}
	}
	else{
	hot_tick--;	
	}

}
#endregion



#region // Abyssal Melee AI

//Movement

	
	if ai_mode = "running"{
		if(image_index>7){image_index = 4;}
		hspd_mod = clamp(hspd_mod - sign(x-obj_player.x)/10,-spd,spd);
		vspd_mod = clamp(vspd_mod - sign(y-obj_player.y)/10,-spd,spd);

		image_xscale = sign(x-obj_player.x);
	}
	else if ai_mode = "idle"{
		if(image_index>3){image_index = 0;}
		hspd_mod = hspd_mod/2;
		vspd_mod = vspd_mod/2;	
		if (i_timer > 0){
			i_timer--;
		}
		else{
			i_timer = random_range(100, 150);
			ai_mode = "running"
			image_index = 4;
		}
	}
	else if ai_mode = "attacking"{
		hspd_mod = hspd_mod/2;
		vspd_mod = vspd_mod/2;
		if(image_index>14){ai_mode = "idle"}
	}
	
	if (ai_mode!= "attacking" && point_distance(x,y,obj_player.x, obj_player.y) < 40){
		ai_mode = "attacking";	
		image_index = 8;
	}
			
	hspd += hspd_mod;
	vspd += vspd_mod;
	
#endregion
}


#region //Knockback
if kblen > 0 {
	kblen -= kbspeed;

	
	hspd += lengthdir_x(kbspeed,kbdir);
	vspd += lengthdir_y(kbspeed,kbdir);
	vspd += kbhalf - kblen;
}


#endregion

#region //Collision
	if(place_meeting(x+(hspd*speed_multiplier), y, obj_CollisionParent)){
		for(var ix = 0; ix > -1; ix++){
			ix++;
			if(place_meeting(x+(ix*speed_multiplier), y, obj_CollisionParent)){
				hspd = max(ix-1,0);
				ix = -1;
			}
		}
	}
	if(place_meeting(x, y+(vspd*speed_multiplier), obj_CollisionParent)){
		for(var iy = 0; iy > -1; iy++){
			iy++;
			if(place_meeting(x+(ix*speed_multiplier), y, obj_CollisionParent)){
				vspd = max(iy-1,0);
				iy = -1;
			}
		}
	}

x = x+(hspd*speed_multiplier);
y = y+(vspd*speed_multiplier);
#endregion
