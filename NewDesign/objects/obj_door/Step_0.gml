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
if (place_meeting(x,y+2, obj_player2))
{
	obj_player2.vsp *= -1;
}
if (place_meeting(x,y+2, obj_player1))
{
	obj_player1.vsp *= -1;
}
if (place_meeting(x,y-2,obj_player1))
{
	obj_player2.sprite_index = spr_p1_fall;
	global.lastRoom = room;
	room_goto(RoomDeath);
}
if (place_meeting(x,y-2,obj_player2))
{
	global.lastRoom = room;
	room_goto(RoomDeath);
}
