fade -= .01;
x = x+x_vel;
y = y+y_vel;
sprite_index = particle;
image_alpha = fade;
if fade <= 0{
	instance_destroy();
}

draw_self();