/// @description Insert description here
// You can write your code in this editor
var i = 0;
repeat(buttons)
{
	draw_set_color(c_black);
	draw_set_font(Font45);
	//draw_text_color(menu_x, menu_y - 230, "TRIALS OF EDEN", c_red, c_blue, c_white, c_yellow, 1.0);
	draw_set_font(Font4);
	draw_set_halign(fa_center);
	
	draw_set_color(c_black);
	draw_rectangle(menu_x - 100, (menu_y + button_h * i), menu_x + 100, (menu_y + button_h * i) +46, false);
	if (menu_index == i)
		draw_set_color(c_yellow)
	else
		draw_set_color(c_white);
	
	draw_text(menu_x, menu_y + button_h  * i, button[i]);
	
	i++;
	
}