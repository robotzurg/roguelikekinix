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

hspd_mod = 0;
vspd_mod = 0;

i_timer = 0;

//Knockback variables
kblen = 0;
kbdir = 0;
kbhalf = 0;
kbspeed = 3;

spawn_timer = random_range(0,120);
spawn_fade_in = 100;

image_alpha = 0;

pixel_alpha = 1;
shd_px_alpha = shader_get_uniform(shd_white_spawn,"shd_alpha");
shd_px_alpha_fade = shader_get_uniform(shd_white_spawn,"shd_alpha_fade");