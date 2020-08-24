///RANGED DATA STRUCTS\\\
global.RangedWeapon[rID.pistol] = {
	name : "Pistol",
	type : "Ranged",
	sprite : spr_gun,
	damage : 8,
	fire_rate : 0.2, //Measured in Seconds, time between shots
	automatic : false, //If the weapon can be held down to autofire or not
	ammo_use : 1,
	bullet_range : 0, //How far the bullet can go (0 means infinite)
	bullet_sprite : spr_bullet,
	bullet_trail : false,
	bullet_speed : 8,
	bullet_speed_random : 0, //Random bullet speed (0 means not)
	bullet_bounce : 0, //How many times the bullet can bounce (0 means never)
	bullet_split : 0, //How many times the bullet can split up into more bullets (0 means never)
	bullet_split_amount : 0, //How many bullets the bullet splits up into (Use 0 if Bullet Split is 0)
	bullet_split_angle : 0, //How wide of an angle to split into
	bullet_collision : true, //True means it destroys upon hitting collision, false means it doesn't
	bullet_homing : 0.0, //How much bullets home in on their target
	bullet_spread : 0, //How much bullets are spread out
	bullet_count : 1,
	hot_damage_time : 0, //How long target takes hot damage for, measured in frames.
	cold_damage_time : 0, //Same as above but for cold.
	h_offset : 16, //Horizontal bullet spawn offset from weapon centerpoint
	v_offset : 3, //Vertical of the above.
	ss_intensity : 4, //Screenshake intensity.
	ss_duration : 0.1 //Screenshake Duration, measured in seconds.
} 

global.RangedWeapon[rID.dakka] = {
	name : "Dakka",
	type : "Ranged",
	sprite : spr_dakka,
	damage : 2,
	fire_rate : 0.08, //Measured in Seconds, time between shots
	automatic : true, //If the weapon can be held down to autofire or not
	ammo_use : 1,
	bullet_range : 0, //How far the bullet can go (0 means infinite)
	bullet_sprite : spr_bullet,
	bullet_trail : false,
	bullet_speed : 10,
	bullet_speed_random : 0.1, //Random bullet speed (0 means not)
	bullet_bounce : 0, //How many times the bullet can bounce (0 means never)
	bullet_split : 0, //How many times the bullet can split up into more bullets (0 means never)
	bullet_split_amount : 0, //How many bullets the bullet splits up into (Use 0 if Bullet Split is 0)
	bullet_split_angle : 0, //How wide of an angle to split into
	bullet_collision : true, //True means it destroys upon hitting collision, false means it doesn't
	bullet_homing : 0.0, //How much bullets home in on their target
	bullet_spread : 15, //How much bullets are spread out
	bullet_count : 1,
	hot_damage_time : 0, //How long target takes hot damage for, measured in frames.
	cold_damage_time : 0, //Same as above but for cold.
	h_offset : 16, //Horizontal bullet spawn offset from weapon centerpoint
	v_offset : 3, //Vertical of the above.
	ss_intensity : 10, //Screenshake intensity.
	ss_duration : 0.1 //Screenshake Duration, measured in seconds.
} 

global.RangedWeapon[rID.homingwand] = {
	name : "Homing Staff",
	type : "Ranged",
	sprite : spr_homingWand,
	damage : 2,
	fire_rate : 0.4, //Measured in Seconds, time between shots
	automatic : false, //If the weapon can be held down to autofire or not
	ammo_use : 1,
	bullet_range : 0,  //How far the bullet can go (0 means infinite)
	bullet_sprite : spr_homingstaffbullet,
	bullet_trail : false,
	bullet_speed : 5,
	bullet_speed_random : 0, //Random bullet speed (0 means not
	bullet_bounce : 0, //How many times the bullet can bounce (0 means never)
	bullet_split : 0, //How many times the bullet can split up into more bullets (0 means never)
	bullet_split_amount : 0, //How many bullets the bullet splits up into (Use 0 if Bullet Split is 0)
	bullet_split_angle : 0, //How wide of an angle to split into
	bullet_collision : true, //True means it destroys upon hitting collision, false means it doesn't
	bullet_homing : 0.2, //How much bullets home in on their target
	bullet_spread : 0, //How much bullets are spread out
	bullet_count : 1,
	hot_damage_time : 0, //How long target takes hot damage for, measured in frames.
	cold_damage_time : 0, //Same as above but for cold.
	h_offset : -5, //Horizontal bullet spawn offset from weapon centerpoint
	v_offset : 20, //Vertical version of the above comment.
	ss_intensity : 4, //Screenshake intensity.
	ss_duration : 0.1 //Screenshake Duration, measured in seconds.
}

