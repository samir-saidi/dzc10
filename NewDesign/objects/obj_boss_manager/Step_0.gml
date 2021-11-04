/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(obj_moving_boss))
{
	instance_destroy(obj_trapspikes);
	instance_create_layer(x,y,"Doors", obj_exit_door);
	var roomExit = instance_create_layer(x+20,y+32, "Doors", obj_room_exit);
	roomExit.currentRoom = 10;
	roomExit._target_room = Rm_lvlselect;
	
}