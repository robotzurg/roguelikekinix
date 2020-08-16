///RANGED DATA MAPS\\\
#region Pistol Map
global.pistolmap = ds_map_create();

ds_map_add(global.pistolmap,"Name","Pistol"); //Name of the Gun
ds_map_add(global.pistolmap,"Type","Ranged"); //Weapon Type
ds_map_add(global.pistolmap,"Sprite",s_gun); //Sprite of the Gun
ds_map_add(global.pistolmap,"Damage",8); //Damage of the Gun
ds_map_add(global.pistolmap,"Fire Rate",0.2); //Measured in Seconds, time between shots
ds_map_add(global.pistolmap,"Ammo Use",1) //Amount of Ammo the gun uses.
ds_map_add(global.pistolmap,"Range", false); //How far the bullet can go (false means infinite)
ds_map_add(global.pistolmap,"Bullet Sprite",s_bullet); //Self Explanatory.
ds_map_add(global.pistolmap,"Bullet Trail",false); //If there is a trail or not (false means no trail)
ds_map_add(global.pistolmap,"Bullet Speed",8); //Speed of the Bullets
ds_map_add(global.pistolmap,"Bullet Bounce",0) //How many times the bullet can bounce (0 means never)
ds_map_add(global.pistolmap,"Bullet Split", 0) //How many times the bullet can split up into more bullets (0 means never)
ds_map_add(global.pistolmap,"Bullet Split Amount", 0) //How many bullets the bullet splits up into (Use 0 Bullet Split is 0)
ds_map_add(global.pistolmap,"Bullet Split Angle", 0) //How wide of an angle to split into
ds_map_add(global.pistolmap,"Bullet Collision",true) //True means it destroys upon hitting collision, false means it doesn't
ds_map_add(global.pistolmap,"Bullet Homing", 0.0) //How much bullets home in on their target
ds_map_add(global.pistolmap,"Bullet Spread",0) //How much the bullets spread out
ds_map_add(global.pistolmap,"Bullet Count",1) //How many bullets are fired per shot
ds_map_add(global.pistolmap,"Hot Damage Time",0) //How long target takes hot damage for (60 per tick of damage)
ds_map_add(global.pistolmap,"Cold Damage Time",0) //How long target is slowed for (60 per second of cold)
ds_map_add(global.pistolmap,"Vertical Offset",3) //Vertical offset for the bullet spawns
ds_map_add(global.pistolmap,"Horizontal Offset",16) //How far out bullets are spawned from the weapon's center point
ds_map_add(global.pistolmap,"Screenshake Intensity",4); //How intense screenshake is when a bullet is shot. (0 means no screenshake)
ds_map_add(global.pistolmap,"Screenshake Duration",0.1); //How long screenshake lasts (in seconds, invalid if screenshake intensity is 0)
#endregion

#region Homing Staff Map
global.homingstaffmap = ds_map_create();

ds_map_add(global.homingstaffmap,"Name","Homing Staff"); //Name of the Gun
ds_map_add(global.homingstaffmap,"Type","Ranged"); //Weapon Type
ds_map_add(global.homingstaffmap,"Sprite",s_homingWand); //Sprite of the Gun
ds_map_add(global.homingstaffmap,"Damage",2); //Damage of the Gun
ds_map_add(global.homingstaffmap,"Fire Rate",0.4); //Measured in Seconds, time between shots
ds_map_add(global.homingstaffmap,"Ammo Use",1) //Amount of Ammo the gun uses.
ds_map_add(global.homingstaffmap,"Range", false); //How far the bullet can go (false means infinite)
ds_map_add(global.homingstaffmap,"Bullet Sprite",s_homingstaffbullet); //Self Explanatory.
ds_map_add(global.homingstaffmap,"Bullet Trail",false); //If there is a trail or not (false means no trail)
ds_map_add(global.homingstaffmap,"Bullet Speed",5); //Speed of the Bullets
ds_map_add(global.homingstaffmap,"Bullet Bounce",0) //How many times the bullet can bounce (0 means never)
ds_map_add(global.homingstaffmap,"Bullet Split", 0) //How many times the bullet can split up into more bullets (0 means never)
ds_map_add(global.homingstaffmap,"Bullet Split Amount", 0) //How many bullets the bullet splits up into (Use 0 Bullet Split is 0)
ds_map_add(global.homingstaffmap,"Bullet Split Angle", 0) //How wide of an angle to split into
ds_map_add(global.homingstaffmap,"Bullet Collision",true) //True means it destroys upon hitting collision, false means it doesn't
ds_map_add(global.homingstaffmap,"Bullet Homing", .2) //How much bullets home in on their target
ds_map_add(global.homingstaffmap,"Bullet Spread",0) //How much the bullets spread out
ds_map_add(global.homingstaffmap,"Bullet Count",1) //How many bullets are fired per shot
ds_map_add(global.homingstaffmap,"Hot Damage Time",0) //How long target takes hot damage for (60 per tick of damage)
ds_map_add(global.homingstaffmap,"Cold Damage Time",0) //How long target is slowed for (60 per second of cold)
ds_map_add(global.homingstaffmap,"Vertical Offset",20) //Vertical offset for the bullet spawns
ds_map_add(global.homingstaffmap,"Horizontal Offset",-5) //How far out bullets are spawned from the weapon's center point
ds_map_add(global.homingstaffmap,"Screenshake Intensity",4); //How intense screenshake is when a bullet is shot. (0 means no screenshake)
ds_map_add(global.homingstaffmap,"Screenshake Duration",0.1); //How long screenshake lasts (in seconds, invalid if screenshake intensity is 0)
#endregion

