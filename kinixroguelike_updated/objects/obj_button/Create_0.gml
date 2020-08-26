//Properties
width = 200;
height = 50;

text = "Click here";

// Vars
hover = 0;

// Click Function
click_func = -1;


///BUTTON FUNCTIONS\\\
function get_hover() {
		var _mouseX = device_mouse_x_to_gui(0); //mouse_x
		var _mouseY = device_mouse_y_to_gui(0); //mouse_y
		
		return point_in_rectangle(_mouseX,_mouseY, x, y, x + width, y + height);
}
	
