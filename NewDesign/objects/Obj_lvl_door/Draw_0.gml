/// @description Insert description here
// You can write your code in this editor

//Draw itself 
draw_self();
//Draw the lvl_nember as specified in the variables
draw_text(x+19, y+30, string(lvl_number));

//Draw the amount of stars that have been achieved for that lvl
stars = "";
for (i = 0; i<global.lvl_stars[lvl_number-1]; i++) {
	stars += "x";
}
x_ofset = 19 - (global.lvl_stars[lvl_number-1] - 1) * 5;
draw_text(x+x_ofset, y-18, stars);