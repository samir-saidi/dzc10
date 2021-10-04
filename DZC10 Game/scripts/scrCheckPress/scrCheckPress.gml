/// scrCheckPress(device,x1,y1,x2,y2);
function scrCheckPress(argument0) {

	device = argument0;


	if(device_mouse_y_to_gui(device) == clamp(device_mouse_y_to_gui(device),button_y-button_r,button_y+button_r)){								// check to see if the mouse is within the y button area
		if(device_mouse_x_to_gui(device) == clamp(device_mouse_x_to_gui(device),button_x_left-button_r,button_x_left+button_r)){				// check if it is in the left button
			// left
			button_pressed = true;																												// highlight buttons
			button_down_left = true;																											// activate button
		}
		if(device_mouse_x_to_gui(device) == clamp(device_mouse_x_to_gui(device),button_x_right-button_r,button_x_right+button_r)){				// check if it is in the right button
			// right
			button_pressed = true;																												// highlight buttons
			button_down_right = true;																											// activate button
		}
		if(device_mouse_x_to_gui(device) == clamp(device_mouse_x_to_gui(device),button_x1,button_x2)){											// check if it is in the up/down y area
			// climb
			button_pressed = true;																												// highlight buttons
			if(device_mouse_y_to_gui(device) == clamp(device_mouse_y_to_gui(device),button_y1_up,button_y2_up)){								// check if it is in the up button
				// up
				button_down_up = true;																											// activate button
			}
			if(device_mouse_y_to_gui(device) == clamp(device_mouse_y_to_gui(device),button_y1_down,button_y2_down)){							// check if it is in the down button
				// down
				button_down_down = true;																										// activate button
			}
		
		}
	
	
		if(device_mouse_x_to_gui(device) == clamp(device_mouse_x_to_gui(device),button_x_jump-(button_r/2),button_x_jump+(button_r/2))){		// check if it is in the jump button
			button_pressed = true;																												// highlight buttons
			with(oPlayer){
				if( jump ) exit;																												// if we are already jumping dont do anything
				grav=grav_jump;																													// make the player jump
				jump=true;																														// flag that we are jumping
			}
		}
	}



}
