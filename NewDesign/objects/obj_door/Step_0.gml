/// @description 

/*
if(active==true)
{
	if(start_y-sprite_height<y){y-=2;}	//door opens
}
else{
	if(y >start_y){y+=2;}	//door closes NOT WORKING
}*/
if(active==true)
{
 open_door();
}	//door opens

else{
close_door();	//door closes NOT WORKING
}

if ( y != targetY ) {
  var _dir = targetY - y;
  
  y += sign( _dir );
}
