hspd = 0;
vspd = 0;
atkcooldown -= 1;
movetimer -= 1;
if hp <= 0 {
	instance_destroy();	
}

#region //Status Effects
//ICE DAMAGE
if cold_time > 0{
	cold_time --;
	speed_multiplier = .5;
	create_particle(x+random_range(-30,30), y+random_range(-30,30), random_range(-1,1), random_range(-1,1),"Instances",s_ice_particle);
}
else{
	speed_multiplier = 1;	
}

//FIRE DAMAGE
if hot_time > 0{
	hot_time --;
	if hot_tick <= 0{
		hot_tick = 60;
		hp -= fire_damage;
		for(var i = 24; i > 0; i--){
			create_particle(x+random_range(-30,30), y+random_range(-30,30),random_range(-2,2),-1,"Instances",s_fire_particle);
		}
	}
	else{
	hot_tick--;	
	}

}
#endregion

#region // BAT ENEMY
if map = global.batmap {

if atkcooldown = 0 {
	atkcooldown = map[? "Attack Cooldown"];
	}

if movetimer = 0 {	
	hspd = lengthdir_x(spd,random_range(0,360));
	vspd = lengthdir_y(spd,random_range(0,360));
	if(o_player.x < x){
		hspd-=1;
		}
	else{
		hspd+=1;
		}
	if(o_player.y < y){
		vspd-=1;
		}
	else{
		vspd+=1;
		}
	movetimer = 10;
	}
	
}
#endregion

#region // RAM ENEMY
if (map = global.rammap) {
	
	/*if i_timer = 0{
		
		hspd = 0;
		vspd = 0;
		if(movetimer <= 0){
			i_timer = max(20, (round((point_distance(x,y,o_player.x, o_player.y)/spd)*1.2))); //distance between self and player
			hspd = lengthdir_x(spd,point_direction(x, y, o_player.x, o_player.y));
			vspd = lengthdir_y(spd,point_direction(x, y, o_player.x, o_player.y));
		}
	}
	
	if(vspd!=0 || hspd!=0){
		if(image_index>11 || (image_index<8 && (vspd!=0 || hspd!=0))){image_index = 8;}
	}
	else if(movetimer > 80){
		if(image_index>3){image_index = 0;}
	}
	else if(movetimer < 80){
		if(sign(x-o_player.x!=0)){
			image_xscale = sign(x-o_player.x);	
		}
		if(image_index>7){image_index = 4;}
	}
	
	if(sign(hspd!=0)){
	image_xscale = -sign(hspd);	
	}
	
	if (i_timer > 0) {
		i_timer--;
		movetimer = random_range(100, 150);
	}*/
	
	
}
#endregion

#region Knockback
if kblen > 0 {
	kblen -= 10;
	
	hspd += lengthdir_x(10,kbdir);
	vspd += lengthdir_y(10,kbdir);
}


#endregion

#region //collision
if(wall_col = true){
	if(place_meeting(x+hspd, y+vspd, o_CollisionParent)){
		hspd = 0
		vspd = 0;
	}
}

x = x+(hspd*speed_multiplier);
y = y+(vspd*speed_multiplier);
#endregion