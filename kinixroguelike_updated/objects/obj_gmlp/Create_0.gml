/// @description GML+ MANAGER OBJECT
//  SELF-CREATING GML+ MANAGER OBJECT

/*
INITIALIZATION
*/

#region Disallow multiple instances of this object from existing
if (instance_number(object_index) > 1) {
	instance_destroy();
}
#endregion

#region Initialize runtime properties
gml_pragma("global", @"
	//Auto-create object at launch
	room_instance_add(room_first, 0, 0, obj_gmlp);
	
	//Initialize mouse properties
	global.mxstart = floor(dcos(180));
	global.mystart = floor(dcos(180));
	global.mxprevious = 0;
	global.myprevious = 0;
	global.mvisible	= true;
	
	//Initialize time properties
	global.time_loss = 0;
");

//Initialize mouse variables
#macro mouse_xstart		global.mxstart
#macro mouse_ystart		global.mystart
#macro mouse_xprevious	global.mxprevious
#macro mouse_yprevious	global.myprevious
#macro mouse_hspeed		(mouse_x - mouse_xprevious)
#macro mouse_vspeed		(mouse_y - mouse_yprevious)
#macro mouse_speed		point_distance(mouse_xprevious, mouse_yprevious, mouse_x, mouse_y)
#macro mouse_direction	point_direction(mouse_xprevious, mouse_yprevious, mouse_x, mouse_y)
#macro mouse_visible	global.mvisible

//Initialize time constants and variables
#macro frame_target		(game_get_speed(gamespeed_microseconds)*0.000001)
#macro frame_time		(delta_time*0.000001)
#macro frame_delta		(frame_time/frame_target)	
#endregion

#region Initialize object properties
persistent = true;
visible = true;

//Initialize tracking mouse state
cr_sys_previous = window_get_cursor();
cr_spr_previous = cursor_sprite;
#endregion