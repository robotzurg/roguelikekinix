///RANGED DATA MAPS\\\
#region Pistol Map
global.pistolmap = ds_map_create();

ds_map_add(global.pistolmap,"Name","Pistol"); //Name of the Gun
ds_map_add(global.pistolmap,"Sprite",s_gun); //Sprite of the Gun
ds_map_add(global.pistolmap,"Damage",8); //Damage of the Gun
ds_map_add(global.pistolmap,"Fire Rate",0.2); //Measured in Seconds, time between shots
ds_map_add(global.pistolmap,"Ammo Use",1) //Amount of Ammo the gun uses.
ds_map_add(global.pistolmap,"Range", false); //How far the bullet can go (false means infinite)
ds_map_add(global.pistolmap,"Bullet Sprite",s_homingstaffbullet); //Self Explanatory.
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
ds_map_add(global.pistolmap,"Vertical Offset",6) //Vertical offset for the bullet spawns
ds_map_add(global.pistolmap,"Horizontal Offset",16) //How far out bullets are spawned from the weapon's center point
ds_map_add(global.pistolmap,"Screenshake Intensity",4); //How intense screenshake is when a bullet is shot. (0 means no screenshake)
ds_map_add(global.pistolmap,"Screenshake Duration",0.1); //How long screenshake lasts (in seconds, invalid if screenshake intensity is 0)
#endregion
#region Homing Staff Map
global.homingstaffmap = ds_map_create();

ds_map_add(global.homingstaffmap,"Name","Homing Staff"); //Name of the Gun
ds_map_add(global.homingstaffmap,"Sprite",s_homingWand); //Sprite of the Gun
ds_map_add(global.homingstaffmap,"Damage",1); //Damage of the Gun
ds_map_add(global.homingstaffmap,"Fire Rate",0.2); //Measured in Seconds, time between shots
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
ds_map_add(global.homingstaffmap,"Hot Damage Time",1200) //How long target takes hot damage for (60 per tick of damage)
ds_map_add(global.homingstaffmap,"Cold Damage Time",0) //How long target is slowed for (60 per second of cold)
ds_map_add(global.homingstaffmap,"Vertical Offset",20) //Vertical offset for the bullet spawns
ds_map_add(global.homingstaffmap,"Horizontal Offset",-5) //How far out bullets are spawned from the weapon's center point
ds_map_add(global.homingstaffmap,"Screenshake Intensity",4); //How intense screenshake is when a bullet is shot. (0 means no screenshake)
ds_map_add(global.homingstaffmap,"Screenshake Duration",0.1); //How long screenshake lasts (in seconds, invalid if screenshake intensity is 0)
#endregion

///MELEE DATA MAPS\\\
#region Sword Map
global.swordmap = ds_map_create();

ds_map_add(global.swordmap,"Name","Sword"); //Name of the Melee
ds_map_add(global.swordmap,"Sprite",s_sword); //Sprite of the Melee
ds_map_add(global.swordmap,"Damage",1); //Damage of the Melee
ds_map_add(global.swordmap,"Deflect",false); //If it can deflect bullets or not.
ds_map_add(global.swordmap,"Slash Sprite",s_swordswing); //Sprite of the slash
ds_map_add(global.swordmap,"Slash Offset",24); //How far forward the slash is placed
ds_map_add(global.swordmap,"Slash Speed",1); //How fast the attack is
ds_map_add(global.swordmap,"Cooldown Time",.05); //How long the cooldown animation takes (in seconds)
ds_map_add(global.swordmap,"Cooldown Angle",120); //How far back the reset swing is
ds_map_add(global.swordmap,"Hot Damage Time",0) //How long target takes hot damage for (60 per tick of damage)
ds_map_add(global.swordmap,"Cold Damage Time",0) //How long target is slowed for (60 per second of cold)
ds_map_add(global.swordmap,"Knockback Distance",20) //How far the target is knocked back (in pixels)

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
ds_map_add(global.playermap,"Melee",global.swordmap); //ds_map of the Equipped Melee
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
ds_map_add(global.batmap,"Cost",10); //Enemy Placement Currency Cost
ds_map_add(global.batmap,"Spawn Area",1) // Area Enemy Spawns In
ds_map_add(global.batmap,"Attack Cooldown",10); //Time between Special Attacks or Fire Rate (0 means no cooldown)
ds_map_add(global.batmap,"Move Timer", 10); //Movement Timer
ds_map_add(global.batmap,"coldmg",true); //can colide with player
#endregion
#region Ram Map
global.rammap = ds_map_create();
ds_map_add(global.rammap,"Cost",5); //Number of spawn currency it takes to spawn the enemy in the room.
ds_map_add(global.rammap,"Name","Ram"); //Name of the Enemy
ds_map_add(global.rammap,"Sprite",s_ram);
ds_map_add(global.rammap,"HP",20); //Enemy HP
ds_map_add(global.rammap,"Speed",5); //Movement Speed for Enemy
ds_map_add(global.rammap,"Cost",10); //Enemy Placement Currency Cost
ds_map_add(global.rammap,"Spawn Area",1) // Area Enemy Spawns In
ds_map_add(global.rammap,"Attack Cooldown",10); //Time between Special Attacks or Fire Rate (0 means no cooldown)
ds_map_add(global.rammap,"Move Timer", 150); //Movement Timer
ds_map_add(global.rammap,"coldmg",true); //can colide with player
#endregion

///ENEMY SPAWN POOL LIST\\\
#region Valley Spawn Pool
global.valleyspawnpool = ds_list_create();
ds_list_add(global.valleyspawnpool,global.rammap);
ds_list_add(global.valleyspawnpool,global.batmap);
#endregion

