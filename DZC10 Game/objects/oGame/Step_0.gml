/// Move the clouds
for(i=0;i<array_length_1d(clouds);i++){														// loop through the clouds
	layer_sprite_x(clouds[i], layer_sprite_get_x(clouds[i])+1);								// move them to the right
	if(layer_sprite_get_x(clouds[i]) > room_width){											// if they are off the end of the screen
		layer_sprite_x(clouds[i],-sprite_get_width(layer_sprite_get_sprite(clouds[i])));	// move them to the start of the screen
	}
}

// process on screen button presses
for(i=0;i<4;i++){																			// loop through available mouse devices
	if(device_mouse_check_button(i,mb_left)){												// check if the device is being pressed
		scrCheckPress(i);																	// process that device
	}
}

// reset all buttons when any have been let go
if((device_mouse_check_button_released(0,mb_left)) || (device_mouse_check_button_released(1,mb_left))  || (device_mouse_check_button_released(2,mb_left))  || (device_mouse_check_button_released(3,mb_left)) ){
	button_pressed = false;
	button_down_left = false;
	button_down_right = false;
	button_down_up = false;
	button_down_down = false;
}

if(button_pressed == true){																	// if any button has been pressed
	button_a += (0.6 - button_a) * 0.4;														// fade in the buttons
} else {
	button_a += (0 - button_a) * 0.1;														// fade out the buttons
}