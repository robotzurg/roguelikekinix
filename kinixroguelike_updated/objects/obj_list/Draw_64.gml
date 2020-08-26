//Draw background
draw_set_color(c_ltgray);
	draw_roundrect(x, y, x + width, y + height, 0);
draw_set_color(-1);

var _size = ds_list_size(list);

for (var i=0; i<_size; i++) {
	draw_set_halign(fa_left);
	//Array Data
	var _arr = list[| i];
	var _name = _arr[PR.NAME];
	var _sel = _arr[PR.SELECTED];
	var _vals = _arr[PR.VALUES];
	
	//Position to draw
	var _x = x + padding;
	var _y = y + padding + itemH * i;
	
	// Color
	if (i != hoverID) draw_set_color(c_black) else draw_set_color(c_blue);
	
	//Draw name
	draw_text(_x, _y, _name);	
	
	//Draw value
	if (_sel > -1) {
		var _val = _vals[_sel];
		
		draw_set_halign(fa_right);
			draw_text(x + width - padding, _y, _val);
		draw_set_halign(fa_left);
	}
	
	//Reset color
	draw_set_color(c_white);
}