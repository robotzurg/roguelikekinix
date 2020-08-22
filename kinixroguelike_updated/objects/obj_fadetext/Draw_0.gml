y -= 0.1;
a -= 0.02;

draw_set_font(font_main);
draw_set_halign(halign);
draw_set_valign(valign);
	draw_text_transformed_color(x,y,text_to_draw,xscale,yscale,angle,color,color,color,color,a);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if a == 0 {
	instance_destroy();	
}