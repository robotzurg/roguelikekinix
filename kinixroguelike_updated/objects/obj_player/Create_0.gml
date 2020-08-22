//Player Identifier Init
struct = global.PlayerData
sprite_index = struct.sprite
name = struct.name
hp = struct.hp;
hp_max = struct.hp
spd = struct.spd
ammo = struct.ammo
ammo_max = ammo;
ranged = struct.ranged
melee = struct.melee;
iframes = struct.iframes
currency = 0;
flipped = 1;
current_sector_x = 0;
current_sector_y = 0;
wepequipped = "Ranged";
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
