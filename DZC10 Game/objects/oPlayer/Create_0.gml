/// Init
dir = -1;					// direction the player is facing
spd = 5;					// speed the player will move at
g = 0.2;					// gravity that applies to the player
sprite_index = sIdle1;		// animation to play
anim_speed = 0.7;			// default speed of the animation
image_speed = anim_speed;	// animation speed
health = 3;					// heath of the player
can_climb = false;			// flag if the player can climb
climbing = false;			// flag if the player is climbing
xspeed = 6;					// horizontal speed of the player
yspeed = -6;				// vertical speed of the player	
fall = false;				// flag if the player is falling
grav=0;						// gravity that applies to the player
gravmax=12;					// terminal velocity when falling
gravdelta=1.2;				// difference in gravity
grav_jump = -18;			// jump gravity
jump=false;					// flag if the player is jumping

// camera that follows the player
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 960;
view_hport[0] = 540;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, oPlayer, -1, -1, 1000, 1000);
surface_resize(application_surface, 960, 540);
window_set_size(view_wport[0],view_hport[0]);

// set the deadzone for gamepad input
gamepad_set_axis_deadzone(0,0.2);