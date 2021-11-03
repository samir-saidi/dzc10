/// @description 

//Pause button = P
if(keyboard_check_pressed(vk_escape)){
	if(!pause){
		pause = true;
		instance_deactivate_all(true);	
	} else {
		pause = false;
		instance_activate_all();
	}
}

pause_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

pause_index += pause_move;

if (pause_index < 0)
{
	pause_index = buttonsPause -1;
}
if (pause_index > buttonsPause -1)
{
	pause_index = 0;
}
	
last_selected_pause = pause_index;


