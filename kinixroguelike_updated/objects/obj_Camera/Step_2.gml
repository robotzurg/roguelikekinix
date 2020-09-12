//Get current camera position
var camX = camera_get_view_x(camera)
var camY = camera_get_view_y(camera)

//Set target camera position
var targetX = obj_player.x - camW/2;
var targetY = obj_player.y - camH/2;

if instance_exists(obj_ParentEnemy) && zoom == 0 {
	targetX = clamp(targetX, sector_width,  sector_width - (960/2));
	targetY = clamp(targetY, sector_height - (960/2), sector_height - 120/2);
}

if shake == false {
	camX = lerp(camX, targetX, CAM_SMOOTH-0.05);
	camY = lerp(camY, targetY, CAM_SMOOTH-0.05);
} else {
	if timer("screenshake") == false {
		camX = lerp(camX, targetX, CAM_SMOOTH) + random_range(-shake,shake);
		camY = lerp(camY, targetY, CAM_SMOOTH) + random_range(-shake,shake);
	} else {
		shake = false;
	}
}

//Zoom
if (zoom_start == true ) {
	
	//Add to size
	var addW = camW * zoom;
	var addH = camH * zoom;
	
	camW += addW
	camH += addH


	//Position
	camX -= addW / 2;
	camY -= addH / 2;
} else {	
}

zoom = clamp(zoom,-1,1);

//Apply camera position
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

global.d_mouse_x_previous = device_mouse_x_to_gui(0);
global.d_mouse_y_previous = device_mouse_y_to_gui(0);