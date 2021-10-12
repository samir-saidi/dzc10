/// @description
var target_x = end_x, target_y = end_y;
if(going_to_start)
{
	target_x=start_x;
	target_y=start_y;
}

move_x = sign(target_x-x)*cur_spd;
move_y = sign(target_y-y)*cur_spd;