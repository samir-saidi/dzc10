left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
right = keyboard_check(vk_right);

	var move = right - left;

	hsp = move * walkspeed;

	
		if(place_meeting(x,y+1,Obj_wall)) && (up) //jumping
	{
		vsp = -15;
	}
	
	vsp = vsp + grv
//push
Scr_push();

// move	
Scr_move(hsp, vsp);