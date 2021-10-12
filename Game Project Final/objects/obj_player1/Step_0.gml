key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));

move = key_right - key_left;
hsp = move * movespeed + hsp_carry;
hsp_carry=0
if(move!=0) image_xscale = move;
if(vsp < 10) vsp += grav;			//gravity

if(place_meeting(x,y+1, obj_wall)||place_meeting(x,y+1, obj_moving_platform1)){
	vsp = key_up * - jumpspeed;		//jumping mechanic	
}


//moving platform collision;
var _movingPlatform = instance_place(x,y+max(1, vsp), obj_moving_platform1);
if(_movingPlatform && bbox_bottom<=_movingPlatform.bbox_top)
{
	if(vsp>0)
	{
		while(!place_meeting(x, y + sign(vsp), obj_moving_platform1))
		{
			y+=sign(vsp);	
		}
		vsp=0;
	}
	x+=_movingPlatform.move_x;
	y+=_movingPlatform.move_y;
}

scr_move(hsp,vsp);
