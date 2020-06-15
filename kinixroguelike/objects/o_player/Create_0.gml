//Player Identifier Init
map = global.playermap;
sprite_index = map[? "Sprite"];
name = map[? "Name"];
hp = map[? "HP"];
spd = map[? "Speed"];
ammo = map[? "Ammo"];
gunmap = map[? "Gun"];
meleemap = map[? "Melee"];
//Create the reload timer (for using the guns)
timer("reload");

draw_fade_text(x,y,name);