if other.canpickup == true {
	instance_destroy(other);
	switch other.type {
		case coin.one: currency += 1; break;
		case coin.three: currency += 3; break;
		case coin.five: currency += 5; break;
		case coin.ten: currency += 10; break;
	}
}