///ENEMY DATA MAPS\\\
#region Enemy Map

#endregion

///GUN DATA MAPS\\\
#region Pistol Map
global.pistolmap = ds_map_create();

ds_map_add(global.pistolmap,"Name","Pistol"); //Name of the Gun
ds_map_add(global.pistolmap,"Sprite",s_gun); //Sprite of the Gun
ds_map_add(global.pistolmap,"Damage",1); //Damage of the Gun
ds_map_add(global.pistolmap,"Fire Rate",0.2); //Measured in Seconds, time between shots
ds_map_add(global.pistolmap,"Ammo Use",1) //Amount of Ammo the gun uses.
ds_map_add(global.pistolmap,"Range", false); //How far the bullet can go (false means infinite)
ds_map_add(global.pistolmap,"Bullet Sprites",s_bullet); //Self Explanatory.
ds_map_add(global.pistolmap,"Bullet Trail",false); //If there is a trail or not (false means no trail)
ds_map_add(global.pistolmap,"Bullet Speed",10); //Speed of the Bullets
ds_map_add(global.pistolmap,"Bullet Bounce",0) //How many times the bullet can bounce (0 means never)
ds_map_add(global.pistolmap,"Bullet Split", 0) //How many times the bullet can split up into more bullets (0 means never)
ds_map_add(global.pistolmap,"Bullet Split Amount", 0) //How many bullets the bullet splits up into (Use 0 Bullet Split is 0)
ds_map_add(global.pistolmap,"Bullet Collision",false) //True means it destroys upon hitting collision, false means it doesn't
#endregion

///MELEE DATA MAPS\\\
#region Sword Map
global.swordmap = ds_map_create();

ds_map_add(global.swordmap,"Name","Sword"); //Name of the Melee
ds_map_add(global.swordmap,"Sprite",s_sword); //Sprite of the Melee
ds_map_add(global.swordmap,"Damage",1); //Damage of the Melee
ds_map_add(global.swordmap,"Deflect",false); //If it can deflect bullets or not.
#endregion

///PLAYER DATA MAPS\\\
#region Player Map
global.playermap =  ds_map_create();

ds_map_add(global.playermap,"Name","Jerry"); //Name of the Character
ds_map_add(global.playermap,"Sprite",s_player); //Sprite of the Character
ds_map_add(global.playermap,"HP",10); //Maximum HP
ds_map_add(global.playermap,"Speed",8); //Movement Speed
ds_map_add(global.playermap,"Ammo",100); //Player's Ammo Count
ds_map_add(global.playermap,"Ability",1); //Current Ability of the Player
ds_map_add(global.playermap,"Gun",global.pistolmap); //ds_map of the Equipped Gun
ds_map_add(global.playermap,"Melee",global.swordmap); //ds_map of the Equipped Melee
#endregion


///ENEMY CRAP (NOT DONE)\\\
#region Enemy Map
global.enemymap = ds_map_create();
ds_map_add(global.enemymap,"enemymove",5); //enemy movement speed
ds_map_add(global.enemymap,"enemycost",10); //enemy placement currency cost
ds_map_add(global.enemymap,"zone",1) //zone enemy spawns in
ds_map_add(global.enemymap,"atkcooldown",5); //time between attacks
ds_map_add(global.enemymap,"enemyhp",10); //enemy hp
ds_map_add(global.enemymap,"movetimer", 0); //movement timer
#endregion