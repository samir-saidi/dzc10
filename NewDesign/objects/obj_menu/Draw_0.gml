/// @description Insert description here
// You can write your code in this editor
var i = 0;
repeat(buttons)
{
	draw_set_color(c_black);
	draw_set_font(Font45);
	draw_text(menu_x, menu_y - 230, "TRIALS OF EDEN");
	draw_set_font(Font4);
	draw_set_halign(fa_center);
	
	if (menu_index == i)
		draw_set_color(c_yellow);
	
	draw_text(menu_x, menu_y + button_h  * i, button[i]);
	i++;
	
}