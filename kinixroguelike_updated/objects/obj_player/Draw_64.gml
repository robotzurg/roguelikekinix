var xoffset = 200;
var yoffset = 150;
var boxh = 10;
var boxw = 1;
var ammo_pcnt = ammo/ammo_max;
var hp_percent = hp/hp_max;
var slope = xoffset/yoffset;
var time_sin = min(1,(sin(global.current_t/20)+1)/4);
draw_set_font(font_currency)

//Draw Cheat Text
if cheats_enabled {
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
		draw_text_transformed(RES_W-5,RES_H+5,"CHEATS ENABLED!",1,1,0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}


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
	draw_primitive_begin(pr_trianglestrip);
	draw_vertex(0, 0);
	draw_vertex(0, 55);
	draw_vertex(200 * hp_percent, 0);
	draw_vertex(115 * hp_percent, 55+(15 * hp_percent));
	draw_primitive_end();
draw_set_color(c_white);
draw_set_alpha(1);

draw_text_transformed_color(0,14,"HP",0.5,0.5,40,c_black,c_black,c_black,c_black,1)

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

//Red HP Area (I think? Pines pls comment your code)

for (var i=0; i< yoffset * ammo_pcnt; i+=yoffset/100) {
draw_primitive_begin(pr_trianglestrip);
	draw_vertex(xoffset - (i + boxw) * slope, i + boxh);
	draw_vertex(xoffset - (i + boxw) * slope, i + boxh/slope + boxh);
	draw_vertex(xoffset - i * slope, i - boxh/slope + boxh);
	draw_vertex(xoffset - i * slope, i + boxh);
draw_primitive_end();

}

//Draw the Weapon in the UI.
draw_set_color(c_white);

if wepequipped == "Ranged" {
	gpu_set_fog(true,c_white,0,1);
		draw_sprite_ext(rangedmap[? "Sprite"],0,31,100,1,1,-25,image_blend,time_sin);
		draw_sprite_ext(rangedmap[? "Sprite"],0,29,100,1,1,-25,image_blend,time_sin);
		draw_sprite_ext(rangedmap[? "Sprite"],0,30,101,1,1,-25,image_blend,time_sin);
		draw_sprite_ext(rangedmap[? "Sprite"],0,30,99,1,1,-25,image_blend,time_sin);
	gpu_set_fog(false,c_white,0,1);
		draw_sprite_ext(rangedmap[? "Sprite"],0,30,100,1,1,-25,image_blend,1);
		draw_sprite_ext(meleemap[? "Sprite"],0,75,70,0.75,0.75,-25,image_blend,0.55);
} else if wepequipped == "Melee" {
	gpu_set_fog(true,c_white,0,1);
		draw_sprite_ext(meleemap[? "Sprite"],0,31,100,1,1,-25,image_blend,time_sin);
		draw_sprite_ext(meleemap[? "Sprite"],0,29,100,1,1,-25,image_blend,time_sin);
		draw_sprite_ext(meleemap[? "Sprite"],0,30,101,1,1,-25,image_blend,time_sin);
		draw_sprite_ext(meleemap[? "Sprite"],0,30,99,1,1,-25,image_blend,time_sin);
	gpu_set_fog(false,c_white,0,1);
		draw_sprite_ext(meleemap[? "Sprite"],0,30,100,1,1,-25,image_blend,1);
		draw_sprite_ext(rangedmap[? "Sprite"],0,75,70,0.75,0.75,-25,image_blend,0.55);
}

//Draw HP Text
draw_text_transformed(55,8,hp,1,1,0);
draw_text_transformed(103,30,"10",0.5,0.5,0);

//Draw FPS Text
draw_set_halign(fa_right)
	draw_text_transformed(955,0,"FPS:" + string(fps),1,1,0);
draw_set_halign(fa_left);


//Draw Currency Stuff
draw_set_valign(fa_bottom)
	draw_sprite(spr_currencyicon,0,18,520);
	draw_text(35,545,"x" + string(currency))
draw_set_valign(fa_top);