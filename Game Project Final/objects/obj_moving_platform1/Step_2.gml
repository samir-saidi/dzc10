/// @description
// move
x += move_x;
y += move_y;

//check if its at start
if(going_to_start&&point_distance(x, y, start_x, start_y)<cur_spd)
{
	going_to_start=false;
	cur_spd=0;
	alarm[0] = wait_time;
}

//check if its at end
if(!going_to_start&&point_distance(x, y, end_x, end_y)<cur_spd)
{
	going_to_start=true;
	cur_spd=0;
	alarm[0] = wait_time;
}