if (live_call()) return live_result;


//MAIN UI BLACK TRIANGLE
draw_set_color(c_black);
draw_set_alpha(0.75);
	draw_primitive_begin(pr_trianglelist);
	draw_vertex(0, 150);
	draw_vertex(0, 0);
	draw_vertex(200, 0);
	draw_primitive_end();
draw_set_color(c_white);
draw_set_alpha(1);

//RED HP TRIANGLE
draw_set_color(c_red);
draw_primitive_begin(pr_trianglelist);
draw_vertex(0, 40);
draw_vertex(0, 0);
draw_vertex(50, 0);
draw_primitive_end();
draw_set_color(c_white);

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

draw_set_color(c_aqua);

//Ammo Rectangle
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(200, 0);
	draw_vertex(220, 0);
	draw_vertex(0, 150);
	draw_vertex(0, 165);
draw_primitive_end();

draw_set_color(c_white);

//for (var i=0; i<10; i++) {
	draw_line_color(190,20,170,30,c_black,c_black)	
//}

draw_sprite_ext(gunmap[? "Sprite"],0,30,100,1,1,-25,image_blend,1);

draw_set_font(font_hp);
draw_text_transformed(55,8,hp,2,2,0);
draw_text_transformed(107,30,"10",1,1,0);