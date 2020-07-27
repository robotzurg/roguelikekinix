if (live_call()) return live_result;
//Get current camera position
var camX = camera_get_view_x(camera)
var camY = camera_get_view_y(camera)
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

//Set target camera position
if room_num != 11 && room_num != 13 {
	var targetX = sector_width - (960/2)
	var targetY = sector_height - (540/2)
} else {
	var targetX = o_player.x - camW/2;
	var targetY = o_player.y - camH/2;
	if room_num == 11 or room_num == 13 {
		targetX = clamp(targetX, sector_width,  sector_width - (960/2));
		targetY = clamp(targetY, sector_height - (540/2), sector_height + (538/2));
	} else if room_num == 17 or room_num == 19 {
		targetX = clamp(targetX, sector_width - (960/2),  sector_width + (960/2));
		targetY = clamp(targetY, sector_height, sector_height - (540/2));
	}
}

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
	var addW = camW * 0
	var addH = camH * 0;
	
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