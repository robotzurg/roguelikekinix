var map = global.worldgrid;

if keyboard_check_pressed(ord("G")) {
	generate_world(rm_valley,9,10,true);
}
if keyboard_check_pressed(ord("H")) {
	generate_world(rm_valley,9,15,true);	
}


var map_w = ds_grid_width(map);
var map_h = ds_grid_height(map);
var mm_size = 32;
mm_sp = mm_size/2; //Spacing

for (var w=0; w < map_w; w++) {
	for (var h=0; h < map_h; h++) {
		if map[# w,h] != 0 {
			draw_set_color(c_white);
			
			draw_rectangle(
			0 + (mm_sp * w) + (mm_size * w),
			0 + (mm_sp * h) + (mm_size * h), 
			mm_size + (mm_sp * w) + (mm_size * w), 
			mm_size + (mm_sp * h) + (mm_size * h),
			false);
			
			draw_set_color(c_lime)
			
			draw_rectangle(
			0 + (mm_sp * w) + (mm_size * w),
			0 + (mm_sp * h) + (mm_size * h), 
			mm_size + (mm_sp * w) + (mm_size * w), 
			mm_size + (mm_sp * h) + (mm_size * h),
			true);
			
			draw_set_color(c_red);
			
			if map[# w,h] mod 2 == 0 { //UP
				draw_rectangle(
				0 + (mm_sp * w) + (mm_size * w) + (mm_size * .25),
				0 + (mm_sp * h) + (mm_size * h), 
				mm_size + (mm_sp * w) + (mm_size * w) - (mm_size * .25),
				mm_size + (mm_sp * h) + (mm_size * h) - (mm_size * 1.25),
				false);
			}
			
			if map[# w,h] mod 5 == 0 { //DOWN
				draw_rectangle(
				0 + (mm_sp * w) + (mm_size * w) + (mm_size * .25),
				0 + (mm_sp * h) + (mm_size * h) + (mm_size * 1.25), 
				mm_size + (mm_sp * w) + (mm_size * w) - (mm_size * .25),
				mm_size + (mm_sp * h) + (mm_size * h),
				false);
			}
			
			if map[# w,h] mod 7 == 0 { //LEFT
				draw_rectangle(
				0 + (mm_sp * w) + (mm_size * w),
				0 + (mm_sp * h) + (mm_size * h) + (mm_size * .25),
				mm_size + (mm_sp * w) + (mm_size * w) - (mm_size * 1.25),
				mm_size + (mm_sp * h) + (mm_size * h) - (mm_size * .25),
				false);
			}
			
			if map[# w,h] mod 3 == 0 { //RIGHT
				draw_rectangle(
				0 + (mm_sp * w) + (mm_size * w) + (mm_size * 1.25),
				0 + (mm_sp * h) + (mm_size * h) + (mm_size * .25),
				mm_size + (mm_sp * w) + (mm_size * w),
				mm_size + (mm_sp * h) + (mm_size * h) - (mm_size * .25),
				false);
			}
				
			} else {
				draw_set_color(c_gray);
				
				draw_rectangle(
				0 + (mm_sp * w) + (mm_size * w),
				0 + (mm_sp * h) + (mm_size * h), 
				mm_size + (mm_sp * w) + (mm_size * w), 
				mm_size + (mm_sp * h) + (mm_size * h),
				false);
		}
	}
}

draw_set_color(c_white);
draw_set_halign(fa_right)
draw_text_transformed(room_width-10,0,"FPS:" + string(fps),2,2,0);