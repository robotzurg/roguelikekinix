///This script is run at the beginning of the entire game. Put anything that needs to be initialized at the start in here, not in an object. Do NOT make this a function, and do not put **ANY** REFERENCE TO THE ALL_ITEM_DATA SCRIPT IN THIS SCRIPT.
///SERIOUSLY DON'T DO IT. PLEASE. THANK YOU. :)
 randomize(); //Randomize the game seed before ANYTHING else.

//Change cursor to ingame cursor.
cursor_sprite = spr_MouseCursor;
window_set_cursor(cr_none);

//ENUM INIT
enum eID { //Enemy ID enum.
	bat,
	ram,
	brick,
}

enum rID { //Ranged Weapon ID enum.
	pistol,
	dakka,
	homingwand,
	sniperwand,
	shotgunwand,
	icejavelin,
	magmasling,
	crossbow,
	cross_bow,
	golfball,
}

enum mID { //Melee Weapon ID enum.
	sword,
	golfclub
}

enum pID { //Passive Item ID enum.
	
}

enum phase { //An Enum for the current phase of WORLD GENERATION/CREATION. Not game phase.
	menu,
	generation,
	inst_collect,
	creation,
	play
}

enum coin { //An Enum for coin types.
	one,
	three,
	five,
	ten
}

enum area {
	valley,
	village,
	basement,
	limbo
}

//List UI Enums

//List Types
enum LIST_TYPE {
	GAME_OPTIONS,
}

//Option Properties
enum PR {
	NAME,
	SELECTED,
	VALUES
}

//GLOBAL VARIABLE INIT
global.gamephase = phase.menu; //Keeps track of the current game phase (including generation phases.)
global.worldgrid = -1; //Holds the Generated World Grid.
global.valleyareas = ds_list_create(); //Holds a list of all the valley room types to pick from.
global.valleytiles = array_create(3); //Holds a list of all the valley tiles during room data collection.
global.current_t = 0; //Keeps track of how long the game has been open.