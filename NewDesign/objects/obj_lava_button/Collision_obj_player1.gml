
/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("E"))&&obj_player1.hsp==0){


		if(instance_exists(obj_lava)){

				with(obj_lava){
					if(index == other.index)
					{
						instance_destroy();	
					}
				}
			}
	
}