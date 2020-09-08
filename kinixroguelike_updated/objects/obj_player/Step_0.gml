//Set up local variables for keybinds
if gamepad_is_connected(0) { //If gamepad is connected, change keybinds to gamepad keybinds.
	gamepad_set_axis_deadzone(0, 0.5);       // Set the "deadzone" for the axis
    gamepad_set_button_threshold(0, 0.1);    // Set the "threshold" for the triggers
}
	if key_to_string(global.kb_Ranged) == "Left Mouse Button" or key_to_string(global.kb_Ranged) == "Right Mouse Button" {
		var mouse_ranged = (ranged.automatic) ? (gamepad_button_check(0,global.ct_Ranged)||mouse_check_button(global.kb_Ranged)) : (gamepad_button_check_pressed(0,global.ct_Ranged)||mouse_check_button_pressed(global.kb_Ranged));
	} else if key_to_string(global.kb_Ranged) != "Left Mouse Button" && key_to_string(global.kb_Ranged) != "Right Mouse Button" {
		var mouse_ranged = (ranged.automatic) ? (gamepad_button_check(0,global.ct_Ranged)||keyboard_check(global.kb_Ranged)) : (gamepad_button_check_pressed(0,global.ct_Ranged)||keyboard_check_pressed(global.kb_Ranged));
	}
	
	if key_to_string(global.kb_Melee) == "Left Mouse Button" or key_to_string(global.kb_Melee) == "Right Mouse Button" {
		var mouse_melee = (melee.autoswing) ? (gamepad_button_check(0,global.ct_Melee)||mouse_check_button(global.kb_Melee)) : (gamepad_button_check_pressed(0,global.ct_Melee)||mouse_check_button_pressed(global.kb_Melee));
	} else if key_to_string(global.kb_Melee) != "Left Mouse Button" && key_to_string(global.kb_Melee) != "Right Mouse Button" {
		var mouse_melee = (melee.autoswing) ? (gamepad_button_check(0,global.ct_Melee)||keyboard_check(global.kb_Melee)) : (gamepad_button_check_pressed(0,global.ct_Melee)||keyboard_check_pressed(global.kb_Melee));
	}

	var h_move = gamepad_axis_value(0, global.ct_MoveHorizontal);
	var v_move = gamepad_axis_value(0, global.ct_MoveVertical);
	var key_left = keyboard_check(global.kb_Left) || 0 < gamepad_axis_value(0, global.ct_MoveHorizontal);
	var key_right = keyboard_check(global.kb_Right) || 0 > gamepad_axis_value(0, global.ct_MoveHorizontal);;
	var key_up = keyboard_check(global.kb_Up) || 0 > gamepad_axis_value(0, global.ct_MoveVertical);
	var key_down = keyboard_check(global.kb_Down) || 0 < gamepad_axis_value(0, global.ct_MoveVertical);
	var key_ability = keyboard_check_pressed(global.kb_Ability) || gamepad_button_check_pressed(0,global.ct_Ability);
	var key_interact = keyboard_check_pressed(global.kb_Interact) || gamepad_button_check_pressed(0,global.ct_Interact);
	var key_cheat = keyboard_check_pressed(vk_f2);
	
	if(h_move = 0 && v_move = 0){
		h_move = (key_right - key_left);
		v_move = (key_down - key_up);
	}

//Cheats toggle
if key_cheat {
	cheats_enabled = !cheats_enabled; //Toggle between true and false
}

if (invin_frames_var != 0) invin_frames_var--;

//Switch direction we're facing based on mouse cursor
flipped = sign(mouse_x-x);
if(flipped = 0) flipped ++;

//Move onto next floor code
if (place_meeting(x,y,obj_staircase)) {
	if key_interact {
		generate_world(area_Valley2, 10, 15, true);
		room_goto(room_next(room));
	}
}

#region Cheats
	if cheats_enabled {
		if keyboard_check_pressed(ord("1")) {
			if global.RangedWeapon[ranged.ID+1] != 0 { //Apparently trying to reference something that is not a struct as a struct returns a 0. Huh.
				ranged = global.RangedWeapon[ranged.ID+1];	//Swap to the next weapon ID
			} else {
				ranged = global.RangedWeapon[rID.slingshot] //this is ID 0, overflow code	
			}
		}
	}
#endregion

#region State Machine
	//STATE MACHINE SWITCH
	if (key_right or key_left or key_up or key_down) && state != "hit" {
		state = "move";	
	} else if state != "hit" {
		state = "idle";	
	}
#endregion

