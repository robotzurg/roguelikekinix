///@param intensity
///@param duration

///Shake the screen for a set period of time. Intensity is the number of pixels outward and inward the screen can go, while the time is in seconds. See o_Camera step event for more details.
//Example: shake_screen(10,1); (Shakes the screen at 10 pixel intensity for 1 second)

o_Camera.shake = argument0;
o_Camera.shakedur = argument1;

with o_Camera {
	timer_set("screenshake",argument1);
}