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

	var fadetext = instance_create_layer(argument[0],argument[1],"Text",o_fadetext);

	fadetext.text_to_draw = argument[2];
	fadetext.color = color;
	fadetext.halign = halign;
	fadetext.valign = valign;



}
