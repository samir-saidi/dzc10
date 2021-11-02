/// @description Insert description here
// You can write your code in this editor
if (pause)
{
	switch (pause_index)
	{
		case 0:
			audio_stop_all();
			room_goto(Rm_menu);
			break;
		case 1:
			game_end();
			break;
	}
}