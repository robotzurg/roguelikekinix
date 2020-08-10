//Set up local variables for keybinds
var key_cheat = keyboard_check_pressed(vk_f2);
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

//Cheats toggle
if key_cheat {
	cheats_enabled = !cheats_enabled; //Toggle between true and false
}

if (invin_frames_var != 0) invin_frames_var--;


//STATE MACHINE SWITCH
if (key_right or key_left or key_up or key_down) && state != "hit" {
	state = "move";	
} else if state != "hit" {
	state = "idle";	
}

//Switch direction we're facing based on mouse cursor
flipped = sign(mouse_x-x);
if(flipped = 0) flipped ++;

//Move onto next floor code
if (place_meeting(x,y,o_staircase)) {
	if keyboard_check_pressed(ord("E")) {
		generate_world(area_Valley2, 10, 15, true);
		room_goto(room_next(room));
	}
}

//Pickup Weapon
if instance_place(x,y,o_weapon_pickup) && keyboard_check_pressed(ord("E")) {
	var item = instance_place(x,y,o_weapon_pickup);
	if item.type == "Melee" {
		meleemap = item.map;	
	} else if item.type == "Ranged" {
		rangedmap = item.map;
	}
}

#region Move State
if state == "move" {
	
	if cheats_enabled { spd = map[? "Speed"]*2  } else if !instance_exists(o_enemy) { spd = map[? "Speed"]*1.5  } else { spd = map[? "Speed"]; }
	
	//Movement code
	hspd = (key_right - key_left) * spd
	vspd = (key_down - key_up) * spd

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
	if (place_meeting(x+hspd, y, o_CollisionParent)){
	    while (!place_meeting(x+sign(hspd), y, o_CollisionParent)){ 
	        x+=sign(hspd);
	    }
	    hspd=0;
	}
}
x+=hspd;

//Vertical Collision
if !cheats_enabled {
	if (place_meeting(x, y+vspd, o_CollisionParent)){
	    while (!place_meeting(x, y+sign(vspd), o_CollisionParent)){
	        y+=sign(vspd);
	    }
	   vspd=0;
	} 
}
y+=vspd;

#endregion

#region Shooting with Gun

if timer("reload") == true {
	if mouse_check_button(mb_left) && ammo != 0 {
		wepequipped = "ranged";
		for(var i = rangedmap[? "Bullet Count"]; i > 0; i--){
			var bullet = instance_create_layer(x + (16 * sign(flipped)),y,layer,o_bullet);
			with bullet {
				x = o_player.x + lengthdir_x(o_player.arm_length + o_player.rangedmap[? "Horizontal Offset"],point_direction(x,y,mouse_x,mouse_y)) + (lengthdir_y(o_player.rangedmap[? "Vertical Offset"],point_direction(x,y,mouse_x,mouse_y) * sign(o_player.flipped)));
				y = o_player.y + lengthdir_y(o_player.arm_length + o_player.rangedmap[? "Horizontal Offset"],point_direction(x,y,mouse_x,mouse_y)) + (lengthdir_x(o_player.rangedmap[? "Vertical Offset"],point_direction(x,y,mouse_x,mouse_y)) * -sign(o_player.flipped));
			}
		}
		timer_set("reload",rangedmap[? "Fire Rate"]);
		shake_screen(rangedmap[? "Screenshake Intensity"], rangedmap[? "Screenshake Duration"]);
		ammo -= rangedmap[? "Ammo Use"];
	}
}

#endregion

#region Melee
if mouse_check_button(mb_right) && melee_swing == false {
	var dir_x = lengthdir_x(meleemap[? "Slash Offset"],  point_direction(o_player.x,o_player.y,mouse_x,mouse_y))
	var dir_y = lengthdir_y(meleemap[? "Slash Offset"],  point_direction(o_player.x,o_player.y,mouse_x,mouse_y))
	with instance_create_layer(o_player.x + dir_x, o_player.y + dir_y, layer,o_swordswing) {
		sprite_index = o_player.meleemap[? "Slash Sprite"];
		
		direction = point_direction(o_player.x,o_player.y,mouse_x,mouse_y);
		image_angle = point_direction(o_player.x,o_player.y,mouse_x,mouse_y);
	}
	melee_swing = true;
	wepequipped = "melee";
}

#endregion