#region Golfball Map (used with Golf Club melee weapon)
global.golfballmap = ds_map_create();

ds_map_add(global.golfballmap,"Name","Golf Club"); //Name of the Gun
ds_map_add(global.golfballmap,"Type","Ranged"); //Weapon Type
ds_map_add(global.golfballmap,"Sprite",s_golfclub); //Sprite of the Gun
ds_map_add(global.golfballmap,"Damage",8); //Damage of the Gun
ds_map_add(global.golfballmap,"Fire Rate",0.2); //Measured in Seconds, time between shots
ds_map_add(global.golfballmap,"Ammo Use",0) //Amount of Ammo the gun uses.
ds_map_add(global.golfballmap,"Range", false); //How far the bullet can go (false means infinite)
ds_map_add(global.golfballmap,"Bullet Sprite",s_golfball); //Self Explanatory.
ds_map_add(global.golfballmap,"Bullet Trail",false); //If there is a trail or not (false means no trail)
ds_map_add(global.golfballmap,"Bullet Speed",12); //Speed of the Bullets
ds_map_add(global.golfballmap,"Bullet Bounce",2) //How many times the bullet can bounce (0 means never)
ds_map_add(global.golfballmap,"Bullet Split", 0) //How many times the bullet can split up into more bullets (0 means never)
ds_map_add(global.golfballmap,"Bullet Split Amount", 0) //How many bullets the bullet splits up into (Use 0 Bullet Split is 0)
ds_map_add(global.golfballmap,"Bullet Split Angle", 0) //How wide of an angle to split into
ds_map_add(global.golfballmap,"Bullet Collision",true) //True means it destroys upon hitting collision, false means it doesn't
ds_map_add(global.golfballmap,"Bullet Homing", 0.0) //How much bullets home in on their target
ds_map_add(global.golfballmap,"Bullet Spread",0) //How much the bullets spread out
ds_map_add(global.golfballmap,"Bullet Count",1) //How many bullets are fired per shot
ds_map_add(global.golfballmap,"Hot Damage Time",0) //How long target takes hot damage for (60 per tick of damage)
ds_map_add(global.golfballmap,"Cold Damage Time",0) //How long target is slowed for (60 per second of cold)
ds_map_add(global.golfballmap,"Vertical Offset",-24) //Vertical offset for the bullet spawns
ds_map_add(global.golfballmap,"Horizontal Offset",2) //How far out bullets are spawned from the weapon's center point
ds_map_add(global.golfballmap,"Screenshake Intensity",8); //How intense screenshake is when a bullet is shot. (0 means no screenshake)
ds_map_add(global.golfballmap,"Screenshake Duration",0.2); //How long screenshake lasts (in seconds, invalid if screenshake intensity is 0)
#endregion


///MELEE DATA MAPS\\\
#region Sword Map
global.swordmap = ds_map_create();

ds_map_add(global.swordmap,"Name","Sword"); //Name of the Melee
ds_map_add(global.swordmap,"Type","Melee"); //Weapon Type
ds_map_add(global.swordmap,"Sprite",s_sword); //Sprite of the Melee
ds_map_add(global.swordmap,"Damage",1); //Damage of the Melee
ds_map_add(global.swordmap,"Deflect",false); //If it can deflect bullets or not.
ds_map_add(global.swordmap,"Ranged",0); //Map for a ranged projectile to use (0 = no projectile)
ds_map_add(global.swordmap,"Slash Sprite",s_swordswing); //Sprite of the slash
ds_map_add(global.swordmap,"Slash Angle",10); //Sprite of the slash
ds_map_add(global.swordmap,"Slash Offset",24); //How far forward the slash is placed
ds_map_add(global.swordmap,"Wait Frames",30); //How many frames to wait before letting the player attack again
ds_map_add(global.swordmap,"Hot Damage Time",0) //How long target takes hot damage for (60 per tick of damage)
ds_map_add(global.swordmap,"Cold Damage Time",0) //How long target is slowed for (60 per second of cold)
ds_map_add(global.swordmap,"Knockback Distance",20) //How far the target is knocked back (in pixels)
#endregion

