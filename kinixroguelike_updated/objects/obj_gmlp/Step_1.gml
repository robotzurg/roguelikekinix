/// @description DO NOT MODIFY
//  SELF-CREATING GML+ MANAGER OBJECT

/*
STEP TRACKING
*/

#region Update step loss check to improve accuracy of game_get_step()
global.time_loss += max(0, delta_time - game_get_speed(gamespeed_microseconds));
#endregion