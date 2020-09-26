#macro RES_W 960
#macro RES_H 540
#macro RES_SCALE 1

#macro CAM_SMOOTH 0.15
#macro CAM_SMOOTH_ZOOM CAM_SMOOTH*CAM_SMOOTH

view_enabled = true;
view_visible[0] = true;
zoom = 100;
zoomto = 100;
zoom_speed= 1;
sector_width = 4320;
sector_height = 4320;
room_num = 2*3*5*7;

//Screenshake variables
shakedur = 0;
shake = false;

// Create camera
camera = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, camera);

// Resize window & application surface
//window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);
display_set_gui_size(RES_W, RES_H);

//Center Window
/*var display_width = display_get_width();
var display_height = display_get_height();

var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);*/

//Set camera position
camW = camera_get_view_width(camera);
camH = camera_get_view_height(camera);
camW2 = camera_get_view_width(camera);
camH2 = camera_get_view_height(camera);

var targetX = sector_width - (960/2)
var targetY = sector_height - (540/2)


targetX = clamp(targetX, 0, room_width - camW);
targetY = clamp(targetY, 0, room_height - camH);

camera_set_view_pos(camera, targetX, targetY);

global.d_mouse_x_previous = device_mouse_x_to_gui(0)
global.d_mouse_y_previous = device_mouse_y_to_gui(0);
