atkcooldown -= 1;
movetimer -= 1;




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
	direction = random(360)
	speed = spd;
}
}
#endregion

#region // RAM ENEMY
if (map = global.rammap) {
	if i <= 0{
		hspd = 0;
		vspd = 0;
		if(movetimer <= 0){
			i = max(20, (round((point_distance(x,y,o_player.x, o_player.y)/spd)*1.2))); //distance between self and player
			hspd = lengthdir_x(spd,point_direction(x, y, o_player.x, o_player.y));
			vspd = lengthdir_y(spd,point_direction(x, y, o_player.x, o_player.y));
		}
	}
if (i > 0) {
	i--;
	movetimer = random_range(100, 150);
}


if(place_meeting(x+hspd, y+vspd, o_CollisionParent)){
	hspd = 0
	vspd = 0;
	}
}
x = x+hspd;
y = y+vspd;
#endregion

