/// @description Create UI
var _width = 200;
var _height = 50;
var mid = room_width/2-_width/2; //_width/2 is for the horizontal offset, as is -_height/2 below for height

create_button(mid, 200-_height/2, _width, _height, "Play", b_play);

create_button(mid, 200 - _height/2 + _height + 40, _width, _height, "Controls", b_settings);

create_button(mid, 200 - _height/2 + (_height + 40) * 2, _width, _height, "Exit", b_exit);