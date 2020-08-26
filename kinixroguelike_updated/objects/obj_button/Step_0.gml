var _hover = get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left);

// Hover
hover = lerp(hover, _hover, 0.2); //Smoothly transitions from 0 to 1, for hover animations

if (_click && click_func >= 0) {
	click_func();
}