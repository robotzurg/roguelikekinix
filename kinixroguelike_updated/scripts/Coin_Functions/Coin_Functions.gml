///@param coin_type;
function spawn_coins(argument0) {
	var rx = x+irandom_range(-100,100);
	var ry = y+irandom_range(-100,100);
	var currency = instance_create_layer(x,y,layer,obj_coin);
	var ctype = argument0;
	with currency {
		type = ctype;
		xcoord = rx
		ycoord = ry
	}
}


function death_coindrop(argument0) {
	for (var i = argument0; i > 0; i += 0) {
			if (i >= 10) {
				spawn_coins(coin.ten);
				i -= 10;
			} 
		
			else if (i >= 5) {
				spawn_coins(coin.five);
				i -= 5;
			}
		
			else if (i >= 3) {
				spawn_coins(coin.three);
				i -= 3;
			}
		
			else if (i >= 1) {
				spawn_coins(coin.one);
				i -= 1;
			}
		
		}
}
