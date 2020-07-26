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
hspd = 0;
vspd = 0;

//Create the reload timer (for using the guns)
timer("reload");

//Melee Variables
melee_swing = false;
melee_frames = 0;

state = "idle"