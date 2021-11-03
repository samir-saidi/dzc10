/// @description Insert description here
// You can write your code in this editor
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_mute) && !global.muted)
{
	audio_master_gain(0);
	global.muted = true;
	image_index = 1;
} else if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, obj_mute) && global.muted)
{
	audio_master_gain(1);
	global.muted=false;
	image_index = 0;
}

if (global.muted)
{
	image_index = 1;
}