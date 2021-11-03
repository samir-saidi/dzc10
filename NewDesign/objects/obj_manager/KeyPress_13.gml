/// @description Insert description here
// You can write your code in this editor
if (pause)
{
	switch (pause_index)
	{
		case 0:
			audio_stop_all();
			room_restart();
			break;
		case 1:
			audio_stop_all();
			room_goto(Rm_lvlselect);
			break;
		case 2:
			audio_stop_all();
			room_goto(Rm_menu);
			break;
		case 3:
			fname = "saveData.ini";
			if (!file_exists(fname))
			{
				ini_open(fname);
				for (var p = 0; p < 10; p++){
				ini_write_string("global_variables", "lvl_unlock" + string(p), global.lvl_unlock[p]);
				}
				ini_close();
				show_debug_message("Saved in original");
				room_goto(Rm_menu);
			} else
			{
				if (show_question("Overwrite previous save?")) {
					
				file_delete(fname);
				ini_open(fname);
				for (var p = 0; p < 10; p++){
				ini_write_string("global_variables", "lvl_unlock" + string(p), global.lvl_unlock[p]);
				}
				ini_close();
				show_debug_message("Overwrite original");
				room_goto(Rm_menu);
				} else {
					show_debug_message("No save file saved");
					return;
				}
			}
			break;
		case 4:
			game_end();
			break;
	}
}