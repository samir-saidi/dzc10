if(keyboard_check(vk_rshift)&&obj_player2.hsp==0){

	if(image_index ==0){image_index=1;
		if(instance_exists(obj_lava)){

				with(obj_lava){
					if(index == other.index)
					{
						
						instance_destroy();	
					}
				}
			}
	}
}