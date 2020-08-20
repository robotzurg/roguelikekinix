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

	var fadetext = instance_create_layer(argument[0],argument[1],"Text",o_fadetext);

	fadetext.text_to_draw = argument[2];
	fadetext.xscale = argument[3];
	fadetext.yscale = argument[4];
	fadetext.angle = argument[5];
	fadetext.color = color;
	fadetext.halign = halign;
	fadetext.valign = valign;


}
