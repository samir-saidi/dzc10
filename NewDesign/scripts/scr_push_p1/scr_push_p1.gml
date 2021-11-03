function scr_push_p1(){
	//horizontal push
	
	if (keyboard_check(ord("E")))
	{
		if(place_meeting(x+hsp/2, y, obj_pushable_block))
		{
			var block = instance_place(x+hsp/2, y, obj_pushable_block);
			with (block)
			{
			
					scr_move(obj_player1.hsp/2, 0)
			
			}
			hsp /= 2;
		}
	}

}