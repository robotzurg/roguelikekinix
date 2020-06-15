///@param x
///@param y
///@param text
///@param xscale
///@param yscale
///@param angle

var fadetext = instance_create_layer(argument0,argument1,"Text",o_fadetext);

fadetext.text_to_draw = argument2;
fadetext.xscale = argument3;
fadetext.yscale = argument4;
fadetext.angle = argument5;