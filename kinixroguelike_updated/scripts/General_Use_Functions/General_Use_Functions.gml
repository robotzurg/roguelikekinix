///@param output
function print(argument0) {
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
