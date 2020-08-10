///Creates an item (weapon/passive item).
///Example: instance_create_item(10,10,global.pistolmap); (THE MAP MUST BE INPUT FOR THIS TO WORK.)
///@param x
///@param y
///@param item_map

var ix = argument0;
var iy = argument1;
var item_map = argument2;

var item = instance_create_layer(ix,iy,"Instances",o_weapon_pickup);
with item {
	map = item_map;
	name = map[? "Name"];
	sprite_index = map[? "Sprite"];;
	type = map[? "Type"];
} 
