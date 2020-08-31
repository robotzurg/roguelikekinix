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



if !file_exists("controls.ini"){ //Sets up default controls
	ini_open("controls.ini");
	
	//Default Controller Inputs
	ini_write_real("controls","ct_mov_horizontal",gp_axislh);
	ini_write_real("controls","ct_mov_vertical",gp_axislv);
	ini_write_real("controls","ct_look_horizontal",gp_axisrh);
	ini_write_real("controls","ct_look_vertical",gp_axisrv);
	ini_write_real("controls","ct_melee",gp_shoulderrb);
	ini_write_real("controls","ct_ranged",gp_shoulderlb);
	
	//Default Keyboard Inputs
	ini_write_real("controls","kb_up",ord("W"));
	ini_write_real("controls","kb_down",ord("S"));
	ini_write_real("controls","kb_left",ord("A"));
	ini_write_real("controls","kb_right",ord("D"));
	ini_write_real("controls","kb_melee",mb_right);
	ini_write_real("controls","kb_ranged",mb_left);
	
	ini_close();
}
//Reads the saved controls and attaches them to global variables
ini_open("controls.ini");
global.ct_MoveHorizontal = ini_read_real("controls","ct_mov_horizontal",0);
global.ct_MoveVertical = ini_read_real("controls","ct_mov_vertical",0);
global.ct_LookHorizontal =  ini_read_real("controls","ct_look_horizontal",0);
global.ct_LookVertical = ini_read_real("controls","ct_look_vertical",0);
global.ct_Melee = ini_read_real("controls","ct_melee",0);
global.ct_Ranged = ini_read_real("controls","ct_ranged",0);

global.kb_Up = ini_read_real("controls","kb_up",0);
global.kb_Down = ini_read_real("controls","kb_down",0);
global.kb_Left = ini_read_real("controls","kb_left",0);
global.kb_Right = ini_read_real("controls","kb_right",0);
global.kb_Melee = ini_read_real("controls","kb_melee",0);
global.kb_Ranged = ini_read_real("controls","kb_ranged",0);
ini_close();


