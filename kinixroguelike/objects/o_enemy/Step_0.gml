enemyreload -= 1;

if hp == 0 {
	instance_destroy();	
}


if enemyreload == 0 {
var bullet = instance_create_layer(x,y,layer,o_bullet)
with bullet {direction=point_direction(x,y,o_player.x,o_player.y) speed = 8}
}

if enemyreload = 0 {
	enemyreload = 10
}

