if(keyboard_check(ord("I"))&&obj_player2.hsp==0){


		if(instance_exists(obj_lava)){

				with(obj_lava){
					if(index == other.index)
					{
						instance_destroy();	
					}
				}
			}
	
}