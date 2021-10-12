if(instance_exists(obj_player1))
{
	if((round(obj_player1.y + (obj_player1.sprite_height/2) > y)) || (obj_player1.key_down)) mask_index=-1;
	else mask_index = spr_1way_platform;
}