///@param output
function log(argument0) {
	show_debug_message(argument0);
}

///@param percent
function chance(argument0) {
	
	var percent = argument0;
	var roll = irandom_range(0,100);
	if roll >= percent {
		return false;
	} else {
		return true;	
	}

}

///@param x
///@param y
///@param text
///@param color[op]
///@param xscale[op]
///@param yscale[op]
function draw_fade_text() {
	
	if argument_count > 3 {
		var color = argument[3];
		var halign = argument[4];
		var valign = argument[5];
	} else {
		var color = c_white;
		var halign = fa_left;
		var valign = fa_top;
	}

	var fadetext = instance_create_layer(argument[0],argument[1],"Text",obj_fadetext);

	fadetext.text_to_draw = argument[2];
	fadetext.color = color;
	fadetext.halign = halign;
	fadetext.valign = valign;

}

///@param x
///@param y
///@param text
///@param xscale
///@param yscale
///@param angle
///@param color[op]
///@param halign[op]
///@param valign[op]
function draw_fade_text_transformed() {

	if argument_count > 6 {
		var color = argument[6];
		var halign = argument[7];
		var valign = argument[8];
	} else {
		var color = c_white;
		var halign = fa_left;
		var valign = fa_top;
	}

	var fadetext = instance_create_layer(argument[0],argument[1],"Text",obj_fadetext);

	fadetext.text_to_draw = argument[2];
	fadetext.xscale = argument[3];
	fadetext.yscale = argument[4];
	fadetext.angle = argument[5];
	fadetext.color = color;
	fadetext.halign = halign;
	fadetext.valign = valign;


}

function is_in_sector(argument0, argument1, argument2) {
	///@param object
	///@param room_size
	///@param door_buffer_amount
	//is_in_sector(object, room_size, door_buffer_amount);
	//checks if the object is within a sector accounting for a buffered amount

	var o = argument0; //object
	var s = argument1; //size of room
	var sh = s/2; //midpoint of room
	var db = argument2; //how much to buffer for

	if(abs(((o.x) mod s) - sh) < sh - db)&&(abs(((o.y) mod s) - sh) < sh - db){
		return(true)
	}
	else{
		return(false)
	}
}

///@param intensity
///@param duration
function shake_screen(argument0, argument1) {

	///Shake the screen for a set period of time. Intensity is the number of pixels outward and inward the screen can go, while the time is in seconds. See obj_Camera step event for more details.
	//Example: shake_screen(10,1); (Shakes the screen at 10 pixel intensity for 1 second)
	obj_Camera.shake = argument0;
	obj_Camera.shakedur = argument1;

	with obj_Camera {
		timer_set("screenshake",argument1);
	}
}

function key_to_string(argument0) {
	/*//
	How to use:
	Simply call this script in a draw_text function.
	argument0 should be a keyboard key such as vk_enter or ord('Z').
	//*/
 
	if( argument0 > 48 && argument0 < 91 )
	{ return chr(argument0); }
	switch( argument0 )
	{
	    case -1: return string("No Key");
		case 0: return string("No Key");
		case 1: return string("Left Mouse Button");
		case 2: return string("Right Mouse Button");
		case 3: return string("Middle Mouse Button");
	    case 8: return string("Backspace");
	    case 9: return string("Tab");
	    case 13: return string("Enter");
	    case 16: return string("Shift");
	    case 17: return string("Ctrl");
	    case 18: return string("Alt");
	    case 19: return string("Pause/Break");
	    case 20: return string("CAPS");
	    case 27: return string("Escape");
		case 32: return string("Spacebar");
	    case 33: return string("Page Up");
	    case 34: return string("Page Down");
	    case 35: return string("End");
	    case 36: return string("Home");
	    case 37: return string("Left Arrow");
	    case 38: return string("Up Arrow");
	    case 39: return string("Right Arrow");
	    case 40: return string("Down Arrow");
	    case 45: return string("Insert");
	    case 46: return string("Delete");
		case 65: return string("A");
		case 66: return string("B");
		case 67: return string("C");
		case 68: return string("D");
		case 69: return string("E");
		case 70: return string("F");
		case 71: return string("G");
		case 72: return string("H");
		case 73: return string("I");
		case 74: return string("J");
		case 75: return string("K");
		case 76: return string("L");
		case 77: return string("M");
		case 78: return string("N");
		case 79: return string("O");
		case 80: return string("P");
		case 81: return string("Q");
		case 82: return string("R");
		case 83: return string("S");
		case 84: return string("T");
		case 85: return string("U");
		case 86: return string("V");
		case 87: return string("W");
		case 88: return string("X");
		case 89: return string("Y");
		case 90: return string("Z");
	    case 96: return string("Numpad 0");
	    case 97: return string("Numpad 1");
	    case 98: return string("Numpad 2");
	    case 99: return string("Numpad 3");
	    case 100: return string("Numpad 4");
	    case 101: return string("Numpad 5");
	    case 102: return string("Numpad 6");
	    case 103: return string("Numpad 7");
	    case 104: return string("Numpad 8");
	    case 105: return string("Numpad 9");
	    case 106: return string("Numpad *");
	    case 107: return string("Numpad +");
	    case 109: return string("Numpad -");
	    case 110: return string("Numpad .");
	    case 111: return string("Numpad /");
	    case 112: return string("F1");
	    case 113: return string("F2");
	    case 114: return string("F3");
	    case 115: return string("F4");
	    case 116: return string("F5");
	    case 117: return string("F6");
	    case 118: return string("F7");
	    case 119: return string("F8");
	    case 120: return string("F9");
	    case 121: return string("F10");
	    case 122: return string("F11");
	    case 123: return string("F12");
	    case 144: return string("Num Lock");
	    case 145: return string("Scroll Lock");
	    case 186: return string(");");
	    case 187: return string("=");
	    case 188: return string(",");
	    case 189: return string("-");
	    case 190: return string(".");
	    case 191: return string("/");
	    case 192: return string("`");
	    case 219: return string("/");
	    case 220: return string("[");
	    case 221: return string("]");
	    case 222: return string("'");
	}




}
	
