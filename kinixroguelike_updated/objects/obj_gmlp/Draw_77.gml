/// @description DO NOT RENAME
//  SELF-CREATING GML+ MANAGER OBJECT

/*
MOUSE CURSOR POSITION
*/

#region Get starting mouse coordinates
if (global.mxstart == -1) {
	if (mouse_x != mouse_xprevious) or (mouse_y != mouse_yprevious) {
		global.mxstart = mouse_x;
		global.mystart = mouse_y;
	}
}
#endregion

#region Update mouse coordinates for next Step
mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;
#endregion

#region Update mouse cursor state
event_perform(ev_other, ev_user0);
#endregion