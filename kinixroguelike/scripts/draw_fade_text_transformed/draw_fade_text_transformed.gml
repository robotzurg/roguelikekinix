///@param x
///@param y
///@param text
///@param xscale
///@param yscale
///@param angle

if argument_count > 6 {
	var halign = argument[6];
	var valign = argument[7];
} else {
	var halign = fa_left;
	var valign = fa_top;
}

var fadetext = instance_create_layer(argument[0],argument[1],"Text",o_fadetext);

fadetext.text_to_draw = argument[2];
fadetext.xscale = argument[3];
fadetext.yscale = argument[4];
fadetext.angle = argument[5];
fadetext.halign = halign;
fadetext.valign = valign;