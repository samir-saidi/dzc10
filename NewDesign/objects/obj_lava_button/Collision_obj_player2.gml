/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("I"))&&obj_player2.hsp==0){


		if(image_index ==0){image_index=1;
		//	obj_door.active=true;
	
			if(instance_exists(obj_door)){

				with(obj_door){
					if(activate == other.activate)
					{
						active = true	
					}
				}
			}
		}
	
}
