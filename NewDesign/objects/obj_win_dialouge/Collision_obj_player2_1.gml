/// @description 
if( !(readYetP2) && !instance_exists(obj_text))
{
	with(instance_create_layer(x,y-64, layer, obj_text))
	{
		text = other.text;
		length=string_length(text);
	}
	readYetP2 = true;
}else if ((readYetP2) && !instance_exists(obj_text) && keyboard_check_pressed(vk_rshift))
{
	with(instance_create_layer(x,y-64, layer, obj_text))
	{
		text = other.text;
		length=string_length(text);
	}
}