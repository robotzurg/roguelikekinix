/// @description Insert description here
// You can write your code in this editor
x = o_player.x;
y = o_player.y;
direction = point_direction(x,y,mouse_x,mouse_y) + angle_offset;
image_angle = angle_offset;
image_xscale = sign(direction);

if timer("reload") == true {
	if mouse_check_button(mb_right){
		wu = windup * fps_scale;
		ha = hitbox_active * fps_scale;
		cd = cooldown * fps_scale;
		timer_set("reload",windup+hitbox_active+cooldown);
	}					
}

if (wu > 0){
	wu -= 1;
	angle_offset += (windup_angle/windup)/fps_scale;
}
else if (ha > 0){
	ha -= 1;
	angle_offset -= (hitbox_active_angle/hitbox_active)/fps_scale;
	hitbox_check = 1;
}
else if (cd > 0){
	cd -= 1;
	angle_offset += (cooldown_angle/cooldown)/fps_scale;
	hitbox_check = 0;
}
else{
angle_offset=0;
}

