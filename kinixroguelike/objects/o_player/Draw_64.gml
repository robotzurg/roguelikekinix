var xoffset = 200;
var yoffset = 150;
var boxh = 10;
var boxw = 1;
var ammo_pcnt = ammo/ammo_max;
var hp_percent = hp/hp_max;
var slope = xoffset/yoffset;


//MAIN UI BLACK TRIANGLE
draw_set_color(c_black);
draw_set_alpha(0.75);
	draw_primitive_begin(pr_trianglelist);
	draw_vertex(0, yoffset);
	draw_vertex(0, 0);
	draw_vertex(xoffset, 0);
	draw_primitive_end();
draw_set_color(c_white);
draw_set_alpha(.5);

//RED HP Shape
draw_set_color(c_red);
	draw_primitive_begin(pr_trianglelist);
	draw_vertex(0, 0);
	draw_vertex(0, 55*hp_percent);
	draw_vertex(200 * hp_percent, 0);
	draw_vertex(107* hp_percent, 70);
	draw_primitive_end();
draw_set_color(c_white);
draw_set_alpha(1);

draw_text_transformed_color(0,14,"HP",1,1,40,c_black,c_black,c_black,c_black,1)

//HP "/" 
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(105, 20);
	draw_vertex(105, 25);
	draw_vertex(90, 45);
	draw_vertex(90, 50);
draw_primitive_end();

//UI Line Divider
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(0, 55);
	draw_vertex(0, 60);
	draw_vertex(115, 65);
	draw_vertex(107, 70);
draw_primitive_end();

draw_set_color(c_black);

//Ammo Rectangle
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(xoffset, 0);
	draw_vertex(xoffset+20, 0);
	draw_vertex(0, yoffset);
	draw_vertex(0, yoffset+15);
draw_primitive_end();

draw_set_color(c_aqua);

for (var i=0; i< yoffset * ammo_pcnt; i+=yoffset/100) {
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(xoffset - (i + boxw) * slope, i + boxh);
	draw_vertex(xoffset - (i + boxw) * slope, i + boxh/slope + boxh);
	draw_vertex(xoffset - i * slope, i - boxh/slope + boxh);
	draw_vertex(xoffset - i * slope, i + boxh);
draw_primitive_end();

}


draw_set_color(c_white);

draw_sprite_ext(gunmap[? "Sprite"],0,30,100,1,1,-25,image_blend,1);

draw_set_font(font_hp);
draw_text_transformed(55,8,hp,2,2,0);
draw_text_transformed(107,30,"10",1,1,0);