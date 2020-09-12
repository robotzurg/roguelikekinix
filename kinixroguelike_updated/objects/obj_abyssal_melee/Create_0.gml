/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
struct = global.Enemy[eID.abyssal_melee]
sprite_index = struct.sprite
name = struct.name
hp = struct.hp
spd = struct.spd
dmg = struct.damage
spawncost = struct.cost
spawnarea = struct.spawn_area
atkcooldown = struct.atk_cooldown;
movetimer = struct.move_timer
coldmg = struct.collision_dmg
invin = false;
wall_col = true;
currencydrop = struct.money_drop

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

spawn_timer = random_range(0,60);
spawn_fade_in = 100;

image_alpha = 0;

pixel_alpha = 1;
shd_px_alpha = shader_get_uniform(shd_white_spawn,"shd_alpha");
shd_px_alpha_fade = shader_get_uniform(shd_white_spawn,"shd_alpha_fade");

//FANCY ABYSSLAD STUFF
i_timer = 60;
ai_mode = "idle";