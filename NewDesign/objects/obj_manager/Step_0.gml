/// @description 

//Restart button = R
if(keyboard_check_pressed(ord("R"))){
room_restart();
}

//Pause button = P
if(keyboard_check_pressed(ord("P"))){
	if(!pause){
		pause = true;
		instance_deactivate_all(true);	
	} else {
		pause = false;
		instance_activate_all();
	}
}