y -= 0.1;
a -= 0.01;

draw_set_color(c_white);
draw_set_alpha(a);
draw_text_transformed(x,y,text_to_draw,xscale,yscale,angle);
draw_set_alpha(1);

if a == 0 {
	instance_destroy();	
}