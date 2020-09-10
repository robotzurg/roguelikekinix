event_inherited();
if global.gamephase == phase.creation {
	instance_create_item(x-100,y+200,global.RangedWeapon[rID.homingwand], 1);
	instance_create_item(x,y+200,global.RangedWeapon[rID.sniperwand], 5);
	instance_create_item(x+100,y+200,global.MeleeWeapon[mID.golfclub], 10);
}