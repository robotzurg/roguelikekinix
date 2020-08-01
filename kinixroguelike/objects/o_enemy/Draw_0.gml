/// @description Insert description here
// You can write your code in this editor

if(spawn_fade_in > 0) {
	image_alpha = (100-spawn_fade_in)/100
	shader_set(shd_white_spawn);
	shader_set_uniform_f(shd_px_alpha,pixel_alpha);
	shader_set_uniform_f(shd_px_alpha_fade,image_alpha);
}
draw_self();
shader_reset();