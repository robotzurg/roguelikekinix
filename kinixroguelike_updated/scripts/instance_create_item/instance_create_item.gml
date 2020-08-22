///Creates an item (weapon/passive item).
///Example: instance_create_item(10,10,global.pistolmap); (THE STRUCT MUST BE INPUT FOR THIS TO WORK.)
///@param x
///@param y
///@param item_struct
///@param shop_price[op]
function instance_create_item() {

	var ix = argument[0];
	var iy = argument[1];
	var item_struct = argument[2];

	if argument_count > 3 {
		var shop_price = argument[3];
	}

	var item = instance_create_layer(ix,iy,"Instances",obj_weapon_pickup);
	with item {
		struct = item_struct;
		name = struct.name
		sprite_index = struct.sprite
		type = struct.type
		price = shop_price;
	} 



}
