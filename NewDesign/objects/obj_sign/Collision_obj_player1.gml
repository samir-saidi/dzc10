/// @description 
if((!readYetP1) && !instance_exists(obj_text))
{
	with(instance_create_layer(x,y-64, layer, obj_text))
	{
		text = other.text;
		length=string_length(text);
	}
	readYetP1 = true;
} else if ((readYetP1) && !instance_exists(obj_text) && keyboard_check_pressed(ord("E")))
{
	with(instance_create_layer(x,y-64, layer, obj_text))
	{
		text = other.text;
		length=string_length(text);
	}
}