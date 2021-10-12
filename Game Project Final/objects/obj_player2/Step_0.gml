key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_left = keyboard_check(vk_left);
key_down = keyboard_check(vk_down);

move = key_right - key_left;
hsp = move * movespeed;
if(move!=0) image_xscale = move;
if(vsp < 10) vsp += grav;			//gravity

if(place_meeting(x,y+1, obj_wall)){
	vsp = key_up * - jumpspeed;		//jumping mechanic	
}

scr_move(hsp,vsp);
