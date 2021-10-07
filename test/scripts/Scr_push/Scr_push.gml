function Scr_push(){
	
	//horizontal push
	if(place_meeting(x+hsp/2, y, Obj_block)){
		var block = instance_place(x+hsp/2, y, Obj_block);
		with(block) {
			Scr_move(Obj_player.hsp/2, 0);
		}
		hsp/=2;
	}
	
	
}