/// @description 
if(pause)
{
	view_midw = surface_get_width(application_surface)/2;
	view_midh  = surface_get_height(application_surface)/2;
	draw_set_color(c_black);
	draw_set_alpha(0.60);
	draw_rectangle(view_xport[0], view_yport[0], view_wport[0], view_hport[0], 0);
	draw_set_halign(fa_center);
	draw_set_font(fnt_GUI);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(view_midw, view_midh, "Paused");
}