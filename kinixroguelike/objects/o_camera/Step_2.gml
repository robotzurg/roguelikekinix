//Get current camera position
var camX = camera_get_view_x(camera)
var camY = camera_get_view_y(camera)
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

//Set target camera positionsssd
var targetX = camX + (o_player.x-camX)/2 - 960/4
var targetY = camY + (o_player.y-camY)/2 - 540/4

if shake == false {
	camX = lerp(camX, targetX, CAM_SMOOTH);
	camY = lerp(camY, targetY, CAM_SMOOTH);
} else {
	if timer("screenshake") == false {
		camX = lerp(camX, targetX, CAM_SMOOTH) + random_range(-shake,shake);
		camY = lerp(camY, targetY, CAM_SMOOTH) + random_range(-shake,shake);
	} else {
		shake = false;
	}
}

//Zoom
var wheel = mouse_wheel_down() - mouse_wheel_up();
if (wheel != 0) {
	wheel *= 0.2;
	
	//Add to size
	var addW = camW * wheel
	var addH = camH * wheel;
	
	camW += addW
	camH += addH

	//Position
	camX -= addW / 2;
	camY -= addH / 2;
}

//Apply camera position
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

global.d_mouse_x_previous = device_mouse_x_to_gui(0);
global.d_mouse_y_previous = device_mouse_y_to_gui(0);