global.RangedWeapon[rID.sniperwand] = {
	name : "Sniper Wand",
	type : "Ranged",
	sprite : spr_sniperWand,
	damage : 12,
	fire_rate : 2, //Measured in Seconds, time between shots
	automatic : false, //If the weapon can be held down to autofire or not
	ammo_use : 5,
	bullet_range : 0,  //How far the bullet can go (0 means infinite)
	bullet_sprite : spr_SniperWandBullet,
	bullet_trail : true,
	bullet_speed : 40,
	bullet_speed_random : 0, //Random bullet speed (0 means not
	bullet_bounce : 0, //How many times the bullet can bounce (0 means never)
	bullet_split : 0, //How many times the bullet can split up into more bullets (0 means never)
	bullet_split_amount : 0, //How many bullets the bullet splits up into (Use 0 if Bullet Split is 0)
	bullet_split_angle : 0, //How wide of an angle to split into
	bullet_collision : true, //True means it destroys upon hitting collision, false means it doesn't
	bullet_homing : 0.0, //How much bullets home in on their target
	bullet_spread : 0, //How much bullets are spread out
	bullet_count : 1,
	hot_damage_time : 0, //How long target takes hot damage for, measured in frames.
	cold_damage_time : 0, //Same as above but for cold.
	h_offset : 20, //Horizontal bullet spawn offset from weapon centerpoint
	v_offset : -7, //Vertical version of the above comment.
	ss_intensity : 3, //Screenshake intensity.
	ss_duration : 0.1 //Screenshake Duration, measured in seconds.
}

global.RangedWeapon[rID.shotgunwand] = {
	name : "Shotgun Wand",
	type : "Ranged",
	sprite : spr_shotgunWand,
	damage : 2,
	fire_rate : 1, //Measured in Seconds, time between shots
	automatic : false, //If the weapon can be held down to autofire or not
	ammo_use : 4,
	bullet_range : 0.2,  //How long the bullet lives (in seconds)
	bullet_sprite : spr_bullet,
	bullet_trail : false,
	bullet_speed : 20,
	bullet_speed_random : 0.2, //Random bullet speed (0 means not)
	bullet_bounce : 0, //How many times the bullet can bounce (0 means never)
	bullet_split : 0, //How many times the bullet can split up into more bullets (0 means never)
	bullet_split_amount : 0, //How many bullets the bullet splits up into (Use 0 if Bullet Split is 0)
	bullet_split_angle : 0, //How wide of an angle to split into
	bullet_collision : true, //True means it destroys upon hitting collision, false means it doesn't
	bullet_homing : 0, //How much bullets home in on their target
	bullet_spread : 30, //How much bullets are spread out
	bullet_count : 4,
	hot_damage_time : 0, //How long target takes hot damage for, measured in frames.
	cold_damage_time : 0, //Same as above but for cold.
	h_offset : 28, //Horizontal bullet spawn offset from weapon centerpoint
	v_offset : 0, //Vertical of the above.
	ss_intensity : 7, //Screenshake intensity.
	ss_duration : 0.2 //Screenshake Duration, measured in seconds.
}

global.RangedWeapon[rID.icejavelin] = {
	name : "Ice Javelin",
	type : "Ranged",
	sprite : spr_iceJavelin,
	damage : 8,
	fire_rate : 5, //Measured in Seconds, time between shots
	automatic : false, //If the weapon can be held down to autofire or not
	ammo_use : 1,
	bullet_range : 0,  //How long the bullet lives (in seconds)
	bullet_sprite : spr_IceJavelinBullet,
	bullet_trail : true,
	bullet_speed : 6,
	bullet_speed_random : 0, //Random bullet speed (0 means not)
	bullet_bounce : 0, //How many times the bullet can bounce (0 means never)
	bullet_split : 0, //How many times the bullet can split up into more bullets (0 means never)
	bullet_split_amount : 0, //How many bullets the bullet splits up into (Use 0 if Bullet Split is 0)
	bullet_split_angle : 0, //How wide of an angle to split into
	bullet_collision : true, //True means it destroys upon hitting collision, false means it doesn't
	bullet_homing : 0, //How much bullets home in on their target
	bullet_spread : 0, //How much bullets are spread out
	bullet_count : 1,
	hot_damage_time : 0, //How long target takes hot damage for, measured in frames.
	cold_damage_time : 120, //Same as above but for cold.
	h_offset : 8, //Horizontal bullet spawn offset from weapon centerpoint
	v_offset : 0, //Vertical of the above.
	ss_intensity : 3, //Screenshake intensity.
	ss_duration : 0.1 //Screenshake Duration, measured in seconds.
}

