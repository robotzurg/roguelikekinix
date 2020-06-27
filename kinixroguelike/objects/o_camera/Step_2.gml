//Get current camera position
var camX = camera_get_view_x(camera)
var camY = camera_get_view_y(camera)
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

//Set target camera position
var targetX = sector_width - (960/2)
var targetY = sector_height - (540/2)

targetX = clamp(targetX, 0, room_width - camW);
targetY = clamp(targetY, 0, room_height - camH);

camX = lerp(camX, targetX, CAM_SMOOTH);
camY = lerp(camY, targetY, CAM_SMOOTH);

//Zoom
/*var wheel = mouse_wheel_down() - mouse_wheel_up();
if (wheel != 0) {
	wheel *= 0.2;
	
	//Add to size
	var addW = camW * wheel;
	var addH = camH * wheel;
	
	camW += addW
	camH += addH

	//Position
	camX -= addW / 2;
	camY -= addH / 2;
}*/

//Apply camera position
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

global.d_mouse_x_previous = device_mouse_x_to_gui(0);
global.d_mouse_y_previous = device_mouse_y_to_gui(0);