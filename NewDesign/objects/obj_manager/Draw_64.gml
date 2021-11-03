/// @description 
if(pause)
{
	pause_x = surface_get_width(application_surface)/2;
	pause_y  = (surface_get_height(application_surface)/2) - 175;
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_sprite_ext(spr_pixel, 0, 0, 0,1366,768, 0, c_black, 1);
	
	var i = 0;
	repeat(buttonsPause)
	{
		draw_set_color(c_white);
		draw_set_font(Font45);
		draw_text_color(pause_x, pause_y - 80, "TRIALS OF EDEN", c_red, c_blue, c_white, c_yellow, 1.0);
		draw_set_font(Font4);
		draw_set_halign(fa_center);
	
		draw_set_color(c_red);
		draw_rectangle_color(pause_x - 100, (pause_y + button_h_pause* i), pause_x + 100, (pause_y + button_h_pause * i) +46,c_red, c_blue, c_white, c_yellow, false);
		if (pause_index == i)
			draw_set_color(c_white)
		else
			draw_set_color(c_black);
	
		draw_text(pause_x, pause_y  + button_h_pause  * i, button_pause[i]);
	
		i++;
	
	}
}