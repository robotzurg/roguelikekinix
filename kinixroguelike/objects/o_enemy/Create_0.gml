map = global.maptoset;
sprite_index = map[? "Sprite"];
name = map[? "Name"];
hp = map[? "HP"] ;
spd = map[? "Speed"];
spawncost = map[? "Cost"];
spawnarea = map[? "Spawn Area"];
atkcooldown = map[? "Attack Cooldown"];
movetimer = map[? "Move Timer"]
coldmg = map[? "coldmg"];
invin = false;
wall_col = true;

speed_multiplier = 1;
cold_time = 0;
hot_time = 0;
hot_tick = 60;
fire_damage = 1;

hspd = 0;
vspd = 0;

i_timer = 0;

//Knockback variables
kblen = 0;
kbdir = 0;