#region Golf Club Map
global.golfclubmap = ds_map_create();

ds_map_add(global.golfclubmap,"Name","Golf Club"); //Name of the Melee
ds_map_add(global.golfclubmap,"Type","Melee"); //Weapon Type
ds_map_add(global.golfclubmap,"Sprite",s_golfclub); //Sprite of the Melee
ds_map_add(global.golfclubmap,"Damage",8); //Damage of the Melee
ds_map_add(global.golfclubmap,"Deflect",false); //If it can deflect bullets or not.
ds_map_add(global.golfclubmap,"Ranged",global.golfballmap); //Map for a ranged projectile to use (0 = no projectile)
ds_map_add(global.golfclubmap,"Slash Sprite",s_golfhit); //Sprite of the slash
ds_map_add(global.golfclubmap,"Slash Angle",-10); //Sprite of the slash
ds_map_add(global.golfclubmap,"Slash Offset",0); //How far forward the slash is placed
ds_map_add(global.golfclubmap,"Wait Frames",60); //How many frames to wait before letting the player attack again
ds_map_add(global.golfclubmap,"Hot Damage Time",0) //How long target takes hot damage for (60 per tick of damage)
ds_map_add(global.golfclubmap,"Cold Damage Time",0) //How long target is slowed for (60 per second of cold)
ds_map_add(global.golfclubmap,"Knockback Distance",40) //How far the target is knocked back (in pixels)


#endregion

///PLAYER DATA MAPS\\\
#region Player Map
global.playermap =  ds_map_create();

ds_map_add(global.playermap,"Name","Jerry"); //Name of the Character
ds_map_add(global.playermap,"Sprite",s_player); //Sprite of the Character
ds_map_add(global.playermap,"HP",10); //Maximum HP
ds_map_add(global.playermap,"Speed",5); //Movement Speed
ds_map_add(global.playermap,"Ammo",100); //Player's Ammo Count
ds_map_add(global.playermap,"Ability",1); //Current Ability of the Player
ds_map_add(global.playermap,"Gun",global.homingstaffmap); //ds_map of the Equipped Gun
ds_map_add(global.playermap,"Melee",global.golfclubmap); //ds_map of the Equipped Melee
ds_map_add(global.playermap,"iframes",3); // I-frames
#endregion


///ENEMY DATA MAPS\\\
#region Bat Map
global.batmap = ds_map_create();
ds_map_add(global.batmap,"Cost",2); //Number of spawn currency it takes to spawn the enemy in the room.
ds_map_add(global.batmap,"Name","Bat"); //Name of the Enemy
ds_map_add(global.batmap,"Sprite",s_bat);
ds_map_add(global.batmap,"HP",10); //Enemy HP
ds_map_add(global.batmap,"Speed",2); //Movement Speed for Enemy
ds_map_add(global.batmap,"Damage",1); //How much damage an enemy does
ds_map_add(global.batmap,"Cost",10); //Enemy Placement Currency Cost
ds_map_add(global.batmap,"Spawn Area",1) // Area Enemy Spawns In
ds_map_add(global.batmap,"Attack Cooldown",10); //Time between Special Attacks or Fire Rate (0 means no cooldown)
ds_map_add(global.batmap,"Move Timer", 10); //Movement Timer
ds_map_add(global.batmap,"coldmg",true); //can colide with player
ds_map_add(global.batmap,"Currency",4); //How much Currency it drops.
#endregion
#region Ram Map
global.rammap = ds_map_create();
ds_map_add(global.rammap,"Cost",5); //Number of spawn currency it takes to spawn the enemy in the room.
ds_map_add(global.rammap,"Name","Ram"); //Name of the Enemy
ds_map_add(global.rammap,"Sprite",s_ram);
ds_map_add(global.rammap,"HP",12); //Enemy HP
ds_map_add(global.rammap,"Speed",5); //Movement Speed for Enemy
ds_map_add(global.rammap,"Damage",2); //How much damage an enemy does
ds_map_add(global.rammap,"Cost",10); //Enemy Placement Currency Cost
ds_map_add(global.rammap,"Spawn Area",1) // Area Enemy Spawns In
ds_map_add(global.rammap,"Attack Cooldown",5); //Time between Special Attacks or Fire Rate (0 means no cooldown)
ds_map_add(global.rammap,"Move Timer", 100); //Movement Timer
ds_map_add(global.rammap,"coldmg",true); //can colide with player
ds_map_add(global.rammap,"Currency",17); //How much Currency it drops.
#endregion

///ENEMY SPAWN POOL LIST\\\
#region Valley Spawn Pool
global.valleyspawnpool = ds_list_create();
ds_list_add(global.valleyspawnpool,global.rammap);
ds_list_add(global.valleyspawnpool,global.batmap);
#endregion

