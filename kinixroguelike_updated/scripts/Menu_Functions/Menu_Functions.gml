function create_button(_x, _y, _width, _height, _text, _func) {
	///@param x
	///@param y
	///@param width
	///@param height
	///@param text
	///@param function

	//Create button
	var _button = instance_create_layer(_x, _y, "Instances", obj_button);
	
	//Set values
	with (_button) {
		width = _width;
		height = _height;
		text = _text;
		click_func = _func;
	}
	
	return _button;
}
	
function create_list(_x, _y, _width, _height, _type) {
	///@param x
	///@param y
	///@param width
	///@param height
	///@param LIST_TYPE
	
	var _list = instance_create_layer(_x, _y, "Instances", obj_list);
	
	with (_list) {
		width = _width;
		height = _height;
		type = _type;
		
		// Populate list
		///How Lists Work\\\
		//The first part of the list array is the Name of the first part of the list. E.G. "Players"
		//The second part of the list array is the default selected value. Putting -1 in this position will allow the option to act as a "Close" button. E.G. 0, which makes "1" the default value upon opening the list.
		//The third part of the list array is another array, which is each option that you can move through. E.G. [1, 2, 3, 4], making the options you can cycle through 1, 2, 3, or 4.
		switch (_type) {
			case LIST_TYPE.GAME_OPTIONS:
				ds_list_add(list, ["Menu unusable for now.", -1, []]);
				ds_list_add(list, ["Players", 0, [1, 2, 3, 4]]); 
				ds_list_add(list, ["Mode", 0, [1, 2]]);
				ds_list_add(list, ["Difficulty", 0, ["Easy", "Medium", "Hard"]]);
				ds_list_add(list, ["Close", -1, []]);
			break;
		}
	}
	
	return _list;
}

function b_play() {
	if keyboard_check(vk_shift) {
			room_goto(testroom);
	} else {
		generate_world(area_Valley,10,10,true);
		room_goto(rm_ValleyRoom1);
	}
}

function b_settings() {
	room_goto(rm_controlsetup);
}

function b_exit() {
	game_end();	
}

function b_controls() { //For control setup menu
	if global.input_check_obj == self or global.input_check_obj == -1  {
		text = "Press new keybind key!";
		if waiting_for_input == -1 or waiting_for_input == false { waiting_for_input = true; global.input_check_obj = id }
	} else exit;
}
	
function b_controls_back() { //For control setup menu
	//Reads the saved controls and attaches them to global variables
	ini_open("controls.ini");
		global.ct_MoveHorizontal = ini_read_real("controls","ct_mov_horizontal",0);
		global.ct_MoveVertical = ini_read_real("controls","ct_mov_vertical",0);
		global.ct_LookHorizontal =  ini_read_real("controls","ct_look_horizontal",0);
		global.ct_LookVertical = ini_read_real("controls","ct_look_vertical",0);
		global.ct_Melee = ini_read_real("controls","ct_melee",0);
		global.ct_Ranged = ini_read_real("controls","ct_ranged",0);
		global.ct_Ability = ini_read_real("controls","ct_ability",0);
		global.ct_Interact = ini_read_real("controls","ct_interact",0);

		global.kb_Up = ini_read_real("controls","kb_up",0);
		global.kb_Down = ini_read_real("controls","kb_down",0);
		global.kb_Left = ini_read_real("controls","kb_left",0);
		global.kb_Right = ini_read_real("controls","kb_right",0);
		global.kb_Melee = ini_read_real("controls","kb_melee",0);
		global.kb_Ranged = ini_read_real("controls","kb_ranged",0);
		global.kb_Ability = ini_read_real("controls","kb_ability",0);
		global.kb_Interact = ini_read_real("controls","kb_interact",0);
	ini_close();
	room_goto(rm_mainmenu);
}

function b_controls_reset() { //For control setup menu
	ini_open("controls.ini");
		//Default Controller Inputs
		ini_write_real("controls","ct_mov_horizontal",gp_axislh);
		ini_write_real("controls","ct_mov_vertical",gp_axislv);
		ini_write_real("controls","ct_look_horizontal",gp_axisrh);
		ini_write_real("controls","ct_look_vertical",gp_axisrv);
		ini_write_real("controls","ct_melee",gp_shoulderrb);
		ini_write_real("controls","ct_ranged",gp_shoulderlb);
		ini_write_real("controls","ct_ability",gp_shoulderr); 
		ini_write_real("controls","ct_interact",gp_face1); //A on xbox 360 controller
	
		//Default Keyboard Inputs
		ini_write_real("controls","kb_up",ord("W"));
		ini_write_real("controls","kb_down",ord("S"));
		ini_write_real("controls","kb_left",ord("A"));
		ini_write_real("controls","kb_right",ord("D"));
		ini_write_real("controls","kb_melee",mb_right);
		ini_write_real("controls","kb_ranged",mb_left);
		ini_write_real("controls","kb_ability",ord("Q"));
		ini_write_real("controls","kb_interact",ord("E"));
	ini_close();
}