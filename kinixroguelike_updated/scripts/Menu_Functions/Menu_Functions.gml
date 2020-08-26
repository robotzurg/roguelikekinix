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
	if !instance_exists(obj_list) {
		create_list( x + width + 32, y, 300, 300, LIST_TYPE.GAME_OPTIONS);	
	} else {
		instance_destroy(obj_list);	
	}
}

function b_exit() {
	game_end();	
}