if (delay > 0)
{
	delay -= 1;
	
}
else
{
	image_index=1;
	if (room == Rm_lvl_11)
	{
		if (place_meeting(x,y,obj_pushable_block))
		{
			var currentBlock = instance_place(x,y,obj_pushable_block);
			instance_destroy(currentBlock);
		}
	}
	delay = 5*room_speed;
}
if (delay2 > 0)
{
	delay2 -= 1;
}
else
{
	image_index=0;
	delay2 = 1*room_speed;
}

	
	