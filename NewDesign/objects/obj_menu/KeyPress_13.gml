/// @description Insert description here
// You can write your code in this editor
switch (menu_index)
{
	case 0:
		global.lvl_unlock = [true,false,false,false,false, false, false, false, false, false, false, false, false, false];
		fname = "saveData.ini";
		if (file_exists(fname))
		{
			if (show_question("Are you sure you want to overwrite your previous save?"))
			{
				file_delete(fname);
				room_goto(room_next(room));
			}
		} else {
			room_goto(room_next(room));
		}
		break;
	case 1:
		fname = "saveData.ini";
		if (file_exists(fname)) {
			ini_open(fname);
			global.lvl_unlock = [true,false,false,false,false, false, false, false, false, false, false, false, false, false];
			for (var p = 0; p < 10; p++){
				global.lvl_unlock[p] = ini_read_string("global_variables", "lvl_unlock" + string(p), global.lvl_unlock[p]);
				}
			ini_close();
			if (global.lvl_unlock[1] == true)
			{
				room_goto(Rm_lvlselect);
			} else {
				room_goto(Intro_cutscene);
			}
		} else {
			show_message("No save file to load!");
		}
		
		break;
	case 2:
		game_end();
		break;
}