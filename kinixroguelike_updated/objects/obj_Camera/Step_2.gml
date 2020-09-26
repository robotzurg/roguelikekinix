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

if keyboard_check(vk_add) {
	zoom += 1;
}	

if keyboard_check(vk_subtract) {
	zoom -= 1;
}	

zoom = lerp(zoom,zoomto,CAM_SMOOTH_ZOOM*zoom_speed);

//Zoom Values
zoom = clamp(zoom,50,150);
camW = (zoom/100)*camW2
camH = (zoom/100)*camH2

//Apply camera position
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

global.d_mouse_x_previous = device_mouse_x_to_gui(0);
global.d_mouse_y_previous = device_mouse_y_to_gui(0);