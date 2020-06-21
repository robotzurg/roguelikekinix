atkcooldown -= 1;
movetimer -= 1;

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



if hp <= 0 {
	instance_destroy();	
}


/*if enemyreload == 0 {
var bullet = instance_create_layer(x,y,layer,o_bullet)
with bullet {direction=point_direction(x,y,o_player.x,o_player.y) speed = 8}
}*/

#region // BAT ENEMY
if map = global.batmap {

if atkcooldown = 0 {
	atkcooldown = map[? "Attack Cooldown"];
}

if movetimer = 0 {
	var r = 0;
	r = random(360);
	hspd = lengthdir_x(spd,r);
	vspd = lengthdir_y(spd,r);
}
if(place_meeting(x+hspd, y+vspd, o_CollisionParent)){
	hspd = 0
	vspd = 0;
	}
}
#endregion

#region // RAM ENEMY
if (map = global.rammap) {
	if ram_i <= 0{
		hspd = 0;
		vspd = 0;
		if(movetimer <= 0){
			ram_i = max(20, (round((point_distance(x,y,o_player.x, o_player.y)/spd)*1.2))); //distance between self and player
			hspd = lengthdir_x(spd,point_direction(x, y, o_player.x, o_player.y));
			vspd = lengthdir_y(spd,point_direction(x, y, o_player.x, o_player.y));
		}
	}
if (ram_i > 0) {
	ram_i--;
	movetimer = random_range(100, 150);
}


if(place_meeting(x+hspd, y+vspd, o_CollisionParent)){
	hspd = 0
	vspd = 0;
	}
}

#endregion

x = x+(hspd*speed_multiplier);
y = y+(vspd*speed_multiplier);