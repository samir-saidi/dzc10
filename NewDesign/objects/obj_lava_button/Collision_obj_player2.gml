/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("i"))&&obj_player2.hsp==0){


		if(instance_exists(obj_lava)){

				with(obj_lava){
					if(index == other.index)
					{
						instance_destroy();	
					}
				}
			}
	
}
