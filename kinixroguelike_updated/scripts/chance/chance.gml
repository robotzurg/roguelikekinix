function chance(argument0) {
	//chance(percent);
	///@param percent

	var percent = argument0;

	var roll = irandom_range(0,100);

	if roll >= percent {
		return false;
	} else {
		return true;	
	}


}