#region Pickup Weapon
if instance_place(x,y,obj_weapon_pickup) && key_interact {
	var item = instance_place(x,y,obj_weapon_pickup);
	if (currency >= item.price && melee != item.struct && ranged != item.struct) {
		currency -= item.price
		if item.type == "Melee" {
			melee = item.struct	
			wepequipped = "Melee"
		} else if item.type == "Ranged" {
			ranged = item.struct
			wepequipped = "Ranged";
		}
		draw_fade_text(x,y-50,"Bought!",c_lime,fa_middle,fa_top);
	} else {
		draw_fade_text(x,y-50,"Not enough money or already owned!",c_red,fa_middle,fa_top);
		shake_screen(3,0.15);
	}
}
#endregion

#region Move State (keyboard)

if state == "move" {
	
	if cheats_enabled { spd = struct.spd*2  } else if !instance_exists(obj_ParentEnemy) { spd = struct.spd*1.25  } else { spd = struct.spd; }
	
	//Movement code
	hspd = (h_move) * spd
	vspd = (v_move) * spd

	//Diagonal movement reduction code
	if hspd != 0 && vspd != 0 {
		hspd *= 0.75;
		vspd *= 0.75;
	}
}

if state == "idle" {
	hspd = 0;
	vspd = 0;
}


if !cheats_enabled {
	///Horizontal Collision
	if (place_meeting(x+hspd, y, obj_CollisionParent)){
	    while (!place_meeting(x+sign(hspd), y, obj_CollisionParent)){ 
	        x+=sign(hspd);
	    }
	    hspd=0;
	}
}
x+=hspd;

//Vertical Collision
if !cheats_enabled {
	if (place_meeting(x, y+vspd, obj_CollisionParent)){
	    while (!place_meeting(x, y+sign(vspd), obj_CollisionParent)){
	        y+=sign(vspd);
	    }
	   vspd=0;
	}
}
y+=vspd;

#endregion

#region Ranged

if timer("reload") == true {
	ranged_frame = 0;
	if mouse_ranged && ammo != 0 {
		wepequipped = "Ranged";
		var mousedir = point_direction(x,y,mouse_x,mouse_y)*-flipped;
		var offx = x - (arm_length * flipped) + lengthdir_x(20 + ranged.h_offset,mousedir) - lengthdir_y(ranged.v_offset,mousedir);
		var offy = y + (lengthdir_y(20 + ranged.h_offset,mousedir) + lengthdir_x(ranged.v_offset,mousedir))*-flipped;
		for(var i = ranged.bullet_count; i > 0; i--){
			var bullet = instance_create_layer(offx,offy,layer,obj_bullet);
		}
		timer_set("reload",ranged.fire_rate);
		shake_screen(ranged.ss_intensity,ranged.ss_duration);
		ammo -= ranged.ammo_use
	}
}

if timer("reload") == false {
	if timer("animation reload",((ranged.fire_rate/sprite_get_number(ranged.sprite)/2))) == true {
		if ranged_frame != sprite_get_number(ranged.sprite)-1 {
			ranged_frame += 1
		} 
	timer_set("animation reload", ((ranged.fire_rate/sprite_get_number(ranged.sprite)/2)));
	}	
}
#endregion

#region Melee
if mouse_melee && melee_swing == false && melee_wait <= 0{
	wepequipped = "Melee";
	var dir_x = lengthdir_x(melee.slash_offset,  point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))
	var dir_y = lengthdir_y(melee.slash_offset,  point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y))
	with instance_create_layer(obj_player.x + dir_x, obj_player.y + dir_y, layer,obj_swordswing) {
		sprite_index = obj_player.melee.slash_sprite;
		
		direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
		image_angle = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
		image_yscale = obj_player.flipped;
}
	
if(melee.ranged_atk != 0){
	var mprojstruct = obj_player.melee.ranged_atk;
	for(var i = mprojstruct.bullet_count; i > 0; i--){
		var bullet = instance_create_layer(x + (16 * sign(flipped)),y,layer,obj_bullet);
		with bullet {
			x = obj_player.x + lengthdir_x(obj_player.arm_length + mprojstruct.h_offset,point_direction(x,y,mouse_x,mouse_y)) + (lengthdir_y(mprojstruct.v_offset,point_direction(x,y,mouse_x,mouse_y) * sign(obj_player.flipped)));
			y = obj_player.y + lengthdir_y(obj_player.arm_length + mprojstruct.h_offset,point_direction(x,y,mouse_x,mouse_y)) + (lengthdir_x(mprojstruct.v_offset,point_direction(x,y,mouse_x,mouse_y)) * -sign(obj_player.flipped));
		}
	}
	shake_screen(mprojstruct.ss_intensity, mprojstruct.ss_duration);
}
	
	
	melee_swing = true;
	wepequipped = "Melee";
	melee_wait = melee.wait_frames;
	
}
if(melee_wait > 0){
	melee_wait --;
}

#endregion