
function scr_move(hsp,vsp){
//horizontal collision
if(place_meeting(x+hsp, y, obj_wall))
{
	while(!place_meeting(x+sign(hsp), y, obj_wall))
	{
		x+=sign(hsp);	
	}
	hsp = 0;	
}
else if(place_meeting(x+hsp, y, obj_door))
{
	while(!place_meeting(x+sign(hsp), y, obj_door))
	{
		x+=sign(hsp);	
	}
	hsp = 0;	
}

x+= hsp;


//vertical collision



if(place_meeting(x, y+vsp, obj_wall))
{
	while(!place_meeting(x, y+sign(vsp), obj_wall))
	{
		y= y + sign(vsp);
	}
	vsp = 0;
		
}
else if(place_meeting(x, y+vsp, obj_door))
{
	while(!place_meeting(x, y+sign(vsp), obj_door))
	{
		y= y + sign(vsp);	
	}
	vsp = 0;
}
	y+= vsp;
}