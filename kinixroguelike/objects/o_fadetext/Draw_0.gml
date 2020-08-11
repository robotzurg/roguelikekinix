y -= 0.1;
a -= 0.02;

draw_set_font(font_main);
draw_set_color(c_white);
draw_set_alpha(a);
draw_text_transformed(x,y,text_to_draw,xscale,yscale,angle);
draw_set_alpha(1);

if a == 0 {
	instance_destroy();	
}