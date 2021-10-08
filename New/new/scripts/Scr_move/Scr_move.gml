// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_move(hspd, vspd){

// Horizontal collision
if (place_meeting(x+hspd, y, obj_solid) || place_meeting(x+hspd, y, obj_button))
    {
    while (!place_meeting(x+sign(hspd), y, obj_solid) || !place_meeting(x+sign(hspd), y, obj_button))
         {
         x += sign(hspd);
         }
    hspd = 0;
    }
//move horizontally
x += hspd;


// vertical collision
if (place_meeting(x, y+vspd, obj_solid)) || (place_meeting(x, y+vspd, obj_button))
{
    while (!place_meeting(x, y+sign(vspd), obj_solid) || !place_meeting(x, y+sign(vspd), obj_button))
	{
		y += sign(vspd);
    }
	vspd = 0;
}
//move vertically
y += vspd;

}