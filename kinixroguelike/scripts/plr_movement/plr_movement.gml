//Set up local variables for keybinds
var key_left = keyboard_check(ord("A"));
var key_right = keyboard_check(ord("D"));
var key_up = keyboard_check(ord("W"));
var key_down = keyboard_check(ord("S"));

//Movement code
hspd = (key_right - key_left) * spd
vspd = (key_down - key_up) * spd

//Diagonal movement reduction code
if hspd != 0 && vspd != 0 {
	hspd *= 0.75;
	vspd *= 0.75;
}

///Horizontal Collision
if (place_meeting(x+hspd, y, o_CollisionParent)){
    while (!place_meeting(x+sign(hspd), y, o_CollisionParent)){ 
        x+=sign(hspd);
    }
    hspd=0;
}
x+=hspd;

//Vertical Collision
if (place_meeting(x, y+vspd, o_CollisionParent)){
    while (!place_meeting(x, y+sign(vspd), o_CollisionParent)){
        y+=sign(vspd);
    }
   vspd=0;
} 
y+=vspd;