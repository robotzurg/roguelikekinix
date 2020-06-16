atkcooldown -= 1;
movetimer -= 1;

if hp == 0 {
	instance_destroy();	
}


/*if enemyreload == 0 {
var bullet = instance_create_layer(x,y,layer,o_bullet)
with bullet {direction=point_direction(x,y,o_player.x,o_player.y) speed = 8}
}*/

if map = global.batmap {

if atkcooldown = 0 {
	atkcooldown = map[? "Attack Cooldown"];
}

if movetimer = 0 {
	direction = random(360)
	speed = spd;
}

if movetimer == 0 {
	movetimer = 10
}
}

if map = global.rammap {
	if movetimer = 0 {
		
	}
}