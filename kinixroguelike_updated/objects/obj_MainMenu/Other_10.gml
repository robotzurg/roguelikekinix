/// @description Create UI
var _width = 200;
var _height = 50;

create_button(40, 40, _width, _height, "Play", b_play);

create_button(40, 40 + _height + 40, _width, _height, "Settings", b_settings);

create_button(40, 40 + (_height + 40) * 2, _width, _height, "Exit", b_exit);