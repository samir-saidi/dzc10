/// @description 


if(active==true)
{
	if(start_y-sprite_height<y){y-=2;}	//door opens
}
else{
	if(y >start_y){y+=2;}	//door closes NOT WORKING
}
