if fade <= 0{
	instance_destroy();
}

fade -= .01;
x = x+x_vel;
y = y+y_vel;
sprite_index = particle;
image_alpha = fade;
image_angle = img_a;

draw_self();