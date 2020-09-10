if (b_collision){
	if (b_bounce <= 0) {
		if other.bulletpass == false {
			instance_destroy();
		}
	}
}