if(spawn_timer > 0){
	spawn_timer --;
}
else if(spawn_fade_in > 0) {
	spawn_fade_in-=2;
	pixel_alpha = random_range(0,255);
	if(spawn_fade_in <= 0){
		var sw = sprite_width/2;
		var sh = sprite_height/2;
		//var near = instance_nearest(x,y,o_enemy);
		for(var i = 24; i > 0; i--){			
			create_particle(x+random_range(-sw,sw), y+random_range(-sw,sh),random_range(-5,5),random_range(-5,5),"Instances",s_spawn_particle,true);
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
	create_particle(x+random_range(-30,30), y+random_range(-30,30), random_range(-1,1), random_range(-1,1),"Instances",s_ice_particle,false);
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
			create_particle(x+random_range(-30,30), y+random_range(-30,30),random_range(-2,2),-1,"Instances",s_fire_particle,false);
		}
	}
	else{
	hot_tick--;	
	}

}
#endregion

#region // BAT ENEMY AI
if map = global.batmap {

if atkcooldown = 0 {
	atkcooldown = map[? "Attack Cooldown"];
}
	
//Movement
if movetimer = 0 {	
	hspd_mod = 0;
	vspd_mod = 0;
	hspd_mod = lengthdir_x(spd,random_range(0,360));
	vspd_mod = lengthdir_y(spd,random_range(0,360));
	if(o_player.x < x){
		hspd_mod-=1;
		}
	else{
		hspd_mod+=1;
		}
	if(o_player.y < y){
		vspd_mod-=1;
		}
	else{
		vspd_mod+=1;
		}
	movetimer = 10;
	}
	hspd += hspd_mod;
	vspd += vspd_mod;
	
}
#endregion

#region // RAM ENEMY AI

//Movement
if (map = global.rammap) {

	if i_timer = 0{
		vspd_mod = 0;
		hspd_mod = 0;
		if(movetimer <= 0){
			i_timer = max(20, (round((point_distance(x,y,o_player.x, o_player.y)/spd)*1.2))); //distance between self and player
			hspd_mod = lengthdir_x(spd,point_direction(x, y, o_player.x, o_player.y));
			vspd_mod = lengthdir_y(spd,point_direction(x, y, o_player.x, o_player.y));
		}
	}
	hspd += hspd_mod;
	vspd += vspd_mod;
	
//visuals	
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
	
//timer stuff
	if (i_timer > 0) {
		i_timer--;
		movetimer = random_range(100, 150);
	}
}
#endregion

#region //Knockback
if kblen > 0 {
	kblen -= kbspeed;

	
	hspd += lengthdir_x(kbspeed,kbdir);
	vspd += lengthdir_y(kbspeed,kbdir);
	vspd += kbhalf - kblen;
}


#endregion

#region //Collision
if(wall_col = true){
	if(place_meeting(x+hspd, y+vspd, o_CollisionParent)){
		hspd = 0
		vspd = 0;
	}
}

x = x+(hspd*speed_multiplier);
y = y+(vspd*speed_multiplier);
#endregion

}