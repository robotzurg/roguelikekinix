//Player Identifier Init
map = global.playermap;
sprite_index = map[? "Sprite"];
name = map[? "Name"];
hp = map[? "HP"];
hp_max = hp;
spd = map[? "Speed"];
ammo = map[? "Ammo"];
ammo_max = ammo;
rangedmap = map[? "Gun"];
meleemap = map[? "Melee"];
iframes = map[? "iframes"];
currency = 0;
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
melee_rotation = 0; 
melee_wait = 0;

state = "idle"
invin_frames_var = 0;
invin_frames = 30;

arm_length = 12;

cheats_enabled = false;
