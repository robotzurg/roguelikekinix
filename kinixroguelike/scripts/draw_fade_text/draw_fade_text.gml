///@param x
///@param y
///@param text
///@param xscale[op]
///@param yscale[op]

if argument_count > 3 {
	var halign = argument[3];
	var valign = argument[4];
} else {
	var halign = fa_left;
	var valign = fa_top;
}

var fadetext = instance_create_layer(argument[0],argument[1],"Text",o_fadetext);

fadetext.text_to_draw = argument[2];
fadetext.halign = halign;
fadetext.valign = valign;
