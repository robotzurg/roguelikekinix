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