function gp_to_string(argument0) {
	/*
	Note: Converts a GM gamepad constant into a string representing the button!
	*/

	switch (argument0){
	    // Constant         // Buttons Description      // Constant Number      // Type
	    case gp_face1:      return "gp_face1";          // [32769]              // Button
	    case gp_face2:      return "gp_face2";          // [32770]              // Button
	    case gp_face3:      return "gp_face3";          // [32771]              // Button
	    case gp_face4:      return "gp_face4";          // [32772]              // Button
	    case gp_shoulderl:  return "gp_shoulderl";      // [32773]              // Button
	    case gp_shoulderr:  return "gp_shoulderr";      // [32774]              // Button
	    case gp_shoulderlb: return "gp_shoulderlb";     // [32775]              // Button
	    case gp_shoulderrb: return "gp_shoulderrb";     // [32776]              // Button
	    case gp_select:     return "gp_select";         // [32777]              // Button
	    case gp_start:      return "gp_start";          // [32778]              // Button
	    case gp_stickl:     return "gp_stickl";         // [32779]              // Button
	    case gp_stickr:     return "gp_stickr";         // [32780]              // Button
	    case gp_padu:       return "gp_padu";           // [32781]              // Button
	    case gp_padd:       return "gp_padd";           // [32782]              // Button
	    case gp_padl:       return "gp_padl";           // [32783]              // Button
	    case gp_padr:       return "gp_padr";           // [32784]              // Button
	    case gp_axislh:     return "gp_axislh";         // [32785]              // Analog
	    case gp_axislv:     return "gp_axislv";         // [32786]              // Analog
	    case gp_axisrh:     return "gp_axisrh";         // [32787]              // Analog
	    case gp_axisrv:     return "gp_axisrv";         // [32788]              // Analog
	    default: return "unrecognized"                          // Failsafe - EDIT: EGGCEPTION @ hypnozizziz
	}
}
	
function gamepad_key(argument0) {

	/* 
	Note:   - emulates keyboard_key behaviour.
	        - returns 0 if no input deteced
	        - susceptible to future gp_constant order changes
	        - ideally set up an axis deadzone to avoid unwanted return values
	*/

	if gamepad_is_supported() && gamepad_is_connected(argument0) {
	    for (var i=gp_face1;i<=gp_padr;i++) { //see gp_strings - loop all buttons
	        if gamepad_button_check(argument0,i) return i}
	    for (var i=gp_axislh;i<=gp_axisrv;i++) {    // loop analogue axis
	        if gamepad_axis_value(argument0,i)!=0 return i}
	}
	return 0;
}
	
function gp_any() {
	for ( var i = gp_face1; i < gp_axisrv; i++ ) {
	    if ( gamepad_button_check( 0, i ) ) return i;
	}
	return false;
}