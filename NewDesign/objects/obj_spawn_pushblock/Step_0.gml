
timeSinceLastSpawn += 1 / room_speed; // adds 1 to variable ever second

if (!place_meeting(x,y,obj_player1) && !place_meeting(x,y,obj_player2))
{
	if (timeSinceLastSpawn >= timeBetweenSpawns && !position_meeting(x,y,obj_pushable_block)) // if your timer is greater or equal to your timeBetweenSpawns
	{
		instance_create_layer(x,y,"Blocks", obj_pushable_block);
		timeSinceLastSpawn = 0; // reset this to 0 since something just spawned
	}
}