global.RangedWeapon[rID.golfball] = {
	name : "Golf Ball",
	type : "Ranged",
	sprite : spr_golfclub,
	damage : 8,
	fire_rate : 0.2, //Measured in Seconds, time between shots
	automatic : false, //If the weapon can be held down to autofire or not
	ammo_use : 0,
	bullet_range : false,  //How far the bullet can go (false means infinite)
	bullet_sprite : spr_golfball,
	bullet_trail : false,
	bullet_speed : 12,
	bullet_speed_random : 0, //Random bullet speed (0 means not)
	bullet_bounce : 2, //How many times the bullet can bounce (0 means never)
	bullet_split : 0, //How many times the bullet can split up into more bullets (0 means never)
	bullet_split_amount : 0, //How many bullets the bullet splits up into (Use 0 if Bullet Split is 0)
	bullet_split_angle : 0, //How wide of an angle to split into
	bullet_collision : true, //True means it destroys upon hitting collision, false means it doesn't
	bullet_homing : 0.0, //How much bullets home in on their target
	bullet_spread : 0, //How much bullets are spread out
	bullet_count : 1,
	hot_damage_time : 0, //How long target takes hot damage for, measured in frames.
	cold_damage_time : 0, //Same as above but for cold.
	h_offset : 2, //Horizontal bullet spawn offset from weapon centerpoint
	v_offset : -24, //Vertical of the above.
	ss_intensity : 8, //Screenshake intensity.
	ss_duration : 0.2 //Screenshake Duration, measured in seconds.
}

///MELEE STRUCTS\\\
global.MeleeWeapon[mID.sword] = { 
	name : "Sword",
	type : "Melee",
	sprite : spr_sword,
	damage : 1,
	autoswing : true, //If it can autoswing by holding down button or not
	deflect : false,
	ranged_atk : 0, //Map for a ranged projectile to use (0 = no projectile)
	slash_sprite : spr_swordswing,
	slash_angle : 10,
	slash_offset : 24, //How far forward the slash is placed
	wait_frames : 30, //How many frames to wait before letting the player attack again
	hot_damage_time : 0, //Hot damage amount of time (in frames)
	cold_damage_time : 0, //Cold damage amount of time (in frames)
	kb_distance : 20 //How many pixels back the target is knocked
}

global.MeleeWeapon[mID.golfclub] = { 
	name : "Golf Club",
	type : "Melee",
	sprite : spr_golfclub,
	damage : 8,
	autoswing : false, //If it can autoswing by holding down button or not
	deflect : false,
	ranged_atk : global.RangedWeapon[rID.golfball], //Map for a ranged projectile to use (0 = no projectile)
	slash_sprite : spr_golfhit,
	slash_angle : -10,
	slash_offset : 0, //How far forward the slash is placed
	wait_frames : 60, //How many frames to wait before letting the player attack again
	hot_damage_time : 0, //Hot damage amount of time (in frames)
	cold_damage_time : 0, //Cold damage amount of time (in frames)
	kb_distance : 40, //How many pixels back the target is knocked
}
	
	///PLAYER STRUCT
global.PlayerData = {
	name : "Jerry",
	sprite : spr_player,
	hp : 15,
	spd : 5,
	ammo : 100,
	ability : 1,
	ranged : global.RangedWeapon[rID.sniperwand],
	melee : global.MeleeWeapon[mID.sword],
	iframes : 3
}

	///ENEMY DATA MAPS\\\
global.Enemy[eID.bat] = {
	name : "Bat",
	sprite : spr_bat,
	hp : 10,
	spd : 2,
	damage : 1,
	cost : 2, //Number of spawn currency it costs to place enemy in room
	spawn_area : area.valley, //Which area the enemy spawns in
	atk_cooldown : 10, //Fire Rate/Time Between Special Attacks
	move_timer : 10,
	collision_dmg : true, //Can do damage with collision or not
	money_drop : 4, //How much money it drops on death.
}

global.Enemy[eID.ram] = {
	name : "Ram",
	sprite : spr_ram,
	hp : 12,
	spd : 5,
	damage : 2,
	cost : 5, //Number of spawn currency it costs to place enemy in room
	spawn_area : area.valley,//Which area the enemy spawns in
	atk_cooldown : 5, //Fire Rate/Time Between Special Attacks
	move_timer : 100,
	collision_dmg : true, //Can do damage with collision or not
	money_drop : 17 //How much money it drops on death.
}

	///ENEMY SPAWN POOL LIST\\\
#region Valley Spawn Pool
	global.valleyspawnpool = ds_list_create();
	ds_list_add(global.valleyspawnpool,global.Enemy[eID.bat]);
	ds_list_add(global.valleyspawnpool,global.Enemy[eID.ram]);
#endregion