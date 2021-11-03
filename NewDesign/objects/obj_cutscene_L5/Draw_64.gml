draw_sprite_ext(spr_pixel, 0, 0,0, 1366, 200, 0, c_black, 1);
draw_sprite_ext(spr_pixel, 0, 0,568, 1366, 200, 0, c_black, 1);

DrawSetText(c_white, fSign, fa_center, fa_top);
draw_text(683, 600, print);
/*
DrawSetText(c_white, fSign_small, fa_center, fa_top);
draw_text(683, 60, "Hold space to skip");
*/





if(holdspace>0)
{
		draw_set_alpha(Wave(0.1, 0.7, 1,0));
		DrawSetText(c_white, fSign_small, fa_center, fa_top);
		draw_text(683, 60, "Hold space to skip");
		draw_set_alpha(1);
}



















draw_sprite_ext(spr_pixel, 0, 0,0, 1366, 768, 0, c_black, a);