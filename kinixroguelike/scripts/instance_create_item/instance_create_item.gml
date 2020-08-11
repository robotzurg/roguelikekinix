///Creates an item (weapon/passive item).
///Example: instance_create_item(10,10,global.pistolmap); (THE MAP MUST BE INPUT FOR THIS TO WORK.)
///@param x
///@param y
///@param item_map
///@param shop_price[op]

var ix = argument[0];
var iy = argument[1];
var item_map = argument[2];

if argument_count > 3 {
	var shop_price = argument[3];
}

var item = instance_create_layer(ix,iy,"Instances",o_weapon_pickup);
with item {
	map = item_map;
	name = map[? "Name"];
	sprite_index = map[? "Sprite"];;
	type = map[? "Type"];
	price = shop_price;
} 
