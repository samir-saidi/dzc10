/// @description 
camera_set_view_pos(view_camera[0], xpos, 180);
xpos = max(xpos-0.3, 0); //animation speed

if(!fadeout)
{
	a =max(a-0.01, 0.25);	
}
else if(fadeout)
{
	a = min(a + 0.025, 1);	
}

l += 0.25; //text speed

print = string_copy(str,1,l);

if((l > string_length(str)+50) && (next<array_length_1d(strings)-1))
{
	l = 0;
	next++;
	if(next==array_length_1d(strings)-1)
	{
		holdspace++;
	}
}

str = strings[next];

if(xpos<1) xpos = 640;
if(keyboard_check_direct(vk_space))
{
	holdspace++	
}
if(holdspace>80)
{
	fadeout = 1;
}
if(a==1) && (fadeout==1) 
{
	fname = "saveData.ini";
			if (!file_exists(fname))
			{
				ini_open(fname);
				for (var p = 0; p < 11; p++){
				ini_write_string("global_variables", "lvl_unlock" + string(p), global.lvl_unlock[p]);
				}
				ini_write_real("global_variables", "deathCount", global.deathCount);
				ini_close();
				show_debug_message("Saved in original");
				room_goto(Rm_menu);
			} else {
				if (show_question("Overwrite previous save?")) {
					
				file_delete(fname);
				ini_open(fname);
				for (var p = 0; p < 11; p++){
				ini_write_string("global_variables", "lvl_unlock" + string(p), global.lvl_unlock[p]);
				}
				ini_write_real("global_variables", "deathCount", global.deathCount);
				ini_close();
				show_debug_message("Overwrite original");
				room_goto(Rm_menu);
				} else {
					show_debug_message("No save file saved");
					return;
				}
			}
	room_goto(Rm_menu);
}