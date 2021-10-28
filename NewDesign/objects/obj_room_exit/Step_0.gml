/// @desc Cause a room transition

if(instance_exists(obj_player1)) && (position_meeting(obj_player1.x, obj_player1.y, obj_room_exit)&&instance_exists(obj_player2)) && (position_meeting(obj_player2.x, obj_player2.y, obj_room_exit))
{
		global.targetroom = _target_room;
		global.target_x = _target_x;
		global.target_y = _target_y;
		global.target_direction = obj_player1.direction;
		global.lvl_unlock[currentRoom] = true;
		room_goto(_target_room);
		instance_destroy();
}
/*
else if(instance_exists(obj_player2)) && (position_meeting(obj_player2.x, obj_player2.y, id))
{
		global.targetroom = _target_room;
		global.target_x = _target_x;
		global.target_y = _target_y;
		global.target_direction = obj_player2.direction;
		room_goto(_target_room);
		instance_destroy();
}*/