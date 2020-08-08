//Player Identifier Init
map = global.playermap;
sprite_index = map[? "Sprite"];
name = map[? "Name"];
hp = map[? "HP"];
hp_max = hp;
spd = map[? "Speed"];
ammo = map[? "Ammo"];
ammo_max = ammo;
gunmap = map[? "Gun"];
meleemap = map[? "Melee"];
iframes = map[? "iframes"];
flipped = 1;
current_sector_x = 0;
current_sector_y = 0;
wepequipped = "ranged";
hspd = 0;
vspd = 0;
bullet_v_offset = gunmap[? "Vertical Offset"];
bullet_h_offset = gunmap[? "Horizontal Offset"];

//Create the reload timer (for using the guns)
timer("reload");

//Melee Variables
melee_swing = false;
melee_frames = 0;
melee_rotation = 0; 

state = "idle"
invin_frames_var = 0;
invin_frames = 30;

arm_length = 12;