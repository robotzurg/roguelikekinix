if (hitbox_check > 0){
	if other.invin == false {
		other.hp -= damage;	
		draw_fade_text_transformed(x + random_range(-50,50),y-50,damage,2,2,0);
		other.invin = true;
	}
}