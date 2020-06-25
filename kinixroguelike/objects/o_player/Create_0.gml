//Player Identifier Init
map = global.playermap;
sprite_index = map[? "Sprite"];
name = map[? "Name"];
hp = map[? "HP"];
spd = map[? "Speed"];
ammo = map[? "Ammo"];
gunmap = map[? "Gun"];
meleemap = map[? "Melee"];
iframes = map[? "iframes"];
flipped = 1;
current_sector_x = 0;
current_sector_y = 0;
wepequipped = "ranged";
//Create the reload timer (for using the guns)
timer("reload");

instance_create_layer(x,y,layer,o_melee);
instance_create_layer(x,y,layer,o_ranged);