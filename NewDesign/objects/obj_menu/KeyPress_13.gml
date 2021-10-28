/// @description Insert description here
// You can write your code in this editor
switch(menu_index)
{
	case 0:
		room_goto(room_next(room));
		break;
	case 1:
		game_end();
		break;
}