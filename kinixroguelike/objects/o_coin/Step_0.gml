switch (type) {
	case coin.one: image_index = 0; break;	
	case coin.three: image_index = 1; break;	
	case coin.five: image_index = 2; break;	
	case coin.ten: image_index = 3; break;	
}

if !(place_meeting(x,y,o_CollisionParent)) {
	x = lerp(x,xcoord,0.2);
	y = lerp(y,ycoord,0.2);
}

if timer("Pickup",0.3) {
	canpickup = true;
}

if timer("Despawn",8) {
	instance_destroy();
}

if timer_get("Despawn") <= 2 {
	if timer("Blink") {
		image_alpha = !image_alpha;
		timer_set("Blink",0.1);
	}
}