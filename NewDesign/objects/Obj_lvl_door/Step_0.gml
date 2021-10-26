/// @description Insert description here
// You can write your code in this editor
unlocked = global.lvl_unlock[lvl_number - 1];

coll_play_1 = place_meeting(x,y,obj_player1);	//check for collision with player 1
coll_play_2 = place_meeting(x,y,obj_player2);	//check for collision with player 1
key_e = keyboard_check_pressed(ord("E"));	//check if 'e' is pressed
key_i = keyboard_check_pressed(ord("I"));	//check if 'i' is pressed

if (unlocked){
	image_index = 1;
	if ((coll_play_1 && coll_play_2) && (key_e || key_i)) {
		room_goto(rm_goto);
	}
}else {
	image_index = 0;
}