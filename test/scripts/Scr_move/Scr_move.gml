// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_move(hsp, vsp){

//Horizontal collision
	if(place_meeting(x+hsp,y,Obj_wall))
	{
		while(!place_meeting(x+sign(hsp),y,Obj_wall))
		{
			x = x +sign (hsp)
		}
		hsp = 0;	
	}
	
	x = x + hsp;

//Vertical collision
	if(place_meeting(x,y+vsp,Obj_wall))
	{
		while(!place_meeting(x,y+sign(vsp),Obj_wall))
		{
			y = y+sign (vsp)
		}
		vsp = 0;	
	}
	else
	{
		
		vsp = vsp + grv;	
	}
	
	y = y + vsp ;

//animation (facing right and left)
	if(hsp!=0) image_xscale =  sign(hsp);
}