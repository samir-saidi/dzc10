/// @description count, name and set variable of lvldoors
// You can write your code in this editor

//count lvldoors and create arrays for lvl unlock and collected stars
lvl_amount = instance_number(Obj_lvl_door);
global.lvl_unlock = array_create(lvl_amount, false);
global.lvl_unlock[0] = true; 

global.lvl_stars = array_create(lvl_amount, 0);

//for testing (some starter values are given, should be commented for final)
//test_stars = [1,1,2,3];
//for(i=1; i<=array_length(test_stars); i++) {
//	global.lvl_stars[i-1] = test_stars[i-1];
//}

//every lvl_door gets an lvl_number assigned and if available a room
for(i=0; i<lvl_amount; i++){
    with (instance_find(Obj_lvl_door, i)){
        lvl_number = other.i + 1;
		
		//check if there is a room with the same lvl_number
		room_name = "Rm_lvl_" + string(lvl_number);
		if (room_exists(asset_get_index(room_name))){
			rm_goto = asset_get_index(room_name);
		} else {
			rm_goto = Rm_lvlselect_error
		}
		
    }
}

