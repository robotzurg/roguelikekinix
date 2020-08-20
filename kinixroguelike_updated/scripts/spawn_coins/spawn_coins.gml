///Example: spawn_coins(coin.one);
function spawn_coins(argument0) {

	var rx = x+irandom_range(-100,100);
	var ry = y+irandom_range(-100,100);
	var currency = instance_create_layer(x,y,layer,o_coin);
	var ctype = argument0;
	with currency {
		type = ctype;
		xcoord = rx
		ycoord = ry
	}


}
