vsp_box = vsp_box + grv_box;

//Vertical collision
	if(place_meeting(x,y+vsp_box,Obj_wall))
	{
		while(!place_meeting(x,y+sign(vsp_box),Obj_wall))
		{
			y = y+sign (vsp_box)
		}
		vsp_box = 0;	
	}
	
	y = y + vsp_box;