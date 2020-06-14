//AAAAAAAAAAAAAAAAAA-

reloadbullet -= 1;

if keyboard_check(ord("W")) {
	vspd = -8;
}

if keyboard_check_pressed(ord("A")) {
	hspd = -8;
}

if keyboard_check(ord("S")) {
	vspd = 8;
}

if keyboard_check(ord("D")) {
	hspd = 8;
}

if mouse_check_button(mb_left){
	if reloadbullet == 0 {
	var bullet = instance_create_layer(x,y,layer,o_bullet);
	with bullet {
		direction = point_direction(x,y,mouse_x,mouse_y);
		speed = 10;
	}
	}
} 

if reloadbullet == 0 {
	reloadbullet = 10
}

///Horizontal
if (place_meeting(x+hspd, y, object_Wall)){
    while (!place_meeting(x+sign(hspd), y, object_Wall)){ 
        x+=sign(hspd);
    }
    hspd=0;
}
x+=hspd;

//Vertical
if (place_meeting(x, y+vspd, object_Wall)){
    while (!place_meeting(x, y+sign(vspd), object_Wall)){
        y+=sign(vspd);
    }
   vspd=0;
} 
y+=vspd;

