//Player Identifier Init
map = global.playermap;
sprite_index = map[? "Sprite"]
name = map[? "Name"];
hp = map[? "HP"];
spd = map[? "Speed"];
hspd = 0;
vspd = 0;
ammo = map[? "Ammo"];
gunmap = map[? "Gun"];
meleemap = map[? "Melee"];

//Create the reload timer (for using the guns)
timer("reload");