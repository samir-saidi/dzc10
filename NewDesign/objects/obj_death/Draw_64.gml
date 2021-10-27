draw_sprite_ext(spr_pixel, 0, 0,0, 1280, 200, 0, c_black, 1);
draw_sprite_ext(spr_pixel, 0, 0,520, 1280, 200, 0, c_black, 1);

DrawSetText(c_white, fSign, fa_center, fa_top);
draw_text(640, 600, print);

DrawSetText(c_white, fSign_small, fa_center, fa_top);
draw_text(640, 60, "Hold space to try again");






if(holdspace>0)
{
		draw_set_alpha(Wave(0.2, 0.8, 1,0));
		DrawSetText(c_white, fSign_small, fa_center, fa_top);
		draw_text(640, 60, "Hold space to try again");
		draw_set_alpha(1);
}



















draw_sprite_ext(spr_pixel, 0, 0,0, 1280, 720, 0, c_black, a);